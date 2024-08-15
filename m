Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CAAC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 15:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMolV3+j152wHm7lG5J7mG+tprG0ziem3fYJIkCCtIg=; b=3ASkQkYj/Upal3
	o4hcFVrAMa6Inyne7B8VGp8312jEzOqaBmaVS8xzaTujAAvybQar2Sqp1VXUfvLaSYg9V0RI1bVgQ
	UprHOXhV3cMH6mLIg97XglGVkFx969IX1sdCWI6qjC64RtNyeXGFTIAjlzFAgSiFHY4UXErBHQTvn
	rTiSTtP7oOR13KKr2E8wJTHPoQv5OALlB/nfScldJ8b+9HaWO2THfFR86F4DE1VFkeRpGzu5rh7Xw
	91pmpdwURnMW3/zzJ4i6UUObCBuesJvLmMgbe8yB0ocRYviZ9KfPZvwvuun5m4WJofi66z+1YGtyJ
	CiyTrhRYHdOpscQmkv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secBw-0000000ALXE-2Ven;
	Thu, 15 Aug 2024 15:15:08 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secBc-0000000ALQX-3b1F
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 15:14:53 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723734886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPuHrZFx778hIDCBjTHxN+nZoZJhuNLfJ7MygK5qf7s=;
	b=IeuYPepvPZJ9b1rhkQ533WHtEU3evyQekNsqApqteeceqLiw0RQuiRauBDeOWbo2IO5yS5
	wl+/NZ8uL6319HJxMJwKIz8IrbG3di0eNXj6r2zBwg/dUml/GeYb1KVXBOsuoiLZ1zefCq
	TSPkuXmbpC6J/v3gAlDPaIm5qfQF/P4yz0xOTacuXk18hEGvmv7pZXnQdNcVZQOdQh2cMI
	wz/XddR14znnDNYufDjhznkECv3Co8LEBd0zJCEHrMPbNqlRQthISCUBiAGCOjSHJR73Ia
	mnP057QIsVRjDejSdqxoudG3+/3J/atbprE+btzkFxb/X+X/sX851k6Xl6yprA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723734886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPuHrZFx778hIDCBjTHxN+nZoZJhuNLfJ7MygK5qf7s=;
	b=/lnCCE5ZkYhDXIuRucYB2dv8d9MiH4kcasDEWTtt2b76j+ZHQy+ADQAsdCliqQTV9jX5jY
	0lsPltapscHbWrBg==
To: Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <apatel@ventanamicro.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano
 <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
In-Reply-To: <be1db8f5-af55-48a4-be7a-5e8a1a5e25c4@sifive.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx>
 <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx>
 <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
 <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
 <87plqalyd4.ffs@tglx> <686d61c4-e7ac-4dca-a7fd-decdd72e84d9@sifive.com>
 <87h6blnaf1.ffs@tglx>
 <CAK9=C2V7oL023=u6nodJs76k_0yHZ8PTJs=n1QFqDWCcCnG9kw@mail.gmail.com>
 <be1db8f5-af55-48a4-be7a-5e8a1a5e25c4@sifive.com>
Date: Thu, 15 Aug 2024 17:14:45 +0200
Message-ID: <87ed6pn7h6.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_081449_065233_3796393F 
X-CRM114-Status: GOOD (  10.00  )
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

On Thu, Aug 15 2024 at 09:41, Samuel Holland wrote:
> On 2024-08-15 9:16 AM, Anup Patel wrote:
>> Almost all RISC-V platforms (except this one) have SBI Timer always
>> available and Linux uses a better timer or Sstc extension whenever
>> it is available.
>
> So this is the immediate solution: add the CLINT to the firmware
> devicetree so that the SBI time extension works, and Linux will boot
> without any code changes, albeit with a higher-overhead clockevent
> device.

That does not matter for the boot process when the sun4i timer becomes
available afterwards. But how can this be retrofitted along with the
kernel update?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
