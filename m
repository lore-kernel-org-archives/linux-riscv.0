Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED35C47082
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 22:45:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8FB06105A
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 22:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8FB06105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LTYvmDUqJ6GNUnvfrrQRnWnY/KkAGKufA7oRYvvkLF4=; b=YTSX1AXnmoGETgUSzVafZF9gsx
	Gut6o0XgVCj9ZsMU7pcR9hWI/BS2mdU3W/X56t4wUv11W58Z30OEOpR4uRf87YNp5/wZTL+ytubko
	mr2yeSHBUye31dMT3yFcO8/Pynw9dEYESOy1Vguv2+Dea0WqInaceFb0RLC7XgWDV0uyfwMGRARIe
	GAsbUO2lcavJVCiTmonaJHmQOlEWfYNXdM+pmO7vDv11Trtvnkvu++DaqkaBWNMFEteN3AMRIFY/3
	FMyK04Rkye4ywLlBY9zg89pN1hTVjUSaKr84MeqeFcoll5ulqiYuJnOXYg6dE/oHe5odKOe7S0aZb
	QoIW6MtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln7hY-008W7O-F0; Sat, 29 May 2021 22:45:04 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln7hV-008W62-9q
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 22:45:02 +0000
Received: by mail-pl1-x62f.google.com with SMTP id v13so3331121ple.9
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 15:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=QdAbDnERBsqqqZlDK/g4pI9/2J/fe7PAQ8nVc8saF5U=;
 b=Sp4NhLsDtuuxZHQ1WGu+doDMbpmQwg6H3QTyLVQ0Ji4jRsd6hxA9x4DoRurcF+DhEp
 eLT7LTEx65AsIYTMrnBf7/lL0Js+vMLl/DXMlU2nCRmhz6x2fRpKHR74mIsqCg+p7dFy
 sycMZosMyT+PtGJiypj97ZBWxSB93brsSy/Zc6WUfmfnfG0EVbplcDTqFnWShJATTGKm
 2KIZyD8PW+qRq00AWmbshPbNThmRSwrjni0p+LxMC4/j7/I2mUE2klXK3QxeSGdKiHvD
 eMFcMIARzuqB0TgF16RfvLUgJgtusIRYRL0CVFfQ7MsNvL/KK/LnGI4wJW05/JD8hzzl
 wWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=QdAbDnERBsqqqZlDK/g4pI9/2J/fe7PAQ8nVc8saF5U=;
 b=aLu6TD7wtC/SnIgoS6OVUp/Rv+ZLI/ghddTIvaGZ2jNoZ8Y21JIHZDJ4nnctp7ZhQa
 00qXsCogx67R3YTv3Ie0v4RuJ6cpy0MTqtTrBGnrSfjbSqnTvE3VSPXJW48E1l4YIqWg
 Zez8XxZqoLJtazYULshX/dmgNF4ylsanQmhQnc2yUB7+ltuKwK9sVoC9pw4G0mvS+vw8
 4HT1lW7Imo6VQPWbSXZLi29Q1QCMJcSXTN4HZuJpc6bDIrCvifKgzGRtFaE4npP/GjwW
 7CviiLzKqaHXCooigK+2AvBBbgScVU0hrqvbwyzzW3+YiyJr53YMG8/E6+b1QKvIXm67
 HZJQ==
X-Gm-Message-State: AOAM530xkg4aQuode43bvFKqz3NqwtvlUUBS7IU/cIi4np8O+T8Vn50x
 XXUyMZX5C4PIBeb1sVGQW/lC/bhMP+GB3Q==
X-Google-Smtp-Source: ABdhPJw9qbIMHVnncTQR58bkFEMkDWGggFl2fYrCOKwH4Ga+vR8jNSvN0MZa5ioDkIK7d2SgHOtfdQ==
X-Received: by 2002:a17:90a:de07:: with SMTP id
 m7mr4330380pjv.100.1622328299762; 
 Sat, 29 May 2021 15:44:59 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b12sm8091809pgs.52.2021.05.29.15.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 15:44:59 -0700 (PDT)
Date: Sat, 29 May 2021 15:44:59 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 14:35:12 PDT (-0700)
Subject: Re: [PATCH] riscv: skip errata_cip_453.o if
 CONFIG_ERRATA_SIFIVE_CIP_453 is disabled
In-Reply-To: <1621640415-24971-1-git-send-email-vincent.chen@sifive.com>
CC: linux-riscv@lists.infradead.org, vincent.chen@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-3d2cfdd1-82ed-42b9-aaeb-fb0790e24cfc@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_154501_438385_6904BE48 
X-CRM114-Status: GOOD (  16.67  )
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

On Fri, 21 May 2021 16:40:15 PDT (-0700), vincent.chen@sifive.com wrote:
> From: Vincent <vincent.chen@sifive.com>
>
> The errata_cip_453.o should be built only when the Kconfig
> CONFIG_ERRATA_SIFIVE_CIP_453 is enabled.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Vincent <vincent.chen@sifive.com>
> Fixes: 0e0d4992517f ("riscv: enable SiFive errata CIP-453 and CIP-1200 Kconfig only if CONFIG_64BIT=y")
> ---
>  arch/riscv/errata/sifive/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/errata/sifive/Makefile b/arch/riscv/errata/sifive/Makefile
> index bdd5fc843b8e..2fde48db0619 100644
> --- a/arch/riscv/errata/sifive/Makefile
> +++ b/arch/riscv/errata/sifive/Makefile
> @@ -1,2 +1,2 @@
> -obj-y += errata_cip_453.o
> +obj-$(CONFIG_ERRATA_SIFIVE_CIP_453) += errata_cip_453.o
>  obj-y += errata.o

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
