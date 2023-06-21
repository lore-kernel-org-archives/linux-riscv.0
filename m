Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6D8EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nS+Zdh+emUjPxVKBgHVdD5qttHQmDamtKoaw76WiVvs=; b=qzQL8Gd4xG4j92
	Sqm5QtlAH2XRsswx3K/VtaL+YrzRr7mtcRzURtQdEMfqhMJ5dpdDP3HIdRqZS3gyF5sk96yJjK0tl
	Miewu77V+vuXHB7QJxcln3ypjmuTTLcH4ZRWKxtK4brLqmNWmzXzp9+TIdhOybNkODum7vS4nbNpX
	Y9vMlQrCjYaNSLDwFfaa78hfqiDOLApIMNLc/Cg4ywfs1yy2T3F3koBLwW3kWqVU1y6nqhSV2ists
	u4Q0E6Lwya35xNfp/KnDvz5T9k0KAIQS9O7uwEAxPJIaRu/MctI+Vej72fa1+Q68x74zRsz16dg+y
	IFFi/+aF58psuhjmOeiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC07f-00F0WQ-3D;
	Wed, 21 Jun 2023 15:51:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC07a-00F0U0-08;
	Wed, 21 Jun 2023 15:51:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 909F6615A2;
	Wed, 21 Jun 2023 15:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FBFC433C0;
	Wed, 21 Jun 2023 15:51:45 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	steven.price@arm.com,
	vincenzo.frascino@arm.com,
	leyfoon.tan@starfivetech.com,
	mason.huo@starfivetech.com,
	jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	Song Shuai <songshuaishuai@tinylab.org>
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH V2 0/4] Remove WARN_ON in save_processor_state
Date: Wed, 21 Jun 2023 16:51:43 +0100
Message-Id: <168736259084.605458.4732376069158804322.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609075049.2651723-1-songshuaishuai@tinylab.org>
References: <20230609075049.2651723-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_085150_114779_FC7EF133 
X-CRM114-Status: GOOD (  10.85  )
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

On Fri, 09 Jun 2023 15:50:45 +0800, Song Shuai wrote:
> During hibernation or restoration, freeze_secondary_cpus
> checks num_online_cpus via BUG_ON, and the subsequent
> save_processor_state also does the checking with WARN_ON.
> 
> In the case of CONFIG_PM_SLEEP_SMP=n, freeze_secondary_cpus
> is not defined, but the sole possible condition to disable
> CONFIG_PM_SLEEP_SMP is !SMP where num_online_cpus is always 1.
> We also don't have to check it in save_processor_state.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

I couldn't tell whether this series would go in as a whole but given
that the patches are independent, I picked up the arm64 one.

[2/4] arm64: hibernate: remove WARN_ON in save_processor_state
      https://git.kernel.org/arm64/c/615af0021a61

-- 
Catalin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
