Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BB3CA0EF2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u7FD494UiGBZ4BI80vYsPZo1YtpgyOvDlitwJoyG/9Y=; b=oA5CY5JS18dpSV
	oWQEmU1d21BimwpGBelBNQrOlD00M3MjvWTSqw2RUNgUVoTG3DV2/JrHN4L7DvPdvROnRaVdomTMZ
	I9wGHrWmHAGZLZaOmktczaiHZ5yp4sZ4/MhuK7pRQPvhgXDhH3F9RofZRmpCfxykETLmtCquQEi7v
	XNWJfC6O0iDePDiGXYbe5t4G1YJhbhOiaOpODttL9j+DOZ4Ja/wf7cmqAGtA+tncu+hA0uFlk/AY5
	Hf4QvQaHOew52BSk/OPF8fpJnxB9GZIIKOXAxj0VqRqsyoz1U4oeaZS1sH0KbxgyPhq6wmUGY7Fz7
	fdGXYsgIEO9bVP9+liBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3hC-000000088WB-13P1;
	Mon, 18 Aug 2025 17:30:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0yh-00000007lz7-3g0Z
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Aug 2025 14:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=GPRfWRSPn2MXzdkFqXMoQyh3+o3vsKMsh/EYBelfV4w=; b=mVPyqIr0MHT/lqUVFX5MtZ7Tvz
	za12RkSsbKCxqAaW42J7hFrN3H10a3esFZ/S5xE8zbNNSdGXC0K9VHwqs36MLiZDFJxBeOSwepkWd
	prHFm2MHQ8PRkpObIPZJLpKaT1ogPyGk/g4jhDzyhEKYEZR8prBGhZqu8BNOdU5gGr8c0hYCk1f+J
	H51ONpuY+DHGDWOrJ02E2lXHOc3+ZJrK0p7vFAUTjMl1I0AsGxgE3A9siZOU5zBz1Ka27n047KzXQ
	yebcfof3DWiCtCY39LdrIBJIaWDd5jMTQ04OdNrSMCQmFJHy9vYaM4fIsaqz+6Tx+Wspjr2HIg4eP
	7rtyCAag==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0ye-0000000HQ2q-1drC
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 14:36:50 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b471754bf05so3726664a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 07:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755527806; x=1756132606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPRfWRSPn2MXzdkFqXMoQyh3+o3vsKMsh/EYBelfV4w=;
        b=XodMAVTHTSkuRAzu+mKcYWpnT3ibTMN/Iy7XbXI2w1ekNLppQcRGUXytqklXtis//q
         JIq+YtjPwxb7fxGsBJe5zbrvQbCBlFsQBOgDdK7KHKsmscqvSf/j6fVpHDOhEbsmpV6P
         wyN1nh842fE/6n0xFOVUNHCNo4Q37DsERbLBSBhqmiAA3Ujm5GyFNvTSVcHKq7kXdMjR
         +V92EpSsnpq6N0OTEycJVxrovOU/7aquFa5i2zNUpx6YVTgoFzsVNGW3RHkTsUU3i5nS
         aSixrjDld+v3dJHpWF+OKe1k49CjPsytFbD34Yi4VIg9Z2iQbAZSqrOrZzDSwt27wTJF
         fhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527806; x=1756132606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPRfWRSPn2MXzdkFqXMoQyh3+o3vsKMsh/EYBelfV4w=;
        b=r3gxTqNlVKEtYNLimfqvklBfsI+JtlnExCC0f1zL+gx40QQ9qNA3hvQgZsiKZgfxWU
         mWB7dqEMjsy4JrvUpOEoQZWY0feBd9IoBs6p/nayJxMp8/VUBiQoM85bw8Th4iDG2Yyn
         ZvoHiewPAsvFghTDbTOlKu00v6hUdd/TSXfKn37Dp0Cf22cPIMmjoA7KsBoBlFV4zqJG
         eR//4uWkSHF0PBZ4dzAlz0Ofp9fGLqS8OGXt01tZLv8qGzJfOmQNI6+dNDWXjRlGl0Pp
         i1Jahpt7FwQJiXRTOOiHf/Il9ozrwIh93Ov9/LTE/MGXCLzzaW5bTak/VG4oUdeQFnpX
         J8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUTr3RhRtMZSRuqepXXCcoioHueFzYrJzCryftvP3sA6Sc8M9Clafa6QPqc/b0ZYrqAeNyBpmt88CVYbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwotEobrAWjYgFZFexS0e7LqToE/m5wbxLofB+IPiX7JvY8zByW
	jU+q7nw0FtRXx8bn7zmDqXoSu+ayRnFWjgLctMgnnT5Yh+lEV18RnGK3qcY4c0MfdqeoxwxtBj6
	keBbz
X-Gm-Gg: ASbGncsyrzrlwWeHEFAbEfvpocu0XdeZbTdBBW1PPuMc57R/PEtXc7GuywetA6aQuVY
	SuLuYo0k13SU3hEjkCa1Qpcr7okyZY8+PQISjsCqtgl3gAbaEvfhUYFHRUYnKZQStPv99NqqN/1
	j8GGMY8/zQmMhuM0F/4ZghFLcyeFTEWvCzQxjQPvEJ/PbJHG6irr+AFUuYhEdcYU3N2Tus5Ofkk
	qX02kfk0F7CwS3a1JdmKjJlzzhOVGalx3Jjmkr/vHXGS9PEcAFtp9b8YuDpvKO+a73LrM5hAZuv
	igtqmAx1uGJKnAN4HmQOZNOblE2NK6S0ZpOLgwGgW6JjrsP7mwG++b/fUSVX5cwcT6b9uxZvMTR
	h9PbHF0NronxLwLBiRnl/zfwDj/SgPamxTmDuLiZ+KEVMY1ZsBdwroc0=
X-Google-Smtp-Source: AGHT+IFhQIGFe+ChK7vTdpEKuwo8wR5gEcJq/HqOaD2XkCBquPT7zD28uoL27+VgjZiGEpkXOMVA2A==
X-Received: by 2002:a17:903:186:b0:240:3ed3:13e7 with SMTP id d9443c01a7336-2446d9699aamr152591495ad.42.1755527806186;
        Mon, 18 Aug 2025 07:36:46 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f664sm81704945ad.75.2025.08.18.07.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:36:45 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Common csr_read_num() and csr_write_num() for RISC-V
Date: Mon, 18 Aug 2025 20:05:58 +0530
Message-ID: <20250818143600.894385-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_153648_602084_0FAB08F8 
X-CRM114-Status: UNSURE (   9.53  )
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

These patches can be found in the riscv_csr_read_num_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Make "out_err" mandatory for csr_read_num() and csr_write_num()
   in PATCH2 as suggested by Sunil and Drew. This also helps further
   simplify csr_read_num() and csr_write_num().

Anup Patel (2):
  ACPI: RISC-V: Fix FFH_CPPC_CSR error handling
  RISC-V: Add common csr_read_num() and csr_write_num() functions

 arch/riscv/include/asm/csr.h |   3 +
 arch/riscv/kernel/Makefile   |   1 +
 arch/riscv/kernel/csr.c      | 165 +++++++++++++++++++++++++++++++++++
 drivers/acpi/riscv/cppc.c    |  21 ++---
 drivers/perf/riscv_pmu.c     |  54 ++----------
 5 files changed, 186 insertions(+), 58 deletions(-)
 create mode 100644 arch/riscv/kernel/csr.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
