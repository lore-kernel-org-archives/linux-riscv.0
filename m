Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7315FC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 13:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiy4LdSvoNhgHkqdvSAKaO8tBuomp/SuRFA06gRDjfo=; b=fkB5ELg0RaxH2F
	CkTRLiqbb93wa+BKv4f+i6pY4WQ5EAmKobJDrihmwGwT0UKvyDW34YGzYck1jtkwZUl4kARzVAXTR
	//VnCeJZ9bDVFdkSHbvAO3wXgiaJeZ4VZyKn1cIZ7u4OaqvI+339enBcGoaGXVxkll1pqd4+Lu4f/
	TUKN+owEAJFKFshiZcNubkvhpAK7JW1KaHztVV2JlVTc5Ezn7RbyoQsAZPzoWpdbmOLHe2+xu4JmC
	tleMobHAb6u00jZUnkczZKazKbju4LSR9XL5hFkVO9A6w7L5K1QGm9VCkeqE22qfmDYyh/xPt0Ght
	N79Gkrusei8VEpxRB2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgFD-004wpe-3A;
	Mon, 11 Dec 2023 13:22:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgE5-004wUy-0W;
	Mon, 11 Dec 2023 13:22:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F892CE0AB4;
	Mon, 11 Dec 2023 13:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D26C433C7;
	Mon, 11 Dec 2023 13:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702300894;
	bh=pdOjaPV9Jsg2+hufBUTJoin1FtJ4JLo5gH1YiEsQ8lI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIX+Piq0oQQdGn8TD0Edg+vyONGxOr1LGqK2bq6Dsi6ovtOvnWpT/rIpQOFhBlA3b
	 RD+M0Y9olHV8bbTdPocbTzZZmSuQtM3wSgOKRufOCXeKAdrG2YkwpRzI1hwx19gfpd
	 R8J7br7NfDKSsDo3Ubfz/IzHwRPxRpH0UZXsDmakCZQtxs8yx3CHcht0dAUUySZ72W
	 7ezqAlqh/1/ULVq4w52iqG1vo6pwpmtsxVWD0ybb3R5KpAvHOys51oI1D1oLC2d49W
	 kbq2skXfspeTVUkdhvgV61N5n4rZQ8glL+SZEddbiQ/dbTg34ryLGY2yDr7oygKcuA
	 WwZRQbf9JcgXw==
Date: Mon, 11 Dec 2023 13:21:27 +0000
From: Will Deacon <will@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 13/21] arm64: convert to arch_cpu_is_hotpluggable()
Message-ID: <20231211132127.GD25681@willie-the-truck>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
 <E1r5R3g-00Cszg-PP@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1r5R3g-00Cszg-PP@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_052139_090027_63FC9549 
X-CRM114-Status: GOOD (  13.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 21, 2023 at 01:44:56PM +0000, Russell King (Oracle) wrote:
> Convert arm64 to use the arch_cpu_is_hotpluggable() helper rather than
> arch_register_cpu().
> 
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  arch/arm64/kernel/setup.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 165bd2c0dd5a..42c690bb2d60 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -402,13 +402,9 @@ static inline bool cpu_can_disable(unsigned int cpu)
>  	return false;
>  }
>  
> -int arch_register_cpu(int num)
> +bool arch_cpu_is_hotpluggable(int num)
>  {
> -	struct cpu *cpu = &per_cpu(cpu_devices, num);
> -
> -	cpu->hotpluggable = cpu_can_disable(num);
> -
> -	return register_cpu(cpu, num);
> +	return cpu_can_disable(num);
>  }
>  
>  static void dump_kernel_offset(void)

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
