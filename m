Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E86BE732C8
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jS/b4uxo4527b6lztHWXHQzo0wYANEgI8xsu4Ygc7zY=; b=iJKxKUOlv8Y6vp
	G1khZ0c8frmuf+EyLn5EQ/y98/8p9ApDIvgJLWgqc1tb/VT2bbO1GDwzug8fsrmxvm56YTXa2jbUc
	sjF+42sj1L520X5mL+80cD5lT2H/BWP37vsmUjcc9cCkywxXVLH2E0N/FA3ykAq0MUaGm1ohPlkJy
	puDc20bAAkrgGAM0YxK2Um7HfMTfnGCH1ZUJr13fsYL5/DWe2nyQjSuLx2gr2mNMQj/avmTJ2hlJw
	ITvNVX5AWfdk53AzUy4+X3FItiLTnmj15CtXh67XdESYDOmMaQD3X7uiizgleCOwcftbArjbZjKbG
	TlM6zXVCv33KnG4F9T/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlopJ-0033Zb-2M;
	Thu, 28 Sep 2023 11:05:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlopD-0033UO-1F
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 11:04:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A6BBFB81BB4;
	Thu, 28 Sep 2023 11:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFBFC433CB;
	Thu, 28 Sep 2023 11:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695899093;
	bh=7mNdJcFPLoE1YRZIoK6v5JqUWXOtSuDSezshher0uy0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PQ33zNum8w+EXnbDT8al3DaeDYDYIrAxrS2YwpRyXvZOgVEKADhbJCVkJNWRB47gl
	 Sg6bFC/nqVv26c9VAFJemsTHjG+NGq7TJogtSj0PugW8ne4/Wzc/6k2A9fT8Pu2vim
	 l4IvAb+QI52tOnwqkBRSYyoJHbZp1vjCsQkACQ97kyLO73yG4w/+joz/q0rjqgzryN
	 erF4ejPb5o2HpHqVxEeWdOJswrlKbp0Ux7OKZsoUGTypljibsCSUNC0hqdkWkWsvMa
	 tawZTPOfsC4XphDqcx+DUbS83baCZxfyOY6+eQkKe9VX9xA90a/R8Sic9lgMh+F9et
	 mFPkbbm1oFq5g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v2 5/6] riscv, bpf: Optimize sign-extention mov
 insns with Zbb support
In-Reply-To: <20230919035839.3297328-6-pulehui@huaweicloud.com>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
 <20230919035839.3297328-6-pulehui@huaweicloud.com>
Date: Thu, 28 Sep 2023 13:04:50 +0200
Message-ID: <87sf6ymuct.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_040455_760994_6A7B84C0 
X-CRM114-Status: GOOD (  12.86  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBBZGQgOC1iaXQgYW5kIDE2LWJpdCBzaWduLWV4
dGVudGlvbiB3cmFwZXIgd2l0aCBaYmIgc3VwcG9ydCB0byBvcHRpbWl6ZQo+IHNpZ24tZXh0ZW5z
aW9uIG1vdiBpbnN0cnVjdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1
aUBodWF3ZWkuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L25ldC9icGZfaml0LmggICAgICAgIHwg
MjAgKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQu
YyB8ICA1ICsrKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmggYi9hcmNo
L3Jpc2N2L25ldC9icGZfaml0LmgKPiBpbmRleCA0ZTI0ZmIyYmQuLjk0NGJkZDZlNCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmgKPiArKysgYi9hcmNoL3Jpc2N2L25ldC9i
cGZfaml0LmgKPiBAQCAtMTExMCw2ICsxMTEwLDI2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBlbWl0
X3N1YncodTggcmQsIHU4IHJzMSwgdTggcnMyLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkK
PiAgCQllbWl0KHJ2X3N1YncocmQsIHJzMSwgcnMyKSwgY3R4KTsKPiAgfQo+ICAKPiArc3RhdGlj
IGlubGluZSB2b2lkIGVtaXRfc2V4dGIodTggcmQsIHU4IHJzLCBzdHJ1Y3QgcnZfaml0X2NvbnRl
eHQgKmN0eCkKPiArewo+ICsJaWYgKHJ2emJiX2VuYWJsZWQoKSkgewo+ICsJCWVtaXQocnZ6YmJf
c2V4dGIocmQsIHJzKSwgY3R4KTsKPiArCX0gZWxzZSB7Cj4gKwkJZW1pdF9zbGxpKHJkLCBycywg
NTYsIGN0eCk7Cj4gKwkJZW1pdF9zcmFpKHJkLCByZCwgNTYsIGN0eCk7Cj4gKwl9Cj4gK30KPiAr
Cj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBlbWl0X3NleHRoKHU4IHJkLCB1OCBycywgc3RydWN0IHJ2
X2ppdF9jb250ZXh0ICpjdHgpCj4gK3sKPiArCWlmIChydnpiYl9lbmFibGVkKCkpIHsKPiArCQll
bWl0KHJ2emJiX3NleHRoKHJkLCBycyksIGN0eCk7Cj4gKwl9IGVsc2Ugewo+ICsJCWVtaXRfc2xs
aShyZCwgcnMsIDQ4LCBjdHgpOwo+ICsJCWVtaXRfc3JhaShyZCwgcmQsIDQ4LCBjdHgpOwo+ICsJ
fQo+ICt9CgpOaXQvcGVyc29uYWwgc3R5bGU6IEkgcmVhbGx5IGZpbmQgaXQgZWFzaWVyIHRvIHJl
YWQgZWFybHktZXhpdCBjb2RlLAp0aGFuIG5lc3RlZCBpZi1lbHNlLgoKICB8IGlmIChjb25kKSB7
CiAgfCAgIGZvbygpOwogIHwgICByZXR1cm47CiAgfCB9CiAgfCAKICB8IGJhcigpOwoKPiArCj4g
IHN0YXRpYyBpbmxpbmUgdm9pZCBlbWl0X3NleHR3KHU4IHJkLCB1OCBycywgc3RydWN0IHJ2X2pp
dF9jb250ZXh0ICpjdHgpCj4gIHsKPiAgCWVtaXRfYWRkaXcocmQsIHJzLCAwLCBjdHgpOwo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9u
ZXQvYnBmX2ppdF9jb21wNjQuYwo+IGluZGV4IDBjNmZmZTExYS4uZjRjYTZiNzg3IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiArKysgYi9hcmNoL3Jpc2N2
L25ldC9icGZfaml0X2NvbXA2NC5jCj4gQEAgLTEwMjcsOSArMTAyNywxMCBAQCBpbnQgYnBmX2pp
dF9lbWl0X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2Nv
bnRleHQgKmN0eCwKPiAgCQkJZW1pdF9tdihyZCwgcnMsIGN0eCk7Cj4gIAkJCWJyZWFrOwo+ICAJ
CWNhc2UgODoKPiArCQkJZW1pdF9zZXh0YihyZCwgcnMsIGN0eCk7Cj4gKwkJCWJyZWFrOwo+ICAJ
CWNhc2UgMTY6Cj4gLQkJCWVtaXRfc2xsaShSVl9SRUdfVDEsIHJzLCA2NCAtIGluc24tPm9mZiwg
Y3R4KTsKPiAtCQkJZW1pdF9zcmFpKHJkLCBSVl9SRUdfVDEsIDY0IC0gaW5zbi0+b2ZmLCBjdHgp
Owo+ICsJCQllbWl0X3NleHRoKHJkLCBycywgY3R4KTsKCkFja2VkLWJ5OiBCasO2cm4gVMO2cGVs
IDxiam9ybkBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
