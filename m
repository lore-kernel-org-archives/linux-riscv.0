Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E59C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 09:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T2KQw8zTz39rvpwNNkVApiqLNSc7GU9Nx7qkZyIoUSY=; b=4p6uBLytCTJrTK
	RMC2+Aow6JE0oM/fDuAdBDaYmPL71T/r/8Zk75OeehILdECfsXDHjPWHhyDkBQtLZUAduNBf+ANTw
	WYY75Y4RfiggcEImMW8uZXQDr1dI/qFCJlK86Zf9Y++f1TYU4zK1bIaL1guTqXFtEM4q9YCSoJ2sh
	IzbFv0Okc0+nulgh8fDVQyxE+wPEk7j7rFrC1HIv6Qo7C9i3YiZn+RsUWsjB1xI3geQIGdBUA6ZHv
	ZSK4E7pZb++dgoXh5F9Wv3vXL0W92NMTV/NNqwL7gXcBFj0Qk0pMxs3OdD4SPNfdnBPqViI1mQ+x5
	gQylhOilsIA5apjhh8hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN82j-0000000DHE1-30bm;
	Fri, 28 Jun 2024 09:37:21 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN82f-0000000DHCb-1P3y
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 09:37:19 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7163489149eso274445a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 02:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719567436; x=1720172236; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iT4MS8fZiK5+N1QCp5Ev5H4xY+O19Xuog9jiO1hr3ns=;
        b=FU1Ir0+B6gc1D9X+nQmmnLfZ97wUAgz/f/uvZU/8dbRwIWpsPOmVeh16y466UOVZ5q
         aipBZnCeHbOz6TrBofCNwFXqp9swchJbyr+xQRP9JAk2qPQbjVPMOST1z9K9vlswqt5F
         5/g39t5Ny0rD+5N88XKDJdEToiSuopm86RSu2vEZhyu7ekn88kjCzA/1lyKr03ai4VU2
         vsgDhV1DzpcDQvUb8FEgZd487/weJdHM43Hvbcy2p41GEyp0q52BJKOdbDkBVVsfBul8
         mreHnUTKraM+Ko6F08bpUXPxgl4El4U8islBk6rxlOAmbsKKn2cN+SR+XEBEVCHi8AfG
         1sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719567436; x=1720172236;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iT4MS8fZiK5+N1QCp5Ev5H4xY+O19Xuog9jiO1hr3ns=;
        b=wf3+qkHedtciqW5w9hVVxj5zNar6bDbTY/G+Sq5xMkmISBPL5RgBy834FA5mj/Cmzz
         XIsMwDYzzHGFIIodWnvDTrWTRnzQoz+i7Tl0a6N1k7FmzTnk+MIT0iO4ticGHg1n2bpo
         6zjlV6QO117+CHWZp/ehNgZ50+ZZEyJI1m8HY4FMw+5yzAstCeUrhbGdM4HywJgfq54+
         ex6q69tjOTThoi8Gm//rj8qnbvanYrurzUJG6FatYi9ReBCYzrhyM3rOCnUU9UEjqyZf
         8xF5hBHZG0lnDcSjy3/JGb4gkRcOq4Fqtu2ffwrkEM/gUTv/VRK/zp2m3Fxw3yjc/agK
         RETQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ9xHhcFYpS77AE3lj3bX1BzBqQFrX5UMVnbhtxUMRSBqTgf2A7hFFjhfeodJ54bkGD4D9bxEnlJAETzSZ6A1BhFWgPg4965i2UixtQ9Z/
X-Gm-Message-State: AOJu0Yz0VwKJn7fEZvafaXdnQHl3XTbJjJ0/h93hzB8QHn4bnhxAy58J
	pPONL3BlAcV9ZmpWAbaLD1NrBqX+x78ljdi0RBbWjEfuxAHFVshC3og/AAr9G1Y=
X-Google-Smtp-Source: AGHT+IGz1s4UrPEjOUTeURvSc/bsNc9cuyIhSWC3mjXDJgDFtcpe5FBxZlsENps9IITX6WHehehEjQ==
X-Received: by 2002:a05:6a20:3b91:b0:1bd:2a99:2da7 with SMTP id adf61e73a8af0-1bd2a992f06mr7489875637.31.1719567436154;
        Fri, 28 Jun 2024 02:37:16 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10c6c8dsm11087155ad.26.2024.06.28.02.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:37:15 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v6 0/4] Add Svade and Svadu Extensions Support
Date: Fri, 28 Jun 2024 17:37:04 +0800
Message-Id: <20240628093711.11716-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_023717_423216_2C7C4B0C 
X-CRM114-Status: GOOD (  13.16  )
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
1) Neither Svade nor Svadu present in DT => It is technically
   unknown whether the platform uses Svade or Svadu. Supervisor may
   assume Svade to be present and enabled or it can discover based
   on mvendorid, marchid, and mimpid.
2) Only Svade present in DT => Supervisor must assume Svade to be
   always enabled. (Obvious)
3) Only Svadu present in DT => Supervisor must assume Svadu to be
   always enabled. (Obvious)
4) Both Svade and Svadu present in DT => Supervisor must assume
   Svadu turned-off at boot time. To use Svadu, supervisor must
   explicitly enable it using the SBI FWFT extension.

The Svade extension is mandatory and the Svadu extension is optional in
RVA23 profile. Platforms want to take the advantage of Svadu can choose
3. Those are aware of the profile can choose 4, and Linux won't get the
benefit of svadu until the SBI FWFT extension is available.

[1] https://lore.kernel.org/linux-kernel/20240527-e9845c06619bca5cd285098c@orel/T/#m29644eb88e241ec282df4ccd5199514e913b06ee

---
v6:
- reflect the platform's behavior by riscv_isa_extension_available() and
  update the the arch_has_hw_pte_young() in PATCH1 (Conor, Andrew)
- update the dtbinding in PATCH2 (Alexandre, Andrew, Anup, Conor)
- update the henvcfg condition in PATCH3 (Andrew)
- check if Svade is allowed to disabled based on arch_has_hw_pte_young()
  in PATCH3

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

 .../devicetree/bindings/riscv/extensions.yaml | 28 ++++++++++++++++
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/include/asm/csr.h                  |  1 +
 arch/riscv/include/asm/hwcap.h                |  2 ++
 arch/riscv/include/asm/pgtable.h              | 13 +++++++-
 arch/riscv/include/uapi/asm/kvm.h             |  2 ++
 arch/riscv/kernel/cpufeature.c                | 32 +++++++++++++++++++
 arch/riscv/kvm/vcpu.c                         |  3 ++
 arch/riscv/kvm/vcpu_onereg.c                  | 15 +++++++++
 .../selftests/kvm/riscv/get-reg-list.c        |  8 +++++
 10 files changed, 104 insertions(+), 1 deletion(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
