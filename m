Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068C8C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 10:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ieSxG8ApCKk5H9Hi2FmeBHfsHUsvB2Q8XYM8dppYRq0=; b=m0saxN7p2nR43O
	N4ORBg6KiLnp2+bUfmMTRglU/9F2D+vsa3rdX94OkuH9Geee1+A8ISut51ff+10imnaOOsjavolXR
	DN667FArfmc+AbPfUGpU0PcYNhmUY7TjyPbHvzC0dJTWAMsK6Kfkw2keX/mRB5Hnno+1CQCfCMPhb
	MtpL5XIV3WSv8N8nHettMk4+QRocZQhpwSGCPatNEMbG940NjZn9vhKYB9nQpzdXdYX5VIOoGbGuc
	1+FuqocGvizS9JUsZSUxeIgJnBJUS4oLDkeDxtmBdkdSm/clFioUwHhpJ3FJqIZvR+39SidS5VWxN
	ZduP0edQSsLUjCVbsXKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkjb0-009s4x-30;
	Fri, 07 Apr 2023 10:45:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkjay-009s2a-0z
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Apr 2023 10:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V3O6U3NijuSxmCSL3Y4RjHUKwR36+zet6sBQoM4QlD4=; b=L5TYJLqmrLwU2lV8O4gfc+acMj
	OQp48NfEFzJUnAo5e3Q0n83PVLzMHnj9TZh/Rh3Cw9w3dQ0RRwfDLRAcTOyRpsMPSMtTcPLFEzcix
	bZlKzuFQHAxhhrqfki3F+DP2oI1NpYahqqlh+rvxHFsLxAFJ4vcB6q7S67OT48qcU7RiJPOyNN+LF
	kwY+HDtY4/+ifcchcLCvyexQhtwOJN6cBlR2tAlou256NiAfGcMzlGmg8gHuG40rV56bThdo+MU0s
	1vOuzbF4MZ7srrgpK/JXrQ6C8UPidbZ+Dzw27o8raJDpInncYWy5qBK+/u5u9lwFOZVHBCUL5SXSC
	D2eWw7dw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiAe-00AyuR-34
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 09:14:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1FA3E64E2F
	for <linux-riscv@lists.infradead.org>; Fri,  7 Apr 2023 09:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85ABCC4339E
	for <linux-riscv@lists.infradead.org>; Fri,  7 Apr 2023 09:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680858846;
	bh=WV4IWeqM+ed0Fg7yI/owkOWEtruJkfmor/YIydtdFHw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NIMrta5K8F7RwfmY8XFc9U41pbOm+mWz9Wiv1XFuD/dcang/LZi8tNcn5ZVh6BLTL
	 iAoSG0o10ADMJt9qVjklKr5+Hifw6cbVK/SyZZeNpZNEPeckwyg8f5ixdcCZiNVlOC
	 PRkyRsc+zWtxB7prLNNm/JOKXlp6cHb9CD2ovvl61LvAdlHE8v9h91zwkt8ka0dmRk
	 yCKtbd/nTqtlCa9sR0P4ClL1LBmaqDKycQpMJA3baLPLhzbdWWucja69YrcvFz88Fq
	 6n1SiR7sh2X07cgv8D1sy1KWYxIYkJ2Cs7xwYKgXVOU8p/yK1uCUsRVGymr9lm1t+4
	 SGRZa1qa4YUKA==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-942e6555947so161682166b.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Apr 2023 02:14:06 -0700 (PDT)
X-Gm-Message-State: AAQBX9dwGWGXemxj/v3/goEfuJHj8jeZQFI+FGE+BT6JC3bm5h+5RNmF
	vzAc852pe9DlyxeGUYOKOh6Gsh6bCQAlTJPdLeI=
X-Google-Smtp-Source: AKy350bBnr2qHBzKA/iAi2rCrLtqyZ+2uYCw7Ds3GEEgAKC1nvwHfpMA6FOtL9PCirMhrMB248uf2Dis77tUopJtjp0=
X-Received: by 2002:a05:6402:12c9:b0:4a0:e305:a0de with SMTP id
 k9-20020a05640212c900b004a0e305a0demr2384670edx.19.1680858844674; Fri, 07 Apr
 2023 02:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230222033021.983168-1-guoren@kernel.org> <87edp3loai.fsf@all.your.base.are.belong.to.us>
 <878rfblkee.fsf@all.your.base.are.belong.to.us> <2173635.1BCLMh4Saa@diego> <874jpzla20.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <874jpzla20.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 7 Apr 2023 17:13:53 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRuqtxiNMwH9T3gvHMSJ1EBAEtOXNvFoCufjJrQgqk6Dw@mail.gmail.com>
Message-ID: <CAJF2gTRuqtxiNMwH9T3gvHMSJ1EBAEtOXNvFoCufjJrQgqk6Dw@mail.gmail.com>
Subject: Re: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Conor Dooley <conor@kernel.org>, palmer@rivosinc.com, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Yipeng Zou <zouyipeng@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_101413_950075_3EEE0F63 
X-CRM114-Status: GOOD (  30.29  )
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

T24gU3VuLCBBcHIgMiwgMjAyMyBhdCAyOjQx4oCvQU0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPiB3cml0
ZXM6Cj4KPiA+IEFtIFNhbXN0YWcsIDEuIEFwcmlsIDIwMjMsIDE2OjU4OjAxIENFU1Qgc2Nocmll
YiBCasO2cm4gVMO2cGVsOgo+ID4+IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdy
aXRlczoKPiA+Pgo+ID4+ID4gKE5hcnJvd2luZyB0aGUgQ2MgbGlzdC4pCj4gPj4gPgo+ID4+ID4g
QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgo+ID4+ID4KPiA+PiA+Pj4+
ID4gPiA+IFRoaXMgaGFzIHVuZm9ydHVuYXRlbHkgYnJva2VuIGJvb3RpbmcgbXkgdXN1YWwgTkZT
IHJvb3RmcyBvbiBib3RoIG15IEQxCj4gPj4gPj4+PiA+ID4gPiBhbmQgSWNpY2xlLiBJdCdzIG9u
ZSBvZiB0aGUgRmVkb3JhIGltYWdlcyBmcm9tIERhdmlkLCBJIHRoaW5rIHRoaXMgb25lOgo+ID4+
ID4+Pj4gPiA+ID4gaHR0cDovL2ZlZG9yYS5yaXNjdi5yb2Nrcy9rb2ppZmlsZXMvd29yay90YXNr
cy8zOTMzLzEzMTM5MzMvCj4gPj4gPj4+PiA+ID4gPgo+ID4+ID4+Pj4gPiA+ID4gSXQgZ2V0cyBw
cmV0dHkgZmFyIGludG8gdGhpbmdzLCBpdCdzIG9uY2Ugc3lzdGVtZCBpcyBvcGVyYXRpb25hbCB0
aGF0Cj4gPj4gPj4+PiA+ID4gPiB0aGluZ3MgZ28gcGVhciBzaGFwZWQ6Cj4gPj4gPj4+PiA+ID4K
PiA+PiA+Pj4+ID4gPiBTaG91bGRhIHNhaWQsIGNhbiBzaGFyZSB0aGUgZnVsbCBsb2dzIGlmIHJl
cXVpcmVkIG9mIGNvdXJzZSwgYnV0IHRoZXkncmUKPiA+PiA+Pj4+ID4gPiBxdWl0ZSB2ZXJib3Nl
IGNvcyBzeXN0ZW1kIGV0Yy4KPiA+PiA+Pj4+ID4KPiA+PiA+Pj4+ID4gSSB3YXMganVzdCBpbnZl
c3RpZ2F0aW5nIHRoZSBzYW1lIHRoaW5nIGp1c3Qgbm93LiBTbyB0aGF0IHNhdmVzIG1lIHNvbWUK
PiA+PiA+Pj4+ID4gdHJhY2tpbmcgZG93biB0aGUgY3VscHJpdCA6LSkgLgo+ID4+ID4+Pj4gPgo+
ID4+ID4+Pj4gPiBNeSBtYWluIHFlbXUgaXMgbGl2aW5nIGFzIGEgImJvYXJkIiBpbiBteSBib2Fy
ZGZhcm0gKGFsc28gZG9pbmcgbmZzcm9vdCkKPiA+PiA+Pj4+ID4gYXMgd2VsbCBhcyBteSBkMSBu
ZXpoYSB3aXRoIG5mc3Jvb3Qgd2FzIGFmZmVjdGVkLgo+ID4+ID4+Pj4gQ2FuIHlvdSByZXByb2R1
Y2UgaXQgd2l0aCBxZW11PyBDb3VsZCBnaXZlIG1lIHNvbWUgdGlwcyBhbmQgbGV0IG1lCj4gPj4g
Pj4+PiByZXByb2R1Y2UgaXQgb24gcWVtdT8KPiA+PiA+Pgo+ID4+ID4+IEZXSVcsIEknbSBnZXR0
aW5nIHRoZSBzeXN0ZW1kIGlzc3VlIHcvbyBORlMsIG9uIGEgcmVndWxhciA5cCB2aXJ0ZnMuCj4g
Pj4gPj4KPiA+PiA+PiB8ICQgc3VkbyBtbWRlYnN0cmFwIC0tYXJjaGl0ZWN0dXJlPXJpc2N2NjQg
bHVuYXIgcnYtcm9vdGZzIGh0dHA6Ly9wb3J0cy51YnVudHUuY29tCj4gPj4gPj4KPiA+PiA+PiBh
bmQgdGhlIHJvb3RmcyBxZW11IGNvbmZpZzoKPiA+PiA+PiAgfCAgLWZzZGV2IGxvY2FsLGlkPXJv
b3QscGF0aD0vcGF0aC90by9ydi1yb290ZnMvLHNlY3VyaXR5X21vZGVsPW5vbmUgXAo+ID4+ID4+
ICB8ICAtZGV2aWNlIHZpcnRpby05cC1wY2ksZnNkZXY9cm9vdCxtb3VudF90YWc9L2Rldi9yb290
IFwKPiA+PiA+PiAgfCAgLWFwcGVuZCAicm9vdD0vZGV2L3Jvb3Qgcncgcm9vdGZzdHlwZT05cCBy
b290ZmxhZ3M9dmVyc2lvbj05cDIwMDAuTCx0cmFucz12aXJ0aW8sY2FjaGU9bW1hcCxhY2Nlc3M9
YW55IHNlY3VyaXR5PW5vbmUgZWFybHljb24gY29uc29sZT10dHkwIGNvbnNvbGU9dHR5UzAiCj4g
Pj4gPgo+ID4+ID4gSSB0b29rIGEgY291cGxlIG9mIGRpZmZlcmVudCB2ZXJzaW9ucyBvZiB0aGUg
c2VyaWVzIGZvciBhIHNwaW4sIGFuZCBmb3IKPiA+PiA+IG1lIGl0IHN0b3BzIHdvcmtpbmcgYmV0
d2VlbiB0aGVzZSB2ZXJzaW9ucy4KPiA+PiA+Cj4gPj4gPiAkIGdpdCBmZXRjaCBodHRwczovL2dp
dGh1Yi5jb20vZ3VvcmVuODMvbGludXguZ2l0IGdlbmVyaWNfZW50cnlfdjEyOmdlLXYxMgo+ID4+
ID4gJCBnaXQgZmV0Y2ggaHR0cHM6Ly9naXRodWIuY29tL2d1b3JlbjgzL2xpbnV4LmdpdCBnZW5l
cmljX2VudHJ5X3YxMzpnMi12MTMKPiA+PiA+Cj4gPj4gPiB2MTIgaXMgaGFwcHkgd2l0aCBzeXN0
ZW1kLCB2MTMgaXMgbm90Lgo+ID4+Cj4gPj4gSG1tLCB0aGlzIHBhdGNoIHNlZW1zIHRvIHJlc29s
dmUgdGhlIGlzc3VlIGZvciBtZToKPiA+Pgo+ID4+IC0tODwtLQo+ID4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4+
IGluZGV4ICAgICAgIDFmNGUzN2JlN2ViMy4uOGMyNThiNzhjOTI1IDEwMDY0NAo+ID4+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jCj4gPj4gQEAgLTI3MCwxMSArMjcwLDExIEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9f
dHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+
ID4+ICAgICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+ID4+ICAgICAgICAgICAgICAgICB1
bG9uZyBzeXNjYWxsID0gcmVncy0+YTc7Cj4gPj4KPiA+PiAtICAgICAgICAgICAgICAgc3lzY2Fs
bCA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncywgc3lzY2FsbCk7Cj4gPj4gLQo+
ID4+ICAgICAgICAgICAgICAgICByZWdzLT5lcGMgKz0gNDsKPiA+PiAgICAgICAgICAgICAgICAg
cmVncy0+b3JpZ19hMCA9IHJlZ3MtPmEwOwo+ID4+Cj4gPj4gKyAgICAgICAgICAgICAgIHN5c2Nh
bGwgPSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MsIHN5c2NhbGwpOwo+ID4+ICsK
PiA+PiAgICAgICAgICAgICAgICAgaWYgKHN5c2NhbGwgPCBOUl9zeXNjYWxscykKPiA+PiAgICAg
ICAgICAgICAgICAgICAgICAgICBzeXNjYWxsX2hhbmRsZXIocmVncywgc3lzY2FsbCk7Cj4gPj4g
ICAgICAgICAgICAgICAgIGVsc2UKPiA+PiAtLT44LS0KPiA+Cj4gPiBXb29ob28sIHRoYW5rcyBm
b3IgdHJhY2tpbmcgdGhhdCBkb3duLiBUaGlzIGNoYW5nZSBtYWtlcyBib3RoIG15Cj4gPiBRZW11
IGFuZCBEMS1OZXpoYSBib290IGFnYWluLgo+ID4KPiA+PiBTZWVtcyBsaWtlIHN5c2NhbGxfZW50
ZXJfZnJvbV91c2VyX21vZGUoKSBjbG9iYmVyIHJlZ3MtPmEwLgo+ID4KPiA+IFdpdGggYTAgYWxz
byBiZWluZyB0aGUgcmV0dXJuIHZhbHVlIGluIHRoZSBjYWxsaW5nIGNvbnZlbnRpb25zIChhbmQg
YmVpbmcKPiA+IHRoZSBzeXNjYWxsIHZhbHVlIGhlcmUpLCBJIGd1ZXNzIHRoYXQgY291bGQgYmUg
c29tZWhvdyBleHBlY3RlZCBhbmQgdGh1cwo+ID4gYXMgeW91ciBwYXRjaCBkb2VzLCB0aGUgYTAg
dmFsdWUgc2hvdWxkIGJlIHNhdmVkIGZpcnN0IEkgZ3Vlc3M/Cj4gPgo+ID4gQW4gaXQgbG9va3Mg
bGlrZSBMb29uYXJjaCBhbHNvIGRvZXMgc2F2ZSBhMCBiZWZvcmUgY2FsbGluZwo+ID4gc3lzY2Fs
bF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpIFswXQo+ID4KPiA+IFJldmlld2VkLWJ5OiBIZWlrbyBT
dHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdnJ1bGwuZXU+Cj4gPiBUZXN0ZWQtYnk6IEhlaWtvIFN0
dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVsbC5ldT4KPgo+IENvb2wsIGFuZCB0aGFua3MgZm9y
IHRlc3RpbmcvdmVyaWZ5aW5nISBJJ2xsIGNvb2sgYSBwcm9wZXIgcGF0Y2ggb24KPiBNb25kYXku
Ckp1c3QgcGluZyBnZW50bHkgOikgSGF2ZSB5b3UgZG9uZSBpdD8KCj4KPgo+IEJqw7Zybgo+Cj4K
CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
