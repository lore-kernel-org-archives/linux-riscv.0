Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4369CC021BE
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iynM0+iFiJIU50bDYPpoL/zOeSAGjg84W0Upi6jd/zk=; b=w6QoI7KTHhTvv/
	u6da60jUbiDoRvKg8kDyNwLwScQForUiHvd+YDEPSrITbv8fIRLXEUbWvb5swQwMJu2R7n22pe0qx
	nCduX7YyBDK2p8xk8aZO8bDFykilO3O2WEpPP0185OIU1Rp37xP9Oka8SgQbIJmQXJKS6ckTTYk5C
	bQ5mRZGD01lngyQpvUVgF6ycGPc7Fs8u9qqzwq+EKpdQMWYYwJawpxsYPYNFhYpTrZdFYoyx3RT0D
	muWAdlJuQdVVNNceSCtsePfL4Ya6ffK7y9djH4cSVUM86nfDBzehVMsRwqnwEHqKSn8AB5pWzeq6J
	IGXjgiAU/gnfo/Lt7/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1I-00000000Lzh-3ZXe;
	Tue, 25 Feb 2025 16:42:56 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwZu-000000001oy-3rfo
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 15:10:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 100A244286;
	Tue, 25 Feb 2025 15:10:27 +0000 (UTC)
Message-ID: <4c7393a5-ad1a-4740-b454-a9b85682a78f@ghiti.fr>
Date: Tue, 25 Feb 2025 16:10:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] riscv/irq: use seq_put_decimal_ull_width() for
 decimal values
Content-Language: en-US
To: David Wang <00107082@163.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20241108162503.9914-1-00107082@163.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241108162503.9914-1-00107082@163.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheptddtuddtjedtkedvseduieefrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_071035_122452_F20F8B8F 
X-CRM114-Status: GOOD (  15.03  )
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

Hi David,

On 08/11/2024 17:25, David Wang wrote:
> Performance improvement for reading /proc/interrupts on arch riscv
>
> Signed-off-by: David Wang <00107082@163.com>
> ---
>   arch/riscv/kernel/smp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index c180a647a30e..f1e9c3db094c 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -226,7 +226,8 @@ void show_ipi_stats(struct seq_file *p, int prec)
>   		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
>   			   prec >= 4 ? " " : "");
>   		for_each_online_cpu(cpu)
> -			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
> +			seq_put_decimal_ull_width(p, " ",
> +						  irq_desc_kstat_cpu(ipi_desc[i], cpu), 10);
>   		seq_printf(p, " %s\n", ipi_names[i]);
>   	}
>   }


Very late answer sorry!

I don't have the same output before and after your patch because 
seq_put_decimal_ull_width() second argument is placed *before* the 
number, not after as it was before.

The following diff fixes the issue:

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c index 
f1e9c3db094c3..4b80ee4e5b2c0 100644 --- a/arch/riscv/kernel/smp.c +++ 
b/arch/riscv/kernel/smp.c @@ -225,9 +225,11 @@ void 
show_ipi_stats(struct seq_file *p, int prec) for (i = 0; i < IPI_MAX; 
i++) { seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i, prec >= 4 ? " " : 
""); - for_each_online_cpu(cpu) - seq_put_decimal_ull_width(p, " ", + 
for_each_online_cpu(cpu) { + seq_put_decimal_ull_width(p, NULL, 
irq_desc_kstat_cpu(ipi_desc[i], cpu), 10); + seq_putc(p, ' '); + } 
seq_printf(p, " %s\n", ipi_names[i]); } }

Will you respin a new version?

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
