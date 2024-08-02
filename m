Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C707C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDSQoghvj2GO/OA7bIuvkRp6yW2cg5ySKqA6fd+xsCg=; b=EJFYv2zP/IX8Z1
	qejrMokwZVWQqZe2izCeVUG9iX6Dild0+1gR5wMkHR/xucxBDqddpsQS5EpBwqFWkoYEiljfktqfn
	jJALOUm/z/Oi7kwPWuJCWLBVHLOOkH3eQxSoWKRCii8D69QNjN+eKSYuNO8xXWtGaQ5R78TwhXIvT
	+mQly1R8hNccbsxBhykROklqkMhdmd3qYhEmkbF0r1QQOa5fEH6I8qbquf5WMG8FSs0QRQ0jkj12D
	h2Bg/hOeBlbgLVbe3nDi1zJgfS1aNXRcv2SR25tYxhniUhc3kH5w5BLCChQFfsgx4BhVtJytMbZta
	TVkiadVknyU2kQJN/J6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZpwA-00000008ZnG-2YkR;
	Fri, 02 Aug 2024 10:55:06 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZpw6-00000008ZmQ-24jn
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 10:55:05 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722596101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=09bf5Wb9MBlcdoXBnx4GnW9Utu1dIVSOsIXiHFTFG9A=;
	b=dlac/QV1bSdgNqoHMEjazmthjGamUGl0Ees0CsmQS8kmrf8FVzMDa8ZiN9237Jn4gaiF7o
	LuAq2DpBsrh3BeBjAShopPw8NCTSlXB8wx1xuCOkunuCzWWIf0Rhd2Olw0817oVP2XkGHg
	CZZdb2tTniETMmXrOPykL/gRsJHqlwIeD5cp4lQJ1XH8Lakjw2+yqKa4cgDM6Y0A+DzuF4
	/VRqo0hJ79q1aFqDfM0dpq73ZP3iOXXXr6flpR+1HKliw4HSrbbJPCxwmdoCcYC/JHZNm5
	Et9EIQLEAFOwNYDCkcPE0HV3/I1FTWQVU0pTU4LP0xV6Cdmsb7a+sQo9pSjYrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722596101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=09bf5Wb9MBlcdoXBnx4GnW9Utu1dIVSOsIXiHFTFG9A=;
	b=gJG8OpeN567ZTbVRv1LMD0vwF2KyonPLw0bAAXHLnF08Xvten74lDQ/UBiTkxEhXdX0OvV
	yZpmbKeK8N2cEHBw==
To: Vincent Chen <vincent.chen@sifive.com>, anup@brainfault.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 vincent.chen@sifive.com
Subject: Re: [PATCH] irqchip: let the probe of APLIC be earlier than IMSIC
In-Reply-To: <20240802075741.316968-1-vincent.chen@sifive.com>
References: <20240802075741.316968-1-vincent.chen@sifive.com>
Date: Fri, 02 Aug 2024 12:55:00 +0200
Message-ID: <87mslv19ff.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_035502_700119_5A27C06F 
X-CRM114-Status: GOOD (  10.49  )
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

On Fri, Aug 02 2024 at 15:57, Vincent Chen wrote:
> When the debug message of driver/base/dd.c is enabled, the following
> error messages are present in the boot log:
>
> [    0.207941] platform d000000.aplic: error -EPROBE_DEFER: supplier
> 28000000.imsics not ready
> [    0.208115] platform d000000.aplic: Added to deferred list

Deferred probing is not an error.

> The reason for this error message is that the probe of APLIC is executed
> earlier than IMSIC. This error also causes all the platform devices
> connected to the APLIC to be added to the deferred list. Because both
> APLIC and IMSIC are registered by device_initcall, this patch adjusts the
> compile order of APLIC and IMSIC to ensure that the probe of IMSIC is
> executed earlier than the probe of APLIC.

And no we are not playing silly ordering games just to suppress a debug
output.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
