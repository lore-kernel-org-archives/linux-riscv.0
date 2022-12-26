Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120D8C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Dec 2022 22:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TvLDoDtnVKYEVLgfhllyirrLG5Plosn9UaQy1+lPzG4=; b=dl3+gjXo9SGrbH
	FRAQ1L5obOp+5+g5PCoxjGO56Fme1Q2YSls5d59/sVicLsRrERVKfpCnYqoegzm/msOI7XtsFJfb5
	+qjbx+LvSzsdm6/JiuPsUtrMibX0W5vIYlTH8Tgfg6y+ssTewsaKO9xTeS9AZDo4uc/i1tfGeM2uD
	6TFKs9wU3AV6XSkWufyRbDt7nr00nUYXBCKSkuPjr3lOFIqpg/4ztLj8OQW/p9KL9pmblgnVp2Y/b
	OK4zx5U4vh/l++EGZ4VHBbFj1j9wpAhM8mWIuC/5w4RZzbLEnVYUXIa1aWC0HwEQJ355ajuK6jkyY
	TKD3ZjaDdRO4ULGg+5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9wF4-0080vC-Qw; Mon, 26 Dec 2022 22:46:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9wF1-0080tU-2w
	for linux-riscv@lists.infradead.org; Mon, 26 Dec 2022 22:46:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6ABA060E94;
	Mon, 26 Dec 2022 22:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAB0C433D2;
	Mon, 26 Dec 2022 22:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672094800;
	bh=xn7lV3m68/eeONQwiMztfwZqj6zMswJJ8qyPz2b3NKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iduqg0hWk02rYp6tm+m3J/LyJ4KyJroVheh/aomdXIvPZo6Xkr0R97uFACGmqON/9
	 QRArJSR8uBmRKKqcCOTLj2TxgF0GUA2tXHxm19plpAld9yvK5aVuIetFekZ424PcTi
	 0KhdPmulEw+I6i4ozZ7IAMuWxT5squUJ4a53uaebcbJhPygMmdIkDduzfmBHlWmwhY
	 9HiNCGi5tVzTuIv+9P8tFmgIdHt+55XOnukK0FDECfp0xwdxXj8X/Y8/jGdBPkThbz
	 Zu4fTihreuiTutJnb57G8vXK9PggJFTq7olrvbUwcG1ZQs8kpSx2/1vh5Ooi80d4wr
	 k/PsNKL012aRw==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/2] mpfs: fix handling failed service requests
Date: Mon, 26 Dec 2022 22:46:28 +0000
Message-Id: <167209401166.1237431.3681693527005638710.b4-ty@microchip.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123175652.327859-1-conor@kernel.org>
References: <20221123175652.327859-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=533; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=7ZyLo9pw4ngtdXWCQmsbO+VBc6xMj4XuwSVXhASX+OA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMmrVBxVFpwpVfx4y6Hg3B9X+6U2uq9WTot0mLX77JyLc5e2 F6TVdpSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAie6cy/FN9lX//18ujDZt+Ga75s3 99U/78rX9PVt7ONkpM5EzZ1qrA8L/y5d7j7zRuXf+y56J3o/f2zms7mr6U3tpYxL8oyPtL1xoeAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_144643_543996_C2F9652D 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 23 Nov 2022 17:56:50 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> As things stand, if a service request fails, we never know about it as
> the status register is not read. This is quite obviously far from ideal,
> as we would be reading garbage from the mailbox if a service was to
> fail.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/2] soc: microchip: mpfs: handle failed system service requests
      https://git.kernel.org/conor/c/730892135b7d

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
