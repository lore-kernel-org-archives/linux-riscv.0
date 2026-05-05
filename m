Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FBBCD3427
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 19:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3Sto9ByuD/+nhqgkJFu7Wuthf6lOCJmVRePoRTSTWg=; b=gnBx1cESLqeheH
	i14Dh8D4DxV7GiXqKB761l5GTQOX7co+va2Q5XSqsBPkWpuJ/JMYFThtCo6DUOVjQTZLaHYYwWfKh
	6vY/8KmiJNKbkqurfoeV5ASVzAdXeDNsTvrYSsSbBb8VpMSjUIq5JX0joeY3s/Ms16yi3iVBedXGV
	tUmOIarWT/H833W2mV/J0pUfgTJmJDq48LRsGg+00LKARxzxB6sy7AU2JxePNiAiJyZ2xA2zGc4f9
	9T+qI5DwobnP4sqcEJtsdzd7ps07jGG8KksIfVjBwUSudpBOCJVO2lZzt5fsPIX89SamoDHRRKmG4
	RfspHtUsRxVbN861ZUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLiw-0000000HKpv-2WNG;
	Tue, 05 May 2026 19:46:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLiv-0000000HKpC-0Abd
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 19:46:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69E4361141;
	Tue,  5 May 2026 19:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E6FC2BCB4;
	Tue,  5 May 2026 19:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778010388;
	bh=jO1FzHZrNlKwD5ZAD+Uph7zwR6Brh+x7VS0clKFtqms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B50iZQVcEj6X8w9MCAw8SfbHfNaYqHXkQz4XGt8tElNTDIcg6PSWvzHvSOv+19ZnO
	 yhd4KQT/xuGRGdzHt8T54v8zL4M1CT1BfiZ8fJCbVetJlWM9LU/Miwh6RtxdvSjwH6
	 8OWaLAnfZ37kC758L9NPiTDzuRYShecKhEmD1h1eD9AY8Zhemd9xpB2etn0xuv8X4A
	 Sk+TcxOJ2ZQ1me0mTlQgApeZxYmoUxKWOrX4kfCBpTpnNEy645wAnTu1V3wN3NrVrR
	 gUZA1RWCpDWkRf8mhhGUGuhPmLi4gPm4fFldKmUKL728nqMBHGyz4tDMVU2MJxWhqV
	 o0taOGjyXWRig==
From: Thomas Gleixner <tglx@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, Anup Patel
 <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: sync-up state before CPU offline
In-Reply-To: <87bjety72c.ffs@tglx>
References: <20260503-imsic-v1-1-aa8330bd1c34@sifive.com> <87bjety72c.ffs@tglx>
Date: Tue, 05 May 2026 21:46:24 +0200
Message-ID: <878q9xy6zz.ffs@tglx>
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

On Tue, May 05 2026 at 21:44, Thomas Gleixner wrote:
> On Sun, May 03 2026 at 23:05, Yong-Xuan Wang wrote:
>> The "move_prev" pointer in struct imsic_vector on the new CPU is
>> cleared only after the old CPU has cleared "move_next". But when
>> migrating all the interrupts out from an offling CPU, since the CPU
>> is already marked as "offlined", the IMSIC driver skip to sync-up the
>> interrupt vector in __imsic_remote_sync(). The "move_pre" pointer of
>> these interrupts can only be cleared after the old CPU backs to online.
>> Therefore the affinity of an interrupt that are orignally target an
>> offlined CPU can't be changed.
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog
>
>> This patch force to clear the "move_pre" pointers before the CPU goes
>> offline.
>
> # git grep 'This patch' Documentation/process/

This change log also lacks a 'Fixes:' tag


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
