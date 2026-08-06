Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324F7C55ABA
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 02:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBGMkV9DCTP4U47tNF3D91oAiELniHBhQvRfGMmGw8A=; b=zuaf1PHDWkU5tU
	5C6+T4OcnUyO4uGjWVElOwj++xs560yEHBw5ilo5XBgbm6XS1GxCMeYKbrfoRit3APhTT3WGR7mGC
	XI4d0/6sGQNVBTmQWMEmL95hkQBCSeZ/3TjM8BXAkogmCD4hcpOvZ8EM6rDzdSlSsOx8LG8ApPsL2
	evhPeHjXr7ROJLU0htXNaPdy8Yl8pu3e3DoPLspuUeAUp4gD4H39cM5sbLNbo3iaTwWYF+guwUbWb
	Kpl/9vXvCsSfGyO3ZdHsRnAmsJzV5Z7w/4YbsQMInIixQiAcWOH77CdZZ0F5EBBQIUrXxgYE+FcZp
	H+B4jPdnpfQ4fqSdQkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro6E-00000004pen-2OAm;
	Thu, 06 Aug 2026 02:44:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro6D-00000004peT-1PZ6
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 02:44:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F9E640826;
	Thu,  6 Aug 2026 02:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6671C1F000E9;
	Thu,  6 Aug 2026 02:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785984288;
	bh=CiA7EOsZf1u31c7ZK2OS7J7IWSJm/ecqwp0+2UUVfkM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=XqiB5cciERKd1+gcdfpX74rbCDBckILJJE9lwPZPccRKQgjift/VpL1v0JTXaGGzu
	 6KAM29U4nZ7sjk7OrvdBVIlxikf/Wabx12MbVUWNxvEXZBduyl98FTw4aGEew376kf
	 JV6qfQ0Gdf5jmBqw6OyUfoDj8BmjP7Mb2C5E1Ucprv8XsMG6hfq0zp9GOqmLgY+Qwq
	 Dlhkkc/+ByT4ikQtiBKDFS4XQwWzHM9r5ASJJIGAHFpcMZo89bbQP+WmKmdbCfl+Ch
	 89Ynv1386dJqJPTrM+y5+RMX7Mbbg1f1vwYjAF9JpyADCvNaLfY5oyGFIsvtasN2OW
	 5fzeDubkwkeUw==
Date: Wed, 5 Aug 2026 20:44:46 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Peixin Xie <peixin.xie@linux.spacemit.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Yixun Lan <dlan@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
    Oza Pawandeep <quic_poza@quicinc.com>, Will Deacon <will@kernel.org>, 
    "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
    linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
    stable@vger.kernel.org, Sunil V L <sunilvl@oss.qualcomm.com>, 
    Huisong Li <lihuisong@huawei.com>
Subject: Re: [PATCH v3] riscv: acpi: Handle LPI architectural context loss
 flags
In-Reply-To: <20260803-riscv-acpi-lpi-timer-v3-1-520fa13732f5@linux.spacemit.com>
Message-ID: <e9ccdf60-481a-39a3-f0fa-428f47d838b9@kernel.org>
References: <20260803-riscv-acpi-lpi-timer-v3-1-520fa13732f5@linux.spacemit.com>
MIME-Version: 1.0
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

On Mon, 3 Aug 2026, Peixin Xie wrote:

> Commit 4785aa802853 ("cpuidle, ACPI: Evaluate LPI arch_flags for
> broadcast timer") replaced the generic nonzero check for LPI
> architectural context loss flags with arch_get_idle_state_flags().
> RISC-V does not implement the helper, so it falls back to the stub
> that returns 0. Consequently, CPUIDLE_FLAG_TIMER_STOP is not set when
> an LPI state loses the hart timer context, preventing cpuidle from
> using a broadcast timer for that state.
> 
> Implement the RISC-V helper and map the hart timer context loss flag
> to CPUIDLE_FLAG_TIMER_STOP.
> 
> Fixes: 4785aa802853 ("cpuidle, ACPI: Evaluate LPI arch_flags for broadcast timer")
> Cc: stable@vger.kernel.org
> Acked-by: Sudeep Holla <sudeep.holla@kernel.org>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
> Reviewed-by: Huisong Li <lihuisong@huawei.com>
> Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>

Thanks, queued for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
