Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4102AC636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SXP87x1TY7f0YMj+zCYRsIcRD6dpbd59Ko+5vfaZkC8=; b=hfvcLFM2LVHKDP
	pxqYUKnDV0m0tvd8syenFJTTKvfrbhJ8pL89UymtMjMESCn6lnYNFLsbxVzU4Q6o3w9Stm75QtPDA
	H05CRtwjHkpHMwiipIsAhagye+bZC4Hg9xNZU0wppFEGkFZRKT5KcjbvagKvN96M1hjCy0Ilqs4Ch
	0uemc9FGrVDVEenYuAe2U+iyebM0kZgbKuPYNxJBPcAsUqdgsSSWOXamF2jU/2GOhzR3COW2f6HBL
	0YzGfLVwDExobEi4HWbDJdoRhxeLnAEzv78Z/TSPlozygajh5apond3YZnTCTKFbMbYqcg4VTswIs
	GeNChLD3eU5AadzBaSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMsID-008RhW-DQ; Tue, 31 Jan 2023 15:11:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMsIA-008Rg7-RM
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 15:11:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id k16so10579175wms.2
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 07:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDRV3dTpr/I1IdlDAhOzkzQeE2U7A9MUv4OTs7C9Ic0=;
        b=fdRNuWwOmD2J8LwVwU9LdwIRGl6NUPNr9RjKhhxb/oVEbmG9OehBPDVzdQa5s66Si1
         objENa14PROVzi3XlYOwtO82hNuIcp82QvpcPRmyE9PnKvTtMUvxdddUsrtYdXxxb7og
         bLq94hLu66Es1S+gIJcgdrrE+XUltHjWSreVCW3vOXjJ9JofFGvbwi26hYxyMISWFbVM
         dKPMxnwRTyke/KeD7oHAvfKyrnNGO/TscGyYoR/d/67FK+l809KkMkUFiWjKZfBiv0NT
         gDa9mYuLOu/JJDYAhiJOYPLI6pQ2c/MV3Sh7+r71Y9WBwb2jhE/vDAnAOPcjsj9Pv0JE
         AVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDRV3dTpr/I1IdlDAhOzkzQeE2U7A9MUv4OTs7C9Ic0=;
        b=7Tdz51MbMcQXccquRKyL/hqoOlDkmsZlAL90k2e9PzlHaK9cdXG2IDBwya/Y54696U
         Z5KDLwtSRkUpeNgSpK9B3YPllExi9KrN7kla9nOJ2QwqqW2TgZp52yJNqT1YhWXc6O7X
         8G4CMR2NPvvlbho26ejv61x1YvIZZSLq4pVhFlCNoiVj+loGiOLxtE+FofFWzbRfE0x1
         oachUVvADjSBK9Bfoa0m6PPV/snjo5tf1UVOGG/DcxqF4cJ62/vi0cPad0GStVmpfzvU
         G8UKrt++e/fHi7pVjcbuHTPjp0WE/KP/Mvt3xkFDxpCuaorjRaYYBZhTD8iz7hIzN+20
         e70Q==
X-Gm-Message-State: AO0yUKXKW2VzH/eMUDARRHKei81hZnW3LIL3qbIivpLtmESkGo3j0dw0
	QZRiRUFt4n1/1a77OzmzvPzpkw==
X-Google-Smtp-Source: AK7set/2iizYZSQzebD1MVfEgv6lMNJzzvCce0t08tWnm7LHavMfZ8xs0/vr+y315lraYo4rANMjYg==
X-Received: by 2002:a05:600c:a14:b0:3dd:97d6:8f2a with SMTP id z20-20020a05600c0a1400b003dd97d68f2amr2027264wmp.33.1675177884047;
        Tue, 31 Jan 2023 07:11:24 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id t1-20020a05600c41c100b003dc47d458cdsm10651305wmh.15.2023.01.31.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 07:11:23 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 0/1] riscv: Allow to downgrade paging mode from the command line
Date: Tue, 31 Jan 2023 16:11:14 +0100
Message-Id: <20230131151115.1972740-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_071126_913205_58283CC7 
X-CRM114-Status: GOOD (  13.32  )
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

This new version gets rid of the limitation that prevented KASAN kernels
to use the newly introduced parameters.

While looking into KASLR, I fell onto commit aacd149b6238 ("arm64: head:
avoid relocating the kernel twice for KASLR"): it allows to use the fdt
functions very early in the boot process with KASAN enabled by simply
compiling a new version of those functions without instrumentation.

I had to change the handling of the command line parsing to make the
code self-contained in kernel/pi/cmd_early.c to avoid calling too many
__pi prefixed functions from outside this file.

I'll use this approach like arm64 to handle the extraction of the random
seedi from the device tree for KASLR.

@Ard: I copied the "pi" name but I have to admit I don't know what it
means.

Alexandre Ghiti (1):
  riscv: Allow to downgrade paging mode from the command line

 .../admin-guide/kernel-parameters.txt         |  5 +-
 arch/riscv/kernel/Makefile                    |  2 +
 arch/riscv/kernel/pi/Makefile                 | 34 ++++++++++++
 arch/riscv/kernel/pi/cmdline_early.c          | 52 +++++++++++++++++++
 arch/riscv/lib/memcpy.S                       |  2 +
 arch/riscv/lib/memmove.S                      |  2 +
 arch/riscv/mm/init.c                          | 36 ++++++++++---
 7 files changed, 126 insertions(+), 7 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/Makefile
 create mode 100644 arch/riscv/kernel/pi/cmdline_early.c

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
