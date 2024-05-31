Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D27C25B7E
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 16:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q7NLh8/P3ejU2w3ES75cJilgYdRW4Xoxg+swcFfyiak=; b=XZYZIXFyvfmG4k
	SBwHb0FN35Z45b+Ua3jY9jv6YFVDMEz03u+r9e+hMyL9dyoA/80cJyMm2Mv79Aa1jBGyvOU37J1eY
	VWE+HjjDsxpAuIVjtgii8IWa8vIJSsKCYKh9PQ+vjhuh8xEMWsdrPszoBci8PwzUecRychvdTmTiH
	tevJChb/ugcCRy9Tl/BdwKvtvhqNKC1kclxJWqfco4pp2a2xS9jy2fcJtLsXN/QDzra0uV/zDI/hI
	DuHvB5udT8dYHRAPWGU0nAl7cm6d8czWIv7yHoG8kc4Vdj1fUXkIQXG5alH3i65IOM03ipM2khs9Y
	27+r1rKH+8lamja1eKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD5UA-0000000AvBS-3yVE;
	Fri, 31 May 2024 16:52:10 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD5U6-0000000Av8G-47MS
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 16:52:09 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-374891eb5d3so5592925ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1717174324; x=1717779124; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pTNg6zMiXRkJXri9kOZIRbdVDUfZydQpGNpHvB31YmM=;
        b=E87yjKo2c5KdjuXCzmuhI6RwxgF5Nxh0JR+hX1J3Gk98waXvSQo7PDSXDfGwce1aYc
         sJr+Z5hjEIG88BvUVuHrBUgRp0Qb45UBc6Zh+r22ZqY2tIjYG5e6aoodKbHi2YJ4y//G
         hC9egkhHn8kAiDJ+KkavNkex4zAuj+4kUXuSf0R8GtezHQlg4k3gGMM/QEz/Qss5kKVD
         cQ00HualuKo87aXm7cqfWeB8ymkN642twPQLoL9CM8H8pU3EQWh83wV2elcLOafY7ux2
         j/jaOpv4CeXiJPhlp4CsUXZg7AoUaLJJOgZU5h4PLQm8gtE3y1tir0zE8st7DDcrkF0e
         9NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717174324; x=1717779124;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pTNg6zMiXRkJXri9kOZIRbdVDUfZydQpGNpHvB31YmM=;
        b=VBH9h1/AGtc5+gpWE8fxEPKJsM/MN2c8WIEA2J4OEDQdp/HKiu/vNqUHumUPyu2BCg
         4cy5sxZMXJ9MNkEKGIodrsMRsqCnzTJxemzEJyGb/oZkQOzB35JW/9UAPF66ROUX4q0L
         5uy/rCmjsoyJpfEp5g85cVS2LiCfU3LseOimMzLubAQq6SivPEl+ZI3Qd9Ia8i5kojDZ
         OBwApV91USDqPxevUNopQmOKIF6Bvb6L39MOTddWgzVXaRJ+5wPyV4d+NNtPzsP86va2
         l1DYgCL7UFGYBma2YWkb/u3GWrgOd324g4MeT5ltbgfdfaqNIveE1D1iZM1HID1ucpP0
         dh4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOGS2x+3I3U5HKDg6yxepTH2QMUG76TRkE/QtW8jiz9v19d5KEC2Vo+YgU8mpbOHUd1aiE/OiMJFHOHx+kzz4kMwPxhFflalWSXKylw5dQ
X-Gm-Message-State: AOJu0YyPSVcMCLF+Q2i2EVUktJixFrvJtj/lGHUM+QQgrCZH6kL8DNTs
	6jZsJeR1mvucq0aCL9uQ5tQyMq8VVXbGfJZf4vHSnpVEslxUUUsbcy82YTNV5c0094yPHEvFmq4
	ArhKyJEDMx7YIk4gRvHw9ihAl+UmqrnoB3oRjFw==
X-Google-Smtp-Source: AGHT+IH23fWU350+O/Ga1ZOOHV+eDByH+luo7mLUsI3si2RtDZKDd2qThEgwWzavJJFJ6WXu0YhwdsQAKR/symM78II=
X-Received: by 2002:a05:6e02:1d81:b0:374:70ae:e86a with SMTP id
 e9e14a558f8ab-3748b9d0239mr28334425ab.22.1717174324429; Fri, 31 May 2024
 09:52:04 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 May 2024 22:21:52 +0530
Message-ID: <CAAhSdy1mug8sUpNc=RaXYQWJoHNBQahAv5_rLRp0vOdT=xrHNg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.10 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_095207_260545_E16A2BE0 
X-CRM114-Status: UNSURE (   7.76  )
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

We have two minor fixes for 6.10. One is a special case
handling for hart-index-bits = 0 in IMSIC virtualization and
another one is a typo fix in kvm_riscv_vcpu_set_reg_isa_ext().

Please pull.

Regards,
Anup

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.10-1

for you to fetch changes up to c66f3b40b17d3dfc4b6abb5efde8e71c46971821:

  RISC-V: KVM: Fix incorrect reg_subtype labels in
kvm_riscv_vcpu_set_reg_isa_ext function (2024-05-31 10:40:39 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.10, take #1

- No need to use mask when hart-index-bits is 0
- Fix incorrect reg_subtype labels in kvm_riscv_vcpu_set_reg_isa_ext()

----------------------------------------------------------------
Quan Zhou (1):
      RISC-V: KVM: Fix incorrect reg_subtype labels in
kvm_riscv_vcpu_set_reg_isa_ext function

Yong-Xuan Wang (1):
      RISC-V: KVM: No need to use mask when hart-index-bit is 0

 arch/riscv/kvm/aia_device.c  | 7 ++++---
 arch/riscv/kvm/vcpu_onereg.c | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
