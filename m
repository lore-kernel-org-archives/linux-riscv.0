Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF04606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 12:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zsqNUoii;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhIgcTNy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q+vOd4fkcTlDM6gq9SJTNf/5rEzSLPuEtXyX6+I1krY=; b=zsqNUoiikpWsrFsvJcYOkBI8cl
	cO7Q2ofMNIjpgfC+k3rmfWK7GRN7kuIUUHJ2z7lE2EJcluVYRvfyXxxMULb6VLZOL3lgRJ4JIJZiy
	RN1Be3Ik6Xv7GRiDVGn6fJP5zYL06V74SZ+XQynsGaml38CXOt6jUKuIhq1wpDkYp0s/NqrDlEHwC
	YW+kI2US7H4QsEgyQNVklhUzi0eacaKC/HQgjeEpwVlIAwUYtB7C/i4cT+SuPXDdpVYad+6yjzjM8
	2BLwwlwC64mCkGfcEs7xk/nVZrPEB/rXlJSaFMW6F4EjrGTMvyp10ZevfCSo0Ik7bMNshJHdyRs+b
	czVfDBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYdb-0000000D9rf-2oeH;
	Thu, 26 Nov 2026 12:31:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYdY-0000000D9rD-3Di6;
	Thu, 26 Nov 2026 12:31:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C6B445ADF;
	Thu, 26 Nov 2026 12:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8E31F000EC;
	Thu, 26 Nov 2026 12:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696300;
	bh=g76ZCxcIcpyNOspZC9j/ne3dtmiKHKAQji21AEWRzhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FhIgcTNyf14ldQHtiXv4zYG7ZY7VCqUA0BM8xEiAd9PiTm163jt+tIucHvtp12C8Z
	 hTWcxCBuQSmBdPjWBXBZNhoWsIRaeZwk4tBrpXsXp0LFE7rslODJBmDyl3YQpg6Ny/
	 ZQqOVxVhkX4GcW5TAfSjWCdZhxgEs/tJx7zxfh/n5fb8xCMqBvorTueaamFp/RlS4/
	 dMV1Xmmt3A6+Gg03qpav/T8uWqHtizB8mmoUOgZZwBmCLaSrlFT2sBQ8IPhG1sybXm
	 JThOqAaaV55drREdq3cv4z5h+Vfq577y0fulQy6Oo6YnLP7UaB0gh1hEnnj5kEf7X0
	 5lql7h2/dp6dw==
Date: Thu, 26 Nov 2026 14:31:18 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	ritesh.list@gmail.com, sshegde@linux.ibm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	akpm@linux-foundation.org, baoquan.he@linux.dev,
	pasha.tatashin@soleen.com, pratyush@kernel.org, leitao@debian.org,
	yeoreum.yun@arm.com, mpilaniy@redhat.com, robh@kernel.org,
	coiby.xu@gmail.com, Yeking@red54.com, prudo@redhat.com,
	brads@mainlining.org, sourabhjain@linux.ibm.com,
	mkchauras@gmail.com, blum@kernel.org, adityag@linux.ibm.com,
	qirui.001@bytedance.com, hui.wang@canonical.com,
	sohammetha01@gmail.com, guoren@kernel.org, gaohan@iscas.ac.cn,
	ionut.nechita@windriver.com, vishal.l.verma@intel.com,
	seanjc@google.com, ardb@kernel.org, richard.lyu@suse.com,
	arnd@arndb.de, tzimmermann@suse.de, rick.p.edgecombe@intel.com,
	kai.huang@intel.com, kas@kernel.org, piliu@redhat.com,
	thuth@redhat.com, shradhagupta@linux.microsoft.com,
	ebiggers@kernel.org, jbouron@amazon.com, me@linux.beauty,
	mclapinski@google.com, graf@amazon.com, tangyouling@kylinos.cn,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v8 00/11] kexec: Rework segment loading and fix CMA
 retries
Message-ID: <awgmlnibFRpjgG2a@kernel.org>
References: <20261112133418.4044428-1-ruanjinjie@huawei.com>
 <584a0e7a-230e-4a95-9e09-a1d6499a6ea9@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <584a0e7a-230e-4a95-9e09-a1d6499a6ea9@huawei.com>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSmluamllLAoKT24gTW9uLCBOb3YgMjMsIDIwMjYgYXQgMDM6MTA6NTNQTSArMDgwMCwgSmlu
amllIFJ1YW4gd3JvdGU6Cj4gCj4g5ZyoIDIwMjYvMTEvMTIgMjE6MzQsIEppbmppZSBSdWFuIOWG
memBkzoKPiA+IEFSTTY0LCBMb29uZ0FyY2gsIFJJU0MtViwgeDg2IGFuZCBwb3dlcnBjIGJ1aWxk
IHRoZSBlbGYgY29yZSBoZWFkZXIKPiA+IGFuZCBwbGFjZSBpdCB0b2dldGhlciB3aXRoIHRoZSBp
bml0cmQgYW5kIHRoZSBEVEIgd2l0aCBhbG1vc3QgaWRlbnRpY2FsCj4gPiBjb2RlLgo+ID4gCj4g
PiBUaGlzIHNlcmllcyByZXdvcmtzIHRoYXQgcGF0aCBpbnRvIGNvbW1vbiBoZWxwZXJzIHRoYXQg
dGhlIGFyY2hpdGVjdHVyZXMKPiA+IHJldXNlLCBhbmQgZml4ZXMgdGhlIENNQSBwYWdlIGFuZCBl
bGYgY29yZSBoZWFkZXIgbGVha3MgaW4gdGhlIGFybTY0Cj4gPiBhbmQgTG9vbmdBcmNoIHBsYWNl
bWVudCByZXRyeSBsb29wcy4KPiA+IAo+ID4gVGhlIHBhdGNoIG9yZ2FuaXphdGlvbiBpcyBhcyBm
b2xsb3dzOgo+ID4gCj4gPiAtIFBhdGNoIDEgbW92ZXMgdGhlIHJlbGVhc2Ugb2YgdGhlIGVsZiBj
b3JlIGhlYWRlciBpbnRvIHRoZSBnZW5lcmljCj4gPiAgIHBvc3QtbG9hZCBjbGVhbnVwLCBzbyB0
aGF0IHRoZSBhcmNoaXRlY3R1cmVzIG5vIGxvbmdlciBmcmVlIGl0Cj4gPiAgIHRoZW1zZWx2ZXMu
Cj4gPiAKPiA+IC0gUGF0Y2ggMiBhZGRzIHRoZSBjb21tb24gaGVscGVycwo+ID4gCj4gPiAtIFBh
dGNoZXMgMy03IGNvbnZlcnQgYXJtNjQsIExvb25nQXJjaCwgUklTQy1WLCBYODYgYW5kIFBvd2Vy
cGMgdG8KPiA+ICAgcmV1c2UgdGhlIGNvbW1vbiBoZWxwZXJzCj4gPiAKPiA+IC0gUGF0Y2hlcyA4
LTExIGZpeCB0aGUgQ01BIHBhZ2VzIGxlYWtlZCBieSB0aGUgcmV0cnkgbG9vcHMgYW5kCj4gPiAg
IHRoZSBsb29wIHRoYXQgbWFrZXMgbm8gcHJvZ3Jlc3MKPiA+IAo+ID4gVGVzdGVkIHdpdGgga2V4
ZWNfZmlsZV9sb2FkKCkgb24gYXJtNjQsIExvb25nQXJjaCwgUklTQy1WLCBYODYgYW5kCj4gPiBQ
b3dlcnBjIHVuZGVyIFFFTVUsIGluY2x1ZGluZyB0aGUgQ01BIHJldHJ5IHBhdGhzLCBsb2FkaW5n
IGEgY3Jhc2gKPiA+IGtlcm5lbCBhbmQgYm9vdGluZyB0aGUgc2Vjb25kIGtlcm5lbCwgd2l0aCB0
aGUgYWdlbnQgaGVscC4KPiA+IAo+ID4gVGhpcyBzZXJpZXMgaXMgYWxzbyBhdmFpbGFibGUgYXQ6
Cj4gPiAJaHR0cHM6Ly9naXRodWIuY29tL3J1YW5qaW5qaWUtZW5nL2xpbnV4L3RyZWUva2V4ZWNf
cmV3b3JrX2NtYV9idWdmeF92OQo+ID4gCj4gPiBDaGFuZ2VzIGluIHY4Ogo+ID4gLSBSZXdvcmsg
dGhlIGNvbW1vbiBjb2RlIGFzIE1pa2Ugc3VnZ2VzdGVkOiB0aGUgY29yZSBwcm92aWRlcyBidWls
ZGluZwo+ID4gICBibG9ja3MgYW5kIHRoZSBhcmNoaXRlY3R1cmVzIHVzZXMgdGhlbSAoTWlrZSkK
PiA+IC0gQnVpbGQgdGhlIGVsZiBjb3JlIGhlYWRlciBvbmNlIGFuZCBvbmx5IHBsYWNlIGl0IG9u
IHRoZSByZXRyaWVzIChNaWtlKQo+ID4gLSBLZWVwIHRoZSBzZWdtZW50IG9yZGVyIGFuZCB0aGUg
YXJjaCBwbGFjZW1lbnQgcG9saWN5IHVuY2hhbmdlZCAoTWlrZSkKPiA+IC0gQ29udmVydCB4ODYg
YW5kIHBvd2VycGMgYXMgd2VsbAo+ID4gLSBNb3ZlIHRoZSBDTUEgZml4ZXMgdG8gdGhlIGVuZCBv
ZiB0aGUgc2VyaWVzIChNaWtlKQo+IAo+IEhpIE1pa2UsCj4gCj4gRG9lcyB0aGlzIHJlZmFjdG9y
aW5nIG5vdyBtZWV0IHlvdXIgZXhwZWN0YXRpb25zPwoKSSBvbmx5IGhhZCB0aW1lIGZvciBhIHF1
aWNrIHNraW0sIGFuZCBvdmVyYWxsIGl0IGxvb2tzIGdvb2QgdG8gbWUuCgpUaGUgb25seSB0aGlu
ZyB0aGF0IHN0b29kIG91dCB3YXMga2V4ZWNfYWRkX2ZkdCgpIGluIGtleGVjL2tleGVjX2ZpbGUu
Yy4KSSBiZWxpZXZlIGRyaXZlcnMvb2Yva2V4ZWMuYyBpcyBhIGJldHRlciBwbGFjZSBmb3IgaXQu
CiAKPiBJbiBteSB2aWV3LCB0aGVyZSBpcyBzdGlsbCBhbiBpc3N1ZSB3b3J0aCBkaXNjdXNzaW5n
OiBzaG91bGQgd2UgcmVzZXJ2ZQo+IGZvciB0aGUgY3Jhc2ggaG90cGx1ZyBlbGYgY29yZSBoZWFk
ZXIgaW4gdGhlIGZyYW1ld29yayBjb2RlCj4ga2V4ZWNfYWRkX2VsZl9jb3JlX2hlYWRlcigpLCBv
ciBvbmx5IGltcGxlbWVudCBpdCBpbiB0aGUgeDg2Cj4gYXJjaGl0ZWN0dXJlIGNvZGUsIGFuZCBj
b25zaWRlciBnZW5lcmFsaXppbmcgaXQgYWZ0ZXIgdGhlIEFSTTY0Cj4gaW1wbGVtZW50YXRpb24g
aXMgYXZhaWxhYmxlPwoKSSB0aGluayBpdCdzIGJldHRlciB0byBrZWVwIGl0IGluIHg4NiBmb3Ig
bm93IGFuZCBnZW5lcmFsaXplIGxhdGVyLgogCj4gQmVzdCByZWdhcmRzLAo+IEppbmppZQo+IAo+
IAo+ID4gLSBMaW5rIHRvIHY3OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjEwMjYw
NzUyMDEuNjk5NTUwLTEtcnVhbmppbmppZUBodWF3ZWkuY29tLwo+ID4gCj4gPiBQcmV2aW91cyBW
ZXJzaW9ucyBhcmUgYXMgYmVsb3c6Cj4gPiAtIHY2OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNjA5MjEwOTA0NTAuODA3NTc1LTEtcnVhbmppbmppZUBodWF3ZWkuY29tLwo+ID4gLSB2
NTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwOTE4MTAwNDQyLjM4NDExMzUtMS1y
dWFuamluamllQGh1YXdlaS5jb20vCj4gPiAtIHY0OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNjA5MDcxMjU0MDQuOTIyMTIzLTEtcnVhbmppbmppZUBodWF3ZWkuY29tLwo+ID4gLSB2
MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwODI2MDkyNTQxLjM5MDU5MzMtMS1y
dWFuamluamllQGh1YXdlaS5jb20vCj4gPiAtIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNjA3MjkwMzEyMzUuMjg0MDI1NS0xLXJ1YW5qaW5qaWVAaHVhd2VpLmNvbS8KPiA+IC0g
djE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDcyMzEzMTI0Mi4xNTM3NjMzLTEt
cnVhbmppbmppZUBodWF3ZWkuY29tLyN0Cj4gPiAKPiA+IEppbmppZSBSdWFuICgxMSk6Cj4gPiAg
IGtleGVjOiBGcmVlIHRoZSBlbGYgY29yZSBoZWFkZXIgaW4ga2ltYWdlX2ZpbGVfcG9zdF9sb2Fk
X2NsZWFudXAoKQo+ID4gICBrZXhlYzogQWRkIGhlbHBlcnMgdG8gbG9hZCB0aGUgZWxmIGNvcmUg
aGVhZGVyLCBpbml0cmQgYW5kIEZEVAo+ID4gICBhcm02NDoga2V4ZWNfZmlsZTogTG9hZCB0aGUg
b3RoZXIgc2VnbWVudHMgd2l0aCBjb21tb24gaGVscGVycwo+ID4gICBMb29uZ0FyY2g6IGtleGVj
X2ZpbGU6IExvYWQgdGhlIG90aGVyIHNlZ21lbnRzIHdpdGggY29tbW9uIGhlbHBlcnMKPiA+ICAg
cmlzY3Y6IGtleGVjX2ZpbGU6IExvYWQgdGhlIGV4dHJhIHNlZ21lbnRzIHdpdGggY29tbW9uIGhl
bHBlcnMKPiA+ICAgeDg2OiBrZXhlY19maWxlOiBVc2UgdGhlIGNvbW1vbiBzZWdtZW50IGhlbHBl
cnMKPiA+ICAgcG93ZXJwYzoga2V4ZWNfZmlsZTogVXNlIHRoZSBjb21tb24gc2VnbWVudCBoZWxw
ZXJzCj4gPiAgIGtleGVjOiBFeHRyYWN0IGtleGVjX2ZyZWVfc2VnbWVudF9jbWEoKSBmcm9tIGtp
bWFnZV9mcmVlX2NtYSgpCj4gPiAgIGtleGVjOiBBZGQga2V4ZWNfcm9sbGJhY2tfc2VnbWVudHMo
KSBoZWxwZXIKPiA+ICAgYXJtNjQ6IGtleGVjX2ZpbGU6IEZpeCBDTUEgc2VnbWVudCBwbGFjZW1l
bnQgcmV0cmllcwo+ID4gICBMb29uZ0FyY2g6IGtleGVjX2ZpbGU6IEZpeCBDTUEgc2VnbWVudCBw
bGFjZW1lbnQgcmV0cmllcwo+ID4gCj4gPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9rZXhlYy5o
ICAgICAgICAgICAgIHwgICA0ICstCj4gPiAgYXJjaC9hcm02NC9rZXJuZWwva2V4ZWNfaW1hZ2Uu
YyAgICAgICAgICAgIHwgIDE1ICsrLQo+ID4gIGFyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4
ZWNfZmlsZS5jICAgICB8ICA4NyArKysrLS0tLS0tLS0tLQo+ID4gIGFyY2gvbG9vbmdhcmNoL2lu
Y2x1ZGUvYXNtL2tleGVjLmggICAgICAgICB8ICAgMyArLQo+ID4gIGFyY2gvbG9vbmdhcmNoL2tl
cm5lbC9rZXhlY19lZmkuYyAgICAgICAgICB8ICAxNSArKy0KPiA+ICBhcmNoL2xvb25nYXJjaC9r
ZXJuZWwva2V4ZWNfZWxmLmMgICAgICAgICAgfCAgIDMgKy0KPiA+ICBhcmNoL2xvb25nYXJjaC9r
ZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMgfCAgODAgKysrKystLS0tLS0tLQo+ID4gIGFyY2gv
cG93ZXJwYy9rZXhlYy9lbGZfNjQuYyAgICAgICAgICAgICAgICB8ICAgOSArLQo+ID4gIGFyY2gv
cG93ZXJwYy9rZXhlYy9maWxlX2xvYWRfNjQuYyAgICAgICAgICB8ICAxOCArLS0KPiA+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2tleGVjLmggICAgICAgICAgICAgfCAgIDQgKy0KPiA+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9rZXhlY19lbGYuYyAgICAgICAgICAgICAgfCAgIDMgKy0KPiA+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9rZXhlY19pbWFnZS5jICAgICAgICAgICAgfCAgIDMgKy0KPiA+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYyAgICAgfCAgODMgKysrKy0tLS0tLS0t
LS0KPiA+ICBhcmNoL3g4Ni9rZXJuZWwvY3Jhc2guYyAgICAgICAgICAgICAgICAgICAgfCAgMjUg
Ky0tLS0KPiA+ICBhcmNoL3g4Ni9rZXJuZWwva2V4ZWMtYnppbWFnZTY0LmMgICAgICAgICAgfCAg
IDggKy0KPiA+ICBhcmNoL3g4Ni9rZXJuZWwvbWFjaGluZV9rZXhlY182NC5jICAgICAgICAgfCAg
IDQgLQo+ID4gIGluY2x1ZGUvbGludXgva2V4ZWMuaCAgICAgICAgICAgICAgICAgICAgICB8ICAx
NCArKysKPiA+ICBrZXJuZWwva2V4ZWNfY29yZS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MjUgKysrLS0KPiA+ICBrZXJuZWwva2V4ZWNfZmlsZS5jICAgICAgICAgICAgICAgICAgICAgICAg
fCAxMjUgKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMTkgZmlsZXMgY2hhbmdlZCwgMjU0IGlu
c2VydGlvbnMoKyksIDI3NCBkZWxldGlvbnMoLSkKPiA+IAo+IAoKLS0gClNpbmNlcmVseSB5b3Vy
cywKTWlrZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
