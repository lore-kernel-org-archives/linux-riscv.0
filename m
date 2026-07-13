Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07530C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 08:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8QXqFAVEFdvMwR75aiAl+yVK+ZHFqZWAQBGjW5HhSw=; b=LFnLYmbuEWi7h5
	kDIwLvQsjBzOmRRTtfhCxZRq3rLlHPeTMShUeIj3xNTtp9XA13+D1hrEQ1flJgSB7zn2sY6dqv79b
	Y9KFyFgRSLrmkKkv2lpoiqUXt3dDLUE+btWGxlNkIUgFJptEaD0V1DkVbHL6y7aow29sKX256zJvz
	1NqbZ55OwdUj9+3mIbsToPBLB3wDPbQsue2CtypcQC4ztWDbK8f8QBANommJf3jef0DL472cYuuhz
	fQMteT+yx/Qk2ReJQ3iSM80tWwZssQ95ZjC8VzZKVFw/Fc3+b/1mpq12KI5Tycp3gRWlaOG0dzZxO
	rQ5uwLf7I4kwnyvl6+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC6T-00000008b8f-0dX1;
	Mon, 13 Jul 2026 08:33:29 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC6P-00000008b7b-3qRS
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 08:33:27 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-472326ca506so2277944f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 01:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783931604; cv=none;
        d=google.com; s=arc-20260327;
        b=rNiKtdJsRzUx2o6FhrnXs84i9Obzx590luDuPojj0M8JZ9RrVEJSuTliRiagHaPfDD
         7Jh7jPsUlqAXMT6GBjbqjs42gDavZKvzGgfcCsdq2cf6bz+VJX5JECzXJXH/KqZqgF9a
         qUUMw4QBcwWXXKb/oMxEj7h8Ayuxvao4xszf4Hb8zDLvivaqEVP8sP5ZX7TQ6JVfg/To
         /2HjhWDj0PgUIsWuKMPGWoK/XuKDLrw+urkyi51Y0SkNvLLowF7k1HrgtFedpL5eAOgY
         PWxHGMlQ1EK9wDHIu+IC8gwhuK656/7joleGpmB0FA/9Og3R6cW6ANEO9OC+Z8cAzXIz
         cJUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/TTX6pDKN8WM9gjZfXrDKvUiLlBJOTFwE6JKAQaNe8=;
        fh=Eb+K6/LQ2qbEgHC4GmDjCsMRJiS+tL6ORVXlUAqiGjw=;
        b=VTBJjkBFx96AiSO7m5+2gS6RHOx/114EIOY/xiWgaxmzFbDXb49dUJpIUAX5HEXtRQ
         bmNoM2lF0XezTKstBETvpeChQN9AZi8yXqI1X47uLzXJTaOsExXAao6bpKTh8ChwI/cO
         6kminRHyI2Xg9G+E0yOwa3oH+iPnDsulG/lmC+rqIv4yu3baqvqVUerHejfBOVW0d6Gk
         MDbPk1RL3drUksIDANl3x2Xr5zYtsfIY1GoHsGRCqllgriCZ2RDSwWL4RmsVAq3WKJV8
         /oDU/Q5Qgbg79i2d5USQLy/yl0ZB5pBzpPhfmPgbbXBoiikT9rlbAOlmQ+koFpDXiYG/
         xmGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783931604; x=1784536404; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/TTX6pDKN8WM9gjZfXrDKvUiLlBJOTFwE6JKAQaNe8=;
        b=c1jchF98MeCXdykho5fJRUWft/C/yoNBip+OvxpU6NygUHaw3CNePI9xPGmig9eF/3
         OHPV3TIz5eRAr/M2X2vA7Ta1uxzHcRCnQ34y6VH9vV7Isi6qdmfBrTp+ASKFxcKE3tav
         OqcI6bqiD+NfaztstQycER3C9jCAAT/2Uc6mJ+rhDPIjjSvwXydExXeFr4s+bcSuY+xe
         JC5oHxo9hW+Eq2+0qSp7RwtUn2U21vfipbKp8J567sVCCtv1zy3I3wT8ytCwgHa8I5Zi
         Ecd+5JINb+qaowGHDxc61n9/tC9+PFRWIVriEsHWNkMIav2IZ1I7Zfg/vcEhwcWBBbwm
         0UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931604; x=1784536404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/TTX6pDKN8WM9gjZfXrDKvUiLlBJOTFwE6JKAQaNe8=;
        b=DexVsCTTz0OQ3qRtB/Z7/vKdVtC+h635Bjur5k+najGgkguFX/HOwblgiECiWB6vH5
         J2EVIwEA4Vrz9xY7J1iSPPo2xoDhQA+eh68qTmZye8oE5Z1mxlGduzlS4mUgCs9L5I2O
         kIRA3twUM0ydeyhKM/qkL2Ly/ZzzRip19mRFKj0NIk0oj75TJHNiWU13K09Tg4Il/TR0
         z2FCvsbXwiOs89V0iOv1QPRUs65FFdKtHMUkHy9zEW4z5y95w3Diu944iQP0UaBhIr0N
         XNUqrP73+LqV3OL1gdowvgdn6UCbMl46bqjB+a1fywEE2OdJg7DaGUhGlWDDbptAvTQb
         2VWw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4LJYc9hxj1SYT+4FfW/UyoUiBkXurlS97Ka/Kww2Pa07Y3/bjhsV3uIVpMHJD/08+Gs+zGWPxNBeMGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6EPjfVrpSJs3HjpsQe3Ge5f6yuMz56RblqlKZm0jpuROlRhA8
	gHylW4YQ/f/NIARcMFUi8cp2GVq3ZpK+9CNycROFMDEd3E5yzlN5RTUkarQ6nwHcIvB+ft66X2m
	RN/aTsi0NLA37Tr0GgMo4tqbUpywQEUwbRjaUSMSyPA==
X-Gm-Gg: AfdE7cnBBxm0XYLvd2ImG76FqKJew6DpyELAsVkkT3StxT1qJ4SGPYYGfhT1ET4h9rq
	V+F8AnMrTYbf3GHJhk2tSK4h7oCucy/INs4iWANTEoKRGQnqB6E3yMhGDUbnLQ92JbHeZwLN0ec
	0SClX6uDVk06hz7KdqyGlojTp5rm/Y4HMlTMEznBn9rWqY0HuNDrM1KYpz9auAsBGH6U9eKBg6J
	muuzErdjPriGqid7LWgaVp1WTd53XK/EwDLCTDxLWSPjKloMngb9MCDqJ2Ot/GRhF44hv2JDDko
	zCYup26IWhhKmhteMZ0lJdjNAi1UyzOR3ZW9u9zLMxpPBmBf03BIJInp1yWpMsPEWa6ZiIGIFL+
	kbvZ7IW7kqROSDttR
X-Received: by 2002:a05:600c:638f:b0:493:f762:45d4 with SMTP id
 5b1f17b1804b1-493f87d9311mr77398405e9.2.1783931603573; Mon, 13 Jul 2026
 01:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260624130238.524706-1-suunj1331@gmail.com>
In-Reply-To: <20260624130238.524706-1-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Jul 2026 14:03:10 +0530
X-Gm-Features: AUfX_myLtlmicbiW4GefupawlEmm4GHGfSrV2gtz0C0tAQHCDS5effgNQRiwzOo
Message-ID: <CAAhSdy2YUuC8BLVDp53VWGnUYLShGkuWeHr87mpe5RnZx3PLSQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: SBI FWFT: Apply LOCK flag only on successful set
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: atish.patra@linux.dev, cleger@rivosinc.com, ajones@ventanamicro.com, 
	skhan@linuxfoundation.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel-mentees@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_013326_104299_83B10EA6 
X-CRM114-Status: GOOD (  15.46  )
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

T24gV2VkLCBKdW4gMjQsIDIwMjYgYXQgNjozM+KAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4ga3ZtX3NiaV9md2Z0X3NldCgpIGFwcGxpZXMgdGhlIGNh
bGxlcidzIGZsYWdzIHRvIGNvbmYtPmZsYWdzIGJlZm9yZQo+IGludm9raW5nIHRoZSBzZXQoKSBj
YWxsYmFjay4gSWYgdGhlIGNhbGxiYWNrIHJldHVybnMgYW4gZXJyb3IsIHRoZSBMT0NLCj4gYml0
IHBlcnNpc3RzIGFuZCB0aGUgZmVhdHVyZSBiZWNvbWVzIHBlcm1hbmVudGx5IGxvY2tlZCB3aXRo
b3V0IGl0cyB2YWx1ZQo+IGV2ZXIgYmVpbmcgY2hhbmdlZC4KPgo+IE1vdmUgdGhlIGZsYWdzIGFz
c2lnbm1lbnQgYWZ0ZXIgdGhlIGNhbGxiYWNrIHNvIExPQ0sgdGFrZXMgZWZmZWN0IG9ubHkKPiBv
biBzdWNjZXNzLgo+Cj4gRml4ZXM6IDZiNzJmZDE3MDU5MiAoIlJJU0MtVjogS1ZNOiBhZGQgc3Vw
cG9ydCBmb3IgRldGVCBTQkkgZXh0ZW5zaW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBTZXVuZ0p1IENo
ZW9uIDxzdXVuajEzMzFAZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgYSBmaXggZm9yIExp
bnV4LTcuMi1yY1gKClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX2Z3ZnQuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlf
ZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gaW5kZXggYWIzOWFjNDY0
ZmZkLi4xMzQyYWRiMzE4MGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlf
ZndmdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gQEAgLTMyNyw5
ICszMjcsMTEgQEAgc3RhdGljIGludCBrdm1fc2JpX2Z3ZnRfc2V0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgdTMyIGZlYXR1cmUsCj4gICAgICAgICBpZiAoY29uZi0+ZmxhZ3MgJiBTQklfRldGVF9T
RVRfRkxBR19MT0NLKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9ERU5JRURfTE9D
S0VEOwo+Cj4gLSAgICAgICBjb25mLT5mbGFncyA9IGZsYWdzOwo+ICsgICAgICAgcmV0ID0gY29u
Zi0+ZmVhdHVyZS0+c2V0KHZjcHUsIGNvbmYsIGZhbHNlLCB2YWx1ZSk7Cj4gKyAgICAgICBpZiAo
cmV0ID09IFNCSV9TVUNDRVNTKQo+ICsgICAgICAgICAgICAgICBjb25mLT5mbGFncyA9IGZsYWdz
Owo+Cj4gLSAgICAgICByZXR1cm4gY29uZi0+ZmVhdHVyZS0+c2V0KHZjcHUsIGNvbmYsIGZhbHNl
LCB2YWx1ZSk7Cj4gKyAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiAgc3RhdGljIGludCBrdm1f
c2JpX2Z3ZnRfZ2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBmZWF0dXJl
LAo+IC0tCj4gMi41Mi4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
