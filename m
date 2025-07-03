Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00C6C83030
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBv5nVEhNYRgM6jZLurfkYxX5py3/v3yNiSPP8XCNvQ=; b=clUwgVRbtSpooQ
	zt6cfXZyC6vGYRvcJcQsGrUF6lS+Nk6vFj6W848ROOJ7MDs0itqXVrx0VuxqgD5L1XA+qH2tfexmF
	SKkbBc8/1+J645dfQq2jSGfAXmlUVIzvOVCwYxnPRVv+CAXgfZhVF0zkuTKEPUalIPz920oydRoMM
	ndU0CiHCydWUt+uLslPcFdu/2YjM6Ub2G5fHL/InU+ka57ilLEjiRubwS2TQQupkk3R6YfnVBIMT3
	NGNAdCF4PoGWbAW7qCXCTql7/b7bO4L5SVraAtHaxpsYNeuhWs4Y/iIyTM7efnpJXfx8jiz5vB4yJ
	/6n/eBglj3giRs/u1RAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzr-0000000CTgd-34fI;
	Thu, 03 Jul 2025 20:57:31 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXM2x-0000000BrWM-3786
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 15:40:25 +0000
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 9E45D57D51;
	Thu,  3 Jul 2025 15:40:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id 8F64F80018;
	Thu,  3 Jul 2025 15:40:19 +0000 (UTC)
Date: Thu, 3 Jul 2025 11:40:18 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: ChenMiao <chenmiao.ku@gmail.com>, Linux RISCV
 <linux-riscv@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE
 selection
Message-ID: <20250703114018.6fab0b8a@batman.local.home>
In-Reply-To: <f7e12c6d-892e-4ca3-9ef0-fbb524d04a48@ghiti.fr>
References: <20250703084502.394406-1-chenmiao.ku@gmail.com>
	<f7e12c6d-892e-4ca3-9ef0-fbb524d04a48@ghiti.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Rspamd-Queue-Id: 8F64F80018
X-Stat-Signature: 337nu41neghadpzgkp4py9ztx3ptutkm
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19TlT3ADYdjeXFGToxE/uqypYY2UNZ/4xU=
X-HE-Tag: 1751557219-393174
X-HE-Meta: U2FsdGVkX19LOQBeYMzHh19K/rBYoZ8kOEYb9FvJMLi9jVWvGqrEMxTIAYppmJ3t3iBm2jaWZ6V6T68FZqpWQzsNucu4+o66ObjslxXg6BvhJ3R7U2HiYByJZ1rT4SEFdCBHTJt858HWv3oGzlnSNDa6g0aLScjCGxIb6xiehBMMtbn0BnH0QfkrWcsf6L434WR4nqrio7JJeCR69UM9B+Laz1wS563qWdQvkmHjQDtwPLoaJmDEglAi3BZ4EXvlODwX2y94jzOqpS8EZ4u1a19PjoFowBvvbLsLsuG2fvSYQhiDc+kqbabxL2gV3V/A0rGRrJ/BVvJ70HlM5R1mtmAKpVbyKA7n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_084023_846833_C567C625 
X-CRM114-Status: GOOD (  12.88  )
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

On Thu, 3 Jul 2025 15:00:02 +0200
Alexandre Ghiti <alex@ghiti.fr> wrote:


> 
> We could support static ftrace, but I don't think we should, so I agree 
> with this patch. In fact I had just prepared a patch for this here 
> https://github.com/linux-riscv/linux/pull/556/commits/0481092a5bec3818658981c11f629e06e66382b3 
> which is a bit more complete since I have removed some dead code.
> 
> Let's see what other people think about supporting static ftrace, I have 
> added Steven in cc if he has an opinion.

Yes, please only support the dynamic ftrace. The static is there only
to help archs to get ftrace up and running. Once dynamic is supported,
static should not be used.

Hmm, maybe I should just remove the prompt for DYNAMIC_FTRACE.

That is, once it is supported by an architecture, it should be the only
thing used.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
