Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889C1C32774
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 08:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yzz8Kd+Or2UUJOkUxXBVojxxurIbz3uPEdWJ3TGQaiQ=; b=OfItPF5g+l5IaR
	zFBylC/Ic+oSPelAtr6V7KKBM2ktytj0h462k39WWG2P+42nBjrrbETNlSkTQD5fzCUyhaD3UrP30
	fOAX7tO+Ik2VTB+9An/kgCSt2K2DOsUejBg0t9aeCi5kGXBgmHl6Hs7CkgPaS16ld7aqJMXPEqcjz
	lIw3m5YQc9tZ5PS5tCr5l8EL9aG0u/6kR0M+1zsDjPtoEDEHVuaDp9fl1g6LwdDtjqM1GvsgrCrXa
	fhRek6SotouPvUTSiskBpYFFPMM1PL3IVXJ7i0pRcZSpBqB+J2xRLhH8TuVBlikMYlhsqaqQMqewm
	AS0YWpVhjiu+/IYyspNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJRq-004b75-CD; Sat, 20 Aug 2022 08:03:14 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJRm-004b3h-TK
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 08:03:12 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-335624d1e26so174980177b3.4
        for <linux-riscv@lists.infradead.org>; Sat, 20 Aug 2022 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=QkwKuzBI7l8iu+4vGZrCJGX2wlxUTNgTxUbkf6ZqWvw=;
        b=q29S+XdSjKJaSSfq+QNYqVDNumYRTIiOmiSGRfiJ1gGCnc6wAFm6LsIqDokL/7B+sG
         DIr5JmUb/Kr/EWAIGzdvutAhF9B+ErkDH6vdmadOzwvBiiR+6KmnRyqD6jgMd9k6G78S
         9w/Di0gKtzBhfAJNK0C8pbVQB9soX9T1dnLsLMHt5p/Zauf635HvpX19I0bj5iyeO21/
         oM1rviYP3zPRujAjUlWZuLQoQSinRF9qsIw9Nrvx4i42MrEE4a8MRHi7WLmwiveZ87GM
         X4b55vMDL3EXv7D6CEpzEfftTqNVywXfGcfVXfAygtlzCT/p99AjTjr2ZuWC+CiB94R4
         pjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=QkwKuzBI7l8iu+4vGZrCJGX2wlxUTNgTxUbkf6ZqWvw=;
        b=hj1WBYqhqtlPsx/q01Br09mz5oIRLfK4m4GmSTSS4au2NK5YsQyHANYs1Zo+hP44Mb
         IZ5wKRKPZQt7F4wn2nFlYV5cobzFOKoxox5GVDoBI9dZXDRV79Ru47Mov2P0s3+sRH27
         q+anayIChf1iZQR+swrQxHSDl9kLsjaQZuD3itmrP+7t4eCMbeXx/93sCGU9yQKAeICa
         R61HlxCYuVL+x/s/wCYjPJH4WML9Rf6CV+UVeOxp6fdaq/ZzHpjNsSdySuXz+kezgoD1
         xDJLAIdmDjbrDuwkrnCeLexLh8lkPpyH+Qe4ToZY7qZ1q18Zb+Yz4fGeuzq6nuRhZC4V
         aWhA==
X-Gm-Message-State: ACgBeo2XbYtuzT+7hF0RC7KqOxoxMiEI+29twYLFqR5GVaZh1wwwXtVo
	orOgcxrY0bKliIkjlEzYctaA8be0hpVCvnzU72CHBw==
X-Google-Smtp-Source: AA6agR7Vg3h9nu/w3AWm3bt0NH9grArU/uBvyFFdE6kBRMTd70+JJAVSYhUSKPZin2LvX6SZrZxRbJ/w24PRVjWG54I=
X-Received: by 2002:a5b:104:0:b0:68e:c5d0:d042 with SMTP id
 4-20020a5b0104000000b0068ec5d0d042mr11268029ybx.315.1660982587794; Sat, 20
 Aug 2022 01:03:07 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Aug 2022 13:31:55 +0530
Message-ID: <CAAhSdy2oDoytypnjNFodEY7q_E0OVmrh=GkihQE_K5MnPcK_Sg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.0, take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_010310_974297_8D54DBBF 
X-CRM114-Status: UNSURE (   5.24  )
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

We have two minor fixes for 6.0:
1) Fix unused variable warnings in vcpu_timer.c
2) Move extern sbi_ext declarations to a header

Please pull.

Regards,
Anup

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.0-1

for you to fetch changes up to 3e5e56c60a14776e2a49837b55b03bc193fd91f7:

  riscv: kvm: move extern sbi_ext declarations to a header (2022-08-19
23:22:47 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.0, take #1

- Fix unused variable warnings in vcpu_timer.c
- Move extern sbi_ext declarations to a header

----------------------------------------------------------------
Conor Dooley (2):
      riscv: kvm: vcpu_timer: fix unused variable warnings
      riscv: kvm: move extern sbi_ext declarations to a header

 arch/riscv/include/asm/kvm_vcpu_sbi.h | 12 ++++++++++++
 arch/riscv/kvm/vcpu_sbi.c             | 12 +-----------
 arch/riscv/kvm/vcpu_timer.c           |  4 ----
 3 files changed, 13 insertions(+), 15 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
