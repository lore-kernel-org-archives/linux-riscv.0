Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8FBE7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 00:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ByhxAMnY0Ge+fd79/HcsF96n6+MLP9ODbJvzZ5izNI=; b=DBZqPvtcU5eoue
	5A6H6XFKKYak/9JE8TqjMzvfveiPvlZNAKeF1lPJuIW/UAUMIUVueHlHaodbGtN1r9wSi1Xvs57Dp
	ekwj7ry71Gux18CGUeMDFDrluGSECUs+0w9FnDavcorvKtb2J673RBGJxr9uV65tWebfPoGMuO3ej
	Il3/Q/wIryKowAIO8AzC0pPbLbg9hnU0hy2FLUY0cAaHQl+g0iKxqC459h5Hi4b9Zz6LYsspaEpOb
	IMuAp+FLmzG8kB59U5hRn0j/tzAfWSDg0rXOc3QiqJb6IEvtiAcKzs9RYAND+cdbwzn33JBpaY4IW
	C6isqvK4daNssliWIITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtFc-00000002FmX-12hi;
	Fri, 13 Dec 2024 00:09:48 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtFZ-00000002FlX-1bbU
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 00:09:46 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-728d1a2f180so952305b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 16:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734048585; x=1734653385; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCAy7SVqNUeDgI7VOXMtmc8sKn2/Fu8F40D/mh4hVio=;
        b=2AMDweD167K9Bh1tzqsTGCdf5QnaQ2oMrQeleXsHSy+IqcLlmoJa+ps68wqJiMJWPB
         Te2yi57bqv4j/gnG5bFjX8DnpAJWb3P06ihbnqOBLbgXbqcMVN4/wXnQBcuTZsIiz4ON
         267iMsqTwWe7rq2V5AVPiN6VfzBQxgQ4Hf6XuhlpxDm5qoatiem+E1RMSWmXN7wXzAAM
         wjvg2G8TM8/iEgjs4mxlxhdfTchL1bnd3y9nZ+QTeG0tXn7Oo8N/8xjXzt55NREeAY1F
         LEb7r+UCgOL/a43m2Bt3lrkX2UW1RUESrPnG5XIlYDLy42YZVNRNg4ju6gBkrgW23QWS
         24BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734048585; x=1734653385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCAy7SVqNUeDgI7VOXMtmc8sKn2/Fu8F40D/mh4hVio=;
        b=Qd59gxpv9Y3hG1V6X5eQwQFyepjOH+n440+XMeu9Xjc+nr3ZX94FVbQUUSyAavKcZH
         t+yF7bC61y76wSHzvBFYU9LVKyt6i+TdT+mCLn473+MDix1J8Vr8u8Ft0sN1wGbbZ8J5
         EwqeBcf/AdvuWIuIcK4hSBulc42BiFAXS1gGVzfMtxY9u0bO6tDZnFlzrSroGQwZ3/xe
         9N1PeeDc83fhmeR+LEksKQICTZAAydn8fzvLl7QCiINNimRAjVhBv3qAHawgv+DmlW9f
         wziQ3FmLDho3wwwML8ZFHJkice8eP/nvMawn0BjdA9+FRneDUEeavarnwjNwyZKWZX+u
         Jglg==
X-Forwarded-Encrypted: i=1; AJvYcCWvCAnCw+wIRZW/qttUfva5ZvnG5GRqvG5G1tjyw/QPd/pygGAtrgGmvZ7c+n3UqTD3TyiRE5IAeMeEVg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0bHTBoVmURuYiMBrSRCILFeXmfpKvuZAQiWe5Mjvpm/LQ7vHx
	zUR6x55nBpEYwPjYKTOsAxXr9UUkFb2X50OH/hVEYaYP2emYxUa5Ikiv1bMbsWI=
X-Gm-Gg: ASbGncsRFL5Ff8J62RAU6v9RFO25J4k+Kn6OUQziZ/yp313KcnbMmsKBcNQV+wsLqg7
	p28p+iBCCXOeqSuyCPvQxVACRrvzbdDys5VFmjhxepdUmwc+VzYCtAP9nVQ9DYR4V5gmGq0VpqN
	LFLNooPs5yyFKb3/FAr6IfKHjjs/Qw9bcGebro0h25zr06BGSmgR8OOz2XmzezHhc41seoRo8T6
	J75sjY/rHTu/Hka7/PFlNcJLmbSK1YkK5MYZpUZAGQycy9HbNwwiqiPkAdeWxF0vCji3Q==
X-Google-Smtp-Source: AGHT+IFUwHgks9QcEF9SAY9GOpi7wPRiwVMzhV/sEpt+kOA7+YUYYNzQWBpZatxjHq/0pnhF+jfgrw==
X-Received: by 2002:a05:6a00:8c15:b0:725:ce39:4516 with SMTP id d2e1a72fcca58-7290736054bmr2582686b3a.7.1734048584760;
        Thu, 12 Dec 2024 16:09:44 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f0a0779dsm7441455b3a.154.2024.12.12.16.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:09:44 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 12 Dec 2024 16:09:33 -0800
Subject: [PATCH v2 2/3] drivers/perf: riscv: Return error for default case
MIME-Version: 1.0
Message-Id: <20241212-pmu_event_fixes_v2-v2-2-813e8a4f5962@rivosinc.com>
References: <20241212-pmu_event_fixes_v2-v2-0-813e8a4f5962@rivosinc.com>
In-Reply-To: <20241212-pmu_event_fixes_v2-v2-0-813e8a4f5962@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_160945_424376_26BA7BCB 
X-CRM114-Status: GOOD (  10.95  )
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

If the upper two bits has an invalid valid (0x1), the event mapping
is not reliable as it returns an uninitialized variable.

Return appropriate value for the default case.

Fixes: f0c9363db2dd ("perf/riscv-sbi: Add platform specific firmware event handling")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 3473ba02abf3..da3651d32906 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -507,7 +507,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
 	u64 config = event->attr.config;
-	int ret;
+	int ret = -ENOENT;
 
 	/*
 	 * Ensure we are finished checking standard hardware events for
@@ -551,10 +551,11 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
 			*econfig = config & RISCV_PMU_PLAT_FW_EVENT_MASK;
 			break;
+		default:
+			break;
 		}
 		break;
 	default:
-		ret = -ENOENT;
 		break;
 	}
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
