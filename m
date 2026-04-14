Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60D8F531ED
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 03:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WgNafFfAj9GwL5HiJcrVd+pQO6vTlhM4BmU9jrSAsU=; b=16v0LG7ysuuELc
	Hc8IDiSlEOkPrYq6RJKF2Q7b3EDantjYzfP8cJOVlahArAe6vR1C1m/PsM+0jDUuk1TSAhYM9TjyI
	O+outJ8/qB5UEJA05j06yV7bGaKTEWFoSxdWulVOl7WOvXqZYmzxFD+K6/gV5MANxUr2BUk/udYo+
	aIWOkehNFDpzNHyiJmeq/WVXzeAuWNatAYKIlMoX1ZSPEUfwJbvJvxfiqD0DZTHnfj1Rp41MrnMHa
	YNvq8uemiRdXyL9w/7lHE5vKo7HWdb4dpJWCIUy68uV92SYOUosv3xoCDynSGvufUGGVdThsGuCNb
	ldnzed8IG42sUGpesPPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgF-0000000GelB-0RUw;
	Tue, 14 Apr 2026 03:43:15 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgB-0000000Geiu-2uOP
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 03:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776138151;
	bh=8WlX9LAMAHxENQE0GOfbl38nX4Nv/bfYwJG7tb5ZltI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=p8HQyBI4PmvvkvfEjubsY5C4ZhWzg0TBbYt03YcPKrP4ZMlzm9Kh1VLY85sXHspcT
	 GdQejEYZTqyfd4CHFTjZEcuBxpHv9ZM8+1TxSUbkV6zMUvo6LiCcZ/CWqVabX0I+JL
	 mJ3a8OZzUpm6CWOpYjxCoWA1ZCU7uq2UmKkdMo2Y=
X-QQ-mid: zesmtpsz5t1776138142t10c812b8
X-QQ-Originating-IP: t9+OZIjuuPh1IAnGOvXUomf06KYoebma1TmgOFpT1H8=
Received: from snode5.. ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 11:42:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18336862824767481091
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gregkh@linuxfoundation.org,
	alexander.shishkin@linux.intel.com,
	irogers@google.com
Cc: coresight@lists.linaro.org,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	anup.patel@oss.qualcomm.com,
	mayuresh.chitale@oss.qualcomm.com,
	zhuangqiubin@linux.spacemit.com
Subject: [RFC PATCH 07/12] coresight: Add RISC-V PMU name support
Date: Tue, 14 Apr 2026 11:41:48 +0800
Message-Id: <20260414034153.3272485-8-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MowBDtlQhFJIaDbojSdJnH0aog6tYXNbi+VYxt36bquHFUU9SmqxWxEW
	CxiH5xeaHpGjbIfCGAS4R9zPfNlgxkMoMf4k5zwzfcsduB5vnpEU688zEigYVgXOc10l0hH
	fyHOFVzCPHL0CdzZ9u6citGPN2TuOs9+kagHf38EBhxGeRRDc/a7NWuw0JrsK0pqRqqTc1k
	RW95aCxpdDpTtg8+NKJyB+v4IqHiSXCO1Bw1tjgyFj4JDND7r+oUgxuSuCdrVgCk3X7NjPo
	AhIQA2g2MGHSEHQYwhu3h6nQJ7K6ja6lIY/DWOz4nKFycHFMze2U5Mhhw04xqH8bmRuStGK
	9o8lNIgKPbxEhA7CM/Q/M25/jtiIk5oStdKLNTE6w9r2Fj120AFo4Arl4Kv30oohc8KH0Tg
	v8Xfnq/P+nOsA4S5NQjBzHOEnvobres4Vm+ieVeN460adVzvCrO0z88rbUGGVbVt8d3iymx
	DFrUvFqj6NBmvjrb2U311yt0wlZTjA07Np+k7cDD/WDhbKGefqf/xS3UQKAxcmn8qclNWYS
	HN0ni+wLbj9oBgCU+5BbQkNg4k6cKEzI6klZ6H71IA0MJD3+FwK4WzGHh101EV1gK1oxL0g
	W04UmaKrvKd8UG2lbkANpC7zh5Y2n2vOTa3SzRvjDzzBJ1Ww40aSN5jiG1DvLZq5AT00hF4
	vvrxw1bbK0dZ86PW/+oveXABkFH8L7+wrZNNrUBfUYnwn56Ytoti1R3H1wsArD2qJ7QlkS/
	WHStjD+DuPxFPxKkzTuEtpDZDq4eSJY87+RKga6B+/bcGvyX2eFn6YJCZv4jlaejzsH3u+I
	FjwmWuLk77Qp8Qs949xVhZJ+6waVbqqK88j/dVVsPaFGX7+SlaFmAmF2qjReo+wz3os9HSj
	g9Ua9mtrpuKXo2nuOZ0ZYJGV2MruICrZRGXvdLw3xxLCEZ4VNfKTrqutIkDENLs+tHhpWDU
	GaZPSAydaLZF86emT/YWF0/bUc2raSIsVQOoiBDLbXWa2AR+H61Q79c5PbKtwYfEhmgmbq4
	iWSDU4MAZGEWKdSdJmEG/i+lu67B33BnvvWyGlBfulbl/Grmc8EASIah8sNdfN3I4ZHekX9
	V7mNtPcCj0AhYX2yY4fH3BVoN84uHRoqI8fFr1Wlv06
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_204312_029439_078788F0 
X-CRM114-Status: UNSURE (   7.22  )
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

From: liangzhen <zhen.liang@spacemit.com>

Define CORESIGHT_ETM_PMU_NAME based on architecture:
- Set to "rvtrace" when CONFIG_RVTRACE is enabled
- Default to "cs_etm" for ARM/ARM64 systems

Signed-off-by: liangzhen <zhen.liang@spacemit.com>
---
 include/linux/coresight-pmu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
index 2e179abe472a..119565500ec5 100644
--- a/include/linux/coresight-pmu.h
+++ b/include/linux/coresight-pmu.h
@@ -9,7 +9,11 @@
 
 #include <linux/bits.h>
 
+#if IS_ENABLED(CONFIG_RVTRACE)
+#define CORESIGHT_ETM_PMU_NAME "rvtrace"
+#else
 #define CORESIGHT_ETM_PMU_NAME "cs_etm"
+#endif
 
 /*
  * The legacy Trace ID system based on fixed calculation from the cpu
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
