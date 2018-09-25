Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6521C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 18:00:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 900DF206B8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 18:00:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D/3Y6Dxm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="lvekDEr+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 900DF206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ChygOyHRt4SrART8hLaKQQxLk5OFVv6v9MVUhs17CWI=; b=D/3Y6DxmDmfGL781t26a+UiDM
	E1wk3LxmLx5NiabJoioMbO6vx/vB34YTmyFq79ggtiEWuBpRNQ7RSLlWwkeI5Q2RsTR+a55j10Ntj
	sUUUhQ3Jrh3+m2nQgkpZrVmOJlnneP2m6jXTGkM4KJ4dxUmCM9+HHmZ4Io1SvoRNlO0AbrPgPIcAh
	douKgDBoQnnU7ud6ri7A+ML5WMQrt2APCeWl6ErwN1E3ax8aPrIZt4niip4BBU9w/J216jSEoWBb6
	9/VXZg9wsZeznIlNV6Nr+7BiTX9FcbMXCLsVZXlWmGqO3B2AMJ2XAo23rOZfk2hVKWJTsUum5uAOp
	/AWgAfbjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4rd6-0000ZU-58; Tue, 25 Sep 2018 18:00:12 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4rcg-0008RF-Rn
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 17:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1537898408; x=1569434408;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=oMORr6Kizmx+pFnLR4tO58Zyb5lS31vTL3ABJutV9n0=;
 b=lvekDEr+RM7zgBbRlXa+DhTLb4zaUx2+WKjAqkHh7D1oDitXYUPG2/67
 U+brH52LCyr4UK5NwL57CJoT0TLwqoZukQYurX05HUBInfXNrBxwN7KFq
 yuGmkMJZ+ULVOcA2cWH+1JLh1euBaLfSMhD7Cac/7nkfTHOedpFUcTIsz
 sJFe3oXhfyMMpNoSP3/sbg6R5IPLBuMRY67/+h9GLx/nFQ3DJYVqLt3VQ
 FPHJTF2z4KfvEAaKFs6byxT8AxG5idSj5bilao0MkOJGGEjplgw/K2W0D
 8wRgWxx2zlfgqqTuoj/Z2pBDf2QXcK6tsSyIkFyQjxJIds/VyA5NEYrh6 g==;
X-IronPort-AV: E=Sophos;i="5.54,303,1534780800"; d="scan'208";a="188149042"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Sep 2018 01:59:21 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 25 Sep 2018 10:45:04 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.196.159.148])
 ([10.196.159.148])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Sep 2018 10:59:15 -0700
Subject: Re: [PATCH v2] RISC-V: Show CPU ID and Hart ID separately in
 /proc/cpuinfo
To: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
References: <20180923133737.22693-1-anup@brainfault.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <a7c64e1a-405e-6a2c-cb42-211c4f89367d@wdc.com>
Date: Tue, 25 Sep 2018 10:59:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180923133737.22693-1-anup@brainfault.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_105947_017129_7C7EA2B7 
X-CRM114-Status: GOOD (  20.08  )
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
Cc: Christoph Hellwig <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925175915.6LkLhCJH4oFvOnFxZddOhhbhQi-60D_bENvZI0iQeWI@z>

On 9/23/18 6:37 AM, Anup Patel wrote:
> Currently, /proc/cpuinfo show logical CPU ID as Hart ID which
> is in-correct. This patch shows CPU ID and Hart ID separately
> in /proc/cpuinfo using cpuid_to_hardid_map().
> 
I noticed it should be cpuid_to_hartid_map instead of 
cpuid_to_hardid_map. It was a typo in my smp cleanup patch series.
Sorry for the inconvenience here.

I can include this patch in into my series fixing the typo if you want.

Regards,
Atish
> With this patch, contents of /proc/cpuinfo looks as follows:
> processor	: 0
> hart		: 1
> isa		: rv64imafdc
> mmu		: sv48
> 
> processor	: 1
> hart		: 0
> isa		: rv64imafdc
> mmu		: sv48
> 
> processor	: 2
> hart		: 2
> isa		: rv64imafdc
> mmu		: sv48
> 
> processor	: 3
> hart		: 3
> isa		: rv64imafdc
> mmu		: sv48
> 
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
> 
> Changes since v1:
>   - Show logical CPU ID as "processor" attribute in /proc/cpuinfo
> 
>   arch/riscv/kernel/cpu.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 36b6ddb19b4d..392c7c19c4a3 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -81,7 +81,7 @@ static void print_isa(struct seq_file *f, const char *orig_isa)
>   #endif
>   
>   	/* Print the base ISA, as we already know it's legal. */
> -	seq_puts(f, "isa\t: ");
> +	seq_puts(f, "isa\t\t: ");
>   	seq_write(f, isa, 5);
>   	isa += 5;
>   
> @@ -96,6 +96,7 @@ static void print_isa(struct seq_file *f, const char *orig_isa)
>   			isa++;
>   		}
>   	}
> +	seq_puts(f, "\n");
>   
>   	/*
>   	 * If we were given an unsupported ISA in the device tree then print
> @@ -116,7 +117,7 @@ static void print_mmu(struct seq_file *f, const char *mmu_type)
>   		return;
>   #endif
>   
> -	seq_printf(f, "mmu\t: %s\n", mmu_type+6);
> +	seq_printf(f, "mmu\t\t: %s\n", mmu_type+6);
>   }
>   
>   static void *c_start(struct seq_file *m, loff_t *pos)
> @@ -144,14 +145,15 @@ static int c_show(struct seq_file *m, void *v)
>   						   NULL);
>   	const char *compat, *isa, *mmu;
>   
> -	seq_printf(m, "hart\t: %lu\n", cpu_id);
> +	seq_printf(m, "processor\t: %lu\n", cpu_id);
> +	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hardid_map(cpu_id));
>   	if (!of_property_read_string(node, "riscv,isa", &isa))
>   		print_isa(m, isa);
>   	if (!of_property_read_string(node, "mmu-type", &mmu))
>   		print_mmu(m, mmu);
>   	if (!of_property_read_string(node, "compatible", &compat)
>   	    && strcmp(compat, "riscv"))
> -		seq_printf(m, "uarch\t: %s\n", compat);
> +		seq_printf(m, "uarch\t\t: %s\n", compat);
>   	seq_puts(m, "\n");
>   
>   	return 0;
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
