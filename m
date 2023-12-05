Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1CCC10F05
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iOB6gn3aZlIXZWIRuMFuJX6Tm8r2u0JxbvEuOnVuLpU=; b=vDAr6KURwy5tXc
	VxWQCkyzGvp3YSvkCjksKMzvG+UAq9wc8UirNmvEkYpuStS73bsuKqSKUg4+FEALBk5mQdk+OV39J
	9pPQ4SKPo29UNdnK2pKMImWvrr8e/YWmwRunLH8eKry4jtcrQBDPofxajD6unTKADOUlH1pQhu1zG
	XjxloW7N07TwXV5EHXfNg73KgK1bJLvNAP8Ct/SIAnGpRPy0LcWi2zFfqrXAsGs3KY9jQIs3y22QO
	X1RoJsXrjdjo92nbbpcSCo3jHiD6rdSdXxPLkPMlgtB7EaI1hJW0vYlwaTOO6DLg2ypS46lJXd4sY
	fzoGCWmOqDhIrokkB+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZU8-0083pV-0M;
	Tue, 05 Dec 2023 17:45:28 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZU5-0083op-2I
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 17:45:27 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5c664652339so1740545a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 09:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701798323; x=1702403123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nk8NgzrKm+wkNVpQxcRmHDVuKy2huQw3GIldbaDgVGo=;
        b=Gd5g8VVSiQZyIyrNkQCEqVLj04fig9qYUmUu1vnCOENhTSL7zEYJlMD0qIza7ozbmm
         f/hvCs/QsrSztXXWHG28cLN6hcWEUtZ309v92N8U+etr/8oYhO5yvqE7r+ZCqvGNyA9i
         3km9ATtZcUeI9MhrZQkY+z0rSyeBOuy2BglMtRRX8i5WNRaARJGulQ+g8lh/nh9372Aw
         PR6LDI5yITNhp9N5UWv8Yyd5mWxGTQiaMDEb7NauhdPyxf/hkALK5OR8ySA21WJfPixD
         7WAXRPSQPUrQhJXqbNKrajh38DEitOIHI0nHtrvQSQ8O0LD72DtezpNfX76C2yUVNGB/
         aL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701798323; x=1702403123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nk8NgzrKm+wkNVpQxcRmHDVuKy2huQw3GIldbaDgVGo=;
        b=MFkT42SxrG7UuGztm0JshCI1hLYC25/wIbXEmjNVDwD1n7PQJkraqDepd57l2jqyCR
         RuNq2C50TogHwKu4I2u477GU17V3qW0cIESLCKTom4KVNUHdNs0UqhSYXcEqPGz6mUFY
         mulmzcnu0z86onFJUe+N/GAX9RjJsCheISD5IQr2qngXGjYd/KxkcK4Kpb3eqqTD7aC8
         8d/O6jDHEcVeJufAqv0ucUOmSUJYX0SxiXJt5yIrc2DTZcYz4jQkcSgab1akUiS2FZ0f
         g4U766gc4AJkO7p8RGxlyJVLZEIJ1Mmc5e4S1ljCss81aJbLYMIoMOb++l6zZwX/7/u4
         HIAA==
X-Gm-Message-State: AOJu0YzB7ggsfDybfd2UxSob2yBvWrd23SI/2ct4FMtMYHbdvldsIv7W
	qZ86Ncwb0CpNtSj0hmRmGWZA4g==
X-Google-Smtp-Source: AGHT+IG0GExbyqlK/kAKXYSccGAsVEs/1H+k21xYDZ8oLJ3/T4boaiQc1BmYZnymkCLTHSKphQx7Fw==
X-Received: by 2002:a17:902:a984:b0:1d0:6ffd:cec6 with SMTP id bh4-20020a170902a98400b001d06ffdcec6mr3406901plb.127.1701798322713;
        Tue, 05 Dec 2023 09:45:22 -0800 (PST)
Received: from grind.. ([152.234.124.8])
        by smtp.gmail.com with ESMTPSA id j20-20020a170902759400b001c74df14e6fsm10465705pll.284.2023.12.05.09.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 09:45:22 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 0/3] RISC-V, KVM: add 'vlenb' and vector CSRs to get-reg-list
Date: Tue,  5 Dec 2023 14:45:06 -0300
Message-ID: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_094525_778785_2BDCA460 
X-CRM114-Status: UNSURE (   5.00  )
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

Hi,

In this version we're exporting all vector regs, not just vector CSRs,
in get-reg-list. All changes were done in patch 3.

No other changes made.

Changes from v2:
- patch 3:
  - check num_vector_regs() != 0 before copying vector regs
  - export all 32 vector regs in num_vector_regs() and copy_vector_reg_indices()
  - initialize 'size' out of the loop in copy_vector_reg_indices()
- v2 link: https://lore.kernel.org/kvm/20231205135041.2208004-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (3):
  RISC-V: KVM: set 'vlenb' in kvm_riscv_vcpu_alloc_vector_context()
  RISC-V: KVM: add 'vlenb' Vector CSR
  RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST

 arch/riscv/kvm/vcpu_onereg.c | 55 ++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_vector.c | 16 +++++++++++
 2 files changed, 71 insertions(+)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
