Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010C6EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 08:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MeL9B90aI0sHYq0KFbz6EmfiuNeFOLRtDWjCn9Ag1Y=; b=ccNbQQWapd51SM
	aW7ibKLM8mYuO2b0IF89Sr2Y5fh3iABqWadZYnnYihUxS7ln5/x+0NU4m9k/PAZr0ik6W7bPaALZm
	QhBD7NqDifmc4TdT8tic9EtA0EGYmkm4e2h/Vi7/6n5mLawxnzX6sksEwrVwk5jqy0rbTJckLJBhW
	2NVuK+659Fr6+h6Z2xAvlbGeYshXF9yYR+GCT49hCxQg6V4TBHkIWQ35I6Orr8jQjT6WuU6p+FgQs
	Zs1byfDUe//qQOixcZCGdwvK4f5H3Og8yPZuKREumLjypE4bLrPjfjKYfgQp/02zP19hEqpXlwNhT
	9t4wIY/KUKdDv9+vVWcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOd4-00AEA5-0B;
	Thu, 20 Jul 2023 08:03:18 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOd1-00AE8n-0E
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 08:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1689839876;
	bh=an71WrnjLaD9cSQUXNnuN1K2s6fzkBRSP3DqyCAY7xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XGhfXM7HM+p2e+KJoOxKl17GNGwVANZElM+9mMnMIo7/MKGf84CoIqw2QDq/yYem/
	 vEjZJDquWNpuybqnssF9iTeKARmKCQmT01p5QyACkdZh6im1PkVXbAIEL75RksY3mh
	 RRtGlse+GVJTL/vBIvClZU4fjWUCLdLqIFTS5dew=
Received: from localhost ([101.224.148.235])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id E76282B2; Thu, 20 Jul 2023 15:57:54 +0800
X-QQ-mid: xmsmtpt1689839874tbsigx21x
Message-ID: <tencent_FE575E338FC3B44C77562783BE5FD632D808@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjT3DJfoi4fyUUCPWJcz8ja4/fTuCMsKEmIBzkjtxfpp///8HKy8
	 JeImRTS16DdenGlzqldaLesVfJiWmZcHpcQBtNQCxvC3ZhSj3dpwcrEhZIIlfWwbIXdOiBosZNI/
	 WsmcK+SqQpNXd2oewlwRYQMn47sIecnGMFjslUVMEpipfQLIuWA/mETKc3e2C5YPkJXmhXV1x6iN
	 uYSSWp/I9BKTaEJQOQSJ4+Tnz2mMvr3vJ+6Jwsjyx40KkGZMMwhvmWs/em8MUgxkXMHD8U4/vrPm
	 d6CIc35TLsS8xO+jRn+yUkbHigmdK89fY6OnJA8W4RjBDkab+b2ochMCkLxAcaPmUVXBtSYk18AG
	 hMCl+NPP2e7k86C1z3XDHbuchgl6NVRHX137DJHtcErLJ9faPcTR4lSu7nnRgY7QCIrpQzodgEI4
	 iN1oefZ3GS8wSR1XVXGnY/46kBr2V0MsJc0HfjEwrp0P7McjzVmOWs5+ByFrH/Yx/tj+aFOGZlUx
	 i+//ONFwuQG2ASMfUoGmyem0snvjjSd1yp59CyLFcnIWWXmwDh8Tee/f4M/5CZtJAXhxwsFjwhJS
	 7WS663GvrzP9YIOZaZ4BYrOFgghEvp5gEfLW62JstYVGlULHGDkKQblybp3QjLAy2S7ehQp+Wa1k
	 479UZ0L6jQ/W/e5wIF7KD3FA7vOe8D5xDM8NHAfQ4/NpKgllZ4tVqgVVt1Q0hhLYXkYh7DgyLrfA
	 nAB6tWisdmpYvizKW2uvDQ2xUQFCjyKPynmGstV+oFM4iw6iG4iiXxwQKU1bphR8hXBCFtOu0jfE
	 yheVT8LYTrOcX58km7M3MeL8cF2JJii29u67wWUwH29yUTY04/JE7we1Nz8tcrRHvG3E/sVO7Vpg
	 oYHOYyewSX4KJ0GRLTrM2rDyK2FdDotT9Lqhj6WgCfQ2dBf6Ag7a+C8qiRSWsTkyIwJbuE0hw3vk
	 0wMrEaVXI6w4uzibrD2HhFbvFIzD2vwEj+D+IBkcRVeeNHTO7ni9S0lsLNN1BsBPnhcvRLLRSXaD
	 qKq85Z4CtodVhCEyhwgAdCa7WWzVU=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
Date: Thu, 20 Jul 2023 15:57:53 +0800
From: Woody Zhang <woodylab@foxmail.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	ajones@ventanamicro.com
Subject: Re: [PATCH] riscv: add SBI SUSP extension support
X-OQ-MSGID: <ZLjpAbJlH/dV6qwY@dev>
References: <tencent_B931BF1864B6AE8C674686ED9852ACFA0609@qq.com>
 <20230720-speller-suffocate-29ee7cc0b1f6@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230720-speller-suffocate-29ee7cc0b1f6@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_010315_408618_6B78247A 
X-CRM114-Status: GOOD (  16.90  )
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

On Thu, Jul 20, 2023 at 07:31:42AM +0100, Conor Dooley wrote:
>Hey Woody,
>
>On Thu, Jul 20, 2023 at 08:23:19AM +0800, Woody Zhang wrote:
>> RISC-V SBI spec 2.0 [1] introduces System Suspend Extension which can be
>> used to suspend the platform via SBI firmware.
>> 
>> This patch can be tested on Qemu with recent OpenSBI with
>> `system-suspend-test` enabled like [2] in DTB.
>> 
>> [1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc
>> [2] https://github.com/woodyzhang666/qemu/commit/e4a5120133c1dc354e6ac437ec1f870f6c0f6d05
>> 
>> Signed-off-by: Woody Zhang <woodylab@foxmail.com>
>> ---
>>  arch/riscv/include/asm/sbi.h | 10 ++++++++++
>>  arch/riscv/kernel/sbi.c      | 26 ++++++++++++++++++++++++++
>
>There's prior art here, that is seemingly more complete:
>https://lore.kernel.org/all/20230118180338.6484-2-ajones@ventanamicro.com/
>IIRC, the reason it is still in RFC status is that the 2.0 SBI spec is
>not yet frozen, so this cannot be merged.
>

OK. I didn't notice that. Drop this patch then.

Woody

>Thanks,
>Conor.
>
>>  2 files changed, 36 insertions(+)
>> 
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index 5b4a1bf5f439..3b04016da671 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -30,6 +30,7 @@ enum sbi_ext_id {
>>  	SBI_EXT_HSM = 0x48534D,
>>  	SBI_EXT_SRST = 0x53525354,
>>  	SBI_EXT_PMU = 0x504D55,
>> +	SBI_EXT_SUSP = 0x53555350,
>>  
>>  	/* Experimentals extensions must lie within this range */
>>  	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
>> @@ -236,6 +237,15 @@ enum sbi_pmu_ctr_type {
>>  /* Flags defined for counter stop function */
>>  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
>>  
>> +enum sbi_ext_susp_fid {
>> +	SBI_EXT_SUSP_SYSTEM_SUSPEND = 0,
>> +};
>> +
>> +/* SBI suspend sleep types */
>> +enum sbi_susp_sleep_type {
>> +	SBI_SUSP_SLEEP_TYPE_SUSPEND = 0x0,
>> +};
>> +
>>  #define SBI_SPEC_VERSION_DEFAULT	0x1
>>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>>  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
>> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
>> index c672c8ba9a2a..9a68959f9f18 100644
>> --- a/arch/riscv/kernel/sbi.c
>> +++ b/arch/riscv/kernel/sbi.c
>> @@ -9,8 +9,10 @@
>>  #include <linux/init.h>
>>  #include <linux/pm.h>
>>  #include <linux/reboot.h>
>> +#include <linux/suspend.h>
>>  #include <asm/sbi.h>
>>  #include <asm/smp.h>
>> +#include <asm/suspend.h>
>>  
>>  /* default SBI version is 0.1 */
>>  unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
>> @@ -520,6 +522,26 @@ static void sbi_srst_power_off(void)
>>  		       SBI_SRST_RESET_REASON_NONE);
>>  }
>>  
>> +static int sbi_system_suspend(unsigned long arg,
>> +		unsigned long resume_entry, unsigned long context)
>> +{
>> +	struct sbiret ret = {0};
>> +
>> +	ret = sbi_ecall(SBI_EXT_SUSP, SBI_EXT_SUSP_SYSTEM_SUSPEND,
>> +			SBI_SUSP_SLEEP_TYPE_SUSPEND, resume_entry, context, 0, 0, 0);
>> +	return ret.error;
>> +}
>> +
>> +static int sbi_system_suspend_enter(suspend_state_t state)
>> +{
>> +	return cpu_suspend(0, sbi_system_suspend);
>> +}
>> +
>> +static const struct platform_suspend_ops sbi_suspend_ops = {
>> +	.valid          = suspend_valid_only_mem,
>> +	.enter          = sbi_system_suspend_enter,
>> +};
>> +
>>  /**
>>   * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
>>   * @extid: The extension ID to be probed.
>> @@ -624,6 +646,10 @@ void __init sbi_init(void)
>>  			sbi_srst_reboot_nb.priority = 192;
>>  			register_restart_handler(&sbi_srst_reboot_nb);
>>  		}
>> +		if (sbi_probe_extension(SBI_EXT_SUSP)) {
>> +			pr_info("SBI SUSP extension detected\n");
>> +			suspend_set_ops(&sbi_suspend_ops);
>> +		}
>>  	} else {
>>  		__sbi_set_timer = __sbi_set_timer_v01;
>>  		__sbi_send_ipi	= __sbi_send_ipi_v01;
>> -- 
>> 2.39.2
>> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
