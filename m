Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC021C77B71
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vIerOI8pnT23KoGEDD9bWIXIqGpsqfvTrkJWbRrPgA=; b=P5NywDxSkELgUC
	Lx3kozVBnzwGPi0uA0qooQS8X2+D3N4LqZBgZpPJbQgV6Vnl3W2Pzwvb/8vgSCD2kv+8aciK+IOmO
	dpbnAEubSfGC5LJ4zs1d4LgSLmUyDsx/LA20Jo44996GM94QrrcbfhRLtquIUs1dM0nM/kiz8nEme
	3cKSx28nxVqOBJCgKtalGZXBRCF+xqMx7W9geEpdBl1tqycP+6yDx82pfLtWDAdqp8LHVtA+I5c9f
	fvyesXarYbTBaoixV8sdTJZIrZV0XwPNBR+zwtCMVssfhWDQq10gc78JkFRR9k4niZaKvtY7OPXZj
	YjXQrh/ZJEVpaE9HQWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prI33-0017dv-25;
	Tue, 25 Apr 2023 12:45:33 +0000
Received: from out162-62-57-87.mail.qq.com ([162.62.57.87])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prI30-0017cc-0Y
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 12:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682426719; bh=nwrv+FTl9Z30CBHNh9Viy2EMWijwUXnZBpXvdSxeKaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RlYHHPpry1tcRW++kuMdT3R33TyERVYAx+cE9x49Lz3+qGXG612izzAB8mnDiM7j2
	 cAh7Mu/md8q9wQNaMGrt+hzYOkyS9+ELfbFU1LVpyHMt7F+NyqmWFnTdjKWLGLVjuW
	 ACzyow2P6hvXkUeQXHMw5pJj105gkAPUZlit2MAI=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
	id B42AA6DE; Tue, 25 Apr 2023 20:45:02 +0800
X-QQ-mid: xmsmtpt1682426702tnajkdbja
Message-ID: <tencent_2451ED25C705DC8A18A290EEC6373E344107@qq.com>
X-QQ-XMAILINFO: Mdc3TkmnJyI/LAcuiDQ/3C4t3AsD+E24+X5IsV39QQuYR4YjVHEiY8aUzcQGdQ
	 y7rfI+QuFHWwsEWPiyv+EyT+dZngY5T13qR5k/LKIrqU73zYQktPhSob6bWE19isVJWzo/r6Krev
	 mGqImZ4CzGsfq1FfpAmhvgUQgD9fzvow9nmKogary9jrKTimTpHnMD4kTt9BoT+Q8j7EsyioOPlA
	 Riydp2siRxA8Ftsmdh90LjQQKPBrDN0eiuYp84Qyc5FQmKy8QxXcombCIDSy2Qv5+PgeC4J6MqlM
	 VD8kme2yovflI4EWr0b4LkR/mIoS1iWaL18+DMpDJjo3SPQVwpNjSE1/DLkXMKv8r9whXsaO3pxu
	 MMdUurhY0EwFkqkNJkAoXMmndLaZ1VjMf/OSQ1NkQg+eKxj3fYXcVtLK+16bRHyRabu4vl30IMBP
	 U9qq/t8s1QTlFOOMM0NAXaFsrEkdd2oTlnNwXDw8glOW6x+98NMOihYIOBsLllNMy55ZehW7ZMoT
	 +VgZ7DyGqtZB0g1VZPQeMXyNBhDqjHblo/sFtXa/JvL2n2EG04Se044WL06bjkZRZF/GZkS5caSG
	 /hawxG3vfZsOGeEvU47Nze9gWrGjtxcmPauP4MPa8II5ywp1Z3Me6aw1mLaKRcAsSVazmNYDKf7z
	 v4F+pDF9xuIf43iHim7mGgaxM07sQXoXg942u1SzZt6za1CFVO7feI7z5uHWdOwKMhk1M0U6AFJt
	 t5Gt11j4isDS4YMwk8PGmeI48GiGWVYisxraFcBHKKXV1+r5pM/uGZ6r42GFO6ykthkmCdVe4+ou
	 0872cZmhBwxI5mgJeBqO/Uv/Kef8P+X1Q03KUUEi2/uO35Jj72aHTeneNR5mmEsCGDkZ2RIKnuEc
	 w/9pjZ5+Zpwgx7CvkIXW/511kVl/c4A8muPxbM62ai79yNkdNC0LvfcK3rNJghvEefuN8VMZcPgu
	 7vH7GNpehSxxG3jztBKuff4pIFn8xm65Kgqwe4pcBYh1icTnC4OW1kkMaawLGWBj/BRnHydYk=
From: Yangyu Chen <cyy@cyyself.name>
To: cyy@cyyself.name
Cc: aou@eecs.berkeley.edu,
	i@zenithal.me,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	soha@lohu.info,
	twd2.me@gmail.com
Subject: Re: [PATCH 1/2] riscv: allow case-insensitive ISA string parsing
Date: Tue, 25 Apr 2023 20:45:00 +0800
X-OQ-MSGID: <20230425124500.194036-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <tencent_63090269FF399AE30AC774848C344EF2F10A@qq.com>
References: <tencent_63090269FF399AE30AC774848C344EF2F10A@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_054530_707422_957CD29F 
X-CRM114-Status: UNSURE (   3.20  )
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

The cover letter is at:

https://lore.kernel.org/linux-riscv/tencent_1647475C9618C390BEC601BE2CC1206D0C07@qq.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
