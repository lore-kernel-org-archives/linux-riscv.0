Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E163AC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 00:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YUoYenj/rBlSeX7PgLSh0rDo6L0VUJCcrvsS/Pkedq0=; b=lsfNWQD06MXTxc
	eOctCBFnMnZR+r2dhCr0UIypagtu6W1iKwhIACErj+pHzUhWLBFUrAta12s1pvV0rZJtrb9FOLX2H
	FYlq9EN3cOzzbHyT2DwEHuT5ITGzsGhVGkmHlaTTE84w4qcLoEseQpXAv2Rzp6E/zhp+bEpAXBz1d
	taQNXxXZZd29NxC1WgnqXOtc66sLeEszreH6as41pnB9DBGRzAZO/Psqgy+gfY6W8GPA7N2P4YB7S
	p49OkZSC6rpJsCGPkUiuzArQKg+Z+byDt8Y3tgUL9qwhT5Wuq1X3i8SbwHy8w3yzZgq/+VGLjNXYd
	VQTRWhBjWvtFT9ow0rVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naRWD-007d5o-PW; Sat, 02 Apr 2022 00:21:29 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naRWA-007d5B-G2
 for linux-riscv@lists.infradead.org; Sat, 02 Apr 2022 00:21:28 +0000
Received: by mail-pj1-x1035.google.com with SMTP id jx9so3730564pjb.5
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 17:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=jE+qQRnH9EKgrMoxHiPjgfT81dDNV9zU2JaW9VDF4bM=;
 b=kcVdaV9kFD1mzfOI66TNwyrUp9m0UrekXboMtXebEuUsbYN0sTNU7raS2Q0myNwDA5
 wDrn3vK7oYKx5sH1rEvvYvw9s5dZxrXo3rrdp7tlRv4M6q8seNVMH3poSWqIiVFrO7xW
 e0CLAGyHQDuyFOIDi6cgX4S6jTNaoi/rc5BCgiGe7FMC8lliortw/7EMC3tenxFO6NTk
 cuOSSc5CL/CnbXmE1iHVx0Oe0mPUjTe9fHZlQyL5NjAjWODtlt5JiS2naF+4bXkUdtYt
 ZNCP41fjCvDU4qDcGaiteArhNo67MSK9gqrgNwbcP3mzBjp8DAkuvLznEBCiH5VrSGjj
 1Q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=jE+qQRnH9EKgrMoxHiPjgfT81dDNV9zU2JaW9VDF4bM=;
 b=mMZyxBX8z55COCwdswbzz6qGyj5Mw+CmdUF1k2VGdilch6mWS+LF4m1etXVgWhVnde
 vpgFKWYRaXYXAjQafKKR8DwX8sdH+0pWq3Xl9d+4qbi8aXRPjf8ZlqcIn49CHNSDnnyO
 sSynOqZucaw2yY4hoNVQpCNVnIy2LuuzhCJxG+MaCtepgkNiBHzqrkRK0rpOdXbXg+i5
 EFAkyTPtI8Y9f1YQKMgHBLxbQF/H3ZprxGiThqujxe+aUZ25imVeTcd/VswK3RILakaD
 yYi5yJf+CM3UaSwi/supPRNvMhOv9Hf6Ninv7QV325nhNgcG4OQ+YZP6tcAG4tuKqmkW
 b0pw==
X-Gm-Message-State: AOAM531FZsocdlXmgz/kuVMHN3yAOO061GRNTcYcBCj3UQath7bwWPdr
 IWE3374UBrrkXZ9TVZB32Gdv+BieD6ApwEkk
X-Google-Smtp-Source: ABdhPJy8cCGJ5zbFQT6QaGO/PVGAMAt0Cw6l3K0ZwAdLtAtTVjI51pCipkPdILkC3Zn0LszLzXUxqA==
X-Received: by 2002:a17:902:74cc:b0:155:e153:6273 with SMTP id
 f12-20020a17090274cc00b00155e1536273mr38412627plt.55.1648858885359; 
 Fri, 01 Apr 2022 17:21:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 k18-20020a056a00135200b004fb18fc6c78sm4374471pfu.31.2022.04.01.17.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 17:21:25 -0700 (PDT)
Date: Fri, 01 Apr 2022 17:21:25 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Apr 2022 17:19:22 PDT (-0700)
Subject: [GIT PULL] A single RISC-V fix, ideally for 5.18-rc1
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-e799956e-2858-4ab4-9795-1255abc93c39@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_172126_750724_D2047C81 
X-CRM114-Status: GOOD (  10.81  )
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

merged tag 'riscv-for-linus-5.18-mw1'
The following changes since commit a3dfc532b8731843c12bdc45e804eacc47e51e50:

  Merge tag 'riscv-for-linus-5.18-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2022-04-01 13:31:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-mw2

for you to fetch changes up to 2524257bce43610f5ec14feccbacf7a103cae94a:

  dt-bindings: Fix phandle-array issues in the idle-states bindings (2022-04-01 15:09:50 -0700)

----------------------------------------------------------------
A single RISC-V fix, ideally for 5.18-rc1

* Fix the RISC-V section of the generic CPU idle bindings to comply with
  the recently tightened DT schema.

----------------------------------------------------------------
This is a very recently written, reviewed, and committed patch.  I usually
don't like doing that, as it means it won't round trip through linux-next (and
the automatic builds), but I think this is a good candidate for breaking the
rules: we know this breaks the generic DT schema checks, it's been pretty
extensively reviewed (thanks to Rob for the help), and it's very late already.

We have a handful of other DT schema related failures on RISC-V, but it looks
like those have been around for a while now.  I've got the test running locally
and will chase those around, but this one breaks the generic schema checks so I
figured it's best not to delay.

The caveats about that allyesconfig driver build breakages apply, as they did
this morning.  Otherwise this is still clean.

Sorry for the headaches!

----------------------------------------------------------------
Palmer Dabbelt (1):
      dt-bindings: Fix phandle-array issues in the idle-states bindings

 Documentation/devicetree/bindings/cpu/idle-states.yaml | 16 ++++++++--------
 Documentation/devicetree/bindings/riscv/cpus.yaml      |  2 ++
 2 files changed, 10 insertions(+), 8 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
