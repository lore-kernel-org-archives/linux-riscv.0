Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12598CD5BAC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 16:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OqyrJlKx498o2UC4J8v+jWJfIEAH/CobPs2FqlLvEbo=; b=ndNoOJc7ujoiWK
	HDiPNAc8NCZaal/ayBU6YkxEEPqEw4ci/c8Hu3xASybwuUL5pyIq7UlBiDnkqz7oRgahX/Ail8G1V
	WwrkmTfMZeIGBwy1dDK5XxNKL0WQ13EVK6lkokl1EfU48+qKAz4ob4Jb45I94H5Z46Re1wBhn2cO6
	COjo58A3aRwUGBsSzGcCawo9OeKWimmLTBm/O4jfndXzW7FNkOckJh9welTgJkYMJmTw++YTF4HW/
	hVWA/KDV3bLGT9cjqRRwNFqaEWnATmiva8TSDsZb9IrgqJHUIhQGV46yVNGWeVeMnu8lpY9Hc3hHH
	ywNzQROIBUt6goNp3xaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Dt-00000008TzL-0hOv;
	Thu, 21 May 2026 16:26:13 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Dp-00000008Txf-3sII
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 16:26:11 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-7c58e6eb3edso59964567b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779380768; x=1779985568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7uuIp19xdxHR1qyvlKmK0Wki6R5sFjAWE9O3wTUcYF0=;
        b=FU3dJePtq+XzQvUGt5kWWUAoSiCF92IlimTK7TkQnfAxkmMLPngSG07nxFQMTrDADW
         TPvJor/pQ7U6+VwWVesfbXfjuUAG4VgZm8Ynxf86f4Y6qTgTx6a7NfsKYkT/WuRwvC6E
         6w7Rm1ew/licB+LWvndiFFJs4rLwI5YXcBPxfzmvEuMwDvq82dkCBP/3NnsVFAkppDGp
         8J/oJY6Z9C+QFmEAgEZACtblY44CIcwHHcDwDKFZIiQzoQ2ccNTo9JYw8Ym7gYhI9a65
         CdzOjyNE9e5OejGmxc13JBkCtyuOA5bvTt7QpN3JHCPdME4iPWezXYsqf2bzgrzSYcwg
         9Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779380768; x=1779985568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uuIp19xdxHR1qyvlKmK0Wki6R5sFjAWE9O3wTUcYF0=;
        b=B7bGFlQSw/4GTZBu+A1eDIs+xM6nPdBLgQYPo8Zi7wrlxy4xj/zMICnUmaGmfnuR8U
         EaREvxCdvgvJdBUU7xqiEUvBtv7lgZsv5n4ATOPzbJgWKv2dvYyg52RzLZXuJbMj85q1
         oIB62ACHdbRSl+NFWMBr0WMudUtlAIPmFXipvtbIBch94dqowNZ75dJ1gkjUnATctOa/
         IE5t5Fx/qOcYeW3eHDmA9M4cPa+Ul87WS2VDzi7TsclzFwFwtNh3Z7AzZMX3i62Ot+sk
         jpWauNxYBWmjgQg5HHais/ESGS0AoX2VT6Arm/3Va75ORiPTxM1dZmSOe3t96CVyuyYN
         lVvA==
X-Forwarded-Encrypted: i=1; AFNElJ8EyzL3BqBExU4cSgvQzGZPnS7GNW6ztbU7wE8bEtHsZ66K/eZCBcSPMDrBZlykLy62uEq4K28zkAbz2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3dMDVpcmqIZczzTdxxuRMRd00BmL9gQNTxebt5UvW/2hKRjuJ
	/QHJc/Cd2XUoZnKRQUQ2r523AX6esHmenI6hEHrMcLyLl8uo+zngN5emGwnb+4GXqxE=
X-Gm-Gg: Acq92OFicxDXZ4fDjhlLPBKRPkzEb45Ek+wuXQwN9w38xaRC9SmSs2NyGKouedhiq46
	+I2ck4uQAIzHdC0NLtPT52k5ctKQnjYfbU9uyEn+4hPoGKjUkkmiO9DC23aYKDHKGifQBqAlXUe
	BmJIqbm+J1qRA+XA4hNudpMiwdFgosYHjoD/WjTydewZ2u3RfKipIP+CH0WJBC0c3tEwSfzAUT8
	AkZLs2H/xhcMLCq4v6MVLloDFdECyzvkSXLZ8xIDb3xrJ7nFM1S0Sdbi89Sx9D8qhVLcy6gMxYo
	LFZXjp6zJeFfQzJVpn+PwR/vlLcIlk02RlXoKQn3hb5lfmu8FqnQLhUJPMu3JZ4IfVdKhwcxnNl
	3Uv28JyK26l5UevTY7zNlzsrkgD2wXY5JC+W7FYRoqHkXMA/WKDu5DvGzI26d/Gqdwp+5xngtoW
	vMbp6O9/2d4kpVvHM1SAPf4ovG96WImLJgKm5HHSoqW8LEXy8Kmb4FjCG79a1ZEZCjh80=
X-Received: by 2002:a05:690c:4a03:b0:7bd:9899:f912 with SMTP id 00721157ae682-7d20c03bbcdmr40169927b3.29.1779380768456;
        Thu, 21 May 2026 09:26:08 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d2ca76a8cbsm4822007b3.32.2026.05.21.09.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 09:26:08 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] riscv: optimize Vector context restore on syscall
Date: Thu, 21 May 2026 11:25:16 -0500
Message-ID: <20260521162521.188629-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_092609_973299_C6B5594D 
X-CRM114-Status: UNSURE (   8.22  )
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

This patch series optimizes riscv vector state handling across syscall
boundaries and context switches. The kernel now keeps track of the
INITIAL state in sstatus.vs to optimize unnecessary context management
operations.

This version merges daichengrong's RFC patch [1] for the state tracking
code as it looks cleaner than my v2/v1.

[1]: https://lore.kernel.org/linux-riscv/7ba2f4b7-8475-4ec3-ab31-58b332bda47e@iscas.ac.cn/#r
Link to v2: https://lore.kernel.org/linux-riscv/20260402043414.2421916-1-andybnac@gmail.com/

Patch summary:
 - Updated patches: 2
 - New patches: 1, 3, 4

Changelog v3:
 - Refactor function names. (1, 2)
 - Merge daichengrong's patch, with a fix and optimzation. (2)
 - Fix ptrace GETREGSET failure. (3)
 - Strengthen ptrace SETREGSET semantics and add a test to cover it. (3,
   4)
 - Fix a potential ABI break in signal and add a test to prevent future
   breaks. (3, 4)

Changelog v2: rebase on top of for-next

Andy Chiu (3):
  riscv: vector: refactor vector context operations
  riscv: vector: adjust ptrace and signal behavior for INITIAL state
  selftests: riscv: Extend vector tests for sigreturn and ptrace

daichengrong (1):
  riscv: clarify vector state semantics on syscall and context switch

 arch/riscv/include/asm/kvm_vcpu_vector.h      |   8 +-
 arch/riscv/include/asm/vector.h               |  45 ++++----
 arch/riscv/kernel/kernel_mode_vector.c        |  27 ++++-
 arch/riscv/kernel/ptrace.c                    |  13 +--
 arch/riscv/kernel/signal.c                    |  11 +-
 arch/riscv/kernel/vector.c                    |  38 ++++++-
 arch/riscv/kvm/vcpu_vector.c                  |   8 +-
 .../selftests/riscv/sigreturn/sigreturn.c     |  75 +++++++++++++
 .../selftests/riscv/vector/vstate_ptrace.c    | 100 +++++++++++++++++-
 9 files changed, 281 insertions(+), 44 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
