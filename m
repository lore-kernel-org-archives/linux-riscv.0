Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B01CCF9E5
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 21:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pLSyQqjVgyD/jJGRWlFvt+6H0A3mV+yFmJsD4zzbyS0=; b=cXr7QEWgVGQQd6
	LF6ZSHxCpnASSKoD9/kKUtHM1NgUmHeAZqn3iDzdLIREkViM+tBvay9vfoWuob3esqj/pvWbwRIEq
	WTK/hLhxe0SOUFTw+ReEVMYbL6v15KHeje6q78IjOVBmi3fGLnndmYj2mNDH5CRFqDpc4zOUXo8iF
	I7v8WTDxvqRxunCLUzvhW3/6o1k/Mpwsxmj9sHPPQgSss1ZpJo2w3OWmoAYp15V7qaQu1Sh2Tm8cj
	5AafAJz2yXudr5Oetbf5/ELeB6xTHWWO9n0V2rM7z1fN0fVkCNYSiQ2SgjTdCQFBF88IQQaYCOBYG
	NPZqfItJtQKOMtOQ4dQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTj-0000000Bl6d-3fwm;
	Sat, 25 Oct 2025 21:07:11 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTh-0000000Bl5p-1BYI
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 21:07:10 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-592fb80c2faso3120785e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 14:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761426425; x=1762031225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xrTy/fULfWQ/AuOkkZeBntBWMGO07F8iRNTCWK3FE8U=;
        b=O17tjyzaqpGdlzWa36/6UEyEN04IcL8WzQ3nL0h55f7c7jbId5SmK6QUG9T70NhEWk
         IxiuLCig3JVXqJZopAUzaydHSRI4LMGdz4IeEY/rxo0EE1dvTddbyxopEeYmOE8ByFMG
         mgvEkcKWM07wpg6PCMnrYeLT/8IDEoWkWiJNu95bTcxAi+0WWgdtIWTAKYcdpHZUEsmz
         mzowqrwPEXOnUQ/aX/HxlSxn3RvuUgmTGHNL3Jwn+RZ6Vsl1Tof6bF4dgG6BMgyDFCov
         dyAkJxnVeV7RUYGXjfQMlXYKVuFmQ628DwHXLXXKHvkk0HJp/IWvosaJLmVa4FqoJoxo
         Rp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761426425; x=1762031225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrTy/fULfWQ/AuOkkZeBntBWMGO07F8iRNTCWK3FE8U=;
        b=wSpAvbvzQiGj3P9m87pL/1qVXzgQST1JrHC1Twnj3xxouk6kRIb75R49rx/UHUO8hG
         iF8k+7cEDgz++1jwhl5+g4A+73I3MRiy3FktNtUgiBnZUP5hqgBSKMaaRzTNQuoidsbR
         lA2aKUI34WXu12/L6orGEJSJi+ZEj7JvUurWituBmWGyzVbPUdnKuFZm0zVvIxcyl6nR
         2gyy16DWFmAeGYr+CNWabju7plB36BjAxxbYWtoFRGP1kVtTYnycFEZL9LIl5sgiGZd+
         bdrnBZYFpV8k1lFwd6qjpH54MINKBTXcG1165Dd1HKrwMzxqZ96EMOHHuOrr4rdQYVJW
         8b/Q==
X-Gm-Message-State: AOJu0YzUNAbd3lvA6FVunTEfAiu2dj5XmatWX292LLdclW9LGMaxqD/d
	0N39w72XnTPbQiV4BfVPxGkbi1Ae3WAGjY4AN/dumNcbxWwfRMwMkKh2dMOnxTYMp7Q=
X-Gm-Gg: ASbGnctBd/IHrHuj3ZIo67/Ew/aQcLQLCCUz4T/r2lfon3GXw86CGZrsJnaFe1iwzdg
	NWEjk+ZnQD13hD5YFtzrxT4rjPfwk9EeDnG3RH1uGoQ8V+P7VqKXUuXNHJK4rP7KHMIhQu26Htk
	ZG+2rpBkrMX4XMz+UnLN09uJYquF1eJlNtoFUpwNRjQ6cDj2dehsWpsDLlOrg8yAk07dDHgz50b
	rmPhK/QnLiDsbl0smf8nsnwMKCY+qZRuTLBJQktX3mgBJLZ/Y3SwN/KoqX3+Q7u9kLB2Ce79Qle
	agxhIKrMqIadGgbzNNWWMu8o0hPm/QKB73kyeLmgUdGcWLwr2bAXuUIZuiOxiVBWi0TWxKPVKXJ
	fFgG9YvArrDLhGbwLTGkR82txY0kxRpc7BhpUSSt2BAt9pKdn5vHN7UrNBNNbpMaDsmA=
X-Google-Smtp-Source: AGHT+IGVmkvQikvMTRY2P+CBsoQX/dtGCo+IL2vMn6AXhs8QRoo32mt2Gun7dSC5qD6SHJZx3Jm6ZA==
X-Received: by 2002:a05:6512:3da6:b0:592:f7b7:2f6b with SMTP id 2adb3069b0e04-592f7b73090mr3904766e87.4.1761426425215;
        Sat, 25 Oct 2025 14:07:05 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59301f840dfsm953644e87.104.2025.10.25.14.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 14:07:03 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Joel Granados <joel.granados@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v3 0/9] riscv: vector: misc ptrace fixes for debug use-cases
Date: Sun, 26 Oct 2025 00:06:33 +0300
Message-ID: <20251025210655.43099-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_140709_362066_6B4C8BB5 
X-CRM114-Status: GOOD (  12.15  )
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

This patch series suggests fixes for several corner cases in the RISC-V
vector ptrace implementation:

- init vector context with proper vlenb, to avoid reading zero vlenb
  by an early attached debugger

- follow gdbserver expectations and return ENODATA instead of EINVAL
  if vector extension is supported but not yet activated for the
  traced process

- validate input vector csr registers in ptrace, to maintain an accurate
  view of the tracee's vector context across multiple halt/resume
  debug cycles

For detailed description see the appropriate commit messages. A new test
suite v_ptrace is added into the tools/testing/selftests/riscv/vector
to verify some of the vector ptrace functionality and corner cases.

Previous versions:
- v2: https://lore.kernel.org/linux-riscv/20250821173957.563472-1-geomatsi@gmail.com/T/#u
- v1: https://lore.kernel.org/linux-riscv/20251007115840.2320557-1-geomatsi@gmail.com/T/#u

Changes in v3:
Address the review comments by Andy Chiu and rework the approach:
- drop forced vector context save entirely
- perform strict validation of vector csr regs in ptrace

Changes in v2:
- add thread_info flag to allow to force vector context save
- force vector context save after vector ptrace to ensure valid vector
  context in the next ptrace operations
- force vector context save on the first context switch after vector
  context init to get proper vlenb

---

Ilya Mamay (1):
  riscv: ptrace: return ENODATA for inactive vector extension

Sergey Matyukevich (8):
  selftests: riscv: test ptrace vector interface
  selftests: riscv: verify initial vector state with ptrace
  riscv: vector: init vector context with proper vlenb
  riscv: csr: define vector registers elements
  riscv: ptrace: validate input vector csr registers
  selftests: riscv: verify ptrace rejects invalid vector csr inputs
  selftests: riscv: verify ptrace accepts valid vector csr values
  selftests: riscv: verify syscalls discard vector context

 arch/riscv/include/asm/csr.h                  |  11 +
 arch/riscv/kernel/ptrace.c                    |  72 +-
 arch/riscv/kernel/vector.c                    |  12 +-
 .../testing/selftests/riscv/vector/.gitignore |   1 +
 tools/testing/selftests/riscv/vector/Makefile |   5 +-
 .../testing/selftests/riscv/vector/v_ptrace.c | 737 ++++++++++++++++++
 6 files changed, 830 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/vector/v_ptrace.c


base-commit: 72761a7e31225971d0b29d9195e0ffa986b77867
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
