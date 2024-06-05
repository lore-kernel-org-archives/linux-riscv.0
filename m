Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3952C25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 12:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1qAmQHKqpKsWpniiWMHEUs3z2dxMfVXQU2fsktd7i8k=; b=WFhg2gFg8FmNac
	GUdPH3FkD+UeGdwg1AgQvOOrtpo25ULyPsDSuxXhixD6tm8gs+NxHQ+2X4osMtVr5kh82HLVDDF2l
	1aSX1PlD65CrjdBoIVtYjeczkY4UiKN5841Wj9jiaJPyf5R0vX7MetPMAZoU4eaTagIqoGcIQCjem
	gmULckJJ+pXUs9UeSTz4NJtBZXEH7fBNHAijEgAIqot5NO/CcEOIY5FLEDJacWIG61QH6H/Qz3Ocv
	pyCr7HwZ3l8BXE5qyXP+I6Nq/zS/nqIDzTJsf9DcNKD3SjhgWR6Bj8+fL3YzbD1jRfaCWjAfCWzS6
	W7kca4CKDNFtXL9EC5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpYC-00000005vJO-0MdG;
	Wed, 05 Jun 2024 12:15:32 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpY8-00000005vGb-4BYo
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 12:15:30 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7026ad046a2so2526577b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 05:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717589718; x=1718194518; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DXKLGOuzK7Mq9/TKsjijP76CNhcAYfch9wR/ZqBgRU=;
        b=nXiY5XpRInPro9NGxBI5krEQVMPIAtA0dtIQdDSL+Ez/gR94e+KukGFQy68xFZQpHV
         TZw/vYpjW4ZpFthouxrzAzVf6Fm/S/gCE38mbC+Z266QsIRK7L1UvYSvxVs7uNGOympH
         GL/KBEogg4jPpnWY7BE9l8QoKxaett/aVDnQ+H5InHwb12ti4rShJrWTn/VmYgiMYqJ+
         S8QoDwFAwwE+e0npUkEOtZdgyz5aD/uIEkDn438SieZzo/jaVZtIvMuUZuVWZ3CkDx7L
         L8MvQGkSv+lDkW4SJpFL5IM0JRugUvs1yhxBWVUP3mHo03OsbetgX4FPq2gskhpL7dKN
         njoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717589718; x=1718194518;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DXKLGOuzK7Mq9/TKsjijP76CNhcAYfch9wR/ZqBgRU=;
        b=K1hzauMVTFgLJIKDP4LgOgUdGl6RgeVL53A5WMkaBjQsHzOV+yWd0zh4wcVS4bUAbp
         5pRJX6NQVYOR4Ctsly3Xlo9qSPdcARZccbOd4aQBoNzF1WCF0deGFQggXijHl+BzYs/o
         E7dcuj6Mqc9cACmHQc05OzZrx/bPsHS0ld+pT0lAkChSKY/7xvZPb7JCqjmNmSV9oEoj
         eiQnKOWkotb4Dwx1Zwr1RWsWFTkSGtplZ1taCqQvtmUBIkE6E5yM1s4X8D0SNTVhGkAD
         Xl5T5dl834nx027E3dUxpoyKBkMUsgeaet4ypZdI29LFgiSTQsR/vXUOXWfICfzGvv7S
         T4bg==
X-Forwarded-Encrypted: i=1; AJvYcCUxqUJMUY+XapVKA1ltzDYv6PvN4KKlq8cq3RlIgvwfFMP6hh5O4Y8wAgylqsox7Y6bN5Iu5M+I4bdHEuSiCfO8G63aPytzWUH5CFAPRySS
X-Gm-Message-State: AOJu0Yw0cci+/kIaklo0nkiwVoTiGZ007JFFRDIf6f/mIpLIiIY4RPPw
	6IGYo3hHtcD+dGA20ousC48lIGbMqTsGzFzyqVUwls0uz0/O+l3VOO7FKIzEFOw5DvWOYmlz9ce
	8ip8=
X-Google-Smtp-Source: AGHT+IFXmN1NTFby9QdaZWN6LCrZn10MZA93JJFtVVzaU83zYNY/GJ3zV52JcTW07LpaJw14DF1JKw==
X-Received: by 2002:a05:6a00:2e1b:b0:6eb:6:6b72 with SMTP id d2e1a72fcca58-703e5a7c2e5mr2473376b3a.25.1717589718025;
        Wed, 05 Jun 2024 05:15:18 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703ee672fb3sm885379b3a.216.2024.06.05.05.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:15:17 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: apatel@ventanamicro.com,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v5 0/4] Add Svade and Svadu Extensions Support
Date: Wed,  5 Jun 2024 20:15:06 +0800
Message-Id: <20240605121512.32083-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_051529_067060_06154163 
X-CRM114-Status: GOOD (  10.91  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Svade and Svadu extensions represent two schemes for managing the PTE A/D
bit. When the PTE A/D bits need to be set, Svade extension intdicates that
a related page fault will be raised. In contrast, the Svadu extension
supports hardware updating of PTE A/D bits. This series enables Svade and
Svadu extensions for both host and guest OS.

Regrading the mailing thread[1], we have 4 possible combinations of
these extensions in the device tree, the default hardware behavior for
these possibilities are:

1. Neither svade nor svadu in DT: default to svade.
2. Only svade in DT: use svade.
3. Only svadu in DT: use svadu.
4. Both svade and svadu in DT: default to svade.

The Svade extension is mandatory and the Svadu extension is optional in
RVA23 profile. Platforms want to take the advantage of Svadu can choose
3. Those are aware of the profile can choose 4, and Linux won't get the
benefit of svadu until the SBI FWFT extension is available.

[1] https://lore.kernel.org/linux-kernel/20240527-e9845c06619bca5cd285098c@orel/T/#m29644eb88e241ec282df4ccd5199514e913b06ee

---
v5:
- remove all Acked-by and Reviewed-by (Conor, Andrew)
- add Svade support
- update the arch_has_hw_pte_young() in PATCH1
- update the dtbinding in PATCH2 (Alexandre, Andrew)
- check the availibility of Svadu for Guest/VM based on
  arch_has_hw_pte_young() in PATCH3

v4:
- fix 32bit kernel build error in PATCH1 (Conor)
- update the status of Svadu extension to ratified in PATCH2
- add the PATCH4 to suporrt SBI_FWFT_PTE_AD_HW_UPDATING for guest OS
- update the PATCH1 and PATCH3 to integrate with FWFT extension
- rebase PATCH5 on the lastest get-reg-list test (Andrew)

v3:
- fix the control bit name to ADUE in PATCH1 and PATCH3
- update get-reg-list in PATCH4

v2:
- add Co-developed-by: in PATCH1
- use riscv_has_extension_unlikely() to runtime patch the branch in PATCH1
- update dt-binding

Yong-Xuan Wang (4):
  RISC-V: Add Svade and Svadu Extensions Support
  dt-bindings: riscv: Add Svade and Svadu Entries
  RISC-V: KVM: Add Svade and Svadu Extensions Support for Guest/VM
  KVM: riscv: selftests: Add Svade and Svadu Extension to get-reg-list
    test

 .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++++++++++++++
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/include/asm/csr.h                  |  1 +
 arch/riscv/include/asm/hwcap.h                |  2 ++
 arch/riscv/include/asm/pgtable.h              | 14 ++++++++-
 arch/riscv/include/uapi/asm/kvm.h             |  2 ++
 arch/riscv/kernel/cpufeature.c                |  2 ++
 arch/riscv/kvm/vcpu.c                         |  6 ++++
 arch/riscv/kvm/vcpu_onereg.c                  |  6 ++++
 .../selftests/kvm/riscv/get-reg-list.c        |  8 +++++
 10 files changed, 71 insertions(+), 1 deletion(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
