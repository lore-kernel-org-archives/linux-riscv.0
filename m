Return-Path: <SRS0=Vdo/=NK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C0EC2BC61
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 16:13:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 797FA20657
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 16:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HRXEYcSv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AR5OZjfW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHBDvlke"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 797FA20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZTWtyvKv71bikH7FaFWq4kZMAszYMyODFiNqRJJHg64=; b=HRX
	EYcSvEjNzrcpicvLaV23yuzDnHCoGyhqiL5yaBeYTOvdHZ8ckPmtHjEx2ZCCXBjYWUjsEZ5E1Bb03
	SLjeVRK/77ABgHoBXI2gF6+RZTfl5N7vTJlWmQocZCzbxQUi+K9yRc5Ni38yUU1yW6+R+eco+0lFW
	P3ICva3lIOBowfVaL6c4VbVbIOHpEuscK23baspuOTAMji9zlSX5pEo8bXJVEqr1FqgzSCt/Y+NdL
	KFuQkN6cXHSXO0mVQn0ClfTLYv1HwSutwd2bJgmllhHco++jOz7Y/8dExz8c836ooQY7GLbYRoDE2
	qcHe+bNMnQ+4KYPxJstyxhLQHA2ek6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHWeS-0006Qv-D5; Tue, 30 Oct 2018 16:13:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHVzm-00085B-2U
 for linux-riscv@bombadil.infradead.org; Tue, 30 Oct 2018 15:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PcIdga3zkqCuJMMCGKfLMgVBdR4DqN1Jn/lpPqPfX2c=; b=AR5OZjfWR7Qiw05d5vs1DPnVM
 mTZNSj6hU+IWkjIQyn4++PUw62AkvY2a0NJttQl2OYcR2zpW++jENO2w+rDrXHve0MrxCyFRWL2Vf
 yem7SPr3SqDG16077W/m9I/pH/b13WSn8a/9v6QyPvBtK3uBvZ2q1Dwp8pKrwqFgNQdHxf98AZ5Dw
 aqZtGIX9Ebd6QQjwpmiL6TEmajwERiM/a+0BNnzXF/5mf32DCYEvFt99an6V8OqkU/1ufDkd3Fwop
 QdGWow2ye0scDje3UzcDDRnF5Y1hNM7IcYHX7dNpEYlqX5R8gBHd27xzpVFgDMh8Tmhvq/sFlyO0P
 WLE7NrTww==;
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHQq3-0007yR-3S
 for linux-riscv@lists.infradead.org; Tue, 30 Oct 2018 10:01:32 +0000
Received: by mail-wr1-x442.google.com with SMTP id d10-v6so11848635wrs.5
 for <linux-riscv@lists.infradead.org>; Tue, 30 Oct 2018 03:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=PcIdga3zkqCuJMMCGKfLMgVBdR4DqN1Jn/lpPqPfX2c=;
 b=FHBDvlkeG5tM+SUh4g4qptsGHgK8OsP4k0df5y4l52hk6Y1Gg5f1HwaaoJzAYFdJEQ
 xzp+HIxUJsj3kmLc7mgb4pTpHaudgGKZbZjVTVDHJ9AZozp3s5Lgoy7XHVuCdW2Pze2n
 bBRC1N3r/AN84ziKil25hZFaMFzqgi5WdsXZ9uWjipuvN0JX+729y2nAhjY3JXYUP9RR
 MIaQTP7Y2FYfQzmuUuIXfwJXf+HLXqY/E6Y+QhE35kzQzcYdbTAob9yHzZ5y6XuBhtTN
 YjghldpzV88xnx+3UYs5AzS5piClWMpLVIr5nKcgSGX2343P0tuE5i29AccGhSf7/046
 zhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PcIdga3zkqCuJMMCGKfLMgVBdR4DqN1Jn/lpPqPfX2c=;
 b=c4qPoSnYGnPaqgTl1PJR+OkMKSvku+vhX6JGeZDPf1FSokR2kP0EZ/JFLxAyEhxIQU
 1QEHIYFccVTXjBV/TUOwZeYYX3j3dw3ajIbxVXuyv/7C1FxYLJ5S4Oc7wwj6tIiOF1Yi
 J5slkH6oNjlBLuWhnoPEvSo02h+lS6kw2Cycjkq2xtxzlQ0srzxqKHf+VWNCPARbe3aq
 mcQUN1QyfSTtRIcEb5wMB+5EtZOCHVTkmfxS5LKStGxhhddRDJpobOchAQxRjLMFJDzt
 aMNAYsOea1Vo4kry/YkyblkEb2tCfcMlliT9yDJOWm3wl+yMEP5FcXN2L3AJT8lyvmZe
 DKAg==
X-Gm-Message-State: AGRZ1gKrXrGIMN2lysEMRyHmiBmVgUyBdhXhKizPUfolutnuP657lAT6
 CoQjh6JEBay6g8JR9YHh5eY=
X-Google-Smtp-Source: AJdET5fSnJcvBXTDWEZzfcCwiO4xU4tI/3q70xIOCwRMF3mHO9fpl4eUh96mK+1CuwHUM5V/q8wRbQ==
X-Received: by 2002:adf:e388:: with SMTP id e8-v6mr697516wrm.321.1540893674667; 
 Tue, 30 Oct 2018 03:01:14 -0700 (PDT)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id f1-v6sm18420825wme.23.2018.10.30.03.01.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Oct 2018 03:01:14 -0700 (PDT)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, green.hu@gmail.com,
 deanbo422@gmail.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] riscv: add ARCH_HAS_SG_CHAIN to Kconfig
Date: Tue, 30 Oct 2018 11:01:05 +0100
Message-Id: <20181030100107.4590-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.17.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_100131_138339_690A6EF8 
X-CRM114-Status: GOOD (  10.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181030100105.Bhe183beHbmcECplHffKxRHGuBWKOz8W0FJIq6jTUEI@z>

This should improve virtio-gpu support for riscv.

David Abdurachmanov (2):
  riscv: add ARCH_HAS_SG_CHAIN
  doc: re-run features-refresh.sh

 Documentation/features/io/sg-chain/arch-support.txt           | 4 ++--
 .../features/locking/queued-spinlocks/arch-support.txt        | 2 +-
 Documentation/features/perf/kprobes-event/arch-support.txt    | 2 +-
 Documentation/features/vm/pte_special/arch-support.txt        | 2 +-
 arch/riscv/Kconfig                                            | 1 +
 5 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.17.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
