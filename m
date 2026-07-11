Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C43C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 01:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lOl28rbaoj6VTaWW+IkE0PInRwCO/50CPXQ5nvfg4BU=; b=HnxLDXAs64RpRV
	nSDXJZfAFWeJFWDCR3i1d7MhMhxRIk2XDenRGMBEZEIYk78kYk+ChrE4hOHl3PB0cAIuC8ITOHIrL
	lVbAS0o38/HOSbH88F/TYge0V0TeAUKgkdBYC4x/tTDKCjs8eaPLiKJH4mk15XAlXP62qQSuwdqVi
	KggUjCwxAXe3IGM7yCU8Jajrnvg0JTAlupnGpEYM7yVxjR9BZBrOyymr9Fc1qtd/p0dMOUC7gpMfk
	rZ4wbbxSxhHQqvtXQewScSwmV2pK2q17QCvKmaBvOEAtkfvC5OgLeJh5JsWIhPOR32hNzgv3erTqq
	coxOUGNFwclXew2rlsmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiN03-000000067FL-3KBu;
	Sat, 11 Jul 2026 01:59:27 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiN00-000000067EA-49hJ
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 01:59:26 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-81e763fb7bbso20341097b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 18:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783735163; x=1784339963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCH55p5xEaUDpZqZ0WCRcca3k93TXbwbnWSfoY5jAl4=;
        b=UxqMYGOrM3jqo5fmf8o2yMky52IZ8FwRIaw1uSV0tFrVbN6YOBft3AhcBCKVTwz29k
         4G6m1+Ek+nS3TTTErYpz7DaewMAVDBSI7G3I5k3d6AfAd3c3ofQICBV11lNoP8TUxmvV
         aa6OFkVLjfP/gxKUHpsBmonqoE2boxg1CTTcXgZbdO036G9xHpMtXNMkwHAVkQNZFA96
         rCHUblbKcRxW5MUcbUBorauvzwWJrb5AHXTF6XqdGcbn8AHmfuLFf9YEmU4cyjMVMjfn
         ACgSW6TBadMH26GYftQR6HWjfIDhGDump4goYKWvZt9FGZWCFXqwbKPa5IHQpdK7YIqF
         JDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783735163; x=1784339963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCH55p5xEaUDpZqZ0WCRcca3k93TXbwbnWSfoY5jAl4=;
        b=V1l3nU0YV/6WrW+nXJomTIxWu7xczDr/Udqv8oWbgCYiCiPUG3kzm9A262JtvWNDOS
         EL9W3ipql3rSeossEWHzAAUhGBHDMRd/iQYUqlvQjsz/RL7oDrrWkldGOAJF+g7/aLfy
         s67vpwsPJotmHTtR83tQORxdaCbVmDJykfz3AH5fRFONcmoWZxsYe0Zd+XPQzeQBdC0a
         1Uhcu8BomUHC9GwpdfWo6i6f6laa2CiqSBVv1QM1oCheIe2F3P4/CQkpdUVLOKdk+YfG
         Lhx0VJtMOlw90xZKznzglvpFsQPXYRyZiTtPYkDmp0536zOvXk3FGTG0P1FtZGCw9tP4
         sSlQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKyT5HnXB1aVkqH3uAeCHTIgjDy9GNQZaGB0rKELlrihwIIWsDY61Hf0AJmDXtMdAjEKeZTgLtoDt5Bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxW3i54mECCcllZ+Fj8TWp5vB5F04tJWgEU2Tix/4VJb7Y+QjZq
	8ftyEXnhl5/xlXJW7eFp8KnVOmZbAS5wiEIlFW4n6qn1C13xiCyEZ313GAdggnn4hxWUyJTcqX5
	diNnuGFY=
X-Gm-Gg: AfdE7clcNOTTw1U/fidikA+V+Whm+ZHRrFh25SmDTsLtQvSaJY58w3PRk6hnSuJcxNg
	+LwZ+IWOYSZFR+YoAvopAx3IMpu6tURUVMs2uQ4ZemGiv2e5ETUy1MT0yLqlvVAujL2Gjl0aRJY
	MHNG+H1Twy8uga5DDBy/YW8GJfnvZIVp5VNxPhuwOmZllJEPa0uIy7g5FyAHnjgrAenzpfixgub
	gq84HJKOS5ncEwr42+GMOG1kswkdwj1YQ5ztEJVaQo2+s6NX1FqookZm1uuY8az2AlKKu5g/7+C
	4c/dI0fwhVatJ8+UYK2tNCpT/YdxhEv1dy5D5J0eAybXDwlgjjzF1JZJr5Aq97l07jA9rjeyZLp
	45vmD6zbY3BoXBRo/iAkku5Q2Swj+ZjbcpSuyUhSLqQFbsBh2cdBwjNrWicRDbAi3BriQFCpBKq
	oGAFK+gtF5ZdeurdtLbKQZp1uze0lxnyDg/QMGT8uDUZsh80mJYV3Hum5JdLln9sDeGn+MKwFv/
	YcMpLHNAlkUgrPkHfIbkrcQx0BihMY/AmHGFx0L
X-Received: by 2002:a05:690c:7:b0:80b:1616:5c0c with SMTP id 00721157ae682-81e9012e049mr10725847b3.41.1783735163246;
        Fri, 10 Jul 2026 18:59:23 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6befb688sm61316497b3.14.2026.07.10.18.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:59:22 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kvm-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v1 0/2] RISC-V: KVM: fix vcpu vector context handling
Date: Fri, 10 Jul 2026 20:58:28 -0500
Message-ID: <20260711015835.767259-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_185925_042542_B5BB6502 
X-CRM114-Status: UNSURE (   9.37  )
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

This series fixes a vtype corruption encountered when running perf +
vector workload on KVM.

The root cause of the bug is that the kernel-mode vector (KMV)
misattributes the guest's vcpu context as the user's context. To solve
this, we need to correctly save the vcpu context when the kernel-mode
vector is serving a guest.

However, calling directly into KVM from RISC-V generic architecture code
creates a reverse dependency, which is problematic when KVM is built as
a module. To address this, we introduce an RCU-protected callback for
context flushing, which KVM registers during module init.

This series will create merge conflict with my v4 [1] series on syscall
optimization. I will send out a v5 that has the conflict resolved once
this series is sufficiently reviewed.

Patch 1 is a preparatory cleanup that refactors
riscv_v_start_kernel_context().
Patch 2 implements the callback mechanism and fixes the context handling.

[1]: https://lore.kernel.org/all/20260528190927.886558-1-tchiu@tenstorrent.com/

Andy Chiu (2):
  riscv: vector: refactor riscv_v_start_kernel_context
  RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector

 arch/riscv/include/asm/kvm_vcpu_vector.h | 24 ++++++++++
 arch/riscv/include/asm/processor.h       |  1 +
 arch/riscv/kernel/kernel_mode_vector.c   | 58 +++++++++++++++++-------
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    |  6 +++
 arch/riscv/kvm/vcpu_vector.c             | 18 ++++++++
 6 files changed, 94 insertions(+), 17 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
