Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73B2C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 11:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHCDgieQBYegbhsNhw7/r+CpdhDLWr0fPEVnMhj+MP8=; b=sEwceZc2Rapd9a
	LoFoXgSged4kGSUwrHzMP6Gz9VTlOgxoSPdwha5RBqzvkGcNAukMKSe3iI6xK8vp99sIPXUUXbgNB
	ySZhMQqJ8UjZ1Ty0lmYJ+IiETZ+XrBj3RUBYZxQeYq3GiWG57Svw9mQQtE+JWNnQEMglJW2nYMkAy
	/e3loDR93a1w11XoO98/2o60k0UvLRrL9e8DQAdBfZUfak8QLi33H8NnSRtvOrMgGnsgg2aFhm9tE
	il+Ex71x97lBTBsxvtZf+md4abDl2AWK1xTUy1oMZLLXpCRcsTXNDO9Hf6CjK174PllItk6063XDP
	nl+pyQcuNkpTJQQOcx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmDdi-00Aamo-3D; Wed, 04 May 2022 11:57:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmDdf-00AamK-I3
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 11:57:52 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nmDdM-0001N1-BL; Wed, 04 May 2022 13:57:32 +0200
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
Subject: Re: [PATCH v4 1/7] asm-generic: ticket-lock: New generic ticket-based
 spinlock
Date: Wed, 04 May 2022 13:57:31 +0200
Message-ID: <2180881.iZASKD2KPV@diego>
In-Reply-To: <20220430153626.30660-2-palmer@rivosinc.com>
References: <20220430153626.30660-1-palmer@rivosinc.com>
 <20220430153626.30660-2-palmer@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_045751_622497_41211527 
X-CRM114-Status: GOOD (  12.10  )
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

Am Samstag, 30. April 2022, 17:36:20 CEST schrieb Palmer Dabbelt:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> This is a simple, fair spinlock.  Specifically it doesn't have all the
> subtle memory model dependencies that qspinlock has, which makes it more
> suitable for simple systems as it is more likely to be correct.  It is
> implemented entirely in terms of standard atomics and thus works fine
> without any arch-specific code.
> 
> This replaces the existing asm-generic/spinlock.h, which just errored
> out on SMP systems.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

on riscv64+riscv32 qemu, beaglev and d1-nezha

Tested-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
