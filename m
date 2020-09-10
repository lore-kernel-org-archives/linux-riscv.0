Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A19CC2BB84
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8749A20731
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w/aeGuQc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DxY9c8U9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8749A20731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KvC74YfkIAa+wLYmaaDxPpN9t/y7AweMv6kbSjJ+ErQ=; b=w/aeGuQcPyUM3sj7fmxY3BW8t
	Wd2wIPZQDKfmiB1HH43HcrEh22vWPToafqB7JuQz940140ziZdD1KhD6PRhAjKk8dpYwE6zYilKje
	02gED1WdRrOFjIK3M1WrOI3hL0+ilvPcgFSsjRjBA5jiFlU8LRtue48111MJl3l9+bAdCBb3Q3vmk
	xmI4I9rd71N0jEQ3qAWHDs7aUsC/wySapOcDg0ROWvBArYeDi0uYenmq9di8yBZyQGed/6/CCKEYP
	g7f+qnyjYWRZkLg9/yAqTXHF6oQSOLfIM1ZJ3osXFRRiatMo+waHpYlZ/anvZ3FUu+PmMg69pyaXR
	J9aXCDIEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhH-0008CY-Ig; Thu, 10 Sep 2020 08:12:47 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhF-0008Ai-8y
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:12:46 +0000
Received: by mail-pf1-x444.google.com with SMTP id w7so4195926pfi.4
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tH3VhkqM1acAjytNJ62tEalL9JPHCW4E9Rj2E8HYRpU=;
 b=DxY9c8U9Y9+lT00hgUY1Dsf/2yUU0Gi/XRr5Frt32Dvn/gZKLgbfq0kXissj8X1brN
 zGi0+/brafrYW6kvNcl0M6gsJTBDzg4aLpdcr9NhPEvxGTXAEyaJilT9aC56iLqkAxlW
 Gbeaiu7RxZKWqxGuMnq8LubvdzQz4qtiHH6owgpbr1c5b6pgzaZtl7W2l0hh8CbY4xXg
 u4QnKFS/tnAflzcYUfnBT8wteBrcz4y18klUYEZsp3HtzHV0YDaQNjHDPMbcyBrlLlDQ
 vFElbORqveFSUjvbIITPmqMO0Q83HHU9EnOYmb7bhlQKFEM3nTA6ryetRga19tUyMhJt
 c3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tH3VhkqM1acAjytNJ62tEalL9JPHCW4E9Rj2E8HYRpU=;
 b=gB6vjPZfBDscGLSiPVBqVOYcom8Ppz/1B62UJtlySRg3S+pZHN0vShpTI3dpNJxqCV
 34AZGJtgRE75WhRsvB4tLtW41BbRXKawhj3LMb4Mzncm4ko8wz8+hmhfOgviqmzIik6T
 Bu/DMtRhIZ6vnfO05f3UKsrax69GS5Kkq3TgwFvOl2GQaZG3Pxdq/B98mzenNPNapOux
 +xLSnmZTVExmgryCOzbvcPADSnzgP41dWUdeHd7YGhOT//QL16dA/P6bhMvyfdldb+ec
 GpS3RziQNwPCaKCk8tyvI2IsSj1yLtsRRYPg4kLDRaV+SZN6jUd61iDYJJywSvE0zaFp
 97iA==
X-Gm-Message-State: AOAM530GG2aIkkhbfEKvjZkFCHbUkl+6OaOh1DbiQUOSZ8P7PGsTXF5F
 XMjktJUAxIlWAbBzxcTvRJ/+WQ==
X-Google-Smtp-Source: ABdhPJz6n4IqjVW7yXiLfH7sWwLDESD0k7agKvdLsXi71/Eg+VoM+FG5UXouQdF/P8pn2bMKy8zmoQ==
X-Received: by 2002:aa7:9ac9:0:b029:13e:d13d:a133 with SMTP id
 x9-20020aa79ac90000b029013ed13da133mr4368433pfp.27.1599725563195; 
 Thu, 10 Sep 2020 01:12:43 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:12:42 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 03/21] riscv: Extending cpufeature.c to detect
 V-extension
Date: Thu, 10 Sep 2020 16:11:58 +0800
Message-Id: <119d2ae4fd376a2095129144b0ac32970ecf7e86.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041245_357422_CE5E7613 
X-CRM114-Status: GOOD (  11.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup@brainfault.org>, Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <ren_guo@c-sky.com>

Current cpufeature.c doesn't support detecting V-extension, because
"rv64" also contain a 'v' letter and we need to skip it.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/uapi/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index 46dc3f5ee99f..c52bb7bbbabe 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,5 +21,6 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index ac202f44a670..f11ada3fa906 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -73,6 +73,7 @@ void riscv_fill_hwcap(void)
 	isa2hwcap['f'] = isa2hwcap['F'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d'] = isa2hwcap['D'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c'] = isa2hwcap['C'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v'] = isa2hwcap['V'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
