Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3298C36008
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 09:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IeG5LL+hXl4sJCUEkl14nvYtWKhrpIuKPe65sxCzz8=; b=0Y9lCTq34ntvzUKfDimLfyPuZr
	otmp1KYRj2Z0C6tpxr/bVCiroSOMDNfr/w8VsWjmqLeGBl1ziCqfqdrUxWsjfWG/HtFhYAFNCfUcL
	nPBypJphW+n1dIYCy5q3tEqQSG7xsYJ71V8SvwavWOx2cKPD6tcYoriZkdzm0PpJOBEVgwBYLWDuL
	QeXlIKYbEyw9xKRYNRb3OSEfCZtuSHcpJiDNVuiGW4mNBRMt0D3bJpVfSfDJuke2fPDGf97pBkYxD
	7njBHRQV1a78DY9+vDB5XKZ1sNFOJOlIHLIQYNBNjHPoLOIS4yGcVYBrUJppvwAYw6b2z+8m6zZDC
	fHarazOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx14c-00000005NaQ-1nzw;
	Tue, 25 Mar 2025 09:59:54 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx14Z-00000005Na3-1LUh
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 09:59:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3EB3433EC;
	Tue, 25 Mar 2025 09:59:43 +0000 (UTC)
Message-ID: <1036c9e7-dd0c-4ae0-ad20-cb424a37736d@ghiti.fr>
Date: Tue, 25 Mar 2025 10:59:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: print hartid on bringup
Content-Language: en-US
To: Yunhui Cui <cuiyunhui@bytedance.com>, apatel@ventanamicro.com,
 atishp@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, samuel.holland@sifive.com, alexghiti@rivosinc.com,
 jassisinghbrar@gmail.com, takakura@valinux.co.jp,
 valentina.fernandezalanis@microchip.com, ruanjinjie@huawei.com,
 charlie@rivosinc.com, conor.dooley@microchip.com, haibo1.xu@intel.com,
 andybnac@gmail.com, ke.zhao@shingroup.cn, tglx@linutronix.de,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250303083424.14309-1-cuiyunhui@bytedance.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250303083424.14309-1-cuiyunhui@bytedance.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepueefgeehheegtddvgeelgeejjeefudekgeetffeijefgveejudehfffftdelhffhnecukfhppeefuddrfedvrdekuddrudekjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefuddrfedvrdekuddrudekjedphhgvlhhopegludelvddrudeikedrvddurddvhegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtoheptghuihihuhhnhhhuihessgihthgvuggrnhgtvgdrtghomhdprhgtphhtthhopegrphgrthgvlhesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheprghtihhshhhpsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkv
 ghlvgihrdgvughupdhrtghpthhtohepshgrmhhuvghlrdhhohhllhgrnhgusehsihhfihhvvgdrtghomhdprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_025951_494260_256D8D0D 
X-CRM114-Status: GOOD (  11.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yunhui,

On 03/03/2025 09:34, Yunhui Cui wrote:
> Firmware randomly releases cores, so CPU numbers don't linearly map
> to hartids. When the system has an exception, we care more about hartids.
> Adding "dyndbg="file smpboot.c +p" loglevel=8" to the cmdline can output
> the hartid.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   arch/riscv/kernel/smp.c     | 2 ++
>   arch/riscv/kernel/smpboot.c | 4 ++++
>   2 files changed, 6 insertions(+)
>
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index d58b5e751286..e650dec44817 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -48,6 +48,8 @@ EXPORT_SYMBOL_GPL(__cpuid_to_hartid_map);
>   void __init smp_setup_processor_id(void)
>   {
>   	cpuid_to_hartid_map(0) = boot_cpu_hartid;
> +
> +	pr_info("Booting Linux on hartid %lu\n", boot_cpu_hartid);
>   }
>   
>   static DEFINE_PER_CPU_READ_MOSTLY(int, ipi_dummy_dev);
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index e36d20205bd7..601a321e0f17 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -231,6 +231,10 @@ asmlinkage __visible void smp_callin(void)
>   	riscv_ipi_enable();
>   
>   	numa_add_cpu(curr_cpuid);
> +
> +	pr_debug("CPU%u: Booted secondary hartid %lu\n", curr_cpuid,
> +		cpuid_to_hartid_map(curr_cpuid));
> +
>   	set_cpu_online(curr_cpuid, true);
>   
>   	/*


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
