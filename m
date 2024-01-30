Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3378C47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 06:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QAbg3JquTzxA79FM0lbPXOj6b4g2ZhL+ZK2c6mk/UI=; b=4VEZ9to4TWKoTV
	tdLmPhUQaVsyk/ZWsLYzVC57IeFkpWheiZo3UaFWtLVI08iUNOxNArF95VQHgLfyKOisQadwQ4Cp2
	VZF7RtFZntmLxUfKXrAhix84/v9fPXm4DzDv6NNeo2MxBT/mi7Jay+E6Q0wtCXjXxnTO2TjMbtZq6
	ZFvdBghdnlrn0y3oGWLfxozsJVNYqZFAM73o29ZQArDOGHIYAartFYex+j+IxWJtbFzhUwq3f1dIm
	YhsKhGgVtdGJREPMF2kJeere2u60WHMiqCbcG6rZ+X4T0dmzGBKOtePllhpxdvGXd/3RZfDJxiIa4
	biVyoQPtQKWbfoxzIZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhRm-0000000FOqC-0ns4;
	Tue, 30 Jan 2024 06:18:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhRj-0000000FOpR-1F4T
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 06:18:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A58FECE0C71;
	Tue, 30 Jan 2024 06:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DB9C433C7;
	Tue, 30 Jan 2024 06:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706595486;
	bh=uC/25PJLPO0KFx/aHGxXZaji9fO699iLqEIMG/M6pDw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Uk+OnDuWzZfYI+lWmR+aAiq/v7hw++v1we3wgr4v9BHIHs0RvTU4Iz9QgL3cg2PPo
	 18guaJhjsagoto29T5vhYdRLGpt9XSt1B3Wc3td9lkNIRre4M4bVnpa9OPY2XT19+v
	 LVhL4FqSmWPkKgVh51zPqCbY10K3FGyY/2aVpi5Dmi5Wd59YR/1tbQn+k5XZOq6v0m
	 dSbu2hSqqnNCuT19vOTK2NwPLW1nHtNyvp8Q/1GQBw1HK+VyIvDnV3LkhqJKUNgJNm
	 SGgW5ZZMJQLzDRlursS//ANB/fufYTtjkT4AaNdDKNZaKb9dScTxMzjondoDPBkgvb
	 pvU+rid6/K4qw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>, Pu Lehui <pulehui@huawei.com>,
 Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley
 <conor@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH RESEND bpf-next v3 4/6] riscv, bpf: Add necessary Zbb
 instructions
In-Reply-To: <0b2bb6aa-e114-157b-94d1-4acb091b48b8@iogearbox.net>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <20240115131235.2914289-5-pulehui@huaweicloud.com>
 <871qa2zog6.fsf@all.your.base.are.belong.to.us>
 <03ebc63f-7b96-4a70-ad10-a4ffc1d5b1cc@huawei.com>
 <0b2bb6aa-e114-157b-94d1-4acb091b48b8@iogearbox.net>
Date: Tue, 30 Jan 2024 07:18:03 +0100
Message-ID: <8734ufwdic.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_221811_708271_C32A0056 
X-CRM114-Status: GOOD (  13.18  )
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

RGFuaWVsIEJvcmttYW5uIDxkYW5pZWxAaW9nZWFyYm94Lm5ldD4gd3JpdGVzOgoKPiBPbiAxLzI5
LzI0IDEwOjEzIEFNLCBQdSBMZWh1aSB3cm90ZToKPj4gT24gMjAyNC8xLzI4IDE6MTYsIEJqw7Zy
biBUw7ZwZWwgd3JvdGU6Cj4+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdy
aXRlczoKPj4+Cj4+Pj4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPj4+Pgo+
Pj4+IEFkZCBuZWNlc3NhcnkgWmJiIGluc3RydWN0aW9ucyBpbnRyb2R1Y2VkIGJ5IFswXSB0byBy
ZWR1Y2UgY29kZSBzaXplIGFuZAo+Pj4+IGltcHJvdmUgcGVyZm9ybWFuY2Ugb2YgUlY2NCBKSVQu
IE1lYW53aGlsZSwgYSBydW50aW1lIGRldGV0ZWQgaGVscGVyIGlzCj4+Pj4gYWRkZWQgdG8gY2hl
Y2sgd2hldGhlciB0aGUgQ1BVIHN1cHBvcnRzIFpiYiBpbnN0cnVjdGlvbnMuCj4+Pj4KPj4+PiBM
aW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYml0bWFuaXAvcmVsZWFzZXMvZG93
bmxvYWQvMS4wLjAvYml0bWFuaXAtMS4wLjAtMzgtZzg2NWU3YTcucGRmIFswXQo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAg
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaCBiL2FyY2gvcmlzY3YvbmV0L2Jw
Zl9qaXQuaAo+Pj4+IGluZGV4IGUzMDUwMWI0NmY4Zi4uNTFmNmQyMTQwODZmIDEwMDY0NAo+Pj4+
IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvbmV0
L2JwZl9qaXQuaAo+Pj4+IEBAIC0xOCw2ICsxOCwxMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcnZj
X2VuYWJsZWQodm9pZCkKPj4+PiDCoMKgwqDCoMKgIHJldHVybiBJU19FTkFCTEVEKENPTkZJR19S
SVNDVl9JU0FfQyk7Cj4+Pj4gwqAgfQo+Pj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgcnZ6YmJfZW5h
YmxlZCh2b2lkKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdf
UklTQ1ZfSVNBX1pCQikgJiYgcmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtlbHkoUklTQ1ZfSVNBX0VY
VF9aQkIpOwo+Pj4KPj4+IEhtbSwgSSdtIHRoaW5raW5nIGFib3V0IHRoZSBJU19FTkFCTEVEKENP
TkZJR19SSVNDVl9JU0FfWkJCKSBzZW1hbnRpY3MKPj4+IGZvciBhIGtlcm5lbCBKSVQgY29tcGls
ZXIuCj4+Pgo+Pj4gSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pCQikgYWZmZWN0cyB0aGUg
a2VybmVsIGNvbXBpbGVyIGZsYWdzLgo+Pj4gU2hvdWxkIGl0IGJlIGVub3VnaCB0byBqdXN0IGhh
dmUgdGhlIHJ1bi10aW1lIGNoZWNrPyBTaG91bGQgYSBrZXJuZWwKPj4+IGJ1aWx0IHcvbyBaYmIg
YmUgYWJsZSB0byBlbWl0IFpiYiBmcm9tIHRoZSBKSVQ/Cj4+IAo+PiBOb3QgZW5vdWdoLCBiZWNh
dXNlIHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KFJJU0NWX0lTQV9FWFRfWkJCKSBpcwo+PiBh
IHBsYXRmb3JtIGNhcGFiaWxpdHkgY2hlY2ssIGFuZCB0aGUgb3RoZXIgb25lIGlzIGEga2VybmVs
IGltYWdlCj4+IGNhcGFiaWxpdHkgY2hlY2suIFdlIGNhbiBwYXNzIHRoZSBjaGVjawo+PiByaXNj
dl9oYXNfZXh0ZW5zaW9uX2xpa2VseShSSVNDVl9JU0FfRVhUX1pCQikgd2hlbgo+PiBDT05GSUdf
UklTQ1ZfSVNBX1pCQj1uLiBBbmQgbXkgbG9jYWwgdGVzdCBwcm92ZSBpdC4KCldoYXQgSSdtIHRy
eWluZyB0byBzYXkgKGFuZCBkcmV3IGFzIHdlbGwgaW4gdGhlIG90aGVyIHJlcGx5KSBpcyB0aGF0
CiJyaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2VseShSSVNDVl9JU0FfRVhUX1pCQikgd2hlbgpDT05G
SUdfUklTQ1ZfSVNBX1pCQj1uIiBzaG91bGQgYWxzbyBtYWtlIHRoZSBKSVQgZW1pdCBaYmIgaW5z
bnMuIFRoZQpwbGF0Zm9ybSBjaGVjayBzaG91bGQgYmUgc3VmZmljaWVudC4KCj4gU28gaWYgSSB1
bmRlcnN0YW5kIHlvdSBjb3JyZWN0bHksIG9ubHkgcmVseWluZyBvbiB0aGUKPiByaXNjdl9oYXNf
ZXh0ZW5zaW9uX2xpa2VseShSSVNDVl9JU0FfRVhUX1pCQikgcGFydCB3b3VsZCBub3Qgd29yayAt
Cj4gaW93LCB0aGUgSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pCQikgaXMgbWFuZGF0b3J5
IGhlcmU/Cj4KPiBUaGFua3MsCj4gRGFuaWVsCj4KPiBQLnMuOiBHaXZlbiBCam9ybidzIHJldmll
dyBhbmQgdGVzdHMgSSB0b29rIHRoZSBzZXJpZXMgaW50byBicGYtbmV4dAo+IG5vdy4gVGhhbmtz
IGV2ZXJ5b25lIQoKVGhhbmtzISBZZXMsIHRoaXMgaXMgbWFpbmx5IGEgc2VtYW50aWMgZGlzY3Vz
c2lvbiwgYW5kIGl0IGNhbiBiZSBmdXJ0aGVyCnJlbGF4ZWQgbGF0ZXIgd2l0aCBhIGZvbGxvdyB1
cCAtLSBpZiBhcHBsaWNhYmxlLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
