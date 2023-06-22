Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46422EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 19:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=JZEPmsf0cpmSyok3DHlCHrLzJnNwgRK8N7hNlG6ShEk=; b=wTNUrQvE7ZJnlgA+BKIvPkRH9g
	IUJu5m8aGuE0CXV9tUuME6RK5wj2e9fbjBO+ODMp3aaH2v6teyLHptVVOJOt4pEBU/rWvii/hWc5d
	XAJyTtEyFZ3GaVDA0Jpl9MSRozc0PPicUCVYYOpobjkhb1MmE9vDU+whVdM86I1YodB3Jdmgj/r7a
	9FYO23bbYY7A+/LhGw9nG4b86actKX1rILdndHayxfKS58VsOzjw5k+nEIDeMuRPMlvaLtnWF/rWp
	nNgzm7CNafDfgxDdOl/Tedx2Gw3avi5EeWcH5HlbJ/2PHBfx8779sKMf7wOgBgQtNwHHqDAJqoumT
	WbRalELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCQD8-001aFZ-30;
	Thu, 22 Jun 2023 19:43:18 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCQD5-001aEz-1n
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 19:43:17 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3942c6584f0so4985198b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 12:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687462994; x=1690054994;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3T11uxBhIjGWzq3ibADFPBxygIm6nnj3hVsi3PNKGSA=;
        b=xo1/ZwUQaNDkC4rDA90YGndxKNvE0D28jIdXnxVPwuvLsh34JQk/FeE5HsUcSbQC3f
         3WCHDoFRWiV1D229OnTV/wcoeRyigg8efklJh0pkajVzuEcSff3qf9yWkbWcFonOBrCV
         OJM2AQ9VfHH1rVjVNO7MFICuRP1ee3yZpppZweUpiVx2ru21r3+tl0J6Lx/lHrbaeTI2
         7L+DClFsnYxO0/fD2aMargKtjMqSJV9R0hn0l/kJI4quI4qt7hW0OmmT+wcI/nReY5MJ
         22EizoFPM2b1r+jyIYyfPrkiiXo/PfQGmoLVy1oEqB3K9eT9GCMk1nPLCFA6+xn1dMxW
         gkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687462994; x=1690054994;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3T11uxBhIjGWzq3ibADFPBxygIm6nnj3hVsi3PNKGSA=;
        b=LDnidyR0hLL6jRp+s++C56+0W+qLbjZpcR6CiVfJnwoMAT7djOBGW7VINNY8FapVgR
         Rb3eX0corxZuh309GdYYcmWT6PSFv6KvLBxHRjKZ2guFpHnL7odlD3KPhMfJJPzvfCGq
         XSV58A/ecCOrtv2CiM0kLrMZRTZf8ZtcVF1opnQedT3yEVgcym/HUC12PhKkMwI1p2Ua
         JjIt9Oldr0uGDCwMHqVOc52164C86Axcsomi6h9AYqP1T1ErBCLF676zJ0RoMoN/AidQ
         r1yRIc2u32/HFh71bDwGUqc+DVv37yKFnng21Zj2ZqLOw4rkv02kyXz0dwHwVNPat7Xs
         Rb7g==
X-Gm-Message-State: AC+VfDzGl7ihVRhPI5tDPgAQ7AMOQ6p8JhNGbO0sCMHu6ZAr23HpxCcn
	1vAnUQvNeRsLxH9GTqCDm+woAg==
X-Google-Smtp-Source: ACHHUZ5WaibaXi8GDeiG3MswMLiamw5o+dUTYjXfQhHtuaUX2w3ZX/M/khKv/POfy1MNBzVRFwyCaw==
X-Received: by 2002:a05:6808:20f:b0:3a0:5596:efe8 with SMTP id l15-20020a056808020f00b003a05596efe8mr4046410oie.54.1687462994158;
        Thu, 22 Jun 2023 12:43:14 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q23-20020a635057000000b0054fd1723554sm5075167pgl.21.2023.06.22.12.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 12:43:13 -0700 (PDT)
Date: Thu, 22 Jun 2023 12:43:13 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 12:42:32 PDT (-0700)
Subject: Re: [PATCH v2] dt-bindings: riscv: deprecate riscv,isa
In-Reply-To: <20230622-stipend-flashily-97917469f39b@spud>
CC: Conor Dooley <conor.dooley@microchip.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Alistair Francis <Alistair.Francis@wdc.com>, ajones@ventanamicro.com, apatel@ventanamicro.com, atishp@atishpatra.org,
  jrtc27@jrtc27.com, rick@andestech.com, ycliang@andestech.com, oleksii.kurochko@gmail.com,
  linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org, u-boot@lists.denx.de, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-9e03f021-961d-44f3-81c1-9c09abd3662b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_124315_819147_466C4827 
X-CRM114-Status: GOOD (  12.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 22 Jun 2023 11:59:32 PDT (-0700), Conor Dooley wrote:
> On Thu, Jun 22, 2023 at 11:25:35AM -0700, Palmer Dabbelt wrote:
>
>> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> 
>> I'm not wed to any particular encoding for the properties, IMO that's more
>> of a decision for the DT folks.  IMO the important bit is to just get away
>> from ISA strings and move towards some tightly-specified properties that
>> indicate how the HW actually behaves.
>
> I'm going to resubmit with Rob's list of strings. I'll keep your tags,
> since the spirit of the patch will be the same, with enforced meanings
> for each extension.

Works for me, thanks.

>
> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
