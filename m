Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D379EB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 23:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=N7Ifc+ohoBDTNgSnc/v6M0XDwPZn7U/+IVZdJ0DwQsc=; b=nTpLx+iZ05e2b+MIsbSd3a5Ev8
	6EyytdhsDgBuDs/WWie/CTXWuJoDD+uT3OVl90VsEFUltEvwxIrRHqyQEYCHU6KP3Ap4OOfz0m5/p
	GfXQY/YwJ0Grkk/gGT2chw6mAQ46j5nMqgvmmwmsliYNJedv067uoLqdn4FIhSoqmbuTmI3aGGJJP
	adFNJz1em75Az7YfRSspUKL7fJVPuC81zYwDfmn9b1tLY/P/Fz9E1tbJVEvhOn2VM7MI8gi3F4VVv
	Vt/BE3Hn4xp6pDFkBQsXGxC3AdIiQs2kj07zawidUfFLXxWjnvjpUr4TXZZVyghStpEhE5sxEDVfN
	xIOHOXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC7hD-00G5lS-0o;
	Wed, 21 Jun 2023 23:57:07 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC7h8-00G5k5-29
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 23:57:04 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3a04e5baffcso770781b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 16:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687391819; x=1689983819;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mc4fpIkxrmWFX77cuCPTRDrtxqTugNNR8tCOrUF27gs=;
        b=KShjQV/DDsYujReu9d+W4GKA0cU/AD/qDlM4N9t2PNFTfT+KZ0SvbvPWewsnmhN+eO
         HU950Yob63NkRBFDBknMNhZHUExpxpxdxFSfhncGEHKxmsuL36GSXmpN2HqBPg+pfwDD
         K1wthFPr69wYkCr8eaE01uYYyEckU2tN7JocwU2NYyijP0c65Xjnkw/201SXofPLelRI
         iiQyo+NFfOgSmRpfCKFNEWBZs2QpQVmo/xc91DxLV0Tw3PMAx/X/TMHJAcmFzO65b3Zz
         iM1v3V8urvB3VKHLZYzb0YQ1VK3c0TU7sS8ky8Ik74hODVWhxX0tRvr140Ch7DVlZjD2
         XKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687391819; x=1689983819;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mc4fpIkxrmWFX77cuCPTRDrtxqTugNNR8tCOrUF27gs=;
        b=bD0+H3BWBUYjvVIABMn0U2mlkvhCOo5wS8JBjMynHPG5NpqP06WtgMX1T2bbz8CebP
         C9gom0BsG6zMT4ZBaLkXk3b0Fvy1Haap6/GD1MTYbixBTRpc1OnpLAEQFmJ7AFHnHf24
         f/m9VDGBBP2qesK4WmCv0GAQD9CT4cnwlFs6ZZl1g6wLthnO8Ba9EhWu6HwwNbY4en+i
         iJIUtAQ0rm+vpdqJz9P/CeRD2IRmZDmKilUIoYzRDz9gGfpafigFBmNpgq25ToSZZYEC
         rfgGEMGNVAOMpM2NOqGg/dzpLZ/E0cfC4stU9WP/ftzTEO7pGY+xyRMlkxe5e321LiL+
         iJOQ==
X-Gm-Message-State: AC+VfDwbCzdOt1HuotV8Qz7nJL16onP5qb3ofpjBq7Dd4ZeiAnJiC8+H
	UicrgbJKXXvxTUIF9URbe5V+SA==
X-Google-Smtp-Source: ACHHUZ5X0a/eiR5H1ppvpN4jE+a/znwL58JjJPGOLiHuqaFtHFz3LZk9cOq6Vs4tx9xfHwMLmSsgOQ==
X-Received: by 2002:aca:2b05:0:b0:39d:5610:b779 with SMTP id i5-20020aca2b05000000b0039d5610b779mr17396238oik.49.1687391819292;
        Wed, 21 Jun 2023 16:56:59 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p14-20020a63e64e000000b005533c53f550sm3654119pgj.45.2023.06.21.16.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 16:56:58 -0700 (PDT)
Date: Wed, 21 Jun 2023 16:56:58 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jun 2023 16:56:18 PDT (-0700)
Subject: Re: [PATCH 3/7] riscv: mm: Refactor create_linear_mapping_range() for hot add
In-Reply-To: <20230512145737.985671-4-bjorn@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, Bjorn Topel <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org,
  linux-mm@kvack.org, david@redhat.com, osalvador@suse.de, virtualization@lists.linux-foundation.org,
  linux@rivosinc.com, alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bjorn@kernel.org
Message-ID: <mhng-ec7e2bae-2eb8-45c5-b7e4-bc2a931760df@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_165702_708427_0AF6416D 
X-CRM114-Status: GOOD (  20.18  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxMiBNYXkgMjAyMyAwNzo1NzozMyBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9y
ZyB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBB
ZGQgYSBwYXJhbWV0ZXIgdG8gdGhlIGRpcmVjdCBtYXAgc2V0dXAgZnVuY3Rpb24sIHNvIGl0IGNh
biBiZSB1c2VkIGluCj4gYXJjaF9hZGRfbWVtb3J5KCkgbGF0ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yv
bW0vaW5pdC5jIHwgMTggKysrKysrKysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9t
bS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+IGluZGV4IGU5NzRmZjZlZjAzNi4uYWVh
OGNjYjNmNGFlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gKysrIGIvYXJj
aC9yaXNjdi9tbS9pbml0LmMKPiBAQCAtMTI0NywxOCArMTI0NywxOSBAQCBhc21saW5rYWdlIHZv
aWQgX19pbml0IHNldHVwX3ZtKHVpbnRwdHJfdCBkdGJfcGEpCj4gIAlwdF9vcHNfc2V0X2ZpeG1h
cCgpOwo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgX19pbml0IGNyZWF0ZV9saW5lYXJfbWFwcGluZ19y
YW5nZShwaHlzX2FkZHJfdCBzdGFydCwKPiAtCQkJCQkgICAgICAgcGh5c19hZGRyX3QgZW5kKQo+
ICtzdGF0aWMgdm9pZCBfX21lbWluaXQgY3JlYXRlX2xpbmVhcl9tYXBwaW5nX3JhbmdlKHBoeXNf
YWRkcl90IHN0YXJ0LCBwaHlzX2FkZHJfdCBlbmQsCj4gKwkJCQkJCSAgc3RydWN0IG1ocF9wYXJh
bXMgKnBhcmFtcykKClNvcnJ5IGlmIEkgbWlzc2VkIGEgdjIsIGJ1dCBpdCBsb29rcyBsaWtlIHRo
aXMgZmFpbHMgdG8gYnVpbGQgdW5kZXIgCkNPTkZJR19NRU1PUllfSE9UUExVRz1uIChhcyBzdHJ1
Y3QgbWhwX3BhcmFtcyBpc24ndCBkZWZpbmVkKSAtLSB1bmxlc3MgSSAKc2NyZXdlZCB1cCBzb21l
IG1lcmdlIGNvbmZsaWN0LCBidXQgZG9lc24ndCBsb29rIGxpa2UgaXQgaGVyZS4KCkknbSBnZXR0
aW5nCgogICAgICBDQyAgICAgIGFyY2gvcmlzY3YvbW0vaW5pdC5vCiAgICBhcmNoL3Jpc2N2L21t
L2luaXQuYzoxMjUyOjU4OiB3YXJuaW5nOiDigJhzdHJ1Y3QgbWhwX3BhcmFtc+KAmSBkZWNsYXJl
ZCBpbnNpZGUgcGFyYW1ldGVyIGxpc3Qgd2lsbCBub3QgYmUgdmlzaWJsZSBvdXRzaWRlIG9mIHRo
aXMgZGVmaW5pdGlvbiBvciBkZWNsYXJhdGlvbgogICAgIDEyNTIgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtaHBfcGFyYW1zICpwYXJh
bXMpCiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn4KICAgIGFyY2gvcmlzY3YvbW0vaW5pdC5jOiBJbiBm
dW5jdGlvbiDigJhjcmVhdGVfbGluZWFyX21hcHBpbmdfcmFuZ2XigJk6CiAgICBhcmNoL3Jpc2N2
L21tL2luaXQuYzoxMjYxOjQyOiBlcnJvcjogaW52YWxpZCB1c2Ugb2YgdW5kZWZpbmVkIHR5cGUg
4oCYc3RydWN0IG1ocF9wYXJhbXPigJkKICAgICAxMjYxIHwgICAgICAgICAgICAgICAgIHBncHJv
dCA9ICBwYXJhbXMgPyBwYXJhbXMtPnBncHJvdCA6IHBncHJvdF9mcm9tX3ZhKHZhKTsKICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgogICAgbWFr
ZVszXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI1MjogYXJjaC9yaXNjdi9tbS9pbml0
Lm9dIEVycm9yIDEKICAgIG1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0OTQ6
IGFyY2gvcmlzY3YvbW1dIEVycm9yIDIKICAgIG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmls
ZS5idWlsZDo0OTQ6IGFyY2gvcmlzY3ZdIEVycm9yIDIKICAgIG1ha2U6ICoqKiBbTWFrZWZpbGU6
MjAyNjogLl0gRXJyb3IgMgoKcGF0Y2h3b3JrIGlzIHNheWluZyBzb21ldGhpbmcgc2ltaWxhcgo8
aHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vY29ub3ItcHdib3QvOWVkOWE1NjRlNjNkODI0YWVkMTc4
NjA1MGVlMDY1NTg+LgoKPiAgewo+ICAJcGh5c19hZGRyX3QgcGE7Cj4gIAl1aW50cHRyX3QgdmEs
IG1hcF9zaXplOwo+Cj4gIAlmb3IgKHBhID0gc3RhcnQ7IHBhIDwgZW5kOyBwYSArPSBtYXBfc2l6
ZSkgewo+ICsJCXBncHJvdF90IHBncHJvdDsKPiArCj4gIAkJdmEgPSAodWludHB0cl90KV9fdmEo
cGEpOwo+ICsJCXBncHJvdCA9ICBwYXJhbXMgPyBwYXJhbXMtPnBncHJvdCA6IHBncHJvdF9mcm9t
X3ZhKHZhKTsKPiAgCQltYXBfc2l6ZSA9IGJlc3RfbWFwX3NpemUocGEsIGVuZCAtIHBhKTsKPiAt
Cj4gLQkJY3JlYXRlX3BnZF9tYXBwaW5nKHN3YXBwZXJfcGdfZGlyLCB2YSwgcGEsIG1hcF9zaXpl
LAo+IC0JCQkJICAgcGdwcm90X2Zyb21fdmEodmEpKTsKPiArCQljcmVhdGVfcGdkX21hcHBpbmco
c3dhcHBlcl9wZ19kaXIsIHZhLCBwYSwgbWFwX3NpemUsIHBncHJvdCk7Cj4gIAl9Cj4gIH0KPgo+
IEBAIC0xMjg4LDEzICsxMjg5LDEyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjcmVhdGVfbGluZWFy
X21hcHBpbmdfcGFnZV90YWJsZSh2b2lkKQo+ICAJCWlmIChlbmQgPj0gX19wYShQQUdFX09GRlNF
VCkgKyBtZW1vcnlfbGltaXQpCj4gIAkJCWVuZCA9IF9fcGEoUEFHRV9PRkZTRVQpICsgbWVtb3J5
X2xpbWl0Owo+Cj4gLQkJY3JlYXRlX2xpbmVhcl9tYXBwaW5nX3JhbmdlKHN0YXJ0LCBlbmQpOwo+
ICsJCWNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5nZShzdGFydCwgZW5kLCBOVUxMKTsKPiAgCX0K
Pgo+ICAjaWZkZWYgQ09ORklHX1NUUklDVF9LRVJORUxfUldYCj4gLQljcmVhdGVfbGluZWFyX21h
cHBpbmdfcmFuZ2Uoa3RleHRfc3RhcnQsIGt0ZXh0X3N0YXJ0ICsga3RleHRfc2l6ZSk7Cj4gLQlj
cmVhdGVfbGluZWFyX21hcHBpbmdfcmFuZ2Uoa3JvZGF0YV9zdGFydCwKPiAtCQkJCSAgICBrcm9k
YXRhX3N0YXJ0ICsga3JvZGF0YV9zaXplKTsKPiArCWNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5n
ZShrdGV4dF9zdGFydCwga3RleHRfc3RhcnQgKyBrdGV4dF9zaXplLCBOVUxMKTsKPiArCWNyZWF0
ZV9saW5lYXJfbWFwcGluZ19yYW5nZShrcm9kYXRhX3N0YXJ0LCBrcm9kYXRhX3N0YXJ0ICsga3Jv
ZGF0YV9zaXplLCBOVUxMKTsKPgo+ICAJbWVtYmxvY2tfY2xlYXJfbm9tYXAoa3RleHRfc3RhcnQs
ICBrdGV4dF9zaXplKTsKPiAgCW1lbWJsb2NrX2NsZWFyX25vbWFwKGtyb2RhdGFfc3RhcnQsIGty
b2RhdGFfc2l6ZSk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
