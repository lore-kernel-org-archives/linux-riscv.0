Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D39FCA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/uL0LFCOYKK2nZ+Qe8gHf/7dGjpgNxq+isLMG1gu04=; b=DQFhMloHXtZTjQ
	i7wel565eJF86PfaQQQLdS/mR7rGzRH0WgQudmi7J9iLJmSqkxXNjd7i+8mgJ2TkMQWE/zI+MMAln
	OtF9z/jCIXlHExNq/AtfUXk4sJ1oGa6CWcu43bP0KKASNXMFJJUaWacsYoLJZ5+GDm3iOViXVFAqr
	lfx00zHLDSG/y0iv+NzzFGkJIFQF+pj2W1AkpKVY9Oe8aBKEelL/gPN9BW13cFigb6BRLP3cmkVM1
	iJ9kHCmjP6NEtgl4fkPfMt/EmRltF8/i5wo7Ki0MmpVYHKvIxH2Wua3VT7ZgZuVLJXqZ4RGGqQrsk
	U+KFZuXIwWu/z7rD4s0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChBx-0000000CAiL-41xp;
	Fri, 02 Oct 2026 17:37:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChBw-0000000CAhw-1ssa
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 17:37:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25E5A60A52;
	Fri,  2 Oct 2026 17:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5461F000FF;
	Fri,  2 Oct 2026 17:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790962621;
	bh=T4gk1Rw6DphWhNHrFH0m9t3b7vjDTAP7CzaSldK9PR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VoV84CsG2LhnumK2mqpK+Axbsk6nPk81v3YjxaNc7zVr21jnwKTGyJRcWb8mstUJl
	 NM1gPC5ikSSlEZCQk3wzSDyob8llcikrn9N0Oto+9DUXnr2x+URnepEemCuLa1hfAt
	 521JGzoZvxsSNH1V1SkNB9mK0nhKdd+v6TXHsO5YpPnzQJKY+9DLCBgTKWoGkZNkww
	 KGir1fuZfHu8TQc/aMRu6max2QMT0sQHbMMXIP4GUsjm6mRTvS2HMi41SVcXzVfUP0
	 Nx5FFG9kthOu4BI2hBO4hatZ/l8Lpdd4768IR/cHR/RZBO84INg2+k2jYMlm0FDmio
	 M0tfhnBbh4Jzg==
From: Conor Dooley <conor@kernel.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [RESEND v22 0/3] Add OpenCores PTC PWM support
Date: Fri,  2 Oct 2026 18:35:42 +0100
Message-ID: <179096253376.1939568.1957466503835691407.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810030714.48100-1-hal.feng@starfivetech.com>
References: <20260810030714.48100-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=600; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=En/co67eXIdMGpoDBdCz6bNLW3nZ0tD5RHoRgp8pjn4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFn7X+d1TOd3nTFPrPHnh8Vs+WJpZ84sL7P3rC+6XfZU8 83+hNDojlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExEZCvDP8MXC927ZGIcnnW0 7Hmx6/iOc/pHvqds4WxfNHFBi3rLtFMM/103JRk9TW4zD0g6mf+c3/RbllzAC9aiC1HZkQtNMjL l2QE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

On Mon, 10 Aug 2026 11:07:11 +0800, Hal Feng wrote:
> Add OpenCores PTC PWM driver which is used in StarFive
> JH7100/JH7110/JHB100 SoC.
> 
> I will maintain this pwm module in place of William.
> 
> Changes since v21:
> - Allow non-zero duty cycles shorter than one clock tick to round down to
>   zero.
> - Drop the .free() callback to preserve the PWM hardware state after
>   pwm_put().
> - Update the comment.
> 
> [...]

Applied to riscv-dt-for-next, because this is independent and has no actual
urgency without a driver.

[2/3] riscv: dts: starfive: Correct pwm nodes
      https://git.kernel.org/conor/c/2186ec5f59c2

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
