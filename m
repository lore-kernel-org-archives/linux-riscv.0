Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28189C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 12:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbpwngwetLTdqVk2GB4yaTVJF6M5CiemNNNbS5ARrms=; b=h3Y6mLBImFggI/
	0sTIMZbKOmaS3pdktq3adP7NSDdK6zd8IO2giLLfpSYqFMWar8/iuiHaBKwMx6kiMQ4eD4fkuQ4y1
	3lSvi2d/bmwPJyfZsTSHQa7NjMMgtjDFHXLN3BZdQHGBl+vxR6N9m8NIZm00hBbockCJ7rmsUrEBN
	OZAKXqvOaTtYl3ZsL8Ew9Xb2ndclYD4Ggy2NGboTnpjb23dVRlufKQDMaxHG+AZmbZwhhdJEZGk/j
	H/jfP95l4HgyVjLSHxxjV0p5KmoS9YdOZwsOsqsnCBO5S/aD81aY5IaFFNsUJQRfqMh5EbBzTchjd
	aI8GTU3lcVcr94L44UOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmDiY-00Ac8O-Fa; Wed, 04 May 2022 12:02:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmDiV-00Ac7h-Sx
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 12:02:53 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nmDiP-0001Qi-Em; Wed, 04 May 2022 14:02:45 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org
Cc: guoren@kernel.org, peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk, jszhang@kernel.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v4 5/7] RISC-V: Move to generic spinlocks
Date: Wed, 04 May 2022 14:02:44 +0200
Message-ID: <3428595.iIbC2pHGDl@diego>
In-Reply-To: <20220430153626.30660-6-palmer@rivosinc.com>
References: <20220430153626.30660-1-palmer@rivosinc.com>
 <20220430153626.30660-6-palmer@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_050251_937212_1DA9CF7A 
X-CRM114-Status: GOOD (  14.17  )
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

Am Samstag, 30. April 2022, 17:36:24 CEST schrieb Palmer Dabbelt:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Our existing spinlocks aren't fair and replacing them has been on the
> TODO list for a long time.  This moves to the recently-introduced ticket
> spinlocks, which are simple enough that they are likely to be correct
> and fast on the vast majority of extant implementations.
> 
> This introduces a horrible hack that allows us to split out the spinlock
> conversion from the rwlock conversion.  We have to do the spinlocks
> first because qrwlock needs fair spinlocks, but we don't want to pollute
> the asm-generic code to support the generic spinlocks without qrwlocks.
> Thus we pollute the RISC-V code, but just until the next commit as it's
> all going away.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

on riscv64+riscv32 qemu, beaglev and d1-nezha

Tested-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
