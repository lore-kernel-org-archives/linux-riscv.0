Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E43A606A325
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 21:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZZe/M2f3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=bhBtXJ6g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GuokeWWtc2zrLhjezx6XCPg3EKVgEMW07/Tr+MRi6Vw=; b=ZZe/M2f3qEgAfiKs2MYuiqpbeJ
	/p8DtDt+CdCvxGHLjbMhDodylGUK3J9xW3KdKrrxSpKngoP+ADlv3NkyvPHAqzNzPsUj7qkMd/+Ea
	+hVvifVfrti9xiKCfVx+RO+jI5oukLd2gdzY9lIjtpFEsccWj4zRMHqSvEQXARRkUoaNo/jhb47dM
	ZTPlvXqZqklY92XsVY7xFYKbx17VYZDbWAlqvYFhcR6V+qcnZtZcTVp4oz4HEktz4oDDZmynlv8sc
	FF9R0WMHu+Y/IvImwRVAw6v4ltr5RvDUSq8ogeJZ2ahZ583xRZ0VFwK5mbap4hvMvEj17XAnN4KOb
	FujK6Cqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtLh-0000000531a-2b4I;
	Tue, 10 Nov 2026 21:25:49 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtLf-0000000531D-0ogc
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 21:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=EdPrvIoeQkOKljOBokRv+hpyTWHif36ZDAjxUxoFpUA=; b=bhBtXJ6g8peGt6aBT/og1oe/b/
	/ldqn7fRO1oFAdW7RZz2uJqaAGB3ufJBSlbIgwlACxaY//0iQUVtys0GbXgvr+eSZe74pacn3YEZd
	SMzYVU1dk2TAMKHGBBH0Si9JnUrfJRsvjTaR06OO4+d+kGWPvWe+2Iqyz1ORL4RUgm7+WURelWuz3
	05fQR6RpTzQbZkx1InA26LPWzKrfNBszNxzQ/D9Hh0yAWwIxmtpIez7B2GOjz4Ffsr5mPcuaB+Ljm
	6hlwP0gRT17/jKMitePEYdcpqXhe/abx8lzM3sJ3rBoXMV/olZlJHUe05p0Tw6CoUxOPdC0wAPnIQ
	R79+LVqg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xQtLb-00000006KxL-0RIA;
	Tue, 10 Nov 2026 22:25:43 +0100
Date: Tue, 10 Nov 2026 22:25:42 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C
 transfers for power-off and restart
Message-ID: <avOL1mCkI4YSaDeO@aurel32.net>
Mail-Followup-To: Anand Moon <linux.amoon@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20261110061429.2036-1-linux.amoon@gmail.com>
 <20261110061429.2036-2-linux.amoon@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261110061429.2036-2-linux.amoon@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_132547_257792_0BAB7847 
X-CRM114-Status: GOOD (  16.11  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anand,

On 2026-11-10 11:44, Anand Moon wrote:
> The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
> to access the PMIC. However, these handlers run in an atomic notifier
> context (specifically within an rcu_read_lock() critical section), while
> the I2C-backed regmap uses a sleepable mutex.
> 
> This triggers a "WARNING: suspicious RCU usage" warning due to an illegal
> context switch in the RCU read-side critical section during shutdown on the
> Banana Pi BPI-F3:
> 
> [  563.803475] WARNING: suspicious RCU usage
> [  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
> [  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in RCU read-side critical section!
> ...
> [  563.841445] locks held by shutdown/1: 2, last CPU#0:
> [  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0x230/0x29e
> [  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: atomic_notifier_call_chain+0x4a/0x1c2
> 
> Replace the regmap operations with atomic I2C transfers to avoid sleeping
> in an atomic context. Preserve unrelated register bits through
> read-modify-write operations and check for atomic I2C support before
> registering the handlers.
> 
> Obtain the I2C client from the parent device and verify that the adapter
> supports atomic transfers before registering the handlers.
> 
> Tested on the Banana Pi BPI-F3 (SpacemiT K1).

While the patch looks correct, I am not sure this is the correct 
approach, as opposed to the one proposed by Troy [1].

Indeed bypassing regmap and using i2c atomic transfers needs to be done 
by all affected drivers. For instance the VisionFive 2 board, which use 
an axp15060 PMIC is also affected by this issue. And the corresponding 
driver is shared between architectures, which make this kind of change 
more difficult.

For the BPI-F3, note that with OpenSBI 1.9, the reboot is handled 
through the SBI SRST extension, preventing this issue to happen. On the 
long term, I am not sure we should keep this driver.

Regards
Aurelien

[1] https://lore.kernel.org/linux-riscv/20261104-v7-0-rc1-rv-dis-int-before-restart-v5-1-956ec09c900d@linux.dev/

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
