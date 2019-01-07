Return-Path: <SRS0=5Ln/=PP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40E4C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 13:33:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74BA8206B6
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 13:33:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M+6bkdLw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74BA8206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAwkcuNo2goL/ydPgeMFg1IKKmxDIcmMmHcHvkNY/r4=; b=M+6bkdLwi5hUEa
	G8BmZlMb5UMdznQjZOm2Me7KzX/Ak4vD/8sN9r7taMOiUxVDJ25JJjZwMTxb7oOxfv7s1WtXRXNd5
	WgzGyigIIucvom4p+DzXa0uBNqtzbSuSGBv2n+bt4HE6Jpk0LVu+E1uqfUlSlWM6VOpneEMU1QjdN
	7kmsaLrDo5ls47NN3oueCOG3oi3x2cCzro77z34cJOIGL73+s4DyXzJYhP0HianFsxBlGe1vYjV0S
	7EiabwmW4+n58ZPUHi9yIe18XBFYLhmkIAv5SP0gV1fEJKybEGsEK/H5Z3yp1X07kRA6V17GhIkMW
	3gJoT3vQaHiy4hZUhb5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggV1j-0003EU-FK; Mon, 07 Jan 2019 13:33:11 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggV1g-0003DD-Rl
 for linux-riscv@lists.infradead.org; Mon, 07 Jan 2019 13:33:10 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E219EAD43;
 Mon,  7 Jan 2019 13:33:04 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH] RISC-V: Fix of_node_* refcount
References: <1542755270-10433-1-git-send-email-atish.patra@wdc.com>
X-Yow: Is this "BIKINI BEACH"?
Date: Mon, 07 Jan 2019 14:33:03 +0100
In-Reply-To: <1542755270-10433-1-git-send-email-atish.patra@wdc.com> (Atish
 Patra's message of "Tue, 20 Nov 2018 15:07:50 -0800")
Message-ID: <mvmd0p8wq28.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_053309_040880_C4000E00 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: anup@brainfault.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 jeremy.linton@arm.com, sudeep.holla@arm.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Nov 20 2018, Atish Patra <atish.patra@wdc.com> wrote:

> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 18cda0e8..fc185eca 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -57,12 +57,15 @@ void __init setup_smp(void)
>  
>  	while ((dn = of_find_node_by_type(dn, "cpu"))) {
>  		hart = riscv_of_processor_hartid(dn);
> -		if (hart < 0)
> +		if (hart < 0) {
> +			of_node_put(dn);
>  			continue;
> +		}
>  
>  		if (hart == cpuid_to_hartid_map(0)) {
>  			BUG_ON(found_boot_cpu);
>  			found_boot_cpu = 1;
> +			of_node_put(dn);
>  			continue;
>  		}
>  

[    0.000000] OF: ERROR: Bad of_node_put() on /cpus/cpu@0
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.0.0-rc1-00013-ge0b3e41110 #4
[    0.000000] Call Trace:
[    0.000000] [<ffffffe0010c8c74>] walk_stackframe+0x0/0xa4
[    0.000000] [<ffffffe0010c8e74>] show_stack+0x2a/0x34
[    0.000000] [<ffffffe00160989c>] dump_stack+0x62/0x7c
[    0.000000] [<ffffffe0014d9660>] of_node_release+0xbe/0xc0
[    0.000000] [<ffffffe00160e560>] kobject_put+0xa6/0x1e8
[    0.000000] [<ffffffe0014d8bb8>] of_node_put+0x16/0x20
[    0.000000] [<ffffffe0014d4bc2>] of_find_node_by_type+0x66/0xa4
[    0.000000] [<ffffffe0000028bc>] 0xffffffe0000028bc
[    0.000000] [<ffffffe0000026cc>] 0xffffffe0000026cc
[    0.000000] [<ffffffe0000006ec>] 0xffffffe0000006ec
[    0.000000] [<ffffffe000000076>] 0xffffffe000000076
[    0.000000] OF: ERROR: Bad of_node_put() on /cpus/cpu@1
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.0.0-rc1-00013-ge0b3e41110 #4
[    0.000000] Call Trace:
[    0.000000] [<ffffffe0010c8c74>] walk_stackframe+0x0/0xa4
[    0.000000] [<ffffffe0010c8e74>] show_stack+0x2a/0x34
[    0.000000] [<ffffffe00160989c>] dump_stack+0x62/0x7c
[    0.000000] [<ffffffe0014d9660>] of_node_release+0xbe/0xc0
[    0.000000] [<ffffffe00160e560>] kobject_put+0xa6/0x1e8
[    0.000000] [<ffffffe0014d8bb8>] of_node_put+0x16/0x20
[    0.000000] [<ffffffe0014d4bc2>] of_find_node_by_type+0x66/0xa4
[    0.000000] [<ffffffe0000028bc>] 0xffffffe0000028bc
[    0.000000] [<ffffffe0000026cc>] 0xffffffe0000026cc
[    0.000000] [<ffffffe0000006ec>] 0xffffffe0000006ec
[    0.000000] [<ffffffe000000076>] 0xffffffe000000076

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
