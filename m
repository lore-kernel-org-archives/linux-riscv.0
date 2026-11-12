Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4420D606A331
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 07:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KX8jFF0T;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gCeQCAUq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=q1oaSCK2K+2E1+/XuYnTbuTceZD50UatSVCc4BGIogk=; b=KX8jFF0Tnap4+i66Tmo4qslHNd
	cwkO1JdLQP2NC7te+QDjUeQElqmOOZ5SpFrZdcVsWaF1rT9gW4XxxZzFFFZIlgArUhF9ptR71wVQD
	EpXBYnlkAMtJVEvSX2dI5J0tx5l5h7MVBAPOIFpSWpETMN+AJ0UePXCD9tAB94YtRWd2j8lG9nTCU
	vWB1laLqTJJbTQieTG6O6uuRHrjss+A5oxAHtv9C0pkKawjDJjeRsH2dl206wKqM/TDAyttz7Ldq7
	hipcre2no80bgYY4Q4vLCxnChSCkDMnO4RBqDbsZaCeufPBOqDLMCnNNqjJlXlTH9Wsw2syJgZSKA
	KARHto5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPeF-00000008zFH-1J2P;
	Thu, 12 Nov 2026 07:55:07 +0000
Received: from out-96.mta0.migadu.com ([2001:41d0:1004:224b::60] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPds-00000008z71-1ioh
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 07:54:57 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+64NsR6ul3OZ/C2gNEoQRkSF05SWBVdC/PV5wsbpHBI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794470080; v=1; x=1795074880;
 b=gCeQCAUqrK9rD27CpGVLGtePt+9dgReeb/a0KsLnvGEV0B+bLM871z7QXVooQb7tijXQs4Ps
 gCMMlLIpnMeyp8Q0BfiH226MyZix3eFkaGEoB+W3KW8HiDr6jhXrxGoBnY6XRK6jEL1EIqZHUB9
 s7IZx3iFYq/rz8E8/i0b/bXQ=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 149ddc421f06301b;
	Thu, 12 Nov 2026 07:54:40 +0000
X-Mizu-Trace-ID: 149ddc421f06301b
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Subject: [PATCH v2 0/2] irqchip/riscv-imsic: Synchronize remote state with
 IRQ work
Date: Thu, 12 Nov 2026 07:54:31 +0000
Message-Id: <20261112-imsic-remote-sync-irqwork-v2-0-680f65b24ff6@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0K6dgytQsSV9zAsYBhkVFqdQoUQ7
 i7gBVy+5P33J+VJmLw6R5MSCuzZ2QXMLlLYFPZGwNXCysQm1To+ALeeEYRa1xH40SKwvD9OHpB
 hTZjiUccVqWX/Eqp52NrX/Me+L++E3RpcjYZ952TczoNevX9+ggYNpzLBLNE1pqa4PNn2w76io
 PJ5nr+1GDbq1AAAAA==
X-Change-ID: 20261103-imsic-remote-sync-irqwork-9cfec6c410de
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-rt-devel@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2978;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=+64NsR6ul3OZ/C2gNEoQRkSF05SWBVdC/PV5wsbpHBI=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlfC3Z2yDi8s/mQfCX9haPbr5++Z2Mavr0NWrxhD59t/
 arZqxz9OkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACZiFsrwz+ao57trPa8emWn/
 vM0c9+8pU11n8fI8R25ze8fr27+aazL80/p8rV5vrcns7/cvxq7yfNCl42EeYxm61HGyy/QLe+I
 s+AE=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_235444_799278_F5FE89F5 
X-CRM114-Status: GOOD (  13.46  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhpcyB3YXMgZm91bmQgd2hpbGUgYnJpbmdpbmcgdXAgdGhlIFNvQyB0aW1lciBvbiBTcGFjZW1p
VCBLMyBhcyBhIHRpY2sKYnJvYWRjYXN0IGRldmljZS4KCldpdGhvdXQgYSByZWFsIGJyb2FkY2Fz
dCBkZXZpY2UsIHRoZSB0aWNrIGNvZGUgZmFsbHMgYmFjayB0byB0aGUgaHJ0aW1lcgpiYXNlZCBi
cm9hZGNhc3QsIHdoaWNoIGtlZXBzIG9uZSBDUFUncyBsb2NhbCB0aW1lciBydW5uaW5nLiBPbmNl
IHRoZSBTb0MKdGltZXIgaXMgcmVnaXN0ZXJlZCBpdCByZXBsYWNlcyB0aGUgaHJ0aW1lciBicm9h
ZGNhc3QsIGFuZCBldmVyeSBDUFUgbWF5CnN0b3AgaXRzIGxvY2FsIHRpbWVyIGluIGlkbGUuCgpP
biBLMyB0aGUgU29DIHRpbWVyIGludGVycnVwdCBnb2VzIHRocm91Z2ggQVBMSUMgaW4gTVNJIG1v
ZGUgdG8gSU1TSUMuCldoZW4gdGhlIENQVSBvd25pbmcgaXQgZ29lcyBvZmZsaW5lLCB0aGUgaW50
ZXJydXB0IGlzIG1vdmVkIHRvIGEgQ1BVCnRoYXQgbWF5IGFscmVhZHkgYmUgaWRsZSB3aXRoIGl0
cyBsb2NhbCB0aW1lciBzdG9wcGVkLiBJTVNJQyBsZWF2ZXMgdGhlCmVuYWJsZSBvbiB0aGUgbmV3
IHRhcmdldCB0byBhIHRpbWVyIG9uIHRoYXQgQ1BVLCBhbmQgdGhhdCB0aW1lciBjYW4gb25seQpm
aXJlIHRocm91Z2ggdGhlIGJyb2FkY2FzdCBpbnRlcnJ1cHQsIHdoaWNoIGlzIG5vdCBlbmFibGVk
IHlldC4gVGhlCnN5c3RlbSBzdGFsbHMuCgpQYXRjaCAxIG1ha2VzIHJlbW90ZSBzeW5jaHJvbml6
YXRpb24gdXNlIGhhcmQgSVJRIHdvcmssIHdoaWNoIGZpeGVzIHRoZQpzdGFsbC4KCkEgdmVjdG9y
IG1vdmUgY2FuIHN0aWxsIHRha2UgbG9uZyB0byBmaW5pc2guIFRoZSBDUFUgZW50ZXJpbmcgaWRs
ZQp0YWtlcyBvdmVyIHRoZSBicm9hZGNhc3QgaW50ZXJydXB0IGFuZCBzeW5jcyB0aGUgbmV3IHZl
Y3RvciBiZWZvcmUgdGhlCm9sZCBDUFUgaGFzIHJlbGVhc2VkIHRoZSBvbGQgb25lLCBzbyBpdCBh
cm1zIGEgcmV0cnkgdGltZXIgb24gaXRzZWxmCndpdGggaXRzIHRpY2sgYWxyZWFkeSBzdG9wcGVk
LiBUaGUgbW92ZSB0aGVuIGNvbXBsZXRlcyBvbmx5IG9uIGl0cyBuZXh0CmludGVycnVwdCwgdXAg
dG8gMC41cyBsYXRlciBvbiBhbiBpZGxlIEszLCBhbmQgYWZmaW5pdHkgY2hhbmdlcyBvZiB0aGUK
SVJRIHJldHVybiAtRUJVU1kgdW50aWwgdGhlbi4gUGF0Y2ggMiBsZXRzIHRoZSBvbGQgQ1BVIGtp
Y2sgdGhlIG5ldyBDUFUKaW5zdGVhZCBhbmQgcmVtb3ZlcyB0aGUgcmV0cnkgdGltZXIuCgotLS0K
Q2hhbmdlcyBpbiB2MjoKLSBQYXRjaCAxIHVuY2hhbmdlZC4KLSBOZXcgcGF0Y2ggMjogb25jZSB0
aGUgb2xkIENQVSBoYXMgcmVsZWFzZWQgdGhlIG9sZCB2ZWN0b3IgaXQgcXVldWVzIHRoZQogIHN5
bmMgd29yayBvbiB0aGUgbmV3IENQVSwgd2hpY2ggdGhlbiBjb21wbGV0ZXMgdGhlIG1vdmUgZnJv
bSBpdHMgb3duCiAgSVJRIHdvcmsuIFRoZSBwZXItQ1BVIHJldHJ5IHRpbWVyIGlzIGRyb3BwZWQs
IHNpbmNlIGEgbW92ZSB0aGF0IGhhcyB0bwogIHdhaXQgZm9yIHRoZSBvbGQgQ1BVIGNvdWxkIG9u
bHkgY29tcGxldGUgb24gYW4gaW50ZXJydXB0IGRyaXZlbiBieSBhCiAgdGltZXIgdGhhdCBtYXkg
aXRzZWxmIGJlIHN0b3BwZWQuCi0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5r
LzIwMjYxMTAzLWltc2ljLXJlbW90ZS1zeW5jLWlycXdvcmstdjEtMS04YjVjOTUxZmM2MmFAbGlu
dXguZGV2CgpUbzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+ClRvOiBSYWR1IFJl
bmRlYyA8cmFkdUByZW5kZWMubmV0PgpUbzogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KVG86IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPgpUbzogUGFsbWVyIERhYmJlbHQg
PHBhbG1lckBkYWJiZWx0LmNvbT4KVG86IEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1
PgpUbzogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgpUbzogU2ViYXN0aWFuIEFuZHJ6
ZWogU2lld2lvciA8YmlnZWFzeUBsaW51dHJvbml4LmRlPgpUbzogQ2xhcmsgV2lsbGlhbXMgPGNs
cmt3bGxtc0BrZXJuZWwub3JnPgpUbzogU3RldmVuIFJvc3RlZHQgPHJvc3RlZHRAZ29vZG1pcy5v
cmc+ClRvOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CkNjOiBBbnVwIFBhdGVs
IDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXJ0LWRldmVs
QGxpc3RzLmxpbnV4LmRldgoKLS0tClRyb3kgTWl0Y2hlbGwgKDIpOgogICAgICBpcnFjaGlwL3Jp
c2N2LWltc2ljOiBTeW5jaHJvbml6ZSByZW1vdGUgc3RhdGUgd2l0aCBJUlEgd29yawogICAgICBp
cnFjaGlwL3Jpc2N2LWltc2ljOiBDb21wbGV0ZSB2ZWN0b3IgbW92ZXMgd2l0aG91dCBhIHRpbWVy
CgogZHJpdmVycy9pcnFjaGlwL0tjb25maWcgICAgICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVy
cy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jIHwgIDUgKy0KIGRyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYyB8IDg3ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLQogZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5oIHwgIDYgKy0t
CiA0IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygtKQotLS0K
YmFzZS1jb21taXQ6IDY2MjhlN2Q0YzZiMjVjOGQxOGYxMzQ1ZTNhMjBkMjE4MjlhYWU3ZTQKY2hh
bmdlLWlkOiAyMDI2MTEwMy1pbXNpYy1yZW1vdGUtc3luYy1pcnF3b3JrLTljZmVjNmM0MTBkZQoK
QmVzdCByZWdhcmRzLAotLSAgClRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguZGV2
PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
