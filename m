Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E55C3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 18:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=uKYgtXrfC7wbKVZHjhFROhzikSlrSMECbqjhtcrS138=; b=sXJ
	6deJw8G/NnLg2XZ+ySzyNv1lPf/MoRkfantTcucc/8rpNbmyjspgRJlr6a/XpuIIf+MElym6kQdXX
	q3Rx0Y0JjSYQjaj/hMCf6BMTDBXM6UFj8kMNV42MsqCrxl3vzUdmjO0pqNT3sCNS6ZHMXR20c5Yr2
	tjnWTLH7KXT+vjxTh5ivx/X7Rt9N9y2H0nJugFmqkZj5aaCTygkgEuRXl8i/Yi42Uz9caEOuJHkzO
	Q6rCms/l5NalWUXpVOFDfNJ8jKLv/l6EAYwF0/gkWKJOwD9+dRHIvVaVXpTNyAR1dRN0BDKbtLuNL
	BKq/D7hJXusIWnfRxIrbbenB23HUHUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSNO-00000004Yof-16Tz;
	Fri, 09 May 2025 18:23:14 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQJq-00000004EZo-3S71
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 16:11:28 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso1757695b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746807085; x=1747411885; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0aOqCnvyo4Ljy+61VpgCipssWf0Ra8mXAaOhu5oDyc=;
        b=1PC8wA1Y8J3F3vQgvTj0duVKvEYNG436RaNHi6WmgSzF5Dkv5LlP75rnT82wQN94b0
         i4KJHNM4Y/viWAmZXwxHSXQ4rWFazo/2hRpnhPucLOPgn6enzeIsk02of4JLKc7lH6oK
         TnHT0yBbboO/8gB0SL7DQPxeWHJifU0UgaaP4nv5DaiOcffayIT9K9jQx73QCx5scUxl
         IBQct5OGRVbvHIQPstitvYW0MRxNVCtxkmyV91s997s9ve+xVc0VAFB/YDnSuHZzMpbN
         gYSVnAPgm/8UFOHz0lZFYhX8/HKWL7yt1OIJSLaoi/i+ZxPybjjMvebRfh8Y5DbN/9tq
         aSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807085; x=1747411885;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0aOqCnvyo4Ljy+61VpgCipssWf0Ra8mXAaOhu5oDyc=;
        b=xDCkqp4TiUQTbdLd04aFtdKB4qKFVZ6vNOpmcAP7A33eLj6+KvsHFb/KBJigpok5dH
         GK7HRze2kJGt5pUpHeMh7JIviHvIw8rFl195C66/YyXK488yOLZAEF06N8z6F0+JPdBw
         DIbw+bZCYKrV6EzBVVW5v3ibidL7lR4MyiJ4NnytNPgt8VQnL01raFfKnOjF7H3kN8E1
         mRf3TYKdW3/IXYiOuRVnXDA0nF7Lvhq3UXbnfUPWbKlt0mlZe0OnatHeOKi8l3AfVz7x
         HVQHrppF2MSbPhWISgyIUbr06d+it8eYITkpEI/khvbB6+6UV2vwpmtpC2rXZbw0EeSy
         hCdw==
X-Gm-Message-State: AOJu0YxmHdlBBPU0HPG8vNEYNV96zadASv8/uXhLKm4pVgfaHN4YEE3o
	yMsNMxd0QxoMcWLc9HbIHAbl9PrGHJ69OW8d+9wYSPVAY1Ss9fpKdHLPyIQlEgSXnQZawcpKeM8
	f
X-Gm-Gg: ASbGnctet/5yAzA7bNpEJkeCnSJB29amui9A+YFJGX5NPsr7vflsUV4eypbJLFzUzIP
	Zrg+Lg2IGFvGQN+hEM3xbNudsutXj+mcjTH2tCar9DgE13SaHTyAhg6W63mYqQGrVFLuRbU6sDw
	gLvoqZBJh9UIi9jTmqAlY0YgV7YKbkhy8L1fRY7+mXZqTeSpu00w4lSkuVVcjiiA8fbPw7QBrza
	MFsEAYhHqfTPe+k8ovdh4CYNUPC48N69Ih7I9rri3MjSLDiXmIEszgpgWhawy3npnl3fpfNnqko
	XnIVh4i1eJcafKehFO5COPGeQ6s64KHnBAQ=
X-Google-Smtp-Source: AGHT+IEaQvJ6cNeijm12GFun8Lse7HD+SQLVVMBCDaGkKmpgXK4wErI1P+ztFGBP7rqrmf4AzD++Rg==
X-Received: by 2002:a05:6a00:17a3:b0:736:34ff:be7 with SMTP id d2e1a72fcca58-7423c059c37mr5277416b3a.15.1746807085226;
        Fri, 09 May 2025 09:11:25 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237727a78sm1978937b3a.53.2025.05.09.09.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:11:24 -0700 (PDT)
Date: Fri, 09 May 2025 09:11:24 -0700 (PDT)
X-Google-Original-Date: Fri, 09 May 2025 09:11:22 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.15-rc6
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-e96a9b93-7daf-4aa3-86f7-461467c1ad5b@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_091126_988777_DAEA62F5 
X-CRM114-Status: UNSURE (   8.20  )
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
Content-Type: multipart/mixed; boundary="===============6303329485165463805=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6303329485165463805==
Content-Type: text/plain

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc6
merged tag 'riscv-fixes-6.15-rc6'

for you to fetch changes up to 01534f3e0dd75e27ed03e5542f0c7bf6aa7130f1:

  Merge tag 'riscv-fixes-6.15-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes (2025-05-08 09:40:21 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.15-rc6

* The compressed half-word misaligned access instructions (c.lhu, c.lh,
  and c.sh) from the Zcb extension are now properly emulated.
* A series of fixes to properly emulate permissions while handling
  userspace misaligned accesses.
* A pair of fixes for PR_GET_TAGGED_ADDR_CTRL to avoid accessing the
  envcfg CSR on systems that don't support that CSR, and to report those
  failures up to userspace.
* The .rela.dyn section is no longer stripped from vmlinux, as it is
  necessary to relocate the kernel under some conditions (including
  kexec).

----------------------------------------------------------------
Alexandre Ghiti (1):
      scripts: Do not strip .rela.dyn section

Clément Léger (3):
      riscv: misaligned: factorize trap handling
      riscv: misaligned: enable IRQs while handling misaligned accesses
      riscv: misaligned: use get_user() instead of __get_user()

Nam Cao (1):
      riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL

Nylon Chen (1):
      riscv: misaligned: Add handling for ZCB instructions

Palmer Dabbelt (1):
      Merge tag 'riscv-fixes-6.15-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes

Samuel Holland (1):
      riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm

 arch/riscv/kernel/process.c          |  6 ++++
 arch/riscv/kernel/traps.c            | 64 +++++++++++++++++++++---------------
 arch/riscv/kernel/traps_misaligned.c | 19 ++++++++++-
 scripts/Makefile.vmlinux             |  2 +-
 4 files changed, 62 insertions(+), 29 deletions(-)


--===============6303329485165463805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6303329485165463805==--
