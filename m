Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB989C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 10:33:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F2E20850
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 10:33:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XAcEzUvh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="qihHki2h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75F2E20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fuMH+4XgEyBqXA2J06xlVf2uXsut0i5j8cu363/xGks=; b=XAcEzUvhNkxHgfpVhEsBQ5KfC
	GItG3t/+iY+lYc1qBeuEkBPaX4b5gD1bQKTBcdhaVeKz0QjILGxTWatbKc7T7VoBpl36VyKsgfRWO
	iCHqmejnEzSP/GmXRYVSHldyhpVlNvpaGPv0pnFe9iPy5hcGLJxrrFjbtcwilAtZCWO+/zjrfi2qZ
	uhFIkaofp66UAGJf3a3zax7/Lzmv8BltHrxiuCVpUDtbuTMZcyjtucSTXWrPJfj4WuN10mSzkf93o
	xPFExXLt0GoE75s7L9rbCdl16OLWZ9xa7ihxhu1C7dbT8rKkC/pMs2njw15CdO/VgqDCuTFWwFdRX
	LZkIMlfnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggoh4-0002Ws-Em; Tue, 08 Jan 2019 10:33:10 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggoh0-0002VY-WC
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 10:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1546943586; x=1578479586;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hq5oGPu07KlC+0CLOCmKx2M1enW77+L+m4qZ8+kveQA=;
 b=qihHki2h5enXPTB0JlGpfOaFvW4BlZVYy/VBaI8Em1/VQyQlCuU01ki9
 C3KA2zMXV/Qnp23DmY0Q04dADBAu+E8zImN1d7SxMmOvYdx7Q85kEr+7O
 Cvw+NIY8tMIUQpWmAjXYP0GQQ0LzkfGYyTwSmzr1FZwlFinaGbKz+hDzV
 LI8Fs8NfkVo/f6ouhI9OSWOJdPuGWOBCrAdMn29gQBU9YkdsEdBZuoIzP
 4QtIF/fZbZjLx7fip3GSaOGN9VCdbwKTGV3VkugLt5OrTCiShrWLxo/iG
 4pLtxyYU2jWJttL7ZxZk72ZQkzqm3ppY7BHXEHGDGmtPc/3URmid0asdL A==;
X-IronPort-AV: E=Sophos;i="5.56,453,1539619200"; d="scan'208";a="203103145"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2019 18:33:04 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 08 Jan 2019 02:14:39 -0800
Received: from usa003532.ad.shared (HELO [10.86.59.202]) ([10.86.59.202])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Jan 2019 02:33:04 -0800
Subject: Re: [PATCH v2 8/8] RISC-V: Assign hwcap only according to current cpu.
From: Atish Patra <atish.patra@wdc.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-9-git-send-email-atish.patra@wdc.com>
Message-ID: <5445186f-db34-d319-5081-37ee1fc58273@wdc.com>
Date: Tue, 8 Jan 2019 02:33:03 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <1546940318-9752-9-git-send-email-atish.patra@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_023307_159974_6233503A 
X-CRM114-Status: GOOD (  18.58  )
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
Cc: =?UTF-8?Q?Patrick_St=c3=a4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup@brainfault.org>,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/8/19 1:38 AM, Atish Patra wrote:
> Currently, we set hwcap based on first valid cpu from
> DT. This may not be correct always as that CPU might not
> be current booting cpu.
> 
> Set hwcap based on the current cpu instead of first
> valid CPU from DT.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>   arch/riscv/kernel/cpufeature.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index a6e369ed..ed6122ff 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -43,12 +43,15 @@ void riscv_fill_hwcap(void)
>   	elf_hwcap = 0;
>   
>   	/*
> -	 * We don't support running Linux on hertergenous ISA systems.  For
> -	 * now, we just check the ISA of the first "okay" processor.
> +	 * We don't support running Linux on hertergenous ISA systems.
> +	 * But first "okay" processor might not be the boot cpu.
> +	 * Check the ISA of boot cpu.
>   	 */
> -	while ((node = of_find_node_by_type(node, "cpu")))
> -		if (riscv_of_processor_hartid(node) >= 0)
> +	while ((node = of_find_node_by_type(node, "cpu"))) {
> +		if (riscv_of_processor_hartid(node) == boot_cpu_hartid)
>   			break;
> +	}
> +
>   	if (!node) {
>   		pr_warning("Unable to find \"cpu\" devicetree entry");
>   		return;
> 

Argh..Missed an include while rebasing. Following edit is required for 
non SMP config. I will fix it in v2.

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index ed6122ff..78379ea3 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -20,6 +20,7 @@
  #include <linux/of.h>
  #include <asm/processor.h>
  #include <asm/hwcap.h>
+#include <asm/smp.h>

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
