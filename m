Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C18C001E0
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 07:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVLPKmS5w0Y/1Vzzts9Sf+xeSujUod6sF7gAfcez+X8=; b=r4xmWV3ivFcm9r
	BmH4wQiXtMC6B2XVsyaVuyDLZdWZUzSdDTcvn74QqlAydDKlwX5C+6v5xgXEMObWhDL7uOdI0Rrxt
	YF7ZUa0IEJFrKerjipOzT7Us6yr4rOPQyqfWsaLPm2t0WnUQ9TQDDmK3FCwDQj2MIqRh/7580M+Ic
	zJenSjEEEZ6+/BGXtFkHHJ4c6Wy0rwOjeSWKvL29L+f+VHb7vj0W5pTu05/JrP6HQYV8cKgymq3Qk
	6nubkcjqVHrqTk1i5IVM/UOipcDFvrcw4kl5CW63LeWa5YS1mPERN/0CF6tEzcZjswRxcMmoRg6K+
	xDVd4hJiMgPnVX0epyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRT0w-006uxW-0B;
	Thu, 03 Aug 2023 07:44:54 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRT0t-006uwW-0x
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 07:44:52 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9891c73e0fbso142183066b.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 00:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691048689; x=1691653489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CSSRhpwsXf70z+1rxlQ2+hkymtm2lwEBhyh07kPB2pk=;
        b=hVshpXD1f4VzOD4XcxN3LbCb5HapivOPgFQ+ILU0E4alQRUTVmJwgTwVgUvmzBMszt
         NDqQtPAZmoLrTkgoPimF8eEzhIDPdpAKz+2EKqLtmx7HB/j2CAUcEcg/+5rMoDpwE0nO
         3eWEEAyYy1dNbtgfyBWfxn0dYcGaX5y2VC5pxwRD13Nkz2YIkx8/HrOFqbbgo1cDi1xv
         RefAjQl5EQ0h6nMKJja2YklPKW0V8kuY+qiTMI5yn3SCwLsVjJpvexcAFsqNgXTVLnRH
         QkGpbWuDmvFT02VSc55AQg68lHgTe2htKOM4EvvpIE/Tk4ZGfEhGvwHg19itDFbM26AX
         qdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691048689; x=1691653489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSSRhpwsXf70z+1rxlQ2+hkymtm2lwEBhyh07kPB2pk=;
        b=a0Jz5EV5ts/Wekcb4zWMgwWYVkYzmkuiQbrsIUgNpXqdR64twlSKb8O8nEiZO0ONYc
         gb3AF0UI46ACvY8O2dpE0C18kLZCHO5RfnzXHGC8y32soT5L9v1P8S5R4Hs8L3EsZRnG
         Ne19etRVZItEevvjcnxSv+5yhKndBrHeKxTZxTYPE9FLYC9gJAlLgKM5mpf9xEgxFDFN
         B6g1AllOT+4zbo1G27iayEGCa/CAofiu+0IvY3Mikt/aYjeCrxuxHtpndoBDV95NWO+B
         e9PhDkwYD8kplPhiPmm4YVn2vvWVRN8sRZNTz8nUBLbeJCcOBTQvZYMkEeLV59GecIm9
         hB/A==
X-Gm-Message-State: ABy/qLYjhuDp2Ydl6ATEfX2mqwn7SjQt5zmsqpGNPRC4L12eHrGVSxlo
	NyHPcdpJYMQ5mJEewzAu2xa4vg==
X-Google-Smtp-Source: APBJJlHdMEoyrcmNp/byt0aZUIBGbZ/dYH98Vd4bOX3Z9OBMzCaUzxR0W2Ed2cfgzDFl1sbdTUlvww==
X-Received: by 2002:a17:906:8a4d:b0:993:da0b:8783 with SMTP id gx13-20020a1709068a4d00b00993da0b8783mr8855806ejc.3.1691048689638;
        Thu, 03 Aug 2023 00:44:49 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id si15-20020a170906cecf00b00993004239a4sm10128648ejb.215.2023.08.03.00.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 00:44:49 -0700 (PDT)
Date: Thu, 3 Aug 2023 10:44:47 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Guo Ren <guoren@kernel.org>
Cc: Haibo Xu <xiaobo55x@gmail.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Sean Christopherson <seanjc@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Marc Zyngier <maz@kernel.org>, 
	Colton Lewis <coltonlewis@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] tools: riscv: Add header file csr.h
Message-ID: <20230803-5b7e7c0d95597b004764a296@orel>
References: <cover.1690364259.git.haibo1.xu@intel.com>
 <35ce2b9f7ca655eb3af13730b1ca9f05b518e08f.1690364259.git.haibo1.xu@intel.com>
 <20230728-879500f157954d849fb303ec@orel>
 <CAJve8onDLEC1JFdERi098sTmN3-UkwaJ1aJz3CJNYU-GShkEyg@mail.gmail.com>
 <ZMsbXk4JU/Ung7qu@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMsbXk4JU/Ung7qu@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_004451_335804_C5B6C835 
X-CRM114-Status: GOOD (  15.14  )
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

T24gV2VkLCBBdWcgMDIsIDIwMjMgYXQgMTE6MTM6MzRQTSAtMDQwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBXZWQsIEF1ZyAwMiwgMjAyMyBhdCAxMDowNTowMEFNICswODAwLCBIYWlibyBYdSB3cm90
ZToKPiA+IE9uIEZyaSwgSnVsIDI4LCAyMDIzIGF0IDU6NDPigK9QTSBBbmRyZXcgSm9uZXMgPGFq
b25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVGh1LCBKdWwgMjcs
IDIwMjMgYXQgMDM6MjA6MDVQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+ID4gQm9ycm93
IHNvbWUgb2YgdGhlIGNzciBkZWZpbml0aW9ucyBhbmQgb3BlcmF0aW9ucyBmcm9tIGtlcm5lbCdz
Cj4gPiA+ID4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB0byB0b29scy8gZm9yIHJpc2N2
Lgo+ID4gPgo+ID4gPiBZb3Ugc2hvdWxkIGNvcHkgdGhlIGVudGlyZSBmaWxlIHZlcmJhdGltLgo+
ID4gPgo+ID4gCj4gPiBPaywgd2lsbCBjb3B5IGFsbCB0aGUgZGVmaW5pdGlvbnMgaW4gdGhlIG9y
aWdpbmFsIGNzci5oCj4gV2h5IG5vdCBpbmNsdWRlIHRoZSBvcmlnaW5hbCBvbmU/IE1haW50YWlu
IHRoZSBvbmUgY3NyLmggaXMgbW9yZQo+IGNvbWZvcnRhYmxlLgoKc2VsZnRlc3RzIGFuZCBvdGhl
ciB1c2Vyc3BhY2UgdG9vbHMgY2FuJ3QgYWx3YXlzIGNvbXBpbGUgd2hlbiBpbmNsdWRpbmcgYQpr
ZXJuZWwgaGVhZGVyIHdpdGhvdXQgbW9kaWZ5aW5nIHRoZSBoZWFkZXIgaW4gc29tZSB3YXkuIFJh
dGhlciB0aGFuCnBvbGx1dGluZyBoZWFkZXJzIHdpdGggI2lmZGVmZmVyeSwgdGhlIHByYWN0aWNl
IGhhcyBiZWVuIHRvIGNvcHkgbmVjZXNzYXJ5CmhlYWRlcnMgdG8gdG9vbHMvaW5jbHVkZSBhbmQg
bW9kaWZ5IGlmIG5lY2Vzc2FyeS4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
