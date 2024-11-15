Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1592BD68BC8
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 15:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tRBRLPHRFaRWyety119aM0ZAw4guEiPuhtKyyrCeSQM=; b=wcsH5bzKa2Zqvx
	im8aNIjvX5KfOfVisUeDCbTIozvPaRaac0LbYFBtHpAfVFNlMOKvs3As6tqY7V7RkkQhIOyFBc9HK
	Qbh4C/+T6gZg34c1zWmTeCq0XUj2fpsEecTm1a/tzCdcJLdoDmqfvIqzalIvBRb/q5MTTKJxvwSLU
	0LzHuwo4V7oaDm4Kf3N0C9dtKlx5ApHurHBqJmO8Ov+N/IejsKIV0VywjSaLHzCLcjfas0+1bO2wy
	HldyoXvRh43uNK24dGC1UbUJAmsJNeZf6YdqGQBRzBodrWkR4UgL92bUnSueDScRNujmkGsweJ+Hd
	Fm46NxV4x5SZ9nkgaUMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tByPY-00000003CZh-111X;
	Fri, 15 Nov 2024 15:39:04 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tByPV-00000003CYf-2SxT
	for linux-riscv@lists.infradead.org;
	Fri, 15 Nov 2024 15:39:02 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7eae96e6624so1473333a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Nov 2024 07:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731685140; x=1732289940; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ND7/dKOs1bs7dRKWzno0aqrE7dox+7Zrrq0GQ0dkX+4=;
        b=HKoMoCOJRpAn2oOdTISVKANR9p2BvMbOIHurNgy+jRQG0oBAGcpJJJ2HZaHKYRObeS
         UGZ6X7pcox1y9TlhN99BpKOLlpKoRgJeybM7WFjDDJljWldyMZNJSArtESYBuinxJCFL
         xsK2++aoZjuNDqYP4+zp3+69lWzLg+Ff9sKpptAWhfOKKRxfbpenk50DRN6upPmKH25c
         tXbeQhe/FeWiEVgEKZ3YYncn7Tp+qeOJXgfPAaofWB6c+Zmgva6h+uW/fHxRysmJ+q3K
         o7aZoBMmRnauvPt+Rj60feHgnI7Q5XIWZ9/y3lcrVJZPSQOp4yR0cGrNq8z7CsnUjGJE
         vr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731685140; x=1732289940;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ND7/dKOs1bs7dRKWzno0aqrE7dox+7Zrrq0GQ0dkX+4=;
        b=LV6dntu3gIDMO8G4OSfNsJrTfQwMAIDu4eQ26t3SreH0ADKcGeK2KCI5PnzxinkTVB
         /t3PrkgdKwL04L4Mocpx7C1VZLENQNPDpVZgSTelOsaiJVjJPDEGAKg5oFZgyOzJp2BS
         epzXKd7rvImhmLX+cRSnm8VBVizbD2kVJAMKceZIywgYlGIWOquXNFwwp0ERoRV3W67/
         rvlCJ/tmG92pLZpOjp5NP1HKVQgh7llyJrry610GvEE5LHxtguh63w25MvQsW8wKQPdv
         nLm5UbEfShdZmGPgUelE2czvzIkYt+EiWIhfZ8qfdl5uZByyQnlkdGCcoMD6SN9zLb8n
         6WTA==
X-Gm-Message-State: AOJu0YxeQtnZQ7cDfXBzNro/Wr7SQb/xFwV5Sc8hyp77+eOM1EfLwPeD
	tHIY/Eg0EQEpzwswzR5nUbrH7r6ggYMNPdaxUGCtMs/uexK7IET+iP/qa6/ppXJmq1aS7aZ+xQ8
	q
X-Google-Smtp-Source: AGHT+IHmyajOc05t7LbFFeyz1KQSLtKrSNK6NRQQd7WDn0DudtcjHK4tw6yfgrqZidHenGBcNslnHQ==
X-Received: by 2002:a05:6a20:430f:b0:1db:f05f:55c1 with SMTP id adf61e73a8af0-1dc90be213emr3376469637.30.1731685140058;
        Fri, 15 Nov 2024 07:39:00 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724772001adsm1480640b3a.178.2024.11.15.07.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 07:38:59 -0800 (PST)
Date: Fri, 15 Nov 2024 07:38:59 -0800 (PST)
X-Google-Original-Date: Fri, 15 Nov 2024 07:38:57 PST (-0800)
Subject: [GIT PULL] A Single RISC-V Fix for 6.12-rc8
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-257c7a1f-aca6-48f9-b3ec-6a4673f8d33e@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_073901_836482_2136619F 
X-CRM114-Status: UNSURE (   6.90  )
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

The following changes since commit 59b723cd2adbac2a34fc8e12c74ae26ae45bf230:

  Linux 6.12-rc6 (2024-11-03 14:05:52 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.12-rc8

for you to fetch changes up to 57f7c7dc78cd09622b12920d92b40c1ce11b234e:

  drivers: perf: Fix wrong put_cpu() placement (2024-11-12 07:34:27 -0800)

----------------------------------------------------------------
A Single RISC-V Fix for 6.12-rc8

* A fix for the CPU perf driver that avoids leaking CPU ID references on
  systems without snapshot support.

----------------------------------------------------------------
Alexandre Ghiti (1):
      drivers: perf: Fix wrong put_cpu() placement

 drivers/perf/riscv_pmu_sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
