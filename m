Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B94C48285
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srlMv41vAPltiHJItT3n8raUgkf5AwQQIly0d/T7hp4=; b=zfHxEX3f2aoBAm
	z5uYuFKrkiPE5aM0LP7iZv5ehZOKDlPjsD3Lw/TXsj0sdWnlTPFhirSFNDjuc8MyBg5Dck8Z9h1q0
	v/bYSY0cgne67i2KLMkXka41Kn8fot2ZhIVLlyZHNWjuljPeDgKYJTxxUwjHbU1zj9xl8dbayJnFP
	hic2SZFp8cWZvx1/GKn/f1zKrxoCY0N8Dxud+RqMVyWOTeOMWv2fpoeelCbndhJ3BhuL8qCbthm1D
	tLsLOkVm34zbVQMWA2SJtyN1XiEqAKzD+n/9iO7bwJSv0x0qpFy5xJajKSDOD0N6f41/W30ILxHwA
	5ftsmcHkEDMypKtJGwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrzu-0000000HaKw-0cGD;
	Tue, 30 Jan 2024 17:34:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrzr-0000000HaHz-0HYa
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 17:34:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4D57BCE1B80;
	Tue, 30 Jan 2024 17:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F812C43390;
	Tue, 30 Jan 2024 17:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706636044;
	bh=s+uGeMFk7/OILlMudrkwvEoRpuM0V4ZOhDV+SZXg1g8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cFUO+/VMhG3RC9Ka0Gh3nWa0amhgUiQukJoILGFPB2A+OfsbZeimcRiaZDCoeXfCU
	 ZMkmhAtmLVm7i6cL80TaJxnpFraWLvTUBqnD8Ah9fB1qiF5k2xCxLWS9Jtz9U9D+rR
	 EgaJQD/PKxnHjuAv8Gt/eefcdxfoDOYb8lMWXZVAP57XQe41FonRBiLyzs9bgD6Diz
	 lbZ/B2tI7JaoaII9Y/CSTNXeEmEq3p5+7rpA3o5Y/XI1nfgTF6Ic+ipep8nFk3zTD0
	 Aj7Alw6s1bFYdN/jxL1R69WS4OAxOO0Q/goQAUA3QZIlj+5wfKJdWCEtZr/xw6i/pg
	 pxBMcsO5Wv10A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huawei.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong
 Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH RESEND bpf-next v3 4/6] riscv, bpf: Add necessary Zbb
 instructions
In-Reply-To: <b1bf2bc8-870d-40a4-9ad2-2b4ced34c43f@huawei.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <20240115131235.2914289-5-pulehui@huaweicloud.com>
 <871qa2zog6.fsf@all.your.base.are.belong.to.us>
 <03ebc63f-7b96-4a70-ad10-a4ffc1d5b1cc@huawei.com>
 <0b2bb6aa-e114-157b-94d1-4acb091b48b8@iogearbox.net>
 <8734ufwdic.fsf@all.your.base.are.belong.to.us>
 <b1bf2bc8-870d-40a4-9ad2-2b4ced34c43f@huawei.com>
Date: Tue, 30 Jan 2024 18:34:01 +0100
Message-ID: <87o7d2ohdi.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_093407_480851_85101A30 
X-CRM114-Status: GOOD (  12.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4gd3JpdGVzOgoKPiBPbiAyMDI0LzEvMzAgMTQ6
MTgsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IERhbmllbCBCb3JrbWFubiA8ZGFuaWVsQGlvZ2Vh
cmJveC5uZXQ+IHdyaXRlczoKPj4gCj4+PiBPbiAxLzI5LzI0IDEwOjEzIEFNLCBQdSBMZWh1aSB3
cm90ZToKPj4+PiBPbiAyMDI0LzEvMjggMToxNiwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4+Pj4g
UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4+Pj4+Cj4+Pj4+PiBG
cm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+Pj4+Pj4KPj4+Pj4+IEFkZCBuZWNl
c3NhcnkgWmJiIGluc3RydWN0aW9ucyBpbnRyb2R1Y2VkIGJ5IFswXSB0byByZWR1Y2UgY29kZSBz
aXplIGFuZAo+Pj4+Pj4gaW1wcm92ZSBwZXJmb3JtYW5jZSBvZiBSVjY0IEpJVC4gTWVhbndoaWxl
LCBhIHJ1bnRpbWUgZGV0ZXRlZCBoZWxwZXIgaXMKPj4+Pj4+IGFkZGVkIHRvIGNoZWNrIHdoZXRo
ZXIgdGhlIENQVSBzdXBwb3J0cyBaYmIgaW5zdHJ1Y3Rpb25zLgo+Pj4+Pj4KPj4+Pj4+IExpbms6
IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1iaXRtYW5pcC9yZWxlYXNlcy9kb3dubG9h
ZC8xLjAuMC9iaXRtYW5pcC0xLjAuMC0zOC1nODY1ZTdhNy5wZGYgWzBdCj4+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiAg
wqAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPj4+Pj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+Pj4+
Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmggYi9hcmNoL3Jp
c2N2L25ldC9icGZfaml0LmgKPj4+Pj4+IGluZGV4IGUzMDUwMWI0NmY4Zi4uNTFmNmQyMTQwODZm
IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oCj4+Pj4+PiArKysg
Yi9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmgKPj4+Pj4+IEBAIC0xOCw2ICsxOCwxMSBAQCBzdGF0
aWMgaW5saW5lIGJvb2wgcnZjX2VuYWJsZWQodm9pZCkKPj4+Pj4+ICDCoMKgwqDCoMKgIHJldHVy
biBJU19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0FfQyk7Cj4+Pj4+PiAgwqAgfQo+Pj4+Pj4gK3N0
YXRpYyBpbmxpbmUgYm9vbCBydnpiYl9lbmFibGVkKHZvaWQpCj4+Pj4+PiArewo+Pj4+Pj4gK8Kg
wqDCoCByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pCQikgJiYgcmlzY3ZfaGFz
X2V4dGVuc2lvbl9saWtlbHkoUklTQ1ZfSVNBX0VYVF9aQkIpOwo+Pj4+Pgo+Pj4+PiBIbW0sIEkn
bSB0aGlua2luZyBhYm91dCB0aGUgSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pCQikgc2Vt
YW50aWNzCj4+Pj4+IGZvciBhIGtlcm5lbCBKSVQgY29tcGlsZXIuCj4+Pj4+Cj4+Pj4+IElTX0VO
QUJMRUQoQ09ORklHX1JJU0NWX0lTQV9aQkIpIGFmZmVjdHMgdGhlIGtlcm5lbCBjb21waWxlciBm
bGFncy4KPj4+Pj4gU2hvdWxkIGl0IGJlIGVub3VnaCB0byBqdXN0IGhhdmUgdGhlIHJ1bi10aW1l
IGNoZWNrPyBTaG91bGQgYSBrZXJuZWwKPj4+Pj4gYnVpbHQgdy9vIFpiYiBiZSBhYmxlIHRvIGVt
aXQgWmJiIGZyb20gdGhlIEpJVD8KPj4+Pgo+Pj4+IE5vdCBlbm91Z2gsIGJlY2F1c2UgcmlzY3Zf
aGFzX2V4dGVuc2lvbl9saWtlbHkoUklTQ1ZfSVNBX0VYVF9aQkIpIGlzCj4+Pj4gYSBwbGF0Zm9y
bSBjYXBhYmlsaXR5IGNoZWNrLCBhbmQgdGhlIG90aGVyIG9uZSBpcyBhIGtlcm5lbCBpbWFnZQo+
Pj4+IGNhcGFiaWxpdHkgY2hlY2suIFdlIGNhbiBwYXNzIHRoZSBjaGVjawo+Pj4+IHJpc2N2X2hh
c19leHRlbnNpb25fbGlrZWx5KFJJU0NWX0lTQV9FWFRfWkJCKSB3aGVuCj4+Pj4gQ09ORklHX1JJ
U0NWX0lTQV9aQkI9bi4gQW5kIG15IGxvY2FsIHRlc3QgcHJvdmUgaXQuCj4+IAo+PiBXaGF0IEkn
bSB0cnlpbmcgdG8gc2F5IChhbmQgZHJldyBhcyB3ZWxsIGluIHRoZSBvdGhlciByZXBseSkgaXMg
dGhhdAo+PiAicmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtlbHkoUklTQ1ZfSVNBX0VYVF9aQkIpIHdo
ZW4KPj4gQ09ORklHX1JJU0NWX0lTQV9aQkI9biIgc2hvdWxkIGFsc28gbWFrZSB0aGUgSklUIGVt
aXQgWmJiIGluc25zLiBUaGUKPj4gcGxhdGZvcm0gY2hlY2sgc2hvdWxkIGJlIHN1ZmZpY2llbnQu
Cj4KPiBPb2gsIHRoaXMgaXMgcmVhbGx5IGJleW9uZCBteSBleHBlY3RhdGlvbi4gVGhlIHRlc3Rf
cHJvZ3MgY2FuIHBhc3Mgd2hlbiAKPiB3aXRoIG9ubHkgcGxhdGZvcm0gY2hlY2sgYW5kIGl0IGNh
biByZWNvZ25pemUgdGhlIHpiYiBpbnN0cnVjdGlvbnMuIE5vdyAKPiBJIGtub3cgaXQuIFNvcnJ5
IGZvciBtaXNsZWFkaW5nLvCfmYEKPgo+IEN1cmlvdXMgaWYgQ09ORklHX1JJU0NWX0lTQV9aQkIg
aXMgc3RpbGwgbmVjZXNzYXJ5PwoKWW91IGRvbid0IG5lZWQgSVNfRU5BQkxFRChDT05GSUdfUklT
Q1ZfSVNBX1pCQikgZm9yIHRoZSBKSVQsIGJ1dCB0aGUKa2VybmVsIG5lZWRzIGl0LgoKRmVlbCBm
cmVlIHRvIGZvbGxvdyB1cCB3aXRoIGEgcGF0Y2ggdG8gcmVtb3ZlIGl0LgoKCkNoZWVycywKQmrD
tnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
