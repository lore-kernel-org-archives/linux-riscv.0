Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5257DC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 13:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPVX3MKtE4mmY2fpX5COTMEDZ3o19GfGyJtcyoM7OFk=; b=mG4YXU4EOiTxHF
	U1d+HpqDUmCtT5inK3g6FuKB9/IqOAFGo70ZFQ2my18gKJwkb6INdfRXxAA9X+U5hnbhW6ytyu7MP
	EZAzGH7tZD1mZYqnij/VDWYrr3EP57gVudHDLMKzbwJkExEVRNLIl5mSHU9A8Br1ZP4JcEBIHJOpy
	OOOKltxXotgGfd8syd54QGOPueY3loSg7c8gwY2l0YmxVHfgKr828qD5HbuXF+hTA8gBl3pgV7NGR
	69qNXi9efvjid2zpjWIynwQv2qDmQX98sHwTWKaeQZOztvbCgqTx0Y9RhRvYOwDG8WuvIwi2QVfUS
	9Do0iS7HtlS0UCgLccPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seaLe-0000000A0bU-1hqq;
	Thu, 15 Aug 2024 13:17:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seaLa-0000000A0an-1ay2
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 13:17:01 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723727815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nsfL4lSYcJUNCgpw/d4PnpralW8hjkD2gnw1p553Xgw=;
	b=XYVxa3vgapYFX5Gv1T1I2LtfFjFq3Jpz9d1PRcC2mgs1xXpZ0A820zXlq7R6AiTY+9IgDk
	ewGSqJiODtQE4SCCc71ede5XByFNoAJ2i2QsbwGTUaZvduWIqUzTQeMXnhNOE9utj+hpgL
	Ep3vVR/gyzoKjufu6SEWj8sGM5I9PdUftr+w+waC/5VyuV/tiH2ryBfX0NKkMZ0217oRu5
	sssP4FcRXinB/bbVi3kujuDcbV9+DLXC+iDsTFx0RVr5afSNk+LFMrgadSa4OAr4f3kqAh
	zJ5X3cgVGGskfIDs1lK+zGqwVL8bDHLLja4kkEPH5xgj9gn8GGGAXLPqmxNzEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723727815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nsfL4lSYcJUNCgpw/d4PnpralW8hjkD2gnw1p553Xgw=;
	b=zeMj9je9tFNfPbvoemRp0rsQO8v3oshK7uBtUNdhWefQRTTS2QO1EzZURv8y+5F5F2Ah7+
	9BPw4lAGgddbdpBw==
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Emil Renner
 Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Anup Patel
 <apatel@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland
 <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
In-Reply-To: <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx>
 <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx>
 <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
 <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
Date: Thu, 15 Aug 2024 15:16:55 +0200
Message-ID: <87plqalyd4.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_061658_585397_84A6757A 
X-CRM114-Status: UNSURE (   9.91  )
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

On Thu, Aug 15 2024 at 05:14, Emil Renner Berthing wrote:
> Emil Renner Berthing wrote:
>> 6.11-rc3 + these reverts:  https://termbin.com/q6wk
>> 6.11-rc3 + Samuel's patch: https://termbin.com/7cgs
>
> I think this confirms what Charlie found here:
> https://lore.kernel.org/linux-riscv/ZoydV7vad5JWIcZb@ghost/

Yes. So the riscv timer is not working on this thing or it stops
somehow.

Can you apply the debug patch below and check whether you see the
'J: ....' output at all and if so whether it stops at some point.

Thanks,

        tglx

---
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -2459,6 +2459,9 @@ static void run_local_timers(void)
 {
 	struct timer_base *base = this_cpu_ptr(&timer_bases[BASE_LOCAL]);
 
+	if (!(jiffies & 0xFF))
+		pr_info("J: %lx\n", jiffies);
+
 	hrtimer_run_queues();
 
 	for (int i = 0; i < NR_BASES; i++, base++) {



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
