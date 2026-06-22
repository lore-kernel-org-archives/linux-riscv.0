Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56168CDB46F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 18:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3JyoWDi7skKY8K6efFgYkZydf6yOMIeO4we2dap2/8=; b=hZwVTfZ7/oVPOf
	6JP1sluwmA1E0FOZgTgriNM+ZT5jkYaiPSy41JT2bn4207jXD6r3Q8sLL20MId3VoJlVlnyW5/xba
	Sq7PHFfg3VJyr45TWnlpCfNmaR4RPHi9/8zrY6vmA6Og03JgJJeQkbzHpHbQYOxmzfjJCXJOpqQ41
	gnHHp/mRjdwH6nn9Zhw17YQGIPXRD373sYHtT1lsuJPfSeR3CqB3FVwlgeAa2ILcIYE7yLYP75Nu6
	tzFJrlpt9bngXRa9/hjeD9Tt/1beQt0aggDTh150rBkAg3Xwx10HA4AxSX1muPgk6zKChK3/bXJUp
	FJjIpS5yNBJ462NmCLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjHQ-00000005IF8-4AQ9;
	Mon, 22 Jun 2026 18:21:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjHO-00000005IEo-21c7
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 18:21:56 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782152512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=stuQTfb73FufXMCRBmqvR7Yhr2IPfoOpetylBXI/zuk=;
	b=dWiRIyxwI8KR7dJ9MZcqv+CZqAr/iVzY6YcXWP2EgGHCfZlVhDgkjkSid2olVVGv0TykzI
	UjO4kPcT9X/IkPqhjDpaxNaO0m3Bg6I7F8mI7KnYdUL6F65vX5LB0Zymo4xjqxqlHrm271
	HjxqnL00QR6q1cwjtwS5I43D9mK/S5fAVOaDFr8ENyTy8r8vtwmz7OZmRAxJaxkgHAFM1J
	hAPpFyY1GntrYV2ztmQ3W9FC5vljqRGeKL6KL1kO9/jGf77/3GNrHr8k7iLloNILDPIAXh
	+mfl3i+cu1dcIu/7UbSzjYWWnDlSUMcDcJBZZF8hxCP6DD52CGyt5O0yjjOkwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782152512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=stuQTfb73FufXMCRBmqvR7Yhr2IPfoOpetylBXI/zuk=;
	b=UaoS57VdjEK09E69P9jtbnj8rorCMBaPaS0lpWwBWSeFNV4E+wnqQ/uAAJj5ULc57hK+gn
	Wavmlr4hUIypabCQ==
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-raid@vger.kernel.org, Song
 Liu <song@kernel.org>, Yu Kuai <yukuai@fygo.io>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Ben Dooks
 <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] raid6: fix raid6_recov_rvv symbol undeclared warning
In-Reply-To: <20260622135535.481534-1-ben.dooks@codethink.co.uk>
References: <20260622135535.481534-1-ben.dooks@codethink.co.uk>
Date: Mon, 22 Jun 2026 20:21:51 +0200
Message-ID: <87echyv3k0.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_112154_695681_FED9D37C 
X-CRM114-Status: UNSURE (   5.19  )
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

Ben Dooks <ben.dooks@codethink.co.uk> writes:
> The riscv recov_rvv.c should have included pq_arch.h for
> the definition of raid6_recov_rvv. Add the include to
> fix the following sparse warning:
>
> lib/raid/raid6/riscv/recov_rvv.c:218:32: warning: symbol 'raid6_recov_rvv' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
