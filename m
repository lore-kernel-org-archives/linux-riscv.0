Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75111EED603
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NLmOBvVjkPV6JnmJtpwzKqak5r6BypEeDTMTiIu3ygc=; b=xhvI9xLgaIi81x
	TNX/NOyo+/nVg1ZwXTJNAqeIx0RhMaU/snanm7iu7M2a7oCgbcQkpPwgQPhO7dVLzfAxQ68CMJ1r7
	bCP7HQQR1YXYfi+UYa6QwvwguNPGgEJ8vkOw4FZOniK5jnK0kcQ9NSZZEBmpmi9hF4hf4jY/zr9bM
	ecJfnP3JQT5/M8dW5BIMMrm2mu8ozQUGPyhT0y+VZxtTq5KXi9v3jeUUuk5TwAY9pi/beglHciJUI
	XK7j+JNPPNqq52NjiWtejp+NW3LoFMh+ksYSd2Y2mF8q28SdVcE1LEzH9zxmv3RRoW42i+EhmqP4G
	tYQOy89e5xIyEMf0KuCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAUj-00AxDi-1e;
	Fri, 15 Sep 2023 15:12:33 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAUf-00AxD0-2u
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 15:12:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bf7a6509deso17835155ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 08:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694790746; x=1695395546; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvdZikewOGbtBJy4jV7eLfxgLdyicvd893nAAhG6Kr4=;
        b=x7riRWJSDqUu0LvbDNy+AUF56i83nvNVEJ1C+nbdYNQFwhpVeRoKg0u4iEvJliu+Zh
         wuDRNJemhgcGMKWMcIPdcfPm2u3TmNdiAvYUWAtoML/GEFLzHGsrjGw4uGUzaUgFD7hl
         GY93Ba1QztdaIhYtfd82L60P5BZ5F0aeFUgg+JqEp4RzwFMYumBMBUW2JuZK4J9qpYkN
         rHQnavgl98bk0n7gb5KrJc7//WSPCMS+pr4CgMa6HEUAwQEQeBDhyVVnZySHeq8kMUGN
         ssxRAhjW+zooL/KohA+NQ63AFO1HFuBbmsCdPVxNx0vwT/l/ycB5vLcXg72CyUh9WNin
         p6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694790746; x=1695395546;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvdZikewOGbtBJy4jV7eLfxgLdyicvd893nAAhG6Kr4=;
        b=vAKXyUXKyG4LyyK2BcfreuStrI15X0Rrs/R3lpJWfX9O0kqjPrycCYpGz/TLEk9e6c
         hDGG4zfhssfNvjSTQkSXBI2aHW4cdC9saBRbGu76VF71fe8buDy2yDT2tYmZ6buynTp/
         XBYnflLxaZjvvx/sjzyT5PmdMvQarNWaq8M8Hgy8EdxCGdrZgFajr3hIZrc6bOcPHVFP
         xB8cj7MC2Z6cdIZUK6zWwFLDgE3g9EJDCu064tgJjfmhIWzpSfFk+qtW5vu4wo37OT1b
         Ky9e8h7qTnW0jNzXsqKra1mU966Zo+CrMl95/bYbJPFf3AMg7+oBnFqPFAjIX0VkOq3q
         v4Bg==
X-Gm-Message-State: AOJu0YxCYaTMn+tYggU9ZVwZRh+CGUTzaVxGhxC12dR96pM7OnMVWyC1
	bvpOmC/pJNt2TqV4Xs8oYQGBRHKu0QW6MXRG2qk=
X-Google-Smtp-Source: AGHT+IEgHQ3UNAjBW7KxV/WQLG8LILuRF6I7lSNAITcN9JQHLMiivMx8BGW0JezRPOZ6qFEwYnU70A==
X-Received: by 2002:a17:902:6806:b0:1c3:7628:fcb5 with SMTP id h6-20020a170902680600b001c37628fcb5mr1873527plk.62.1694790745936;
        Fri, 15 Sep 2023 08:12:25 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id a5-20020a1709027d8500b001b896686c78sm3595063plm.66.2023.09.15.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:12:25 -0700 (PDT)
Date: Fri, 15 Sep 2023 08:12:25 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Sep 2023 08:12:22 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.6-rc2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-28c66ddb-6068-4bcc-a1be-28c830775838@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_081230_119957_1B55C5DB 
X-CRM114-Status: UNSURE (   6.69  )
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

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-rc2

for you to fetch changes up to 8eb8fe67e2c84324398f5983c41b4f831d0705b3:

  riscv: errata: fix T-Head dcache.cva encoding (2023-09-12 13:58:40 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.6-rc2

* A fix to align kexec'd kernels to PMD boundries.
* The T-Head dcache.cva encoding was incorrect, it has been fixed to
  invalidate all caches (as opposed to just the L1).

----------------------------------------------------------------
Icenowy Zheng (1):
      riscv: errata: fix T-Head dcache.cva encoding

Song Shuai (1):
      riscv: kexec: Align the kexeced kernel entry

 arch/riscv/include/asm/errata_list.h | 4 ++--
 arch/riscv/kernel/elf_kexec.c        | 8 +++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
