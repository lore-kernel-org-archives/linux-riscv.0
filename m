Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F88FE520D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 11:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d34DWuqRzSyj9WrDeJ5PFO+IfM3gS0fc/6dUMANtDWQ=; b=fhtjx5Ub+LZhyu
	ACHBJ4AV0SqNN1CzMcSFs3r9nS41y5Y+EypgV6R4ry9wYAw24GcezaMDOD8x1i9juHfeAQt8lUMHT
	lkxO/XUndP3wx/GaJa65iSjigXPfL8HY+LcwknwWJ9PJQb1y2a6JuGr3846bGdzaR7MqhQiZdDvsK
	9XFkFtJuQpsDGkVi14VCAICfrnMVCL0SsphXBEV07WygcSv+SOreJh/AcJRgQMUsJvYaOc6MuOmaZ
	uce3kvukQq3uCDE7xhnEEVAngwN+Fb8xb7rZ/JC5p9XNvfVtMstDtIJwrSz6pjD5uN4/RCFOaSBje
	sKWbCWfud2XQfGak4s6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEsT-0000000D8d5-01WB;
	Fri, 24 Apr 2026 11:39:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEsR-0000000D8cR-1Vzf
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Apr 2026 11:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:Date:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fBzgrnBNjfiesiINRb8Kjwu1RT/lkJJT5KYprO6it3U=; b=JlK8zq5wbsZk+579p5CLpuIAYC
	nl1CNdXgt3C8Aujgi1+Kiw+k0R+HPFnLQ6i2UF2egjc9VMnwuqePmppi553Fe3B5NQ1LvY4COQ5Ro
	slMQlz4RB7tVtF7lDbDDSkqLeR+X1NgwXORTeD1sg3s5S1QQKfMc8o6vtO9H+qZtBKbT20jJKGoyX
	Eh69IaMKXSRElCPJGVH5bGPH7AEnD2VbzzDLLEn8ZwuvWoDHUEaAohWjoC3ixX/1MZstgAp7U7Pli
	5fEXj30hgPE2Dwhi2LJm8WxjpGO0nnCkMCtLIGAAbb9He05C4QHIHGlYDekeqzAr2YbZVhG+CtBKm
	hOJM7ewg==;
Received: from mgamail.intel.com ([192.198.163.10])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEsN-0000000EhoT-0WvH
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 11:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777030755; x=1808566755;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=D/JQitqjD6I5FjQx/yh8niVoP84MDIoT3P1quuCU+uI=;
  b=WYR36bh1I1yYtwxFJ0RPt4+jsRH5exrD5LvZzrlq5LpHZ6PcSjMMy7zV
   IH+0yBDnCNBe8K2E7jghhJoLGnMHww/KCgD/og6MBXiQ3l8ruaPC6khd6
   q0X8sJAaUdybn4Id12qko8W0rtr866x75SnaOGUhWvdroDGfH4fO1MEKX
   BVL0YdKMKXQ+exgSscOiZtiqEh46jCmwEDaNRm6LKbnW8ZAiM7SFJalpB
   BQLyC3g8qAhk5NIi6JDmLQ/+tyX5GSX6qydxb8GH/UfCT6uAZ1Rw3Owb2
   7xBSk73bHOZvmtKFkSX+tqUbShmLqIEs/HtKJDg4vXtFM5DskRmEgUeLL
   A==;
X-CSE-ConnectionGUID: PeMdLIWASxGW7OG+xlYZmg==
X-CSE-MsgGUID: y5DQ5NMSSJa9gRCAcPofKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89392456"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="89392456"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 04:39:10 -0700
X-CSE-ConnectionGUID: 2TPjyhGPQZiAHJG0c9fjfw==
X-CSE-MsgGUID: NAKZQ8CkQNyEdV234s4Dyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="234724405"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.120])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 04:39:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Apr 2026 14:38:56 +0300 (EEST)
To: Jia Wang <wangjia@ultrarisc.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
In-Reply-To: <20260424-ultrarisc-serial-v4-2-1765a0b4c4a0@ultrarisc.com>
Message-ID: <4548483c-cbba-899e-6b1a-1290d36b59cd@linux.intel.com>
References: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com> <20260424-ultrarisc-serial-v4-2-1765a0b4c4a0@ultrarisc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_123915_599784_56B961E2 
X-CRM114-Status: GOOD (  14.54  )
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

On Fri, 24 Apr 2026, Jia Wang wrote:

> Replace the magic CPR value for Renesas RZ/N1 with a composition using
> DW_UART_CPR_* bit/field definitions and FIELD_PREP_CONST().
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index 467755bf0092..d3c2c9c84d9f 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -937,7 +937,15 @@ static const struct dw8250_platform_data dw8250_armada_38x_data = {
>  
>  static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
>  	.usr_reg = DW_UART_USR,
> -	.cpr_value = 0x00012f32,
> +	.cpr_value = FIELD_PREP_CONST(DW_UART_CPR_ABP_DATA_WIDTH, 2) |
> +		     DW_UART_CPR_AFCE_MODE |
> +		     DW_UART_CPR_THRE_MODE |
> +		     DW_UART_CPR_ADDITIONAL_FEATURES |
> +		     DW_UART_CPR_FIFO_ACCESS |
> +		     DW_UART_CPR_FIFO_STAT |
> +		     DW_UART_CPR_SHADOW |
> +		     DW_UART_CPR_DMA_EXTRA |
> +		     FIELD_PREP_CONST(DW_UART_CPR_FIFO_MODE, 0x01),

Hmm, maybe there should also be macro also for this one which takes the 
fifosize as input and converts it to CPR field vlaue (effectively, the 
macro is an inverse of DW_UART_CPR_FIFO_SIZE()). It would be more readable 
than the literal.

Also include BUILD_BUG_ON(!IS_ALIGNED(fifosize, 16) + bounds checks) 
inside that macro to catch invalid fifo sizes (+ don't forget the 
necessary headers for those two new things).


-- 
 i.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
