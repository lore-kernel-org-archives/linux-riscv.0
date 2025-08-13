Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4EFCA0EE5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmQXX2yDioe2I71x8oo/Ar7i4B4JgnULQEZ6tlBlZRs=; b=iq61LLnZv9Uvap
	0LpfIOQCaW95/h8v9m5qvpSzXOCBbDYZ2DeJgGPYr7qAh+zP+VNH56MLQihEB6jhMZCvJD1dhwqIV
	eMnKfy4eLX/y7haiwuH57MOZp6v95I1GRXnrDm8xjNMc7dDamkVU+glVTSWyspEuRyU9RP8cbWOUI
	NvqIq241JoncyqDAa739VgodnJTUS6iZbgJL2RZOxTugjosLDD/SRCqFjgSGYoHDUPWB5yfds5Vlz
	kLgQScoiAgp+tLKi6193HReQf+e2bwPTCEImyGyiz73hWIoKc2ISZ3T2RSZ9Dt40lwDJ1FY3h8bCZ
	/rLpe7pYnEY87NYeqOqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPo-0000000ErKV-0unx;
	Wed, 13 Aug 2025 19:45:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGDY-0000000EiTQ-3XRS
	for linux-riscv@bombadil.infradead.org;
	Wed, 13 Aug 2025 18:28:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=joTT7/9fm1AeaK7asQRu+JxpyS7HzFLUIs5b9XT3wYI=; b=j45sl0uUrVs53TmpjtrCGmj5X+
	ou+Ih2AZq69D8LW3sohlYW7zL3KGXdd09Njo7aLoxdhZ/XZZPEqiWV+NkxwCDlXS4xV0Bg++b3FGw
	mC/+3J2rZvSMWrIQgdf/xiB2PAwxm9PPHC1Ybj/KK6iMXnikfDykJFKiSTXdrXQAezF0HVZgsUK52
	uO/249eYEYT4D45dOtyMTCzk6AE8mWv0n4x6YZ4cCjsKyitd1Qb7mbJq8TlH1h1LKzNAetw8DUbZD
	LzpCT602ywJ4K5QfgIXMel9JSae2urMpo6+YpD7SePZQDt5s7FdV9EeW5y34/YaLJaJlFlCxY6sbZ
	H4Z0mCXg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGDV-0000000G9Mh-1GcL
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 18:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A99395C6E7E;
	Wed, 13 Aug 2025 18:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343D4C4CEEB;
	Wed, 13 Aug 2025 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755109728;
	bh=0pN6zJ59cUFTkBcTA4HOwUYW7xgiGd+cBDcCJZwybjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UlN2WNIYYKJuoL8/IXKr4g1U+grYS5lonEZyikuUaHmIdXzNGdM34HJsM50vVj5cx
	 7S+UJrVXihtv+HBtZEwauN4OxSQQAkDgKA/Bh4CO82PTFNhJYexSxjNAnqcCuBiQV0
	 8YGcnr/S8Hr+/IC51bdROFQUydjGaDB7+7AIG45RY6fhp0+YbExwk3vWeu0lbesCRY
	 Ink/X0/zpSUWbibj1C99CsEHdFkMB+9SaD+6wmUPZ4ImA+ZSLZydjGLiQHbfZYfWki
	 YKZso2jB35Z6W8nsMHFd4NQ/G2atFwu6d3A33CXoTt3LfzPl/q6PwPZUIIDuf47P/f
	 ZSk/BscUcN2UQ==
Date: Wed, 13 Aug 2025 11:28:46 -0700
From: Drew Fustini <fustini@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 16/21] reset: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <aJzZXvSjoAVa8kjF@x1>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-17-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813161517.4746-17-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_192853_854890_B7CA93C3 
X-CRM114-Status: GOOD (  16.01  )
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
Cc: Yao Zi <ziyao@disroot.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 13, 2025 at 06:15:02PM +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot is
> happy, too.
> 
>  drivers/reset/reset-intel-gw.c | 1 -
>  drivers/reset/reset-qcom-pdc.c | 1 -
>  drivers/reset/reset-th1520.c   | 1 -
>  3 files changed, 3 deletions(-)
[snip]
> diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
> index 7874f0693e1b..3ec22ae1fac1 100644
> --- a/drivers/reset/reset-th1520.c
> +++ b/drivers/reset/reset-th1520.c
> @@ -78,7 +78,6 @@ static const struct regmap_config th1520_reset_regmap_config = {
>  	.reg_bits = 32,
>  	.val_bits = 32,
>  	.reg_stride = 4,
> -	.fast_io = true,
>  };
>  
>  static int th1520_reset_probe(struct platform_device *pdev)
> -- 
> 2.47.2

Acked-by: Drew Fustini <fustini@kernel.org> # for reset-th1520.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
