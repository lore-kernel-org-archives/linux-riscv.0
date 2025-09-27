Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AA6CAC5B8
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Sep 2025 01:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRvIpVD+5jg6dMXpDK68fKkYMlnZgxzbSKqkyG92sMA=; b=XzzvSRHtksTkBI
	ihLtH5f8dFBbVCS1pcoGmiUM2K/cJwgECaWmAz7l0UBhjgyRNxavEQh68ZSnkCJE+U1pQKE5xG6uB
	l4fhWmFX4A//i+9ugeB/2mgoIDpMDziSWGI2/VxuxsDUJ5wxzkXdIJ0i0vzzyvoRndA/NmXtZafl7
	ELPPkMfctG2w5yULKuCihBDxEyfQzdt7kZusbgE2OtwQGv6kXFYygUj1+W9NhrvUw/6nZ4vobjz6D
	FhLeFLziGSIOmUhS2j8m4nyNOEC/K6J0ePEzB1Nmp5NXSFJIpY2tP/+N4OURyxiiqSHy1yASg8FnO
	8E66Yzm98BAS3gxYbFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2K0Z-000000068F3-3VhV;
	Sat, 27 Sep 2025 01:45:55 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2K0X-000000068ER-2yJF
	for linux-riscv@lists.infradead.org;
	Sat, 27 Sep 2025 01:45:54 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1C029340D0A;
	Sat, 27 Sep 2025 01:45:51 +0000 (UTC)
Date: Sat, 27 Sep 2025 09:45:47 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250927014547-GYA1336612@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_184553_769619_DFBCC0D0 
X-CRM114-Status: UNSURE (   7.57  )
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

Hi Troy,

On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C with interrupts disabled.
I feel it's more proper to say
s/with interrupts disabled/in atomic context/

I've noticed that K1 I2C controller support three different transmission mode:
 non-fifo, fifo mode, dma mode

while you are trying to implement pio support, I'd suggest to think one
further step in the long run - support more fifo/dma + normal/atomic features,

Personally, I'd like to see fifo mode implemented before adding pio
support, as it will bring quite significant code changes, require heavy
code review effort. And yes, this will put more demanding work on your side
and may slow things a bit..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
