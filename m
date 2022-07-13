Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D86C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 05:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MRKvUKU3lkueRz3cWxoHDh1psDuyCWQMNEDPWH8tTVg=; b=WOg6vyxlAvXOVe
	X+LfWQXQSPzzmatzC4RtnoSdRdfRgReQNi2z/Txojsd/etfmoY7Pp5X28m32t3zAEO0DF3h/EjmlK
	gKFsskY7u5bAua0HMfuki4x63Qes/EPrCbBP0DZCzZURoa1gz4vg2sSYqSEADKDC8hcV07R3gLYtR
	UCVjHjviuCrp+z/SvBVQXlBX1ICa5XZZsY4KH8KOxgATo7iJGZMrLYeoliJsvUG9gJzM0QLQ0MrH5
	iigfJ+8yUvIu54vrIxHxuAP45rdH2z/2JTR/h7X3kfgxsjrXbbSwKSteJxOIiRFauKzIo+WumMK1v
	iNseNeXmGXUjkREIMsqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBVEi-000Kvh-H2; Wed, 13 Jul 2022 05:48:36 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBVEf-000KrM-L2
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 05:48:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id v14so13951593wra.5
        for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 22:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=a7Jq6CNl2s/wsfuy5DRMvbAZURyt/0nHWoFVyeWRnG8=;
        b=ij9ylmOiMr6PNwHJF7dTc2/1Ag8iFSebIsCAGIwpIZvb8rUZium6cfRyZmuyO7YPSA
         zCfn8ChLLcGJDNXYjzr6v58aWDrRg7+rz7z7YXKMNLyklIrD1wmFoliRXt2BMc3PI+yq
         Cz5+NA6Agb1n0LRZ/fYEcFynKyAmay+FkWtBQ61YhDtG+FrOf8rmUe4QZ7HbxEgL2ZjY
         A+TAo6vaeGxK4RML1Nw3EM8o1XXVLtFImc7nzPK5i4qfXQ3n8J0mifNEodyAurloab9S
         XYRMYyFd/uJDJUAtcayGr/n9GaEmPtBnuQplgrqESw8ePCo34wRiwQ79DXC8/c1nn2Vb
         uDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=a7Jq6CNl2s/wsfuy5DRMvbAZURyt/0nHWoFVyeWRnG8=;
        b=TlVrg4/cLQg2SSas44hP/G39etVi1OdXNzrpxGjCFaM4v2RlhKPgj/l4WIQqyCTovX
         P2UlI4zBYnvk0GpJSXnKuZjT06YU76v17igY4aTwGsHs3A/kEjsZ/Kwx/a4hjHRcEDeH
         HJfTBkjoXGPbEAPTD6i5mXXwvLoVQJJwjiKa9LOJbh9eNB6Ldmzf9LyCpg5HfayuwVg5
         0344YapoE2dK2iacU65gyLjvgFZ85QmxrIuNcfNCF7uWY0SGgvj69ptXgKw4uzR6EYyY
         tcqzwFmihvt1wTlQ8IAesZi4tSBot3NzmGpEFs8e/hKcSvUN2Rqw9xfqAN6Fs9xaknC7
         u9Mg==
X-Gm-Message-State: AJIora/ZXPRp2ztqXWOcLRZ92D35zPWotsJlOirw/UxXPOXzEcAnrzlX
	v1nGIZwHQ9yaozJhvxrXN6GpM4pxi+FNcliQc3AowA==
X-Google-Smtp-Source: AGRyM1sqkc4Ob6zlaKqcQ56jcIYT4y+cTXdT478VuRnF0kpbKo2bWa1a73J8Q25v81LPyt/PWSacxa+pf5n4C1oXGR0=
X-Received: by 2002:a5d:64ac:0:b0:21d:7832:ecf9 with SMTP id
 m12-20020a5d64ac000000b0021d7832ecf9mr1416098wrp.86.1657691306384; Tue, 12
 Jul 2022 22:48:26 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Jul 2022 11:17:17 +0530
Message-ID: <CAAhSdy1CAtr=mAVFtduTcED_Sjp2=4duQwgL5syxZ-sYM6SoWQ@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 5.19, take #2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_224833_712181_45342F2B 
X-CRM114-Status: UNSURE (   6.44  )
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

We have two more fixes for 5.19 which were discovered recently:
1) Fix missing PAGE_PFN_MASK
2) Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()

Please pull.

Regards,
Anup

The following changes since commit 32346491ddf24599decca06190ebca03ff9de7f8:

  Linux 5.19-rc6 (2022-07-10 14:40:51 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-5.19-2

for you to fetch changes up to be82abe6a76ba8e76f25312566182b0f13c4fbf9:

  RISC-V: KVM: Fix SRCU deadlock caused by
kvm_riscv_check_vcpu_requests() (2022-07-11 09:36:32 +0530)

----------------------------------------------------------------
 KVM/riscv fixes for 5.19, take #2

- Fix missing PAGE_PFN_MASK

- Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Fix missing PAGE_PFN_MASK

Anup Patel (1):
      RISC-V: KVM: Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()

 arch/riscv/include/asm/pgtable-64.h | 12 ++++++------
 arch/riscv/include/asm/pgtable.h    |  6 +++---
 arch/riscv/kvm/mmu.c                |  2 +-
 arch/riscv/kvm/vcpu.c               |  2 ++
 4 files changed, 12 insertions(+), 10 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
