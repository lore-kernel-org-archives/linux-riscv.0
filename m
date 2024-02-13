Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA1AC4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 20:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=BUB8FTX7WmvhCPWM4vJwZRhUFgD8DqhoZpjNOXmRAk8=; b=lec
	Vx7MOEoTrCap6HjIu93HYdXujmpAUZArLPxhJMPgaTx4MJzUlgRkzCcVo0PYcdGHrC3skjsl9/t4A
	e3YltISHPE+dNbhOwlADPCyt0Jf+d7FEVaH6LzsqMndJa80u7voYCSp6n7KHWRJV0hETIKmWQGg0k
	c+I0yeOVIv/CACRQOya9csb6SPf1BgNnh6Zz7m41Yr1dzYjaphRiglSYqIFhdJ13MUm6WrHtcTiy6
	dna7/MoDdL6xrjFhpxPKd1OtNAjQhjjBdgRC2eEwJwQLnm24IYyB3TEu8Lgy3pz+KainUePPkeGVI
	ZFjUkTISP7wfJGuN4MSEg5Y99ntlOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZz65-0000000AZxg-0U45;
	Tue, 13 Feb 2024 20:09:41 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZz62-0000000AZx7-0Phd
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 20:09:39 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-60665b5fabcso20610747b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 12:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707854975; x=1708459775; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VsrsF04rZWOWiU7r9GjRkleDZT0Ht16PcSvn8OkPl5Q=;
        b=BjOiXkYJlwWaWkvX3DDYV32lqsqXUBdqGo3D0Q61n7tONO9WfMFfMQETI3y4mYMv7P
         /ENOtBOfpGlTiCH7iNTWmmJpSAIm3xcy1YSHLWeRZiRt3G44Is7XGect1TRhYL4HFJuD
         B2fYIsjRXUCk7eoh8camoax74svxYBP1kbrZDPZO72yYynJnu1wQ/EMQ53imLTfTr/+3
         cq1HP4ikQBsyDfEJrxIaT5XxOKCecmDwT128JXlLJcY7hXTNdk9GgWNBIxFQ1sbP5XIh
         Xa11ITq5mI1FkQrqCIJaQRpQ6kp5Uth2xLNkRKdBskOp5xD5+/Z1LmEnKUIuNDvlMk/C
         wkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707854975; x=1708459775;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VsrsF04rZWOWiU7r9GjRkleDZT0Ht16PcSvn8OkPl5Q=;
        b=SnAw9FziS4nTu2qtiW7WSwbddldA0DtsTIVrj+UNaQTYxk0V8hg20J6lb8ZvLTMLFy
         Dgr/Acv2GrmspZRMMKW+sMK14JbxVJ++Mc2JzGhOgpABULRAsOzePmVb5s+TZTKbEiwV
         kcLy1wsFORKrmz0g5f6pk5niqj9/c/AoYxdn+tuPA+KtRctIQvYQlYCxeAMw9gRi1P4/
         hM16lxbmrPZd3RePdbZsDJ65vHuOcQubLJ+AJwf3YKyIim5XL8sZKLj8LwI3jilmi2uV
         hbP9vMywmA/tPNx+N+qtI6tyEyofJLIyk31tcxcI2P3RjTs0cNvlJD1vPOud0Lntmuuf
         sDSw==
X-Gm-Message-State: AOJu0YzlE3LmEG9a8T0gZeC9O53p5her1y51aYABGYiH9zKcPMYPuNcp
	XhoBGbVsqiIPBN7zk23PLDVo7vUhx4o6dRJ670CXfTJruABias39IDekHDYe9YNDwGiRnJ0V1ph
	9CrbH8vPZu02VmbvzIQ==
X-Google-Smtp-Source: AGHT+IHYJQSvG5V17xi8OnffS/v8heCb56A8nRdMQGEL32SIQ2AAcEiLmEEuizQgumtk+EffvkX2mZJfR96OSh5S
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a0d:cc4b:0:b0:607:814d:710 with SMTP id
 o72-20020a0dcc4b000000b00607814d0710mr76740ywd.4.1707854975517; Tue, 13 Feb
 2024 12:09:35 -0800 (PST)
Date: Tue, 13 Feb 2024 20:09:22 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213200923.2547570-1-ericchancf@google.com>
Subject: [PATCH v4 0/4] riscv/barrier: tidying up barrier-related macro
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_120938_159706_1B0BF1C0 
X-CRM114-Status: UNSURE (   8.07  )
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

This series makes barrier-related macro more neat and clear.
This is a follow-up to [0](v1 and v2) and [0](v3), change to multiple patches,
for readability, create new message thread.

v3 -> v4: fix [PATCH 1/4] commit message weird line breaks and let [PATCH 3/4]
fix the form that can pass the checking of checkpatch.pl.

v2 -> v3: split the patch into multiple patches for one problem per patch.
Also review the changelog to make the description more precise.

v1 -> v2: makes compilation pass with allyesconfig instead of
defconfig only, also satisfy scripts/checkpatch.pl.
- (__asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"))
+ ({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })

[0] https://lore.kernel.org/lkml/20240209125048.4078639-1-ericchancf@google.com/
[1] https://lore.kernel.org/lkml/20240213142856.2416073-1-ericchancf@google.com/

Eric Chan (4):
  riscv/barrier: Define __{mb,rmb,wmb}
  riscv/barrier: Define RISCV_FULL_BARRIER
  riscv/barrier: Consolidate fence definitions
  riscv/barrier: Resolve checkpatch.pl error

 arch/riscv/include/asm/atomic.h  | 24 ++++++++++--------------
 arch/riscv/include/asm/barrier.h | 21 ++++++++++-----------
 arch/riscv/include/asm/cmpxchg.h |  5 ++---
 arch/riscv/include/asm/fence.h   | 10 ++++++++--
 arch/riscv/include/asm/io.h      |  8 ++++----
 arch/riscv/include/asm/mmio.h    |  5 +++--
 arch/riscv/include/asm/mmiowb.h  |  2 +-
 7 files changed, 38 insertions(+), 37 deletions(-)

--
2.43.0.687.g38aa6559b0-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
