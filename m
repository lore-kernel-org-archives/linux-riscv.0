Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8802C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 16:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTei7+1jesHzBTzakF09RsjJEjxR8g+TJS8TXQ//7CU=; b=T0ezFG3sstmfRM
	X8Qh7MzaHx+vGEwRdo6WUksZ0XMn45hDsHlO+T3FApYl1nQtXMjactth3qm00uBit2V7bdqmy+ENR
	L9Tdz00s0NknWVCnFN2akZx2m+bpJ6PAH/aDo9K+I+Cscv+mDj5IMhpqCZPI8u5uxBb4t9cH+pqRy
	PYXVH7x4Sd+Evy4atdPen6QZUgcdsCDZ2TRUpmvAHFgm9C8Bd9ftZw3odXnXCuNV05hc3hwZPhPvy
	zzxn5MFQoe1b4CUYsEW+/s247uav6NzofYMAAPfOIISYpRUGd920jApKEQIqQuZeu8DsPwY3luYRW
	T0PCKxEyl1SNwOKsautQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oagYb-005HK9-FE; Tue, 20 Sep 2022 16:57:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oagYY-005HIU-8e
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 16:57:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 15D63CE19CD;
	Tue, 20 Sep 2022 16:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF674C433C1;
	Tue, 20 Sep 2022 16:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663693023;
	bh=90qrbtTDZSrLP+0IRejeJNo4OYKsU9a720uvmW8b7UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rc79zwJmsfbix8+q++BIS5ydiePVNvX84CMPmGRtpu+h+dS/XS8wz/eqKPuHMI0yP
	 AKmNliPVlbMECRsG6AwfOAjQjO3U6t360mW0IcaC8BEzkq0+7oeQpF1/DJsYuz6Of8
	 2pQd+kJGzhvUDnb5fT/amu0uj8CfOSHPbU1Ww49XUwiAm9ufo2JMwzYSEWjcswA94f
	 uAXl2Sb2ksR2cjt/nPuEdPEDnqh8kR8QEuumU9SYtKt1evHHN2+EockhHdix+TLtlN
	 kM4CVGRddtkyHBhV2/6qjnlmGK4ORGmxzoxOGLrwO459pM+x0SnDE18DSjYMtDTKnk
	 KhION+L0SvCYA==
Date: Tue, 20 Sep 2022 17:56:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] Documentation: RISC-V: Fix a typo in patch-acceptance
Message-ID: <Yynw26jVIvHSSQ+6@spud>
References: <20220920140138.27210-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920140138.27210-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_095710_513783_1B12B045 
X-CRM114-Status: GOOD (  20.37  )
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

On Tue, Sep 20, 2022 at 07:01:37AM -0700, Palmer Dabbelt wrote:
> I just stumbled on this when modifying the docs.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  Documentation/riscv/patch-acceptance.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index dfe0ac5624fb..5da6f9b273d6 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -29,7 +29,7 @@ their own custom extensions.  These custom extensions aren't required
>  to go through any review or ratification process by the RISC-V
>  Foundation.  To avoid the maintenance complexity and potential
>  performance impact of adding kernel code for implementor-specific

s/implementor/implementer no? Or is this an American spelling?

> -RISC-V extensions, we'll only to accept patches for extensions that
> +RISC-V extensions, we'll only accept patches for extensions that
>  have been officially frozen or ratified by the RISC-V Foundation.
>  (Implementors, may, of course, maintain their own Linux kernel trees
>  containing code for any custom extensions that they wish.)
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
