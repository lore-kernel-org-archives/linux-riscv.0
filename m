Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB2EC48BC3
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 13:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=UxXC+KigCpImcvRh7c133yFPmChhD9FRaOTSzrwQl4U=; b=Yk0
	UZptqoJT5cIpcy7N2tRHKrM6lfxACNDOgJI54JTiORPmiFWJhpn3b+Ho+9m7lrsCvtW6fJYZM8yZJ
	Q0QtjXRhXfLqPxcKpbIEeOyPlKSatpwblmSkicNiTZsX4Pk2k6PbEaIimYms1qynEU/rvnFOpq3C8
	iFpM1hdM1qk8I2hVSso7YZ1/MZSalpgE8p4UFVJihe9yIYNojii1GkskeqnmZjPm6dWs4VxxQhxxu
	FvgQ2xT/+USk2wpA/39XWMYc9haxP72lkpqXvHyo/z6BGt11HiPQPP03MDslRMSpNU4oN9lXijik4
	lqOHk1JNMBKIwx5NqXeKl4FV1FqHwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKUN-00000005i4n-2DNC;
	Sat, 17 Feb 2024 13:12:19 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKUK-00000005i4S-3BXk
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 13:12:18 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-607ddd292ebso36174087b3.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Feb 2024 05:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708175535; x=1708780335; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7Y1uJckyCc74lkL+D8dqAJTUMUo19CtOARoN2IZ1m/k=;
        b=tzEj/Ts3eLqNn8g2vGwbPpDeHguDEjseSqtSGGIjQKYQQA7xOLir6Xpm5j/+4L13ki
         S6KPaNXJaHdnxrxNc8c4J+sHUBmJdUM0gb+cRLhXI2/4A6BxMOTlOsCW8yAv0QRdfHdw
         fFPm3aa5otTo3KXnUCq9u8tG1qWJbQXtN1zJxatnPruqAKUQHvGJZcQARdyqOQ+divUK
         KUpB4nr7Kq3Z0ipPyDWPP6BXTgRDYI1q4X4rzY7PdQVH7Nqc3hArS9bOz0du2S6PJ/I9
         ZaluAfUu0cN5a8Ce0CIRorSReBgBHr9d+gIPopAK3463CNwCvdNyS3HMN9Kqogjufv32
         0t8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708175535; x=1708780335;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Y1uJckyCc74lkL+D8dqAJTUMUo19CtOARoN2IZ1m/k=;
        b=Mus6AerZXszzn3edNXf0s0ZwqviPaqW9T/X9yYcAq0AugnmqtvW7Mn0JQCRGKrgZjj
         scOoOxcPBjMWKTf0MmZisUIRrT2+2UDu1PogaPErntKJt+bb3/RSp5eYznFKUsFdCmcm
         UsGhNoeIbXL1ec5E0wBAzIgtFIqEgn1K6s19lBC2d/U6Ds828aP33nnB5xHkyKrSmp+r
         gW3g8wNLc7JcZSyfa2VXRjMw8H7+soDk2iWZ9M6mc7Xr4FoCslsjkBbcAykgIIlMzpmd
         66PmbZm7xwSkQPhIK10YjfGzhJ1+JfcAjdBorB4YFlwfec+ZHOWKjhK8eyuEMP9z+dhJ
         qrig==
X-Gm-Message-State: AOJu0Yy63HXY7D1Yt69oglI4IJj8yRs+3iWjLLOIQwC/cmnJ+N3yWUtD
	LTixaKAhD+JKxZa90Vr5gnVtkONDUoUeSXfCyYSoUawWrriL+9Md2Bgsf8ZZJ1rgo7ipvPhT2W7
	Z+QNAiVNTC2i0v4dFQA==
X-Google-Smtp-Source: AGHT+IFG1QKXCRYE3QDVEhwJ1Zd5YdQyq+jmIVuddElh5JrY0hnwshQTWnUXE95EiHw44yO6XBfa8LkHcb1X3Gs3
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a81:6c88:0:b0:607:8358:1a3d with SMTP
 id h130-20020a816c88000000b0060783581a3dmr1158404ywc.6.1708175534909; Sat, 17
 Feb 2024 05:12:14 -0800 (PST)
Date: Sat, 17 Feb 2024 13:12:06 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240217131206.3667544-1-ericchancf@google.com>
Subject: [PATCH v6 0/4] riscv/barrier: tidying up barrier-related macro
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com, conor.dooley@microchip.com, parri.andrea@gmail.com, 
	emil.renner.berthing@canonical.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_051216_821506_23D01C9B 
X-CRM114-Status: GOOD (  10.60  )
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

This series makes barrier-related macro more neat and clear.
This is a follow-up to [0-3], change to multiple patches,
for readability, create new message thread.

v5 -> v6: [PATCH 1/4] let this change to pass review by checkpatch.pl
instead of overwriting again in [PATCH 4/4]. for [PATCH 4/4] change
the error message example in commit message to make it more relevant

v4 -> v5: [PATCH 3/4] __atomic_acquire_fence and __atomic_release_fence
omit-the-fence-on-uniprocessor optimization, and fix the typo of
RISCV_RELEASE_BARRIER when spliting the patch in v3.

v3 -> v4: fix [PATCH 1/4] commit message weird line breaks and let
[PATCH 3/4] fix the form that can pass the checking of checkpatch.pl.

v2 -> v3: split the patch into multiple patches for one problem per patch.
Also review the changelog to make the description more precise.

v1 -> v2: makes compilation pass with allyesconfig instead of
defconfig only, also satisfy scripts/checkpatch.pl.
- (__asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"))
+ ({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })

[0](v1/v2) https://lore.kernel.org/lkml/20240209125048.4078639-1-ericchancf@google.com/
[1] (v3) https://lore.kernel.org/lkml/20240213142856.2416073-1-ericchancf@google.com/
[2] (v4) https://lore.kernel.org/lkml/20240213200923.2547570-1-ericchancf@google.com/
[4] (v5) https://lore.kernel.org/lkml/20240213223810.2595804-1-ericchancf@google.com/

Eric Chan (4):
  riscv/barrier: Define __{mb,rmb,wmb}
  riscv/barrier: Define RISCV_FULL_BARRIER
  riscv/barrier: Consolidate fence definitions
  riscv/barrier: Resolve checkpatch.pl error

 arch/riscv/include/asm/atomic.h  | 17 ++++++++---------
 arch/riscv/include/asm/barrier.h | 21 ++++++++++-----------
 arch/riscv/include/asm/cmpxchg.h |  5 ++---
 arch/riscv/include/asm/fence.h   | 10 ++++++++--
 arch/riscv/include/asm/io.h      |  8 ++++----
 arch/riscv/include/asm/mmio.h    |  5 +++--
 arch/riscv/include/asm/mmiowb.h  |  2 +-
 7 files changed, 36 insertions(+), 32 deletions(-)

--
2.44.0.rc0.258.g7320e95886-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
