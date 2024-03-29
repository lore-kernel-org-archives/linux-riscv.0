Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116AAC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 08:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ga83hqxlIcUeTWlk8LnrAW7Ynq6kkPjuWH/3r4xLq8g=; b=1wfpIHwEIU8tO5
	hyjjeIg52iY7DD/HQxjkCUWwcVnt+brQ79j/f/UJMoPTucdmRrlmj4psMGpg6behsTpXFgfhsgP0H
	tarNY1VS18Us01M8yjE1EpEqYbGZwhHoIVoWSMC6hukX5fBaH4ThxhQnqhXH/aLsH3q9bk3PNqrti
	btb86HQXQ1YtnI9FyreXI+e08bqepEK+hcwhAQJBL8F4Z/DoNdEKX78opis0R3+SKUgHCleNYI0dZ
	pSLiS9IVsLH/KB6a4X7iUes59h5xG1sO0a1tRY0rmX3ZQygc0nq9k+rIsrdZpIeeHS3Esh2Am7mEI
	ZhWJ0vz5Bn8hLUvVcTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq7eS-0000000HK7J-21WO;
	Fri, 29 Mar 2024 08:31:52 +0000
Received: from mail.createsavvy.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq7eP-0000000HK6B-1tVR
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 08:31:50 +0000
Received: by mail.createsavvy.pl (Postfix, from userid 1002)
	id 7E9D2A4021; Fri, 29 Mar 2024 08:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=createsavvy.pl;
	s=mail; t=1711701077;
	bh=Q787bUI8wqiKELAtyWRvCTxaBwNaZfpooGhkyk63cfU=;
	h=Date:From:To:Subject:From;
	b=cGiuhry9+KmSIsm5HFCLcT05dvTilDI/6l46DVB83RiTkTiszKpg157SpurqBb5u8
	 sJRAnnsX/M6YLMcKK96xGwuApIK4HThpxxmv0omSPkMaKqw2SBCabsNQaAHInwgA7X
	 k4y4WtUtzgfUcQiZABZBge6zNiDqZW3p3VdoJQ5bwS+0betjRxGb5QSMmuU0dblZhm
	 99hlFNUCvBBOiV5lL/Vx77IHP146Dp2gU0Ss2u/eNh3KjMs4eW5SBMcwMhiOoWUiEl
	 BGFvoAnl6a54eAjhluFK5p3wDSbils0OJNhLir8Rw08AsStkHTby7tNI6DpqwMbq7h
	 f6F4d8muLQOVQ==
Received: by mail.createsavvy.pl for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 08:30:16 GMT
Message-ID: <20240329074500-0.1.e1.27v8m.0.87i66j724f@createsavvy.pl>
Date: Fri, 29 Mar 2024 08:30:16 GMT
From: "Maksymilian Ciszewski" <maksymilian.ciszewski@createsavvy.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.createsavvy.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_013149_654992_1994524D 
X-CRM114-Status: UNSURE (   0.84  )
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
