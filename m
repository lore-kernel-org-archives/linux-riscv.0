Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD0C606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 02:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qoQ53KG1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ej+0fabs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y8NmQ3ROvkYFjLQhgK3GeJzEXzolpD+jak3W0GhfYpg=; b=qoQ53KG1ms6njJbmhfiG2TMBrx
	TH4rx5Myo4MnWiU7F1mG+lTQwJnZ8IVboe1HKZ71MM4DEgvVJyzEP68+Y/Cn7Ebgeqb8jJcirIIld
	9uZIllx7OuZJi2s+OPmp123x3kfyJESY2FEhDsrlZ7AqjR+DLadl3LqsUraHny7TJ7pt0nsIjjXpe
	mjQD07jpZiQ8tBPCuEnfry/MFvESt0goYWMVYDoXxqDVZSx6UacJKjxpuujkWR1TJgnpAx3MXSbys
	rhjpvijZ+9Or+P/9ASz7jDgSnO26TlG3PnCQbw/7b8fTHG2gVmrHH46yjNErwpJj3x0xbZxEjyj7x
	6lrAyjSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWm3t-0000000Eo68-20sh;
	Fri, 27 Nov 2026 02:51:45 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWm3o-0000000Eo4f-3Nsu;
	Fri, 27 Nov 2026 02:51:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+E04+1aBGfLLVpwGpqqzD9wY4oSras1xIIjdVXw1Xf4=;
	b=ej+0fabsQIXeqdncA0bubFcuvkNmxkRJBYp5ZzHUdRXVaNK3kQGFUUshRhUPEsOAG65yMY32s
	MdQ8zcRYTEay/Bx9oDxZLdX+dStvMb3ZlVAIovzcHgsDk2OOEW12vqVRfCQf0C7+lm6IwRbKIuy
	WGoPDhAEM4F8V2D+AlWc0tU=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jbHwR0X5LznTVd;
	Fri, 27 Nov 2026 10:50:47 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1550340578;
	Fri, 27 Nov 2026 10:51:35 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 27 Nov
 2026 10:51:32 +0800
Message-ID: <83aa091e-81c4-408a-af67-18e89b19aca0@huawei.com>
Date: Fri, 27 Nov 2026 10:51:32 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/11] kexec: Rework segment loading and fix CMA
 retries
To: Mike Rapoport <rppt@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<leitao@debian.org>, <yeoreum.yun@arm.com>, <mpilaniy@redhat.com>,
	<robh@kernel.org>, <coiby.xu@gmail.com>, <Yeking@red54.com>,
	<prudo@redhat.com>, <brads@mainlining.org>, <sourabhjain@linux.ibm.com>,
	<mkchauras@gmail.com>, <blum@kernel.org>, <adityag@linux.ibm.com>,
	<qirui.001@bytedance.com>, <hui.wang@canonical.com>,
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
 <584a0e7a-230e-4a95-9e09-a1d6499a6ea9@huawei.com>
 <awgmlnibFRpjgG2a@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <awgmlnibFRpjgG2a@kernel.org>
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_185141_200942_2E1EA27E 
X-CRM114-Status: GOOD (  21.29  )
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

CgrlnKggMjAyNi8xMS8yNiAyMDozMSwgTWlrZSBSYXBvcG9ydCDlhpnpgZM6Cj4gSGkgSmluamll
LAoKSGkgTWlrZSwKCj4gCj4gT24gTW9uLCBOb3YgMjMsIDIwMjYgYXQgMDM6MTA6NTNQTSArMDgw
MCwgSmluamllIFJ1YW4gd3JvdGU6Cj4+Cj4+IOWcqCAyMDI2LzExLzEyIDIxOjM0LCBKaW5qaWUg
UnVhbiDlhpnpgZM6Cj4+PiBBUk02NCwgTG9vbmdBcmNoLCBSSVNDLVYsIHg4NiBhbmQgcG93ZXJw
YyBidWlsZCB0aGUgZWxmIGNvcmUgaGVhZGVyCj4+PiBhbmQgcGxhY2UgaXQgdG9nZXRoZXIgd2l0
aCB0aGUgaW5pdHJkIGFuZCB0aGUgRFRCIHdpdGggYWxtb3N0IGlkZW50aWNhbAo+Pj4gY29kZS4K
Pj4+Cj4+PiBUaGlzIHNlcmllcyByZXdvcmtzIHRoYXQgcGF0aCBpbnRvIGNvbW1vbiBoZWxwZXJz
IHRoYXQgdGhlIGFyY2hpdGVjdHVyZXMKPj4+IHJldXNlLCBhbmQgZml4ZXMgdGhlIENNQSBwYWdl
IGFuZCBlbGYgY29yZSBoZWFkZXIgbGVha3MgaW4gdGhlIGFybTY0Cj4+PiBhbmQgTG9vbmdBcmNo
IHBsYWNlbWVudCByZXRyeSBsb29wcy4KPj4+Cj4+PiBUaGUgcGF0Y2ggb3JnYW5pemF0aW9uIGlz
IGFzIGZvbGxvd3M6Cj4+Pgo+Pj4gLSBQYXRjaCAxIG1vdmVzIHRoZSByZWxlYXNlIG9mIHRoZSBl
bGYgY29yZSBoZWFkZXIgaW50byB0aGUgZ2VuZXJpYwo+Pj4gICBwb3N0LWxvYWQgY2xlYW51cCwg
c28gdGhhdCB0aGUgYXJjaGl0ZWN0dXJlcyBubyBsb25nZXIgZnJlZSBpdAo+Pj4gICB0aGVtc2Vs
dmVzLgo+Pj4KPj4+IC0gUGF0Y2ggMiBhZGRzIHRoZSBjb21tb24gaGVscGVycwo+Pj4KPj4+IC0g
UGF0Y2hlcyAzLTcgY29udmVydCBhcm02NCwgTG9vbmdBcmNoLCBSSVNDLVYsIFg4NiBhbmQgUG93
ZXJwYyB0bwo+Pj4gICByZXVzZSB0aGUgY29tbW9uIGhlbHBlcnMKPj4+Cj4+PiAtIFBhdGNoZXMg
OC0xMSBmaXggdGhlIENNQSBwYWdlcyBsZWFrZWQgYnkgdGhlIHJldHJ5IGxvb3BzIGFuZAo+Pj4g
ICB0aGUgbG9vcCB0aGF0IG1ha2VzIG5vIHByb2dyZXNzCj4+Pgo+Pj4gVGVzdGVkIHdpdGgga2V4
ZWNfZmlsZV9sb2FkKCkgb24gYXJtNjQsIExvb25nQXJjaCwgUklTQy1WLCBYODYgYW5kCj4+PiBQ
b3dlcnBjIHVuZGVyIFFFTVUsIGluY2x1ZGluZyB0aGUgQ01BIHJldHJ5IHBhdGhzLCBsb2FkaW5n
IGEgY3Jhc2gKPj4+IGtlcm5lbCBhbmQgYm9vdGluZyB0aGUgc2Vjb25kIGtlcm5lbCwgd2l0aCB0
aGUgYWdlbnQgaGVscC4KPj4+Cj4+PiBUaGlzIHNlcmllcyBpcyBhbHNvIGF2YWlsYWJsZSBhdDoK
Pj4+IAlodHRwczovL2dpdGh1Yi5jb20vcnVhbmppbmppZS1lbmcvbGludXgvdHJlZS9rZXhlY19y
ZXdvcmtfY21hX2J1Z2Z4X3Y5Cj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2ODoKPj4+IC0gUmV3b3JrIHRo
ZSBjb21tb24gY29kZSBhcyBNaWtlIHN1Z2dlc3RlZDogdGhlIGNvcmUgcHJvdmlkZXMgYnVpbGRp
bmcKPj4+ICAgYmxvY2tzIGFuZCB0aGUgYXJjaGl0ZWN0dXJlcyB1c2VzIHRoZW0gKE1pa2UpCj4+
PiAtIEJ1aWxkIHRoZSBlbGYgY29yZSBoZWFkZXIgb25jZSBhbmQgb25seSBwbGFjZSBpdCBvbiB0
aGUgcmV0cmllcyAoTWlrZSkKPj4+IC0gS2VlcCB0aGUgc2VnbWVudCBvcmRlciBhbmQgdGhlIGFy
Y2ggcGxhY2VtZW50IHBvbGljeSB1bmNoYW5nZWQgKE1pa2UpCj4+PiAtIENvbnZlcnQgeDg2IGFu
ZCBwb3dlcnBjIGFzIHdlbGwKPj4+IC0gTW92ZSB0aGUgQ01BIGZpeGVzIHRvIHRoZSBlbmQgb2Yg
dGhlIHNlcmllcyAoTWlrZSkKPj4KPj4gSGkgTWlrZSwKPj4KPj4gRG9lcyB0aGlzIHJlZmFjdG9y
aW5nIG5vdyBtZWV0IHlvdXIgZXhwZWN0YXRpb25zPwo+IAo+IEkgb25seSBoYWQgdGltZSBmb3Ig
YSBxdWljayBza2ltLCBhbmQgb3ZlcmFsbCBpdCBsb29rcyBnb29kIHRvIG1lLgo+IAo+IFRoZSBv
bmx5IHRoaW5nIHRoYXQgc3Rvb2Qgb3V0IHdhcyBrZXhlY19hZGRfZmR0KCkgaW4ga2V4ZWMva2V4
ZWNfZmlsZS5jLgo+IEkgYmVsaWV2ZSBkcml2ZXJzL29mL2tleGVjLmMgaXMgYSBiZXR0ZXIgcGxh
Y2UgZm9yIGl0LgoKSSBnb3QgaXQsIG9mX2tleGVjX2FsbG9jX2FuZF9zZXR1cF9mZHQoKSBhbHNv
IGhlcmUsIGFuZCBpdCB3aWxsIGJlCmJldHRlciB0byBuYW1lIHRoZSBoZWxwZXIgb2Zfa2V4ZWNf
YWRkX2ZkdCgpLgoKPiAgCj4+IEluIG15IHZpZXcsIHRoZXJlIGlzIHN0aWxsIGFuIGlzc3VlIHdv
cnRoIGRpc2N1c3Npbmc6IHNob3VsZCB3ZSByZXNlcnZlCj4+IGZvciB0aGUgY3Jhc2ggaG90cGx1
ZyBlbGYgY29yZSBoZWFkZXIgaW4gdGhlIGZyYW1ld29yayBjb2RlCj4+IGtleGVjX2FkZF9lbGZf
Y29yZV9oZWFkZXIoKSwgb3Igb25seSBpbXBsZW1lbnQgaXQgaW4gdGhlIHg4Ngo+PiBhcmNoaXRl
Y3R1cmUgY29kZSwgYW5kIGNvbnNpZGVyIGdlbmVyYWxpemluZyBpdCBhZnRlciB0aGUgQVJNNjQK
Pj4gaW1wbGVtZW50YXRpb24gaXMgYXZhaWxhYmxlPwo+IAo+IEkgdGhpbmsgaXQncyBiZXR0ZXIg
dG8ga2VlcCBpdCBpbiB4ODYgZm9yIG5vdyBhbmQgZ2VuZXJhbGl6ZSBsYXRlci4KCk9LLCBleHBl
Y3QgdGhpcyB3aWxsIG1ha2UgdGhlIGVsZiBjb3JlIGhlYWRlciBtb3JlIGNsZWFuZXIgYW5kIHNp
bXBsaWZ5CnRoZSBjb2RlLiBJIHdpbGwgZm9sbG93IHRoZSBpbnN0cnVjdGlvbnMuIFdpbGwgYWxz
byBhZGRyZXNzIHRoZSBpc3N1ZXMKcG9pbnRlZCBvdXQgYnkgU2FzaGlrby4KClRoYW5rcwpKaW5q
aWUKCj4gIAo+PiBCZXN0IHJlZ2FyZHMsCj4+IEppbmppZQo+Pgo+Pgo+Pj4gLSBMaW5rIHRvIHY3
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjEwMjYwNzUyMDEuNjk5NTUwLTEtcnVh
bmppbmppZUBodWF3ZWkuY29tLwo+Pj4KPj4+IFByZXZpb3VzIFZlcnNpb25zIGFyZSBhcyBiZWxv
dzoKPj4+IC0gdjY6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDkyMTA5MDQ1MC44
MDc1NzUtMS1ydWFuamluamllQGh1YXdlaS5jb20vCj4+PiAtIHY1OiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNjA5MTgxMDA0NDIuMzg0MTEzNS0xLXJ1YW5qaW5qaWVAaHVhd2VpLmNv
bS8KPj4+IC0gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDkwNzEyNTQwNC45
MjIxMjMtMS1ydWFuamluamllQGh1YXdlaS5jb20vCj4+PiAtIHYzOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNjA4MjYwOTI1NDEuMzkwNTkzMy0xLXJ1YW5qaW5qaWVAaHVhd2VpLmNv
bS8KPj4+IC0gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDcyOTAzMTIzNS4y
ODQwMjU1LTEtcnVhbmppbmppZUBodWF3ZWkuY29tLwo+Pj4gLSB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjYwNzIzMTMxMjQyLjE1Mzc2MzMtMS1ydWFuamluamllQGh1YXdlaS5j
b20vI3QKPj4+Cj4+PiBKaW5qaWUgUnVhbiAoMTEpOgo+Pj4gICBrZXhlYzogRnJlZSB0aGUgZWxm
IGNvcmUgaGVhZGVyIGluIGtpbWFnZV9maWxlX3Bvc3RfbG9hZF9jbGVhbnVwKCkKPj4+ICAga2V4
ZWM6IEFkZCBoZWxwZXJzIHRvIGxvYWQgdGhlIGVsZiBjb3JlIGhlYWRlciwgaW5pdHJkIGFuZCBG
RFQKPj4+ICAgYXJtNjQ6IGtleGVjX2ZpbGU6IExvYWQgdGhlIG90aGVyIHNlZ21lbnRzIHdpdGgg
Y29tbW9uIGhlbHBlcnMKPj4+ICAgTG9vbmdBcmNoOiBrZXhlY19maWxlOiBMb2FkIHRoZSBvdGhl
ciBzZWdtZW50cyB3aXRoIGNvbW1vbiBoZWxwZXJzCj4+PiAgIHJpc2N2OiBrZXhlY19maWxlOiBM
b2FkIHRoZSBleHRyYSBzZWdtZW50cyB3aXRoIGNvbW1vbiBoZWxwZXJzCj4+PiAgIHg4Njoga2V4
ZWNfZmlsZTogVXNlIHRoZSBjb21tb24gc2VnbWVudCBoZWxwZXJzCj4+PiAgIHBvd2VycGM6IGtl
eGVjX2ZpbGU6IFVzZSB0aGUgY29tbW9uIHNlZ21lbnQgaGVscGVycwo+Pj4gICBrZXhlYzogRXh0
cmFjdCBrZXhlY19mcmVlX3NlZ21lbnRfY21hKCkgZnJvbSBraW1hZ2VfZnJlZV9jbWEoKQo+Pj4g
ICBrZXhlYzogQWRkIGtleGVjX3JvbGxiYWNrX3NlZ21lbnRzKCkgaGVscGVyCj4+PiAgIGFybTY0
OiBrZXhlY19maWxlOiBGaXggQ01BIHNlZ21lbnQgcGxhY2VtZW50IHJldHJpZXMKPj4+ICAgTG9v
bmdBcmNoOiBrZXhlY19maWxlOiBGaXggQ01BIHNlZ21lbnQgcGxhY2VtZW50IHJldHJpZXMKPj4+
Cj4+PiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9rZXhlYy5oICAgICAgICAgICAgIHwgICA0ICst
Cj4+PiAgYXJjaC9hcm02NC9rZXJuZWwva2V4ZWNfaW1hZ2UuYyAgICAgICAgICAgIHwgIDE1ICsr
LQo+Pj4gIGFyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jICAgICB8ICA4NyAr
KysrLS0tLS0tLS0tLQo+Pj4gIGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL2tleGVjLmggICAg
ICAgICB8ICAgMyArLQo+Pj4gIGFyY2gvbG9vbmdhcmNoL2tlcm5lbC9rZXhlY19lZmkuYyAgICAg
ICAgICB8ICAxNSArKy0KPj4+ICBhcmNoL2xvb25nYXJjaC9rZXJuZWwva2V4ZWNfZWxmLmMgICAg
ICAgICAgfCAgIDMgKy0KPj4+ICBhcmNoL2xvb25nYXJjaC9rZXJuZWwvbWFjaGluZV9rZXhlY19m
aWxlLmMgfCAgODAgKysrKystLS0tLS0tLQo+Pj4gIGFyY2gvcG93ZXJwYy9rZXhlYy9lbGZfNjQu
YyAgICAgICAgICAgICAgICB8ICAgOSArLQo+Pj4gIGFyY2gvcG93ZXJwYy9rZXhlYy9maWxlX2xv
YWRfNjQuYyAgICAgICAgICB8ICAxOCArLS0KPj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tl
eGVjLmggICAgICAgICAgICAgfCAgIDQgKy0KPj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9rZXhlY19l
bGYuYyAgICAgICAgICAgICAgfCAgIDMgKy0KPj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9rZXhlY19p
bWFnZS5jICAgICAgICAgICAgfCAgIDMgKy0KPj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5l
X2tleGVjX2ZpbGUuYyAgICAgfCAgODMgKysrKy0tLS0tLS0tLS0KPj4+ICBhcmNoL3g4Ni9rZXJu
ZWwvY3Jhc2guYyAgICAgICAgICAgICAgICAgICAgfCAgMjUgKy0tLS0KPj4+ICBhcmNoL3g4Ni9r
ZXJuZWwva2V4ZWMtYnppbWFnZTY0LmMgICAgICAgICAgfCAgIDggKy0KPj4+ICBhcmNoL3g4Ni9r
ZXJuZWwvbWFjaGluZV9rZXhlY182NC5jICAgICAgICAgfCAgIDQgLQo+Pj4gIGluY2x1ZGUvbGlu
dXgva2V4ZWMuaCAgICAgICAgICAgICAgICAgICAgICB8ICAxNCArKysKPj4+ICBrZXJuZWwva2V4
ZWNfY29yZS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjUgKysrLS0KPj4+ICBrZXJuZWwv
a2V4ZWNfZmlsZS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAxMjUgKysrKysrKysrKysrKysr
KysrKysrCj4+PiAgMTkgZmlsZXMgY2hhbmdlZCwgMjU0IGluc2VydGlvbnMoKyksIDI3NCBkZWxl
dGlvbnMoLSkKPj4+Cj4+Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
