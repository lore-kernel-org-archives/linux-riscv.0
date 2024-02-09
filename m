Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263BAC4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 11:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=owiJnvfWUcNb05oDo0AB5GUfSneUNsWgxvF1IgL/nRs=; b=u4seIbLLL4LbdS
	Oj1m97C1+3S2SAZ9rd0+pRcpx3Ha6ASyIgY92RlxR/MeC8Nnrksl9HC8EWoG7bzo/uaE4Oc0d1WdW
	Yd/zj8L/LIcT0HvgaG5ohjGiL16E0FDyJZ5zIebuFaptTHfOUXGGXEhV/WlVRgfTAkgTUL8tRwdb3
	vwSleptSwgPZpJFivSfeoITOmL2yUGM08wJyJ/o1Qx+GcDm3AIvkcxf9elWlQudeg+51DFlu0B7wB
	AfKJEU/xN5kBq42bExgxl9m/bZCapqB4Sb+6fHeUEt4f5KCejP2OVH6rqQ1KH/Ai9p9IeAo1QVE4l
	yIje7cOJ54uo28slj9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYPVd-0000000Guqe-25jK;
	Fri, 09 Feb 2024 11:57:33 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYPVZ-0000000GuoS-258Y
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 11:57:31 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7c403dbf3adso40050239f.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Feb 2024 03:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1707479847; x=1708084647; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gVdsIIV1a3ztn0kr929T9f3wstK7N0r++7XA7d2BHl4=;
        b=oVeCD6yZB+rI+HSo1/l2EkZUQCx9ivx9s81wk5voni6X8OiTJBHZoxixwwRMIIYH93
         m8PW3jFSlMYSYFuQMC6E2+wjPbIIN/XJkUNrH6b7rzcmpkwfdHmbmZpBaHeuPvCtiHfB
         WX09+PUEHq/KtiZqMuuSyirjQhBO4jekgcE9PyAQraE4u2HJV7m/aBgL5CrkSWs7vIlV
         /wtfZfQNuhXYXbB9813UzDjNcByV8Mmp/qTlyp/UaF0Ca2aI3ieB6ayaHyZ0rePhypwc
         4PGTodiIDbo+/HxpqZXKcLMrQMc6vNs/sZDlIkSDJuRMdotY1n7P1Dkn3up5wAkPHjUK
         Friw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707479847; x=1708084647;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gVdsIIV1a3ztn0kr929T9f3wstK7N0r++7XA7d2BHl4=;
        b=fI+8wQkF1lylidt3bbnhQ7UllQj3tUsNb0M8H58uAOAWnFjWXMH1p7qypnZV54E/bg
         sdFYUyalxnQWu7FrydS7s0fU/zM+UG0dzP9gD7M03epk/kvo/GAEQjt3gCSu7AHr5mrC
         3+o9RoY3ZZQWOE09PKDVlG9wgS3WKDnnTmgFmkTTzlwc6xPJvvJOV89UtVmZfUBNSv1A
         Qr8XlkigzEafXxc3b2/XWNqHBey86alrIPBcf2mXdc/v7hO458uG+T8OE6SHl/YP+HNo
         9mWEonR+hZnso/NR1D9Rf2lsHwVAu7y4uAkr3BOoLQOIHFHJPRJaGu7Aft8hWEgC4gfF
         LYvg==
X-Forwarded-Encrypted: i=1; AJvYcCUVx2V6YPAbkXuntPM8bVbKo6y/R+prrx1Ap2fL4rwQ38zMBJHjW85DZ0Xul0jPZVr0azUWSPM20BC6sXRnFqWvJh7Pkzmuxv7sJSIZ8PZu
X-Gm-Message-State: AOJu0YwAr9ef94iy7S2N2gMMFHaRlw0naQgV3nSie07JrIDbOcnhtuBG
	qeDsgTkL8rVNWFA1NfzZ9NKS6ExTHPJw7y4+ZHBjdr5m88R+zwvG0WPMD/X0kp8cqelkcjsoR2p
	EcuWSoz1//V9IJJpFwfFhP4w6i9ZhI0JGaHz9EA==
X-Google-Smtp-Source: AGHT+IFE3jg6zoMptRZ8RVoisfoQ1OhVxu768sN+ZFhRFxMAZuv+feJajD0vHZyqJjX2rl+KlMdDjsODtC67lQmJ2j8=
X-Received: by 2002:a92:d305:0:b0:363:972d:a25b with SMTP id
 x5-20020a92d305000000b00363972da25bmr1400442ila.20.1707479847287; Fri, 09 Feb
 2024 03:57:27 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Feb 2024 17:27:15 +0530
Message-ID: <CAAhSdy3TXDCnA+hqJyNq3CiJD9LTtL_OOqX0N=GqScL1VU8FeQ@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.8, take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_035729_787877_4D66B968 
X-CRM114-Status: UNSURE (   4.44  )
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

We have three fixes for 6.8 which address steal-time
related sparse warnings.

Please pull.

Regards,
Anup

The following changes since commit 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478:

  Linux 6.8-rc3 (2024-02-04 12:20:36 +0000)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.8-1

for you to fetch changes up to f072b272aa27d57cf7fe6fdedb30fb50f391974e:

  RISC-V: KVM: Use correct restricted types (2024-02-09 11:53:13 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.8, take #1

- Fix steal-time related sparse warnings

----------------------------------------------------------------
Andrew Jones (3):
      RISC-V: paravirt: steal_time should be static
      RISC-V: paravirt: Use correct restricted types
      RISC-V: KVM: Use correct restricted types

 arch/riscv/kernel/paravirt.c  |  6 +++---
 arch/riscv/kvm/vcpu_sbi_sta.c | 20 ++++++++++++--------
 2 files changed, 15 insertions(+), 11 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
