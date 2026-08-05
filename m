Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5A6C56201
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 10:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lho4QtFquy9mEpGNvWL4vRL5nPAV3PhWZcCbuhviYEY=; b=KDIav/0DcS5zu3
	1r69LkBseeiWReJ2I/72lACnp6FsslkeTCFEFq3ktP5c5QfgXhgafXZboNlAMOFKsstRyjQGaG6E8
	tm9LaP0GnTgXJvhxpy74oKfXwNOnHuD32slOKIpBZp/ZxZ/nN8D9gnr+1NA7xjD+6k6PKxTuuSn9m
	NwHtqA2aQLQm870YRlKe3+252vzPd+tj5UvawKEBDAXFxeqvLYYim/cBZtWEE8alsrkuKPCPtOhFN
	1hgQabVGgdbR6qGcRF+Pm/k3oYbId4aeB8APL0ST0air0nwtzh4oWU8vQFFSeXyrRtB5dX/hWlonp
	HlDGjfcoh7a24ygwwQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZ4f-00000003lbQ-3jDl;
	Wed, 05 Aug 2026 10:42:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZ4d-00000003laZ-0FF2
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 10:42:12 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785926526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B5xV213indVxXmOPJoQ63c0A+lAnBq4XP2X3L7PFiiA=;
	b=tB7HdAniHf0OJo2KFJSs3RUG7hO/ua5Z5/rORNQ8TYKCCZKxQRCifvrD4uKfD7RJJp2145
	Mf9Uvf6DU+lqKRU4I4ThDaoOZGqexaWdcdcmIv5K1WM/CdqeNTpZNT+xUcNabCJjm3HNQG
	x09OvUkp/ZOHlI42V8cTkESuKSLJttT16KR2dKC7WcebHMblbcJmrRyVybkcD7cn9XV/Vw
	g1MhNgwMdL8xqPrw20UR6/tHnIJaJQhrHTutIG7fXGfPVDWHrCY96ptwhS13FmH69Omzil
	Q6mq35I3x0HrsH0QDqo4JHU63eQMRsolsyaUZzoeK4OPiGVxraC2IghePcuooQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785926526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B5xV213indVxXmOPJoQ63c0A+lAnBq4XP2X3L7PFiiA=;
	b=qVJB7kjf8mf0uTpmwkkEUHswfpEolO5dWemNrRirsjj033znqfPTrm2lzcif2Svrd1ztMM
	XLwaleppXyDm8TBA==
To: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: further remove XIP
In-Reply-To: <20260805010049.13918-1-jszhang@kernel.org>
References: <20260805010049.13918-1-jszhang@kernel.org>
Date: Wed, 05 Aug 2026 12:42:04 +0200
Message-ID: <87qzkchmrn.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_034211_266474_23CF80DA 
X-CRM114-Status: UNSURE (   4.62  )
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

Jisheng Zhang <jszhang@kernel.org> writes:
> After commit 9b3a2be84803 ("riscv: Remove support for XIP kernel"),
> something relatd with XIP are still there. Remove them to clean up the
> code.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
