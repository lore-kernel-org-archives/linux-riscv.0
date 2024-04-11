Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1918CC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 17:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NF1rIox9Pw5UxCsej0x5FJvAp1hKUq4h4h4XdCKb2E=; b=Xw3K2hGt5H8rLv
	jdR9JE+Vz3739PPpcjJAG5YzL2HzSFX+HFclc87pSjB/tAgOniOkMz6nvqflDHTJjK2LjtJ0GnXVu
	7TbzMe6B+vV9N5UtTJEPEEM9la+g1KJnULjBgasJw18Mu/uw9FKOn3bIhZCGoe/XHWD6VDfC9G5Mg
	9lF2kTR8TKjwVacehwivvhzmBdlqc605mFsU1luVHRCDnHccI9HNWqAY/NIUbEtZdh003J1r3rnoY
	47J0uz3+tX0OvBNypPoN1t1WTxaeU7ljsDvZMcEMYFmVPvQEValfjGWpFad/oBia1xPkGXRbQ6ldd
	3K/le2RGGVwO0FjruwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruy1o-0000000DJxy-3nCs;
	Thu, 11 Apr 2024 17:16:00 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruy1k-0000000DJux-1YSA
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 17:15:58 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7e7cf5cc1d0so605125241.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 10:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712855754; x=1713460554; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=To4z9UmMI9cuRfj5YaEO7iuspgkYCOJTB+CRNWJcwHA=;
        b=UWoGbuF+S53KueNM8zice7pAuZlzoCdc2R1p9kd3RaEPXBlRre7g3dgK4pvBNZAyW+
         /aMjJh64vGyVYzc+6TRXrJOTCmpEECBxmN29rwMnlwlt2ctTTM0+kJxni0gSudMYMWWg
         q9RJJIWTv6Tgu+WL1r9Kq32tSXf7dVcgipWvbNUefXTIoc7FuQle+PpR9ADT0SXRgd4y
         dpm/35efL4LJ9dJDyeKKNTyXDO1MS9tL5GV553zyLc/BZoQ6JOu0bsfGq3Wn2AGaEJUO
         ih28Y7mxkxdpyeksc5cruKXfrfDad12A351N34cXciouVtqtucf9wb7e8K9VITL3snt8
         9TEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712855754; x=1713460554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=To4z9UmMI9cuRfj5YaEO7iuspgkYCOJTB+CRNWJcwHA=;
        b=jbrnXAXuOk0D4xGIPrxFZ3IcRpzQvVhYZ7snki46MHUhBX3VS5ONh+wb40ns9VHVoz
         T0altFecH4CQQgjLtlW0F7LZ8iwGDOV04Nlw+jg1PAvCHSNtcmrRawPTvXUmFrI1zBFb
         HiYDGg6D1FaL2hRwr59i2YHu5p+s3LmqYodtT5iDnqsVZh0awbP/RdezLnS2xd76tsPX
         8bSe6m9UdxoKmMjiZR3ERoDpTs72f8g5sM1fnafUuk0AP4/4twlOByBEq6flcIL+1tWG
         AQT8humrz/7eOyKWRO+ZoLwf/w3ObQRjbxfI3N53Co4YaMs3AlVLUmfPZe4r6cPWrq5o
         eIrA==
X-Gm-Message-State: AOJu0YwgHAv7PqX3mjFlkPBPlYnMrgr+9N+xmLKUVr5x8c37ofemPxCk
	TMP6C4NYqSVQleFu2d+b66OpdN3d5MpC3A7UCM+khV6sp8Q9S1uBvSwGVyeA969/MaCJ5sQgjJm
	PDZdG8vf4SBRZLYNbWXka4skfT1pb6SPjrYwY
X-Google-Smtp-Source: AGHT+IG8Mab463ffes2ANkePLtsCLN4JtRtaHVbTkLMIpOIAKgLXt4OnkFal81PiCyeO8tfml6LLHVcoAQLc8PxSbOQ=
X-Received: by 2002:a1f:6682:0:b0:4ce:96b7:c2f6 with SMTP id
 a124-20020a1f6682000000b004ce96b7c2f6mr2537665vkc.5.1712855753645; Thu, 11
 Apr 2024 10:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240409061043.3269676-1-debug@rivosinc.com> <20240409061043.3269676-3-debug@rivosinc.com>
In-Reply-To: <20240409061043.3269676-3-debug@rivosinc.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 11 Apr 2024 17:15:17 +0000
Message-ID: <CABCJKuee-6GGDDjvByCkikR02gka2BNhwRVBw6UAwEcmSQposQ@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] riscv: add landing pad for asm routines.
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, andy.chiu@sifive.com, 
	hankuan.chen@sifive.com, guoren@kernel.org, greentime.hu@sifive.com, 
	cleger@rivosinc.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
	conor.dooley@microchip.com, mchitale@ventanamicro.com, 
	dbarboza@ventanamicro.com, waylingii@gmail.com, sameo@rivosinc.com, 
	alexghiti@rivosinc.com, akpm@linux-foundation.org, shikemeng@huaweicloud.com, 
	rppt@kernel.org, charlie@rivosinc.com, xiao.w.wang@intel.com, 
	willy@infradead.org, jszhang@kernel.org, leobras@redhat.com, 
	songshuaishuai@tinylab.org, haxel@fzi.de, samuel.holland@sifive.com, 
	namcaov@gmail.com, bjorn@rivosinc.com, cuiyunhui@bytedance.com, 
	wangkefeng.wang@huawei.com, falcon@tinylab.org, viro@zeniv.linux.org.uk, 
	bhe@redhat.com, chenjiahao16@huawei.com, hca@linux.ibm.com, arnd@arndb.de, 
	kent.overstreet@linux.dev, boqun.feng@gmail.com, oleg@redhat.com, 
	paulmck@kernel.org, broonie@kernel.org, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_101556_506693_434D8C83 
X-CRM114-Status: GOOD (  15.72  )
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

T24gVHVlLCBBcHIgOSwgMjAyNCBhdCA2OjEy4oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gU1lNXyogbWFjcm9zIGFyZSB1c2VkIHRvIGRlZmluZSBhc3Nl
bWJseSByb3V0aW5lcy4gSW4gdGhpcyBwYXRjaCBzZXJpZXMsCj4gcmUtZGVmaW5lIHRob3NlIG1h
Y3JvcyBpbiByaXNjLXYgYXJjaCBzcGVjaWZpYyBpbmNsdWRlIGZpbGUgdG8gaW5jbHVkZQo+IGEg
bGFuZGluZyBwYWQgaW5zdHJ1Y3Rpb24gYXQgdGhlIGJlZ2lubmluZy4gVGhpcyBpcyBkb25lIG9u
bHkgd2hlbiB0aGUKPiBjb21waWxlciBmbGFnIGZvciBsYW5kaW5nIHBhZCBpcyBlbmFibGVkIChp
LmUuIF9fcmlzY3ZfemljZmlscCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgR3VwdGEgPGRl
YnVnQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9saW5rYWdl
LmggfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgNDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vbGlua2FnZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9saW5rYWdlLmgKPiBpbmRleCA5
ZTg4YmEyM2NkMmIuLmJiNDNhZTdkYWRlYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2xpbmthZ2UuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vbGlua2FnZS5o
Cj4gQEAgLTYsNyArNiw0OSBAQAo+ICAjaWZuZGVmIF9BU01fUklTQ1ZfTElOS0FHRV9ICj4gICNk
ZWZpbmUgX0FTTV9SSVNDVl9MSU5LQUdFX0gKPgo+ICsjaWZkZWYgX19BU1NFTUJMWV9fCj4gKyNp
bmNsdWRlIDxhc20vYXNzZW1ibGVyLmg+Cj4gKyNlbmRpZgo+ICsKPiAgI2RlZmluZSBfX0FMSUdO
ICAgICAgICAgICAgICAgIC5iYWxpZ24gNAo+ICAjZGVmaW5lIF9fQUxJR05fU1RSICAgICIuYmFs
aWduIDQiCj4KPiArI2lmZGVmIF9fcmlzY3ZfemljZmlscAo+ICsvKgo+ICsgKiBBIGxhbmRpbmcg
cGFkIGluc3RydWN0aW9uIGlzIG5lZWRlZCBhdCBzdGFydCBvZiBhc20gcm91dGluZXMKPiArICog
cmUtZGVmaW5lIG1hY3JvcyBmb3IgYXNtIHJvdXRpbmVzIHRvIGhhdmUgYSBsYW5kaW5nIHBhZCBh
dAo+ICsgKiB0aGUgYmVnaW5uaW5nIG9mIGZ1bmN0aW9uLiBDdXJyZW50bHkgdXNlIGxhYmVsIHZh
bHVlIG9mIDB4MS4KPiArICogRXZlbnR1YWxseSwgbGFiZWwgc2hvdWxkIGJlIGNhbGN1bGF0ZWQg
YXMgYSBoYXNoIG92ZXIgZnVuY3Rpb24KPiArICogc2lnbmF0dXJlLgo+ICsgKi8KCkkgaGF2ZW4n
dCBzZWVuIHRoZSBjb21waWxlciBpbXBsZW1lbnRhdGlvbiBmb3IgZmluZS1ncmFpbmVkIFppY2Zp
bHAKeWV0LCBidXQgaW4gdGhlIGtlcm5lbCBhdCBsZWFzdCwgdGhpcyB3b3VsZCBpZGVhbGx5IHJl
dXNlIGFzIG11Y2ggb2YKdGhlIEtDRkkgcGx1bWJpbmcgYXMgcG9zc2libGUuIEZvciBleGFtcGxl
LCBzaW5jZSBvbmx5IEMgY29kZSBoYXMgdHlwZQppbmZvcm1hdGlvbiwgd2UgbGVmdCB0aGUgdHlw
ZSBoYXNoIGNvbXB1dGF0aW9uIGZvciB0aGUgY29tcGlsZXIsIHdoaWNoCmFsbG93cyBhc3NlbWJs
eSBmdW5jdGlvbnMgdG8ganVzdCByZWZlcmVuY2UgdGhlIGFwcHJvcHJpYXRlCl9fa2NmaV90eXBl
aWRfKiBzeW1ib2wuCgpTYW1pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
