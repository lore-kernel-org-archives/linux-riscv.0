Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D287CD613A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QoW2CuUFWA/74Y0sFyn0zGS16SerzBAUyZtkHmbSxHY=; b=2PLmXWxhzZ3ARY
	DTfaWsKxT3g2tNHClMpnk3i35z6S1vM85AvrRfNkxdMCkkWks8kHENfg4/GbI66rcDUyF11/aNI/R
	AwB6m8vpLb2EF50HteS7VvyL8yoZebGPbYwC37Pi26c07+HYZsv3yWMaEL3v0DTrpezwO/Ddgy8Tb
	zOVxen8SfFnbF9Q4waWdhFaGFWi5Vx83rZh9yDdwiV7Kvm9xt8S81GAwHLOpu1kA3+kxl3Tn2NFIn
	xY6rH7v6lF4U5nqoZ93kCRklioq7SyI06fa5+jBJVTtW3/2aQ6V8rsu2Udq9Vtt0tVKExLe9sdGyc
	5RqNAhp/3XBJYA/Ogcjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpxiX-00BenP-00;
	Mon, 09 Oct 2023 21:23:09 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpxiT-00Bemc-1Y
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 21:23:08 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d81f079fe73so5841891276.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 14:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696886582; x=1697491382; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uL0ewLkuzHBQT2y41NjEQzD7MVpvDNSNx6iew+H1Nw8=;
        b=2Wcfuee/1fbnwFrfB+8lgT/S3ZJb8xxIOVmrEtG/x+ej6yj5Eao6WdLdQPjcn1K0jg
         ZfyO/dgytFYj5V8lta3jfyUsdc1Waq96R6Bq30ZIVaPi8bizYMJOvyuPDld2s/FNzCOK
         CvRIrz7IMVUHzLNVwR/+ulw4jn3CPYb2JkjcRS246BYkw+KyBCPQmla3yRp4TdftKT/m
         5PhTK3ZDVF1Lu2jrdclOoB4yJ75myjok9KBZI7ngWcRdGs6QRrr+Nq24jKD48e7yd7oh
         m8s1RMCPHzbUkwHAJ+l6ECx+K6UiHzniMlyB7bY5by72rbrGej/Gr2ykHIjSBIla1TlL
         Im6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696886582; x=1697491382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uL0ewLkuzHBQT2y41NjEQzD7MVpvDNSNx6iew+H1Nw8=;
        b=RFA6vdliN2HWGJ9+fnKy+UDyXYsCamEp75G3OBzsPGugchJf5SNDp0YARG2Bo29FKr
         surdRaXlpBXylmqxTabSdqzYZPqWzgATg8/cj/U1DGMWSgkEXG3ZM5SYVBR8imCoUuMY
         GxX3j2VUqXb+PzgVh8srLLhCD94RINI8qaondHiaXuq50KOJCzygbHIdFfLOxKuzYlko
         dUJwraAb5kCXQ8bjd+bKJ+cbLvwcz1wRGl2hlGV0CJeZ5Pwb3F25bVVS/PCJJNcPqilA
         Q64l5/woGZU9nWU78O/XP1sGldQOtih/fMfzfMy4pWLP/ge+GMaqByt/nFjmxQh9BodJ
         1o6A==
X-Gm-Message-State: AOJu0Yy9+3bv0kuhzpKDCemCNKlkNtHV+8iwtrP2wVZo0dm23ByizvHI
	2lEPA5fgQz+amiKnYGl2bNHfJW6hjAJXkUBJAmcL0w==
X-Google-Smtp-Source: AGHT+IFWc0p6u51fAKRyFsD5XnGHAFf8gAy6kDEPQDhsWl7wnajt3ldzXCuOFULDjik560XMwPQ86SjjvHbpti0emnk=
X-Received: by 2002:a25:27c7:0:b0:d81:ce57:571a with SMTP id
 n190-20020a2527c7000000b00d81ce57571amr14109849ybn.54.1696886582707; Mon, 09
 Oct 2023 14:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230213045351.3945824-1-debug@rivosinc.com> <20230213045351.3945824-16-debug@rivosinc.com>
 <7c4448d1-4622-436f-8779-f52c4f011783@sirena.org.uk>
In-Reply-To: <7c4448d1-4622-436f-8779-f52c4f011783@sirena.org.uk>
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 9 Oct 2023 14:22:51 -0700
Message-ID: <CAKC1njQuw_nzbQ07BGAQOi3C=vr35JhAc6-TB5nzY3zG3Nff3Q@mail.gmail.com>
Subject: Re: [PATCH v1 RFC Zisslpcfi 15/20] sslp prctl: arch-agnostic prctl
 for shadow stack and landing pad instr
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_142305_519420_B7667DE6 
X-CRM114-Status: GOOD (  11.27  )
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

SSBhbSByZWFsbHkgc29ycnkgdG8gaGF2ZSBtaXNzZWQgdGhpcyBhbmQgYmVpbmcgbGF0ZS4KSSBz
YXcgeW91ciBHQ1MgcGF0Y2hlcy4gVGhhbmtzIGZvciBwaWNraW5nIHRoaXMgdXAuCgpPbiBXZWQs
IEp1biA3LCAyMDIzIGF0IDE6MjLigK9QTSBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Cj4gT24gU3VuLCBGZWIgMTIsIDIwMjMgYXQgMDg6NTM6NDRQTSAtMDgwMCwgRGVl
cGFrIEd1cHRhIHdyb3RlOgo+Cj4gPiAraW50IF9fd2VhayBhcmNoX2dldF9zaGFkb3dfc3RhY2tf
c3RhdHVzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdCwgdW5zaWduZWQgbG9uZyBfX3VzZXIgKnN0YXR1
cykKPiA+ICt7Cj4gPiArICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICt9Cj4KPiBIYXZpbmcgbG9v
a2VkIGF0IHRoaXMgZnVydGhlciBpcyB0aGVyZSBhbnkgZ3JlYXQgcmVhc29uIHdoeSB0aGUgc3Rh
dHVzCj4gaXMgcGFzc2VkIGFzIGEgcG9pbnRlcj8gIEl0IHNlZW1zIG5lZWRsZXNzIGVmZm9ydC4K
Ckkgd2FzIHRyeWluZyB0byBiZSBjbGVhbmVyIGhlcmUgdG8gbm90IG92ZXJsb2FkIHJldHVybmVk
IHN0YXR1cyB3aXRoIGEgcG9pbnRlci4KWW91IGNvdWxkIHNheSB0aGF0IGFueSBuZWdhdGl2ZSB2
YWx1ZSBpcyBhbiBlcnJvci4gSSBkb24ndCBoYXZlIGFueQpmYXZvcml0ZXMgaGVyZS4KCi1EZWVw
YWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
