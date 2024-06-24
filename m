Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5342C30653
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 23:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=v3Kn8wjCWyheZpLRc6iMze1LuZ8lz46pDwgBOXu9Jqc=; b=Aa8
	zUrrl84y3KZSBTk4wfpPCm39iUCbgfIXm85buDJsz7c7V7FN9LZxbzm1VsMM0wiRfytkLPWNyo2wR
	FrezKnOFM/MpY9JeNIvdEVdy/0hwTaFFES5NhW+L1sJip8bzGP/zBmQiijYTyagopJS34lBu1cVy7
	4fSoPmUycO+N8Mx43cRstwkRBOIGGvU4QbBFK8gqhAhWENiUm3J+RPi7CYovxSSJH3/X4RZebqPdX
	S0J2itT7v7vhkvUBz8fKuD1z0+MK9gEsJVnGk5/Q7VAc5P6Gj4PmVfh7UyMD1hO4uytEHZzuH+lA1
	/HD/qVWiEzZMLa7u2KLIPA5VjbK/gtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7M-00000000xq1-3VFe;
	Mon, 24 Jun 2024 23:29:00 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7J-00000000xoj-2vwc
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:28:59 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dfa73db88dcso9779358276.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271735; x=1719876535; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FEnvDY+YQtOlDLldfWY9bO5cHBXotclBQZRJTAhLrGQ=;
        b=ZZJx5xSAABC8eJ1hNu6PRV7NZo2aUsmHfzzM+8Cvce9+HxE5Vd/pxdctEjEunBfgnn
         NDAS3kNXve3WbnnGEM77p+tYp7wb82vQKDvDFo1EG+B1IENAi+Kz8XqtqVS4+bTB7wz2
         Yutg5rKawIwiGe8FW7gI36JUfE/6N3/HG1rEdxIMEaI2ZGrgUrXH2/i5uLlEGlvhR03h
         AgRbxCisURItym0sSXNkd9zJdfZqZDJHipWdXQU3gpjKfUrXDpAls+8Qe3ZPBOYOykzN
         C+aZc/8i1SBMW/KtvcktRAk4R6GrFUUyHSN7w8BJaks/uy4/7hxAJidYK1xL+FZ0OZTc
         8duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271735; x=1719876535;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FEnvDY+YQtOlDLldfWY9bO5cHBXotclBQZRJTAhLrGQ=;
        b=f7IX/1u8B5qWkFjKk6QuSPG3297a7plRcEUUEyPj/vwtkRpqMIc8PO3Ch7vd52baey
         r7x3483DUa9En6UW5uu5zNssoffoIuseB5FuOgC4+t5x5w4oNkAvqUXiEJwYp4hvbNLv
         rM6ILzTwn95zpLeMVQYMRDT3r2mShYM89rKGJt4CsQZeq+aGgC0JnTSLFapr9dgMdVmk
         HulsXMwjJvY6RX8z/rYqCLGMzZvaaju2o+RZB3zBCNYXwEC9bxz1P0j67iiUA/2opopO
         bLgHFSryE7YguCjI/9qIM/bKsKQaMN4R1OtRHOYPj1a48S//K897VdEBJXGHMBTa0ZFO
         N97g==
X-Forwarded-Encrypted: i=1; AJvYcCWxjK6BneMivgFrhCKg+MbjObzy9cEU3luqV/jfOOxmrKppwu0wej/w4QwSbzk0vbF4LeD+w02anDaFJWry3bZvcIK6sZs//4RnsH0XMzVS
X-Gm-Message-State: AOJu0YzOWfWqkaGe+R1tXCBFYHVVigt75CrN9RejVAGTxVt1RL8eIG38
	GhGnpCNOMSEpuSCwq34seebRF5L2U0X2A708Zt95jxFpxq48T7H1U2OdJaLNEW7vCxHU3BTKKFB
	DXw==
X-Google-Smtp-Source: AGHT+IGo0nBr4OMWeDQdXO7gLmA8943vaa7AUjGpvpzDg1f7Z8BrI79oFtF9sCT7oXO1KDCB6pUDmCcxQng=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1081:b0:dff:4788:ea88 with SMTP id
 3f1490d57ef6-e0303d692f7mr20462276.0.1719271735356; Mon, 24 Jun 2024 16:28:55
 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:09 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-1-edliaw@google.com>
Subject: [PATCH v6 00/13] Centralize _GNU_SOURCE definition into lib.mk
From: Edward Liaw <edliaw@google.com>
To: linux-kselftest@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, usama.anjum@collabora.com, seanjc@google.com, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sgx@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_162857_808934_E0F10BE5 
X-CRM114-Status: GOOD (  13.72  )
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

Centralizes the definition of _GNU_SOURCE into lib.mk and addresses all
resulting macro redefinition warnings.

These patches will need to be merged in one shot to avoid redefinition
warnings.

The initial attempt at this patch was abandoned because it affected
lines in many source files and caused a large amount of churn. However,
from earlier discussions, centralizing _GNU_SOURCE is still desireable.
This attempt limits the changes to 1 source file and 12 Makefiles.

v1: https://lore.kernel.org/linux-kselftest/20240430235057.1351993-1-edliaw@google.com/
v2: https://lore.kernel.org/linux-kselftest/20240507214254.2787305-1-edliaw@google.com/
 - Add -D_GNU_SOURCE to KHDR_INCLUDES so that it is in a single
   location.
 - Remove #define _GNU_SOURCE from source code to resolve redefinition
   warnings.
v3: https://lore.kernel.org/linux-kselftest/20240509200022.253089-1-edliaw@google.com/
 - Rebase onto linux-next 20240508.
 - Split patches by directory.
 - Add -D_GNU_SOURCE directly to CFLAGS in lib.mk.
 - Delete additional _GNU_SOURCE definitions from source code in
   linux-next.
 - Delete additional -D_GNU_SOURCE flags from Makefiles.
v4: https://lore.kernel.org/linux-kselftest/20240510000842.410729-1-edliaw@google.com/
 - Rebase onto linux-next 20240509.
 - Remove Fixes tag from patches that drop _GNU_SOURCE definition.
 - Restore space between comment and includes for selftests/damon.
v5: https://lore.kernel.org/linux-kselftest/20240522005913.3540131-1-edliaw@google.com/
 - Rebase onto linux-next 20240521
 - Drop initial patches that modify KHDR_INCLUDES.
 - Incorporate Mark Brown's patch to replace static_assert with warning.
 - Don't drop #define _GNU_SOURCE from nolibc and wireguard.
 - Change Makefiles for x86 and vDSO to append to CFLAGS.
v6:
 - Rewrite patch to use -D_GNU_SOURCE= form in lib.mk.
 - Reduce the amount of churn significantly by allowing definition to
   coexist with source code macro defines.


Edward Liaw (13):
  selftests/mm: Define _GNU_SOURCE to an empty string
  selftests: Add -D_GNU_SOURCE= to CFLAGS in lib.mk
  selftests/net: Append to lib.mk CFLAGS in Makefile
  selftests/exec: Drop redundant -D_GNU_SOURCE CFLAGS in Makefile
  selftests/futex: Drop redundant -D_GNU_SOURCE CFLAGS in Makefile
  selftests/intel_pstate: Drop redundant -D_GNU_SOURCE CFLAGS in
    Makefile
  selftests/iommu: Drop redundant -D_GNU_SOURCE CFLAGS in Makefile
  selftests/kvm: Drop redundant -D_GNU_SOURCE CFLAGS in Makefile
  selftests/proc: Drop redundant -D_GNU_SOURCE CFLAGS in Makefile
  selftests/resctrl: Drop redundant -D_GNU_SOURCE CFLAGS in Makefile
  selftests/ring-buffer: Drop redundant -D_GNU_SOURCE CFLAGS in Makefile
  selftests/riscv: Drop redundant -D_GNU_SOURCE CFLAGS in Makefile
  selftests/sgx: Append CFLAGS from lib.mk to HOST_CFLAGS

 tools/testing/selftests/exec/Makefile             | 1 -
 tools/testing/selftests/futex/functional/Makefile | 2 +-
 tools/testing/selftests/intel_pstate/Makefile     | 2 +-
 tools/testing/selftests/iommu/Makefile            | 2 --
 tools/testing/selftests/kvm/Makefile              | 2 +-
 tools/testing/selftests/lib.mk                    | 3 +++
 tools/testing/selftests/mm/thuge-gen.c            | 2 +-
 tools/testing/selftests/net/Makefile              | 2 +-
 tools/testing/selftests/net/tcp_ao/Makefile       | 2 +-
 tools/testing/selftests/proc/Makefile             | 1 -
 tools/testing/selftests/resctrl/Makefile          | 2 +-
 tools/testing/selftests/ring-buffer/Makefile      | 1 -
 tools/testing/selftests/riscv/mm/Makefile         | 2 +-
 tools/testing/selftests/sgx/Makefile              | 2 +-
 14 files changed, 12 insertions(+), 14 deletions(-)

--
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
