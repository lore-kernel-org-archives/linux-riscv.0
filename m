Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5766EC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxyM4PniBNM2C70gaWCmzHZIJwacdLXt7wW+xHTstX0=; b=PABemBpYrpWFjk
	lHuF1CagujuJ7WqCm7bGR8SBJpJ7FZydRNg9jx9ZUuOHonThNzf3lQKMy15UtsVApw7hqVBRb2dcp
	gidbbWMbgiTD919fUW/iD2/V8PLc0z7Erv+KqsROVBwKwLM9g993DxA96ZXLG8BiuX3MIqDrQAZa+
	hdScKhFPrx4VHlb9FVTfbE2NRXqQ5LwZ6jNCVMFWBAdMgKEEkNaD15pVO0fNhcWUNwsQOMrDu4o/l
	To4LXui5eocTbNGkaPWifMA1R0g9KJ2rcPcsiewhJCcBVu2OyzleyRltSzfCT1I7imb6UaG3gKA8r
	SY8A+MqmCOIRivUjT2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0lUR-008E6i-5T; Thu, 01 Dec 2022 15:28:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0lUN-008E2c-Gq
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 15:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669908520; x=1701444520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8eDwBDESw/gPbMuGOrqIjfdT/B1sRstTWnlMgk4CnK0=;
  b=Ko5Us5ZgVLSJlrj6uakrTokY7Kxd6SuYIpMmNsoqgB386pTSNgFHgsSN
   qCKufi0ZcSawmCFms4W0hnXO000JVT8pOj3+br9pwZ/wJD7KT4n1TPJhY
   YuUzr6VUDE1RroabrmMA0W1VTweE4zF3vh9Dcujfvm2Ed443UCBTaAmyx
   rkSwlMqvE243Sc7m4SH5SEP7ZriBwo7FP0YMGRHuNMMlLA1ykJYIZLUE+
   3I9DQUj9jIBy55Uzj3KsmE0OcOcVLAoNjtKavdcXivZGBYu6avuYZncsa
   1kkkRbKKU2Ff2UD7v5k/CLwsho4Rbu3E+dkaInOz+B2eerr2juK0k92fl
   A==;
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; 
   d="scan'208";a="186083997"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Dec 2022 08:28:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Dec 2022 08:28:31 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Dec 2022 08:28:29 -0700
Date: Thu, 1 Dec 2022 15:28:10 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
CC: <guoren@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <apatel@ventanamicro.com>, <atishp@atishpatra.org>,
	<heiko@sntech.de>, <anshuman.khandual@arm.com>, <liaochang1@huawei.com>,
	<juerg.haefliger@canonical.com>, <wangkefeng.wang@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] riscv : select
 FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Message-ID: <Y4jICn5oxLozsv6m@wendy>
References: <20221201151336.8044-1-suagrfillet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221201151336.8044-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_072839_653515_212EC1AC 
X-CRM114-Status: GOOD (  15.96  )
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

On Thu, Dec 01, 2022 at 11:13:36PM +0800, Song Shuai wrote:
> In RISC-V, -fpatchable-function-entry option is used to support
> dynamic ftrace in this commit afc76b8b8011 ("riscv: Using
> PATCHABLE_FUNCTION_ENTRY instead of MCOUNT"). So recordmcount
> don't have to be called to create the __mcount_loc section before
> the vmlinux linking.
> 
> Here selects FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY to tell
> Makefile not to run recordmcount.
> 
> Link_v1: https://lore.kernel.org/linux-riscv/CAAYs2=j3Eak9vU6xbAw0zPuoh00rh8v5C2U3fePkokZFibWs2g@mail.gmail.com/T/#t
> Link_v2: https://lore.kernel.org/linux-riscv/CAAYs2=iYn8sLQB8oh+RzTKd2VKs8MXOLX6Mwpamx5gdVVN6mkA@mail.gmail.com/T/#m62138d7a76664798d00051818a438a601eff4cf1

Hey Song Shuai,

For future patches, please use normal "Link:" tags. If you're just
linking to prior versions of the patch, just put them below the ---
line so they don't end up in the git history.

Please don't resend for this alone :)

Thanks,
Conor.

> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> Tested-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 572973103d73..c19cddb8feb9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -277,6 +277,7 @@ config ARCH_RV64I
>  	select 64BIT
>  	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>  	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
> +	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if DYNAMIC_FTRACE
>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>  	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SAMPLE_FTRACE_DIRECT
> -- 
> 2.20.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
