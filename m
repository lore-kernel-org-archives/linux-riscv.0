Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A380C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 11:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1hl1jThMCPQa423VidQ1wFVAxkHtxFYs2qicfd/BQY=; b=1HbxIyC9EDXxIO
	eD0XIjddjPlR7yhcDo14DNSUi1TmhCIo+mcN+SxogHEZ//gt2hbxa7OWIevw+y1KnT73Z8skj6GX+
	fAazC+Fz72ylG9RhPLrlux3BJCqjeM8H1C2/tgBwkhli5GmAlvaGlg/UaPrWZLiLQJfMFfIBkNE4w
	QLjmjclToOt/SsDtb51LD4BZkW7bsackF9u3w9nVxYaLwZ5NWmtuFNOui5/KT3MMQ6U4eDk631a3J
	E7u9W7wjnjOEZ5Bf4s/JuYVYtXMyLTFDpbHX2oL20u+vO8K5vmRYl4aZuNtqje6ri5/5sm2EP0ThC
	lOOcdXYnY2SCfUHrRmMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1outjY-00AIX6-5X; Tue, 15 Nov 2022 11:04:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1outft-00AGFR-1v
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 11:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668510018; x=1700046018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X614lCvRsx/z2rfXeRkDFM2miVmY6jybPGRgrOYbBHg=;
  b=JCG2464la9hGqYnlaWuNI2MF6eHoBnMRUETMVMfKkQAgzrVt550aesUw
   ueN97OTHU1F5ZtpSBss5YL6Kn4w6VubU1AU7fmh9rL3meR1ngt2mO10s8
   rXTJxMkaX5IyXu8zlWKVD2JOG8DIXcdk4y/kPBByUexsVfhXxTH/MP621
   eW5nsyqx4p18nC3duRB+GXwfq0ReqtID7Gsdaj9LeNjjyI5MMZxvoA3gN
   euRZQZzUcgxHKKeEPyXRFkXm3/wPtJHQkaZPaD8npY5zZiHNufF/GGOr8
   V0jlZ6UyD31SntT+UNaORlEQ3s2/3WPiyTL4uR+V4PIZdUTvAKYGfIWNX
   g==;
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; 
   d="scan'208";a="189029819"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Nov 2022 04:00:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 15 Nov 2022 04:00:10 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 15 Nov 2022 04:00:08 -0700
Date: Tue, 15 Nov 2022 10:59:51 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/3] riscv: Kconfig: Enable cpufreq kconfig menu
Message-ID: <Y3NxJ0FpDQMhP05+@wendy>
References: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221115105135.1180490-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221115105135.1180490-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_030017_183049_B8882D3F 
X-CRM114-Status: GOOD (  12.02  )
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

On Tue, Nov 15, 2022 at 10:51:33AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Enable cpufreq kconfig menu for RISC-V.

Yes, please. It was on my todo list to dig this one out and un-archive
it on patchwork:
https://lore.kernel.org/linux-riscv/20220718180713.451507-1-mail@conchuod.ie/

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index fa78595a6089..ce905454a3bf 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -691,6 +691,8 @@ menu "CPU Power Management"
>  
>  source "drivers/cpuidle/Kconfig"
>  
> +source "drivers/cpufreq/Kconfig"
> +
>  endmenu # "CPU Power Management"
>  
>  source "arch/riscv/kvm/Kconfig"
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
