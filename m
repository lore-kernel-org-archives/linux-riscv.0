Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D3A606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 07:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xHN6oE5g;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=guV9eUba
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P1NZhtEJB4LFGHrua7bToWB10DeaMmkwoXe6gRLPAdA=; b=xHN6oE5gZVU6oJRcGhnsWYUtgk
	+q/MCRLXET4PICNruP98Eqep75VM/u+pbdXxlkaYY97d1dNjMZN5RzniRTwjgF283krGBe3697lVC
	gXJ+vBYph7XKjooNtfpbiqMIiY1GxkSy57Bd4r3zjAZymhUL5pDpHJQ1p+8Z9AQH71H+HgnXmFKSW
	8FPItWJyCuE9eJQMgAUnJuHfZJ3lgbsVb4QgQ+/5lGCKJjSYA+4fEjbVFYpCCHQX6iqQ6RSQhgNJa
	UyPmXx4GKAmVxopmrqFDKT00XWshH+zXD+ES68xQAT1KFeJBERlueGj6qGCH/klFaeFIMcj8hsHsw
	G8csOBDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVODK-00000002RKo-19po;
	Mon, 23 Nov 2026 07:11:46 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOCg-00000002RHa-0iUL;
	Mon, 23 Nov 2026 07:11:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aUC6dwvADLWcIIFgIfO7ZojWD6NXidysfo4b9W39AAY=;
	b=guV9eUba+R5PDayFm8H06i5ZTYBsUhnHD4vQWNFcLcZtduyG4gmBeeAB+LML0q7m2R3X3WcAk
	hq/BWQ1RYPlOPu9P52463fbpuoyQt2HGQ1Yx/Ul7gbqJV/FVf0Mc5IJKgZSNsosmbXxuWk9wJBd
	tEXKc1taTNkcoLdTc3eqClM=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jXxt80klzzRhRC;
	Mon, 23 Nov 2026 15:10:40 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 81BD440579;
	Mon, 23 Nov 2026 15:10:57 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 23 Nov
 2026 15:10:54 +0800
Message-ID: <584a0e7a-230e-4a95-9e09-a1d6499a6ea9@huawei.com>
Date: Mon, 23 Nov 2026 15:10:53 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/11] kexec: Rework segment loading and fix CMA
 retries
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <leitao@debian.org>, <yeoreum.yun@arm.com>,
	<mpilaniy@redhat.com>, <robh@kernel.org>, <coiby.xu@gmail.com>,
	<Yeking@Red54.com>, <prudo@redhat.com>, <brads@mainlining.org>,
	<sourabhjain@linux.ibm.com>, <mkchauras@gmail.com>, <blum@kernel.org>,
	<adityag@linux.ibm.com>, <qirui.001@bytedance.com>, <hui.wang@canonical.com>,
	<sohammetha01@gmail.com>, <guoren@kernel.org>, <gaohan@iscas.ac.cn>,
	<ionut.nechita@windriver.com>, <vishal.l.verma@intel.com>,
	<seanjc@google.com>, <ardb@kernel.org>, <richard.lyu@suse.com>,
	<arnd@arndb.de>, <tzimmermann@suse.de>, <rick.p.edgecombe@intel.com>,
	<kai.huang@intel.com>, <kas@kernel.org>, <piliu@redhat.com>,
	<thuth@redhat.com>, <shradhagupta@linux.microsoft.com>,
	<ebiggers@kernel.org>, <jbouron@amazon.com>, <me@linux.beauty>,
	<mclapinski@google.com>, <graf@amazon.com>, <tangyouling@kylinos.cn>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
References: <20261112133418.4044428-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261112133418.4044428-1-ruanjinjie@huawei.com>
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_231107_219561_EE50C3B3 
X-CRM114-Status: GOOD (  19.16  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgrlnKggMjAyNi8xMS8xMiAyMTozNCwgSmluamllIFJ1YW4g5YaZ6YGTOgo+IEFSTTY0LCBMb29u
Z0FyY2gsIFJJU0MtViwgeDg2IGFuZCBwb3dlcnBjIGJ1aWxkIHRoZSBlbGYgY29yZSBoZWFkZXIK
PiBhbmQgcGxhY2UgaXQgdG9nZXRoZXIgd2l0aCB0aGUgaW5pdHJkIGFuZCB0aGUgRFRCIHdpdGgg
YWxtb3N0IGlkZW50aWNhbAo+IGNvZGUuCj4gCj4gVGhpcyBzZXJpZXMgcmV3b3JrcyB0aGF0IHBh
dGggaW50byBjb21tb24gaGVscGVycyB0aGF0IHRoZSBhcmNoaXRlY3R1cmVzCj4gcmV1c2UsIGFu
ZCBmaXhlcyB0aGUgQ01BIHBhZ2UgYW5kIGVsZiBjb3JlIGhlYWRlciBsZWFrcyBpbiB0aGUgYXJt
NjQKPiBhbmQgTG9vbmdBcmNoIHBsYWNlbWVudCByZXRyeSBsb29wcy4KPiAKPiBUaGUgcGF0Y2gg
b3JnYW5pemF0aW9uIGlzIGFzIGZvbGxvd3M6Cj4gCj4gLSBQYXRjaCAxIG1vdmVzIHRoZSByZWxl
YXNlIG9mIHRoZSBlbGYgY29yZSBoZWFkZXIgaW50byB0aGUgZ2VuZXJpYwo+ICAgcG9zdC1sb2Fk
IGNsZWFudXAsIHNvIHRoYXQgdGhlIGFyY2hpdGVjdHVyZXMgbm8gbG9uZ2VyIGZyZWUgaXQKPiAg
IHRoZW1zZWx2ZXMuCj4gCj4gLSBQYXRjaCAyIGFkZHMgdGhlIGNvbW1vbiBoZWxwZXJzCj4gCj4g
LSBQYXRjaGVzIDMtNyBjb252ZXJ0IGFybTY0LCBMb29uZ0FyY2gsIFJJU0MtViwgWDg2IGFuZCBQ
b3dlcnBjIHRvCj4gICByZXVzZSB0aGUgY29tbW9uIGhlbHBlcnMKPiAKPiAtIFBhdGNoZXMgOC0x
MSBmaXggdGhlIENNQSBwYWdlcyBsZWFrZWQgYnkgdGhlIHJldHJ5IGxvb3BzIGFuZAo+ICAgdGhl
IGxvb3AgdGhhdCBtYWtlcyBubyBwcm9ncmVzcwo+IAo+IFRlc3RlZCB3aXRoIGtleGVjX2ZpbGVf
bG9hZCgpIG9uIGFybTY0LCBMb29uZ0FyY2gsIFJJU0MtViwgWDg2IGFuZAo+IFBvd2VycGMgdW5k
ZXIgUUVNVSwgaW5jbHVkaW5nIHRoZSBDTUEgcmV0cnkgcGF0aHMsIGxvYWRpbmcgYSBjcmFzaAo+
IGtlcm5lbCBhbmQgYm9vdGluZyB0aGUgc2Vjb25kIGtlcm5lbCwgd2l0aCB0aGUgYWdlbnQgaGVs
cC4KPiAKPiBUaGlzIHNlcmllcyBpcyBhbHNvIGF2YWlsYWJsZSBhdDoKPiAJaHR0cHM6Ly9naXRo
dWIuY29tL3J1YW5qaW5qaWUtZW5nL2xpbnV4L3RyZWUva2V4ZWNfcmV3b3JrX2NtYV9idWdmeF92
OQo+IAo+IENoYW5nZXMgaW4gdjg6Cj4gLSBSZXdvcmsgdGhlIGNvbW1vbiBjb2RlIGFzIE1pa2Ug
c3VnZ2VzdGVkOiB0aGUgY29yZSBwcm92aWRlcyBidWlsZGluZwo+ICAgYmxvY2tzIGFuZCB0aGUg
YXJjaGl0ZWN0dXJlcyB1c2VzIHRoZW0gKE1pa2UpCj4gLSBCdWlsZCB0aGUgZWxmIGNvcmUgaGVh
ZGVyIG9uY2UgYW5kIG9ubHkgcGxhY2UgaXQgb24gdGhlIHJldHJpZXMgKE1pa2UpCj4gLSBLZWVw
IHRoZSBzZWdtZW50IG9yZGVyIGFuZCB0aGUgYXJjaCBwbGFjZW1lbnQgcG9saWN5IHVuY2hhbmdl
ZCAoTWlrZSkKPiAtIENvbnZlcnQgeDg2IGFuZCBwb3dlcnBjIGFzIHdlbGwKPiAtIE1vdmUgdGhl
IENNQSBmaXhlcyB0byB0aGUgZW5kIG9mIHRoZSBzZXJpZXMgKE1pa2UpCgpIaSBNaWtlLAoKRG9l
cyB0aGlzIHJlZmFjdG9yaW5nIG5vdyBtZWV0IHlvdXIgZXhwZWN0YXRpb25zPwoKSW4gbXkgdmll
dywgdGhlcmUgaXMgc3RpbGwgYW4gaXNzdWUgd29ydGggZGlzY3Vzc2luZzogc2hvdWxkIHdlIHJl
c2VydmUKZm9yIHRoZSBjcmFzaCBob3RwbHVnIGVsZiBjb3JlIGhlYWRlciBpbiB0aGUgZnJhbWV3
b3JrIGNvZGUKa2V4ZWNfYWRkX2VsZl9jb3JlX2hlYWRlcigpLCBvciBvbmx5IGltcGxlbWVudCBp
dCBpbiB0aGUgeDg2CmFyY2hpdGVjdHVyZSBjb2RlLCBhbmQgY29uc2lkZXIgZ2VuZXJhbGl6aW5n
IGl0IGFmdGVyIHRoZSBBUk02NAppbXBsZW1lbnRhdGlvbiBpcyBhdmFpbGFibGU/CgpCZXN0IHJl
Z2FyZHMsCkppbmppZQoKCj4gLSBMaW5rIHRvIHY3OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNjEwMjYwNzUyMDEuNjk5NTUwLTEtcnVhbmppbmppZUBodWF3ZWkuY29tLwo+IAo+IFBy
ZXZpb3VzIFZlcnNpb25zIGFyZSBhcyBiZWxvdzoKPiAtIHY2OiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNjA5MjEwOTA0NTAuODA3NTc1LTEtcnVhbmppbmppZUBodWF3ZWkuY29tLwo+
IC0gdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDkxODEwMDQ0Mi4zODQxMTM1
LTEtcnVhbmppbmppZUBodWF3ZWkuY29tLwo+IC0gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI2MDkwNzEyNTQwNC45MjIxMjMtMS1ydWFuamluamllQGh1YXdlaS5jb20vCj4gLSB2
MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwODI2MDkyNTQxLjM5MDU5MzMtMS1y
dWFuamluamllQGh1YXdlaS5jb20vCj4gLSB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjYwNzI5MDMxMjM1LjI4NDAyNTUtMS1ydWFuamluamllQGh1YXdlaS5jb20vCj4gLSB2MTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNzIzMTMxMjQyLjE1Mzc2MzMtMS1ydWFu
amluamllQGh1YXdlaS5jb20vI3QKPiAKPiBKaW5qaWUgUnVhbiAoMTEpOgo+ICAga2V4ZWM6IEZy
ZWUgdGhlIGVsZiBjb3JlIGhlYWRlciBpbiBraW1hZ2VfZmlsZV9wb3N0X2xvYWRfY2xlYW51cCgp
Cj4gICBrZXhlYzogQWRkIGhlbHBlcnMgdG8gbG9hZCB0aGUgZWxmIGNvcmUgaGVhZGVyLCBpbml0
cmQgYW5kIEZEVAo+ICAgYXJtNjQ6IGtleGVjX2ZpbGU6IExvYWQgdGhlIG90aGVyIHNlZ21lbnRz
IHdpdGggY29tbW9uIGhlbHBlcnMKPiAgIExvb25nQXJjaDoga2V4ZWNfZmlsZTogTG9hZCB0aGUg
b3RoZXIgc2VnbWVudHMgd2l0aCBjb21tb24gaGVscGVycwo+ICAgcmlzY3Y6IGtleGVjX2ZpbGU6
IExvYWQgdGhlIGV4dHJhIHNlZ21lbnRzIHdpdGggY29tbW9uIGhlbHBlcnMKPiAgIHg4Njoga2V4
ZWNfZmlsZTogVXNlIHRoZSBjb21tb24gc2VnbWVudCBoZWxwZXJzCj4gICBwb3dlcnBjOiBrZXhl
Y19maWxlOiBVc2UgdGhlIGNvbW1vbiBzZWdtZW50IGhlbHBlcnMKPiAgIGtleGVjOiBFeHRyYWN0
IGtleGVjX2ZyZWVfc2VnbWVudF9jbWEoKSBmcm9tIGtpbWFnZV9mcmVlX2NtYSgpCj4gICBrZXhl
YzogQWRkIGtleGVjX3JvbGxiYWNrX3NlZ21lbnRzKCkgaGVscGVyCj4gICBhcm02NDoga2V4ZWNf
ZmlsZTogRml4IENNQSBzZWdtZW50IHBsYWNlbWVudCByZXRyaWVzCj4gICBMb29uZ0FyY2g6IGtl
eGVjX2ZpbGU6IEZpeCBDTUEgc2VnbWVudCBwbGFjZW1lbnQgcmV0cmllcwo+IAo+ICBhcmNoL2Fy
bTY0L2luY2x1ZGUvYXNtL2tleGVjLmggICAgICAgICAgICAgfCAgIDQgKy0KPiAgYXJjaC9hcm02
NC9rZXJuZWwva2V4ZWNfaW1hZ2UuYyAgICAgICAgICAgIHwgIDE1ICsrLQo+ICBhcmNoL2FybTY0
L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYyAgICAgfCAgODcgKysrKy0tLS0tLS0tLS0KPiAg
YXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20va2V4ZWMuaCAgICAgICAgIHwgICAzICstCj4gIGFy
Y2gvbG9vbmdhcmNoL2tlcm5lbC9rZXhlY19lZmkuYyAgICAgICAgICB8ICAxNSArKy0KPiAgYXJj
aC9sb29uZ2FyY2gva2VybmVsL2tleGVjX2VsZi5jICAgICAgICAgIHwgICAzICstCj4gIGFyY2gv
bG9vbmdhcmNoL2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYyB8ICA4MCArKysrKy0tLS0tLS0t
Cj4gIGFyY2gvcG93ZXJwYy9rZXhlYy9lbGZfNjQuYyAgICAgICAgICAgICAgICB8ICAgOSArLQo+
ICBhcmNoL3Bvd2VycGMva2V4ZWMvZmlsZV9sb2FkXzY0LmMgICAgICAgICAgfCAgMTggKy0tCj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va2V4ZWMuaCAgICAgICAgICAgICB8ICAgNCArLQo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9rZXhlY19lbGYuYyAgICAgICAgICAgICAgfCAgIDMgKy0KPiAgYXJj
aC9yaXNjdi9rZXJuZWwva2V4ZWNfaW1hZ2UuYyAgICAgICAgICAgIHwgICAzICstCj4gIGFyY2gv
cmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jICAgICB8ICA4MyArKysrLS0tLS0tLS0t
LQo+ICBhcmNoL3g4Ni9rZXJuZWwvY3Jhc2guYyAgICAgICAgICAgICAgICAgICAgfCAgMjUgKy0t
LS0KPiAgYXJjaC94ODYva2VybmVsL2tleGVjLWJ6aW1hZ2U2NC5jICAgICAgICAgIHwgICA4ICst
Cj4gIGFyY2gveDg2L2tlcm5lbC9tYWNoaW5lX2tleGVjXzY0LmMgICAgICAgICB8ICAgNCAtCj4g
IGluY2x1ZGUvbGludXgva2V4ZWMuaCAgICAgICAgICAgICAgICAgICAgICB8ICAxNCArKysKPiAg
a2VybmVsL2tleGVjX2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDI1ICsrKy0tCj4g
IGtlcm5lbC9rZXhlY19maWxlLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDEyNSArKysrKysr
KysrKysrKysrKysrKysKPiAgMTkgZmlsZXMgY2hhbmdlZCwgMjU0IGluc2VydGlvbnMoKyksIDI3
NCBkZWxldGlvbnMoLSkKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
