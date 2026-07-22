Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718F8C44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 12:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=in3WFu8nXTEygiNW3RhBLZuID0ezcbf1jNEwHcqOcoY=; b=lPrz4Q3HIPIk+/
	zxj2y4ZhUKzpH+KZ1nTdi796LMcDgKwkiaYOEY8/EaLu4yECAVRkrjbhoiRzbDXvrOq0cN+ldKoFz
	5clyOX774r1KQO8Hpi9+WLSAKwbuikEGUGp1AaOWWxHx6WiBz51LQyDvc4xDodidcDRz7Rg7TkadM
	ezjraEJ5+2W6BlMXgjdQRxb3SfwRcStC6WNdYkIqlV4sFhf3et5zay17x7x71SO19NmJw/0xH8etz
	L7V5t5CPmfRyfWW1uGuQeog9PWpaGYEnRVAy1E8tBxyx0bmNTJKV8GMAVoNNeVNEqvPufDBo//zHM
	B2qCSsiz9RqUoONiVeGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmW97-0000000Bm0q-1meZ;
	Wed, 22 Jul 2026 12:33:57 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmW95-0000000Bm09-1Mzy
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 12:33:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso139449935ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 05:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784723634; x=1785328434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QxIfKuOVaE3EcHJclM4dn0Mc9MrDfV6Rgh6T8FHUwMI=;
        b=syGwzo9URj9YElQSGnyw4aHHLNEzhSXumhyHrNA6+9ZJ3TgGwgHzbzMvSHTkF4UmQO
         1S48/f4SLM2gAPqTQwScTaSXJVDj5S3zbBqwvwkUZ8468emIgDlamEacDPQ27tyQBc8x
         4XPveKaK/tRV6t/nbxTUBdL7xxqCZ613wyZb/s9tuJUOKTLzW1sg7vZTw01jcjj4oLa+
         JkYspO5J8O9FzuOxkSLYj//zsWo71EQf8ZOUCpRndKHtkt/XbyCp+DS1kWJ824KC7TD3
         +CcY+nd0/vKoe15D+2Ktl/ru4IpYd/MjbOmk9K1rAsd2CPdcIanJp+29vJey9N3NlR6s
         l2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723634; x=1785328434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QxIfKuOVaE3EcHJclM4dn0Mc9MrDfV6Rgh6T8FHUwMI=;
        b=UnIwX/BQwDHF7ECrjADVjyO4BDTeNMMynDxvWciw/G2pJF3XvBwgIoWpC7wvYmeYem
         eXngpSi84ViSl27sjPcIYrbg+eM8RK7cKvZQRWi+PKOfvaZA+QyyGxS856OC8rFdmj3r
         5DEcO457aWlyX2Zrvrruq4SjOq89YCnoZnEIOKFXTEpGRqqJL4hp8zZcK4yPhsKxKqiG
         Q5YLO5HzTrA/AT4cm3SHSgsezJUfQsiGNumkhb43bMmmbxUeha4Vrt+uhyQTItB5x3Uj
         o0tfo8Qw1Y/Mkl6Oc6xr5pRzYMEU0MYfaJ9kCt443LmLzefSNHQ4SdC4z4CHbnKfCOFz
         xbIw==
X-Forwarded-Encrypted: i=1; AHgh+RqkGX2r5v8QhutnZ82fCmUkLPcB5FBic0L/dhUlPeo902CmVXyFmIx1EoGsCH+sH3TVZ+sURF1h0b2XNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa9IrZuds/M8FXSH6IhC/RyRcR1vFal/wtZiFxdDNStocOovl0
	MTvukQLMG9m1CklHrfgt677F39yZ8GgaAzhoNrO8OejbDf5TpT6cN1LJ
X-Gm-Gg: AR+sD12sDxLJu7jBwnbvJ3fGYJ4eNu7wsTvSJ+vWKegHX4C3tLi5X4o1Zy9LdMEyO6X
	nt2MfHVbkw/oWbCzCmLbzXyqO49zhtZ3AcfBCVpkl1CO6KqSgmv1Gzuc9TkPUu9oNrlKhSKBwJ7
	jKlHqmitRk+YfSHFeiNwqg8BKM43adVQbRPyLsd+qodTHp/eCJ6TUmJfQEF9WpreKtoXE8do4P4
	g3R/iludpZ+DPPNoIvFr1E/KznRNXsqnGeFYkR5j8eP4jDkt23ZIJHYiOnb93c+s24L23mO1jyu
	ezCRwq1ZN1ULN6CLCwpIO8nGfKzvg3/rXkHTz6iDMoO9D11OAlo16vnp4EMZU437FtItTEXsypf
	/BV1vdsOQRO32KFj3if73YJ0rQjP/VSeGSDu4pH5Vuat02kTc9UTzVGXv3SFXjEIzSAKyKQ/Lli
	iyXeq5h9Ojkv8dxe8CKmmu
X-Received: by 2002:a17:902:e548:b0:2c8:4c29:afeb with SMTP id d9443c01a7336-2cf348213a8mr249494965ad.8.1784723633958;
        Wed, 22 Jul 2026 05:33:53 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf96ac33eesm7214735ad.72.2026.07.22.05.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:33:53 -0700 (PDT)
From: "Yuhang.chen" <yhchen312@gmail.com>
To: bigeasy@linutronix.de
Cc: anup@brainfault.org,
	atish.patra@linux.dev,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	zhouquan@iscas.ac.cn,
	"Yuhang . chen" <yhchen312@gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use raw_spinlock for VMID update critical section
Date: Wed, 22 Jul 2026 20:33:50 +0800
Message-Id: <20260722123350.3697232-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717065137.FQ5Ax2W-@linutronix.de>
References: <20260717065137.FQ5Ax2W-@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_053355_361406_8B730423 
X-CRM114-Status: UNSURE (   8.29  )
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

Hi Sebastian,

thanks for having a look.

On 2026-07-17 06:51:37 [+0000], Sebastian Andrzej Siewior wrote:
> Here you state _why_ it must not be preempted. What would be the worst
> that could happen.

The worst case is an unbounded hold of vmid_lock that stalls guest entry
system-wide. On rollover the section bumps vmid_version and then broadcasts
a guest-TLB flush via on_each_cpu_mask(..., wait=1) before assigning a
fresh VMID. Under PREEMPT_RT a plain spinlock_t is preemptible, so the
holder could be scheduled out while still waiting for that broadcast flush
to finish and keep vmid_lock held for an unbounded scheduling delay; every
other vCPU reaching the VMID-(re)assignment path on its way into the guest
would then block on the lock. The rollover is otherwise a short critical
section (a version bump plus one IPI), so keeping it non-preemptible with
raw_spinlock_t bounds its hold time.

I'll fold that into the commit log.

> That part starting with "Convert" belongs into into a new line.

Will fix in v2.

I'll send v2 with both changes.

  Yuhang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
