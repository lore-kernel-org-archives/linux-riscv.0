Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F763CD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 13:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3wNtLPlv/0HNdYTo+gHFoMgTHrD2yqS2sjBxKvJ4GHU=; b=EZrADxbDte1oNC
	mXLALjcGfIeKjBSC+CdI5fXGnaRTcEr4KJjqG6mFcePENZTlPROPQTmKwJXo4YMsCDd5rGtYr+VsF
	topUMjC0rxhj/stm8BEYlX5TYqYzZU7sb/WjWtAoxl6+H+so3bW/vWEXQBZVGc8J7UYX+A0oCoR1w
	EvFz6g3PIyPERSgjQFB35tkhSZKrWSGZu4mBIhtweVpIWJEu2nefzHDsylrjnW0+fo4bkqU9seynu
	TYkj+SuWmwNxBAhcGmtruppiln6gOIlkyF05zkf2UFDnNckqHPyiUV7/pjCHsBNzkSJxXzQm2YGgX
	dgMFl7GIhaH3q0s0UyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPaT-0000000AuAb-26aK;
	Fri, 22 May 2026 13:06:49 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPaQ-0000000Au8M-15lX
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 13:06:47 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7dbe07d3ec3so3766069a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 06:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779455205; cv=none;
        d=google.com; s=arc-20240605;
        b=dvg0pRMcKWB3PV3uV/JSpLPvK8iBj/S1HgIRrvbRsjhDw58Oa63vNvCIFpzm0+JYeH
         NuLutspuaO76+eIuDKd2UrfeWQ8lGUS4Feeb6V3UkqIjPPF5aIcJGXxGfklRfy9o2Q5I
         SxNEBmdL0ELZMT5iRNDCiqiQxMtWfk7vfh5A4NPMOqCDcRyPzxN2fvGHz4Dt9+/+qEr4
         wxOY4ZYoFttp0qpUbJOL455dA5xGkQgxasfHlqC+jHQqtpLHIZfEiCrueEC4SeEllwRL
         8RlWFr9Ki7G5Qth21vuS7vKVp3kIx1u2fx30bZezDg+XkCe/xFwMipmTj2vU3EuDBjx7
         G/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NYAe2rB0gIMb7eEgjvs7GruqXDrCjVi8nCKCe2KONFY=;
        fh=3Uvps40LUwe8uIvT9IiXT78JRDQUiY/K3dI/FmMe9Es=;
        b=fQChLKjy9F4sMVmfaI2ypKvXDjwREzD6YAUKPLHjxGu+MsH5FzsHis8ujdVF+uYHsm
         +pDv/z2HndHYSGexYf2miLrOj5CmlLPJiZFECdA1SCbjRtcE3ly90uv6AWO/pc4pNr0H
         KdUS7ERKJzqAmilu32DPsP7DDAInsBsl0LHfOsdwhXwk3zdWSG4IOH1BnByWngufXJuR
         BQH4QMVmEVehtBX8a6XPe8cOaMIwsQ8U4Fsk7crfNC8fnRArYHXus2V5b6OY8a+/3L+S
         xgpgbKxK4ka/xn5V2JneuEBcQQtlLYA4WN+gNpM4TqDr/SvsTq2NTJC40E2vqNxttsjD
         VQlA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779455205; x=1780060005; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NYAe2rB0gIMb7eEgjvs7GruqXDrCjVi8nCKCe2KONFY=;
        b=oZaxIPyKsqEs5P0LeP8wJZlj/inMNmrg2CC7x67s+dX+1GjJ3Ti3DtGym9hyJlPv6t
         r3TO7SPSMHvbWHoS3Trc3TlIAFTgaoL1F51fOVaLVucdW7a4goBjoh+Luu5WYnbt1nki
         t02E45L8mDYmnZKxuL6/tKGuroni1UV0g93O7Os5osxUxYfGh2CuO+RokyAB1FGkCZod
         r3xu8HkrG4A7PRjoCJ+2qMM3grwywadL74HKkcv2eBxH82JCpd+muT7fz09eRg4MFZu/
         xOhOAzzt+MS2puCu+VDWqG+QX3/lUCY0iFLkcI2r3mKrSHF2LrR8FJryF+YyrrbCaIFs
         0v5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455205; x=1780060005;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYAe2rB0gIMb7eEgjvs7GruqXDrCjVi8nCKCe2KONFY=;
        b=AnejA5oHRiSKAdvr9iZZx6TcQ+si0dMsJ02Rd3kV4F78rZotar2JIrz1vQNcLXN4q1
         jcuehxSrSudrQ56wYBuG3yAqWCojCjW5SCVJEaRfWS4NPNlVoVnoCCMmzhtJy9aN2cpi
         hrm3YODPYO6vNHpv0sf+P5IxlU2z+nW6shc7wUvVP/EgqJg9XUuM9MxYZ0RxaNSCYXBB
         FBqNvSA9AeviuNsPPjrcvL4dwANQvNidmz922ZA/k5Eu1NxNIDb8gkK5xDwPQHYTYO+v
         WNSE66ZpnGhWvc2/Z7dDFYEW72uqCM12FE2dxrud7bTnSQzOiRMjMYxWWnDRdYjOHTjK
         bv6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9rzmL8xjAZbsJCuY859X5XuYTEH0JpHMOQIRYfcwYZbK5DMIc5hwxG45B6sqHG98fHvtyHp7l0491lxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWe1y/rflNOw2HS3MWCFZyqkKzOY6ZsYQx7FzGX/3xElVVTUkn
	LtDia8I54JNydg2msRa0DdqZlynAdEhhEhupAwseJmS0K47tWiEIT3M9HPyuLU9Bz5HsHpVtCA6
	sWI1E0m71k27vlr/2Vz60HiCuSLAcNeFmESrWO6TeMg==
X-Gm-Gg: Acq92OFVI9xo3zih8S9GvMqxmAbfi4sO1dE2hu3ProzvsLqu9DF7eTNxZTQK5vX8raY
	HCFZrWgDEecOmZxq2l3+uoBf8qEamh6kCGiX2SijgsvjlkROK1/I2KyKjI/AoBaieWmU45OskYS
	lTsyJ8bgTqueHFKo8L8NkJebe4PG1CKRaG72IF5bTACH3KFWLhzIPwWbplj7tRrWnPFXesqXkfX
	3y0/z5rLfJatUpPOkEmOEfMOiRMcYiy91RV+F4NB8DPF5ov5iZcNYKwJ9hZtHlDTaxUQjyCQiOf
	r8GHTS1xcGOAE4aZpcWHPawtiIgW/Gkc52GX5kcjm9aKT7KJNQhJ0bJpQXjo5L+31JadsVlR7Mk
	5oT3DBPCISWCGWayBmiwd6WPT82zwzVwnkA0=
X-Received: by 2002:a05:6830:4983:b0:7de:60fa:6203 with SMTP id
 46e09a7af769-7e5fef070c8mr2267305a34.26.1779455205099; Fri, 22 May 2026
 06:06:45 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 May 2026 18:36:33 +0530
X-Gm-Features: AVHnY4KfXNm77pz9jWxpxXvMATQwUmW7tiCNVyzvocwyuvXKSLYVk8Oece-by1c
Message-ID: <CAAhSdy0-joewqwsJNkMgzKvc0zh2cTFgTqdP+LZAAxmfEd+Mpw@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 7.1 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_060646_590478_36D99911 
X-CRM114-Status: UNSURE (   6.92  )
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

We have the following fixes for the 7.1 kernel:
1) Fix invalid HVA warning in steal-time recording
2) Return SBI_ERR_FAILURE to guest upon OOM in
    pmu_event_info() and pmu_snapshot_set_shmem()
3) Fix NULL pointer dereference in SBI v0.1 SEND_IPI handler
4) Fix sign extension of value for MMIO loads

Please pull.

Regards,
Anup

The following changes since commit 5200f5f493f79f14bbdc349e402a40dfb32f23c8:

  Linux 7.1-rc4 (2026-05-17 13:59:58 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-7.1-1

for you to fetch changes up to c7832534a8160276cccb9a8cc8cafb5614c579d0:

  RISC-V: KVM: Fix sign extension for MMIO loads (2026-05-18 10:19:18 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 7.1, take #1

- Fix invalid HVA warning in steal-time recording
- Return SBI_ERR_FAILURE to guest upon OOM in pmu_event_info()
  and pmu_snapshot_set_shmem()
- Fix NULL pointer dereference in SBI v0.1 SEND_IPI handler
- Fix sign extension of value for MMIO loads

----------------------------------------------------------------
Jiakai Xu (3):
      RISC-V: KVM: Fix invalid HVA warning in steal-time recording
      RISC-V: KVM: Fix NULL pointer dereference in SBI v0.1 SEND_IPI handler
      RISC-V: KVM: Fix sign extension for MMIO loads

Osama Abdelkader (2):
      riscv: kvm: return SBI_ERR_FAILURE for pmu_snapshot_set_shmem() when OOM
      riscv: kvm: return SBI_ERR_FAILURE for pmu_event_info() when OOM

 arch/riscv/kvm/vcpu_insn.c    |  9 ++++-----
 arch/riscv/kvm/vcpu_pmu.c     | 12 ++++++++----
 arch/riscv/kvm/vcpu_sbi_sta.c |  2 +-
 arch/riscv/kvm/vcpu_sbi_v01.c |  2 ++
 4 files changed, 15 insertions(+), 10 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
