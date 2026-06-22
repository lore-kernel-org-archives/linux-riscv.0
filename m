Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03053CDB46F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 18:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LKrGV3XQUp3HKhWDJEPaiP4tz2Mbc+/SrH85zkml3Xs=; b=g7L5+8TZLHiSP7
	qLTiqkjH4GFSl7q25VW1reobFgOiorTQLMwQLxjp/rpBoskv6fmodpS7V+ksKzp3CkotbFU4HO7Gk
	IdPW5521jV0FQKNh7aP8kLwGolAHq3LGjcbxQVSapx1ILrmMBrH1f8orZYo0AXBNqgzfEQZGpvhQD
	yUXtLmKh1WLHyRRxAo1khTtOVBIuvCOutJvskC7QzrlTCCb+/jgV5Fqbd+sncLLPgM7sLVutF2X9w
	upFIjeuY8SXNxqzgVTeTii/3sEueQI3q/ZBka4lxTybKxOqknOj5m7dNjRpqgdLYRJGx+K8CoiwD9
	5okX/PrT+QLoGQMuZdhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjJR-00000005IMh-0qkW;
	Mon, 22 Jun 2026 18:24:01 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjJO-00000005IMJ-2kUi
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 18:23:59 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782152637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QS25aE7f7r24J60S69DFeF+9M8rlw/O9k82LqPNua+w=;
	b=BLhm88dCPvbGIbFcJUPY86yIK5/2RDwFIP5VZycxgNKGcY+3G+rKee4g8zms/VkCHYMtx+
	zPYbIezwLeE9/HwpMQg5sD0JcyZrCuE17xvVnAp6Y3pFmD3NSK1ZPRPGYQxDdST39xJXpl
	ALzm0MK1qu+5NY/7LNAD1DD6Yqm1Oxj1T9NOiinCJNcgSFmUD89Glv1J2lTs4qCFQrIpJD
	AJK22TRunIqJ3ze8ggov9rm0QysTF0gxuN38OrGllRU6Ac0riWWJZcJDENXQJ2BwRn11cy
	ugXp1OQBjnwX5zywpmfYzmZT2OrRSuKnRTDG24h/jJJmjRjN6GBHS7aZ6K0svA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782152637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QS25aE7f7r24J60S69DFeF+9M8rlw/O9k82LqPNua+w=;
	b=j4zdh1RyUH9wL1nTlY7Ptx8Qwb4ebMYMiETawSr8Z8a6EN2bNiM1Wm2fF7kNgS42dWyVl6
	dL1V61azElZu3hDA==
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-raid@vger.kernel.org, Song
 Liu <song@kernel.org>, Yu Kuai <yukuai@fygo.io>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Ben Dooks
 <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] raid6: fix riscv symbol undeclared warnigns
In-Reply-To: <20260622135207.480540-1-ben.dooks@codethink.co.uk>
References: <20260622135207.480540-1-ben.dooks@codethink.co.uk>
Date: Mon, 22 Jun 2026 20:23:56 +0200
Message-ID: <87bjd2v3gj.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_112358_856515_2F1B427F 
X-CRM114-Status: UNSURE (   4.99  )
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
> The riscv rvv.c file is missing the include of pq_arch.h
> which defines all the exported functions. Include this
> to remove the following sparse warnings:
>
> lib/raid/raid6/riscv/rvv.c:1225:1: warning: symbol 'raid6_rvvx1' was not declared. Should it be static?
> lib/raid/raid6/riscv/rvv.c:1226:1: warning: symbol 'raid6_rvvx2' was not declared. Should it be static?
> lib/raid/raid6/riscv/rvv.c:1227:1: warning: symbol 'raid6_rvvx4' was not declared. Should it be static?
> lib/raid/raid6/riscv/rvv.c:1228:1: warning: symbol 'raid6_rvvx8' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
