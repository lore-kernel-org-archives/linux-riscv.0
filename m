Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AC8D73EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 01:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2eHkVFhOalQaHtIbEkfBgNqNCRMM3gMiK38scSHsZ0=; b=alr4JTR2grLue5
	Gg+hFAeOwEkbCth/XulyGBg6uEF+NKsL33rFRQw2NviZJk9MeyhQU2/iNOUu+QrEN6PjGLDgPorc0
	52Z5escibPNnPif1/ULsyVFrGOsgX4Em+hco/IRJbtHH5fufwBf28vZ4SRZRII+et2v5mh3cly+n+
	ZMSXu7A2AxJGkRAuhrn8FKeZooT+02pdPD2VDeB1bmtW/huXk8AwsIxHeOG5BFgieGmMMrHEffrgA
	3ooWHf7lPd7X0g8GNu4+r0NvenQRyW/aJCTQmFbMVZ6TZPjuNR9D1MOZDE6I9s7FXMXH56u63qvkw
	bQMdMDJzyjoQVWUduzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vldbQ-00000000s36-0ebd;
	Fri, 30 Jan 2026 01:47:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vldbN-00000000s2j-3CjW
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 01:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2DD043E7F;
	Fri, 30 Jan 2026 01:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C906C4CEF7;
	Fri, 30 Jan 2026 01:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769737632;
	bh=uTSb/3Bkr4NURu+3jD3jtSKpyQ/UkCRXOV9UB1ooxao=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZwgkMPgQt7vephvdERWPsEINhAslVuiyMHogeeVGrvSJmc5466bzjhdLBrgMg5IIZ
	 TqstFv4B+nyUSVrgWW7/FoisVLkFZ31hpWljhjzPIBH5UMbhObNR7E35Mbcp3Qkm8p
	 ugTb0/uITFunWHMIeRIUr16JM0Ys0+6rJkK/uPt2nxoJ0dEb3iLd2LyDchf2QmimJT
	 VPO7hTYYz4gnnbfDltJ/ORb3r/zhxbPNgufswZhl/dnTrSsTumnpU5GWLik+V81OTH
	 3N4U6S779MiELOlRApjmrQLrGo7qduNvRErsi9d2cBmZ1l6jfrhL4I0IiPMI3RdXYp
	 KLWs0Fp7LEg+w==
Date: Thu, 29 Jan 2026 17:47:11 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Tomas Hlavacek <tmshlvck@gmail.com>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, dlan@kernel.org, wangruikang@iscas.ac.cn,
 stable@vger.kernel.org
Subject: Re: [PATCH v3] net: spacemit: k1-emac: fix jumbo frame support
Message-ID: <20260129174711.2965f189@kernel.org>
In-Reply-To: <20260129042908.410326-1-tmshlvck@gmail.com>
References: <20260129042908.410326-1-tmshlvck@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_174713_826262_080ECA5E 
X-CRM114-Status: UNSURE (   5.49  )
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

On Thu, 29 Jan 2026 05:29:08 +0100 Tomas Hlavacek wrote:
> Subject: [PATCH v3] net: spacemit: k1-emac: fix jumbo frame support

Could you repost this with subject:

[PATCH net v3] net: spacemit: k1-emac: fix jumbo frame support

The "net" after "PATCH" is crucial, since the patch conflicts with
net-next. I needs to be ingested specifically for net in the CI.
-- 
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
