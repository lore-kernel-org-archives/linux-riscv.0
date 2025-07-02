Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04259C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 19:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ELH8VEsWrZhsz0znxWm6NLQLx6WGbe63V+jgkzs9Hj4=; b=Y/d8sS4yO8tNxh
	yQ3Lht2/Vw5liLbwKB9APMoajjWqdAkZri3YkIFYFPw63BlF0wWkreQVQo7mZuccOMn5BAgKPTOiQ
	FaD52RzfuFseARK3QrWpQA2A041KqYdHjKm/1bukrU1bLUU6ORyvElG3JRsTSbH/9TnxlpIxmLIHy
	AXm3R5+eKQbrgBAoQyz06e4E2FCeKVdBidmPDwryeF03TXJqxGLHOdhJcZ/IWTOsEosse1jW+zEmQ
	n2WQOTsYiS89xxoBHDsmW7XxGcECRvK8EEZ8sy2R9EcjbXvG93p3mTPPghP1kig9UmdF8yGYVnqkz
	b5dODoJtxacj3qJaHAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX3Ru-00000009Qzt-1ysd;
	Wed, 02 Jul 2025 19:48:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX3Rs-00000009QzX-0OPQ
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 19:48:53 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751485730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gtg8I9VJThVmsyZdxQvLxh1iCecNQnK7i75deA60sMU=;
	b=Wu1IOp6CAnr71Ttqor/QQE8OnhKSMKAwvIW4S00WfbiAC6t2vTRNWH2zTyw/TZmq+EPBOC
	f8b4XeNDR6KzO+CZ33g6OW2iA30krerlB41xDwT0FlYAn9WKw/xdDdOJey7wQYj3thWK4r
	uPJ2dPyPvjsoeVTiqnqzJdlmAtJhfc/LKRMuCf4e6D1s+icwy+BcUmtJOygZsGA09fB8oZ
	Ezu/uBDhfmL0YVP28G9brqtunLKDJ1tadAN+E8nWAr0ChMZgGz+BTLdBeM5m/rhEAfI7N7
	2VJ8LHbmDNPoZcX3NWtcMqOE0SnBu8IskYcjUhnAhlvRWAWts44yUod9NPjbYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751485730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gtg8I9VJThVmsyZdxQvLxh1iCecNQnK7i75deA60sMU=;
	b=9q+FwSv3rnTapDv314sP95E6GfsCIOz4brMU7S3/vB+Xe2yHlr2EtLSbYvWIpMqgxGX4It
	cmjMSl58LJm4azBw==
To: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones
 <ajones@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v3] irqchip/riscv-imsic: Add kernel parameter to disable
 IPIs
In-Reply-To: <20250702122434.1514328-1-apatel@ventanamicro.com>
References: <20250702122434.1514328-1-apatel@ventanamicro.com>
Date: Wed, 02 Jul 2025 21:48:49 +0200
Message-ID: <871pqyl6fy.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_124852_268687_A8F9092E 
X-CRM114-Status: UNSURE (   5.91  )
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

On Wed, Jul 02 2025 at 17:54, Anup Patel wrote:
>  #include <linux/cpu.h>
>  #include <linux/export.h>

            ^^^ Neither in tip/irq/drivers nor in Linus tree ...

patching file drivers/irqchip/irq-riscv-imsic-early.c
Hunk #1 FAILED at 9.

>  #include <linux/interrupt.h>
> +#include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip.h>
> @@ -22,6 +23,14 @@
>  #include "irq-riscv-imsic-state.h"
>  
>  static int imsic_parent_irq;
> +bool imsic_noipi;    

__ro_after_init? No?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
