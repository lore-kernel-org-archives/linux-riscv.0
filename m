Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108DCC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 10:10:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0AF82087E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 10:10:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vg1GnbZF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="H7ZU+/nM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0AF82087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wQeePtczcwuBwXwubJDVfnY7L33pR4o6/Kp9WIAlVVs=; b=Vg1GnbZFSd1YkfLkrdr1DMzlm
	6neSOKa68vxg5JuAgxLamPGuZsIlrH4qXOCgITbQ2Z9cW/qpnRTrOQLJGx9yaln7E0HZQcV+dsrMO
	eRXaZ++sVUqnwpPASeBn4vx0kWlwMZ60a9ClkLA3b6HMAIw97JXFm92gvGhIWKFi5fwpY58KRshYN
	qfCUB9DLemAYf89abnXc4mDu8btlMKP6oZR6kHU+b42DzvQVfww8uvGfLKnOhLwg/HuDG79S8VH7C
	csIXVQnlhggjt08b9Bh+tOGub5z3ie9dKHsE5vAmP/ljfk8s+n8jZudMcX5O+/z4z6FIzk7vdlJg4
	/yN4iaTRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggoKw-0002l6-VG; Tue, 08 Jan 2019 10:10:18 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggoKt-0002kK-TD
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 10:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1546942216; x=1578478216;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1P8JDvo3dAoiLl00jnPlAemozrC3mVJkmqYB5frnj3k=;
 b=H7ZU+/nMf5BeBfkpVnaK1cJQjhXmK+RgC09Z8dsEVj4Yk9PsYoE9pNbr
 7fFw73liNIXQDYmkkfxUUQxM+ZF+OefL2ZBRZgBDbxKB0wdhTfqdhmV71
 /QxOufKA4Jc/7vdS+UWUREAkeWzxkl3Qhmm9InqS1Sk8ixBFxbQFM9hpY
 x9HH96uMTFfW/s0b64yHZjhjYfsx+eCxoa4ZDga5ABNR1xKIhS9YeMVm4
 hI+MtyAqr1ZRsgdz3HDKKwwyimVgNPHzJ3NT9USV30wVlN1wi2qzemGLk
 3q3w9umgPxklAaTRe7OCCvh+xKzY0HrlX6CEjs8uj++RJ8eC81w4QHPjI Q==;
X-IronPort-AV: E=Sophos;i="5.56,453,1539619200"; d="scan'208";a="99460597"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2019 18:10:13 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 08 Jan 2019 01:51:46 -0800
Received: from usa003532.ad.shared (HELO [10.86.59.202]) ([10.86.59.202])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jan 2019 02:10:13 -0800
Subject: Re: [PATCH] RISC-V: fix bad use of of_node_put
To: Andreas Schwab <schwab@suse.de>
References: <1542755270-10433-1-git-send-email-atish.patra@wdc.com>
 <mvm8szwwo1o.fsf@suse.de>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <6326f9ba-695d-dc00-1b0c-c37a94c9b485@wdc.com>
Date: Tue, 8 Jan 2019 02:10:12 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <mvm8szwwo1o.fsf@suse.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_021016_081718_47750235 
X-CRM114-Status: GOOD (  14.94  )
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
Cc: "anup@brainfault.org" <anup@brainfault.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jeremy.linton@arm.com" <jeremy.linton@arm.com>,
 "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/7/19 6:16 AM, Andreas Schwab wrote:
> of_find_node_by_type already calls of_node_put, don't call it again.
> 
> Fixes: 94f9bf118f ("RISC-V: Fix of_node_* refcount")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   arch/riscv/kernel/smpboot.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index fc185ecabb..18cda0e8cf 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -57,15 +57,12 @@ void __init setup_smp(void)
>   
>   	while ((dn = of_find_node_by_type(dn, "cpu"))) {
>   		hart = riscv_of_processor_hartid(dn);
> -		if (hart < 0) {
> -			of_node_put(dn);
> +		if (hart < 0)
>   			continue;
> -		}
>   
>   		if (hart == cpuid_to_hartid_map(0)) {
>   			BUG_ON(found_boot_cpu);
>   			found_boot_cpu = 1;
> -			of_node_put(dn);
>   			continue;
>   		}
>   
> @@ -73,7 +70,6 @@ void __init setup_smp(void)
>   		set_cpu_possible(cpuid, true);
>   		set_cpu_present(cpuid, true);
>   		cpuid++;
> -		of_node_put(dn);
>   	}
>   
>   	BUG_ON(!found_boot_cpu);
> 
Thanks for catching and fixing this.

Reviewed-by: Atish Patra <atish.patra@wdc.com>

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
