Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29156CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 17:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9cB0LkWLqnPaIIuyCUvORICfPPM9PeGnGHeypkvgytY=; b=Enzopl4LJsWd2A
	S+IwdJMaukAECvw9CevG777lI789/hxlHjKf/ZtyUCE38e0JHvfuGrdZKaVOhkBEE9YYPN+mQDvZm
	XWpIRwjkL2+qJw7k77DnWMZ1uxyRZ/Fj06x4GTfTGvhhX2g5HOqUIUUdgpbt56Xhn0B36YNy2aDpY
	QJhTwEjcBUvFVnJNN4p9caxK9A5QjfofI8VqsRyyfW5UBuxQn2i3Oko4EVwvP7oFOKRXBxich2tze
	WP67LZc/bRn0LQoQRkQTZN8QIgXfsIsUlJEwePyF+mngPvRBvXbqLqjHT8gyumQ7aaW9raRCR1M2w
	sFa4MBVekLGCJoJDZf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyV9-00000003ADV-0P76;
	Fri, 15 Aug 2025 17:46:03 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umx4M-00000002wbt-2AC7
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 16:14:19 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-323266b2368so1497756a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 09:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755274457; x=1755879257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vcATQ/iyLXq2WCAG+QWp7/wBNzzyT/wwSXwFvJK/wvw=;
        b=JZiqGWHZk1VIvm1hPxcpajkj0uwnS2uVHMu/pmXX8tAlGUcOcfY7Xq0GomVLj7nZbP
         jNiaKRsNob07PnIfYWQNhN/jcfbWYHA64xmY8qH2+TFqqfAe1C7PuoAZEx0iThDH4PQ+
         mPL+yeNePHxBjSqbrjnqle/mbBsJDcGukykt7hKIBHLLppDXI3QQjeDixhCNtG7elxqX
         hU+7it3rCJpBxRuXsz9t64cIOENg1l7MSuk7biU4br3hcgZwUf9EIp82XWH0GAb/a7Va
         MjOGkcKbJsLQMDmN71/xWizOw9KFs00BY9hiYEPJXzd76l9bp84dBHVDD90UoJdr972f
         loOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755274457; x=1755879257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcATQ/iyLXq2WCAG+QWp7/wBNzzyT/wwSXwFvJK/wvw=;
        b=jGqkU1WATzGGJwLhD3X2Kj6iEg9EmrMDt5DoTSIi2KGNlXIHHKrr4jvs9FNvkFaRON
         f1dckkfD7/jInb2n8lROcSrMC25Nc6cFDs+o05NB4e2mF/Jt0wlhfj6WS0FZx7XCw5xk
         ay0YXmxNur08tmCioz9JJ7ElFa+Vw0IMfqbLnMktbmZK0AzGHlSw0IP5K4sgkWIuZvkA
         z/MrPzlQcZ9p46Q+u/mISXMbfOOKP3bc+i4A1r61N1xRAaD8HC7P03MVASotecjR3Xiv
         63RrZjGOHX+sZe9ntytQjJCCsWQhYTn4VhKiAdmB0aRAhJ2d8ZHhuCRXHAa7VxTuZnjn
         aPpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXauIkVpbB2xJepdv95HubKHZbSd0EI+tneh/FufanJtgMiCVnQfvPY90gjwnNdU90DrNVsQRjrPhnvxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyM3GJw2J/v8zdGd7LumPXz1QhiMk10pvNKu+L+85F00AKUrcPV
	fUFpSnTl8SdOArowICAq3vXzwykR9TIglRqEGi/Ii70PzdZh9gG47ysMPvJ7H04LDh4=
X-Gm-Gg: ASbGncus8OPg/gvNchObJJ2MUXgpazvEAKCnknZesN3otfBJES2x34HhPrhsZQhrhI7
	7XvR2MoL9tlAOmP8prMJXVptdBvozZsWqyiyMwhrzbSE8TqvUXLv0LeBHPEQrqfhKDUQwrPZ0XZ
	OQwJ9zLQ5Os364X2bHP6RmmrOYNu3rgGobadSQ6XpdtaPOhzu9i+atdMrGu9XW9hjQ+0zjsvgzM
	gIOiXBsRmDOd98X17awufaGeO9SPkClK73L5C43TYOgbtHKOf2gH1govcHijGAkxgoLJfJ+Fmla
	UvB2COa6dBIBgFyNaYeqB4+i15mUB1blQ4kfR/f3gGrglGWQ19AQFnzoiaZ+CEJtR4zYlTuUW+V
	YOtCNbaKjWYJt5OVqsiaCitbaGlcH25zHapc0yFQniwrpKhRovT4f1OE=
X-Google-Smtp-Source: AGHT+IHperFQi/7YSivsAfePkj2it+rOxXUM7GZDi3LaWPilgY2XPCaqL9OvKCM03IrF3xh8S5y5iw==
X-Received: by 2002:a17:90b:2d4e:b0:31e:d9f0:9b92 with SMTP id 98e67ed59e1d1-32341ec09f9mr4429507a91.14.1755274457311;
        Fri, 15 Aug 2025 09:14:17 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32331123409sm4645605a91.20.2025.08.15.09.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 09:14:16 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Len Brown <lenb@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/2] Common csr_read_num() and csr_write_num() for RISC-V
Date: Fri, 15 Aug 2025 21:44:04 +0530
Message-ID: <20250815161406.76370-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_091418_562649_144D7F26 
X-CRM114-Status: UNSURE (   8.96  )
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

Some of the RISC-V drivers (such as RISC-V PMU and ACPI CPPC) need to
access CSR based on CSR number discovered from somewhere. Add common
RISC-V csr_read_num() and csr_write_num() functions under arch/riscv
for such drivers.

These patches can be found in the riscv_csr_read_num_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (2):
  ACPI: RISC-V: Fix FFH_CPPC_CSR error handling
  RISC-V: Add common csr_read_num() and csr_write_num() functions

 arch/riscv/include/asm/csr.h |   3 +
 arch/riscv/kernel/Makefile   |   1 +
 arch/riscv/kernel/csr.c      | 177 +++++++++++++++++++++++++++++++++++
 drivers/acpi/riscv/cppc.c    |  21 ++---
 drivers/perf/riscv_pmu.c     |  43 +--------
 5 files changed, 191 insertions(+), 54 deletions(-)
 create mode 100644 arch/riscv/kernel/csr.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
