Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180D3C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFIh1IXDp2lC+Qm4qUT0q4oy5lN8ZpsO7ta7YtjTLQI=; b=iEOsYJkt/uNyYJ
	UYtr0JD9F6lptZQHzOQm4iKJ2Mf5oq1PmwHQkzYNpkhIkoHeaXmF9eTTeK3nNvtKca5WIlZuW8Kee
	XrxniblfLjY9EO3kvTLOJejmyzH7t+WYDOIeppzbZWR9KqhuaA9qIBSQ9KojrVoCSoZ+qgYaAX0VA
	VHqcF6fjaSrbgmNmgnK4ErA1FHRM0fRNGDJiqPOm57vEbrXlqwsVpLGsxeIvZQBesVBz6XC17PQKp
	U/kPfmGRabFCFfs2vBbU+YxeJ1swRnJJmh4caMiz6MP0i3PrkVbe40kp8nbJzL5ITony6h/iEJnSH
	nRFg18Y+VK0tPl01BGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rpX-0000000Adov-1AAJ;
	Thu, 10 Apr 2025 13:20:31 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rpU-0000000Adnr-0XQJ
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 13:20:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02EE120481;
	Thu, 10 Apr 2025 13:20:20 +0000 (UTC)
Message-ID: <c546c4c6-a4a0-431e-9299-5477bedf6280@ghiti.fr>
Date: Thu, 10 Apr 2025 15:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix unaligned access info messages
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, cleger@rivosinc.com,
 alexghiti@rivosinc.com, geert@linux-m68k.org
References: <20250409153650.84433-2-ajones@ventanamicro.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250409153650.84433-2-ajones@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeltdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemledvfedvmegtfegrkeemugegsgegmedusggusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemledvfedvmegtfegrkeemugegsgegmedusggusgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemledvfedvmegtfegrkeemugegsgegmedusggusggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegrjhhonhgvshesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdro
 hhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheprghlvgigghhhihhtihesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_062028_320359_51419802 
X-CRM114-Status: GOOD (  16.35  )
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

Hi Drew,

On 09/04/2025 17:36, Andrew Jones wrote:
> Ensure we only print messages about command line parameters when
> the parameters are actually in use. Also complain about the use
> of the vector parameter when vector support isn't available.
>
> Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com/
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   arch/riscv/kernel/unaligned_access_speed.c | 35 +++++++++++++---------
>   1 file changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 585d2dcf2dab..b8ba13819d05 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -439,29 +439,36 @@ static int __init check_unaligned_access_all_cpus(void)
>   {
>   	int cpu;
>   
> -	if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
> -	    !check_unaligned_access_emulated_all_cpus()) {
> -		check_unaligned_access_speed_all_cpus();
> -	} else {
> -		pr_info("scalar unaligned access speed set to '%s' by command line\n",
> -			speed_str[unaligned_scalar_speed_param]);
> +	if (unaligned_scalar_speed_param != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
> +		pr_info("scalar unaligned access speed set to '%s' (%lu) by command line\n",
> +			speed_str[unaligned_scalar_speed_param], unaligned_scalar_speed_param);
>   		for_each_online_cpu(cpu)
>   			per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
> +	} else if (!check_unaligned_access_emulated_all_cpus()) {
> +		check_unaligned_access_speed_all_cpus();
> +	}
> +
> +	if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
> +		if (!has_vector() &&
> +		    unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED) {
> +			pr_warn("vector support is not available, ignoring unaligned_vector_speed=%s\n",
> +				speed_str[unaligned_vector_speed_param]);
> +		} else {
> +			pr_info("vector unaligned access speed set to '%s' (%lu) by command line\n",
> +				speed_str[unaligned_vector_speed_param], unaligned_vector_speed_param);
> +		}
>   	}
>   
>   	if (!has_vector())
>   		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
>   
> -	if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
> -	    !check_vector_unaligned_access_emulated_all_cpus() &&
> -	    IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> -		kthread_run(vec_check_unaligned_access_speed_all_cpus,
> -			    NULL, "vec_check_unaligned_access_speed_all_cpus");
> -	} else {
> -		pr_info("vector unaligned access speed set to '%s' by command line\n",
> -			speed_str[unaligned_vector_speed_param]);
> +	if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
>   		for_each_online_cpu(cpu)
>   			per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
> +	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> +		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> +		kthread_run(vec_check_unaligned_access_speed_all_cpus,
> +			    NULL, "vec_check_unaligned_access_speed_all_cpus");
>   	}
>   
>   	/*


Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

I'll wait for Geert feedback before picking it.

Thanks,

alex





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
