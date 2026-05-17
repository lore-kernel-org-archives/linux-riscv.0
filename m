Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398F1CD4F25
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 07:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXlt1igQi7ihEmZEKmC6SJFqewCJ+jjhnxljWgIWdvw=; b=w0HF+4lWNcFIWs
	IujQ0/FcPF3pWPdot5BW3JxjesBL/E3MHdXHmjArefCnVhLovV7se2DuLDCXz2xhvBfmPbi4Qzehf
	9SVrJAb7wpnG6mTd5J6jAB7IJwFfshONtEwF944JMtXTHsvQYm1cE62AHyvU+pKCcoy35fd40qbST
	0htMln9Z9+ui+7jCr8WjVjgNMNB2lalT3V767bM0FyRf9Gc5zKElyLkKSj0sLcZ2aw8wmhGwJSlHe
	hqh9ivq+T+jxJifh0MraQJk8dnGq331ZwDkr2AfUdofzkmdkleDIC5vfyNcENwSzNit+4zHhNsux+
	L5blwXCA9BotVGhJsd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOW5V-0000000CJBT-0U9G;
	Sun, 17 May 2026 07:39:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOW5S-0000000CJAr-3Hsw
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 07:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0D984192D;
	Sun, 17 May 2026 07:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233CBC2BCB0;
	Sun, 17 May 2026 07:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779003537;
	bh=mz0YyvKbaoc6XCBeyQG6RvdKAicdcMQPsi1mL2zEflE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bzxt24WbxfJLarfJjsVq8eZ455EbF96WS3mkkR7S4rrVQEdtHjpPnvxL5y0IEoTmm
	 73dBAUsdb/gmfJEBBYNnaDECi/Xix91558aQPluJ3FurUBZ69ymZwtGnBUrZz6Ggvp
	 qkjbIRD2nY4EnAFn9Jvl8BeCNc2lfVvb6Lw/uUnHi2NHbCHJ4WrtMN081mhXQtNS1i
	 ELEkiNtfLTDRInXiwyh4kWE4A35oxZesG00sf5NneGKKCR3r2a7zSlkVQH50VgEY1S
	 1C37iPpFNnVUsqY4+6q1PIG2OM4Zy0TxkP7mWOlUM3Qgz2Zn7V605WqoKOEIBms0O8
	 6WLmkeVK8mJ2g==
Date: Sun, 17 May 2026 07:38:55 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	pjw@kernel.org, robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
Message-ID: <20260517073855-GKB3679294@kernel.org>
References: <177893657188.2456968.7429508961699495905.b4-ty@b4>
 <20260517070006.1836396-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260517070006.1836396-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_003858_844981_9FF6E75B 
X-CRM114-Status: UNSURE (   8.53  )
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

Hi Chukun,

On 15:00 Sun 17 May     , Chukun Pan wrote:
> Hi,
> 
> > Applied, thanks!
> 
> Wow, you're so fast!
> The robot report has one typo:
> 
> > +			uboot@a00000 {
> > +				reg = <0xa0000 0x760000>;
> > +			};
> 
> This should be:
> ```
> 			uboot@a0000 {
> ```
> 
> Could you fix it? Or I can send the v2 patch.
> 
Ok, I will fix it

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
