Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CBEC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 22:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kiQQayNJjzAXTAodpfNcSrefOYokPxPgtbKBC6Yp5O4=; b=nlOBg6vS/mFDSk
	ak/lyupxmo+xT9S/Kwa14132hNQ798JJ+TCwFruLQ2QFGS4JowPc1bhLWKY3dXwK0773lGPrActJs
	WyRzS6mIcKlKgWzZyDss76YYs5IN7P12iKvJg7RxF6CCKvRc/m2oUqui8y4eo7weJZnL7f0BKQukM
	LRIacbADWOKBHf1Cfk/u0pKA+YzMpiLflomyldi6+LxwpBaJiKa49k1TWiiqGSq6jtdic7x+Xzd9A
	EdiyK2IqI2PX/KXJKicmfCOqSN4oCixXEUQ2vZcADU4rrp9/Sbn0WatQ7e9d2d6O8xnCSsRForWr5
	5M8HC4rCX7BNgRWnwL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8EC-00ESrw-16; Tue, 28 Feb 2023 22:13:44 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8E9-00ESqR-3t
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 22:13:42 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 091D549B;
	Tue, 28 Feb 2023 22:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 091D549B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1677622417; bh=F1mnOVYGyKe00jPt16PkikjTGm9r2Hcgq7VT9LY82ko=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kGnOQwCTXvgV1hbb+cvcK4q0tWouXcbWyPt8GCuAB0GBVWhl/13zHxL3eIBkkLBOR
	 qRAgFg/vFt/5mFD3h+L9hdpNbhSXjKhHpKFWZ/eklT3ljE2bmTyDqFkiXZVzlWOMRs
	 B1CLgLBVqinhPJX4YMKA6v7WT+KJAVABPRIsq0ZvnO2TmSuFhBfunIkfE9ITEewjkf
	 VN5ofasJ+W46x9AMgls3MEocvbw2Yj5eVQK2gKG+pMTw2kSw3n7bMSQtq/C4Fu0MfP
	 3PWrvViMDwmiP05PkebxFJUwZOZmo87bRtcWm+cMJNijMeWTlZEjgczXTP0tDt3jUO
	 4WRJu6gmPweUg==
From: Jonathan Corbet <corbet@lwn.net>
To: Palmer Dabbelt <palmer@rivosinc.com>, suagrfillet@gmail.com
Cc: alexs@kernel.org, siyanteng@loongson.cn, robh@kernel.org, Conor Dooley
 <conor.dooley@microchip.com>, leyfoon.tan@starfivetech.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, suagrfillet@gmail.com
Subject: Re: [PATCH] sched/doc: supplement CPU capacity with RISC-V
In-Reply-To: <mhng-90a89c61-02e7-4f1a-b18d-189d9b7fff72@palmer-ri-x1c9a>
References: <mhng-90a89c61-02e7-4f1a-b18d-189d9b7fff72@palmer-ri-x1c9a>
Date: Tue, 28 Feb 2023 15:13:36 -0700
Message-ID: <87wn41wi9b.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_141341_198325_4A887A07 
X-CRM114-Status: UNSURE (   8.18  )
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

Palmer Dabbelt <palmer@rivosinc.com> writes:

> Happy to take this through the RISC-V tree, but I'll hold off for a bit 
> and let the doc folks have a chance to chime in (or just pick it up).  
> I'm planning on sending something later this week either way.

"Doc folks" are fine if you just include this one in the pull you're
doing.

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
