Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2821606A321
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 22:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KzncgUES;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=y5Qgq2rg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DeFA5cUCMDx6CGX8jDqoaTsUxhdEc6axcliZ8s+BZwI=; b=KzncgUESdCKSLZyRPu5Rmn+/n4
	ckfQ9u5yzXDyA7Ib6ceYOg3mJY1X/xNoIe9MxLG/tVIz/kFEP6TS9V0ITV6QfFc22a+9w9yhGnTw1
	4wDC+vU4HQ0hF9o8FaZS7Dmb/OpkznXGlYJk8BQK627SoQmBuq6286Sdl/62zqoBWl323jtH2XOIF
	hqlldCDA77fFUkbk0NfmW1R3ehV51Bb3ipJkIDS8ZkDOw9Qdymvl0vDi1mecMNT7XdR3INn7TXmQU
	Iue9ploqFTNlz/aM26afP3jY0TbRFo1ZqI+K/EDsNwUiO4WwmUUyF7ONbYpD9WtpDw84XNVKp+p1S
	vbITIRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcQ4-000000053yP-15f5;
	Mon, 23 Nov 2026 22:21:52 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcQ1-000000053xz-3yhT
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 22:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=M/dPNEWQK09q7JbjfKH7MJ1mwiktjZdxAxMD410YALQ=; b=y5Qgq2rgrcm/D3WJARApnsHXJK
	RJM0D9qlkJNg2cvotSj9SwbQDeud8fkEHEP89lRYc98kuvvruXkqlV5gDg2g02fkTnHq6lBjWXjEr
	p6uUh/NBcRdw1yZDa5iCsO2c2p4+BcKyeP31XJbbGL5iVndPP3Wqn4GvWOmp0aTtuuiFWUugxMy4U
	DJ+wFIyxhkRnvTWBYd2+tg/G3TNixu8qZBlXQ0R+ONLT5E2sv5RzY//5ibbLjonYRSVKs8rg3Sbry
	oIejOzjkztwW8oY622OO9f/IA7+VjvTjBf3L/vB9/g1MPg+NElI/gjnMEMObCtVSm9kcsKcTfctT/
	hNMzM6iw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xVcPt-00000007bSR-3nqY;
	Mon, 23 Nov 2026 23:21:41 +0100
Date: Mon, 23 Nov 2026 23:21:39 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 2/3] riscv: sbi: Register SRST handlers with firmware
 priority
Message-ID: <awS8c3RFkv1D07dc@aurel32.net>
Mail-Followup-To: Anand Moon <linux.amoon@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20261118104935.1716-1-linux.amoon@gmail.com>
 <20261118104935.1716-2-linux.amoon@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118104935.1716-2-linux.amoon@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_142149_993662_D5498E5B 
X-CRM114-Status: GOOD (  20.60  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-18 16:19, Anand Moon wrote:
> The SBI System Reset (SRST) extension currently registers its poweroff
> handler using register_platform_power_off(), which assigns it a lower
> priority than the default PMIC poweroff handlers.
> 
> On platforms where OpenSBI handles system poweroff, a PMIC handler may
> run first and perform I2C-backed regmap operations in atomic context,
> triggering invalid wait context and scheduling-while-atomic warnings.
> 
> Register both SBI SRST restart and poweroff handlers using
> register_sys_off_handler() with SYS_OFF_PRIO_FIRMWARE. This gives firmware
> handlers precedence over default-priority PMIC handlers and avoids
> board-specific workarounds in individual PMIC drivers.
> 
> Defer handler registration to a device initcall because sbi_init() runs
> during early architecture initialization, before dynamic memory
> allocation required by register_sys_off_handler() is available.
> 
> Preserve warm and cold reboot selection, retain the existing legacy
> poweroff fallback, and report handler registration failures.
> 
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Suggested-by: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> New patch:
>    Link: https://lore.kernel.org/all/20261110061429.2036-2-linux.amoon@gmail.com/
> ---
>  arch/riscv/kernel/sbi.c | 43 +++++++++++++++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index af1ccea222f1..ab6e5bf25411 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -512,23 +512,50 @@ static void sbi_srst_reset(unsigned long type, unsigned long reason)
>  		__func__, type, reason);
>  }
>  
> -static int sbi_srst_reboot(struct notifier_block *this,
> -			   unsigned long mode, void *cmd)
> +static int sbi_srst_reboot(struct sys_off_data *data)
>  {
> -	sbi_srst_reset((mode == REBOOT_WARM || mode == REBOOT_SOFT) ?
> +	sbi_srst_reset((reboot_mode == REBOOT_WARM ||
> +			reboot_mode == REBOOT_SOFT) ?
>  		       SBI_SRST_RESET_TYPE_WARM_REBOOT :
>  		       SBI_SRST_RESET_TYPE_COLD_REBOOT,
>  		       SBI_SRST_RESET_REASON_NONE);
> +
>  	return NOTIFY_DONE;
>  }
>  
> -static struct notifier_block sbi_srst_reboot_nb;
> -
> -static void sbi_srst_power_off(void)
> +static int sbi_srst_power_off(struct sys_off_data *data)
>  {
>  	sbi_srst_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
>  		       SBI_SRST_RESET_REASON_NONE);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int __init sbi_srst_sys_off_init(void)
> +{
> +	struct sys_off_handler *handler;
> +
> +	if (sbi_spec_version < sbi_mk_version(0, 3) ||
> +	    !sbi_probe_extension(SBI_EXT_SRST))
> +		return 0;
> +
> +	handler = register_sys_off_handler(SYS_OFF_MODE_RESTART,
> +					   SYS_OFF_PRIO_FIRMWARE,
> +					   sbi_srst_reboot, NULL);
> +	if (IS_ERR(handler))
> +		pr_warn("Failed to register SBI SRST restart handler: %ld\n",
> +			PTR_ERR(handler));
> +
> +	handler = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
> +					   SYS_OFF_PRIO_FIRMWARE,
> +					   sbi_srst_power_off, NULL);
> +	if (IS_ERR(handler))
> +		pr_warn("Failed to register SBI SRST poweroff handler: %ld\n",
> +			PTR_ERR(handler));
> +
> +	return 0;
>  }
> +device_initcall(sbi_srst_sys_off_init);
>  
>  /**
>   * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
> @@ -677,11 +704,7 @@ void __init sbi_init(void)
>  		if (sbi_spec_version >= sbi_mk_version(0, 3) &&
>  		    sbi_probe_extension(SBI_EXT_SRST)) {
>  			pr_info("SBI SRST extension detected\n");
> -			register_platform_power_off(sbi_srst_power_off);
>  			srst_power_off = true;
> -			sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
> -			sbi_srst_reboot_nb.priority = 192;
> -			register_restart_handler(&sbi_srst_reboot_nb);
>  		}
>  		if (sbi_spec_version >= sbi_mk_version(2, 0) &&
>  		    sbi_probe_extension(SBI_EXT_DBCN) > 0) {

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
