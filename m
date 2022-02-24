Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017ADC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FddN4P4fp/aFaiJXSzSJNkOxmTIcA4/dpSpgD/W5h9w=; b=yiifdNS+6fIf5H
	+ZIfGP9xblHiajljVAjf0ca9BybgGje1zT16OyqZuF0Uh7xMvZOmEB537PHJg5w7/qJXVM6214HnN
	kY7JiCdwPtC6j5KVaF7lMjkLmXqKnCIaGtIJPzxA5t4r7A9I2aYk0uWBjC0CjARhyeiT9a7c0e1pQ
	Djphrc2C/WYkUgXg5CNQo/KE0ltJsRS/vHamsJW9O2V8sSHmWRMYJvsGns5+SplbvqYhOg6aSDdms
	BcgPqVydDAdjeAXIz7gopMzQ1R08FwykGlF9IJwtZIqNKShHd4nk8JzYAhCTPmmijewnCddW8i2Yp
	qxtc7l652Mqw/v9UmdZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNFzh-001Hym-Je; Thu, 24 Feb 2022 15:25:25 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNFzb-001Hsc-0X
 for linux-riscv@lists.infradead.org; Thu, 24 Feb 2022 15:25:22 +0000
Received: by mail-ej1-x636.google.com with SMTP id lw4so5064358ejb.12
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 07:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8bKHwHd9wrNVqM17Oa3exsITsVuSL3cS/OZaCl9ltdU=;
 b=Xu14nMrdL/kEer+3zNMAoJu75pcDa/4wbBn87Aq91UuLQXEwfPwsOfgSRU4uufnmA7
 +qKlGVqeIjGlUAbmRb1cf4snlXfZmBEg1wyREArT+I18vzgOlZgPrIyiejvoLrPPlhga
 1+poolq+DiL1yPIQ34m7Uy7poHA9pT6p2wDh9pgdWpMFaB2J9t83hJGna8kyGbkVaI1B
 3wPn7yE/bueB0kzwy2+wEtLQn/oeP2TyHvvkhgUd+VRs6UZOyWU4Ts/dvlI4YxWJuouX
 oxVktOY0T9gO2sahD52w/uNdkwU1tF2bA0zbho4nXrRHuku14R3Z2xVKoXKasOjsU2jG
 gv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8bKHwHd9wrNVqM17Oa3exsITsVuSL3cS/OZaCl9ltdU=;
 b=rluPiy6dBzXzNGIazU2IkHbuoylXEj5MPCCY0xTZjQxVPkEGRPc9ZAPHCHGWeUKnmz
 cv8LL/o1RlZhaqD2+nsBYC5438CHuvu53hDzRqJTLzmfDl75Ax2ZArCA+Aygjxmuub1P
 GFttoGiOpSTTmSIsKAbVfxzz2SaqacGIlFbNNR51jCvComBbI1+dl3ozHPUPA4eDsdeM
 0Htz5Sp68o4PopI0ZScvFFi+Qu29NriYpJHMLj58jO7OEbVRgF87AQJHPpbFv+sV1Urx
 a3c7nJrdtz4VG9rHDf8PT+xG7vmf8nX0v+vpG3gDhIr/Ja+dhJVPpayHdFl+zclDk8tj
 WOvA==
X-Gm-Message-State: AOAM5324sQMjnBgUX9I/l0+xRmBTx3yVAWPndksdJmk/CheEoHqM9/dJ
 y/ayDOdWZ3imKzSzORn1jvYPnAhQiwTMm4LP
X-Google-Smtp-Source: ABdhPJzdcnTid5+1b8gpHvm6zGYUVRj5BmDXAL6rYfBuRhTnrWv3XXZCJSqhWEaGX1ZLmRLi86sJFA==
X-Received: by 2002:a17:906:8d8:b0:6d2:131d:be51 with SMTP id
 o24-20020a17090608d800b006d2131dbe51mr2612370eje.564.1645716316455; 
 Thu, 24 Feb 2022 07:25:16 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id s11sm1509693edt.10.2022.02.24.07.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:25:16 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] Add RISC-V asm/insn.h header
Date: Thu, 24 Feb 2022 16:24:48 +0100
Message-Id: <20220224152456.493365-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_072519_070047_868D9077 
X-CRM114-Status: GOOD (  12.89  )
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

This series adds a RISC-V asm/insn.h header to consolidate instruction
generation and manipulation similar to arm64's asm/insn.h.

The first three patches are preparatory patches fixing unaligned access
in module relocations and moving unneded definitions out of asm/module.h
and asm/ftrace.h.
Patch 4 adds the header and the remaining patches converts module
relocation, plt entry, jump label and dynamic ftrace code to use it.

The only obvious code left to convert is the BPF JIT(s).

This series depends on the module relocation range check fix here:
https://lore.kernel.org/linux-riscv/20220223191257.143694-1-kernel@esmil.dk/

Changes since v2:
- Split the range check fix out and send it separately.
- Convert "if (IS_DEFINED(CONFIG_32BIT))" to #ifdef to avoid compiler
  warning on rv32. Thanks kernel test robot!
- Add sp register, load/store instructions and RISCV_INSN_REG_L,
  RISCV_INSN_REG_S and RISC_INSN_SZREG macros to work on both rv32 and
  rv64 to the asm/insn.h header.
- Add patch moving unneded definitions out of out asm/ftrace.h and a
  patch converting kernel/ftrace.c to use the header.

Changes since v1:
- Send the right patches.

Emil Renner Berthing (8):
  riscv: Avoid unaligned access when relocating modules
  riscv: Remove unneeded definitions from asm/module.h
  riscv: Remove unneeded definitions from asm/ftrace.h
  riscv: Add asm/insn.h header
  riscv: Use asm/insn.h for module relocations
  riscv: Use asm/insn.h to generate plt entries
  riscv: Use asm/insn.h for jump labels
  riscv: Use asm/insn.h for dynamic ftrace

 arch/riscv/include/asm/ftrace.h     |  35 +----
 arch/riscv/include/asm/insn.h       | 151 ++++++++++++++++++
 arch/riscv/include/asm/module.h     |  87 ----------
 arch/riscv/kernel/ftrace.c          |  56 ++++---
 arch/riscv/kernel/jump_label.c      |  12 +-
 arch/riscv/kernel/module-sections.c |  71 +++++++++
 arch/riscv/kernel/module.c          | 236 +++++++++++++---------------
 7 files changed, 364 insertions(+), 284 deletions(-)
 create mode 100644 arch/riscv/include/asm/insn.h

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
