Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574D2C55167
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 05:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1l7MU9+Db5XT2thQU7b3f+Pxk3VtZ91il39EOGx1cx0=; b=E4wq/TnYbSr1JJ
	vJOaZNxYwI2/i5zIQivkAJJq59JgQXQcRHwkDaRe9i/SCVRHrqUymWjJFiyFcHLO2meRMsCgvvtPz
	cyI2alMbbCnxufXRrMX+BIHIzJRnb8VyZHCrRS2t3GEM1iLjpcT9L8U3xQCCw/aZR4b81/pPEkuuA
	LNzYWE1YD9V9CarrXpkLcTO90FD9lqJILCBjlMZOXplRNjgAccJ01hAWUnf8ihI45sXTypm5ZvtVS
	3HmXGAg/hwcgEv+tDKE6ywvWMdNrgF94OLVoHsrU6ojtfmvB5mF4SwCvdVIMYl8Jy4+vT0jOVAP2i
	1hdXyS90M68GcYly2pWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpftd-0000000Bo13-3B4H;
	Fri, 31 Jul 2026 05:35:01 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpfta-0000000Bnyv-0FXY
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 05:35:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f7854678cso349521f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jul 2026 22:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785476095; cv=none;
        d=google.com; s=arc-20260327;
        b=QFGQu8+vARodKGDKS7SRh4qCODI2aOUzWAV//LvGA0AjNnyQm+k3ozS54TxeirhaEI
         lDIWNGv5afvW2EHOZlXPNdPKL5QhBEVAKeT4ArJC0QlTJBZIUstN61NolxFUmJNhLVhp
         S8zuzHU/dlW+VV5mZjhGOl2hbfxxkjbi0Q3spC0dwadxQbODfxZ8IHk92Nnnk/fSb1Vw
         c6hRmxV/cETv7DDmZKd+VlzNWBAv4vq5fg531c8yCYx39fWTV6P4Wo+9h2qiDAJUz31Y
         ukRTfeP/u4qkCYesEnOCyLPuKYAkGXoxypVcZiY8f0Ic+wvFOux29qEYkdsPuSmTF9J1
         dSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NpDPKiNmGUabqt3eiQx1uoLP1i93SqQSGHcFDJqZaIs=;
        fh=C/lcBSAX4mMONwhn603fDzQvG+rarapsvu22qG/CNZw=;
        b=g2PidjFYKvXgFrmjwfpSbO3DJ9VArDHLvX8poLrRi7IW/E6u8NcQZtVr9fosxJ9duG
         cUbWwuSqAkJWCTmn9lPpzzRSg6Ydk6ZLdX/33byXQpVLpogyeoCId9Ql1iShKKSk8Fow
         +NTIDt+lNJ44g33IhvZyKDXjnSNewWYIkg+zEgoAS8Nw/9q8fWLirDubIm4e/3geH/sh
         cGCWdRKCWs6S+Qh4DHpU3eoAPAlRUN5inPEY0p47+O5H2EGQ54bgUtOLw1K2MiMoml69
         yCfA0FluoIgcrhP66bCPraTCM3Lild/R8F4KaQ7VjHj6sVljzVaUM63DYChsh1DP0uDB
         +Jkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785476095; x=1786080895; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpDPKiNmGUabqt3eiQx1uoLP1i93SqQSGHcFDJqZaIs=;
        b=Qa3S3yZTHLngEwUSJjLdLWK5fNHAWd2DzYeccJKQmVRUw1IzzxNM3a1lik5KlXcaFV
         PBuCxRyaQL0wbuZga6kqBpCl0ZKSIoeLYm0ka+PgqaBOARBc63lhhKHcqgDeiOQonywK
         ESrceQNTJIWhPrSW9vURtC+Z0UUitf3Z6ZVhpmvax1s2lVi7TP1FT7IE8523HolG67ou
         3hgoLJ6vvD5YIy6y6vKtdTv42WPVs6bQye+30qq74TRv/N9TgHa62H+DTfAnbult8AiK
         dQfnglfzdFioV188EX1Vx7n6oYzRf+P8oqnI66dsT9L5UiQCLC7VE7Bo6A2tIQEmF29L
         1l5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785476095; x=1786080895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpDPKiNmGUabqt3eiQx1uoLP1i93SqQSGHcFDJqZaIs=;
        b=fca22jB76nY20sPsUwBHft1WzV+1Io6aXI8qpG11eryEtpBWEBWmQFE7WtHuvPt6wE
         ZLNzG7e9HLQuNxs/QahKnca4KNmLLND9PZjsEYkFcsYScMWgvkLUmHK7xPrHvdD0ATBj
         Qe/h/IYS06gm/VunNSOGhJQxi/AZK00MEysmo6eoWrZbeYbUsNBNHCyLUthvs4sFVZVw
         0p+1CRmck2fx3gEMpQkqv8G5Ynu0DI2I/CYBMJqMYfLY7Yf7J0sMRYvN5KgbV6jZv0CV
         uv5xNRtopjdz8CEJpwcLtjgrO5rKhFxyub7g1GiFI9OTTevFNwqKDTpwXto9HZsmLILS
         Ol0Q==
X-Forwarded-Encrypted: i=1; AHgh+RoFBcBtjYvxJtbwHdAZ7sQ+T2fb60UmbtimOF0qRaV37J3iK1ZGnNzil/1f0Zs2fKCkx7XjuN4s4Y4CuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpGNEdQJw7HOclvko8rsetNvX4bAmyokhZy5/xSg8GZFu/8QqG
	lg4oTTPgOHdFDbpnIWRBJf2M2hCuZftwiUC3hmWx4KzMPr52F/DOOSRA1kRVM5GTz0eEzFBqI0q
	ZXlsscINTqzCSsW4QNj6ay+y/nvm2TiDfRnXcgQ8f7g==
X-Gm-Gg: AR+sD12EsDznz+LdMvM2id68PWnpSluzqln5PK1C12d6Vqh/KL/sJDRZ/w45WsoaFB4
	uW+TBn46kc51hcxaLNCjvWU75+rrrDFLYOjz4TpkN+7/a2N6vP6vAJFX4nzoMAnfxiEIWI3kOWM
	cW0WGQQEjtZx4Nx3UunU5D1eOB62slTcFl/SL8UhvBrc9/+DiCVwj+ururXCyVPuG3suP8hTRHg
	ivzymQ96F7hx/O4n6d7YjH1QIfW5tCZFFAT4GYv3i989ERPCdyukgQpWOJxW7OmOuGOa7kkWgT/
	AR13ycAmjPAhL35AACWrmOCH9ITBjWNyc5A0BqMpHhXZBUD6uH0FlA/Er7Pj1U30UAIuSBbhUkQ
	lIRhkT9G6KkprYrQvLayT3c9xCVs1n0vexO8uBPAgpV4Wa0e093eFl9QRyALLLY0=
X-Received: by 2002:a05:6000:2311:b0:47f:cbbd:30ea with SMTP id
 ffacd0b85a97d-47fd2adbd1bmr1653851f8f.14.1785476094426; Thu, 30 Jul 2026
 22:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260701120954.129873-1-wang.yechao255@zte.com.cn> <20260701120954.129873-2-wang.yechao255@zte.com.cn>
In-Reply-To: <20260701120954.129873-2-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 Jul 2026 11:04:42 +0530
X-Gm-Features: AUfX_mz-aI72aPwGaPZcnLKH5SWuqKULd4t8IFNAhAJTGqns5eM5RX6MLLFbxew
Message-ID: <CAAhSdy0_dCHC+ZVG7HZdtUxZWWX_KG3YfN=ngVdpy-7_pquUFA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] RISC-V: KVM: Add the split page cache for ioctl context
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_223458_376637_63882322 
X-CRM114-Status: GOOD (  17.00  )
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
MjU1QHp0ZS5jb20uY24+IHdyb3RlOgo+Cj4gQWRkIHRoZSBzcGxpdCBwYWdlIGNhY2hlIGZvciBk
aXJ0eSBsb2dnaW5nIGVuYWJsZW1lbnQgYW5kIHRoZQo+IEtWTV9DTEVBUl9ESVJUWV9MT0cgaW9j
dGwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbj4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgMSArCj4g
IGFyY2gvcmlzY3Yva3ZtL21tdS5jICAgICAgICAgICAgICB8IDEgKwo+ICBhcmNoL3Jpc2N2L2t2
bS92bS5jICAgICAgICAgICAgICAgfCA2ICsrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IGluZGV4IDYwMDE3Y2Vl
YzlkMmEuLjY5ZjczZmQxMDZhOTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1faG9zdC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4g
QEAgLTg2LDYgKzg2LDcgQEAgc3RydWN0IGt2bV9hcmNoIHsKPiAgICAgICAgIHBnZF90ICpwZ2Q7
Cj4gICAgICAgICBwaHlzX2FkZHJfdCBwZ2RfcGh5czsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcg
cGdkX2xldmVsczsKPiArICAgICAgIHN0cnVjdCBrdm1fbW11X21lbW9yeV9jYWNoZSBwZ2Rfc3Bs
aXRfcGFnZV9jYWNoZTsKPgo+ICAgICAgICAgLyogR3Vlc3QgVGltZXIgKi8KPiAgICAgICAgIHN0
cnVjdCBrdm1fZ3Vlc3RfdGltZXIgdGltZXI7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L21tdS5jIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCAwODJmOWIyNjE3MzM4Li45Y2Y2
OWJjMjhiOWM1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtNjc2LDYgKzY3Niw3IEBAIGludCBrdm1fcmlzY3ZfbW11
X2FsbG9jX3BnZChzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAgICBrdm0tPmFyY2gucGdkID0gcGFn
ZV90b192aXJ0KHBnZF9wYWdlKTsKPiAgICAgICAgIGt2bS0+YXJjaC5wZ2RfcGh5cyA9IHBhZ2Vf
dG9fcGh5cyhwZ2RfcGFnZSk7Cj4gICAgICAgICBrdm0tPmFyY2gucGdkX2xldmVscyA9IGt2bV9y
aXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHM7Cj4gKyAgICAgICBrdm0tPmFyY2gucGdkX3NwbGl0
X3BhZ2VfY2FjaGUuZ2ZwX3plcm8gPSBfX0dGUF9aRVJPOwo+Cj4gICAgICAgICByZXR1cm4gMDsK
PiAgfQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92bS5jIGIvYXJjaC9yaXNjdi9rdm0v
dm0uYwo+IGluZGV4IGE5ZjA4M2ZlZWI3NjcuLmJlMzhmMjRhMjk3ZDYgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9rdm0vdm0uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZtLmMKPiBAQCAtNTQs
NiArNTQsMTIgQEAgdm9pZCBrdm1fYXJjaF9kZXN0cm95X3ZtKHN0cnVjdCBrdm0gKmt2bSkKPiAg
ICAgICAgIGt2bV9kZXN0cm95X3ZjcHVzKGt2bSk7Cj4KPiAgICAgICAgIGt2bV9yaXNjdl9haWFf
ZGVzdHJveV92bShrdm0pOwo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBGcmVlIHRoZSBz
cGxpdCBwYWdlIGNhY2hlIGFmdGVyIGFsbCB2Q1BVcyBhbmQgZGV2aWNlcyBhcmUgZGVzdHJveWVk
Lgo+ICsgICAgICAgICogQXQgdGhpcyBwb2ludCwgdGhlcmUgYXJlIG5vIGNvbmN1cnJlbnQgYWNj
ZXNzZXMgdG8gdGhlIGNhY2hlLgo+ICsgICAgICAgICovCj4gKyAgICAgICBrdm1fbW11X2ZyZWVf
bWVtb3J5X2NhY2hlKCZrdm0tPmFyY2gucGdkX3NwbGl0X3BhZ2VfY2FjaGUpOwoKQmV0dGVyIHRv
IGRvIHRoaXMgaW4ga3ZtX3Jpc2N2X21tdV9mcmVlX3BnZCgpCgpSZWdhcmRzLApBbnVwCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
