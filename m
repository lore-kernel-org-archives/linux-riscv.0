Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F74DC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 15:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jGoypUyLjILoft917vOcsUD2jje/82vu0DHA7FfJaXM=; b=ZmiVyMWc4qKupv
	OjZ1/9dEaG7hHdtxNyTda+/9NS0pqA3lixwJqz6XUFOubIYGwvDuFKBSNoioV+TSvjxKxF0mUNO1Q
	4GFmmKlUQ76bXA23LwF7FwEkXmjKeLICUn8ro1fzyKvEJ8aRMLEGbIIuwoj3SxaQE+8E46Rlz1vK3
	/QdCr1KOh5Jqogs4WykHh02ieGgjZQ9Kgm/w3vRy3wY/kvXbpwXHUC8Eq5iWDFpmuFmtuQVxLHaIc
	LYaBJIjW+ZEueXAGXqL32YPKtdxHtLkjnGXrmR0dyqQL1A7n1AZXiVWEcNwS2tXA02jP+HHYe0cwe
	LrOHDs0y4mAHRYvPfkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEuwq-007bzH-9I; Fri, 22 Jul 2022 15:52:16 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEuwn-007byK-Jg
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 15:52:15 +0000
Received: by mail-pj1-x102f.google.com with SMTP id b10so4726172pjq.5
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 08:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc;
        bh=xxCjmpN4Td1O1TLl9RPWhjj4pmV0G2VbYEtqRP5n4WU=;
        b=RT+f+K/2V1LHD4Z/VOLMCmId4hLO6umi4FFYwOybHCOifv8e5/eRrXZiUqKVqjKzMS
         KuuE5PIYICkz428gzsdKYfmHn/0vPNxwhmigBh6C4lJgoqlPRLdjSzRjBHoA89JfceGq
         +1qfTspOAidXZUBBPeEfkwLDRijDt+Wj2mz/8QSeH7Ym+tzbUTfL/aRkFMJtg5OWD3Uw
         Wy89HSIKDDL3IA8VD7E0begRcSA+v6rDADaYcMqKRCBLjYos+5GjoPKxp9cL3iC4Oz+J
         by0lZ5hUZXD3HXzGEr+5XjUZEPc3MJGEYaQjE3hiotqTPRE+ywjBZg36JU0PNkZfOpym
         sq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc;
        bh=xxCjmpN4Td1O1TLl9RPWhjj4pmV0G2VbYEtqRP5n4WU=;
        b=OeMnZq0NT8Sv6nJeKk3BBGi38xaC9GgWygjlvy6A8C+NQ4ibZ0X5TRZvu8owhDQr+7
         hOd38ZbIcz1Qf4Z/nJThT/+B7nYnYifFiWrvXRe67XKg2Zx0H8ltT+BpC9PKzO7vRfec
         gSPRa2TbQUZpNdr+lafSEWuJeXbvRKCKLkt3flQ5ngu5z68oEN2cefnOlbZiX99O8pJh
         uqApW7vEkeIuzuVr3CFzOkFVbLHiorzXIXQtlPJ1GwNxCBj5SccQLEfecNgDwcM4pi0S
         qiQhdgoU5Wthw6PuC0EEzcxo+8IixptzXZXj8baTOQdoCdtXg0l23BVNi5FGmhAgajM+
         HMpA==
X-Gm-Message-State: AJIora/2kXP4XyAD1XCdANj/N5M3G60Yi5Hz2hRebf25FoHa6gmHn0kE
	JQT1UVeIL+C00OlNDB6gkvu6r9WgQUOXAA==
X-Google-Smtp-Source: AGRyM1vEZLAZF9DCuWsNoUFGP21Kyefpbe3NfQBqP64ehoiXTyy2/lOEI165BJMePyRi4UzpoCXLfw==
X-Received: by 2002:a17:902:ccc9:b0:16b:af81:37c6 with SMTP id z9-20020a170902ccc900b0016baf8137c6mr499347ple.107.1658505131786;
        Fri, 22 Jul 2022 08:52:11 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902f60300b0016bdea07b9esm3885040plg.190.2022.07.22.08.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 08:52:11 -0700 (PDT)
Date: Fri, 22 Jul 2022 08:52:11 -0700 (PDT)
X-Google-Original-Date: Fri, 22 Jul 2022 08:52:08 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.19-rc8
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-84a83727-f880-4d8a-b9df-0c45accff355@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_085213_885333_B75A120F 
X-CRM114-Status: UNSURE (   7.76  )
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

merged tag 'dt-fixes-for-palmer-5.19-rc6'
The following changes since commit 7fccd723912702acfc2d75e8f0596982534f7f24:

  Merge tag 'dt-fixes-for-palmer-5.19-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git into fixes (2022-07-13 10:44:22 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc8

for you to fetch changes up to c1f6eff304e4dfa4558b6a8c6b2d26a91db6c998:

  riscv: add as-options for modules with assembly compontents (2022-07-21 12:09:29 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.19-rc8

* Two kexec-related build fixes.
* A DTS update to make the GPIO nodes match the upcoming dtschema.
* A fix that passes -mno-relax directly to the assembler when building
  modules, to work around compilers that fail to do so.

----------------------------------------------------------------
Ben Dooks (1):
      riscv: add as-options for modules with assembly compontents

Krzysztof Kozlowski (1):
      riscv: dts: align gpio-key node names with dtschema

Li Zhengyu (2):
      RISCV: kexec: Fix build error without CONFIG_MODULES
      RISC-V: kexec: Fix build error without CONFIG_KEXEC

 arch/riscv/Makefile                             | 1 +
 arch/riscv/boot/dts/canaan/canaan_kd233.dts     | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 6 +++---
 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 2 +-
 arch/riscv/kernel/Makefile                      | 2 +-
 arch/riscv/kernel/elf_kexec.c                   | 2 +-
 8 files changed, 10 insertions(+), 9 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
