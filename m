Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E483DC54FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 06:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pePjK7cE6RQLPMN3pxBHyPc5VOCbF7+n3P//F1/Zlk0=; b=P6gsDLKTEiKqYK
	IyH0/ceoettDeE3FwIXgzbrKEI+MNNJiFA8Y3Tmd5tePF/solH/X7UcrmzCw+sS4VW+WxoHe3T8x3
	bEfvpUOdTXwp/YW7GFcdrvSUAYnqexMHou81/QE7/QkVX4T3Qia1C0ZdBR0pC+b0Ph8jS2zhvAZfj
	WAR1UrBetxktq+X0u7hGcF9XYKFWQB3SQsWRMlJ1j8Xw5owfqcyxqusEo6N+tVFmwAwEz6tECoAkQ
	Jpfxnc9bWIYVuyMXJq367nssxPLsdx/jfsjzowI7mRwjUP9eU/GGFUrMovUdTcY/0nGYI0sNsPiO3
	lt9vDMs6xnzM09C4acuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKcH-00000009eOW-3XUu;
	Thu, 30 Jul 2026 06:51:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKcE-00000009eMU-3cBt
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 06:51:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d02b4c3601so13960495ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 23:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785394298; x=1785999098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icMXTnzaSJ6+MSeJ5Apat14mapNo5PQAIFNRe+YMLec=;
        b=l0Pcl6JGw0vBDyNXKCv82lvzU/Nx2XGGljRk5bWuWMPS+Bb+L3+G+En227dCUNQmHd
         2KeSPR67cPYWgdn9DQ6+2vz0JAhFlh3/h6O+3ZBU1M3tmpdF/aRzyw4+B1JTeZejwBTV
         /wW98UUAQc+d+QMtN7t1owYxyF1ch5xXcOA2GNAKARdxew7ybXgcaBu6Oq8JUVSEgG9j
         bLQF8+tTHW5dhtMdnoL5X8GCxAklwi5riKVuSJUuCEfYeUFua/yNqY16iMMk0HdQv0gb
         s/WuNB1L9o55QSwTyPxXQhJ14NhPItzc5HbQ1hjOw08EYae8f7zVGkl1zbGAnX/toDVg
         e35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785394298; x=1785999098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=icMXTnzaSJ6+MSeJ5Apat14mapNo5PQAIFNRe+YMLec=;
        b=pZnnAEXHMTkK41bReKk/aFkrCOY8woL8lShoUTHrI5+ceaVqLCKZ3crL3SBG5+nr3x
         TXQOXCCzOHAZ055RIADEcozdBkuEOyS/m80CRhgiIl1Dv5gBcgfytyDKncWftgA/F2J6
         GHuLoQl3VqA+LEQVgLmvBCAtYBn0/hqof1A7IK3C8bJsW8bI2hWFcXTnVyjsiOutNLB7
         Jz++7B8kT0zRy71uiUzvUl4Hm6UIh6LZ6NemsjiPYI7GwH8TURYQDA1MT9Th49GIKGIV
         Y6SF9M4+Xn5pKom0BsM7mtqYLWszjkKhx8SzBYHUamApUCOTgrpwxD/kxHCzbfWK+gd1
         q2Pw==
X-Forwarded-Encrypted: i=1; AHgh+Rqyex89BgpE66hraeGfSc2nY/kNvK3ckONUNI6DfZmlNchz+1xRn59Q9nCV3zjNi6tCtnEmrm/nhgyBIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdk8Qgp6AMBrG8Q2u9J4r9qQddi0zgpo93lasnriHW1Hp5cjrm
	4SfnnSvZQCRwI3yyXA5slLmaeAkOWwGu8ByV8gLTrMxAzmEpBIfGjSI+ZeTWBRKq
X-Gm-Gg: AR+sD125xdl1nPyBH4j28EA4SH8puISJ0ecJHMzCba9yke+KRuLnAk9zXjbUnDzSqEn
	yyZYMgGr+5ug+5fynfQOOD4x/Yi6dvB0RUZA8xTjLgMmYbj54Yk9dCPkPqdDl5Mpimczv6ix33P
	Rvg/C/FCvPTW1dzkYxp5FsBMhMubYk/bvb9b48a44r3+BJDK2eppbEdFsLBukUyvXaFXdP07WZ3
	U4hBUzzh6YK/K/gMni+baH3WhiZRwsxcK1y2/GvEBfCVHiJe60PhmeH+TxWtLtuAnzjTMptKFli
	wYyIWKLdx0TY39LZGzjatHP2wJwhfPDyPqtTsizN+garJYPZtH2FIu1B8dCxORwmdqtczPhlYTk
	fEXICaaUP1pCyI29nCOZHqBjNQc6npdro5sKnOMMepdZwvgKwxUI3vD13QpiC/emjjf0VdIvXZs
	mZATw2x+7+4ErdCMWBUyHC4zJXWmBal4givMa5bY1SMtJId0d0r1+1QzFpkDUs6YrfCZOmyGSHp
	cXm1bQrdY3TqQxfYw==
X-Received: by 2002:a17:903:1585:b0:2c9:97a7:71ab with SMTP id d9443c01a7336-2d035d0097cmr15283805ad.38.1785394297603;
        Wed, 29 Jul 2026 23:51:37 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bca9d7sm21707555ad.52.2026.07.29.23.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:51:37 -0700 (PDT)
From: "Yuhang.Chen" <yhchen312@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH] RISC-V: KVM: Add arch-specific tracepoints
Date: Thu, 30 Jul 2026 14:50:48 +0800
Message-Id: <20260730065048.3715824-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAAhSdy2Qa2DGFzb27MgmoH5Pf1BOrgwaZBqP__U9eejs5-5Bsw@mail.gmail.com>
References: <20260626103619.174179-1-yhchen312@gmail.com> <CAAhSdy2Qa2DGFzb27MgmoH5Pf1BOrgwaZBqP__U9eejs5-5Bsw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_235138_936883_EC16D840 
X-CRM114-Status: UNSURE (   9.05  )
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

Hi Anup,

Thanks for the review.

I've addressed your comments in v2.

On Tue, Jul 28, 2026 at 09:05:39PM +0530, Anup Patel wrote:
> Drop kvm_guest_fault, kvm_sbi_ecall, kvm_wait_riscv, and
> kvm_csr_access tracepoints. Instead add common
> kvm_vcpu_exit tracepoint for all vcpu exits just before the
> switch case in kvm_riscv_vcpu_exit() function.

Done. kvm_vcpu_exit now reports the full trap context
(sepc/scause/stval/htval/htinst) and is placed just before the switch
case, after the CAUSE_IRQ_FLAG early-return, so it fires only for
synchronous traps.

> Drop the kvm_irq_line and kvm_timer_update_irq tracepoints.
> Instead add common kvm_vcpu_irq tracepoint called from
> kvm_riscv_vcpu_set/unset_interrupt() function.

Done. kvm_vcpu_irq is called from kvm_riscv_vcpu_set_interrupt() and
kvm_riscv_vcpu_unset_interrupt(), covering all callers.

> The kvm_mmio_emulate tracepoint is fine.

Kept kvm_mmio_emulate unchanged.

v2 follows in this thread, with example trace output captured from QEMU
included in the commit message.

Thanks,
Yuhang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
