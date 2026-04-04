Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55775E88D87
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 05:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bTYlhGQ/fM0ohd15rYIA5elp1v7iDFkaPv8SIloP4qg=; b=s/NCOfRQoF0Bel9L05AfRYg0U5
	PJaiF+nBE80BRNcYpr1i4/Wk8c6LbVX25WE7SmGHKVuID6ImIaNwDODCu5DblGdqug8bXtcrQFaRo
	ljdesy9w0pmGxzE41lGatS2QlLyPNBeVbM0ZrC0YPjQaTriL10TD3liNTDcvAhds13+Rjh9q3BIkD
	6HZZla7wRXif0bpOqx17E9yqeD7TuEUOjysDjc+8kaiSXdKO0tZnQcTTruX/O4ekmnTm91dwTKyOc
	izimX2qsezAqC/z8x++EWwqYIHI3Lcmpu9YGOrKf2jdrWz0/E5zb+d/6uL4xqNGadwJOnhnyaA9I1
	tfQ4AqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tkd-00000003ADD-0RJt;
	Sat, 04 Apr 2026 05:40:55 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tkZ-00000003AB3-3HzB
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 05:40:52 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so3049530eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 22:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775281250; x=1775886050; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4gq5oV2Uwm1Ltd6b9FECKA8ZBvmmiMQwyALIUU23nRA=;
        b=HuzYXbkcoWifFtSNyw112IWl2hH04m1oUnGobDtJnqkyh/uvERF+/au5ajGPiJVWq2
         6Od1wTCc0lUObn1L+7qKRA6bLQMYkxKjALcjS5qQFSLe23O35pjiC45Y7R/w3YkK1tK1
         HWyAwxJfPNdE1fpXFe56sKNeg72GyD7xaDGsvjE6fIqh/9Ug586NefUZsUVt4/Hk5sfl
         nP/wFpA2wpw8JyPXFWNqy2qWk0rB6R9dSYRGnwe7Pn4Dnk0vwAeUPf+7c/NGSQ1qYgn/
         LyiNxYJFNbjP0zmaLycvV6+VZq7HcSDy7DZ4jwugNIaWPQdo50U/C4OvZ/5cZudp2RCC
         3tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775281250; x=1775886050;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gq5oV2Uwm1Ltd6b9FECKA8ZBvmmiMQwyALIUU23nRA=;
        b=RjBrrYAk1/TnQj1JBEOBGcX3S/4y7b7OyY09MR8Av0SO3OgMvnt075mCPG1tNhkC0d
         7zc1ZUx0KjAofSOsQHn2BnxkFfxoT4n79FG0+DzeWT7nIjCPlbWRsaWIYSj1G8qPpxIY
         AaeGZp26HGA6hQL5i3Qxg8feOuaS3+lKEBmtOb0gmSPsLRMfztiGMMyopvy1vQ6n0XEA
         LBc5+VXXKwPwNrHchcI/vpms9G1xFSb+RLyXsWw427QfQROK4naVN/wSoGEbKiSL6x6d
         nU6QCvTG6Em2pRiIF661bZeOSyGpMxm9w4SuvBfhZZJA2thnDhR6na1R6iekRX4OQ3Wx
         qadQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaL8ezwhydV0CzYjwCfBwHVO0GZDsh084LG7sVVxBJdcHB0HTfedyhCRjkfxqsHbL3gA1B4i3hGjtH3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxY3g7sLBYu13gVRmsgEBAWiZU2cUmFfymhLOFwysMsBh4W2KXk
	rVcFLJ8E/sd8xaPDpDO2VavyU5I7ISgL9M+NZQZavO75aV4hdxpETQAp9xd0qP0zSUHvlBeeFtn
	vRnx4CGbfnw==
X-Received: from dlbuy23.prod.google.com ([2002:a05:7022:1e17:b0:12c:5db:d6d1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:fe08:b0:128:d577:dc21
 with SMTP id a92af1059eb24-12bfb700f3dmr2718425c88.13.1775281250318; Fri, 03
 Apr 2026 22:40:50 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:40:26 -0700
In-Reply-To: <20260404054032.1538095-1-irogers@google.com>
Mime-Version: 1.0
References: <20260305221927.3237145-1-irogers@google.com> <20260404054032.1538095-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260404054032.1538095-3-irogers@google.com>
Subject: [PATCH v3 2/8] perf build loongarch: Remove reference to missing file
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org
Cc: irogers@google.com, 9erthalion6@gmail.com, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_224051_820543_09AEDB04 
X-CRM114-Status: UNSURE (   8.68  )
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

The file was removed in commit e62fae9d9e85 ("perf unwind-libdw: Fix a
cross-arch unwinding bug") but the Build file not updated.

Fixes: e62fae9d9e85 ("perf unwind-libdw: Fix a cross-arch unwinding bug")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/loongarch/util/Build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/loongarch/util/Build
index 3ad73d0289f3..8d91e78d31c9 100644
--- a/tools/perf/arch/loongarch/util/Build
+++ b/tools/perf/arch/loongarch/util/Build
@@ -1,4 +1,3 @@
 perf-util-y += header.o
 
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
-- 
2.53.0.1213.gd9a14994de-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
