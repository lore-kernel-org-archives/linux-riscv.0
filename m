Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53FBC00140
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTRG5KIbTaF7XpS4ls/xn8iX1CxAxFE6GDlvbciYAlE=; b=VGo1l3f8DOUBf1
	hmdlCw0hWwwvSdPRWeang1+px4xT/xaaud40ZqgNWERYD5q201BGnuQ4JYP7XU5KYCG15HUn/yrOD
	3q1ODMjamDCWMpizZaECQm4Z5Dljiz4ngv68rgLQUmgMa4840+FacoyxO05Efd3LLfMj8mRtCEY52
	Qp+6YapYJgzXJBd7512OLAN+QP7fpVfMKgFQtSnvQWrk3Z9CsaKmZSx6ku2BZuxJ6jIyw8zBjujhY
	yaly455WURW/SiSQ2bYRwlRU63DtvUfNjADQhDHm8Gx3dVagQEdt4zThHVaiFEM//ZJvgV1Dx6Iy2
	KgG7EolFn+cCtpZq06hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLSf-000Aiq-7v; Tue, 26 Jul 2022 14:23:01 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLSZ-000Add-Hw
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 14:22:57 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5C58310000A;
	Tue, 26 Jul 2022 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658845372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kmoRPsvsm8/UPlpLddpkV5iEJSN+p+fT8s/uaK/xzVM=;
	b=kpsD3BJVPq0forflOECwiASHDS+dUHl45KSWX/FSmavM0AJBcnnOYQ1S6pQnV3iw0ulHwS
	e79IuE8LaSAml2eD8DGR4l7BUTndzWkvgszyjJcS6A8YPJuNZXy/0H4bgvW6mABel4+kLf
	9lSlZC9ZMsNWnp6Oz07XcygRWx91+cWHlkXCWGbT4rkBzl7Bc4x5LqUTR/U+7iT1MKZZXz
	fTD3mgPHjrlITLFfouTC7cotwjQKj0hYlTC7GraRMui/B2opQ0QDvJi3mp13ZwFJ49bpHS
	HiHExpNuWKrRPp744tozPKbFuNDZLQ/GrBB7fDQ6I3MSTHQtpvVrhvBJqvz+eA==
Date: Tue, 26 Jul 2022 16:22:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: lewis.hanly@microchip.com, conor.dooley@microchip.com, trix@redhat.com,
	daire.mcnamara@microchip.com, a.zummo@towertech.it
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: remove 'pending' variable from
 mpfs_rtc_wakeup_irq_handler()
Message-ID: <165884535076.3156642.16325816554140473959.b4-ty@bootlin.com>
References: <20220627205943.2075043-1-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220627205943.2075043-1-trix@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_072255_761367_34D62C42 
X-CRM114-Status: UNSURE (   8.01  )
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

On Mon, 27 Jun 2022 16:59:43 -0400, Tom Rix wrote:
> cppcheck reports
> [drivers/rtc/rtc-mpfs.c:219]: (style) Variable 'pending' is assigned a value that is never used.
> 
> The fetched CONTROL_REG stored in pending is unused and partially
> duplicates the functionality of the later call to mpfs_rtc_clear().  This looks
> like leftover development code, so remove pending.
> 
> [...]

Applied, thanks!

[1/1] rtc: remove 'pending' variable from mpfs_rtc_wakeup_irq_handler()
      commit: 3fa0cb37bda9d45d3c6f07e67051e7118d3ffe63

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
