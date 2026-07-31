Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2F4C54F54
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 05:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxjl6aNCIyl/9tyMrz19CtFJ9f7rvIxLe2Q3O9Cxfo4=; b=vf8x8LpkluPSev
	uk9KjhV3GOmPggOYtmlKosRon2gtypeOrBATVrBdEkGZC6+OQ8owVmMXpNiWO0wyhES4YwaX/d4Mq
	sBuiBBbBouQ9EcBg6A4i29dESrecrtmTKrnob0oW86yMGxUJiC0iTJfNt3wYBnpec51hHZc/uqAKA
	dmXD47hYSfjTsNZMYwclXtBy9V40+V7OXO/p3VrUAA1FTVux+rRALkZOSIW9/g51QuitkniUES5Yd
	gttOum1y7dKYOTbjGR8NKVBV/jlYB9kQZ3VCHm+mf5RG5QDzHESs7igW/wHPcSbGLgokT4YZ3oY5Y
	DeVw00XlqOw/RANs7Zfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpg2i-0000000BpF5-0gOB;
	Fri, 31 Jul 2026 05:44:24 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpg2f-0000000BpEP-1iSR
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 05:44:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47640541585so374348f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jul 2026 22:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785476659; cv=none;
        d=google.com; s=arc-20260327;
        b=M3Gxjv6mxNzFsnibhWs0dtMgglTvXiubSRobL9N6NoFgaqgCtHNV5deuCk5hWFlAey
         30a/RID9aleDgKmPQ/lm8sNPsqRZLj/ogAfGNbNi+p7dNk655yqDvdZqRykpZSRzugKi
         HI/dq2fKQI6XyhjdagmS8r6LyOgEGcMEXnz4zZjB9AO3UgGLWaP7TgP4WiUtMHJx8qFz
         DqCV2O63GX9Re3WJ6b0iyG7og1IEF0dHn4hObll9i1ajFaejEREHP7Rrxnd9VQsgAFCc
         fsd087uaqvRdHeKyE+TfR7cvk3h9K8/vbkdrfObxZ1LD9c4nUMLZeRFlQxO1FanPWBMC
         MgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tyufRcDXkH7OGX3Tp/WXvppb4b1akynKEKRhP9itFK4=;
        fh=lDvR/BD+mrhVMQ5XqTo3cMTkkzEf5cyIUIm46aZWuTc=;
        b=L1Ppih+EwMm6Xn+PXf2GIbkIGWibDLoswKcfctX8fy0+DlJlljezPUVv/OjcH/vNHn
         W9xn0vtppYw+bdlETYlgK0m49OWkjeDYPHCWd44SzGGFnnNdJZHYRDpw50TqyYWtDLaD
         VAnN6n/XsyMXfih1t8nuE7KIHRzM8yQdqPSDvVlLI/2cXxIsAlpmhQn2upsyrhHz7sHF
         yN1jhoZzUc7L8HlRwMY+kfiuHQMwYftTIOI3KcZ5t93xxuY4qpCJPQwz1oKmPwetPL6+
         LZ5zdCPM1Yf8/5Dg0vnzoBIILSRR7O3HbH+sRCLKQDNHAuurnrd0hWD76RFs6xIhbxKY
         6gMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785476659; x=1786081459; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tyufRcDXkH7OGX3Tp/WXvppb4b1akynKEKRhP9itFK4=;
        b=cz4hiAowNTZ7STjrhxkgABeUZkHF7a6/vP/bLzNhv5YTAl5f4v29Yo7cdriYWDnwmv
         fuPCH8VwzQ+zUu7yvNYJf0MFS3qhIIaVq8go/oGW/5vwnfLGiLPa/9ADwF3odyzed5+s
         r+CeCOSDiHv1LF4F8cV3Bq5vZhyLBVpbQtsbfer6LK5BxihWPbsVxxG50+Aj5S5ul2uN
         ilTDn7miBOUf0eeWcgCc0h1m/sbEkmcFa4T0BbKcfcc5JvIQ2vQ1mjulqcO93UnTohjA
         7PQd0TyNZ0XiUXkqqbv19q6T8j7P7tC113aXPDpcKy1CMwzgeVCDvbO7JN3e4etNXwXn
         gEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785476659; x=1786081459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tyufRcDXkH7OGX3Tp/WXvppb4b1akynKEKRhP9itFK4=;
        b=WifHkFcXQFc9fCOvRUBrmuUYwpPJ3yPoaWkDGtusA60jHXUUmUHl8tfkfMzuqF6yW7
         WeVH4Ycl3B/O7tRbqkM6h5L+D9SV3lBuIptgiRJnv9cNHXz6mcclW83k3JPP2VfI6riQ
         Ov7Jb9wDeqMynziKF7VWVf38GxmXyCWkw79824LOw1J656ae/nQ9Mr7fAeAfy8wA2Og5
         hmsW63c3bQmXk5vezhIURRlrOtv+zyPnnH74HpiJwRFA7gkvW4aJCUkhLPGwo7DxmE2J
         mgi2hX/voWoCDiinEj5ZXeP0Rf/j64llP/8yOvwewWMwJDm1V4bgFMXjED9U9GQaTPJO
         geAg==
X-Forwarded-Encrypted: i=1; AHgh+RrFdlT3UzV8ay+dI2Jl3W6MC5GqxdOzy9d0iWrshzP0yuUmYFEivdNQZ11QyRd8Zj4ReoImaSJ585KISg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3BhAKa6WMTmeu/b1Y28pUDyI4ojD31tvnuwRq4FzXsM4Ddi+V
	fES0pghRbuugJg6/HUfXlyu4NRkvMX8FTMKIBj6o5cGZStos9JrSpNyiOy09rSxS57O1EXmOCsF
	U8AVGOyEgiFfL6ILw9STiEzyaumOIdFyfvpgADRYiUA==
X-Gm-Gg: AR+sD10NKLGt4pmPDeziRjs+RfKrEYicWDBDxcbTn146YfGRluhyTtjLcv7dHl/ipmn
	wLhPZP9XFW1H4kQeVfZLmEhsuzpPpxg9zlL72LWnia3M6QjIcnoVfhz+AAtYUAs3BXwdNOi/5uN
	3fRRhVnWogX5gyH/UslbCdMOXDPuE/ZhzPQHra/kUdAOF6k9lLQzK6dagaHAerwWOTsow6R9Lqc
	T4nyz9Od1vMoz2x3hRqEqD97EFZDr5DzqZmcerHS0NMmGLDZdcRSpST/CvjkhbIIaqGQSS6v/XR
	r78sFp9FgNgkjXfCDxBnNsMXC+6EnrVG9ckEd3p4yxCArxqOtbcQWwHGpxtaecbkpPnoXAuSVyD
	RtowfNX0+mwRbHiF8x8QVCXQ/JneyRwlPOoMUNtQudRvi/nJG6tHyjYhsqYoE+hw=
X-Received: by 2002:a05:6000:2212:b0:47f:8e50:93e0 with SMTP id
 ffacd0b85a97d-47fd2b328efmr1580964f8f.39.1785476659463; Thu, 30 Jul 2026
 22:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260701120954.129873-1-wang.yechao255@zte.com.cn> <20260701120954.129873-4-wang.yechao255@zte.com.cn>
In-Reply-To: <20260701120954.129873-4-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 Jul 2026 11:14:08 +0530
X-Gm-Features: AUfX_myKDnYmDHijHAzG-jJrRvK3vmSuf-KnXv-nXgVsR5qZr7fmqUsH6abxvaI
Message-ID: <CAAhSdy27pUkVYiciMOp6RdcyzNvsEeOXGA5pW43C1oZJZR4W_Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] RISC-V: KVM: Remove redundant TLB flush operations
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_224421_465186_8D31F519 
X-CRM114-Status: GOOD (  16.56  )
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

T24gV2VkLCBKdWwgMSwgMjAyNiBhdCA1OjQx4oCvUE0gV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFv
MjU1QHp0ZS5jb20uY24+IHdyb3RlOgo+Cj4gVGhlIGZ1bmN0aW9uIGt2bV9hcmNoX21tdV9lbmFi
bGVfbG9nX2RpcnR5X3B0X21hc2tlZCgpIGlzIGludm9rZWQgZnJvbQo+IHR3byBkaXN0aW5jdCBj
YWxsIHBhdGhzOgo+Cj4ga3ZtX2NsZWFyX2RpcnR5X2xvZ19wcm90ZWN0KCkKPiAgIGt2bV9hcmNo
X21tdV9lbmFibGVfbG9nX2RpcnR5X3B0X21hc2tlZCgpCj4KPiBrdm1fdm1faW9jdGxfcmVzZXRf
ZGlydHlfcGFnZXMoKQo+ICAga3ZtX2RpcnR5X3JpbmdfcmVzZXQoKQo+ICAgICBrdm1fcmVzZXRf
ZGlydHlfZ2ZuKCkKPiAgICAgICAgIGt2bV9hcmNoX21tdV9lbmFibGVfbG9nX2RpcnR5X3B0X21h
c2tlZCgpCj4KPiBJbiBib3RoIHNjZW5hcmlvcywgdGhlIGNhbGxlciBhbHJlYWR5IHBlcmZvcm1z
IGEgcmVtb3RlIFRMQiBmbHVzaCBhZnRlcgo+IGRpcnR5IGxvZ2dpbmcgaXMgZW5hYmxlZCwgc28g
dGhlIFRMQiBmbHVzaCBpbnNpZGUKPiBrdm1fYXJjaF9tbXVfZW5hYmxlX2xvZ19kaXJ0eV9wdF9t
YXNrZWQoKSBpcyB1bm5lY2Vzc2FyeS4gUmVtb3ZlIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogV2Fu
ZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yv
a3ZtL21tdS5jIHwgNiArLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jIGIvYXJj
aC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCAzNjMyMzhlZmFlZGI0Li4wNTZjMGFiZTI3OGFmIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0v
bW11LmMKPiBAQCAtMTYyLDE0ICsxNjIsMTAgQEAgdm9pZCBrdm1fYXJjaF9tbXVfZW5hYmxlX2xv
Z19kaXJ0eV9wdF9tYXNrZWQoc3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAgcGh5c19hZGRyX3Qg
c3RhcnQgPSAoYmFzZV9nZm4gKyAgX19mZnMobWFzaykpIDw8IFBBR0VfU0hJRlQ7Cj4gICAgICAg
ICBwaHlzX2FkZHJfdCBlbmQgPSAoYmFzZV9nZm4gKyBfX2ZscyhtYXNrKSArIDEpIDw8IFBBR0Vf
U0hJRlQ7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX2dzdGFnZSBnc3RhZ2U7Cj4gLSAgICAgICBib29s
IGZsdXNoOwo+Cj4gICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX2luaXQoJmdzdGFnZSwga3ZtKTsK
Pgo+IC0gICAgICAgZmx1c2ggPSBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3JhbmdlKCZnc3RhZ2UsIHN0
YXJ0LCBlbmQpOwo+IC0gICAgICAgaWYgKGZsdXNoKQo+IC0gICAgICAgICAgICAgICBrdm1fZmx1
c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoa3ZtLCBzdGFydCA+PiBQQUdFX1NISUZULAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGVuZCAtIHN0YXJ0KSA+PiBQQUdF
X1NISUZUKTsKPiArICAgICAgIGt2bV9yaXNjdl9nc3RhZ2Vfd3BfcmFuZ2UoJmdzdGFnZSwgc3Rh
cnQsIGVuZCk7CgpQbGVhc2UgYWRkIGNvbW1lbnQgaGVyZSB0aGF0IHJlbW90ZSBUTEIgZmx1c2gg
aXMgbm90IG5lZWRlZCBoZXJlCnNpbmNlIGNhbGxlcnMgb2Yga3ZtX2FyY2hfbW11X2VuYWJsZV9s
b2dfZGlydHlfcHRfbWFza2VkKCkgYWxyZWFkeQpkbyBpdC4KCj4gIH0KPgo+ICB2b2lkIGt2bV9h
cmNoX3N5bmNfZGlydHlfbG9nKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9tZW1vcnlfc2xv
dCAqbWVtc2xvdCkKPiAtLQo+IDIuNDMuNQo+CgpPdGhlcndpc2UsIHRoaXMgbG9va3MgZ29vZCB0
byBtZS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhh
bmtzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
