Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C927C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 02:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o9Pi2PfcXg/kXsE3dXnc3kzEXCzRa1xcbyWu4qlUbtw=; b=XA3eRLT+5a7fbI
	Dxe3KMwjzRXpI4Ze8M7XdiwoD8yDa4xs0eKLwTCVZhkDWFSr4OwqpTbLOM5z7sgZseEbFxLDhQl4P
	5La0ICZ09tUSWD3v7X/9JtzfwZ6e0V60gH0vPHx8vb8P3KgyuJ0Bn5jAwuOhFBEZgx7JB5UTzfflK
	flflOa4M0FHbiW8GxiQnKvzJx6PMnxQd0hwCjDX96pMTvAynSq9eoAiXIWOdhHtT/MXKK9Jq4z28c
	lR6GTkfKXHyIAhYIGK6p4tVd8NXxpEWzaHaDdSv/dOmsWR+1RpDM7UtXAX7MUlUlMeZShsO8jcYgh
	lzaKco3KAsW9ssACj4/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPO-0063vR-1Z;
	Tue, 05 Dec 2023 02:43:38 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPL-0063sk-0X
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 02:43:36 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6d84ddd642fso2807711a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 18:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701744213; x=1702349013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESe2+H6xRcIvQHZC4sCC1Ujc/nu3bNcuHE36+amdpNs=;
        b=PxTXVBQl4dXBKQl63oEHeaZ/QEss3HAMGGsldKwDAPNCqSaPjtGBbF0f81CsMsRv5D
         zHOtrK+PNA6VLs55vNVLLjYAfgW7tOGTQD49mb9gKX1bL9tP368R6/Oa6aFq8lErSWAr
         Jmez8uDpmTAJpdSuXPCIg/yMBBJyw0gwK3X17jsKa9tyr3HGi7p+L7ScWk+AlGxBRGAV
         aCuv/44Zg3WDQ8K+P4TZmL2Egwbrnp/m7fIbYypoNO32bdUfsvowXxV9FKUuGcG3ctHB
         uevjqnXyRkGLfUA7CJZL2QAuaRSK6f9INypcrjVlsUafvPgt+xFIGtnZ4hpEl3ObuyHu
         2p/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701744213; x=1702349013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESe2+H6xRcIvQHZC4sCC1Ujc/nu3bNcuHE36+amdpNs=;
        b=OOV4Y2pR684sna6twt+fRyCjUPRQ8LJq3c4P8i0MT/p3/+s/au+4M6DW+V/58ftvcD
         fAefdJv5shXZIELXh7xb8KnEIDH9DXK7keMZpx7xsicObJf5gjwYMfY5nx3gCujdvBjr
         5s9ub2FUvbJiyMwaWkuVNU8C3PfN8IbzJ+HAtIftw+4MMfM7YNvCXtdRrsZlspSFUfSH
         KI/9KdtSioJwoGx2hgyceFH7N5OB4qGDzHqFZO/TmW6eSRFhUHaAEC5MSX0HSIGY1hNI
         sgNS9v8NjoonaEnK+L1ZxmopNdhbcw0q40xMpYoRRwPM4ljX7mZJ/D/8npvmyeyvWQEj
         Y3iw==
X-Gm-Message-State: AOJu0YzyZMlZULs3yGz1p4xBsYhRACtKFJgPxUVQ+jqwt0wiQq/BqSmw
	oDTaeB84dHgnw4dZUEh8sKVhPQ==
X-Google-Smtp-Source: AGHT+IGEgSVldCBVjabdNWyXSrgKexmOSpdOUxfqb+i3/FDPH6nx8GslbA4iHobHadY6ni/KUBPIug==
X-Received: by 2002:a9d:748b:0:b0:6d9:9ef8:84b7 with SMTP id t11-20020a9d748b000000b006d99ef884b7mr2852315otk.26.1701744213065;
        Mon, 04 Dec 2023 18:43:33 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z17-20020a9d62d1000000b006b9848f8aa7sm2157655otk.45.2023.12.04.18.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:43:32 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC 2/9] drivers/perf: riscv: Add a flag to indicate SBI v2.0 support
Date: Mon,  4 Dec 2023 18:43:03 -0800
Message-Id: <20231205024310.1593100-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205024310.1593100-1-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_184335_321703_D9E06000 
X-CRM114-Status: GOOD (  10.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI v2.0 added few functions to improve SBI PMU extension. In order
to be backward compatible, the driver must use these functions only
if SBI v2.0 is available.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 16acd4dcdb96..40a335350d08 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -35,6 +35,8 @@
 PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:63");
 
+static bool sbi_v2_available;
+
 static struct attribute *riscv_arch_formats_attr[] = {
 	&format_attr_event.attr,
 	&format_attr_firmware.attr,
@@ -1108,6 +1110,9 @@ static int __init pmu_sbi_devinit(void)
 		return 0;
 	}
 
+	if (sbi_spec_version >= sbi_mk_version(2, 0))
+		sbi_v2_available = true;
+
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",
 				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
