Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E05DC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 22:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=6cHhgFw6tQ7vT74uzaRUWFD2z5LfujlLXpwrELGizjc=; b=bo2
	QcqdI/EAawelZV3qhyg0EJ+gkb0rWSbCIfsejmSeuoM199wKJP970cHB0F/f13LqfKl6XEJuXYQMZ
	FGgOaXOmAihOjQTmziSXCPxsofyYW9a76WFenPDlKhRFAWBwLpZGgOPHdMj49tKeeyUaQnPbE4cku
	z5JspAGF1oCy5UwLzoNGUqX/oU+Igg3xvfoxsVtpVypJQAmisiUMYS9KKDHtoRJFaGbYuq0uI9DdQ
	PFPudm6nsC40hx0YJruDlWoyJISzTcFmrilOrHraNSvbMx6GRU3ewyHT6adyJkbbuVdBoDvbU6DGn
	z598BEfEkh4gnILdLd7s4fSmDKKh5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMEkj-00000004hk0-0UHC;
	Tue, 25 Jun 2024 22:35:05 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMEkf-00000004hic-17fK
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 22:35:03 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7065df788f6so6695012b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 15:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719354900; x=1719959700; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KACPm6o1sF6MfYdPebomXscoE9qCB1ha0g1j4OaH67g=;
        b=RieJV7A2R6d4BzR/BwZX4A7ttU0qiJ8/mEmcDjBvORR/KqoEjm/OYoSwnWil5D4SVb
         vT911nnEgpA0TdO7lJN3W61LByu8G2Cz1Kb5zz/wjTIu9QwH4pCXy+Ozq04cpQNEBKxl
         KoyHKTdiUyBqlsWPk6frw7sIpXDt5J+KHNpBa8D0w5Jky6iTv9comNIxYtHw6ozB3T2U
         vieMHRKrN5pJRL1DATsIhXfwAkGppdODjDjFsHpHMRAcy1ZSKiAiw0DVyWTI+k3zPcI6
         hjhYiTM5C2mMkMMo9IUhj7tEg1wmIoAGFReelqar+0HmwqJRVwEQ9cffo7G7Qw3+BcJN
         BEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719354900; x=1719959700;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KACPm6o1sF6MfYdPebomXscoE9qCB1ha0g1j4OaH67g=;
        b=FvFe9HOKKckEFi43v/dcidzw3bJnfFy4DBzRa4HSQse7QzJBAgikTUnIlX3Z8OG7iN
         ZPuC4zKY1uBCZAchIa3HfBiHekvIy7AmYR/Q5ITEE1sy7DdgnjPYONDaZUg+qUNUtXxW
         xMJzbmsmSMvr3jjRvGhGPGKDyRWQCHmD0k6raZJpQILab6qhSeE3f2XsrEKgdZ8iW5Sb
         4cQI44ttU2T9HAueB/jC9g6tXqi4aOpMWH/ph8wJlqfHzQ8qREOyLLDEdS9Zjq/Ad/LH
         7EV0GDpbfA0mv3igb6c3RrYYXiuqt5BzBLiPIhbu/1ghGsh/ciwTP12zKS8rl4B6lAxc
         +mRA==
X-Forwarded-Encrypted: i=1; AJvYcCUczuLHL0n+31Ym85hXmQnT/2oiwsukqjl/5Nrv3yePpN7sSeezT94d7fvICjcQe8NyHaToteHCv4PVlQiS9NZzogMZcJUWuFLcLTZs9rQD
X-Gm-Message-State: AOJu0YzJT2slpXbUFuQO2v/nsEKzNHSPB9umy3sz49NY1xoapIL8vd/k
	e3wfmH+hQYfw4/jZUfTGqinpXJDIg3NsTTEJCMeooWn2H2ShL+YZBMC8O1/UXpgGZmR2OA/BgaL
	eDw==
X-Google-Smtp-Source: AGHT+IFpOX5CcrzFldMsRz/JodHWPPYjtr1mfNvHUywvuU1/bJCVZhZ6TnspYz+fdShAF0CdfuxKj2ZiUg4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:3698:b0:706:3f17:ca6 with SMTP id
 d2e1a72fcca58-706746c2606mr330723b3a.3.1719354899705; Tue, 25 Jun 2024
 15:34:59 -0700 (PDT)
Date: Tue, 25 Jun 2024 22:34:44 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240625223454.1586259-1-edliaw@google.com>
Subject: [PATCH v7 0/1] Centralize _GNU_SOURCE definition into lib.mk
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
X-CRM114-CacheID: sfid-20240625_153501_346229_C3EA9B83 
X-CRM114-Status: GOOD (  13.61  )
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

The initial attempt at this patch was abandoned because it affected
lines in many source files and caused a large amount of churn. However,
from earlier discussions, centralizing _GNU_SOURCE is still desireable.
This attempt limits the changes to 1 source file and 14 Makefiles.

This is condensed into a single commit to avoid redefinition warnings
from partial merges.

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
v6: https://lore.kernel.org/linux-kselftest/20240624232718.1154427-1-edliaw@google.com/
 - Rewrite patch to use -D_GNU_SOURCE= form in lib.mk.
 - Reduce the amount of churn significantly by allowing definition to
   coexist with source code macro defines.
v7:
 - Squash patch into a single commit.

Edward Liaw (1):
  selftests: Centralize -D_GNU_SOURCE= to CFLAGS in lib.mk

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
 tools/testing/selftests/tmpfs/Makefile            | 1 -
 15 files changed, 12 insertions(+), 15 deletions(-)

--
2.45.2.803.g4e1b14247a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
