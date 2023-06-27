Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14DFEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=USoASLwMpZmlgq7rD8ZMyhECa4lad8ccbbig7Xp3FYo=; b=OKUdlfe6WAaeNj
	g6Vjp+ffGKa0Hlo6/3Mxbcq6tuN8h2AuMxWRM0aVZ31zikbCmuU2DIHJ5RXQDXM6vRPflRk7Frob/
	pyl7xcwnYI1Tpp7OiW0R2Kixt+vaT69MWol/wbd8ooLFQDwGhM1UfWugRH0yxBgNR7BL0SpHZ+TCt
	uHC04jLlygTbJI8Lo0eWsPGz+f13vJ2jQvp2A7T/jeqsylBrof5k5sVBpwguner9FYlI0nKpWsbQL
	jv35iERUA14Ul65SsM6fDCmTFcyYRnWrw1H94EZwAMvxocg190l71v8G0Bm9nn+XqeE8sUoO8oHFZ
	ZiLz+sRJfWUzSOQ9THlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE9pq-00DOVC-1i;
	Tue, 27 Jun 2023 14:38:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE9pn-00DOTg-2X
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 14:38:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f9b4a71623so44804745e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 07:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687876699; x=1690468699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+C41V7RG5y8tus8a2bS6fXzYKHyPug4YX52zYixdqXc=;
        b=yv/rlGV56Rx4w5dUzZqxeq5KGVYUscxz3mVtXcfwBEl7sAAaz8EkIR7pRo1RvSkaUj
         rUr0ZuP+7Nh/NPTdSZ0HtaVaSof+gUZU0qs1twkErLIfkAHeARPAcA4wjS7etd34sCJH
         ie/CvDHYDIa3TeGKLM98hyoQIYaMThelko2Lc4Xs7Ec9/63AhE6wZ8Nk0wL2k9lqHP8K
         c8SXBfjrGGJvliutBkOYMWpRit6MLCBRj5WL+CNqXOAUz95Ompcg8RQXz0QZf14yg7Q2
         rBl81WLIA8PZKkMtvgpvXrachnOEjL3gVM6ty+EqBv7wWyHICm7skQDU/9x/FlP42KFC
         WBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687876699; x=1690468699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+C41V7RG5y8tus8a2bS6fXzYKHyPug4YX52zYixdqXc=;
        b=HAyCeXxRUnA6wKjCmal2ne76ysBWpMpsx2v+pxiSK7flQ9pG++guMvB/+7c+T9z2+O
         IMfizMNnAQmmbGWbn/T0WiqBDOnbS0Ul56V7813aPF4mNjlehB9OEBYBdebcX6rEYozL
         k5S2Ce6rVMXEvI3JGz9dGwOzb3uNpCeU0QXILjJagiEx4sh79rLyhUAaOa+/kCR8uTWS
         u2d+vSO2GEdkJPPPAOyxWhF0hsrCpCD/jsX0BT1Lk65Pn0sibu8J59TcyEUf+FIdPF+A
         fUpr1KRXEfCQYIbrcEhdYnkKGV44mfHvtZ1RQpv66COT0l53a+DwvIBaINwmao/n5sKU
         wjqw==
X-Gm-Message-State: AC+VfDzboncZIYNu9NcsG4P0+hIpQvcoXgU5FqDls7uu1JaLq0EyVMk4
	urBSkdHuUirX5KPz4iVfSrCqaQ==
X-Google-Smtp-Source: ACHHUZ4+vt4NZ58/U/X3S1zrCFaI/7IJINbviXWuuOta5mxEG3BMIF9gWctFWwGmtg0aVJjJ4Q1Anw==
X-Received: by 2002:a7b:c050:0:b0:3f8:f45f:5c34 with SMTP id u16-20020a7bc050000000b003f8f45f5c34mr10342762wmc.40.1687876698944;
        Tue, 27 Jun 2023 07:38:18 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id c21-20020a7bc855000000b003f8fac0ad4bsm10894793wml.17.2023.06.27.07.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 07:38:18 -0700 (PDT)
From: Samuel Ortiz <sameo@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Samuel Ortiz <sameo@rivosinc.com>,
	linux@rivosinc.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Guo Ren <guoren@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>
Subject: [PATCH 0/3] RISC-V: archrandom support
Date: Tue, 27 Jun 2023 16:37:41 +0200
Message-ID: <20230627143747.1599218-1-sameo@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_073824_045987_231CAB9F 
X-CRM114-Status: UNSURE (   9.64  )
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

This patchset adds support for the archrandom API to the RISC-V
architecture.

The ratified crypto scalar extensions provide entropy bits via the seed
CSR, as exposed by the Zkr extension.

The first patch of this patchset allows for detecting support of the Zbc
and all scalar crypto extensions.

The second patch exposes the Zbc and scalar crypto extensions through
the hwprobe syscall.

The last patch relies on the first ones to check for the Zkr support,
and implements get_random_seed_longs by looping through a seed CSR
read-write to return one long worth of entropy.

Hongren (Zenithal) Zheng (1):
  RISC-V: add Bitmanip/Scalar Crypto parsing from DT

Samuel Ortiz (2):
  RISC-V: hwprobe: Expose Zbc and the scalar crypto extensions
  RISC-V: Implement archrandom when Zkr is available

 Documentation/riscv/hwprobe.rst       | 33 ++++++++++++++
 arch/riscv/include/asm/archrandom.h   | 66 +++++++++++++++++++++++++++
 arch/riscv/include/asm/csr.h          |  9 ++++
 arch/riscv/include/asm/hwcap.h        | 11 +++++
 arch/riscv/include/uapi/asm/hwprobe.h | 11 +++++
 arch/riscv/kernel/cpu.c               | 11 +++++
 arch/riscv/kernel/cpufeature.c        | 30 ++++++++++++
 arch/riscv/kernel/sys_riscv.c         | 36 +++++++++------
 8 files changed, 193 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/include/asm/archrandom.h


base-commit: 488833ccdcac118da16701f4ee0673b20ba47fe3
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
