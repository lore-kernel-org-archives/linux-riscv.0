Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EE7C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 00:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0/r1GEBtj586kgY0RqATwGhZ5CnjmsSZXpftVjDxKpw=; b=gULXvoW9oaUhUF
	ghsKRP06pZqpkuijDXbCuGdyQ71ASmWQzC5JaoLFNPiK4i+veBFkHxWjt1Irv/Fdrj2I4D9otMJlf
	5gOq8TiMscQUbnAaq6t8tbEHJ/0v6Zv3IMogn2o4MXWzF4o06raVQiPKX/WGtTeUHWdH8516EFbuT
	ISJbSlPuYGdqj8Y0+8OMdyE+E/MbIjjm1j0vIxuIrM+xXPK+43Hf1TzW3hEIe+GIFfaXeLHDBHVKR
	mGI453QmA3CZa/8xMZg7YaDDxcK1YCUrO2Lwj1h74Zy19b3uzlpjo2uCjYF61Q8NbcN2RALnOOzco
	s7BZyj5lAaUx9cfT0eIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXAJF-00EeC8-5x; Wed, 01 Mar 2023 00:27:05 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXAJC-00EeAG-69
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 00:27:03 +0000
Received: by mail-qt1-x829.google.com with SMTP id y10so7961566qtj.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 16:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677630419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2e0ffjzBgpw/mSpMPgFDPU3Iu4DLibmhol76pOXRIs=;
        b=JvUxM5yaXhG1yLskvHq/jdt/crTRoc2cpek2vwFU9tHZ8PWilIci1ft4Rv4MnUzyDS
         DppkOAAsR7vaj4gBF+hd2iwr6YEqhwFVOypMzzR4Dsnho6g1kbRSLjOWH+JA4/dsJrSh
         /DAD2n95qaAfNduS1P0nlcux57ipcj2cMnmRBtH7r3QHA/ZcAIFkqSAcEqBsYktlCGl3
         EZgYPgVgRWSvfL2RXhVobMdiE8d4GH0VFB9GeoKO94NjgCIh15Lqq5wZZsloI6sldkGB
         O9eMRe8AHzGTVhhRF83y55Hr6tR0BudvS7NPVmudLIY52p+T1+wK8kJoSn1kn5619SPI
         ajZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677630419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2e0ffjzBgpw/mSpMPgFDPU3Iu4DLibmhol76pOXRIs=;
        b=RgZKQRSZzBU7SrYJeqwhGF9bU1vRWF4DcIqPk0bKMd26bffHUuOgHWj04PkGJB1x/K
         /Swxr21nl66Ls8rVMmXoTbK6xzPadogbWjaQSd+r1g1WE7NfQKO/WIVk7TnqGq0yqxsI
         nRonWbZtNOJElqE0dRrtaTQoCcU4fMn6DLf3ktsXQMy4GX1x7jpWyqTxQAE4AkhzQwIc
         qAQV412AVeoIYaGJegRXb+5NIrFH9SH3LowsKEFboj9D3ls7xzNufw9TBrQgPLzExovJ
         l2+IM+f1Pt6ukv2HSXg2DEcyYSxFu36KRaiC8RYpHUiEcz5TlH6iTSi/eEfBXDCpTh5D
         E8ww==
X-Gm-Message-State: AO0yUKUkAVVBwZPhTPbNUIwFf6aPYYskRU++d/+fME/ErquJXf/zoQ0Z
	9wclbR+usSiAMLKdv3ImOLuRnnGIOiw=
X-Google-Smtp-Source: AK7set8ZrXnrEKvBEmgZA3GMxTz87fkxaL3fF2SH5BuHhWPp6/NLV3fXU6uI2/NbwAoVDP0lMQf5BQ==
X-Received: by 2002:ac8:7f16:0:b0:3b6:3995:2ec2 with SMTP id f22-20020ac87f16000000b003b639952ec2mr8856720qtk.19.1677630419223;
        Tue, 28 Feb 2023 16:26:59 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id t8-20020ac85888000000b003bb8c60cdf1sm7576698qta.78.2023.02.28.16.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 16:26:58 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Yimin Gu <ustcymgu@gmail.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v3 0/3]  Add RISC-V 32 NOMMU support
Date: Tue, 28 Feb 2023 19:26:54 -0500
Message-Id: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_162702_266591_EBEE1648 
X-CRM114-Status: GOOD (  11.12  )
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

This patch-set aims to add NOMMU support to RV32.
Many people want to build simple emulators or HDL
models of RISC-V this patch makes it possible to
run linux on them.

Yimin Gu is the original author of this set.
Submitted here:
https://lists.buildroot.org/pipermail/buildroot/2022-November/656134.html

Though Jesse T rewrote the Dconf.

The new set:
https://lists.buildroot.org/pipermail/buildroot/2022-December/658258.html
---
V1->V2:
 - Add Conor's clock patch for implicit div64
 - Fix typo in commit title 3/3
 - Fix typo in commit description 2/3
V2->V3
 - Change from defconfig file to a PHONY config
---

Conor Dooley (1):
  clk: k210: remove an implicit 64-bit division

Jesse Taube (1):
  riscv: configs: Add nommu PHONY defconfig for RV32

Yimin Gu (1):
  riscv: Kconfig: Allow RV32 to build with no MMU

 arch/riscv/Kconfig     | 5 ++---
 arch/riscv/Makefile    | 4 ++++
 drivers/clk/clk-k210.c | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
