Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E306C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 22:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/u80XX3eti2HYhhJQUOw0K9W6CzwUUJM5x3MFEyy6Jk=; b=prmsqrpBwh7YT+
	29DxPkuOPQ7gjbVY2MUbqfDw6qH2uONKvNauGzBIBF9LKt4jfzDztfMA6rNflQpOs47IWDZwWL0UU
	ZgaOBKkolmtz6ZraK79H32gYk3tsawSUtA0CJo/4mjUIbpUtUlhuOtpJ/Bu7AnWEcBb3lc2whX4f6
	QdwqqWwPQa/S6Z8+ILZy+YESJkojB6s2DD111MNHieCVT2UaapabUG1TM41c6cNQtFZwAEm6reu6h
	ATc6wEOVWND2af4cSd8PdR4jgm8KJh+b6hoQOAWluLfV2rb1tWyGC+55bXOn44vNgsCTegO/z02Kw
	ZuLiKgSw01z04TilORnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBvX-00GZ51-FN; Mon, 09 May 2022 22:32:27 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBvU-00GZ3y-7S
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 22:32:26 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d17so15209537plg.0
 for <linux-riscv@lists.infradead.org>; Mon, 09 May 2022 15:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=OGnpUghGinTHrKMvuIufYZhVKzsWXTtBz74k+ehQUmU=;
 b=P4847mqYvFJU1r8pM8dySzlwyIgNtXMJtbDDKvWSq5MGwtlscsCCXVAVp3Een15tLe
 5n1Ydmj9moMd6LKmt4gHIKvaic1BzqcoqL6KWFbWTtasDJ3BWP2ccEtahvna+yVemzis
 iN1RQFTG6BN5PoYdPoJ61hmhf2JFm/LbRNK7uIE236X3HolKFjadTFcKKEk9AsvQjYjP
 pJsGtCW77rc+iguSk+VXaKEz+BzOH2GG5CD1ihjlYTqHbZayoqPzwmAotJfU6v9gDP1k
 Vjt4YeEEM1KNCc4W6h/eu83swnsrnpDl8df6+epZYsqG0Wy5wIR7B4EHFLkXh/EjiI7J
 du5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=OGnpUghGinTHrKMvuIufYZhVKzsWXTtBz74k+ehQUmU=;
 b=uawuLye+dJW1Tah9nLgAIFHOsTiZyPGyi2F0344CepEbXOxsGDCzXlq08KOXRtERUk
 MEEZypqvVlVoVRfYmvIDdf2PFQtBsJEqCVDheS0XKrGtaUbD+Un4oVvDHiIzgrX/jpvl
 xwNXDh+f/8BlH6NMx24fa+tQNuQDt/YhUElZzZFfCOzaa4TKnt7wyAxCmHvzvXDQMbv5
 QADR7KOzHOFXPF6Da0zX0kmfg7/fNAgjs2nYeITHK31SxQdodijqlk28jqOXNkYdKc0A
 78H2mk5NPpY35+25SEViK8U38l+ypE6oWZVI8F57QbYYLw5UsIMx8LKkMu5URmM8Ipxc
 oPZg==
X-Gm-Message-State: AOAM530ujC01ylsnZv8Xa/MBYi4MUlPC0xZYp2haSf2FBcraHhErfTGU
 VevJCBU9fo0WK0ou4UYZb0peTWlohdkjvQ==
X-Google-Smtp-Source: ABdhPJwQqh+fMlzdQfbFIVzBAzPAKhyu5i+yFaI9OdV1VeSQSp6KVjEElBPWxJiMze+/T0PiWw2qGQ==
X-Received: by 2002:a17:902:e94d:b0:158:2f50:d04c with SMTP id
 b13-20020a170902e94d00b001582f50d04cmr17881540pll.11.1652135542508; 
 Mon, 09 May 2022 15:32:22 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 v10-20020aa799ca000000b0050dc7628166sm9164094pfi.64.2022.05.09.15.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:32:22 -0700 (PDT)
Date: Mon, 09 May 2022 15:32:22 -0700 (PDT)
X-Google-Original-Date: Mon, 09 May 2022 15:29:55 PDT (-0700)
Subject: [GIT PULL] asm-generic: New generic ticket-based spinlock
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-cd395c5c-a0e8-4e49-a61c-56169759df70@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_153224_532729_0215DF15 
X-CRM114-Status: UNSURE (   8.56  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git tags/generic-ticket-spinlocks-v5

for you to fetch changes up to ed9604312e917c3167f156025f45245d4971415d:

  asm-generic: qrwlock: Document the spinlock fairness requirements (2022-05-09 12:42:17 -0700)

----------------------------------------------------------------
asm-generic: New generic ticket-based spinlock

This contains a new ticket-based spinlock that uses only generic
atomics and doesn't require as much from the memory system as qspinlock
does in order to be fair.  It also includes a bit of documentation about
the qspinlock and qrwlock fairness requirements.

This will soon be used by a handful of architectures that don't meet the
qspinlock requirements.

----------------------------------------------------------------
This is aimed towards at least Arnd's tree, assuming it lands I'll deal with
the follow-on bits as per the notes in v5 of the whole patch set.

----------------------------------------------------------------
Palmer Dabbelt (1):
      asm-generic: qrwlock: Document the spinlock fairness requirements

Peter Zijlstra (2):
      asm-generic: ticket-lock: New generic ticket-based spinlock
      asm-generic: qspinlock: Indicate the use of mixed-size atomics

 include/asm-generic/qrwlock.h        |  4 ++
 include/asm-generic/qspinlock.h      | 29 +++++++++++
 include/asm-generic/spinlock.h       | 94 +++++++++++++++++++++++++++++++++---
 include/asm-generic/spinlock_types.h | 17 +++++++
 4 files changed, 137 insertions(+), 7 deletions(-)
 create mode 100644 include/asm-generic/spinlock_types.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
