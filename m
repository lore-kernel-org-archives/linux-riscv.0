Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21405C27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jun 2024 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGZlKWmyTfpiSXRRLU1HWwipI1Be8AjvtYal7FoBK3s=; b=u0r94VSnV0qaY0
	L91N8Mhsr8DZBYEufZSmgbwCZnlP1FUV1lOZf2blgCHHbzBWvcI7GbRQAZYvbhfv/oXpaUrS9TbM3
	R8E4+JpUe4oXAazYOkWEPS7cOdxOguqATShboBSsn8RIqEOW4NjcuK51VVakxB0+oWhoZ0DhhufRr
	mKEHJvg3ncyV9ZR13I+TFNQqb4n1fvTLKJx9h0f2E6Tv/Sa+No/kjh+JZRKHDPkY81AZ31ZCrMr/1
	H7ybXxJbD/TXbAV1Eoh6dkiJJf7u17KgAgfKvRbYnnV/X4hkJE/4oE2Wb53fMJaXRa6SfzkJT+so2
	xnVVYtzZLii4IveUcJtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNwBq-00000000aJb-3ys6;
	Sun, 30 Jun 2024 15:10:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNwBQ-00000000a92-1ymq;
	Sun, 30 Jun 2024 15:09:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DFD3DCE0B16;
	Sun, 30 Jun 2024 15:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BD9C4AF0C;
	Sun, 30 Jun 2024 15:09:36 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 9CF305FE30;
	Sun, 30 Jun 2024 23:09:34 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240622150731.1105901-1-wens@kernel.org>
References: <20240622150731.1105901-1-wens@kernel.org>
Subject: Re: (subset) [PATCH 0/3] riscv: allwinner: ClockworkPi and DevTerm
 devicetrees
Message-Id: <171976017463.1183261.6835267708934642327.b4-ty@csie.org>
Date: Sun, 30 Jun 2024 23:09:34 +0800
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_080940_748363_F1645053 
X-CRM114-Status: UNSURE (   7.21  )
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

On Sat, 22 Jun 2024 23:07:28 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Hi folks,
> 
> Here are a couple patches that were originally sent by Samuel, but later
> dropped due to the system LDO regulator bindings not getting merged. The
> regulator bindings were recently resent and landed [1], so now is the time
> to get the rest of the stragglers in.
> 
> [...]

Applied to sunxi/dt-for-6.11 in sunxi/linux.git, thanks!

[2/3] riscv: dts: allwinner: d1s-t113: Add system LDOs
      https://git.kernel.org/sunxi/linux/c/8f2cf4442b49
[3/3] riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees
      https://git.kernel.org/sunxi/linux/c/0ce1d34678e5

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
