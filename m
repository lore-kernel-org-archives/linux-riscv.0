Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048FBCD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 19:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1fgo1cB8vdNLUG2+yq00J95gvR4X6927KnLxcDdMVo=; b=SlydoD4jDidhnf
	5Hje9WrQabwSMlsYgw1yHq9S7LfxgctGw5sZWmYrY0Z21pxgnI+VjfPmoGpauDxJOXFJH3zFuyxDj
	s16lqmHNnsi5vINZRmOCE1d4TpsTKjrScvHmSWWzTbsRp9HpL2E5m/5vJo4TsV9x2cbiilgitwOZ5
	r6+jinftUtqNdnipHBLAw6sGIz6PfGgOBx2w/6vl07U2SD/Ozc1e3acFhq61evM/SUV79TauHoSbu
	YJHAMixC9vhaveWsmiAxv5JWDp3iKbgpdMJlv4owXu+Rc4gz+qhLhyP8NS8aVZdXEcbJaJroLK7CX
	G+KSfKvl29+W05y3KJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKG1-00000004ghm-19Xi;
	Wed, 27 May 2026 19:49:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKFy-00000004ggf-1epM
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 19:49:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D2AC7605A0;
	Wed, 27 May 2026 19:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB771F000E9;
	Wed, 27 May 2026 19:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779911373;
	bh=pu7xqlq2OaICPvGzPV5z7jHq+aFQ9JV6gbbIjqn2Q4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JaZO8ylC/5fvCdxaq7M7KTHvJeO8cMHqdjZM5ejBN11jH68kvmtn3I24WnNf8lBIW
	 z99ZtUjigIhQfT4bAxbrIu20fKv0oHAg2zdivxAHwvahxr1KdFPU+W2rmZVq3aj/D3
	 KwbSTVpC952x+UNfADfc7TlKXtsAlRhrgF6jwbHgP1rnllKg6yizJXaWO2vu2Xv5oA
	 LLv6KxLe0lXmPkTisccycJ9YPsh3kZOnWcDYOyUVz0631Kh83+YqLF3ArxiYxmFlYz
	 87jTyYhlNVi1DfVloB3JRSEBrS/S45fXxSJz7xyAsRYkLoh/GwTRJqhvHy5Eq8eAnK
	 5P4+kUEGPoSCw==
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
	kernel test robot <lkp@intel.com>,
	Gyokhan Kochmarla <gyokhan@amazon.de>
Subject: Re: [PATCH 6.12] riscv: fgraph: Select HAVE_FUNCTION_GRAPH_TRACER depends on HAVE_DYNAMIC_FTRACE_WITH_ARGS
Date: Wed, 27 May 2026 15:49:07 -0400
Message-ID: <20260527-agent5-item015-riscv-kconfig@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526192636.83171-1-gyokhan@amazon.de>
References: <20260526192636.83171-1-gyokhan@amazon.de>
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

> commit e8eb8e1bdae94b9e003f5909519fd311d0936890 upstream.

Queued for 6.12.y, thanks.

--
Thanks,
Sasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
