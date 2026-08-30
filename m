Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6368C61DE1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2lPiG9Efcc9JI4QRpm8DwmtOKZikJe8b35CbrPGfnuU=; b=biB6Ev3Xr2puLl
	FIWd2o1Sn4sziTsE71KpOhDu76PT2E3dfG6rPwsNq/QiIrAbIZ4dBc9V9UVkZPH243pXWa/wxZECu
	JVhgRl+WtadGjR0T01Cs/e+/DeJU1tBh0qaUZ03KuZqPcorS9Q9yvinhubfYaIPE309yoap0I+0bC
	wN7nOdpEHteuhbPkL+iMaafIUip02zBJbFXqhL3G/6cnVV5ljFjR71JqZhD6J6DZufziYANfOofxs
	73EuDhDDZYARLyJrZGLU7MJoFabgb5NPFIqHisPYBlV3RsCKBVq/duyXNOxBqGW8vv3wdpOm9QluK
	yGQTGeEFAHvSwWGJT1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0i8v-00000007ttE-0gof;
	Sun, 30 Aug 2026 16:12:25 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0i8r-00000007tsh-3ZkM
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 16:12:23 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so2266787a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 30 Aug 2026 09:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788106340; x=1788711140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v+ZZzE+7YChtFOdG6RvfuESoJaQ8tR6VAjdqUH+Gqes=;
        b=hRwab70xDZw7BPp/+zYnqFwkOxwJwyhEX7KfGZrC1pcJ9yk1E0ySYAuUvWZrEY8xBq
         VxDQvvYQJtmtpSx21lO8aX49wUd++0eQqiPYjaAmES3izj3U6Lw5SW8KkR+3+2abEufd
         SwUvD8PO+wTqwYtK4VUdPm3JvZTAmO/pP6LTS3YiVO5zhtf1HxFX9BNkchi+05Z+8eoc
         HHmaKNy/pdpt6AxAQ5RrXmBlrWcgfxeJc1+aU9Jl5IaIRLFY9Z5UAzQl5GOPMNrk0LVC
         /2PJKKg4a00yAaZlFmAFca04P9yc9LVMAfxiev1zOW9jaXYhgaqjY6Y4aXVFq3B/CHHP
         ndPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788106340; x=1788711140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+ZZzE+7YChtFOdG6RvfuESoJaQ8tR6VAjdqUH+Gqes=;
        b=cjcA0d5ffhRQeB3UfRE3dUk2KD1hKPt6yyGxDma1ix5TO5Ajb5nbyECu28uy8ZqN4N
         9QmXai81Ly5QfbFwlgcPeGGBlCRg5TJKYhXIVswpOHJ3Q/8yfJ6+8/Fdg/kzNuK/x0CT
         JKTbTz7Mjj8W++/RqkdhEYn4LuTuj1ZMd/G6OAWc/a3eHX0XwIHTtPUJ6B6u+4lRk9JH
         IH+335Ml/n30TNmeheA8rpEIC1p3q5x6xRkLS9afZIWeTidNrKUPjd10+UaIfCMAgfUb
         nvmQml++CjNoj3klx2h83dh+rdjhBE/Tm0ldG2d3dwFPfwGBGV6pj0WgGOGNVeOQUvMJ
         69RA==
X-Gm-Message-State: AFuF++kscvAujRwSvB1aPwZwZXXmdfm8YV5cyxZ39zs1ZlkGj/29ajm0
	/hg3J8RepGlntK8uNPWlwKGV0S1hXlRmofR/mMuC0yNj8rrefNNY8B8HfMD9Z4VhdQ/dXQ==
X-Gm-Gg: AR+sD10lSrCGDvODfNmSVpAwBpptvco+PTE20WBEpWgcuJQSHq9RSQcX3NzC6KzJiZ5
	po+vgN6mtBA4yKLBOThtfZIfOH4tIEwzZ9KEyi9RfUGoxgCAAR2PjpGhkfMHncMd+Np6v7SXKLf
	bUlq0MbheYxoRq5tCARZ/iRfdq9oXDNqtJjhH7yIWSbcZBfy7gUDCPPV5V2APBIXCpbvT2JLX3p
	sR2A0NG8hzbqo2+X82T22zKfaH6o6E3fDN07Erur+sa8nsE2xTlyV84yEsII9XLZyYQ1JSwa1Be
	STECrzXFuUbHHEhFd4blK4Pgz1nPb9JedkViv+JpDBm6KI3rreLjS2k9gpBxM7yfuTMVySH3sw0
	y4zAr1lXJN+HfLHJdx2jWW34DfxTQ84kuvQHJIpvspCRIhPutAN+F+13X3d9nCpeW0ZSftHR0ku
	NgLhbxhRcLAe3XLaZmKLXH8i0qfeLgdCwTeJpJJc0qfrjM4S0oWkrPgHS4OfmC0YDSphsh3dzI2
	NGRjvqCColeh+uj++LJ7jYT+09o171859E=
X-Received: by 2002:a05:6a20:c998:b0:3cd:9bb1:c6f5 with SMTP id adf61e73a8af0-3d267a6b464mr35141406637.10.1788106340361;
        Sun, 30 Aug 2026 09:12:20 -0700 (PDT)
Received: from localhost.localdomain ([134.195.101.83])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm5719005eec.1.2026.08.30.09.12.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 09:12:19 -0700 (PDT)
From: Yu Jin <lambda.jinyu@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yu Jin <lambda.jinyu@gmail.com>
Subject: [RFC PATCH 0/2] riscv: document the Sv32 virtual memory layout
Date: Mon, 31 Aug 2026 00:12:03 +0800
Message-ID: <20260830161205.80162-1-lambda.jinyu@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_091221_894736_CACC9DF8 
X-CRM114-Status: GOOD (  12.29  )
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

The RISC-V virtual memory layout documentation describes the 64-bit
paging modes but has left the Sv32 section as a TODO. The layout is
already defined by the RV32 page-table macros and can be observed in the
boot-time layout printed with CONFIG_DEBUG_VM.

RV32 remains relevant to current hardware rather than only legacy
systems. For example, Espressif announced the ESP32-S31 in March 2026 as
a dual-core 32-bit RISC-V microcontroller with MMU support.

This series documents the existing rv32_defconfig layout and corrects a
nearby comment that gives a stale fixed value for RV32 TASK_SIZE. The
implementation is unchanged.

The main point on which I would appreciate feedback is whether this is
the clearest way to present the configuration-dependent part of the
layout. This is my first Linux kernel contribution, so I would also
appreciate guidance on any process or presentation issues.

Tested on QEMU with a kernel based on commit 08dbfad3f504:

  - rv32_defconfig plus CONFIG_DEBUG_VM=y
  - full RV32 kernel and modules build with GCC 13.3.0
  - boot with qemu-system-riscv32 8.2.2 and 512 MB or 4 GB RAM
  - userspace reached using a minimal initramfs
  - runtime layout matched the documented addresses
  - the 4 GB boot exposed 1 GB of managed RAM, matching the current
    direct-map and no-highmem limitations
  - make SPHINXDIRS=arch/riscv htmldocs
  - scripts/checkpatch.pl --strict, no errors or warnings per patch

The boot-time layout was:

  fixmap  : 0x9c800000 - 0x9d000000
  pci io  : 0x9d000000 - 0x9e000000
  vmemmap : 0x9e000000 - 0xa0000000
  vmalloc : 0xa0000000 - 0xc0000000
  lowmem  : 0xc0000000 - 0xdfc00000

Yu Jin (2):
  docs: riscv: document the Sv32 virtual memory layout
  riscv: mm: correct the stale RV32 TASK_SIZE comment

 Documentation/arch/riscv/vm-layout.rst | 28 +++++++++++++++++++++++++-
 arch/riscv/include/asm/pgtable.h       |  6 ++----
 2 files changed, 29 insertions(+), 5 deletions(-)


base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
