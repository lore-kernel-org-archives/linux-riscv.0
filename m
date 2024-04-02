Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8E7CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 15:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FuIzXu9nK8/Lvy1xXjR3/sp6oOUiYBYprpEF582P3dc=; b=X1lMwSs2YviFKK
	RJDeizW+7A0uwnYxvE3674iI2xF/VsOeJnP8nluUpk9LrFjkl/oqqdP123a/YcSPk9b7QB0XYpt2v
	wpAlbzlgzgcD9h2d0u4OUtnABoQJOvTCy67wRQ6izn4D5PtUfH1WZJ7KZG9nGhjqcAYh7rE+qt8qV
	zCZ65I8DYWdMVJz2Gum3o3h7Ckvh6bdT9SaJcA44JTR7IVGNwAiJq0YZMOz4wRLTx1TZGkyuCsg7D
	EjDrthithBe/bC7caiclMcdZdmmAcaRYnCmJR5g0yd8zODgXszDyHFAms/uh3UNZ1vzXkJwAbaokV
	HaOwmc7Al9TbSbhaHlog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgN2-0000000Bs9L-2SSK;
	Tue, 02 Apr 2024 15:48:20 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgMx-0000000Bs6E-2vmy
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 15:48:18 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-369eafe262fso575505ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1712072894; x=1712677694; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fB9wvfeaRu0tbAm21VpziSooOQ2M5ya0jZi8/+/ocMk=;
        b=HHUHwHhoTNf9jAiCS4SD7xdU2wu7mHJGBZFANpkv/xGZSzfCk/+TOXzfTgqQ2B34jd
         qjcEvkH0kAAEhz0jc2wa/PaxkoTf+V/VeruHh4dS+I3qUJgNFDxCzkZoQy63UTMnqej8
         gmSY75/7TLUsg5iVN8x4Wwb1H+laqjlPwCmKneHJ5Z7tYR5khjesZkMnOp+hcG13Mt68
         nvFQzQRkAfAgtCX1Yw2h4aK2coXGXXkZsJdVjcjdTObSpqNn5u5PzKMPUgwz99BGrqHu
         fV69lx9L20TmNbWMkY9DcJqmHGB3easGwaPL5B0Xlea2izs6ojbLUZiU3FAHLAMCViZp
         Z8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712072894; x=1712677694;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fB9wvfeaRu0tbAm21VpziSooOQ2M5ya0jZi8/+/ocMk=;
        b=aWCYMDA3AnyvHn3KWEqewcncBgrzMSIbteYBlX8nStM8YOH5jWg6fYD+GfUx+vJg26
         8uzt9Z66hbgJr5YFKrFdbh/+Vjm+RFSBjdl+njzPV08IzUvb5iiNDOUW0Cko7R8WBQ2Z
         YTiUCust6SgBQGxG7heJpIxJDsONToQ120rXuF2iHSjWyAJBCBppMD//fTDBv3CQD0pq
         0nRW9otJ/vhMT2q/wjcg8sIeel69nTdb1YuHmuHlAl+7ybtaAOs1Pgjy6cCyiNEJ0Cfh
         Oxn4eBaX1/p6LXYK7GGvKT/zQg99TBbAFIx+nTWdMMd8/M9Kuwq3hRz5MARtKawUAXm5
         t7rg==
X-Forwarded-Encrypted: i=1; AJvYcCXTpdMP7mAnvx1BLW+ST4rCjvrsicJxJcHArdvbh27CGgsOcd9A42KBtxG1HGUyheit8aDJZlYS3GsSUmjbRY57joSKbXMyx5nqtQhCO/x7
X-Gm-Message-State: AOJu0YzZChqc42IKOesPsyHTUjoGEwyRl50HIoQKVNngYaPHGmiZLfra
	ncXbGhjgMvJk7AGWfTDBIgqIeEKALBw1umVjsdM2WIZSCNcJeLCMDBxBQTZIsXcHjWIoJszkIwl
	1lZgKaPdlVo5hAR/fSAJq4ekz3GdR56xe2lBgLg==
X-Google-Smtp-Source: AGHT+IF/KIeqABbokzZljH+LAgY8kIZSFE7qipbYmjVKY2fkpR4302o3Qfd9r378gssUXTZN81OKQEw3/egpsssqY+I=
X-Received: by 2002:a05:6e02:1a4d:b0:369:95dc:e4da with SMTP id
 u13-20020a056e021a4d00b0036995dce4damr855201ilv.17.1712072894488; Tue, 02 Apr
 2024 08:48:14 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Apr 2024 21:18:03 +0530
Message-ID: <CAAhSdy2e237A_vA022kh3cmy-YJ_t=0iXyRkbQS3NSR=_Z+6HA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.9, take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_084815_980746_B4479150 
X-CRM114-Status: UNSURE (   6.40  )
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

We have four fixes for 6.9. Out of these, two fixes are
related to in-kernel APLIC emulation and remaining
are cosmetic fixes.

Please pull.

Regards,
Anup

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.9-1

for you to fetch changes up to 8e936e98718f005c986be0bfa1ee6b355acf96be:

  RISC-V: KVM: Fix APLIC in_clrip[x] read emulation (2024-03-26 09:40:55 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.9, take #1

- Fix spelling mistake in arch_timer selftest
- Remove redundant semicolon in num_isa_ext_regs()
- Fix APLIC setipnum_le/be write emulation
- Fix APLIC in_clrip[x] read emulation

----------------------------------------------------------------
Anup Patel (2):
      RISC-V: KVM: Fix APLIC setipnum_le/be write emulation
      RISC-V: KVM: Fix APLIC in_clrip[x] read emulation

Colin Ian King (2):
      KVM: selftests: Fix spelling mistake "trigged" -> "triggered"
      RISC-V: KVM: Remove second semicolon

 arch/riscv/kvm/aia_aplic.c                       | 37 ++++++++++++++++++++----
 arch/riscv/kvm/vcpu_onereg.c                     |  2 +-
 tools/testing/selftests/kvm/aarch64/arch_timer.c |  2 +-
 tools/testing/selftests/kvm/riscv/arch_timer.c   |  2 +-
 4 files changed, 34 insertions(+), 9 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
