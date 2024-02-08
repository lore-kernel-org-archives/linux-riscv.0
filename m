Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFA8C4829B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 03:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wcVhFo9zlbQqktkwg8XZbXD3f/zI9IizXo80FYv7SP0=; b=ajhhsHm3oew20n
	X2oGXIsX3CnSrDO21sMiIMCnVAZbAvYhU7seHA4o1XKoikRO0mEFlc/su46BFembatvgjXbM8ZpWG
	IMkmOKTX2dlUz19McTRwGTx2cDU61uySVggrqk4Lh9ftMFHy1kBxTvoZ48WTdWFa6GKrzxBQF6EKf
	/PQ2lgIA/6CmchTYFjB4zO4uoVx9EQ+6cgR2mSq/hrvMwrSC7a4QvxpuVjsv5dWD9fpkrZC0jYdlY
	UsHKfSIfobJrxyQThLaSpdBS4sTkz40cTmjy9Dav2XA9jbqmCbfrW8mlRXpzuAt+EXp4qe0qtt/9k
	/STYByjOs0bjwRQiZHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXvKz-0000000CZTS-2sXi;
	Thu, 08 Feb 2024 03:44:33 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXvKv-0000000CZSI-3ySn
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 03:44:32 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-218f4589f0cso478621fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 19:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707363865; x=1707968665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rkpIjNJ/hv5n3tdD+dzXGfS3/Ndu0cplbWReHM4buo=;
        b=YaB+gUXPwTp4qNvtilIHnRvFFodiCR3wpgZMiGWUNTUNY3yDSbFHJ1KQZX3c8+p3eJ
         xdD9B7j0mfrn5YdE9Zq+MsYhSWOA56BmG6G1gP5PpC2dvI5oNG7fNWI+/a6IgIhByIFG
         I7a9eLRgZE5DLpGICnwvbYpAt17arcs6b3+LyaNZ0esS1QkAfXQ2FAAGfYVJtFjjx5uV
         XLrufVwYXQYmF8axsXq29mlRA19YbTp7KvQDDN8MUfVjTQLJC+bo9L+SaFDRGzYLvZJm
         Q/UZyPn76b01M8fsjHaWE0Dw2SSffnF5ppjsMe9E7/sNjspKJ5gSi7ScJ1a2NBsw73m9
         cuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707363865; x=1707968665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rkpIjNJ/hv5n3tdD+dzXGfS3/Ndu0cplbWReHM4buo=;
        b=laiu0Yyz4Er9gAYcOBKy2jOy0jfbTlAXrrYy1iVUVmpE6u9DXs0NHUR2m2fMZD644K
         73Ttz7NNPN4vf7Qs+EqzhxQZhKKhDrYj9XaNCJW6fx+G3B0MWQoYQKvT3QDBwVVMPE9t
         PAad546JTdhw/Io5dez7Pt9Fx+QKWBbW8ceyifavISIukvY8i7+lTMXfUXQ0dp+y0RLI
         vu5JXF6lK2PdmRDvKnmBSNwy7w5iT7zLSJNFd0NMCCiUADDMnXqR0WPefkZw8pQ0Fueh
         Mm6SdV3QB07iT2cbMtiGYidxfJd1cJipJYjos2sb4igQzayb5ezGT4J8Us/1fYtL4uP8
         7qKg==
X-Gm-Message-State: AOJu0YzOXA/sEG4Ic2O40hHBjNYuIuuc3OPCy2zKJ8eTu/VXsn1xmCMY
	Fg82AWVnY6QSAzHv3+0KK+QF+SDuro2EmajV1gKyJ4m9YhWb7HFKnLfRdVQnRKkGgwXNAtZG4XD
	mCmY=
X-Google-Smtp-Source: AGHT+IETnVB5Y1Emogv5wZLjpPx72/Ad2dmQ7q2aHg/gKzVhmZoAkRLugxsnjcd9UDe0soHHR6C2/A==
X-Received: by 2002:a05:6870:41ce:b0:215:68:65c7 with SMTP id z14-20020a05687041ce00b00215006865c7mr8076634oac.12.1707363864990;
        Wed, 07 Feb 2024 19:44:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXh6Y7e/7oqenCsNksOBgK8Ayl3MEleXrb0SC69KJwCjoy6Ey8iq/708woQvrjq2bOHV8mU3JamlAkdDBU+xjlsQVflHCt7IA+b19eXsc4CfW2BVQpk5GeNGyoFiup+m95HRQ6rOOR5yl0+Ab/ZbDIV1M4QZsij/3hKHxondSo0Mhsmknb7hpprGwZNc3sZmXIsr+x0ANpXIjBOJOFFAjhvAw96YqdnmKCmW92J4i3QB6GP4sUn+YkEfHsJajIfBNAaeCKAfUjMfD7BeeIBmIssLamTzy7+7/2J2oeslUfS8fnncICu29vWlef4R2LWRVvQSgYa5V258GZ5/ddCRCNTHfPAuG+K9E+bfZ5MnTtbETaUWqzOX6q7Mk9ap3/UpbjlARb/jQYpG+NEPWpb1V5LIcEdtEt/1+YVKT0rzh6zeOJaAgHAa8znbc1kC75OmdIjVYiP
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id g10-20020a056830160a00b006ddbfc37c87sm443595otr.49.2024.02.07.19.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 19:44:24 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 -next 0/3] RISC-V: ACPI: Enable CPPC based cpufreq support
Date: Thu,  8 Feb 2024 09:14:11 +0530
Message-Id: <20240208034414.22579-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_194430_018062_D1AD3AD5 
X-CRM114-Status: UNSURE (   7.97  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series enables the support for "Collaborative Processor Performance
Control (CPPC) on ACPI based RISC-V platforms. It depends on the
encoding of CPPC registers as defined in RISC-V FFH spec [2].

CPPC is described in the ACPI spec [1]. RISC-V FFH spec required to
enable this, is available at [2].

[1] - https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#collaborative-processor-performance-control
[2] - https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v1.0.0/riscv-ffh.pdf

The series is based on the LPI support series.
Based-on: 20240118062930.245937-1-sunilvl@ventanamicro.com
(https://lore.kernel.org/lkml/20240118062930.245937-1-sunilvl@ventanamicro.com/)

Sunil V L (3):
  ACPI: RISC-V: Add CPPC driver
  cpufreq: Move CPPC configs to common Kconfig and add RISC-V
  RISC-V: defconfig: Enable CONFIG_ACPI_CPPC_CPUFREQ

 arch/riscv/configs/defconfig |   1 +
 drivers/acpi/riscv/Makefile  |   1 +
 drivers/acpi/riscv/cppc.c    | 157 +++++++++++++++++++++++++++++++++++
 drivers/cpufreq/Kconfig      |  29 +++++++
 drivers/cpufreq/Kconfig.arm  |  26 ------
 5 files changed, 188 insertions(+), 26 deletions(-)
 create mode 100644 drivers/acpi/riscv/cppc.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
