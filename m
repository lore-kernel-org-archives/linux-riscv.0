Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD48C3DA50
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UUKbMi5KnWOy/KmzXTxNisLdWRd3KMaqdDMqkDOn3KQ=; b=cykRJtiIy+jE+T
	v2uzhWjaM6ihkXwdgk64pTAfJBAI2JomZEgOHLmHawjs5vu4wrT4+SWI0bdiA/bhLYlA9ELRE0tn+
	3qh7NlZMo0Nd2MGiJY/1gpJmIYdcsopsZlxEkhsMPkAEFVdZQkE0uj3D4UFVbWhmroiskKKkRP8lz
	EqsGUUWDAP/4tpjBtWJUqQuXhrFGr5pYEwT3aNvMmaGflbJ+u04zKGiLM1cSV1wznS5prlkB9R6VR
	+m7sIqBVI648n4NT+b5h9BT3Gc4U/45EPoJx6LXxCTDZirVlv+v3FJyVjgeYtBNYQk/Wsv0En4BGz
	4tNNbO1kyvz5MhEOwlQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBnw-0000000GvZN-3qko;
	Fri, 12 Jul 2024 08:39:00 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBns-0000000GvXi-39xw
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 08:38:59 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-24c9f6338a4so842933fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jul 2024 01:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1720773535; x=1721378335; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVjihtKXNEFz1TbYcKMwCmFBpXSQ+a7jrSn4uniS5ZY=;
        b=NslCF6oP0B2KmQmKdl4Yw1SLnMW3oKWukXueTkDjJl9o+5RVAHCkfdje0d1DCdBx/w
         0uhYuGjBkQ6v6Y5+374/e9H+3W+oOTMobIAs1SBy1UUees7BqQrdQ7Nt3MqaUnxpOJTQ
         li75FzwxdujWM/JgbTmrg93ljiPs3kXmd5FM1Q7APKyRYVV7PJJ5uiDlGNTjAWWeyVzZ
         SkgEu5bcmb4D/K/5OcZsaevOAxeZI9d0TwxmDQaifeaaUu+IEAZwCpDUcYD6Z5UP3ZQy
         b2B62bt4dwLbFfbvQOLeyAZ91uxlGjgfkY0v5zgj8uz3Q2q9gsZZAwz2BS9ozxHamjV4
         8nCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720773535; x=1721378335;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVjihtKXNEFz1TbYcKMwCmFBpXSQ+a7jrSn4uniS5ZY=;
        b=JH60ODktn1u06eJzahir/2MH0bxzMl1wbY6BsV2s864KQaAHEVGyoIDepK2KQoINtg
         lq7woSLCqThbVq72FR2QXJ67CZNiviNtz25FlgD4CkZvuxzG9xeD+NZs96hg6DHTqora
         IXjOvbiKaqGaHQ/jDBJjet6a+24T3fAUMJOuzxovGHoCbkJrB6WVi+pYM2cj2tNka5rt
         VqwmtZbF4LvZMLaqhKxj5f1ZupkXhW6BjKGLXS526nzjGlTAPY3tz4iOj3gpYKe2w8Ch
         ELiggOeoL32XWzYN+J/QWsLDx7R6LAHiy7kKNYkUx/uz0UGaTtPuW3oqGV22Qp6ZCtMU
         qXZg==
X-Forwarded-Encrypted: i=1; AJvYcCXgy4bDqyVpFZytMo3pX1kyGWV+qWZs8B92muWQS81AJ3A7V4+TNp6kowu0mQT5ZjjnryHQpavJag23kFZIP0rJRH3IRa9ydpcjCtqIl/tM
X-Gm-Message-State: AOJu0Yz/k32QIgJQBDByv4ATEEJSSmbv/wWx/gQt6cwSyLXpqe/QHopM
	VdN6l0QvgQ7i1B4QsPl4zfu+TAIgPGuqxU3l/e6hBGWVB8UnhghHsU6PBEWY80E=
X-Google-Smtp-Source: AGHT+IFJUspheJ7QGL8PM/A2EZFrZ3yO7Wj/mP366SeQSTErineZNs3lMKWyMy76zRvXD1h+6aLA1Q==
X-Received: by 2002:a05:6870:64a2:b0:25e:3b8b:6985 with SMTP id 586e51a60fabf-25eae8b61e5mr8815792fac.35.1720773535508;
        Fri, 12 Jul 2024 01:38:55 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438c7099sm6894194b3a.84.2024.07.12.01.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 01:38:55 -0700 (PDT)
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
Subject: [PATCH v7 0/4] Add Svade and Svadu Extensions Support
Date: Fri, 12 Jul 2024 16:38:44 +0800
Message-Id: <20240712083850.4242-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_013857_200845_41B106D1 
X-CRM114-Status: GOOD (  12.99  )
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
   unknown whether the platform uses Svade or Svadu. Supervisor
   software should be prepared to handle either hardware updating
   of the PTE A/D bits or page faults when they need updated.
2) Only Svade present in DT => Supervisor must assume Svade to be
   always enabled.
3) Only Svadu present in DT => Supervisor must assume Svadu to be
   always enabled.
4) Both Svade and Svadu present in DT => Supervisor must assume
   Svadu turned-off at boot time. To use Svadu, supervisor must
   explicitly enable it using the SBI FWFT extension.

The Svade extension is mandatory and the Svadu extension is optional in
RVA23 profile. Platforms want to take the advantage of Svadu can choose
3. Those are aware of the profile can choose 4, and Linux won't get the
benefit of svadu until the SBI FWFT extension is available.

[1] https://lore.kernel.org/linux-kernel/20240527-e9845c06619bca5cd285098c@orel/T/#m29644eb88e241ec282df4ccd5199514e913b06ee

---
v7:
- fix alignment in PATCH1
- update the dtbinding in PATCH2 (Conor, Jessica)

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
