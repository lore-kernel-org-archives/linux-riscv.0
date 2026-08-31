Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DBBC61DD3
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 03:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Cc:To:References:
	In-Reply-To:Mime-Version:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amc8SiKosELfHQ8GbZGOeDqPZ9VDJ/6DUbc4aDK2v84=; b=1PU77w50WJCMpr
	52lHnbYIBa3x6Mtjx5F5q2D4LoHtzUS7wQadKlBMHTKwGnBLCgCzqGO1uF2iuI2XUUih4mWrI1/mx
	daL4cujFAvzocpjOjlshRkUPnTspWuLjs9ItRiJsrXp5H4CXzsP8S2cEMtw7EJ6ClANKBb7YYBN0F
	vMizK0BsXqicqYbNkKE7b3klWxqS6xSp1zrnWuxg36ZeCYxdHYltlqKDNimyRZIc3Pn5Qt+3erCo/
	hD3nvMepgIBO4mRj10XL8ukHquwygnfpYPMFQySN5mvBFGRc1ULUnepsiLOc/Ud8OBuy6IYifI3AE
	TfE9XTbLOHhDAsZLyLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0t3T-00000008Qds-0Xme;
	Mon, 31 Aug 2026 03:51:31 +0000
Received: from va-1-114.ptr.blmpb.com ([209.127.230.114])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0t3P-00000008QdL-2jcr
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 03:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1788148279; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=D3NavzyV7KU3YGjx7vQPk6D5wG9vWP7Ie6nPRhzgPho=;
 b=jjA/nPJeifN9mW7KHr4BOWLZepw0nt8gzH57iQSoACDQCvdbtqEpAOssisISh911CtFw5b
 i1VqgCRbrNyBCGfNQhXOYIlcsWbQxcmarAkGEza+InPnT1kJ0YUC7568LxcTFZUIf2eNlb
 1LYqyI6h7QaYTBcYScJ0Y3XxTXgKur0XI6pcyqBjzZSj9c4lcG2BSEgyGUBQ7sWKiKez7h
 LwdPRuGX9yKMGCvzRXbdtgwDX1UBjK7Yv1+fdvxOOPNtG4ENVDyHX0zzw8bVznTprEPZT1
 HQBrama6/jw8wcdWpDtCb22Psn5TSnzJ2bUXii0kSmk40Xt1Rz6Ne/fWl2sOzw==
X-Mailer: git-send-email 2.20.1
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: Re: [PATCH] riscv: ftrace: reject out-of-range non-direct targets
Mime-Version: 1.0
In-Reply-To: <20260707121235.759104-1-qirui.001@bytedance.com>
References: <20260707121235.759104-1-qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a94fa35+375148+lists.infradead.org+qirui.001@bytedance.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>
Cc: "Rui Qi" <qirui.001@bytedance.com>, <mark.rutland@arm.com>, 
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<alex@ghiti.fr>, <linux-kernel@vger.kernel.org>, 
	<linux-trace-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Date: Mon, 31 Aug 2026 11:50:45 +0800
Message-Id: <20260901020000.1-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_205127_774463_8B872ADB 
X-CRM114-Status: UNSURE (   2.84  )
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

Hi Steven,

Gentle ping on this patch. It's been over a month since submission
and I'd appreciate your review when you have a chance.

The patch fixes ftrace_modify_call() on RISC-V to properly validate
old_addr/addr instead of always treating sites as FTRACE_ADDR, and
rejects out-of-range non-direct targets that can't be dispatched
through the existing ftrace_caller path.

Thanks,
Rui

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
