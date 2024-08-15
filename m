Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5832AC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 14:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3iXLfsr34kTyKVWJHO6dyJtQwyyFH2RDOlns/VxdYI=; b=zSSceo4hBDpDXo
	1wMaP+R0ouq24IywnrBQupt4LnI/LDUR51vyaSxsRrCJMFhpeBR43fYSz/7zj1zRpqn1j7BVT1ysS
	Fs2uvkZSTplPNv9XIjrxQ2/fJy1DTjr0FCM4ARjDmr78MT1noPXBOn3iSQOkIAjn9SLTUO9L+bWUx
	R7TyFEHNo6CXVnioJEGM5Ux6g2m46CmTdKf+K1fDIkqfdbbP8LHNfZ1calkc2dWdKFjkk7eScKpYv
	l6Y+nvLdxOv06CyWaSI3hBKqWOa9T42dJCCGWVI6Ga+wInX6zQ+qREm+6SePBrUb8dd0qP/E5Y44U
	uV+wjfLEl6VK2k7jtKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sebCF-0000000AAAN-0irp;
	Thu, 15 Aug 2024 14:11:23 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sebC9-0000000AA7r-2ooE
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 14:11:21 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723731075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MYjvollJesTtLslkUYJNxH63AP1fPwf99+zNcpu4LzI=;
	b=AVZ6dA8zbr8yWSpoLeCRJQ0yENWLGxaOIgkvFE5/HwbHqg4psAUugYyCC0uzYX8Cue4/s2
	jJp2E59k8QTNhFSdO+EU/t7A6WDYteD7wT1eE+ARj2GwtaBDA0tJeqFcfoGoBEZkw5nzSy
	AdK0HQAbuzwWlb6L9LMh5LFnKY1B5Xp5Y4zCLYzSrHPCKnhcKLzvioZsO19237yPGXVHwG
	Jv2xMJ1u7YvQN8rFbHf1yRMbHhxf3AxW+40G6aklxCXErIcY88uxIFN/91Aw5Db4qjlPwG
	i1shN4TXa/v6x5SwWPlJeMzLmgeTaOIfJLmaWz7suGjhZFTg14qCXEAmaIGcHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723731075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MYjvollJesTtLslkUYJNxH63AP1fPwf99+zNcpu4LzI=;
	b=EwKkpvFcNgcVqMSLQHel5aNWHCit5L2msYI4Pn3qHFBhlJpWGd6cDU26O09+fjTNXAVWp0
	dwpIM0JVYLkdFgCQ==
To: Samuel Holland <samuel.holland@sifive.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Anup Patel <apatel@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano
 <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
In-Reply-To: <686d61c4-e7ac-4dca-a7fd-decdd72e84d9@sifive.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx>
 <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx>
 <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
 <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
 <87plqalyd4.ffs@tglx> <686d61c4-e7ac-4dca-a7fd-decdd72e84d9@sifive.com>
Date: Thu, 15 Aug 2024 16:11:14 +0200
Message-ID: <87h6blnaf1.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_071117_881594_979CB2DB 
X-CRM114-Status: GOOD (  17.09  )
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

On Thu, Aug 15 2024 at 08:32, Samuel Holland wrote:
> On 2024-08-15 8:16 AM, Thomas Gleixner wrote:
>> Yes. So the riscv timer is not working on this thing or it stops
>> somehow.
>
> That's correct. With the (firmware) devicetree that Emil is using, the OpenSBI
> firmware does not have a timer device, so it does not expose the (optional[1])
> SBI time extension, and sbi_set_timer() does nothing.

Sigh. Does RISCV really have to repeat all mistakes which have been made
by x86, ARM and others before? It's known for decades that the kernel
relies on a working timer...

> I wrote a patch (not submitted) to skip registering riscv_clock_event when the
> SBI time extension is unavailable, but this doesn't fully solve the issue
> either, because then we have no clockevent at all when
> check_unaligned_access_all_cpus() is called.

check_unaligned_access_all_cpus() is irrelevant.

> How early in the boot process are we "required" to have a functional clockevent?
> Do we need to refactor check_unaligned_access_all_cpus() so it works on systems
> where the only clockevent is provided by a platform device?

Right after init/main::late_time_init() everything can depend on a
working timer and on jiffies increasing.

I'm actually surprised that the boot process gets that far. That's just
by pure luck, really.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
