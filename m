Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B2110854D2
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96fz6RULvYtiC+fZuUEv0svfZVbMfc7ZE8v0IiQ+ayU=; b=n6aSYsuY4GrIgr
	Zpv1oOplGqECbKGlxMuVv/1Enk/WtyBIiO42nVtidJwi3eLDq1mCmdJH2f0yxdEsbVHdNZpx3hPsA
	YF0jMXSzHNEtY8WKV3Bx5UFY84K7PQcF3JfPUOOCiMgyduKyDy8OXN0TeNBRjV78oNQVldSiOKPeL
	/oVWI8YqWc/vhR924pR9hTMkgHNcy+n8UXC1hMkCFJFOCnl/8G5Nf9DNV6e+nq1ZjV+g+vJ+/IDlu
	8spD0/wEV0fnKF7/3Cbg0dZw2hwayHqATva8x+jfyBHTFkPK0/n9P+0BZHlhLfk5WoJ94Bu7q7AOO
	298g8MxJswmXAvYEkosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3H6w-0000000BC78-0sOM;
	Thu, 19 Mar 2026 17:24:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3H6t-0000000BC6X-0nxw
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 17:24:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94B58444F5;
	Thu, 19 Mar 2026 17:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056A6C2BCAF;
	Thu, 19 Mar 2026 17:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773941078;
	bh=kBRINqrLYdRaj2OTEdauVdZSYU6PWMTWOVjA1hl4gb8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R5r8knBa5uix+BUJZ32fXdz4UxrwXjG1/IOoy+lDg1ROBRqtLSvPC5ACZyKJ66ny0
	 G/2rA3+d+BId4Em+A5hIh54RuH9SJfLwBzsqSFDRoa6hDzJTgleTmdXrxh0FYq3mqj
	 bqwd6nJ7qR6G2ZKtHs3pO47snz/Fm8dHEwd5UZcaZLJNU9b/flBfw+7vpvhuJbN1NB
	 Kmfg7lMJPyEP28OSbR26yckvQUJvLqZke38CjCOOyVt48ivSf52/J4M/EG6IHa/cbM
	 8+aYK5BUVDFvwkTd9DXextHTEbOdvEQMAsbzluZzvd2CgZsduZrVl5+JjFPl5IU1oJ
	 MB8YO1qcxjMxw==
From: Namhyung Kim <namhyung@kernel.org>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
 irogers@google.com, pjw@kernel.org, alex@ghiti.fr, guoren@kernel.org, 
 cp0613@linux.alibaba.com
Cc: linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260317034847.4136-1-cp0613@linux.alibaba.com>
References: <20260317034847.4136-1-cp0613@linux.alibaba.com>
Subject: Re: [PATCH] perf symbol: Add RISCV case in get_plt_sizes
Message-Id: <177394107796.14914.5183103180695281404.b4-ty@b4>
Date: Thu, 19 Mar 2026 10:24:37 -0700
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-02735
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_102439_261792_B11DCBD1 
X-CRM114-Status: UNSURE (   6.15  )
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

On Tue, 17 Mar 2026 11:48:47 +0800, cp0613@linux.alibaba.com wrote:

> According to RISC-V psABI specification, the PLT (Program Linkage Table)
> has the following layout:
> - The first PLT entry occupies two 16-byte entries (32 bytes total)
> - Subsequent PLT entries take up 16 bytes each
> 
> This aligns with the binutils-gdb implementation which defines the same
> PLT sizes for RISC-V architecture.
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
