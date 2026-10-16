Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47092CC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OO4YilFSDRLybgk4D8Wk3cjfbKbZ75WwT3PR0nhTQl4=; b=bvlg3ufeFQArGi
	FzgLNierwRdk9BCG+c/OaDbcblnsrD/BqE+Czio83k3A9ChK10s+4KrI22c07nFpds3HMSEhlOG/a
	PrKiBGzyA+kgEKLsGHXWu3l5dEh1AjvILZJv/bOzG3Rm+r10J3xZFr79sGJ8uMNdaJLZkgXzn4zST
	Eiiws7rzn9aOn8WXIGN8SiUs1Wq5KH8ZZ+E6b0p43pYdlOt0cO6WOK3GYGWSnN79Dom84h8ZDi4ze
	ZE35moR/1+0z2IdULWYK267/VXLGoQPdgGz8vwfBeakwMD6TdNxTm4Wk3nh3HsIb81kDuZ4InTrHx
	0CwEaT3WwCSEE/WxWJhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfs1-00000002kSG-3d53;
	Fri, 16 Oct 2026 11:13:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfrz-00000002kRe-35sI
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 11:13:04 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792149181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HHG+0/yj3iP9JfQVLUnzgEeG6dwnne3b146512CEYVI=;
	b=n1K2wlIeX/mTsk1KMCzMLek9VbOb+WhHhYc81YUV1iVpdkMeK6tlBfVjCMiRZnD4mDXVHo
	Dp7ZNj3HUpZOCYDbT7umX7o7Hl/i85p7w1EMHWfGMQDmQ9Y8AYf4pXx45Yx0trs0xfrLF/
	JKMTmZVjXEjcGDkv4sJrtJxI+wUGVCLpfRzTEVZFl91EBOqLmeVAEgnn+3/P0AtOy6ChRl
	esQ1lO/18t9ZT4SffarGVD5REGrlVaEuJ9nNKZATVz7YCgdPJZ4FjI88RTlrBAcyf9S2ay
	Cca1p039+KDu0MCCK0h1epyDZ46bf9iAu1vIKM1gXiHiEfDfDtdRPRVlOvHruw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792149181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HHG+0/yj3iP9JfQVLUnzgEeG6dwnne3b146512CEYVI=;
	b=ldh9AyNvW01veKSFioMg0RDULspzU14EISXpQZjFlKUKrSEjwyb3RSm2BAj0UI7Nn6lAv1
	oJL+BeEsi0cdisDw==
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: Re: [PATCH v3 2/2] riscv: kprobes: add nop and c.nop to the KUnit test
In-Reply-To: <20260902080817.681-3-yuanxiaofeng@eswincomputing.com>
References: <20260902080817.681-1-yuanxiaofeng@eswincomputing.com>
 <20260902080817.681-3-yuanxiaofeng@eswincomputing.com>
Date: Fri, 16 Oct 2026 13:13:00 +0200
Message-ID: <87jynh526b.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_041303_921082_BF1B0930 
X-CRM114-Status: UNSURE (   3.28  )
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

Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com> writes:
> Extend the RISC-V kprobes KUnit test with test_kprobes_nop and
> test_kprobes_c_nop, covering both the 32-bit nop and the
> compressed c.nop simulation paths.
>
> Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>

Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
