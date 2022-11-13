Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBF0C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ziGRdKcRncLfDDiMDjaFSV4Hq6MKJou1SsicfD1w2M=; b=mk0TNjqCs2HtpF
	vseoC2oLpDb8lzFJ+dY3JjSyVafXmF5SdEFTb5evl6B82GM6CH9Oy6MYOd7pMsAIXPeqxwt7rh6yv
	8M3+lInspaeqJ9sqA+yCrD2/r0qw4qnRBhkKEaXgS+qCcvHdjrqMahJ6TfqDjkKd1mx7ykOcovQA3
	w3FNZGd+S66xmJ3etm7P71++DvLclE7OpfEHwOrMTxelXALY8PDJtIbX2St2Roo9CX06T54xmj6Pa
	TJWANM7FmnPzTmoBU05Iqd6fGK0UayelI1AIV6EQbpDm03IH/0+GKRugXeDibnao0rPHt324IJW4o
	/hfn8iIYm/iX/frm/2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouGdK-00CcaY-KW; Sun, 13 Nov 2022 17:19:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouGdH-00CcZI-OS
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 17:19:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 37127B80C02;
	Sun, 13 Nov 2022 17:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FFFC433C1;
	Sun, 13 Nov 2022 17:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668359936;
	bh=KXjgMIIzjeBW/b+BUU54O+6KKHdrQhBefEjGsi6yglo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5A0uedpcgcDQ/4HtAH/NrBtssa/wwNIKXrCeZf5jZV3P9+WxTOqAn2mpzL/OdJ/n
	 vX/HdzCqem6SY1hWZPifnRut4MVJKynodzf3Ca/lWWG1lf5c0DI2dzZAmn6Mdps5xB
	 5GudFminqFIVHX79x983H1GsfYzRDLPGk/u1KZGkdSjOKHlml+eKj+y7tk0/Xh65dJ
	 pqOpiuwmn1Oi5jT+wehdz9VKBBYgJOeN+YuQ/oSgG7scdMSALIT0mptJCbLVvv5+nB
	 p0qgIie1tq4ngbwnucX+LkNw7t0sj8XsHFLNyZ12eNU30qGiVo0ZyF+97ENAsS9Vyy
	 jYXedp6zKFdlQ==
Date: Sun, 13 Nov 2022 17:18:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 2/7] RISC-V: add auipc elements to parse_asm header
Message-ID: <Y3Em/Dos8KmwOMsp@spud>
References: <20221110164924.529386-1-heiko@sntech.de>
 <20221110164924.529386-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221110164924.529386-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_091859_954739_B3D2B804 
X-CRM114-Status: UNSURE (   5.35  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
