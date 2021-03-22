Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558B9C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 14:26:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C62D36197F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 14:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C62D36197F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ma6TSQI9MvUZqw7vdduaWBrAqpT2wrvQUmw+wceYsyg=; b=ktQSuz4UTeVO1tTveqJx6IzsbW
	+uFmUiS4WIWz/NphZPj+zfzzzyDXF2dmwdVxIYEh3bC8Uc4ZYiGfIzuAoMQPk+Lr8pZEq+BT+F+jL
	hfF6K4cpNqAnax/h0cVdUgAzmx/PbqJQc/rxUjmVFWMJWGlw0f9KfiNg7/63ippKoGNzthlg+VLt6
	yGCyCtWoE5EUxk35A9JJ3zlGGFsZkQj8uw99I/C7p8U6CkNMSjgKc4cNFD1b7lo8ohQCzN8ryL9i8
	xMtREiOI5Iw+PxyT7aZoCthe5Txdzk1noEwFZ4EKiO6Nt23TK5nBen41q9TvnkN8wj7Vyri4GyVYH
	ZgyQpWQw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOLVn-00BnOu-Bs; Mon, 22 Mar 2021 14:26:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOLVh-00BnOM-JH
 for linux-riscv@lists.infradead.org; Mon, 22 Mar 2021 14:26:27 +0000
Received: by mail-pl1-x631.google.com with SMTP id l1so6676211plg.12
 for <linux-riscv@lists.infradead.org>; Mon, 22 Mar 2021 07:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=qYvH0u8eyVvT1k/sI79myZ9FKm+0RH6oK3I1FUNAQtE=;
 b=W/zeA+M9Tn7QgNN9YXPx/Pt35fkXPw0dZFRrBd9oTnIDQtUxvW4+V+KD0hAT05nSXq
 wqLnJOKuZI4gjOm5gprx2wV2OIcJCuqL7cY/5EKHwaECw5pksDRMLweQlUKLAn+BjRET
 3Z4gR9Ae8BCvdW5vw3jiiT4ZJ6zpQsfaVZp2QRMjypQ4yddlv/SdHwZdvR9PzX456sBQ
 h64GVP2O1o85L0fbtoFS5lkCZLPJEsingGhv19Eb6jQzvDT9nJcW0LCEF2wJf5ktCBb5
 Ksn1Eiv2aO36Fq0NH9n8QtVAFJLbRTdtWTHc4AfXrC2fwBygQm7XL/bv+uQPQwirMjD7
 h+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qYvH0u8eyVvT1k/sI79myZ9FKm+0RH6oK3I1FUNAQtE=;
 b=fkhTV5Yj87ljVR9sDtLY7AL/7nr9Gmyr/mF9b2OcBbKieWx+s9GdePqnzmlyWSOgoB
 GX6gRYk9OAl6NnZVuhPun5uTyr6ZKaCKpNpO3W64H7z1mwLeOfR+iu1s2jN44B33Eeiv
 wxGElHCNuGQehxsBSfWc0FiEO9ilaPn1hsreW8YpuF62qG9yNPj4e6R1Gd/XMq+hNxmT
 DRffBInnO/74AZnI3DjjHydbBjZTI7Sn4cevq7YYLY8fapezX/CCcDL7GBU2xfxjIATs
 IwNXaFEyaCPR6Y137iiT1G4zTIw1TW1WOQkIKq/0yjuu9BpT7av4WB8m7Rd4zojx2Qs4
 Wwfg==
X-Gm-Message-State: AOAM531ojlT2C1gWqvraSwQFUTYKCYp7K0ubUJxBChJLdX5G7B4I5XFu
 40D6MaQjA62EH+v5NhZ/fToFCYGuX70/4420
X-Google-Smtp-Source: ABdhPJyO9/Yb6KzNaQQK9gMzZvwxVgI6L6phLa01NXDIaDo7Ds4VBZ7uVUPENeRNzvwClqze3zNtZg==
X-Received: by 2002:a17:902:b210:b029:e6:33b4:cd9e with SMTP id
 t16-20020a170902b210b02900e633b4cd9emr26871369plr.67.1616423183617; 
 Mon, 22 Mar 2021 07:26:23 -0700 (PDT)
Received: from localhost.localdomain (61-230-29-29.dynamic-ip.hinet.net.
 [61.230.29.29])
 by smtp.gmail.com with ESMTPSA id v18sm14261971pfn.117.2021.03.22.07.26.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Mar 2021 07:26:23 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Cc: Frank.Zhao@starfivetech.com, anup.patel@wdc.com, atish.patra@wdc.com,
 guoren@kernel.org, alankao@andestech.com, ruinland@andestech.com,
 david.abdurachmanov@sifive.com, Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v3 0/5] riscv: introduce alternative mechanism to apply errata
 patches
Date: Mon, 22 Mar 2021 22:26:01 +0800
Message-Id: <1616423166-13857-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_142625_842855_ACDB59BD 
X-CRM114-Status: GOOD (  20.54  )
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

With the emergence of more and more RISC-V CPUs, the request for how to
upstream the vendor errata patch may gradually appear. In order to resolve
this issue, this patch introduces the alternative mechanism from ARM64 and
x86 to enable the kernel to patch code at runtime according to the
manufacturer information of the running CPU. The main purpose of this patch
set is to propose a framework to apply vendor's errata solutions. Based on
this framework, it can be ensured that the errata only applies to the
specified CPU cores. Other CPU cores do not be affected. Therefore, some
complicated scenarios are unsupported in this patch set, such as patching
code to the kernel module, doing relocation in patching code, and
heterogeneous CPU topology.

In the "alternative" scheme, Users could use the macro ALTERNATIVE to apply
an errata to the existing code flow. In the macro ALTERNATIVE, users need
to specify the manufacturer information (vendor id, arch id, and implement
id) for this errata. Therefore, kernel will know this errata is suitable
for which CPU core. During the booting procedure, kernel will select the
errata required by the CPU core and then patch it. It means that the kernel
only applies the errata to the specified CPU core. In this case, the
vendor's errata does not affect each other at runtime. The above patching
procedure only occurs during the booting phase, so we only take the
overhead of the "alternative" mechanism once.

This "alternative" mechanism is enabled by default to ensure that all
required errata will be applied. However, users can disable this feature by
the Kconfig "CONFIG_RISCV_ERRATA_ALTERNATIVE".

The last two patches are to apply the SiFive CIP-453 and CIP-1200 errata by
this "alternative" scheme. Therefore, they can be regarded as examples.
According to the results of running this image on the QEMU virt platform,
kernel does not apply this errata at run-time because the CPU manufacturer
information does not match the specified SiFive CPU core. Therefore, these
errata does not affect any CPU core except for the specified SiFive cores.

Changes in v3 patch:
1. Remove "default y" setting of CONFIG_ERRATA_SIFIVE from Kconfig.erratas
2. Correct the affected CPU list of errata "cip-453"

Changes in v2 patch:
1. Display a warning message if Kernel finds the required errata is missing
2. Provide sample code for a vendor who wants to append its errata
3. Create a new patch to workaound SiFive errata cip-1200

Vincent Chen (5):
  riscv: Add 3 SBI wrapper functions to get cpu manufacturer information
  riscv: Introduce alternative mechanism to apply errata solution
  riscv: sifive: Add SiFive alternative ports
  riscv: sifive: Apply errata "cip-453" patch
  riscv: sifive: Apply errata "cip-1200" patch

 arch/riscv/Kconfig                          |   1 +
 arch/riscv/Kconfig.erratas                  |  44 +++++++++
 arch/riscv/Kconfig.socs                     |   1 +
 arch/riscv/Makefile                         |   1 +
 arch/riscv/errata/Makefile                  |   2 +
 arch/riscv/errata/alternative.c             |  74 +++++++++++++++
 arch/riscv/errata/sifive/Makefile           |   2 +
 arch/riscv/errata/sifive/errata.c           | 106 +++++++++++++++++++++
 arch/riscv/errata/sifive/errata_cip_453.S   |  38 ++++++++
 arch/riscv/include/asm/alternative-macros.h | 142 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/alternative.h        |  39 ++++++++
 arch/riscv/include/asm/asm.h                |   1 +
 arch/riscv/include/asm/csr.h                |   3 +
 arch/riscv/include/asm/errata_list.h        |  39 ++++++++
 arch/riscv/include/asm/sbi.h                |   3 +
 arch/riscv/include/asm/sections.h           |   1 +
 arch/riscv/include/asm/tlbflush.h           |   3 +-
 arch/riscv/include/asm/vendorid_list.h      |  10 ++
 arch/riscv/kernel/entry.S                   |   6 +-
 arch/riscv/kernel/sbi.c                     |  15 +++
 arch/riscv/kernel/smpboot.c                 |   4 +
 arch/riscv/kernel/vmlinux.lds.S             |   7 ++
 22 files changed, 539 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/Kconfig.erratas
 create mode 100644 arch/riscv/errata/Makefile
 create mode 100644 arch/riscv/errata/alternative.c
 create mode 100644 arch/riscv/errata/sifive/Makefile
 create mode 100644 arch/riscv/errata/sifive/errata.c
 create mode 100644 arch/riscv/errata/sifive/errata_cip_453.S
 create mode 100644 arch/riscv/include/asm/alternative-macros.h
 create mode 100644 arch/riscv/include/asm/alternative.h
 create mode 100644 arch/riscv/include/asm/errata_list.h
 create mode 100644 arch/riscv/include/asm/vendorid_list.h

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
