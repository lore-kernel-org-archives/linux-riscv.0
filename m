Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D24C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 08:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WYvUJDPD0DWuoEwg5tUWsFCMcjoNWsXkQiPYZbr6TVw=; b=eqila38ihOnaoZ
	b9NvQAEaDRUqnua8vkXyNUxeFXrVFgUBfCSFTTm+l3WtSt1dhxP/z+MHONi6ZQKjNEROm5oLu3IUC
	02d044Ud3Jo33xeNaQjnbg/0KN9J9njTH36SU/pocfuMztPPdG2dhVk4uqmqseKYb1Ga8UuzL9j09
	RTJwjtd7CFYnkulbGTaQ5uS7gS3Ihjpo7JW7V0J1ohi4KbwO+vNx7uU8jM1mYnIWjVx/ra4GXEpRV
	QWqDtBPPXQbsdbB+1AarBdZLjgisy8jVYgrHWkHAW/0LKoGv59G4g8U1espC7uPeLWrp7dwZPHCIn
	CieywV4d+CXwcvziu1ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKb4S-006OOi-SD; Wed, 25 Jan 2023 08:23:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKb4P-006ONG-Jh
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 08:23:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id t18so3387015wro.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 00:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5YDvDkWAbLDWKsnQUnWtcsgg0pzlyYSw3Ro2XkM1b1U=;
        b=kcqF6iq5mRuvn+vLGKITzcs41XGVfxnke94ZRKDv6r/GXQtJq/DjhtH1Bka1ZuWmOz
         hs+sqQ3WOiAIzxmt/9Zuy/4eSmxyAq/uDcMuDh+FJbpdipz28DjE2DIVkgbNi25nI5zK
         jZGqHtN15KR7z7UdxlfjkoHN0aNKg85LhpwylDBIfJNneOTjMUQ1oWWjUE6Vj1+92pDr
         DRAh5QfaLNT5gzj81fbZsHRopjbSDX3pwjXbQqwgN0tn+3A3A42nZDMT6rcPdvCmhryC
         zOFWEjBbK4SyukL/JoRIo5lmLYlAkvj+bWXz40K7tGlP0Gc3CfH5evRrgYHF5D/SHgDa
         TiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YDvDkWAbLDWKsnQUnWtcsgg0pzlyYSw3Ro2XkM1b1U=;
        b=3VJ3yKYyCBZIZtWKam+7nRBUkvtWwTEHVw6rkqZRVcu9FSxDAZdN9VLd/NYlY80fL+
         vuvXIuk563jUusyBUDGgd44plHa7mkqz4pxjNKiTmyAonlKl2yAIdn8SVYW3FFw2Szvy
         fGWDQbm8B8JY12w2zwsETerOjKlZFaXUTBnne7TzPNPJpi9MjZ1dO8ASWR3dD9/htPJF
         WrfR8ew2V6FXrM2eQ8F/H0afCeDnVcVqvUbPSd3HcvBdpxZ3wdcOD2CgOmT24WBPOQ0I
         gL9pZnjHM2dZNrc2JxngfKrMoZtUXwfItEr/LhB0G1u0zVCI8/IO9fYOWLZaNU2MqGao
         q2CA==
X-Gm-Message-State: AO0yUKXZCjvI4a029D/HJZ0+TfaugCW9SikccNqenJrm695HsxpP0r0x
	GI7Cwxm8kQSAXUvCillk7jRzNQ==
X-Google-Smtp-Source: AK7set8JCzmJVT6O7sSrzWnjZzAPmb2N1a6Du011MY/JsAbWFnt0usJeT+kWtq+HdmDEjFicCUfIZg==
X-Received: by 2002:a5d:42cd:0:b0:2bf:81eb:dc26 with SMTP id t13-20020a5d42cd000000b002bf81ebdc26mr7593494wrr.37.1674635023170;
        Wed, 25 Jan 2023 00:23:43 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id a18-20020a056000101200b002be25db0b7bsm3821071wrx.10.2023.01.25.00.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:23:42 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 0/6] RISC-V kasan rework
Date: Wed, 25 Jan 2023 09:23:27 +0100
Message-Id: <20230125082333.1577572-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_002349_665656_E1F7D918 
X-CRM114-Status: GOOD (  13.97  )
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

As described in patch 2, our current kasan implementation is intricate,
so I tried to simplify the implementation and mimic what arm64/x86 are
doing.

In addition it fixes UEFI bootflow with a kasan kernel and kasan inline
instrumentation: all kasan configurations were tested on a large ubuntu
kernel with success with KASAN_KUNIT_TEST and KASAN_MODULE_TEST.

inline ubuntu config + uefi:
 sv39: OK
 sv48: OK
 sv57: OK

outline ubuntu config + uefi:
 sv39: OK
 sv48: OK
 sv57: OK

Actually 1 test always fails with KASAN_KUNIT_TEST that I have to check:
# kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan__test.c:1020
KASAN failure expected in "set_bit(nr, addr)", but none occurrred

Note that Palmer recently proposed to remove COMMAND_LINE_SIZE from the
userspace abi
https://lore.kernel.org/lkml/20221211061358.28035-1-palmer@rivosinc.com/T/
so that we can finally increase the command line to fit all kasan kernel
parameters.

All of this should hopefully fix the syzkaller riscv build that has been
failing for a few months now, any test is appreciated and if I can help
in any way, please ask.

v3:
- Add AB from Ard in patch 4, thanks
- Fix checkpatch issues in patch 1, thanks Conor

v2:
- Rebase on top of v6.2-rc3
- patch 4 is now way simpler than it used to be since Ard already moved
  the string functions into the efistub.

Alexandre Ghiti (6):
  riscv: Split early and final KASAN population functions
  riscv: Rework kasan population functions
  riscv: Move DTB_EARLY_BASE_VA to the kernel address space
  riscv: Fix EFI stub usage of KASAN instrumented strcmp function
  riscv: Fix ptdump when KASAN is enabled
  riscv: Unconditionnally select KASAN_VMALLOC if KASAN

 arch/riscv/Kconfig             |   1 +
 arch/riscv/kernel/image-vars.h |   2 -
 arch/riscv/mm/init.c           |   2 +-
 arch/riscv/mm/kasan_init.c     | 516 ++++++++++++++++++---------------
 arch/riscv/mm/ptdump.c         |  24 +-
 5 files changed, 298 insertions(+), 247 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
