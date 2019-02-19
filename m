Return-Path: <SRS0=ksV6=Q2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF7DC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 02:19:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CF5B2147A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 02:19:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FKK84q7o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="byrxfkxR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CF5B2147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QzYnhsW4SOE0+/Lu2f72kJQiwLP1HXt72Pi6cI/E4DA=; b=FKK84q7ofhEvoR
	oET3iolnpcizhZ4pfVCcxnvGuGdsIapCxWV7rX7lCyPLTE1ZZAsP2BDbcfxy6Tdn45KeXMo6eREnX
	sMZ1lPdJJAczn4Mm1CM0J9H4/r6EmDy4oNPJ+MNutNR49ePyQxrtMrLzlUzmQiegMghJRWXd9CY+Q
	qoTIDFQWJl+GTLfFbO9D4ioRdZVD7vlrYa3qnj/3in2SjnvSAbGGlb4594uO+iYdymEJdfCoKQXND
	7HHqkJRtnPF01cB1zcRE4j7CWpgNscS6o6FxqSJah6pd3nTq0pfoXMYApYza7TWgUehun4aXuJOMq
	NSWqTCKpeVVlENyp2B0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvuzr-0001nS-Mc; Tue, 19 Feb 2019 02:18:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvuzi-0001et-On; Tue, 19 Feb 2019 02:18:52 +0000
Received: from guoren-Inspiron-7460 (23.83.240.247.16clouds.com
 [23.83.240.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1460A2173C;
 Tue, 19 Feb 2019 02:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550542728;
 bh=NSp3Oaux3Z1t7jKHeFE4mdFS+JVFVS9Qtu/OyQGaeso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=byrxfkxRfTqEgl3PxNNOp00BPSlNGIzaj9yzlSWUIkNeG1YRcpEd5MfmLN9s3Czze
 PN3FBT82RdBzrVocjsEpREY1CE/kWqstuFo23cWeCu/q/wssT7HFHmfGgj7QEBMNLm
 4wuniyGMOGrgqxY72h2yntfchLUFR9L8EzMScPak=
Date: Tue, 19 Feb 2019 10:18:34 +0800
From: Guo Ren <guoren@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Mao Han <han_mao@c-sky.com>
Subject: Re: [PATCH 7/8] csky: Use latest system call ABI
Message-ID: <20190219021834.GA4495@guoren-Inspiron-7460>
References: <20190218210712.3503891-1-arnd@arndb.de>
 <20190218210712.3503891-8-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190218210712.3503891-8-arnd@arndb.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_181850_825386_06F0179A 
X-CRM114-Status: GOOD (  14.01  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
 yury.norov@gmail.com, y2038@lists.linaro.org, linux-api@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vineet Gupta <vgupta@synopsys.com>,
 Greentime Hu <green.hu@gmail.com>, linux-hexagon@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Guan Xuetao <gxt@pku.edu.cn>,
 Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Mao Han has merged csky port into glibc 2.29, so we should keep the
__ARCH_WANT_TIME32_SYSCALLS.

F.Y.I:
han_mao@c-sky.com

On Mon, Feb 18, 2019 at 10:07:11PM +0100, Arnd Bergmann wrote:
> We don't yet have an upstream glibc port for csky, so there is no user
> space for the existing ABI, and we can remove the definitions for 32-bit
> time_t, off_t and struct resource.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/csky/Kconfig                   | 1 -
>  arch/csky/include/uapi/asm/unistd.h | 2 --
>  2 files changed, 3 deletions(-)
> 
> diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
> index 6959e0b1e956..398113c845f5 100644
> --- a/arch/csky/Kconfig
> +++ b/arch/csky/Kconfig
> @@ -1,6 +1,5 @@
>  config CSKY
>  	def_bool y
> -	select ARCH_32BIT_OFF_T
>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select ARCH_USE_BUILTIN_BSWAP
> diff --git a/arch/csky/include/uapi/asm/unistd.h b/arch/csky/include/uapi/asm/unistd.h
> index ec60e49cea66..224c9a9ab45b 100644
> --- a/arch/csky/include/uapi/asm/unistd.h
> +++ b/arch/csky/include/uapi/asm/unistd.h
> @@ -2,8 +2,6 @@
>  // Copyright (C) 2018 Hangzhou C-SKY Microsystems co.,ltd.
>  
>  #define __ARCH_WANT_SYS_CLONE
> -#define __ARCH_WANT_SET_GET_RLIMIT
Seems it's not related to y2038 issue. Is __ARCH_WANT_SET_GET_RLIMIT no
use ?

> -#define __ARCH_WANT_TIME32_SYSCALLS

Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
