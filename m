Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3BDE77183
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 08:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4W//RAWHNY1u3E6b2gp6IHX3/yA8OCJ7FSqV9uZY8p8=; b=tNfVfO4KZv9HSm
	YzP+z/234IEms91ZKGshfSLPbkUkKfilh0Ca8m6B6tDRPL5dF3gXwiEvx3c35iPIonimJvzDaGool
	snmwJcLkTFI1Mac0V6BXDWOFukPrAWgSnfVYueD53+PJzIzGxKi5x23DSv9TDC7COAVHX74MNxDdH
	irtRqGWxROompV9j2q/wmg10v3aI3hrjiV6jxkDLxg4Nx3L2557AbjQ2LO0cRwAErGN5Q3Lod2AzN
	5Z+O2U2mdVoUxloJUbGWfigcC2dIluTJf8ob2RlkBAOSsOZ4MDcA3WTn1jvdLcWtjFv6R37ZLwC6W
	YsdJUXazj8iz6aEK/FYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpUj-0000000Fw10-1dtj;
	Wed, 18 Dec 2024 08:33:25 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpUh-0000000Fw0X-1cA5
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 08:33:24 +0000
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D548F2C1E66;
	Wed, 18 Dec 2024 09:33:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1734510798;
	bh=SnXrVVcZicUpc/vldSOmA4Er3YIKiqZz/uXkr2nSFV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DpYdvIsE5/rFS4guUUOBuRAgp5vukDkiJn1CimvBFDFs/VA7+OkmUv4+yTLWJ5FRe
	 Damw0ekNjs4c1ckhcY45ERDEfk9frwaCeCPS1jVZ5nMrJEUcWYq/VXfSgnNsJ9mIH1
	 v9NpXifSGgKn3sNBr615xyf7e6W0Ig/3X0WoqtfVj5t4sOQLTmbzW9KzHdxA3Zgjnr
	 u5BSOy/plsYe7PINGnLuQJsYfwYULPM/stRGD9qZlwYGQlsiQMEEP3hmf0oFVJh1LB
	 mO0e/jWHj1xXm3pIkgonXftKsrDqAUfv1LQ51uB65lHDbwDM+Clqzx4IGlBOyJ/54E
	 KDFaVbHo3zhgw==
Date: Wed, 18 Dec 2024 09:33:16 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, tjeznach@rivosinc.com,
	samuel.holland@sifive.com, will@kernel.org, robin.murphy@arm.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH v2 0/1] iommu/riscv: Add platform msi support
Message-ID: <Z2KIzNl3Mf0aL8IP@8bytes.org>
References: <20241112133504.491984-3-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241112133504.491984-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_003323_637426_8769C77A 
X-CRM114-Status: UNSURE (   7.99  )
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

On Tue, Nov 12, 2024 at 02:35:05PM +0100, Andrew Jones wrote:
> Andrew Jones (1):
>   iommu/riscv: Add support for platform msi
> 
>  drivers/iommu/riscv/iommu-platform.c | 102 ++++++++++++++++++++++-----
>  1 file changed, 84 insertions(+), 18 deletions(-)

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
