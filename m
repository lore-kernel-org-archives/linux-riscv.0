Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FFD606A337
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xgkG1dgb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=OECdgrGt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rV/dlMSCgHUdB7jA5ciwGrpWIOZ7bvi/tmWIv7rQE5o=; b=xgkG1dgb8LP5Tp+a7L2Kyg2ik3
	730ZysQMk8wWKJWjSX05/0evlf80rvBLctPsWWmH0UvTsreMchMut2hneZ9mjTqRv0BL9P0+d+Q8c
	r/hi90+ycRlfOw8NwWEiOB/TrMnTI7c8pbZAFjTd4f3s9sZVzydIJHfd58G0ym7+ePd42ClYPh0pg
	f3ED+52jktqqoVgJzZO8q2B2FwIRuv7EdIBtxPoPqRSXalYzkruOoa+fKv/L01Gt8/04w6mPWUvcv
	nX2pA+3fL57Tkq5KXch3EzA1og9y9Rg+HagvQ0wRSwBKvZK0AMLYkobTQNOCOdmHlqbt6Cq3gyQBs
	XQ5c3IKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIR-000000073xx-1dLB;
	Tue, 17 Nov 2026 21:00:55 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIN-000000073x3-42l3
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 21:00:54 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 1BD2020D7CF8;
	Tue, 17 Nov 2026 22:00:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id E0F2820D556E;
	Tue, 17 Nov 2026 22:00:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr E0F2820D556E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949248;
	bh=5LgE57R3Il6gqjY4KmRL+QrcZ5QfaNmUauX8w1f2jTY=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=OECdgrGt7F/A4nEpe+uekZG4Ss0w6m4RFRWG6nb01/iTAw/id9PF1tUpQwigo3gAn
	 LxFiv+/98H5EOAokzxAg0hfAJHs6pC/jHNwR27yQgA9ZHmTmJvYuiIKGMpPAjT+Zwc
	 OD6bjHo4T6F2mddItcvORWwmMVPINF3sjY/1SRWf299i/aWNbwJpGTduqpWa86WjUI
	 myDHDShTogLI2miKtPlZzCbjdoStnIJaVgApC94982uenNdWcVrG82CEmXLWVWctJi
	 DRb7Czr5u5L6hm3KHSPSltxEXvZ+p6GjxJyQn7bFcpocP+5uqdVCQ4FHpYLefIBXaT
	 +VC0vhyxRZU2A==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id khgeR7RBwUQf; Tue, 17 Nov 2026 22:00:47 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 9B94C20D7CF8;
	Tue, 17 Nov 2026 22:00:46 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH 0/6] riscv: spacemit: k1: RCPU2 PWM clocks and the BPI-F3 fan
Date: Tue, 17 Nov 2026 21:59:45 +0100
Message-ID: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_130052_457326_AB7034E4 
X-CRM114-Status: GOOD (  10.30  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIEJQSS1GMyBmYW4gaGVhZGVyIChKMjcpIGhhcyBhIFBXTSBsaW5lIGRyaXZlbiBieSBhbiBS
Q1BVMiBQV00KKEdQSU8gNzkpLiBUaGlzIHNlcmllcyBhZGRzIHRoZSBSQ1BVMiBQV00gY2xvY2tz
IGFuZCBEVCBub2RlcyBhbmQKZW5hYmxlcyB0aGUgZmFuIG9uIHRoZSBCUEktRjMuCgpQYXRjaCAy
IGtlZXBzIHBsbDFfYXVkXzI0NXA3IGVuYWJsZWQ6IG9uY2UgY2xrX2Rpc2FibGVfdW51c2VkKCkg
Z2F0ZXMKaXQsIGFjY2Vzc2VzIHRvIHRoZSBSQ1BVMiBibG9jayBoYW5nIHRoZSBDUFUgKHRoZSB2
ZW5kb3Iga2VybmVsIGtlZXBzCml0IG9uIHRocm91Z2ggaXRzIFJDUFUgZmlybXdhcmUpLiBJdCBt
YXkgYmUgYmV0dGVyIHRpZWQgdG8gYSBwb3dlcgpkb21haW4gb25jZSB0aGUgSzEgcG93ZXIgZG9t
YWluIGRyaXZlciBsYW5kczsgY29tbWVudHMgd2VsY29tZS4KClRlc3RlZCBvbiBhIEJQSS1GMyBv
biB2Ny40LXJjMSAobm8gZmFuIHdpdGggYSBQV00gaW5wdXQgYXQgaGFuZCwgc28Kd2l0aCBhIG11
bHRpbWV0ZXIgb24gSjI3IHBpbiAzKTogMC44NiwgMS43NiwgMi43NCBhbmQgNC42NiBWIGF0IDI1
LAo1MCwgNzUgYW5kIDEwMCUgZHV0eSAoMC4wNCBWIG9mZiksIGFzIHdpdGggdGhlIHZlbmRvciBr
ZXJuZWwsIGFuZAp0aGUgZmFuIGdvZXMgdG8gbGV2ZWwgMSB3aGVuIHRoZSBwYWNrYWdlIHJlYWNo
ZXMgNDAgQyB1bmRlciBsb2FkLgoKVHJlZXM6IDEtMyBjbGssIDQtNSBTcGFjZW1pVCBEVCAoNCBu
ZWVkcyB0aGUgSURzIGZyb20gMSksIDYgcmlzY3YKZGVmY29uZmlnLiBEZXBlbmRzIG9uICJyZXNl
dDogc3BhY2VtaXQ6IEZpeCB0aGUgUkNQVTIgUFdNIHJlc2V0CnJlZ2lzdGVycyIgKHJlc2V0L2Zp
eGVzKS4KCldyaXR0ZW4gd2l0aCBoZWxwIGZyb20gQ2xhdWRlIChBbnRocm9waWMpOyByZXZpZXdl
ZCBhbmQgdGVzdGVkIG9uCmhhcmR3YXJlLgoKU2lnbmVkLW9mZi1ieTogRnLDqWTDqXJpYyBNYWjD
qSA8ZnJlZGVyaWMubWFoZUBjaXJhZC5mcj4KCgpGcsOpZMOpcmljIE1haMOpICg2KToKICBkdC1i
aW5kaW5nczogY2xvY2s6IHNwYWNlbWl0OiBrMTogQWRkIFJDUFUyIFBXTSBjbG9ja3MKICBjbGs6
IHNwYWNlbWl0OiBrMTogS2VlcCBwbGwxX2F1ZF8yNDVwNyBlbmFibGVkCiAgY2xrOiBzcGFjZW1p
dDogazE6IEFkZCBSQ1BVMiBQV00gY2xvY2tzCiAgcmlzY3Y6IGR0czogc3BhY2VtaXQ6IGsxOiBB
ZGQgUkNQVTIgUFdNIG5vZGVzCiAgcmlzY3Y6IGR0czogc3BhY2VtaXQ6IGsxLWJhbmFuYXBpLWYz
OiBBZGQgUFdNIGZhbgogIHJpc2N2OiBkZWZjb25maWc6IEVuYWJsZSBQV00gZmFuIHN1cHBvcnQK
CiAuLi4vYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzICAgICAgfCA2MyArKysr
KysrKysrKysrCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRzaSAg
fCAgNyArKwogYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpICAgICAgICAgIHwg
OTEgKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyAgICAg
ICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9jbGsvc3BhY2VtaXQvY2N1LWsxLmMgICAgICAg
ICAgICAgICAgIHwgNDUgKysrKysrKystCiAuLi4vZHQtYmluZGluZ3MvY2xvY2svc3BhY2VtaXQs
azEtc3lzY29uLmggICAgfCAxMiArKysKIDYgZmlsZXMgY2hhbmdlZCwgMjE4IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCgpiYXNlLWNvbW1pdDogNjYyOGU3ZDRjNmIyNWM4ZDE4ZjEzNDVl
M2EyMGQyMTgyOWFhZTdlNApwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDc2NjEzYTE0NGFjMmY1ZGI1
NTExZTZmM2RjODY0NTUxMDkzM2MxNGMKLS0gCjIuNDcuMwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
