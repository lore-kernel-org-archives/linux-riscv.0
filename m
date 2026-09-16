Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE7FC88E77
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 02:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIv0q9/pDskPRRAtOhdGwZcuUwzwtnvygAO4UdpIoC8=; b=LgrdrSuPjKU59h
	9lzA1YdIZ+Zm0LZ61c8CyJKjpAoKvTHDPdNXHx9gpTiRoEhr1mq0pwlU52TT6nQZj20EjDoI5vm2E
	OP0UOiPzKGgLJK7C9uUCZwK3++r7YEw8C6ukIOoy3ZlwC+o3hRXIGVvvAmj96nEf1aFWaeb8kSKv/
	6GJkn5QVnmyqCgX3rls1YwHnN0A4El5JLZeqn7sFXEfksdnunILE66LPQsC/QDKiHyMJGE/ydeRCI
	BtjF/GRJPVvdWSfv+PFJXx7u54oyAZy9Nw/9PVViVL4ZOEaY8dq4iWvj7/XJciBm6RKjRF6T6lMGI
	LhO1Mks/61i/q1pABPEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6fHI-00000008BbE-3F8b;
	Wed, 16 Sep 2026 02:21:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6fHD-00000008Bb6-3r7C
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 02:21:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98C9160142;
	Wed, 16 Sep 2026 02:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEA71F00893;
	Wed, 16 Sep 2026 02:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789525293;
	bh=6iZpbiSb4G9jkRUzim4PlL0w2d6FuhKtW16yMIePUAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fkXwgn5kT/wpo4YAVu8dzupK9isF8sj7jvcAxaPFpC3c0r41RXGkAIYO4fiGIGQxi
	 /zMlg5IIlq7sG6WvXcXTrSSoaZrriObn3gMUgjMKmDDGoMImcRZiLjBukExfFtsIS+
	 dbeXvck5IWBDAO+nZYwjpAI8sY2Dp7Hz0RbiBI64Hj0WWSY06f5W+rLlftPw/b3lM5
	 tT+gJIBw18r1hCRWHXzvgodBzjksvuJotopgNHjKpSg8puEcxpwgIF3zDUJXKQX5Se
	 WC3NauaIUgMmSCSbhW3kIRw3QX1WQXOTzgkU2uuxNJDKw/bA1s1wQ0Z8KqlQrMI9p2
	 TVVOdjv+twtPw==
From: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller driver
Date: Wed, 16 Sep 2026 02:21:27 +0000
Message-ID: <178952516873.3915021.10661869021397268088.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
References: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
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


On Wed, 03 Jun 2026 06:26:11 -0400, Guodong Xu wrote:
> Add a MAINTAINERS entry for the SpacemiT reset controller driver
> (drivers/reset/spacemit/) and its reset-ID header. I intend to
> maintain it: the K1 and K3 instances now, and future SpacemiT SoCs
> that reuse the common code.

Applied, thanks!

[1/1] MAINTAINERS: add entry for SpacemiT reset controller driver
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=bd81fd41a70811d3423f2701e9ce85a003175d7b

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
