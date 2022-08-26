Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07357ECAAD6
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 20:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZI3HQoR53TGzX/+oootpRyTjo/RjV7X/97UJnUKTYM=; b=MNCE3so+XDYVP0
	41TfuoUbbZwg6ZicuINmqK6JKAhbVOMjJ5nugjqow03cBtoeDI6HPBpCugYfSMZOc8TS3L0BTW15X
	abXM+4CzDwGR3BhBPv4sIdnlQR9mtBRKAp4xz76v6fu0yEBQlW4sVdKYtMPH/YPBLiMBTUbFbpF4R
	T6fWm002uJtc443LZ0O2NwjTVbcb+rlmdXgB/3sggXuv4Zl0Hhvzw6TBfKKzoH1qkmmzLHahGrXFw
	tw1sTojshGgO8Aie4jCkcGvWKoLejlFYO/MR49mlSfLGSCFfbooDZK+H52NWw8LF9Z8vOPP62HCj0
	nmYeMUeogzq3la4+agzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRg2e-00BtUn-96; Fri, 26 Aug 2022 20:35:00 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRg2a-00BtQv-7s
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 20:34:58 +0000
Received: by mail-lf1-x12c.google.com with SMTP id l1so3405285lfk.8
        for <linux-riscv@lists.infradead.org>; Fri, 26 Aug 2022 13:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ZV3ZzWqRdNpCoXhxxq3Oc7fuChGV2uXFXvJx8ULYlG0=;
        b=dgqzRSxhd6EmXdLYO+5MoOqU86GEnXOvf20b2XTRy/fHn4QX3NlMWu1BaVPTXiLGb8
         bt6KQ2g0f4HHrKeBrSW5N2c3EoVUKfSwDnYQmq59b/4gE+IPk1QU4zA+CRQ6q3jp+X1/
         19D8aNkjVfvlJ1X3tePXBt73DPlobIsIu8ASt4Gddf+4M1Sjttfh4QQZgl+YmzOb2Y+9
         1eTGcFbn1iBPMMM/P3GWSdOT2+NqoBqbE5JjDcmA0hBvwXPQIVWU7BvMwAqzoaQFZj5d
         md9yfmk8EYg4MhxxHdoazrlNkjfoHyT/7L/FxiQm1cKVawxCdbiv3KL14Fmh4YaUkzj/
         HLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ZV3ZzWqRdNpCoXhxxq3Oc7fuChGV2uXFXvJx8ULYlG0=;
        b=rvi+C2nVhrHA6D0RU9VOKZU5JQ3uEWowm4Eb/VxedbVXDaafEEUTs8wRKrNa64o7OO
         bIpZqhVtHo/h/lLEX2wme5YDkSaUjfy5pSVKABcNiy51i9z5ttSBZbL1NmFzrHbJoxQz
         8pcu7cLSOnZXcEK+5uzeJbzsPmyLoJ0TmAja1J/rA+2GcJMdGqutEG5cmyh1/Za+tQXa
         kJxqcNMC1EP/xkUWv2NRD0xphJLaLX9z1BIDMHJu0PifC8xqn5w2vFCSn7GwBwLYxD/h
         MJ5lLgbCxcpXr66zB2jLBgM9+8lkCeKACpe9Zzu1P86UNMljnWaoRr/nnGKtILlNsxx/
         6/0A==
X-Gm-Message-State: ACgBeo1WWkycfQC4WduZLOrAbzKhZGIUjPD8s928zM1TKdKXDTCvESee
	KK8N8+RcZW3o07M/BYB+n+h5bzP+j9k=
X-Google-Smtp-Source: AA6agR74D7PrNvkQkpYjSN28Jeb6FjQuNAufLFdXCq0+R/FmJHQbcd028gucuLpQhDqsyQQmvQ+fCA==
X-Received: by 2002:a05:6512:39c3:b0:48b:90c2:da4c with SMTP id k3-20020a05651239c300b0048b90c2da4cmr2781903lfu.282.1661546093563;
        Fri, 26 Aug 2022 13:34:53 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id v6-20020a05651203a600b00493014c3d7csm452424lfp.309.2022.08.26.13.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 13:34:53 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 1/3] perf: RISC-V: fix access beyond allocated array
Date: Fri, 26 Aug 2022 23:34:41 +0300
Message-Id: <20220826203443.823906-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826203443.823906-1-geomatsi@gmail.com>
References: <20220826203443.823906-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_133456_299622_6CAAD3AE 
X-CRM114-Status: GOOD (  16.79  )
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

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

The root cause could be related to the interpretation of the number of
counters reported by SBI firmware. For instance, if we assume that unused
timer counter with index 1 is not reported, then the range is correct
and larger array needs to be allocated.

This is not the case though since SBI firmware is supposed to report the
total number of firmware and hardware counters including special or
unused ones like the timer counter. So just fix the range in for-loop.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 6f6681bbfd36..8de4ca2fef21 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -473,7 +473,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
 	if (!pmu_ctr_list)
 		return -ENOMEM;
 
-	for (i = 0; i <= nctr; i++) {
+	for (i = 0; i < nctr; i++) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
 		if (ret.error)
 			/* The logical counter ids are not expected to be contiguous */
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
