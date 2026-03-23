Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D539FC72C5
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 23:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUPMJrrM/viIF6gSYPFQg/t4LICFC2Fac/8hcVbX9Dg=; b=JM8+8ZeD4KNgY8
	4bxD/66ThURQNAl+o8gXLONZCvDjQZPtuYcUIIu+goa3eUUbRDV/Hqse6WwG/IQYtPaxlvDOQ1056
	KQjyXOXdR6WUnz1sK+6NuFEkAG9JZqAJGo4PGmxKSV+zoOmkTgGioaqncR9jBuvlX7N+c4d5+FV4A
	ammPjztUkdCv10sOLFYsqy5tO3Su6wF3u09lfDKWKf0VzxvA4k6QgUa/J+wKT1bn7AoVyCUjORfEU
	XkKi7Rz8QM0TWinJNbF1iFrgp8NaeqY9/du4yG1vLBlfBKsE05rUYWUXgDPS7Em89jUOqlhNMuA0o
	+YIgkKBxhDlh4EBleYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4p1V-00000000AO2-2N2U;
	Mon, 23 Mar 2026 23:49:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4p1S-00000000ANM-1Jhx
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 23:49:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A45FC44059;
	Mon, 23 Mar 2026 23:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075C0C4CEF7;
	Mon, 23 Mar 2026 23:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774309765;
	bh=cOxCLGVRvhQrlOSO5h826FHbLzBO08KBzTGlqMnmD2g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Nmy7bQjkc3jAck4E4jfqnopZwuZ8wQTueMHw+lXcBBA/u7+9WyUhUMUgzy7pbnXSl
	 0z81v7t2agR2nn1OkdWRxfLztvcXoOUmrIwfdemxg3KTjdmvYfPSYyHh0pPAwqxTbo
	 rD2uSSXxCNcpU6QVWjnanaTM8wjRdWc9ZvQia4WTM1Vz+9msFMjn/fS6bESZXmL8dw
	 TQ0ZRPrETYwj4pBbu0EzlE65GDqQlVy0ZLoSiOdrSq1Cpa6o1hNhIDtroBxZw6QkeW
	 O39Itp32ZvdTkHE7I29tYrzcwXzFaYL2exgbUxdAGjxUX5D/dUpYR/PctNBRjk9ayR
	 g/4gFpzf1f3hA==
Date: Mon, 23 Mar 2026 17:49:24 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, danil.skrebenkov@cloudbear.ru, 
    ajones@ventanamicro.com
Subject: Re: [PATCH 2/2] riscv: remove redundant #ifdef check in
 cpu-hotplug
In-Reply-To: <20260304033403.238012-2-hui.wang@canonical.com>
Message-ID: <a31283b0-43ba-7102-a62b-e2b0a6558a2f@kernel.org>
References: <20260304033403.238012-1-hui.wang@canonical.com> <20260304033403.238012-2-hui.wang@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_164926_376835_88D020D3 
X-CRM114-Status: UNSURE (   6.77  )
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

On Wed, 4 Mar 2026, Hui Wang wrote:

> The cpu-hotplug.c only is built when CONFIG_HOTPLUG_CPU is defined,
> it is not needed to check HOTPLUG_CPU in this file.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Thanks, queued for v7.0-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
