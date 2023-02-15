Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF6FC636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JjzpnrsBwyCm/n/4Xc2FE+mooI88dRciPoupSq5d9PI=; b=wI0UqS/da+SJMu
	UmSbbEg2eVeLohpjBs0ww9D+PVOxsGy8wR59nOv5mAs56x9zPf9pEXKOxBpX7GAxgmbfHIOgwAkLh
	YL+Hva05LV+AZQt3OBNOX3fmPqp6DJRst8nGLifTayog/gp1a83S5jzNdjx+r/dV4FSpsvjG8JhXv
	1NMWCEVMdrYWcgZZikkDtDEvy65HObxN7RVc/a7MczDX+/M5gxhK39Xx/HN8FFl7VzuRqVpDxEKEs
	WXQQf82eHHwG45SiChgImhAOOAFy4B/7lcVP6wk2HeWZ3pllgecdq+CeK9RJFk61MQ3yUE5NjmTGf
	crZGycUQVgjCJg1Dpc+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJDn-006IKY-Up; Wed, 15 Feb 2023 14:57:23 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJDl-006IIm-B7
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 14:57:22 +0000
Received: by mail-pj1-x1031.google.com with SMTP id z14-20020a17090abd8e00b00233bb9d6bdcso2123356pjr.4
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 06:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+Mbl0g6rewAZqcNNK0K4K6/jg8bNiR+3LrvTe5CXU0=;
        b=R7NKnKseIJblxJGMzPtGV9aTTUQtppTr8LzibxegG+d0lm9BmuOA2OF+BTHeQvqrCe
         5ZNl88t4L823SCvY2yyUs+oAURFnCGq5umOB4sI4z07myF1sal+sU7wxQW+zLtfSYlbk
         MCHMlAAkUGO6h4EW5USkjmIKYSfNPt2SIoyEwPRH5wmYLdkfrAjwCPgZuFZ+KgZzB1j5
         7vsjNve5YkUwuItC+eZ3S95C0XSqxGP0SarpoT7v1eHKaGs+/okzbyNR5SZwBeMkZe+u
         MxsbgOWh34KIUQC/7lZhkDZDDO0+Zr95MB38bIJwXeT1qZOzEsP6Pn9GoywCjHMos9xo
         bwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+Mbl0g6rewAZqcNNK0K4K6/jg8bNiR+3LrvTe5CXU0=;
        b=Z9hZekZ7aWZ+hJBAjiVBu5sKr5Z16P1zaltodXR63QxaLrSc57lumQR4sL1nuiVQWU
         fSMY08Nl9ayaxCh5ETEmcTWlfte2V6+8O+fydGPB4tVnm7sHuge3Ddp10++S2Cg/IIZk
         vvRZGQs5yN6p7vdcreCv9QBKlbLjy4zFyuRg6+IsepEeJTNeux/WEYq6XZi4iI5caVZG
         a3/x96pUXM+lnFcr7TQDelJjQ0rqs6OAJC3/YiVPDoYPba5TqPIfvv0BOHEQEaOD3y4R
         Ajl8k1rfCfc/Sn30GW6VYDW6R0DCv/PrGy1waiooHP3U8e0JjxCp06awNHh3gbBvnCIJ
         rH4g==
X-Gm-Message-State: AO0yUKXNP99JC2ZGr7JHkUozVs6VhANcvVXSPQYaAH4hXsX1o1WsB9PH
	hunRCvhWmdBkP+bSuOtyJvYyzw==
X-Google-Smtp-Source: AK7set+C2IE8RdyZmZIecSJN1ZBeTM0z7D1/QOI9JCjcCUrwDOjXDtQA8SEK7NrNq7HN69Y0dpnGXQ==
X-Received: by 2002:a17:902:e847:b0:19a:84db:76ed with SMTP id t7-20020a170902e84700b0019a84db76edmr3262322plg.15.1676473036641;
        Wed, 15 Feb 2023 06:57:16 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id s17-20020a17090302d100b00198e346c35dsm12318576plk.9.2023.02.15.06.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:57:14 -0800 (PST)
In-Reply-To: <20230212021534.59121-1-samuel@sholland.org>
References: <20230212021534.59121-1-samuel@sholland.org>
Subject: Re: [PATCH 0/2] riscv: Fix alternatives issues on for-next
Message-Id: <167647301913.19800.7426585067377523860.b4-ty@rivosinc.com>
Date: Wed, 15 Feb 2023 06:56:59 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko.stuebner@vrull.eu>,
  Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>,
  Christoph Muellner <christoph.muellner@vrull.eu>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
  Jisheng Zhang <jszhang@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Samuel Holland <samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_065721_397962_CD48D0E3 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 11 Feb 2023 20:15:31 -0600, Samuel Holland wrote:
> Several people have reported that D1 fails to boot on linux-next.
> Patch 1 fixes a bug where early alternative patching used the wrong
> address. Patch 2 fixes a separate issue where the Zbb alternatives
> are incorrectly applied based on the 'C' extension instead of Zbb.
> 
> 
> Samuel Holland (2):
>   riscv: Fix early alternative patching
>   riscv: Fix Zbb alternative IDs
> 
> [...]

Applied, thanks!

[1/2] riscv: Fix early alternative patching
      https://git.kernel.org/palmer/c/bfd6fc5d8014
[2/2] riscv: Fix Zbb alternative IDs
      https://git.kernel.org/palmer/c/d5a7fab7859d

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
