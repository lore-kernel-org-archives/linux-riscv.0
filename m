Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23588606A320
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 11:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JXjA05FW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=GD3SbGDA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NjppU0CL5KXkgObrSedUVrRuKATuNmGy9XLlk/Zkw+8=; b=JXjA05FWva4WxYxP7/pC5iUv1T
	O/j/naUAMzMx0mj30unWk2pgjMojhCAUvSx/Odrl/mn40YjGgDc+OJ0LRBaDcrm66SHPbHRpfdmAQ
	Tb/+b96MqnFYIsOacsbM/liePz4O1nGq9xLntY16eL1jDMDLyA++XMtmNWo+Ttwwdrm+zDhaGIl45
	zSdEGYoxMtxrneftzQYxz8zZB1SlBVFt0iPGW7Daot0JGFG5JGQ6JSjjGxfzbOM1IN1+3+xt76jyr
	81S9ShVqU3+7HLkcYchRxUriXctgoD/VCPxfMvX7NEnBAwc4pYUQOb/SVQVafReVkl+CZ2iUXcZLZ
	kHmxokhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMk1-0000000EmXx-3HNx;
	Fri, 20 Nov 2026 11:25:17 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMjz-0000000EmX1-1pBx
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 11:25:17 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-491846221ffso594559f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2026 03:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795173913; cv=none;
        d=google.com; s=arc-20260327;
        b=TRap12de/HFFSPnclmz/2X6xCKaCjkaQAtHh11NMqjj2Abu+okehWZVw8Uls6sgdR9
         GXf/pc+iVT2KPkHrRf1KRQC6QgigRLEoYf3MRTRrcMDKunoo28HhF12NAa1R24OT4mL6
         c9s0d+7PbhmjUpkSIM3AGQ/fzGZBhziD/6pyqNI7Cl0+8Ufj8J7X3nCuFwaBikLSBrTu
         betthafSP/RoTBRJ8s2SPLb3QOCh0AIlTs6YwUHkQTEchtxPkGoQZVCHvths5LuD1Ogh
         DO0FyT1/cbAXSPqq0CJpeGX8wE5FwjvvCpxtMZcTBcnPlSnG9qOpm/g5v5mzP3oPFzio
         TUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=T/oeAUI0ByDf7dPHx/8xzMZxbOAspRa0FQ1QEHteMRw=;
        fh=LsxGCAD2tVXqI49+nxcShOaJE0fNXxeI+tu0TDaD3as=;
        b=grkvcyUiUdqdMbzTOAUyetetJC6t7BhpD98CvcT4gD1wLDg+Qrzs1zuxK0wT/o0L/8
         ibnpKIXVkulJDrTmhz9OkuXVmi9aw4n5Qv3QhUOkVwn17fxSAHKfss7jE2gfaMXyl6Rz
         XW6oJX+Vg4fTGiInEWc4MptCEOvVKk3mMwZ0E8N4JKMzgBWW86M9LyCBI6iVvMXP/q8V
         o7lPkdO0VfHUosFfPzkoXQfozAniyfIhIC0Qc7HRh5omd+pC/J9dAyS6jwOI0keCrVqU
         1ifodOmv8SiLXkv1tddCtWXO74qzpBX7KSIRdw8eefNyaYpvA5RHFaD5Wqip1nb9xjhf
         cvcw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795173913; x=1795778713; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T/oeAUI0ByDf7dPHx/8xzMZxbOAspRa0FQ1QEHteMRw=;
        b=GD3SbGDAp3bdQI7woH7MbmcAGXpXTLHO/4u1JWZaKiOOdRTbRSF6h/jYSarMWZSzFk
         ln9ZSNlKST6ew+fZnD5tWVbQso5pEvD+T+8LSfJZ2fswWK3eEOqR5vyQicrwPcNIHdxu
         cPXewFcOlpU/0Ykb4hUqO5YEHbzbmFnHRxG06Fmm68kXWOSBlRsemFRDe1u0x1D/JjlV
         zNSx8VQZ51wZ5bwyScVhuFpgrkg/VdFFTGAEvLD9L+CNxqyzHYCk3Y6TGBqqwuzaOphE
         8XgR7L/bRm/7Txk/E7MF3Zfc9GTD3R75TssFEuh+6gl52nUujAqJyB9YSsdDZEPBJ0XN
         AYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173913; x=1795778713;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T/oeAUI0ByDf7dPHx/8xzMZxbOAspRa0FQ1QEHteMRw=;
        b=1lH1lBava/U3fl5Binc/POCtp8yDROi0IFWt3cW49Kgxgxw3ur4uI6zLVQJn9XSTXa
         PViszW4bs7jcx1usfVuuuxlacqvv4aJaOn8iwO7j3LLf334sziFDbsQnYF/HWCnINEd8
         tBbg+A9dd5MleJEZDWjJ0A1yH/EhrsEAQRM4ds0B0/GVXEVvVHYiEOT7t4lOZpk8DB+9
         fvZru+7ADgwlUN0k968z1Qcghs/NlAyk1qYZo4LeUY7YiNsEC/rw/ea3oQ2cvCtVnUiz
         ZSl/BfNyyh2qtDE9TUJqVjAfViX5yHO8HN22D4aJO/QgtnAZulN9bqLSK9Vou1P9BStj
         CqQA==
X-Forwarded-Encrypted: i=1; AL+hErFECiZPCiyhmhdb7xOQzsm5BtczSGA+68O0f5gUNyrk/QGxbW7tDgz4EHYVQhgejuruQAJuCTYrmHdsqA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9y3ZcPu9zyRWMC3QveMUuu8eMNsSr83L30CawnlRaNhE7r1vRE
	1V3cGVJSJ26n5L2OLvXZz9RLcfdpLo3HWw4HTBz2cQJWVnqggXbf+Nue3q5SwVVIMiHDKHUI2ts
	jpWntsRKVSSuIflbGDpBywWEZzG5tcmvrEPE+gDQ31w==
X-Gm-Gg: AZFdTZeaX7lLbApPPfucMzYVGXlxQhllnhaXM5e5MBmjJj2hm9SOwIPcOmSxjt3Bosa
	uzkOqF/79AeTq9Uh2v/9c0eA2MT4mH0n8IwCjG6sZWEV3X4Imn+97bpgkTiH8aKEJahPZYkaD+F
	TsW0KLmKuAoijEQCQZBknXs8uuINILKZumObPcE4ht4o0ttKYo2Pledt3k71C1KdYrKyAxQY0m1
	mu113rzuXUtJD6vZ+NGRvIQ7W+qD0Qi0MuMilCxUhauKWMaUjMqe8P+ePTdQZt6QXj5Y+YFp6KY
	mBlswQ+76f4DwPDQ3D9xG6u0nEi2UVeOZqmx8It4zAjoGx9uTXCEt36U6NqkPbgYk8l5bPhp3GI
	uV0A6JOMFpbmr28XdwjU/Smj4oJMNa/gvIJlWI8uFoXZ71myCasnu7TwIT4A3vJijAhb36WdZqw
	fjSJb9SZ+waISA+vbQ3q6ynmSDaITCQ2XM1ZHmUDkMZfl1QHFgsWaILEt/o5qzUThEGQBW5uE+F
	g==
X-Received: by 2002:a05:6000:2489:b0:48e:2108:4d28 with SMTP id
 ffacd0b85a97d-4abb1baaa3emr5589260f8f.13.1795173913277; Fri, 20 Nov 2026
 03:25:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Nov 2026 16:55:01 +0530
X-Gm-Features: Aa3M54oHwQOVnudG2qxplu2UhUX6GqklCT0V-Jph6298Y8vWTvDHUntIEuLbZcc
Message-ID: <CAAhSdy32nAjcz2vyN37Fb7nKc9jbUxWjUYjiYGda7NPhweJhTw@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 7.4 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_032516_034645_60AFED7E 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Paolo,

We have the following fixes for 7.4 kernel:
1) Validate AIA MMIO address ranges before AIA is initialized
2) Disallow GPA-width changes after AIA is initialized
3) Fix double free of the split page cache
4) Do not touch the envcfg CSRs on the SiFive P550
    (Note: SiFive P550 is based on Priv v1.11 so it
     does not have envcfg CSR hence this fix)
5) Set Accessed bit in dirty-log write fault fast-path
6) Validate PMU counter info using available counters
7) Fix G-stage page table memory leak on VM destroy
    (Note: This one was a pretty embarrassing issue
     which we totally missed over the years)

Please pull.

Regards,
Anup

The following changes since commit aebb7274476403040d582c61478df8f4a7bf9cd3:

  Linux 7.4-rc3 (2026-11-15 14:30:11 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-7.4-1

for you to fetch changes up to e9bf49bbc4227048685c78f97e1446845760df4f:

  RISC-V: KVM: Fix G-stage page table memory leak on VM destroy
(2026-11-16 18:06:25 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 7.4, take #1

- Validate AIA MMIO address ranges before AIA is initialized
- Disallow GPA-width changes after AIA is initialized
- Fix double free of the split page cache
- Do not touch the envcfg CSRs on the SiFive P550
- Set Accessed bit in dirty-log write fault fast-path
- Validate PMU counter info using available counters
- Fix G-stage page table memory leak on VM destroy

----------------------------------------------------------------
Davidlohr Bueso (1):
      RISC-V: KVM: Do not touch the envcfg CSRs on the SiFive P550

Li Jinyue (1):
      RISC-V: KVM: Fix double free of the split page cache

Pengpeng Hou (2):
      RISC-V: KVM: Validate AIA MMIO address ranges
      RISC-V: KVM: Disallow GPA-width changes after AIA init

Qingwei Hu (1):
      RISC-V: KVM: Validate PMU counter info using available counters

SeungJu Cheon (1):
      KVM: riscv: Set Accessed bit in dirty-log write fault fast path

Yangyu Chen (1):
      RISC-V: KVM: Fix G-stage page table memory leak on VM destroy

 arch/riscv/include/asm/kvm_gstage.h |  2 ++
 arch/riscv/include/asm/kvm_host.h   |  1 +
 arch/riscv/kvm/aia_device.c         | 49 ++++++++++++++++++++++++++++++++++---
 arch/riscv/kvm/gstage.c             | 22 +++++++++++++++++
 arch/riscv/kvm/main.c               |  9 +++++++
 arch/riscv/kvm/mmu.c                | 12 ++++-----
 arch/riscv/kvm/vcpu.c               |  6 +++--
 arch/riscv/kvm/vcpu_config.c        | 16 +++++++-----
 arch/riscv/kvm/vcpu_pmu.c           |  2 +-
 arch/riscv/kvm/vcpu_sbi_fwft.c      | 20 +++++++++++----
 arch/riscv/kvm/vm.c                 |  5 +++-
 11 files changed, 118 insertions(+), 26 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
