Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C2DD277DB
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 10:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qe+4J28MsoxJhQW5eQIRNRrTmzyudV9Ythy06nfEZ4=; b=i3PhFZdonHQfLy
	qCV4y4ozZuexYYGDF+/4yNCsjJU1MrPIJTqTrpQxaQEb0WLiaguXuQzxURGF4sdYZI+n0BMYk/4aS
	F4aYc/6Exi/pXxdCic3vExz+p5fCpXXLqHTzbPpRUplGrtO/PQ/skgr8mq/RTXB2j/z7R/N+VeQOd
	Obisj025L3h3ES2QmE7t8teMSZQ2VnsxLL7SbuGQRYAaYAyKF5yiwzq9GH4lSgL4mRaHP8BEZSKEu
	w4wKBR83CrRRlPN7UsFBcpNrbUtG6RmSozim4HthKXadPlxN/pvI1HcaHsVFSY5YVzihjS5HCSQB/
	r5vFdHq3s4ad2GyaHA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW0I-00000003O00-39VA;
	Sat, 10 Jan 2026 10:15:30 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW0F-00000003Nzg-2fla
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 10:15:28 +0000
Received: from 8bytes.org (p200300f6af1d9600dfc71246d978d903.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:dfc7:1246:d978:d903])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3F7775F02F;
	Sat, 10 Jan 2026 11:15:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768040125;
	bh=DEa91GITfQq0xAVB+V/DgqtSoDnyax4wWtgfjH6t8uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ud8NMZhyj1nHny1wbIBrGssjRuCb1dW7VFjpM/keqBgJnLyv3776aeabfED/z1Qvu
	 JkIjqElEnXbjIk18PlmVUjkX95XdurmdZZy1vLKgSlH3xWZ9SaQHxzHY/cvcxMvB4j
	 6gEAiJK1HqyHXUugZ4nfxROYKtQcm9aGwjAnC8vArSAESyUqUFnP2qnFBNtc7+YaFL
	 kkM6Cn6Wy2qn+jRTx+ZLZ24r3lyJz2brbCFXxzOn3jzzVAIdeePctHi+pvsLO1if9W
	 DsWAjdJt1v5dehbDtT4KGx92N8mdW5UJxdtOiyPqO+w26/etLMbPEP9O00ZVCg7DYL
	 LiZrsYUpWrBEg==
Date: Sat, 10 Jan 2026 11:15:23 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Alper Ak <alperyasinak1@gmail.com>
Cc: tjeznach@rivosinc.com, Dan Carpenter <error27@gmail.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/riscv: Fix unsigned comparison with negative error
 code
Message-ID: <mrufqpwz3sfpren7lqfukyqw3bnjhpvgo7huxhx7fbdwt3j3pn@mfv6ptky2kgt>
References: <20251222151550.987992-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251222151550.987992-1-alperyasinak1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_021527_895491_C252C0F1 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

On Mon, Dec 22, 2025 at 06:15:49PM +0300, Alper Ak wrote:
> -	iommu->irqs_count = platform_irq_count(pdev);
> -	if (iommu->irqs_count <= 0)
> +	ret = platform_irq_count(pdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	iommu->irqs_count = ret;
> +
> +	if (!iommu->irqs_count)
>  		return dev_err_probe(dev, -ENODEV,
>  				     "no IRQ resources provided\n");

Separate the ret < 0 and ret == 0 checks is wrong, just check them in one if
statement and return the dev_err_probe() value as before.

-Joerg


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
