Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317AFC83F22
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 18:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oa2u3PQuAl80qeUDuTnDRZAg+wjlIPgP7xhZUHpCI5E=; b=CJ6H08uweh7kP/
	wbNwVkWmB5o9wqzWj29xvLgIYhrsMMwc+KCYuZHPIetzMiydPmFnRp/QqLXxPILxZHQiiGmwN+iXI
	4vVds9qe2RiYJv+1+sWEhuyuSgbIA3bcu4x5hNFF4veqvHPV2Vnbr6SyM0H5wX+YSAOa+JdndwTOt
	yF8UYkiuMfBaTSONyxC57EesOa//P5DElnVUj9C61/MeD4cDgXac9Uo/8zbiaspdnYl7cTBY1n1Aw
	QNCujGGKtxflQUAAeIyPdEyHNBLqCFKlXMdLRunnzhYaRVjKbOEnKcJ8JjjnCSdnMcX49rp7ImEZ1
	mU9FP+bVeYNF9xNZqSiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaICl-0000000FT7R-3iDs;
	Fri, 11 Jul 2025 18:10:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHoD-0000000FR93-1O4w
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 17:45:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A88E060054;
	Fri, 11 Jul 2025 17:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EA8C4CEED;
	Fri, 11 Jul 2025 17:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752255916;
	bh=gTiT/0NnpWkrulw6wrxpgViH2cVPSMHzQqrkNhk5evM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mHIV7VU86yQ8onOtR4vxjTJWigHw9S/Ly/U0j3sd0XZTpgcPH0P8DPRSuEazjO2O9
	 mL3HcO8hpMlf6bxngmynfsXFBv3NQlAFaFVCZo8Ed/yPXky0rsMSWq59xioGBFtlNa
	 QroVdcwgX5T9LX/igutq7/JENA+b+U6+l+ldvSMjwsKyATgbWAyR8y+lwSNWT/kNxY
	 PThoJ5JxVNmR/76PnSUP3uMI3SVfEg7AlnRwRuZZYyZRZcRx3SMojthOPhL+wi5wJN
	 LlnkS6JwUh76i6eJdIzCieNBY7uXZyfSiReOnxlmUOuVCmV58B53XXh1sdgNTbkJSm
	 GYJY1dKOwCqQw==
Date: Fri, 11 Jul 2025 10:45:14 -0700
From: Drew Fustini <fustini@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH] ACPI: RISC-V: Remove unnecessary CPPC debug message
Message-ID: <aHFNqhfZG+VQQzTv@x1>
References: <20250711140013.3043463-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711140013.3043463-1-sunilvl@ventanamicro.com>
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

On Fri, Jul 11, 2025 at 07:30:13PM +0530, Sunil V L wrote:
> The presence or absence of the CPPC SBI extension is currently logged
> on every boot. This message is not particularly useful and can clutter
> the boot log. Remove this debug message to reduce noise during boot.
> 
> This change has no functional impact.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Thanks, I'm pleased to no longer see the "NOT dectected!!" when testing
defconfig on systems which don't have the CPPC extension.

Tested-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
