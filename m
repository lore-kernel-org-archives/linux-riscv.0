Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A88EE3F3F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 00:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=of+ycZuacsnOh+gmSVHUAHKkIXco+TSgXafI500hkHM=; b=QleEqlBEL3M74n
	SNwPZI1fYNoubZfhOKQzF2MfujToKU5ZDU361wPe9u2vHzw8cNVaw64zNjNtlX25jUWOTLnHQr5ZM
	CKcKlZOynnJPRk3XtdTW19n/UE4Iprg2TzFoDQKOZOuaM/pQMurmsjaFGWhmTwnuuSZK/2LZDCh3a
	GjCtjGA2UWoh7bQLqIeU6CURfXoL4hYm8sBosPQKv/4a5H2ALE2VE6JGphXhIQmv3Fmp67hT87K0y
	dveA784cH9Y68Z0C+JI4Z7LwXgILa+SdBL1dSzKTfQz+ZWldrLn34G9jdSsXHrEXP3YHQBT+5YfxC
	uhn4l3UhBrKy7dJYlI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDhs-004LUc-2L;
	Wed, 13 Sep 2023 00:26:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDhp-004LTc-18
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 00:26:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 294DCCE1F6D;
	Wed, 13 Sep 2023 00:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64918C433C7;
	Wed, 13 Sep 2023 00:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694564763;
	bh=+RMVnh4vUSvr5uWcJ39FH0hoqM33SqQBVUGLKKzUaXs=;
	h=Date:From:To:Subject:From;
	b=YUlp8ks6CV4lBlSw1ycHjineoWuWrVpyKSo80C7/5vNGz0cNjaAkvSZYG62L5l1Jw
	 CwVsYFCpbBCuhZMZrycmqWN76wEY4iMzIqtZKnGq3wIV3CXGNv9aN7VQsh1hrbUI9H
	 R+qViLW1ZGBPc8X4Vm9OsofaZZDIuBWZn/Abseztebfr34xmox1uZKdic2t2HDPiac
	 wvkZtsl69Wvik137/pBrOYb+WBJG86qf8hwIFRS2Vj+u/bTyjDNmTExrmeIN9tSMj0
	 W/aaqMxfrGk7lnjT/EELKI+WVX2Vrh9+aCYdBCUN5OGVzBBKkvFFXnY1T3LD+lWJWT
	 Sb5T/PnQlfDPw==
Date: Wed, 13 Sep 2023 08:14:08 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: linux-riscv@lists.infradead.org, PalmerDabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Evan Green <evan@rivosinc.com>
Subject: boot time regressed a lot due to misaligned access probe
Message-ID: <ZQD+0BWNU8wlnC9d@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_172609_705142_95E6E2D5 
X-CRM114-Status: UNSURE (   6.08  )
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

Hi all,

Probing one cpu for misaligned access cost about 0.06s, so it will cost
about 3.8s on platforms with 64 CPUs, for example, milkv pioneer which
is powered by sg2042.

I'm not sure the reason of probing misaligned access for all CPUs. If
the HW doesn't behave as SMP from misalligned access side, then unless
userspace processes force cpu affinity, they always suffer from this
non-SMP pain.

So, can we only probe the boot cpu?

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
