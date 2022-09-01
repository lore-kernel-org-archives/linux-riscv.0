Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3895ECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 21:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m87yKfemv+d1h510gFyWO0przAbT4WoVRy+Qaun7qtw=; b=ebklVAo0HbhoBI
	aGKrnTkCWQvX8x3g61dQEoBo5KWbFkQMIruSLIjSpa/iQna7W8uVlZsy3a1jm648u0ma0ChVtYUcD
	R+T4roOx+Cu9JR34VwEpAp8EyoHh5iAp/F86kL/2wyuaOTZ8el5XhZ9D/0HqBOx3wdJWaI18IPXXu
	BeaKwguYpdBGyv6LXe8oYjEryuT6rb6rcHlkzVv6uNbnP3Yv15PxI8ylA/Kw+HTv6xQD0KlW+NnmP
	x7bXCTpshjF2KArN+1WzNYo74QI1uy+jCzXno5glHjItwH9KCQh3biRY5tFsYdYvqP8IpvDvdytcB
	tMk1+4x881voz4xhaFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTrXn-00Es7r-3v; Thu, 01 Sep 2022 21:16:11 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTrXi-00Erz1-Ux
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 21:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:
	Date:Content-Transfer-Encoding:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=d+Mu9mVaXfnKerF1+U+ldfgBeEwCqEvTlqM8yAKfgvA=; b=bAVsA4yWtVS9hhfo+UyF4vQCFq
	Vj566X9UJa9+wtOhRWfuac2twWNlgNwNrGFbIVshYiF3ls5opfoujn8q2giYsC9DudQKycWFIugMC
	4gHG5y059YVxoC/ThUUjV8BCO0rQLQKfRPW6q5fmNJimGdYo/lnZIyxcjJHJcb9YFdvo9arV2nbBj
	Psa/TPBnBSi0O+AwpY1jOxHfo0W9s7uAGs4wNw6CQkO4o1zslWoUNGWMciPvrzSeD9i0CJFl4rQET
	KLtrB6YhQvOAuloLHm+Aq8wCfrNuYc0Qg6r1Yj4e8it/VBYMxT42OkgpKhJG8SXvVQBuk7JG6Zq3g
	HoYOD2hQ==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1oTrXY-004Ikf-5e; Thu, 01 Sep 2022 23:15:56 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1oTrXX-00GfW9-2a;
	Thu, 01 Sep 2022 23:15:55 +0200
Date: Thu, 1 Sep 2022 23:15:55 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>,
	Mathieu Malaterre <malat@debian.org>
Subject: rdcycle from userland with RISCV_PMU_SBI=y
Message-ID: <YxEhC/mDW1lFt36J@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/2.2.6 (2022-06-05)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_141608_057229_D96F65F6 
X-CRM114-Status: GOOD (  10.47  )
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

Hi all,

Mathieu Malaterre reported an issue in Debian with the highway package,
which uses the rdcycle pseudo instruction, and started to fail recently.

We tracked down an issue to the "perf platform driver based on SBI PMU
extension" recently added in Linux 5.18 [1]. On a board which runs an
SBI with the PMU extension, this causes the rdcycle pseudo instruction
to generate a SIGILL. This is because the driver explicitly set
CSR_SCOUNTEREN to 0x02, giving access from userland to rdtime but not
rdcycle.

I wonder if this change is intentional, and if there is a reason to
forbid using the rdcycle pseudo instruction from userland. If it is the
case, this should probably be changed so that the behaviour does not
differ from board to board depending on the available PMU extension.

Aurelien

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e9991434596f5373dfd75857b445eb92a9253c56
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/perf/riscv_pmu_sbi.c?id=2880e1a175b9f31798f9d9482ee49187f61b5539#n649

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
