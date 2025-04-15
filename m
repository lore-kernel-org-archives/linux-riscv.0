Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1EFC369B8
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gutHnZ6ce1Ztbaq9B+d9ahShVYG/peVluTX6A7sOm10=; b=NdmSHLH4X7BFwX
	2S6YdKdcNHTMF2leOE8UYZ1mN4/kT321eFsH83C2O+O0JG0Gow8fKk4x1OdtRtNA8+5wOUPq6QOvE
	dV2DHz8tFr/MFQtJPtPT8Bn00+kvR3jv+vanqhTXDq54hTbLn4o11yRWpkiqCfR9r+x9/t+Zon5ix
	/wwIJe8MPW7nTkMeQWXWlFwbdh5iOTReDUWCyHafqKrRuAUZpELmwjLyg7LHjxrASxUu7g3kOQBsl
	8H1RYpyY4lZhEAF/MYl/YIUvsnWVTK5hWcFKWESmqSSHvleQk9FMsCmq6o0rkzctgf7N+o0PG9eyh
	hxcOBNdPiREdEvp3PGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bbq-00000004z7P-3iFI;
	Tue, 15 Apr 2025 08:25:34 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bR3-00000004wwx-33f1
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 08:14:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC1C41FCFE;
	Tue, 15 Apr 2025 08:14:17 +0000 (UTC)
Message-ID: <4f58ae70-16c8-48a4-9eca-35c61e7c8a58@ghiti.fr>
Date: Tue, 15 Apr 2025 10:14:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: config: Set MEDIA_SUPPORT_FILTER
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Hal Feng <hal.feng@starfivetech.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-riscv@lists.infradead.org
References: <20250404062235.671872-1-joel@jms.id.au>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250404062235.671872-1-joel@jms.id.au>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddvleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedvledugfelffetkefgleehtedvuefggfeitdeuteegtdeffeelieelheeikedvudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegsfeegtgemfeejvdgumegrsggrtgemsggttdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegsfeegtgemfeejvdgumegrsggrtgemsggttdekpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegsfeegtgemfeejvdgumegrsggrtgemsggttdekngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmv
 ghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehhrghlrdhfvghnghesshhtrghrfhhivhgvthgvtghhrdgtohhmpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_011425_903329_CDBCD5F9 
X-CRM114-Status: GOOD (  16.11  )
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

Hi Joel,

On 04/04/2025 08:22, Joel Stanley wrote:
> When Hal enabled MEIDA_SUPPORT in order to add the VIDEO_CADENCE_CSI2RX
> driver in commit d8a7d89abb09 ("riscv: defconfig: Enable StarFive JH7110
> drivers"), it turned on a few hundred (254) other MEDIA drivers.
>
> The subsystem has a option for this very case that keeps the other
> drivers disabled: MEDIA_SUPPORT_FILTER. Turn that on, and
> MEDIA_PLATFORM_SUPPORT, so the CSI2RX driver stays enabled.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> The filter option only appears in a small handful of arm32 defconfigs
> (and I maintain a few of them). That's because MEDIA_SUPPORT_FILTER is
> normally enabled unless EXPERT is on.
>
> The root of the issue is the riscv defconfig selects EXPERT. Most
> arch-wide defconfig don't have that on. Need to get to the bottom of
> that, and perhaps disable EXPERT?


I could not find the specific reason why we enabled EXPERT in defconfig. 
Given the description of this config 
(https://elixir.bootlin.com/linux/v6.14-rc6/source/init/Kconfig#L1545), 
I think it should be removed from defconfig instead, that will fix the 
"issue" your uncovered here and maybe others?

Let me know what you think,

Thanks,

Alex


>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/riscv/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0f7dcbe3c45b..c34fcf2c6a2f 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -182,6 +182,8 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
>   CONFIG_REGULATOR_AXP20X=y
>   CONFIG_REGULATOR_GPIO=y
>   CONFIG_MEDIA_SUPPORT=m
> +CONFIG_MEDIA_SUPPORT_FILTER=y
> +CONFIG_MEDIA_PLATFORM_SUPPORT=y
>   CONFIG_VIDEO_CADENCE_CSI2RX=m
>   CONFIG_DRM=m
>   CONFIG_DRM_RADEON=m

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
