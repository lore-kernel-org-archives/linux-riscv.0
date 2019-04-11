Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37C8C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 18:53:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7245E20663
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 18:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T/UuMFBz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AjIQyT1v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7245E20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uJGRhti68bFyifLH5RWiuXJzSwFpzRMPd4ZwnHUDAcU=; b=T/UuMFBz+SbctrdxN0fqR2Gc5
	2xCgpMCzI60soQg7BvSg3Nymun92KZTOKhCzedYdVL9ScdqxF2nbdXhkMpJoK/+Ui7269IHiyn4rS
	pIdp89dyzbKbzqHtO90c+qRVETCB3AiCcYqjTVN8ExPh9qeRFb7aQb+o8onHtgS2ZNgRfVU5NZCuM
	sEL3vnN+EBX763Xm+wSLVJeMEEM+BfsADgdU9XnNmNqC+S7uPzoYhqniZIRUC2sy1Va/EAt9ivCgM
	gyZb7gEmG1Pwz/+Zys9snQDZotPMt8yfixxlOkFVt0GpfhuO8wTfwvLSEqQz1ca1h3EGc43YFNWhg
	JkWPtlotg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEepB-0006Sr-LM; Thu, 11 Apr 2019 18:53:25 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEep8-0006Rn-33
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 18:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555008802; x=1586544802;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ixSR7czmU2FlyR1QU+hvsgT2klAhP+q0qdQOpEwiGLE=;
 b=AjIQyT1vg3j/qr+kBMD0eX+ltSmNatYFPMrJ2C6G6TCVm6m7gWq5uCod
 e7ZrBur+VwtjvlaZgT0Z0LI/45ifZpeK+5wxC+8FXt4h+pVTbbfOwGtO0
 BIQanQvhkZoXa7wIeRK0EqHzCGLHgMQTmnN+wu3Oar9pCkIfn7D/YN1AP
 NRRdJzn+C/ABB2OWeCOgQbzxhNh9VFTi9d/H8XyV+SEuLYLBDSqZWW8tL
 itlvMaqVF1UM+q9eyVMbucHNdNkrpT1o7g/AVSuthLxV5R5rUDNqrBV9+
 djjZtRZ+14QhmoizmmrrN1SmB6DeYdpyYpTTkrDylcprqS+b1zPAt/9/n g==;
X-IronPort-AV: E=Sophos;i="5.60,338,1549900800"; d="scan'208";a="105626086"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2019 02:53:09 +0800
IronPort-SDR: xkFA64YKIA9S2ZjV8/7pQNzGlCE89BYpCXhOBfwYH2RvOKdFPwd13XQigUTh+DdU3aDO0QogwQ
 chKc1s83Brqys9Du7VHVKpdOkU2QM2UorsmJpsK1n3wK9VParS4Lk1EzEJfE7Cub8OGtW/K/Lp
 Kb3OG+KU2Q99UfoAJzj5UoWb1YEFlPVtsYSxavYHaC1uJ/R65H4TbMvfZVJAwLpZj0RUlpE2GX
 13CoS9ZWFetzvjiTKkNl+VDU+tNSSrug66+ukUudoM1FihkRVxnQzNCkO3JFxXEpCy4ETUSgre
 ovmt0TNZSGQM4rlAJcIqYiPJ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 11 Apr 2019 11:32:10 -0700
IronPort-SDR: oZ6b8yYG1mtORYAUU0cMbhCF1Wa4OtmQTqeOd5+b4z+6MBG+uemobGYTvoMfpDK7SQp0RJ5hb2
 /u8ufk1uEU6C5G8tsCUeaXG920sYv1TXrr+7mkALwwQzWzwR2Lp8M3S19GOTGjE9jViywVMsuD
 qhP+24tgNC/osiuYTYNrcxIYzX41XJjs39QDIcmoDJbqthSiqrMnLmM0PYe2bpxa7B3kf+oSvE
 VIh59kJP/yUjzwAKHFIdz3kR1a0o9Nk/iNnVR5os7OK8F3BXrYsZ7BDlE6B+tgQwHuD844jX/d
 3qg=
Received: from r6220.sdcorp.global.sandisk.com (HELO [192.168.1.6])
 ([10.196.157.143])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 Apr 2019 11:53:10 -0700
Subject: Re: [PATCH 9/9] riscv: call pm_power_off from machine_halt /
 machine_power_off
To: Christoph Hellwig <hch@lst.de>, Palmer Dabbelt <palmer@sifive.com>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-10-hch@lst.de>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <a935c52a-489d-a597-3c98-c404ac3e1e95@wdc.com>
Date: Thu, 11 Apr 2019 11:53:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411115623.5749-10-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_115322_163184_04477BFD 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/11/19 4:57 AM, Christoph Hellwig wrote:
> This way any override of pm_power_off also affects the halt path and
> we don't need additional infrastructure for it.
> 
> Also remove the pm_power_off export - at least for now we don't have
> any modular drivers overriding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/riscv/kernel/reset.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 2a53d26ffdd6..ed637aee514b 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -12,11 +12,15 @@
>    */
>   
>   #include <linux/reboot.h>
> -#include <linux/export.h>
>   #include <asm/sbi.h>
>   
> -void (*pm_power_off)(void) = machine_power_off;
> -EXPORT_SYMBOL(pm_power_off);
> +static void default_power_off(void)
> +{
> +	sbi_shutdown();
> +	while (1);
> +}
> +
> +void (*pm_power_off)(void) = default_power_off;
>   
>   void machine_restart(char *cmd)
>   {
> @@ -26,11 +30,10 @@ void machine_restart(char *cmd)
>   
>   void machine_halt(void)
>   {
> -	machine_power_off();
> +	pm_power_off();
>   }
>   
>   void machine_power_off(void)
>   {
> -	sbi_shutdown();
> -	while (1);
> +	pm_power_off();
>   }
> 

Reviewed-by: Atish Patra <atish.patra@wdc.com>

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
