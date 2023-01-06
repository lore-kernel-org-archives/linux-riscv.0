Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD02AC54EBD
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=eBoK6bIKpV/uPJRompHWeuY/fLyTD+xO+ohsxVc1viM=; b=k1R
	puFcvBy9h8N9fnCS8kf4gwysEoWvwdn4pLlZDvfbMhX92D1egQd3zrcrhvRXj2LmDwooOaZVFdoMa
	gHcqwGXOESaojtM/QnfmXlIEzUHtYz+19daeVhMrVoJDF4i68CntDCrn82U60BrJHjshhn2k6iZNV
	kdmv0kVj+UyMZzTM4R3pHueoTlH5R48vhjwYYeYyhFhVTTXBmT6bmyWRMYOrt4kGiQQgHK28x3gOM
	lLEqNHXGEZgMt75NqMBFslzkap3Q9soZFB0VYkZzGt4a50dUO4VO7+4G+93W4sHjnc0WYzBtpy5WB
	fvK+D7ZTGd7EyRZvR17z1Nhrb9ADXcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDrDT-00EKyZ-R4; Fri, 06 Jan 2023 18:13:19 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDrDR-00EKy3-5p
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 18:13:18 +0000
Received: by mail-pj1-x102c.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so2468894pjj.4
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 10:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hDoZANBTNDNXKHRfQT835o0/wxRKpaQa8h7cG3GL/I=;
        b=HpjIMHcBeuTexqS2iEUlRTJtstviTWvrYux58Oe7sSVYKSsf8XLttXnje1jWEiI+RH
         lpVVdi6QgNKudvhxlav2zAtefm/YAQAUlaGrnfxmM8nNR4O9Un7adDztJtLbebJOhMu+
         sR0RnQ2OhAtl8SxMify2tJxr0rFg4rrM1ohv6/1wicoDOyMWzBadR47ewwDJiQBRDqbC
         +cbdgO9hKvnaBINC5sxCA17HaxzDRorlUH0VMmT8Ep2X5i5yGTUi+A2w/AduOyUY1E8J
         qABf2cxNhaHH+ZWBaEv1yXAUKXZnJ4OinSSHjhU1kjUs4j6m48qqoh/R6ekQg7c3iKSx
         TVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hDoZANBTNDNXKHRfQT835o0/wxRKpaQa8h7cG3GL/I=;
        b=313xBg+v1xyrDEpVGLgeDMTkAOJlgWhbxNNMhKtQGOiKYsRHDsCJpnWO4LxWKa2sg0
         vqSwFQPm0V5gYOvNfZVL2wCiO/fTd9RnucZCylER4x3yMdsUdJDEgS4Kv+LGBaHCU4Uv
         jniMCskvqobqwXh/oflG+v0Y8yShdwui5otbEvGScdfILE7WE+ijkLPqotgIWmX17yJ2
         pPL9vKgX5iLMLp2GoIv2dj+ZbgCPHEcXN4xI0+DIvyA4E5RqYAp0GA/Y/0EFYwPEbLS1
         Bwezn9M7rGBRqcpHQY2DcVWJEYpoFiArqgzFMt8bBrMmVhaqvIpTDW6X1MJwQ9CYwakC
         HRRQ==
X-Gm-Message-State: AFqh2koYUFTZ/fK7PQIisE/B8ObOv6nOcq03chaLknuE11eiGJjN0nHI
	BxnMJ8jP9Nj2b7tT62ffK0LR0VHHdDUheGAt
X-Google-Smtp-Source: AMrXdXtL7dEzbBeZBTDGsfdqX7GT2hNOR4M+KwHHWAdzB2yvEwA2LC0r4975u/7an5Qm82ZxvgGaqg==
X-Received: by 2002:a17:903:2404:b0:18d:61f6:e254 with SMTP id e4-20020a170903240400b0018d61f6e254mr74183365plo.33.1673028790203;
        Fri, 06 Jan 2023 10:13:10 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id e18-20020a170902ef5200b00187033cac81sm1235942plx.145.2023.01.06.10.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 10:13:09 -0800 (PST)
Date: Fri, 06 Jan 2023 10:13:09 -0800 (PST)
X-Google-Original-Date: Fri, 06 Jan 2023 10:11:53 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 6.2-rc3
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-96b62708-327b-4721-a0ef-49ef52a1b3c2@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_101317_424582_241F5577 
X-CRM114-Status: UNSURE (   7.90  )
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
Content-Type: multipart/mixed; boundary="===============7469402609376085002=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7469402609376085002==
Content-Type: text/plain

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-rc3

for you to fetch changes up to b9b916aee6715cd7f3318af6dc360c4729417b94:

  riscv: uaccess: fix type of 0 variable on error in get_user() (2023-01-05 12:30:41 -0800)

----------------------------------------------------------------
RISC-V Fixes for 6.2-rc3

* A fix to use the correct mask for c.jr/c.jalr when decoding
  instructions.
* A compile-time fix for get_user(), to avoid an sparse warning.

----------------------------------------------------------------
Ben Dooks (1):
      riscv: uaccess: fix type of 0 variable on error in get_user()

Björn Töpel (1):
      riscv, kprobes: Stricter c.jr/c.jalr decoding

 arch/riscv/include/asm/uaccess.h         | 2 +-
 arch/riscv/kernel/probes/simulate-insn.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)


--===============7469402609376085002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7469402609376085002==--
