Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA79C64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 15:02:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BBEB20850
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 15:02:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZTvwOmcc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/EHpjkq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BBEB20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SNtCS9RWlvYoufs8HFtvBbODBstlubm8gF+pGz70UOM=; b=ZTvwOmccMnplGD
	4+Yun2fAYyGfnFPtnTo7Nd/eTy/wAEgAmuUkiwuFbLgsC9ya0A/Jao0itcDI9UQ7co6gntWHCI0xi
	zpREtHxI31tDBn9t7322h0r/xYo2vimQtYYb5figB3m8GPm1fdLsD3SZ5dur2nUFONa0ACbtkow3+
	GNld8lAGGjuhdoaqiisFyzVEf4Vi/rDQLBHFZnsXambSgEU2lr/PaWl5VFG+62fW+EbyC0q1jOwH6
	Q5aPrKADytTURpqayPZutRCnF/MwShKgG9o4K99qbHhJW0bcNRLm2fLHx1MvrJvE0EKLA7l7krmKL
	NekAXv2omK2Q55kewDWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUvAS-0000jB-Rm; Thu, 06 Dec 2018 15:02:20 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUvAO-0000hE-3k
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 15:02:18 +0000
Received: by mail-wm1-x343.google.com with SMTP id r24so14330786wmh.0
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 07:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wk8Tnme4bbqG3+h4d86EKaBi7wPmuDTPdXEEnReXJ4A=;
 b=N/EHpjkqTWKjgqSkOlTjkDXo/pwUWieIGKYO4EpsKf4t59q24pnoEftZU0NmDrvNBC
 HQjJuJOypbvOX9wZSTvZOLQJffPAWvZR0yY1J+Fuhm09ZhvEf3WX69iGs9W0gowXbqIN
 mC9njeuRVySLafFGDwYpyhWQ0C8MHONm9mR5P9sD6n5u6YjFY7Bl8Mj5wofjeRWDrltD
 IEltuc38IR6MV7cadiKoQ2PY0K8yr393HEHRkHsyXNaDYVOxGV+BjpET7jGZGeK003xy
 U3PvMI3MJHZJ4VDqokwub3zJTtaT5NkhczmnPzFKDBynapoFXlyFDTTTXr19FEK998+b
 9zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wk8Tnme4bbqG3+h4d86EKaBi7wPmuDTPdXEEnReXJ4A=;
 b=HCAqE9rWo05dZo7POxgj/tQbs4lq6goRbzASin5PEPk8r5GlAA1JeoVnW7jRnvtjc1
 oIy7CVZqpS3jBMd1Og3utFaLrlEQowxL76tAUd3NkYdub5ZeJm0pQvR1j3JlQ2ZNcj81
 L5jXsgYHPmBs3sBPF6R+TGTEd24lBgqcPszfWfIcEwjU+ggY2SqUn1cOkFJMh9IJYw3L
 pc7Xb9juxGGw3uIJj4aV6AVOsu8O5Ta0seP/HA+R4mhKZPK1EnHIidrUt0GBzZDPQJtA
 Qw7+7JhxgwoEo61eGXwLm641hU3UnRmmekmvbucu7eH0dz0rGxs3d44srzXw9GsFONq1
 qI7g==
X-Gm-Message-State: AA+aEWbi2i06jNm2DkHvoKkLNdO3UbebfrEOYF594V7NW08wtuvhYswb
 ab3GXKs2XSgtXh4JOVi9Ol4=
X-Google-Smtp-Source: AFSGD/UVOJM66XYYaUjPwVXWLk9eVU1L6NjBdcIUR9aVX4TEFGE9dvix3M+yZx1VCJNY+uM0ALZtbQ==
X-Received: by 2002:a1c:d7d3:: with SMTP id
 o202mr13863733wmg.135.1544108524137; 
 Thu, 06 Dec 2018 07:02:04 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id 14sm1629981wmv.36.2018.12.06.07.02.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 07:02:02 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 luto@amacapital.net, wad@chromium.org, green.hu@gmail.com,
 deanbo422@gmail.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] riscv: add support for SECCOMP and SECCOMP_FILTER
Date: Thu,  6 Dec 2018 16:01:54 +0100
Message-Id: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_070216_206010_87F5E0B6 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This was originally tested on 4.19 kernel with Fedora 29/RISCV. 
Depends on audit patches (already in linux-next).

The patches are on top of linux-next next-20181206 tag.

Validation was done using libseccomp (at 
1e64feb5f1a9ea02687228e3073e8b784a04ce46, which is master at this 
date). See PR: https://github.com/seccomp/libseccomp/pull/134

Test results:

# ./regression -T live

Regression Test Summary
tests run: 8
tests skipped: 0
tests passed: 8
tests failed: 0
tests errored: 0

# ./regression

Regression Test Summary
tests run: 5129
tests skipped: 104
tests passed: 5129
tests failed: 0
tests errored: 0

David Abdurachmanov (2):
  riscv: add support for SECCOMP incl. filters
  riscv: fix syscall_{get,set}_arguments

 arch/riscv/Kconfig                   | 14 ++++++++++
 arch/riscv/include/asm/syscall.h     | 42 +++++++++++++++++++++-------
 arch/riscv/include/asm/thread_info.h |  5 +++-
 arch/riscv/kernel/entry.S            | 27 ++++++++++++++++--
 arch/riscv/kernel/ptrace.c           |  8 ++++++
 5 files changed, 83 insertions(+), 13 deletions(-)

-- 
2.19.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
