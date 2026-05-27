Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA82FCD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 19:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpFh41I2pZEN8VOFd6wEhyc9WAvydJhbPvCPi7Nb+0E=; b=gBvYj+6eSckYW7
	38wcZ2n7l/53dFmyG8gTw6VnS7DaEEpj+EEAQmIulDQD7+av/4gmmsEI1/PkZ+/hJ50Dx3jPsLjWO
	vP2gjkU3MceLcSCpmEukIcDLPospxq/jZURyis+dYZIcCCmvPT26bRybYpiyqH+jqaLzqjMHyEWP8
	k7DWdJRE8mLtIlkF+ApZROp/S/+FpJYg8pXWAKnNO4ESDXdctIN8NR0VkeuyAi70OFUzGlEge7xdm
	Uq4tP596XGaJ3QtwI4rV7P8+YbHdUVoMSYG8+XIlrVUePj4Zvzg3rviBFJmNWUKzwrNI1uVMAqdOV
	vh2XqRqnvL9Du9ZEyK2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKG1-00000004ghq-1VQm;
	Wed, 27 May 2026 19:49:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKFx-00000004gga-0gxi
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 19:49:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 33B1C605A8;
	Wed, 27 May 2026 19:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862E71F00A3F;
	Wed, 27 May 2026 19:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779911371;
	bh=IyUXOtPTdnILWDQ0KsasBy0n/Mbz1RcN48awrgwnmE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jsZOUKHi3pBiMJCvGjRBoIkiuDPq7dfJCJvcWDGbDiMG53jN31HKGWUyEoN4NpRCk
	 hVW1NBv6KieMX+G8mvTub7OI/UHTaSJq4uqHsRg9SEbHkr5bS3fbS4HBodEKd6C7t+
	 wVySl9kb9kyoPJAWssR1Qt6lc20inB+VR2crZ+68UJcCaNoz2BRAhPixT6LFgsuJy0
	 B6PMQm3+W3PJv8XAZ1uKpmw2WVcndnZzYTY96UAYkVhI/CGlddXCP60tTrBBo0FUeo
	 I17fZWbTbheFD5NOGfClQB2TQK5VhL+YJp6U+K3i33xf5aakGJzFMKf4X5StIGdHwN
	 SOjCVnJKNY+QQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: Sasha Levin <sashal@kernel.org>,
	pulehui@huawei.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	bjorn@rivosinc.com,
	linux-riscv@lists.infradead.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Gyokhan Kochmarla <gyokhan@amazon.de>
Subject: Re: [PATCH 6.12] riscv: fgraph: Fix stack layout to match __arch_ftrace_regs argument of ftrace_return_to_handler
Date: Wed, 27 May 2026 15:49:06 -0400
Message-ID: <20260527-agent5-item014-riscv-stack@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526192517.82022-1-gyokhan@amazon.de>
References: <20260526192517.82022-1-gyokhan@amazon.de>
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

> commit 67a5ba8f742f247bc83e46dd2313c142b1383276 upstream.

Queued for 6.12.y together with the HAVE_FUNCTION_GRAPH_TRACER /
HAVE_DYNAMIC_FTRACE_WITH_ARGS prerequisite (e8eb8e1bdae9), thanks.

--
Thanks,
Sasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
