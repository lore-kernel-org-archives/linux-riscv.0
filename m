Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B9BC6FA82
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 14:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=giXJqMYSKO0ckb0am5lsvbTHN5mOvbD2gBLJh03tYek=; b=Q17hdlmlBrkpGK
	iXEBPKT32rfNxYZjB9ko7QogGlw88orc/wsj3q7iAmWH11sjouwvu9APg0TZI5L2Psy68JN7EWlZj
	VA1Fo90YJfpORb/WlG9wjEVdIPAtHuE5PHsA9UofUgmZmo/FDZRCrUtL2SwewjVAxGrJNkNX8aEmP
	CP/UgITO8zj2J4htupwyYO24g52pgIVlnsbqevQfMAGdc+I0hsCV8Brm3+A/rnf4KYBEb0zhFcoeJ
	WSHIADbjMbNPEOH6ii0R+w4iM0iSGGgu45JJ0HA2lulL7IgsmAvokCtE4YhsOefCjX5E07koTlEGb
	j+iMovlxGT/1CR/13N4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWern-00GgWI-1A; Fri, 09 Sep 2022 14:20:23 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWerj-00GgVO-Or
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 14:20:21 +0000
Received: by mail-pj1-x1034.google.com with SMTP id u9-20020a17090a1f0900b001fde6477464so5488465pja.4
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 07:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date;
        bh=oec0hsn7Vj6Lsi1D1urX59gL9xUdYb6/NenHblk0y/o=;
        b=sQybks/LaONptfza6aKqOLqmzdWZ+YRsbNpztiVSRq/JMZqw6IUFIcSL1W42H1D0gS
         IBgrn4SVMGLdtfh3jVS8FVWYUL/bh+TJjfponh4iCftkW4/LIb2ot7NC8DvmKQIsymDe
         e8P4k9ZYAF6dLnmPV0MytOGFIS1FdnrekusF6EiiA6NTA23s/aptALhthYfB2gKoycvi
         8xkBm5cqaJJT66V2VmF7ztWStW348CP+8Rn0Pm/iQRFSxqb0qZ4jmuj7uLFcel+BelNM
         nXLLjfn+yFnlKEpuTTmhTDk5aD8AKT8Umz+sHaUJWyf093LFMVl7pGfT5O+0REb4qE0e
         6M0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oec0hsn7Vj6Lsi1D1urX59gL9xUdYb6/NenHblk0y/o=;
        b=NHNFobfNF4sDNYJCIGj1e0oFBYMsNtG84VOIrddP7SgaQT2c8+lPEL3xBblpGbaTK5
         Iq28ScTOsiwP4ZTzvhbqvNRgFtP2RjQvxd158MFARt1IKtQc/AoptfmcttnFejEr5y4+
         fT+6ukLuMAoL6zyrfux/kpHckq1QiVI0icHRIESeb8S+XAz3Ho+j566oLng6R3uKH4+f
         A1zkz2k16WZ+5BFZhzFMUy5gEGaWRok84P2HgMPaTduoFcOZTD3ZqFOmUpeXpA9ybFDg
         CrOp+Yna3I/oHQ9R/6WC9cHA8ynEHg5UkURI8t8oOoj7Njx0G9C5WpuL3JwxElMEXvvD
         kueA==
X-Gm-Message-State: ACgBeo0NKYST6kAjvo3zzQKSQq5jPVZ8t4AZHI1z3QEYBm4fi8uqIek/
	34dolgfZ5qKIcdPTuRZRyqztLcEIAeeMX8CorzA=
X-Google-Smtp-Source: AA6agR6IU8iIBjl6/ctV6IYJtquGCshoeNTNDKJPa1vOlXqfcdxv4Ia1rnI8eabDPxhgPB8cWlYCRQ==
X-Received: by 2002:a17:902:7082:b0:177:f7fc:5290 with SMTP id z2-20020a170902708200b00177f7fc5290mr6787355plk.143.1662733218057;
        Fri, 09 Sep 2022 07:20:18 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id n26-20020a63a51a000000b0041c49af8156sm604549pgf.6.2022.09.09.07.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 07:20:17 -0700 (PDT)
Date: Fri, 09 Sep 2022 07:20:17 -0700 (PDT)
X-Google-Original-Date: Fri, 09 Sep 2022 07:20:13 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.0-rc5
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-8b892856-b176-48da-8f9b-869810e0cf26@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_072020_021982_1D2A1920 
X-CRM114-Status: UNSURE (   7.36  )
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

The following changes since commit 1709c70c31e05e6e87b2ffa0a2b4cc0da4b2c513:

  Merge branch 'riscv-variable_fixes_without_kvm' of git://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git into fixes (2022-08-25 16:38:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.0-rc5

for you to fetch changes up to 20e0fbab16003ae23a9e86a64bcb93e3121587ca:

  perf: RISC-V: fix access beyond allocated array (2022-09-08 13:50:25 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.0-rc5

* A pair of device tree fixes for the Polarfire SOC.
* A fix to avoid overflowing the PMU counter array when firmware
  incorrectly reports the number of supported counters, which manifests
  on OpenSBI versions prior to 1.1.

----------------------------------------------------------------
Conor Dooley (2):
      dt-bindings: riscv: sifive-l2: add a PolarFire SoC compatible
      riscv: dts: microchip: use an mpfs specific l2 compatible

Palmer Dabbelt (1):
      Merge tag 'dt-fixes-for-palmer-6.0-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git into fixes

Sergey Matyukevich (1):
      perf: RISC-V: fix access beyond allocated array

 .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 79 ++++++++++++++--------
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |  2 +-
 drivers/perf/riscv_pmu_sbi.c                       |  2 +-
 3 files changed, 51 insertions(+), 32 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
