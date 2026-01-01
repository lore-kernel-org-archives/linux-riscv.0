Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC02EEB57D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jan 2026 11:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qIpPo6VUR5JciFvs0QHOv1Q1q2jPINyrpJal5Bk5sEE=; b=Vty8HiI+4t/jXt
	l3rRhqz47QtzTytPZVmWx0Qz9Rfvm2VqYVxIWt3R2nehizeMBycOn5GYZKRSQNN39yMaqRjlcWxi6
	qYe9rdmmJJDGi3JCQfIVAhTxjzl3mpZu4EfLEpf5ZA+fG+uVjZCNZEeH1TM+8vgX0E3xjLm/QKLzu
	RCZ06Htgp8j6Z2+WUTG0SOxNsgaRQhUiWfziV16mk8zhO2na2AMP/2nRmwS0Ux1dyXtBlWoAA0nEh
	B3MqOuszAl+NIoWQdbCihkBBPbTbH54pCG8S0YANvw41TrzQ3O9vIzf/B9uxxd39JtsqHOqzXi54g
	u8h5NbYSKKScM1zsXang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbGXJ-00000006nty-0kth;
	Thu, 01 Jan 2026 11:08:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbGXG-00000006nsx-0N2F;
	Thu, 01 Jan 2026 11:08:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 70A0160017;
	Thu,  1 Jan 2026 11:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6753C116B1;
	Thu,  1 Jan 2026 11:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265683;
	bh=gp6INFoQIq+43goOk9oT04JrR78Bq4E+oz5E4M6bfiQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GGV10kGkKqFcf14C5Upi5Cp3QL/wbrh4VI6T8Ueqa6PsJRMWmcOtw0fRl+PBA7lQl
	 BaboTeuIvtUjkRezkQ47SQ9aiR4YAahqom6C10TrcKt+X814EW5/XXRwXgd04ieomC
	 CQcATpRqCutGzxFZHRjYe7ajSsHAXZn6A+om9sG0wk9KwIZHHwCUC8xHELH8LMbVIU
	 fnWO1q+vhQ/Qs7vWBarnf/y0K2C0FzeQ9BU2vBNQxAfz+asfP43imMamyOAwKFSyju
	 YoorE+vOfapEuKDhn+ewxYbHpTr/8udBzhnrxj+1prGOhpe+SaUNTmwK69OqamWE60
	 YStqjnX/KzbKQ==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, Alex Elder <elder@riscstar.com>
Cc: dlan@gentoo.org, pjw@kernel.org, palmer@dabbelt.com, 
 aou@eecs.berkeley.edu, alex@ghiti.fr, guodong@riscstar.com, 
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20251226173228.2020411-1-elder@riscstar.com>
References: <20251226173228.2020411-1-elder@riscstar.com>
Subject: Re: [PATCH] phy: Kconfig: spacemit: add COMMON_CLK dependency
Message-Id: <176726567931.201416.8144273654305302884.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:37:59 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
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


On Fri, 26 Dec 2025 11:32:27 -0600, Alex Elder wrote:
> The SpacemiT PCIe PHY driver depends on the common clock framework.
> Not specifying that led to a failure when doing a COMPILE_TEST build
> for the SPARC architecture.
> 
> 

Applied, thanks!

[1/1] phy: Kconfig: spacemit: add COMMON_CLK dependency
      commit: 8df20813eb01fe29b4507fd470d73675bda3e1dd

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
