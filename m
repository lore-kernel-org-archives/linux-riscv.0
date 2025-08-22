Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B393ECA0EFC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 11:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UbmTMeEsrFZtqCIH+wyy2p7dlHOP7Fb56MPFqW9An8=; b=p0e6ihGH3yBAHb
	IReXlesiQG13ft9wLGaO0/Ry+i+tc/LlMPO8WdlNk3Qy6CVYVYXSw/6iCJSTZ/14TuV3UhakBZxIL
	eWWWhVrjWnkhv7UjO2aF4/AKDmBxOEe3pGGYsK6zerDfkO5P6ePgD5aELtt9rkyWayTzKoH/GaNHY
	LZUw49q8YDJ4QnY7iMZP96Vk+2bGTXb26LVsg56GqwCSIO7ODNMpcqgycQEF8v4w71RzopqpA45m3
	bA5G2eB1RTpzpwyzDjKTmRvA5to//r09WBBPiiQKTbezOGMXZPvTs4/o+RoXCneCDqgeeNb9rKD4+
	2Ee2RdkwSB8d3NpS6h5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQGK-00000002NYR-3LCN;
	Fri, 22 Aug 2025 11:48:52 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLdS-00000001kX3-28NG
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 06:52:27 +0000
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 6FD4053666;
	Fri, 22 Aug 2025 08:52:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1755845544;
	bh=6AGDwX5cwNQJU6T7X/YiirWHQJlaXZeAFX5Fxe7kv6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JTD/8/cmH6EuS/2bKcpWduheMGC0bfPT6JtPlAQakAwLT1B0LOxQH8zSgx/ExATFo
	 ixNKfi2T8Q/VF1ucpFynoEFFGi1jdAloUyYvHf7+GRtHlXBwEPGK7eF6xXTQ7TXcGX
	 gp6oL3QBgp3pncKOsLaTR0LJYOOc69OH9AYtf9M2islAxb8sWx5kHWRZz7YBE1QT/6
	 dhYIsq6NiRdJNWzY9KdsSWjLweetWH15HfDtZ4asDLWclzB0SUbetETqcmmBYjExhN
	 ika+6R8PTa027PSlJeOvTYGep6zhBtOmb33DzvolCbJO4c5ePehVAVI+S/z4+iXfIS
	 Loez368DXbIjQ==
Date: Fri, 22 Aug 2025 08:52:23 +0200
From: Joerg Roedel <joro@8bytes.org>
To: XianLiang Huang <huangxianliang@lanxincomputing.com>
Cc: tjeznach@rivosinc.com, markus.elfring@web.de, will@kernel.org,
	robin.murphy@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] iommu/riscv: prevent NULL deref in iova_to_phys
Message-ID: <aKgTp60ge-8GeulQ@8bytes.org>
References: <20250820072248.312-1-huangxianliang@lanxincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820072248.312-1-huangxianliang@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_235226_771024_22239A79 
X-CRM114-Status: UNSURE (   6.81  )
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

On Wed, Aug 20, 2025 at 03:22:48PM +0800, XianLiang Huang wrote:
>  drivers/iommu/riscv/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for -rc, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
