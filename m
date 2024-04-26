Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F281BC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 23:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JUQR1i3oImzbEQ2ba4pR/dTJ5ledYmO3DqKTCv3odE4=; b=aqSkz0cZ9t9hNU
	3IVScU2sNEbVA+0QASWgrvZis7tKbvQlZ5SqYASFxGBB9xe3QAhEwPJbOYL9yTwRLHlc5oHgEaoeA
	YJerXFruBP/xb20TS3vzR1dZPrQ/EGq+KYJqfb3wpBPEWz9+R8knJazQSwpCQd6Rgs5mSdC6fw+1j
	dGRP+nNUCruLcJszxJXCBNaTWLbA/nJcRtHzTxnzUK0e6QSbWaIAu/b7pHzbcHLu18RRbpjuOusmR
	LOjqADXH9879DVbdlt9PMrY7xflQgbsjcLg7FJynJzmxCkQ3rSkbwGkigIoy7aXDAAGtFkf9nm+yn
	shinJNztWkHS+de4edIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s08pL-0000000Ae0w-41z9;
	Thu, 25 Apr 2024 23:48:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s08pI-0000000AdyJ-1NEp
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 23:48:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e2b1cd446fso12750435ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 16:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714088900; x=1714693700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Inr/KUA/PsquUt3bH2Kr9I94XwvfkcF6wR+KZiSWRA=;
        b=AyDuj3v2AD/OJe98YxihX3EXM80NcbheQ2KcEvCLL3+ZGhH0DUMEXULU3bx+sAADkH
         qmo9FaEH05SPziY3K0Uw2fVndTZbYR8R1oNUfHXOVwiTH+1uak+wCEDtZQ1I/EGjndD7
         YIsB69xMBHU66vkVHTdtR6Ifk6guX0TNao5ERfFqdHaeuQp+aOi6qa2Tvsba/uFUnhOD
         A+dRpVaHGcrW8P5hiRsTvGhNcklzZXGIEqQ8uz+c1gd/g6yBlJQyRfQKoCqq/WHrDJ+K
         TSNIWNalBCKZyyaMDu2W/MRtVmo0nzjqnU7lkrZucmp+zj9wT36LgNwlOU+xQOym/8Ng
         bu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714088900; x=1714693700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Inr/KUA/PsquUt3bH2Kr9I94XwvfkcF6wR+KZiSWRA=;
        b=V7bHd4Pu+hUgh3tWG3LFUbFC+xo3X4pgGGNYDvBdZI/YObfGRnO1abpbGZUZttKKEq
         BYQxpZuUrFg7p6hQttqiHnlXiCstt4m/wT8HLv+X3sy4KGhpaOl6Ph8b1yxIRgu274wc
         Uv91TivDTvj4+/e3OD2FMRtWHHmqiLqE+93HG/R1PgGMrTsyaseGqSrW0d2P8bq5/Wgp
         CwpfDG3sV5LwsiIIC0DnkZCKsGVf0EqpfMAcGx92qF84J4JCioBmQLMt+SaFjeohbNEj
         9eEeNciamj0c4s0fT+I7K/han1smrCqbFUqDa7dLO0VDl38xp6amtrTGpo72JFCmJH4H
         Vh6g==
X-Forwarded-Encrypted: i=1; AJvYcCXe1aYZY1QiMsQxekKWdgcgTlzwP1MwWJrQgqrRDNVoU4ICdFHD9olSOajFkQBtvt2DHNFnCsTR7673A120af3ndrpC6HhnFNqqzvF744os
X-Gm-Message-State: AOJu0YyHE8K/0qSxM+PX0N1u8en5tpCvJFC1UarnPM4og4jFDrFr+s2b
	N/mLG4aqbYZoKYvNxekaUMGZcn0wKgUnJlYlRk4/hoTGP+hIgE4zBvwp78JYkIc=
X-Google-Smtp-Source: AGHT+IHX+6H8Fll5EzS9fbIZupY/l5vMCSoe9nSxNaamG0WzcMWQPBF2gUz26IgHTNdOeLB+qR4B6g==
X-Received: by 2002:a17:902:680a:b0:1ea:d979:d764 with SMTP id h10-20020a170902680a00b001ead979d764mr1023158plk.50.1714088900189;
        Thu, 25 Apr 2024 16:48:20 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i17-20020a170902c95100b001e0b5eeee41sm14349281pla.38.2024.04.25.16.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 16:48:19 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 kvm-riscv/for-next 0/2] Fixes for kvm-riscv
Date: Thu, 25 Apr 2024 20:16:35 -0700
Message-Id: <20240426031637.4135544-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_164828_462257_6008921D 
X-CRM114-Status: UNSURE (   7.98  )
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

Here are two fixes for issues found during review/testing after the
series[1] has been queued for 6.10.

@Anup: Can you please squash them into the original source commit 
22f5dac41004 that introduced this ?

[1] https://lore.kernel.org/all/20240420151741.962500-1-atishp@rivosinc.com/

Changes from v1->v2:
1. Added RB tags.
2. Optimized the logic for overflow mask.
3. Update the fixes tag. The cover letter should be enough to indicate the base
   tag for rebasing.

Atish Patra (2):
drivers/perf: riscv: Remove the warning from stop function
drivers/perf: riscv: Fix RV32 snapshot overflow use case

drivers/perf/riscv_pmu.c       |  2 --
drivers/perf/riscv_pmu_sbi.c   | 45 +++++++++++++++++++---------------
include/linux/perf/riscv_pmu.h |  2 ++
3 files changed, 27 insertions(+), 22 deletions(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
