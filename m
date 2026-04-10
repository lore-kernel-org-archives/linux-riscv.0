Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DBDF45A0D
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 20:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxpRv0ZKNhfEwida6rfyLlcP7+d0f62+8QeSCVSmo8U=; b=ZDXfmhiTFlPrda
	BAltxy1yk0ElRqPm4R+zmxlIJ8abYhB4k3DupM2eY57S2oVrPzumSJzRivJbNP/GOl0E60xN3fzXP
	bXMU0O1daeXZUvbe5/N+h1sEgl5X0VUSOlxdYn2OCSkR1zWqXbfsBXq6HRjUiSJt9IWQWyLdk2TpO
	fwa5dXvO0ibS6eQR+6uX9utmW7O0/tCKgd2LK0bDZi191oZEImP4kfH1Dn9OOeRtj5ezkd3ha38OD
	IL1ayNKnhUVZ0dGR+WRzCGHd/0vg3jk5mUGqpx3BXomb1E2MHzkMBd0lmtV5PWiJXhKaXge42/6S1
	DEF5BNk5qYBgWm1K6TtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBId7-0000000CmD1-13bc;
	Fri, 10 Apr 2026 20:39:05 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBId5-0000000CmCe-0Q9A
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 20:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Content-Transfer-Encoding:Cc:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=nOeS013dZHZZVXOegg1RZdui9dG1gopKTyUnsxDAAeU=; b=xNIcjJj+VSiLTAwIpCW86zubwK
	PgnUZ0yNotW+zm0z9Vksvva1UPnOl7zAF/3LtMY3ZJKSSTdlVn/gf6XOe4NPxUC6vJ47DUwg3rWrQ
	MJs+vQB4WuFnnLy99tkOqwl/o9MwccSx92bbraqyqNBDOTR2N6IieVXa5JUHyQXbCnFHHOPhC7j1n
	4U1vlinRiQeaxAdMsGD/9O9T62GrzO7JGk4Crd1BgJx6yCjjctCIlJmKETdjZZSKBx3EWkMJWwLQY
	rutEhErZ4f0W2nEPQDLfkH7w49an2DwdyA6alJ77B+f8UPe+v8HyeG35gJu7wM6qmN5Ct9+JwGHqw
	BMT/CWBg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wBIcv-00000000wrk-3bkp;
	Fri, 10 Apr 2026 22:38:53 +0200
Date: Fri, 10 Apr 2026 22:38:53 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [RESEND][PATCH v5] mfd: simple-mfd-i2c: add a reboot cell for
 the SpacemiT P1 chip
Message-ID: <adlf3br-bhakX0Dh@aurel32.net>
Mail-Followup-To: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
References: <20260401165437.1048786-3-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260401165437.1048786-3-aurelien@aurel32.net>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_133903_142964_C0C5C50A 
X-CRM114-Status: UNSURE (   9.57  )
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

Hi,

On 2026-04-01 18:50, Aurelien Jarno wrote:
> Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  drivers/mfd/simple-mfd-i2c.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> Note that the spacemit-p1-reboot driver requires PIO support in the
> spacemit i2C driver [1]. This hasn't been merged despite being ready for
> weeks.

This just got merged and should be in 7.1 (it is currently in next).

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
