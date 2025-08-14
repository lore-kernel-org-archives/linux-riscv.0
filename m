Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1555CA0EE6
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wT57uct6jSg+PbdohupIKVJFadvop/jZ2DYNBkqgVM4=; b=x9Qa2PMykIEZqT
	76gZwJM+boRSAowS/fqLnhoKj9IDdpwxwEpUzrxq6M6FNQ+9S8zs7U/DI0NgoYnhULPZDTYZd4U5o
	M5KKLdlJYDx9H7s+FZVNinSSNigrx2CbeIGcUaqfoNg21K026ht2s3Nz3usqmNN9bRzCVpuJROJkA
	HfzGw9IOgfEA9iFzNAwY/3sq34sWx8iebRVfAmb+D87U7O4cZKIHKjeBrRXKh79q1Mcd9WNDTZ+yp
	n1R2Lvg803H263jckC6TZgw7WoDLQnMIerTuZkB/6etuM0Qcnn7jCC/54z5rkJqFFTu8uXWrBFNK+
	ltt1rWCKI78s/QqxXmsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXmu-0000000GxQk-3PNj;
	Thu, 14 Aug 2025 13:14:36 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umU8L-0000000GO4k-0JQT
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 09:20:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EAEE743195;
	Thu, 14 Aug 2025 09:20:21 +0000 (UTC)
Message-ID: <b2a4df29-f35c-403a-a2a1-47ca9fce0023@ghiti.fr>
Date: Thu, 14 Aug 2025 11:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: sbi: Switch to new sys-off handler API
To: Andrew Davis <afd@ti.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250813151855.105237-1-afd@ti.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250813151855.105237-1-afd@ti.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesv
 hhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_022029_264482_A18F1CC9 
X-CRM114-Status: GOOD (  13.66  )
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

Hi Andrew,

On 8/13/25 17:18, Andrew Davis wrote:
> Kernel now supports chained power-off handlers. Use
> register_platform_power_off() that registers a platform level power-off
> handler. Legacy pm_power_off() will be removed once all drivers and archs
> are converted to the new sys-off API.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   arch/riscv/kernel/sbi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 53836a9235e32..5e8cde0552643 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -148,7 +148,7 @@ static int __sbi_rfence_v01(int fid, const struct cpumask *cpu_mask,
>   
>   static void sbi_set_power_off(void)
>   {
> -	pm_power_off = sbi_shutdown;
> +	register_platform_power_off(sbi_shutdown);
>   }
>   #else
>   static void __sbi_set_timer_v01(uint64_t stime_value)
> @@ -682,7 +682,7 @@ void __init sbi_init(void)
>   		if (sbi_spec_version >= sbi_mk_version(0, 3) &&
>   		    sbi_probe_extension(SBI_EXT_SRST)) {
>   			pr_info("SBI SRST extension detected\n");
> -			pm_power_off = sbi_srst_power_off;
> +			register_platform_power_off(sbi_srst_power_off);
>   			sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
>   			sbi_srst_reboot_nb.priority = 192;
>   			register_restart_handler(&sbi_srst_reboot_nb);


Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

I'll take that for 6.18.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
