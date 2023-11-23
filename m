Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9ECC5AD4C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 08:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ga83hqxlIcUeTWlk8LnrAW7Ynq6kkPjuWH/3r4xLq8g=; b=cgfGip5XZqPYdQ
	6xr/5z3TNxyEzSmwtsmTymlU4utQZdGK09ceIIoiuHWVgtYmHdYnfJEzcyY3F41hinEpejqHOCP4l
	yS61fhqFpHWtKoIxtsiMC4wtiIJuENYqj/o9u8W/5q+dXERCAWuzqcFc4ZBy/TM1jrwX46YgdMyYp
	f8I+xoC9jCGErHjI6o3RAQBLpJFx4T3Dd1igaKpZXTDklYghDCnJkaJEiHPpBIBIkCACkk4OSQmS+
	ua3ZLT9WQrul+l//Y2CJ6eqFR5uUCXcrF9UcAhBmimiKhzhO8ojJcUIq3DXM3xCvaR4a6zfNVE9Kz
	JWOxV8dfSG1W2FDmxdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r65R3-004Bwx-2B;
	Thu, 23 Nov 2023 08:51:45 +0000
Received: from mail.raportygospodarcze.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r65Qz-004Bvd-0D
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 08:51:43 +0000
Received: by mail.raportygospodarcze.pl (Postfix, from userid 1002)
	id 63026A37F4; Thu, 23 Nov 2023 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=raportygospodarcze.pl; s=mail; t=1700729493;
	bh=Q787bUI8wqiKELAtyWRvCTxaBwNaZfpooGhkyk63cfU=;
	h=Date:From:To:Subject:From;
	b=D2XzxnXb7FKfygtE+uLWExQGD7GBYslUysiewEhByvSgpnXa3iOHY5QQnhzSojbFW
	 18QmM3tX34m6KrVEeyfOEZH5FzLX/t5RL5fzuJJtDYHT85wvqLXepTsauxLn8W1uMH
	 2kjE7ymx7El8uUH8OYjk3p/sDsajV8zfYazMDrD+1fFCGAu0NpyK5Ja2dEhNfPMTIz
	 LFhcWXAChEhe1TuyP7CNY0jyduGl9vZqhsUuNkRUhTzJQYmJj48orgtYxNH7d/auvJ
	 gDhhtexhijSqw2rvfqHWlFxnUerL4T2ECNmuLZOb04qnPgbUwHvXlguaISZSztFmtJ
	 sigRmTtGfMO5Q==
Received: by mail.raportygospodarcze.pl for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 08:50:45 GMT
Message-ID: <20231123074500-0.1.br.1iqc9.0.j9hoge3cr2@raportygospodarcze.pl>
Date: Thu, 23 Nov 2023 08:50:45 GMT
From: "Maksymilian Ciszewski" <maksymilian.ciszewski@raportygospodarcze.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.raportygospodarcze.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_005141_858927_4EED7722 
X-CRM114-Status: UNSURE (   0.75  )
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
