Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88912C46CD4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 10:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2B3Tu/dsqlDhOSosPj2oFx1W4IuqBa1LvH4QJGNhRwY=; b=cCHq0pBFDTesPh
	jCZB29qYp0gEBDM6Ny+HLCL5tjSIr78BPMh6ddxoXneXMF785BwhdUffNYkW1ZkrJIVgNOwZQJ5bb
	etxcaUxq3o+wzI7eJz0VL/HtNHOPIxzf0TlNP1CR8AQmo+Eff7XdzJW2CG5S9XGPa56218X4s3Ujp
	YZVV145x+9Q7umYwFDCkRv57iMxssPKO8cWdFdlOk9j330FmnROAEFV4KYBnlRqBQB5fo2RWRNNdz
	lwVRoGztoE6Auij/BXxVN2DpiqMWDcpxZPRpR8GeTlbxu5v/El7W67hd1LcKiZyVKfDd9vnhmeOtS
	wprJ4kFfzKZ3LrDPhTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB3u-009rJG-1o;
	Mon, 18 Dec 2023 10:41:26 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB3p-009rFt-1B
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 10:41:22 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5906988ab8dso1124565eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 02:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702896080; x=1703500880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=892a7MXGmC/bLYrq2xxQmZbI6vgYpLZafzDkJ/FX6g8=;
        b=i9dglBB0z4+u+VTrreDxmwo71G07sH7WeQI5b2xfNqc+jmehCkAZvZWMfhDmqAqzHm
         8wNttQeHyRR1bv5oB6GnoXKeP5Lhkp4uWoO1me0tn4rhk9Ipn/9eLNbC46dfaiGmQ3JH
         kBwUvkqG0blW/yGQ6zHei3/eBgrZU4tiIwP3X/NtM+8S0LuSWRKdaTWOhopL5DgRdTYc
         oiIfC9eqervEILqShg3z+hrP+ZheH3b2VbdT1/dPQxZuiyGT6BYhiyCZGgpgrtgCw72K
         hGiqm+C/HPHsYR1yAIGeoKGjbsQju6TJUv3x8D4v9Hk6xCVGlcxv/ziJUkvBZ7vzpd2s
         8O9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702896080; x=1703500880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=892a7MXGmC/bLYrq2xxQmZbI6vgYpLZafzDkJ/FX6g8=;
        b=QkzKLkZlp2cPah8D4kSe0Ml8lXlYE5JjJ1EQsxjGnkW2nDoQ8sjlX8N+AD7QQ6aLOb
         6Kl1jv5l8N+Bl0neFwGNuxG9huw/Y5ia5dgprBv9H4qROd0uE0ZO4KwaS7ni7nZWi0Gc
         HtMUNDuSkWepZdhcaFhJ8pUuZYJGnCwVYn5HWJD0V3V+8FaXh54cAe36iLNneDJl3X2f
         xku8l5JSiRIgch2S6mZ6u94PKOuScmFmElrDhkwYQxz85wHxt9ktP8Y6wuPZGNL+jq0t
         7aiUIjlwV8YuzGm+cJDD0VzHuNe7X/UiyPqyEnwaZlnOStyuCpsCrA3ciTgT/clTreKB
         v/bg==
X-Gm-Message-State: AOJu0YzXSCB9tGD/UwTGLT63dahVJ2pT4gmlhMCtMrG95Aegj9ISdveE
	O/wLm3NTQyIljdbP8FDLX9f99Q==
X-Google-Smtp-Source: AGHT+IFgByVnLmmTZ/wPh8GAxGl3YQsD3+CdxKG6a7sBAikC48zmomkZqc6rzvayrv+U3EDDZxFKJQ==
X-Received: by 2002:a05:6820:162c:b0:590:5c02:a4d2 with SMTP id bb44-20020a056820162c00b005905c02a4d2mr8417153oob.13.1702896080113;
        Mon, 18 Dec 2023 02:41:20 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 185-20020a4a1ac2000000b005907ad9f302sm574970oof.37.2023.12.18.02.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 02:41:19 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v1 02/10] RISC-V: Add FIRMWARE_READ_HI definition
Date: Mon, 18 Dec 2023 02:40:59 -0800
Message-Id: <20231218104107.2976925-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218104107.2976925-1-atishp@rivosinc.com>
References: <20231218104107.2976925-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_024121_401835_70FAAFD1 
X-CRM114-Status: UNSURE (   8.27  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI v2.0 added another function to SBI PMU extension to read
the upper bits of a counter with width larger than XLEN.

Add the definition for that function.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0892f4421bc4..f3eeca79a02d 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -121,6 +121,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_START,
 	SBI_EXT_PMU_COUNTER_STOP,
 	SBI_EXT_PMU_COUNTER_FW_READ,
+	SBI_EXT_PMU_COUNTER_FW_READ_HI,
 };
 
 union sbi_pmu_ctr_info {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
