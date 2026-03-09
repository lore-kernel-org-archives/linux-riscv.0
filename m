Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9E2EFCD6A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 09:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkQzpXrracmbbxtX7vSqAymNBGYkzLLb+mITRKy1nLg=; b=j/+ohnIhDqAzlD
	SWAX5zpAJes+HbIL7FJAO7kyWLIJPr7eV+nXzgW4C4M9Z0i5rHbcizdZUtFins4GfK6tbkLcSao69
	KH42eKcwae4XlJbepeA9nqlnHi5/VyBf1t+O7sGw6dfyRsNAfy1qo7OuXdAayyLOjUgSwDWJa/xe1
	/cmb9LJxLgJCZQLdOhDR9J/Cj2VQoBLVXbslSNfEfKIfn3/f9myXUhnDs96PoRP8sgiZyiz9dOZO7
	AHowixclq/rWKD9HpXq2nICjivNKHLqQ8K1SVZuVmcYEN56ghh/FGhBtS5bcXJcYlRxBwTPnzkPVQ
	IkrgEffwPzUZQYlGnePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWjg-00000006wyL-1Jjc;
	Mon, 09 Mar 2026 09:17:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWje-00000006wy7-1YA5
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 09:17:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01176600AD;
	Mon,  9 Mar 2026 09:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B4CC4CEF7;
	Mon,  9 Mar 2026 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773047828;
	bh=AOq78/xUyD/cvsmtwcE4UeNHcHh26M25Rpqpzr9frWQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=khkcHtmTOmF8C3/XyMez0tQ8r3bYiKTto9pyHzI50pE8wtCHwkD/ZNJXhhJ4aJ42I
	 1BLardMK6qQMqYYxZxSmTPaaAdS1lCIMbQ9twYgSabLZGpAp1SGDCcjWktcKaz2Hey
	 57oelZJramA6H0xmmQHWCWGB33ScpJsvF4GQGHKyiogN+np4NQLbOAgo0egL/h7Jbs
	 h9vHX+dxj5zq5wdzFoXThac23/f5BA2KL7Rtmg6FDxkrmxTZ28rjKH2J2FhZjvt3t/
	 HAemAp4/iUNpAHvB/grm8eDEUPo2vQ042Gx5GM4J0/diCI0t+i4ocoZ/MLxXIeqYNW
	 PbXkbtaYvgLlw==
From: Thomas Gleixner <tglx@kernel.org>
To: liu.xuemei1@zte.com.cn, anup@brainfault.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 liujingqi@lanxincomputing.com, cyan.yang@sifive.com, nick.hu@sifive.com,
 yongxuan.wang@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/riscv-aplic: Register syscore operations only once
In-Reply-To: <20260309161140133ZhM76Wt3uPliHU5_R8O0j@zte.com.cn>
References: <20260309161140133ZhM76Wt3uPliHU5_R8O0j@zte.com.cn>
Date: Mon, 09 Mar 2026 10:17:04 +0100
Message-ID: <87ms0hs6pb.ffs@tglx>
MIME-Version: 1.0
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

On Mon, Mar 09 2026 at 16:11, liu wrote:
> From: Jessica Liu <liu.xuemei1@zte.com.cn>
>
> We can have multiple APLIC instances so setup global state

s/We/A system/

Also which global state are you referring to? 

> and resgister syscore operations only once.

register

You also fail to describe what the problem is caused by registering the
syscore ops more than once. 

> Fixes: 95a8ddde3660 ("irqchip/riscv-aplic: Preserve APLIC states across suspend/resume")
> Signed-off-by: Jessica Liu <liu.xuemei1@zte.com.cn>
> ---
>  drivers/irqchip/irq-riscv-aplic-main.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
> index 4495ca26abf5..8299e0da6577 100644
> --- a/drivers/irqchip/irq-riscv-aplic-main.c
> +++ b/drivers/irqchip/irq-riscv-aplic-main.c
> @@ -20,6 +20,7 @@
>  #include "irq-riscv-aplic-main.h"
>
>  static LIST_HEAD(aplics);
> +static bool aplic_global_setup_done __ro_after_init;

Again. That global state reference is confusing at best.

>  static void aplic_restore_states(struct aplic_priv *priv)
>  {
> @@ -375,8 +376,10 @@ static int aplic_probe(struct platform_device *pdev)
>  	if (rc)
>  		dev_err_probe(dev, rc, "failed to setup APLIC in %s mode\n",
>  			      msi_mode ? "MSI" : "direct");
> -	else
> +	else if (!aplic_global_setup_done) {
>  		register_syscore(&aplic_syscore);
> +		aplic_global_setup_done = true;
> +	}

Aside of violating the bracket rules, this code is broken already in a
very subtle way:

If the probe fails then it should not invoke
acpi_dev_clear_dependencies() either.

Something like the below makes it entirely clear what this is about.

The fix for the probe fail vs. acpi dependencies obviously wants to be
split out into a separate patch.

Thanks,

        tglx
---
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -116,6 +116,16 @@ static struct syscore aplic_syscore = {
 	.ops = &aplic_syscore_ops,
 };
 
+static bool aplic_syscore_registered __ro_after_init;
+
+static void aplic_syscore_init(void);
+{
+	if (!aplic_syscore_registered) {
+		register_syscore(&aplic_syscore);
+		aplic_syscore_registered = true;
+	}
+}
+
 static int aplic_pm_notifier(struct notifier_block *nb, unsigned long action, void *data)
 {
 	struct aplic_priv *priv = container_of(nb, struct aplic_priv, genpd_nb);
@@ -372,18 +382,20 @@ static int aplic_probe(struct platform_d
 		rc = aplic_msi_setup(dev, regs);
 	else
 		rc = aplic_direct_setup(dev, regs);
-	if (rc)
+
+	if (rc) {
 		dev_err_probe(dev, rc, "failed to setup APLIC in %s mode\n",
 			      msi_mode ? "MSI" : "direct");
-	else
-		register_syscore(&aplic_syscore);
+		return rc;
+	}
+
+	aplic_syscore_register();
 
 #ifdef CONFIG_ACPI
 	if (!acpi_disabled)
 		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
 #endif
-
-	return rc;
+	return 0;
 }
 
 static const struct of_device_id aplic_match[] = {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
