Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCE0C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 05:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=15oFOoeZ/dG6KQW9jE8b1A4asW68EhrEC6fROG7tOro=; b=RrrMqMtbLQtwnh
	sdYBZwMZvMsycBNiKgMNnmiapmwyLqQiBA7/zXfuFWAbopvMFVMfu5NUDVueYd1+ACY/b+l6Y9zBq
	pxiQaSSRlGU79FlBrx3G6e88i0tvykPkprFleeDt1Lhn9n/0Z3tf/6lgCg4EUB0nytJok4tANkdG8
	sSdnAWPkivC4/opCeO63vmAccDPeid+MbKTXlfR2orJIU/qlRMdW8DBo6oKKERAL9XWTFKHVcFM7G
	11J8AYF2qyAuu/6cGgh+ysIRTEwXLhaK+E0T4yOhzNvpjQ30EX+yQwGAkxfQRscjIri2qMxNqDlNR
	F7K/Qmp/L+pM1sOLNDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzAbd-00GoyM-Ee; Thu, 09 Jun 2022 05:21:17 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzAba-00Goww-0I
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 05:21:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u8so26468535wrm.13
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jun 2022 22:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=3JvmTDsGJDO8gLLj4AkIUZGP939Dw1HwCVtV4Fo1fIc=;
        b=gvpL1tx8KEFZNPWGZCgk5FC/3L2U7PZMRwO9ausTf+jLLYmZwWAdvdIUejsm+2wTBx
         QauAaV9t6tSX2IayxvQU1LJIFVbnfta0gAOd8aFNxgJ87G1xNV21ncl5wcmbr/7y1myv
         CWAa/X8nB6ygdk/1nQ6m0x7FL6bBxjojSoPyq1pbIJHFYPkmI7WLjvHB/8vwgb2jMScc
         Mzp24FW8/IFCzNRRbOLSohAT0Dha4ewb7uI7TlUlQKzfZ+aZg5NbGzj4rCdlPTDS+7wp
         Glhm71qxTVSQH3Va5gVbKt7j5JpZ3PPzhPrVSLFv2cUXlWTBANcgObx5ZPRa1P01Gpop
         0hMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=3JvmTDsGJDO8gLLj4AkIUZGP939Dw1HwCVtV4Fo1fIc=;
        b=tjEOGGN9A5KcOtbs0jx2Stip+VywKLAy8wnG10SRUxR4LXcDADnOiVjk1AuZtFMjCn
         9eOvkuCBH9TsS9mwK1kHKPzaysqxdkMoE9FIjmwt02aZisSxHjbNSQoLEXhmcaW5laL1
         hCaIwrUEybrKzu/ez68q2eh+uPyTh23wzysvVuceUEoDMeAen7YtlBx485XdYS7O63BM
         /BNBWkGKODg3lqygwVHiTZkFhgvZ42Lr9QopcF2jd/kC1cWjSy/3pl6O/GMZieaMPbyR
         BZtHWT5+Q2MRRXwSgvTboJCt4PQKrHHHpt1/i82oADRKerKjPSiES8KI+WxYjaRt7Mry
         odhQ==
X-Gm-Message-State: AOAM533FUhxuVXyI1zcWH53QVhumnLwYwGQKbFC/WVO3kzIUn8M53MmM
	xaT4U4NRQy9vwQmpgE8dgIVLfDBunrM2jkJglUKtyg==
X-Google-Smtp-Source: ABdhPJwwgl51ub88+ijPWwcfkn2THzzdQExCqu39kwCgVQUo9/VGLBkfRIBDJKUNmtB+lj/v62O5FE3nmVeTvZ5tt68=
X-Received: by 2002:adf:e30f:0:b0:210:346e:d5da with SMTP id
 b15-20020adfe30f000000b00210346ed5damr35611235wrj.313.1654752070224; Wed, 08
 Jun 2022 22:21:10 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Jun 2022 10:50:55 +0530
Message-ID: <CAAhSdy3BY551VEP5D-_vj7nzhb9O_k69v99jMdjQ+OxWZpxzpA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 5.19, take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_222114_085031_404667F5 
X-CRM114-Status: UNSURE (   6.74  )
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

Two minor fixes were missed in 5.19 merge window which include:
1) Typo fix in arch/riscv/kvm/vmid.c
2) Remove broken reference pattern from MAINTAINERS entry

Please pull.

Regards,
Anup

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-5.19-1

for you to fetch changes up to 1a12b25274b9e54b0d2d59e21620f8cf13b268cb:

  MAINTAINERS: Limit KVM RISC-V entry to existing selftests
(2022-06-09 09:18:22 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 5.19, take #1

- Typo fix in arch/riscv/kvm/vmid.c

- Remove broken reference pattern from MAINTAINERS entry

----------------------------------------------------------------
Julia Lawall (1):
      RISC-V: KVM: fix typos in comments

Lukas Bulwahn (1):
      MAINTAINERS: Limit KVM RISC-V entry to existing selftests

 MAINTAINERS           | 1 -
 arch/riscv/kvm/vmid.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
