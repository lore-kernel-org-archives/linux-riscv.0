Return-Path: <SRS0=LL44=PU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4885C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 12:34:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EBE260FE8
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 12:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EBE260FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IRaShq9M5jHBr8uVunGQkAUjEUSb5h8jgCl/xIzwK+k=; b=xIxFH23HBY4LXi
	NbniC+aBDLGjCihQEwicn8vBDgTyfqMfAN0wob1wIpMChEXPepR6aXPi5LP3vwPapFu4Dwd87+p9Z
	d4FlFUXTnzEP4QL/tHW/jZlLRU5DzC056kkb6SxQVsmeJVpRLJdI+aAIlI5WzI7yAsZ8AqC2q+FOi
	tR4ZQaNLc6KNSbCletnIehNI3lZiE0pQ9XlQJcDFc2vFcBsSkzXCNit8l2iqpgx/Q4nJMQadsZ2sw
	qE5SCfnw6sRJcW7AzAL51ood83cOJJVwYXehb+5Vy3bQSJBrd/KrLlhL+DphsLzXPx3gXG91qrqWX
	apo43ssc0B48TDZ/QrqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhWWJ-00GPQd-Kr; Mon, 01 Nov 2021 12:34:35 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhWWG-00GPPF-FL
 for linux-riscv@lists.infradead.org; Mon, 01 Nov 2021 12:34:33 +0000
Received: by mail-wr1-x432.google.com with SMTP id o14so27837690wra.12
 for <linux-riscv@lists.infradead.org>; Mon, 01 Nov 2021 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=y2Y8ilwyriUGgynMYA//pB8+mWDgGay/mxGbSkA0Eaw=;
 b=dWbZ5hl+TdK4c89/9/Zi3TeCysZvskdagk6cPPB/UOgyPuNIYJhHaNTwLjhTX96cfZ
 rONGHyASgQZcBVPl6XJb4hFnQU6VzT8tBTLsAmuzw2ow2wSS0S7qRhEhp+JZ1xrh++pQ
 USWPRap6wBGCT8nJhEQxW60dXU1fXMV43ewud+QlhicLqXBwqdzB26MEFzzYNxVOlJV0
 kUGtE+E7PbbALSqGQqMpCZuJCo/OqOvwbFTnX4THLD5Jyd20Zo+yDVje6BPSmiQeo7aF
 qvdBdlT3rV2xJXfHxhDatDNSq4Hg76ZtEKMxxlNFQsyKZHRb1vBvpvbOoxlg/lmJX5QZ
 abng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=y2Y8ilwyriUGgynMYA//pB8+mWDgGay/mxGbSkA0Eaw=;
 b=sNFRka5QpgtKB8DPjIwOdVrPfkylYxuDR4qICqk5rDs/9Zb6ByXbMQP6YrfY0H7ROR
 PLISe/cpFRvSTeVOa3dmS7KR/rVwd4cAqvaKbJ0EB7yr3HQwXRkOKbRZAS5JQDY2q+9M
 1L7z63dsjh2PCOJHaII199+oaAkeW0gXIQxZc3PAMRM6uFqmZbJPTda1uT+7fdaWHM4N
 Cj+e5DShj7Ox3yK5+ozgNmuTH+mbVM5EOLyWR5wovQwAbt84ZWHM9w1Y4ydmyMd1O5lQ
 8NIEUDZPLfeLAIRXs4ebc8RYpvVy79FDu0H2mMtzlnxcO8bkpbaLcxEb8CoyLci5fQx4
 Mj/g==
X-Gm-Message-State: AOAM532JMCHaGHnHYRXLo59CbghDQ0U9D+S+R4nm7YA3rFFrQb0UoZB1
 kRsAH9DyhrmavTSHZtdqpcWJ5NnCWDKc6sPwUFFEXg==
X-Google-Smtp-Source: ABdhPJyju/FbxRBXiA9b3A3dGPr7fMUwMbj02mX3uH1UpvPkV4V9+KVxHWflnZp/9M2Io/WVc9SRwGgvCE1MnXaRY+0=
X-Received: by 2002:a5d:628f:: with SMTP id k15mr24637104wru.363.1635770070888; 
 Mon, 01 Nov 2021 05:34:30 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Nov 2021 18:04:19 +0530
Message-ID: <CAAhSdy0TUZAgb5Wyp4Lnv30A1sJ009ATr9VTq49ow_C9-YVeBg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv for 5.16 take #2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, KVM General <kvm@vger.kernel.org>, 
 Atish Patra <atish.patra@wdc.com>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_053432_601653_086011E6 
X-CRM114-Status: UNSURE (   6.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Paolo,

I had two warning fixes in the KVM RISC-V repo which I am
sending as part of this PR. Also, sorry if I sent the PR too late.

Please pull.

Best Regards,
Anup

The following changes since commit 9c6eb531e7606dc957bf0ef7f3eed8a5c5cb774d:

  Merge tag 'kvm-s390-next-5.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD
(2021-10-31 09:01:25 -0400)

are available in the Git repository at:

  git://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.16-2

for you to fetch changes up to bbd5ba8db7662dbfcc15204eb105cd0c2971a47c:

  RISC-V: KVM: fix boolreturn.cocci warnings (2021-11-01 17:35:17 +0530)

----------------------------------------------------------------
Minor cocci warning fixes:
1) Bool return warning fix
2) Unneeded semicolon warning fix

----------------------------------------------------------------
Bixuan Cui (1):
      RISC-V: KVM: fix boolreturn.cocci warnings

ran jianping (1):
      RISC-V: KVM: remove unneeded semicolon

 arch/riscv/kvm/mmu.c        | 18 +++++++++---------
 arch/riscv/kvm/vcpu.c       |  4 ++--
 arch/riscv/kvm/vcpu_exit.c  |  6 +++---
 arch/riscv/kvm/vcpu_sbi.c   |  2 +-
 arch/riscv/kvm/vcpu_timer.c |  4 ++--
 5 files changed, 17 insertions(+), 17 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
