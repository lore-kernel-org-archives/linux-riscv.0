Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B79AC44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Irs5Q5WQ7MDQQ0oXkWw9ZyKzJIrEhdu4e2nWHEJFDw=; b=VAkI8O22fsF5HO
	KyVhfUogsg+SafjAeKRYriLWFqorrNo7dkfa6QCFGM4tknHi2FJWrN2RI3hWXBNMx87DEoa8g6iFx
	MhXPp5SKpd54nO6uwJAm2nX40nTMIwVsdrbokwbjKn/bboDYObka1bZsN2vEvcDbi9M4awttO52mO
	89ZiEnrP0eer2EHCpYmf4RjzuQG1aKLEB3j1LVqeaawqgIehn99NAfjvUJJwdGbgLs1wpNkMe4xkc
	NkyCUYQ9teDP0PFFwpipNwTeehNip8WlLa1SKcd++2gkVBPnJ5JBMTJnpEzisig/fwpGY/Xi6mqaa
	D+IY8v/Z7asoEH7ZsI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipBA-00000006ZGn-40l2;
	Thu, 22 Jan 2026 07:32:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipB9-00000006ZE9-42Mr
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03B196012B;
	Thu, 22 Jan 2026 07:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E56C2BCB9;
	Thu, 22 Jan 2026 07:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769067150;
	bh=4c13PYVKBuj93wLp9HTpARpZW9JIi8Nd3PvLJryjPVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3WH1jLn8JpqVyJqVSKcSP8ft/yqpIauoZPAbLZsqke25QzA4aRXAZqBHgexc4nsv
	 NPykm/mGYzjN54Ax1JBsgwMSVhs9uANczkjvOW32ksNcH1ftrin/37ZE3ZwQYcuSRB
	 fuqUILYiFwVZiTbAqzToDmVD/844LHRBCv8Rp1+D3JotfjrG3stS9xZxi8cMk4sU7n
	 jzAcGiJOY6eja/8HqLE/mQ/Z4/cbSTHn9DEz8sI78f67LUbOAkdnagHmSXzgAcGAN/
	 1bZhi0qb9QctfjidfK3gM2m98YJqAD1/ktmoCUmP8XDNRkx7IMcB4XhH6aV00eLcZO
	 0qJ669HgNnahA==
Date: Thu, 22 Jan 2026 08:32:24 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] drivers: i2c: add the driver for Andes I2C controller
Message-ID: <aXC6rkiG5lI6n3JF@zenone.zhora.eu>
References: <20260115145244.435890-1-ben717@andestech.com>
 <20260115145244.435890-3-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115145244.435890-3-ben717@andestech.com>
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

Hi Ben,

...

> +/* I2C may be needed to bring up other drivers */
> +static int __init atciic100_init_driver(void)
> +{
> +	return platform_driver_register(&atciic100_platform_driver);
> +}
> +subsys_initcall(atciic100_init_driver);
> +
> +static void __exit atciic100_exit_driver(void)
> +{
> +	platform_driver_unregister(&atciic100_platform_driver);
> +}
> +module_exit(atciic100_exit_driver);

Please, check how other drivers initialize.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
