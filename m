Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A27DC5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 01:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xkx8d5K/kop7WRw4KWzBQgSyMHLg4f1NDXw42VVKWWE=; b=yqjYPJynIwn4++
	rRoMKBn8QMZQiK7tKYzkGWjRIe5gj4b7USnKXfdOQGKoCjME5oOKOyf8vpjUmy0baZgfv5TgZhC78
	nir/793SH1gQfiEaHwMmumzwFyszl78/uBSb20XDrYMO3717BzO3wXXiDY3dof97AE2kpNVDmS/Nv
	ayvuhcxdmRv/jQyxCAvtyeJDs2TNmCLcvMN4+1U+fkgCl+ewKkngXggq/YFdqipTM7BS/FDdSsSkI
	iSD1fz2AtB8kUJMQi2XVGmxwytzgE/GzdFrudB3tnQQFY+vbaNmJewZQeZK+ZaPo0ijM0YtV4N3ZB
	W+7UGCtuJ/aq498XAcaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUo5-0000000BW6V-3AdA;
	Thu, 29 Feb 2024 01:01:53 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUny-0000000BVzk-12Yr
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 01:01:47 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e4560664b5so259391b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 17:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709168505; x=1709773305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLy+8VlwwjDgbFB2RXfd5pFPLlTjZXh8WK6dInm8wBw=;
        b=XUuLFOFMjdDsSSzbpXGq8NcG4rydqfqhwSpFWrtE5QbxIwdMJn9mqxWLg6tr3EMw3f
         032VTe23DSZMOknxYlIEORHMuOzQovTbOWTFFECrCJ0lsPNcM+hfpf1GAYRnHv/eyDG1
         b7qdKnZD3otWibBDzc4WjunXAnNCPAnLFFY8YfRn7EmMPEU8OHyAIlo/4sqHUMc4wS3o
         OrOhJR6V+pqlfS6EwRCIfbXZsQin2tWDXDLVju4Oi+XTxDG+3i8q6kBxo+a9Jrk7+pub
         3Rc5fQDHWWVQ6TjBUVWFjN5XI8KkA2AUUyp6JtxDmZ9xDR7vO8Vkl9Q1Z0OwrlLYHY0h
         //XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709168505; x=1709773305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLy+8VlwwjDgbFB2RXfd5pFPLlTjZXh8WK6dInm8wBw=;
        b=m5sd65+qQgWLCt+oisSZZSIEjmgkQyVIrYuv1HHx5DNDdKrSZ4ds9ZyLgwN0LJXR46
         /Izs2OlvUcbcI5Ga3KzA+hOtVIiLS0ZM0DUiRlcMtAxc6RshR09VksoKJTTqo6G9ttLo
         3kXlpMJXaajNuRb3xn07NhJxg1xYA9NuZiFqThEm4SQMzXD1qgot+pe04ArQvG0tSzYS
         7zEfGNONFqz4k+MSKo2ucG8FjmIDNRjSmZ0RtGH+wiX5LahdTVIdr9FbvqGLt0HwP9oC
         Gw2sUE7FiPx/xk1VqWaWnnDp2z5KZXnWcaoHGxfQCRI/POM3KDn7ItYw7TWKxjkg6oWt
         oDCw==
X-Forwarded-Encrypted: i=1; AJvYcCWgamIHEWiIk56/OxTUewztGE0UOWbZzpw/FB7GJEHUv/uzFTkCPEDglyDAfmnRO5LqQ1YlMHY24o4wxEAxM9KIKgSgKREa2mYj+XQaJ13N
X-Gm-Message-State: AOJu0YzdBdH37u5aFNZnBtkSLnkJDPPRcSD3d4fsjzi0RHAZf4VQAm2/
	g+sIBRi1QkQpzRpIYUu3yI8lh2UtRF894ir/cTxt7M2r2DV8rG4guGF+TisvMoQ=
X-Google-Smtp-Source: AGHT+IGxkE16GaWCr7h3vOiqKSFFkVBq/RgbzEX11wPQh5/H9Sj4tZ1+Pt3HAldP7q69kBSazwBKRw==
X-Received: by 2002:a05:6a20:9e4b:b0:1a0:e819:877b with SMTP id mt11-20020a056a209e4b00b001a0e819877bmr1342746pzb.9.1709168505252;
        Wed, 28 Feb 2024 17:01:45 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001dc8d6a9d40sm78043plx.144.2024.02.28.17.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 17:01:44 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/15] RISC-V: Add FIRMWARE_READ_HI definition
Date: Wed, 28 Feb 2024 17:01:17 -0800
Message-Id: <20240229010130.1380926-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229010130.1380926-1-atishp@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_170146_393948_EAC84BF9 
X-CRM114-Status: UNSURE (   8.61  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
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
index 6e68f8dff76b..ef8311dafb91 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -131,6 +131,7 @@ enum sbi_ext_pmu_fid {
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
