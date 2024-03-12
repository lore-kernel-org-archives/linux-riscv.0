Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2A7C54E66
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 08:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ga83hqxlIcUeTWlk8LnrAW7Ynq6kkPjuWH/3r4xLq8g=; b=T8+x8T2uV13UFF
	xLLJj0RvGPB5FCduDp2iRUWZoJRVnKWMVK/uW5LpzF6gSGsAhg/dNDKLBM4yzln7X94yQBnznc9kb
	FlD94J/Nbz04sUWdehY9CDP/4/OIGyf5REw/eYHLhpwa21BR4s6KnKZtqLhWFsqvqCuZsQUkicE2Z
	fRsXEGtAIBleEw1drtOwH+zbrWn7XYnPNyUjHL1cJscmatDb1O/SLrvmUT+8J+do7Swkko98Bg1YC
	2Fnlw4mLi6O+gQLUTKPfFl5a1sOTNDO+/hIFuJQdj/mrFEoo12f0EeFijd6Ol5jlR1osEDm9JzrKP
	bNQLsgysD4ukWtkGf4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxbq-00000004uOE-2p7C;
	Tue, 12 Mar 2024 08:35:42 +0000
Received: from mail.createsavvy.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxbo-00000004uMP-2ZF9
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 08:35:41 +0000
Received: by mail.createsavvy.pl (Postfix, from userid 1002)
	id 1C7F5A302F; Tue, 12 Mar 2024 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=createsavvy.pl;
	s=mail; t=1710232539;
	bh=Q787bUI8wqiKELAtyWRvCTxaBwNaZfpooGhkyk63cfU=;
	h=Date:From:To:Subject:From;
	b=sznydMjUd4zkyNsGKxUlFoWNem2+jF6/BvyJj70qTsEH64dmAMClfj0E6zibYZodT
	 4339niFU18o9ITBt10jsWB9qVMeStsmh4l5EALdhZujnVKQSqX4umakJd62OuTft5m
	 mGPCntLGc3J2DRD/w+ya8EW6AuTeSuh0mlq40omQh27kfbzHaF0WcGrjcleIzDlZRO
	 2PUWPugPECYGwVxUOba3XAiLEuCGZoQ5x+R1N3gPRjVjrxag6E37QUXugoJq1317Uc
	 RNKO9Acv7jHgjZN91z3sTfL0MrlwkONV5JFBW1YfqeHzGGS8cq4zWWQqWHCV03m7fi
	 HMoyToiJw9hcQ==
Received: by mail.createsavvy.pl for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 08:35:26 GMT
Message-ID: <20240312074500-0.1.do.24e9v.0.7b19hnuhsa@createsavvy.pl>
Date: Tue, 12 Mar 2024 08:35:26 GMT
From: "Maksymilian Ciszewski" <maksymilian.ciszewski@createsavvy.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.createsavvy.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_013540_842453_CD15A92A 
X-CRM114-Status: UNSURE (   0.91  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpNYWtzeW1pbGlhbiBDaXN6ZXdza2kKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
