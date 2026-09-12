Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D17C88E45
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 07:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPz/GmsB/moGJ+3AMVAOhjEoaD1lZJoWUvAnW7F2we8=; b=GE02/aWhI6bbj8
	7xIiryStBbuvLJMQKHFN7GHZUpwEUZ346jGM/4BUoRHp8QQf50vKrq8zmy/ovaLy922u3ty7TL1/b
	Lg5CXO79JzpycU2qGOnSJjtOviEkT07zkd3wjMHLbbWVCesHg0dRjObMjctSgJ6TY2Um2JRRRmFkl
	Ha1CtOYppg1SOtMft/dD5W4MR2NDRlJDvMJebvaUpz1MQu0dk9Yz9rm6ecOIwYXOLMvc6IW06Ctz9
	oWv1pihOZrSG+9B+ryKqQRlgj8/zXWOekEGaUm8YRFGY4Aq/LdBo09BD0joWHI2BlHItdZZWnU/Rv
	ENvM6kCjo9GQPecinN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5I1r-00000000e6q-3njv;
	Sat, 12 Sep 2026 07:20:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5I1p-00000000e5Z-29Od
	for linux-riscv@lists.infradead.org;
	Sat, 12 Sep 2026 07:20:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-485888b3c3dso1583701f8f.2
        for <linux-riscv@lists.infradead.org>; Sat, 12 Sep 2026 00:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789197600; cv=none;
        d=google.com; s=arc-20260327;
        b=b3h/bp4wKrAxtUn/nnZkrzz66m4/cYB15nCfiTM6BW+t8cb0xBErHSCCfrP9OJ13ik
         aR5flRmCkylsDMTp9+4EcpaU69d6QyP5BRJw32g5Rxo72FeC1NtcOF2AEQ2+xRDHsGK4
         BVNhcBh/D3yYZ5sfvOtTypo/SzlEH88vtcILAMAIwLbcclZH7E7Y1yChFsDXNVDfZ/wk
         PsAv8QlI9cgLsjkkzi4ABYZejyFK9b+UykWw2SXR2gKb+8SPkA9IFxEcUF+el2xNG1KU
         uQiFTAJOFsjjM1oQ1ffXHymzeA26nPvq2gFMwuei0k0Dw8QXABNRk1J5iOG+/G33SfSI
         0uDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+HCXtMkwPRPt0+8i1UnJyzIlexbsOaqziQRyoO3VN8k=;
        fh=jv8qHmAyUJ8/OxnxisvIBoMmOqBcXmgm2auNkNVGBgE=;
        b=F/GH1gjyKhsjckOWnkrHCBKWwi4Rfh8WGFEHZ7cpZNwOILRdd23Xw2+JzYb3aYrXIS
         c/zhKMyNRcN0MVUpy1nyTDXNADGMdo/pJq4ShuzKTNuSItGR2JqF1vAYo36EHARnee4m
         fGwWT+Y0k/dfIzU5j7qFb3mGxDyPUETaUyps000wi89JtSQu+od6N8VFoUAh4CmZq/9S
         kaAg4esbJpxIRYnKt9NJO0eyiwx5OrVp1GCotj5DAtoX6AyPDJ9sXuhl1nPQdtejoaYu
         xCZXMCfxDgmiLRUHvUGMKXT30uWwhUP/UoqHxqpleUHfgqyHxZvibuz5ExpCK0S7d++r
         3hFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789197600; x=1789802400; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+HCXtMkwPRPt0+8i1UnJyzIlexbsOaqziQRyoO3VN8k=;
        b=Hs5L+8j71IkqVLdsYRmoh9NJ1r5ufzcjZCNTt5ZTALYEi3xCD+2hNztDQIU0MIsPa7
         B66BOxiJbqC5JLKg3Rp3uEBdi6ZNxxXW7Ody5+K2Q839OUlnrf+eVXwJZ+1MhEpdYjoc
         c0fomntUTSK36WfxnQH3LPhbrfltk/7Fbspte0mEkhdvwEBVeOFYE6AOqhHNFh3dfXha
         uLOIsgkexFFqXwlfYDk7vwopjF8O1MTJXZtJXzi7DOh4VteFR/gDMyvl4fyyuBV+OAHA
         V7idic6yOHC7s92zDVJoHMI9GgQkSEYTkfCnuU1qrfsLGVT6Ej3JmOMdA5Al0ghOpwya
         sPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197600; x=1789802400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+HCXtMkwPRPt0+8i1UnJyzIlexbsOaqziQRyoO3VN8k=;
        b=hoDrMfMj0Whx4C9zWV+VffLfbPocMXlhNKuhOI9uXp0pEVCIx3mcpopk2eQZtXT/2Y
         vbJpH5tmjfdk1cLQQSIMbhfzBWc9Jkkwix4+06GYqX4N2QWO+GbnCOA/GDC9flwRl5S4
         BE5qUV5hBYMigDK1cnSvp0wCB070qVXUzLcyZn5DnmupJGswSBjMxLYW9C/PHoAfr/jN
         C1/JDUxHIgr/nCWk9A00192MjiiS9LZypheNsbYpo2escq8auOltjptgUY2gGBgn7GV1
         gn9p93P2re0Hi4uSiXD+1ElEcH0CjQ6693oGqwO8ApyxaukaI4LFrgWMpifarAouFQyS
         jyMw==
X-Forwarded-Encrypted: i=1; AKwUvBwRqr2E6uRaqFG1RNo/cbvK7oqoue3pp4ItggpyGfo2bfrUlaQZ4GhB6G9gJreAnHYHbJdNAGWXCthJmw==@lists.infradead.org
X-Gm-Message-State: AFuF++mS0xUMuRBpYl2rsPD+SreoHXNZhsIIaQKkHIkS334a9holGVL7
	xEnER4L+V5082HlVmVoc3IxT5b1WLYzq2hP/v/+8P0XUiKDr0SIWYuST2M2YOk+oJ+BfyOwmIKa
	HGjQb98g4AEgl9DUAiUhmxu1xecnKKUDw8wp6a3z3oA==
X-Gm-Gg: AYBFou2kC09MkUpaqxKe+uOx47EFBP+MJs60JLYNWSLLXT00ipRRMRp2M46XKmm9ak2
	gNP5kmHE4/Bp6wEpdgaWmwKTIiXjz/ZmPgb3/RTbYHggWmiN8kKce5s7XcxfGrFFYMvVy6DgTr4
	nx5uIUBQEU62u/8VsgNvT7Y8C6fENV3E4J8lJuQGSj5eF27VgKx25dK6wIQEF9u/Vm5sttatfqR
	pHE/tuGSC7HsupHG6ncM9MenM0UdGW98UFJ2hWcq7BZyhrcCqd6WsJIa+Q9mEIjmdpQLxw6UShC
	qrIkTC5MT3E1+aGkaunH8rROiTkCCbQMHvac27K+1XuckYwJchpSOiraqD1rbYX1+wSOI0k0tlj
	s6WXZeu87LilIHdRpk5uO2nJDRAIzJ6jpnoXQU7HMQXXeP7OT+qPq0VygbX/UTzFuDM4ogyqNvQ
	==
X-Received: by 2002:a5d:5f44:0:b0:486:ed36:bb8 with SMTP id
 ffacd0b85a97d-486ed360ceemr8264961f8f.29.1789197599622; Sat, 12 Sep 2026
 00:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <caplitmus-rv.c91c005b844342d9a9f60949b04c520d.d65@163.com>
In-Reply-To: <caplitmus-rv.c91c005b844342d9a9f60949b04c520d.d65@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 12 Sep 2026 12:49:47 +0530
X-Gm-Features: AcwNN1VonCRcgUOPNOO0ybAk3-QpJzTjEpr8-CCE2ai98LUN-VM9a568vF76B6w
Message-ID: <CAAhSdy0cnHwfs5hRfZdq6WAzrEobqcjYMuv1oAmvRk2pi2zkPA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Publish NACL HFENCE configuration last
To: Pengpeng Hou <hppiscas@163.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_002001_789711_550314ED 
X-CRM114-Status: GOOD (  15.39  )
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

T24gU3VuLCBTZXAgNiwgMjAyNiBhdCAxOjM34oCvUE0gUGVuZ3BlbmcgSG91IDxocHBpc2Nhc0Ax
NjMuY29tPiB3cm90ZToKPgo+IFRoZSBTQkkgTkFDTCBpbnRlcmZhY2UgcmVxdWlyZXMgc29mdHdh
cmUgdG8gd3JpdGUgUGFnZV9OdW1iZXIgYW5kCj4gUGFnZV9Db3VudCBiZWZvcmUgcHVibGlzaGlu
ZyBhbiBIRkVOQ0UgZW50cnkgd2l0aCBDb25maWcuUGVuZGluZyBzZXQuCj4gX19rdm1fcmlzY3Zf
bmFjbF9oZmVuY2UoKSBjdXJyZW50bHkgc3RvcmVzIHRoZSBwZW5kaW5nIGNvbmZpZ3VyYXRpb24g
Zmlyc3QuCj4KPiBXcml0ZSB0aGUgcGF5bG9hZCBmaXJzdCBhbmQgb3JkZXIgdGhvc2Ugc3RvcmVz
IGJlZm9yZSBwdWJsaXNoaW5nIHRoZQo+IGNvbmZpZ3VyYXRpb24gd29yZCB3aXRoIFdSSVRFX09O
Q0UoKS4gVXNlIGEgd3JpdGUgYmFycmllciB0aGF0IGFsc28KPiBhcHBsaWVzIHRvIFVQIGtlcm5l
bHMsIHNpbmNlIHRoZSBjb25zdW1lciBpcyBvdXRzaWRlIHRoZSBMaW51eCBTTVAKPiBkb21haW4u
Cj4KPiBLZWVwIG5hY2xfaGZlbmNlX21rY29uZmlnKCkgdW5jaGFuZ2VkOiBzZXR0aW5nIFBlbmRp
bmcgaW4gYSBsb2NhbCB2YWx1ZQo+IGRvZXMgbm90IHB1Ymxpc2ggdGhlIGVudHJ5LiBUaGUgc2hh
cmVkLW1lbW9yeSBzdG9yZSBpcyB0aGUgcHVibGljYXRpb24KPiBwb2ludC4KPgo+IFRoZSBpc3N1
ZSB3YXMgZm91bmQgYnkgb3VyIHN0YXRpYy1hbmFseXNpcyB0b29sIGFuZCBtYW51YWxseSByZXZp
ZXdlZC4KPgo+IEZpeGVzOiBkNDY2YzE5Y2VhZDUgKCJSSVNDLVY6IEtWTTogQWRkIGNvbW1vbiBu
ZXN0ZWQgYWNjZWxlcmF0aW9uIHN1cHBvcnQiKQo+IEFzc2lzdGVkLWJ5OiBHUFQtNQo+IFNpZ25l
ZC1vZmYtYnk6IFBlbmdwZW5nIEhvdSA8aHBwaXNjYXNAMTYzLmNvbT4KClRoZXJlIHdhcyBhbm90
aGVyIHBhdGNoIGZyb20gWm9uZ21pbiBaaG91IHdoaWNoIGlzIHJlbGF0aXZlbHkKbW9yZSBjb21w
bGV0ZSBoZW5jZSBJIGhhdmUgbWVyZ2VkIHRoYXQgb25lLgoKUmVnYXJkcywKQW51cAoKCj4gLS0t
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbmFjbC5jIGIvYXJjaC9yaXNjdi9rdm0v
bmFjbC5jCj4gaW5kZXggOWFmZjAzYzQuLmM1YzQ5MDdhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL25hY2wuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL25hY2wuYwo+IEBAIC01LDYgKzUs
NyBAQAo+Cj4gICNpbmNsdWRlIDxsaW51eC9rdm1faG9zdC5oPgo+ICAjaW5jbHVkZSA8bGludXgv
dm1hbGxvYy5oPgo+ICsjaW5jbHVkZSA8YXNtL2JhcnJpZXIuaD4KPiAgI2luY2x1ZGUgPGFzbS9r
dm1fbmFjbC5oPgo+Cj4gIERFRklORV9TVEFUSUNfS0VZX0ZBTFNFKGt2bV9yaXNjdl9uYWNsX2F2
YWlsYWJsZSk7Cj4gQEAgLTQyLDEyICs0MywxNSBAQCBhZ2FpbjoKPiAgICAgICAgICAgICAgICAg
fQo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBlbnRwID0gc2htZW0gKyBTQklfTkFDTF9TSE1FTV9I
RkVOQ0VfRU5UUllfQ09ORklHKGkpOwo+IC0gICAgICAgKmVudHAgPSBjcHVfdG9fbGVsb25nKGNv
bnRyb2wpOwo+ICAgICAgICAgZW50cCA9IHNobWVtICsgU0JJX05BQ0xfU0hNRU1fSEZFTkNFX0VO
VFJZX1BOVU0oaSk7Cj4gICAgICAgICAqZW50cCA9IGNwdV90b19sZWxvbmcocGFnZV9udW0pOwo+
ICAgICAgICAgZW50cCA9IHNobWVtICsgU0JJX05BQ0xfU0hNRU1fSEZFTkNFX0VOVFJZX1BDT1VO
VChpKTsKPiAgICAgICAgICplbnRwID0gY3B1X3RvX2xlbG9uZyhwYWdlX2NvdW50KTsKPiArCj4g
KyAgICAgICAvKiBQdWJsaXNoIHRoZSBwYXlsb2FkIGJlZm9yZSBzZXR0aW5nIENvbmZpZy5QZW5k
aW5nLiAqLwo+ICsgICAgICAgd21iKCk7Cj4gKyAgICAgICBlbnRwID0gc2htZW0gKyBTQklfTkFD
TF9TSE1FTV9IRkVOQ0VfRU5UUllfQ09ORklHKGkpOwo+ICsgICAgICAgV1JJVEVfT05DRSgqZW50
cCwgY3B1X3RvX2xlbG9uZyhjb250cm9sKSk7Cj4gIH0KPgo+ICBpbnQga3ZtX3Jpc2N2X25hY2xf
ZW5hYmxlKHZvaWQpCj4KPiBiYXNlLWNvbW1pdDogNGQ3ZDk0ODZjMDRkOTE3MjY1ZjY0YzU1YmQy
M2IyY2M0ZmU3NzQ5Ywo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
