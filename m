Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A40E7718B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Dec 2024 00:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2CU8Lft1vCcshmhY7ZfceXzCQySUU5pscLXCqhNIPsI=; b=K+W6tH8ohaKrdQ
	jqMAeP6sq2QVVShZbW6BAWZ2tGjSwwNWn1zYJEjqnFr2qzk5jEMtBDCsje0fcRaTwnGy97wI8Zr9e
	FshRxceKNsabhR2XHVpSAhum3zPhXvu3UNwIAzJ8QSl6jNUHeE2eQbd14p1iBAp4fTJIY0WEMgiG2
	7KoVHDAsZ4JzZB678kRuaslmYQCOlDl8/jsdoctwZmnCXvNstLtdCJlPc9Bt9T5gnRzO2suSEj2fd
	AMPIZyGLSnYCKQvxJSWw8w7wCjJ1cGHR6aCBM59I19WPZtjemnU9n3YDklqPLVpeTmhYMy/VVQpxi
	x9755wKNTDKe4hhJveTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQcDd-0000000Edw0-3X2w;
	Thu, 26 Dec 2024 00:59:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQcDa-0000000EduS-3wR1
	for linux-riscv@lists.infradead.org;
	Thu, 26 Dec 2024 00:59:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C4985C57EC;
	Thu, 26 Dec 2024 00:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D5DC4CECD;
	Thu, 26 Dec 2024 00:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735174752;
	bh=40QAfc5ONlcuqgTB/eJixVYRle1IK814KzbqaVDUYRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aHnuzqKFdNcKwZzDInTbOtFHZ/KV/PUH+hIcSu8th0fy+ZVuLSfMfnPhtAa9BHQOv
	 dFhtsBvln27ZI5G7/AlTDvVjxkr7t//2kwyWS10wGYMIDdOkp0rex10+vPCjTuIfa7
	 /OmidctAEPSMtfUdoxQzCDwnc2pYSCLU41pIyzKCci2ICqXrCQJrBAZGE9ZLd0v5R+
	 45akR43GuDW7/iey96upv7jvztcYkAiAOhPUE3rFjFxb+k7pfYbBis4dBsxq1WNmqR
	 XWjLhd4R+BHDTjV/86UR4IRyzbfc1IUxWLjrYiE6sQG/+TjIcIDqdMuKyGthXLwyOA
	 nh07EHxooXFBA==
Date: Thu, 26 Dec 2024 01:59:06 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Wolfram Sang <wsa@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Microchip CoreI2C driver fixes
Message-ID: <dabyolq2klcqkk2f3sek2lrplkhyzhyl3p4oxz33qyjzhyapl7@25lhgjqj3kau>
References: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_165915_030729_F7BEFA64 
X-CRM114-Status: UNSURE (   4.95  )
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

Hi Conor,

> Conor Dooley (2):
>   i2c: microchip-core: actually use repeated sends
>   i2c: microchip-core: fix "ghost" detections

merged to i2c/i2c-host-fixes.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
