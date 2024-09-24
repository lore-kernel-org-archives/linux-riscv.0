Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96429CF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 06:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=seULmLjixoXnBI0o4BxUwLt74WlE/eC1Dh7DMBh/t4o=; b=31K2naEqSkoNTD
	hzipKWiVw22p1qUOODKIWGGW9laiPqK8UqOX6M58r3yX08v097f/IhIWI3C+D7o2Y0n+AINiRaPSM
	Ebvc4/OFC3kIRTKKNAeUArPbFmsTQWCjwZDIEngd6ER19dJa0OBKi0l8VdiaBfLotfO2DvZ5kQxiT
	uyFwfbD86EQpVFmwpD8TEQjUwngkVzNAkGtRb3+Vk7MfCHso05e4WoWpB7TZpeZ3kVHCN2ayLEYp6
	5wbrl1HOEVzsay3Et42d+iJL1JG0RVoIZZX6acA/Z593kxQoiArN76pi46QiMIjH8pj0MbatHGIK3
	sMWrMuOWaK5waF88ROZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sszF0-00000001IC5-2aR7;
	Tue, 24 Sep 2024 06:41:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sszDp-00000001HoE-1eND;
	Tue, 24 Sep 2024 06:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7DF80A43268;
	Tue, 24 Sep 2024 06:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29435C4CEC4;
	Tue, 24 Sep 2024 06:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727160028;
	bh=bV09n5RIN0Vhxw7HFNVW3Pyh6JzncIhtJpLcc191YP8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d6C89Qegnxut93Sj+lkJmOGzOdLZde3Bl9xuUdvRRaz6L8QGOdO4vTrAQQjSeUB8l
	 SXm305645vt2zHuxBnbfCe1t9V2Jzkl8CoZkvErNzOrg0LH26jt4uOaKPSTl3pJjz8
	 vfYDUeZ/QKg/faIGTjaXIZ7cB9UpQt0jyqP4Rr9CA0uF51g+td/B7LkskIWT6N0fwa
	 ORyB5lNlMGEtyMX40j3s5qmy8VNNNHFwlR+qeyduRn4Vh8FMGLpHJhaJBfBIPPqUk0
	 IK2eGsLzF44ktiA9+G6c8Z3Cl/6PFzgMSGVO856v12wHYheycbWtuT4ryp1iHhQ5sZ
	 3V8kPnVCfRNOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE8143806655;
	Tue, 24 Sep 2024 06:40:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] ACPI: NUMA: initialize all values of acpi_early_node_map to
 NUMA_NO_NODE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172716003024.3899939.517065140587976451.git-patchwork-notify@kernel.org>
Date: Tue, 24 Sep 2024 06:40:30 +0000
References: <20240729035958.1957185-1-haibo1.xu@intel.com>
In-Reply-To: <20240729035958.1957185-1-haibo1.xu@intel.com>
To: Xu@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Haibo1 <haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_234029_525900_E4A35D04 
X-CRM114-Status: UNSURE (   7.45  )
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
Cc: aou@eecs.berkeley.edu, gshan@redhat.com, catalin.marinas@arm.com, Jonathan.Cameron@huawei.com, guohanjun@huawei.com, linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, palmer@dabbelt.com, paul.walmsley@sifive.com, james.morse@arm.com, linux-riscv@lists.infradead.org, will@kernel.org, xiaobo55x@gmail.com, linux-arm-kernel@lists.infradead.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 29 Jul 2024 11:59:55 +0800 you wrote:
> Currently, only acpi_early_node_map[0] was initialized to NUMA_NO_NODE.
> To ensure all the values were properly initialized, switch to initialize
> all of them to NUMA_NO_NODE.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> 
> [...]

Here is the summary with links:
  - ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
    https://git.kernel.org/riscv/c/732b177663e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
