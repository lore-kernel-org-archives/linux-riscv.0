Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3A6C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fGL9C0Tqt4xFoa4GzZeY/VD2Pyf4tW2dzsVB52lO0w=; b=UjUr0adEf5Q7wE
	gBnLKYJdAkARoOplFqpsruSABQWE3dQav8fqqANQcsqphdejHw9ln26lvy9r+APqsFYyH+ELvqa1P
	306cy4kZY1soaPPUq7jF0DKXgEBKI63hO3JhTlWpGcQct9E89dyevn2/7/lPSsLZKujacgcWauUCT
	jVh9Q0NyzlNuciMuucg3/36/D/+5h0lYwCOsKJPvN4VoyPqG4/SJnBe7DsFTBbSxQtMwT3WwNWHof
	f32sXadxgN5qwFr9HoOiiIhWyEa6y5pEV3vIBF0ar2C6lrzwVbTIj+TNoZlpr0t4lLBVRpU3S4htb
	FSK+lCLbXl45Ps+Zirsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCik1-005cht-0G;
	Mon, 11 Dec 2023 16:02:45 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rCijy-005cgY-0w;
	Mon, 11 Dec 2023 16:02:42 +0000
Date: Mon, 11 Dec 2023 08:02:42 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH 01/12] arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
Message-ID: <ZXcyolSnTj1sts33@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208055501.2916202-2-samuel.holland@sifive.com>
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
