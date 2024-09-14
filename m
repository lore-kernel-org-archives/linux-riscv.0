Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978B8C02180
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2024 07:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nq/l9ci7YKVkpjDpPv8IhlIy8LD7kx5U53gQkRue0to=; b=2BZhaQdv1qUElX
	/Dm/0swACkE2nyhnwMDOz46NR90mWvQwelBoSBZH+VCoAfhB6BfbhIjklT441ySNeAfA1UuC8iG+L
	3lkawIHoWU8xTXcMbkiDT0vKfM4DRlcebsO2O8/7De18YKd2J7t+lBZtUGNdZ0GyyfLHC06338yUR
	X7KvoFJSP+w1kJjw+VLU416LG40JRgM/RbFgJKNGcpl2Nr8DZ+QefDzlV6sYITUy2eJ7zweKFrTN/
	yXn9oXC2p7aEGkkldvMs/tnm0eX04fQ+Kggaeq2tyDqCsU7PX8ZsoVKHClVpf3HH97rAvLEIDT3oX
	Sfzq1XjxDE91GIP8SlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spNVB-00000000JON-2jqo;
	Sat, 14 Sep 2024 07:47:29 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spNV8-00000000JNj-06oe
	for linux-riscv@lists.infradead.org;
	Sat, 14 Sep 2024 07:47:27 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3a098564893so501995ab.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Sep 2024 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1726300044; x=1726904844; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xCXWx1AARdSEy+aE8rrZQ09YhMgt7Bc9EsokRlJmT98=;
        b=vHwaDsXipWMNwdB1aB5GEuwzNc9ZZNuz8XHZhkZKuKDv9q3NATGf0BpBBRfKA/PD/A
         ITK1jX1gPsyda9efBy7IUjcEnoNiF7Q2NYuXoR7IAipgCHvjeFKT5cfcOZhbC+m4AYiv
         b9lFCoPGsnqyQ94B3bv4slUeFCZeLWQaRds9qH9pLAHpw85jgrX21lu6cEkMXAMeLXoh
         3fciivQ87dEejmo9xBDbdFLZqWeC1l6zp0QuyT7zweTRkh0sTc2RgG4uUk1ZaOlNapsr
         HUyR6QDRB7AlQQ+wK2fEcFmGc9CN4nm1I8+mJcHQk1iEtozD9MfIb6SG2vxq8l3GeJT6
         2Zow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726300044; x=1726904844;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCXWx1AARdSEy+aE8rrZQ09YhMgt7Bc9EsokRlJmT98=;
        b=QBALaO5ATcBwisOiQRdNcC/VzNemVOAzBOsG44sUNKM3NeUUbP6og7cbWCXJsAiEpA
         nenMd5KfXYiut/y8Y3WBYGu81D2UcmuDVXebYnNkL08l65236R0qLRl+ozsx0g49AfIi
         Iq7/Ei6nb+qxuUHGmeHh7m2NoW+xRcsAME3L4lekpm+GIFqBZFTQM+3zxMI97TJ+vTqH
         AxNTytm3v1wf621gHFIQf4HGlXK3BW9o6bPk/cQCQRYeWsG+cFSDxFDXCbjcFvwGJIH/
         95xX5SnNfz+pT9SJnY9YO/4vc+pTEduUkL6Pm3GYyvyJM9oIpchhYy6Dv+JFqQALTdCX
         zbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb6pOGMGODanF74h/uqlyoD44tb+542onPy89x8vFqSvdo8ejoqlp1QPos6d8Bl153tiVOaIuzyiKruQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YycWGTW02A5SqI/cIlgRyGTs96jABF84nlXeM/ZT5AR68jOc+K7
	WVN2KGLgFMmkVLWfNV8AC9TKS57e5bEqw/KYGgLbb3j9I5xluiFNza+4o8tBvcB0nAOAi1CsvMD
	nDwfgykUfEq/hZq9bJ7cak4d8LPOLyJ7J8cFo3Q==
X-Google-Smtp-Source: AGHT+IE1+YolBGHlPsnYebHEoJOTB+fxO3iuwnRSWzmivhke4/IK2SM0tqoudxlnPJ1GndHJ+aH11X+h3T8BBsrdWoQ=
X-Received: by 2002:a05:6e02:2147:b0:398:a9b3:d6b1 with SMTP id
 e9e14a558f8ab-3a08464e152mr82842365ab.12.1726300044565; Sat, 14 Sep 2024
 00:47:24 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 Sep 2024 13:17:13 +0530
Message-ID: <CAAhSdy0fHNoSx9KAG9nL=sc9=L+zeComyJjctD7kYOhuMNxLdg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.12
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_004726_360172_42E8BBE2 
X-CRM114-Status: UNSURE (   6.47  )
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

We have only 4 KVM RISC-V fixes for 6.12. There
are quite a few in-flight patches waiting for more
reviews and these will be included in 6.13.

Please pull.

Regards,
Anup

The following changes since commit 47ac09b91befbb6a235ab620c32af719f8208399:

  Linux 6.11-rc4 (2024-08-18 13:17:27 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.12-1

for you to fetch changes up to 5aa09297a3dcc798d038bd7436f8c90f664045a6:

  RISC-V: KVM: Fix to allow hpmcounter31 from the guest (2024-08-19
08:58:21 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.12

- Fix sbiret init before forwarding to userspace
- Don't zero-out PMU snapshot area before freeing data
- Allow legacy PMU access from guest
- Fix to allow hpmcounter31 from the guest

----------------------------------------------------------------
Andrew Jones (1):
      RISC-V: KVM: Fix sbiret init before forwarding to userspace

Anup Patel (1):
      RISC-V: KVM: Don't zero-out PMU snapshot area before freeing data

Atish Patra (2):
      RISC-V: KVM: Allow legacy PMU access from guest
      RISC-V: KVM: Fix to allow hpmcounter31 from the guest

 arch/riscv/include/asm/kvm_vcpu_pmu.h | 21 +++++++++++++++++----
 arch/riscv/kvm/vcpu_pmu.c             | 14 ++------------
 arch/riscv/kvm/vcpu_sbi.c             |  4 ++--
 3 files changed, 21 insertions(+), 18 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
