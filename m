Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A7EC44507
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 09:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5VR3ex8ma2MJZo59xS/nTZqkttNIsl2XmUCVe+t0/I=; b=1qsfcuyZxMIA4w
	IkAIhehL1Jk1q1h1q9ozjW8boZkGc1Pg/qYEppjI3xPR0l5g1R+qsOYNhJF4HvLKU3jm3APjFbXlh
	zX420Z0EaIYgj2mUdORw8sR910YGo72HW5icwOc6Jbj2XsfXniJbFR/rfQoCbjFh0VeR0HaWxJ2WP
	g9+Y0eSJfC3L/2WQhEK4YvCOokfCyjXqOVHlSasdkiPxyFLksioy6+/DBud5CKPfDVzQDAdPKI6Da
	msrdvTbFa+hR3GI+q+0wOc/xKbp0F7VNgVaJLPFajPNiCoUn2AWbbqCb78K4LipwcU5k3MRCatGw5
	zPozT4LN7fYxjAkM6amQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZGL-0000000BPkx-3rcU;
	Tue, 14 Jul 2026 09:17:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZGK-0000000BPeX-0Ugm
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 09:17:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 94A7B404FF;
	Tue, 14 Jul 2026 09:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B2A1F00A3E;
	Tue, 14 Jul 2026 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020631;
	bh=uiUOk/sFGw0gjt9bqyQS2EWUFpZX9GEi9JgxdTxjRWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z7QLBMJL1lnzZZcsH/Ift/fGEwTSNgaSNJ30gkHOTYPPqALcJq98nXs0p0LfHwh1Y
	 wEIZb26BpfHoy7/RUE+fw9kWyP+8HOnhsmsss3+JutPo5uf0iB/F+v7yjMrNNozHrt
	 w7gV2dgbbmPo9Cfz3ZK4CfF3rOJZ5wv0VURakIYxgMi4QkiKfZukT87VDPMWkT5gh+
	 vee613U7M9o34Hi1+9221bhcg2YZdQ4LLAZLm+ZrCGS77BIJRM+5NgPZ4mPn0G/6zr
	 IfueOEsaIQ9nhphvq6aNCYuasv3zdYxUKzZvwW9zDvu+CouL2uNxkt0GYZdxy8vEFO
	 OAXLuZQJ1BmQw==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zhengyu He <hezhy472013@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wefu@redhat.com,
	Aurelien Jarno <aurelien@aurel32.net>,
	Cody Kang <cody.kang.hk@outlook.com>
Subject: Re: [PATCH v3] riscv: dts: spacemit: k3: Add QSPI support for Pico-ITX board
Date: Tue, 14 Jul 2026 09:17:05 +0000
Message-ID: <178402057246.1569185.16366800635203852729.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260711-k3-pico-itx-qspi-v3-v3-1-d6b37fc86c39@gmail.com>
References: <20260711-k3-pico-itx-qspi-v3-v3-1-d6b37fc86c39@gmail.com>
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


On Sat, 11 Jul 2026 09:38:52 +0800, Zhengyu He wrote:
> Enable QSPI with proper pinmux on the Pico-ITX board, and describe the
> NOR flash wired to it.

Applied, thanks!

[1/1] riscv: dts: spacemit: k3: Add QSPI support for Pico-ITX board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=30da556b3d351f3916d0bcb19834f29b8ac361b3

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
