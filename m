Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5BFCCA47C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DkUwupDQ93u/37PjwVRpclP8bMrApHF3H/uQ14QHcfk=; b=UKu/Xt993iubDX
	mUFGaQNFUXy9pG0BAJVhKrrDgvvyOgoe+MdcDVvYSg/JHT2Y/Q4/2fYwNGkLgscY3JHqwavhjLgT4
	pLY0qZaujulUq5eqPCD8dbP/BQ/YZhPULt9n/Xz5I3YkGo3u++Hq0iCMjgxgXoBU6Ne3Z+ZztAB4g
	OO7Wp57TqY+A2DQ5HS2c7a26/MX2TvjcbepwnMguE2Oa/XTP8Wd9xAIKQqIuLvgotoprjXl8NSTxI
	uM5kIMyavu4fhYBZwjOacKwWhbWsF+qtsZIBBDgwHOAQRfODxn6LsSdGuwY2GxR5OKIE7sqVEkYX1
	Ir733y3FpPdaD6VgiNeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4L04-00EiW9-NI; Thu, 23 Jun 2022 11:27:52 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Kzv-00EiST-MY
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 11:27:46 +0000
Received: by mail-lj1-x230.google.com with SMTP id j22so16305930ljg.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 04:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hfn7MKqSlSYbQt1LAbH8OyAIbuccCmklKNSX1/lCLiU=;
        b=ePCTutXlMQP4e/ikBXcoTUxmOmuW306aFJ6kAbWyTkC4gwLF+7cfjqWvdoLLMa7uCc
         BvsVwKPKl7i/SsYtr4o2AfNgbnIiRo3Rg/TExGuf9NJ1C20LSGxPzQD75AwF16JGsTf+
         Rhb+fH6KUpnfaGazCQ8REXgmlA9mpgcSZ06bwVYVi/+8qH9fvhp/rZVEuG2nEgVDlMz3
         O9i5w/ASzCMroQe4lu+ALKf7PESMqDF+7E58+UMrQhjIwl6n7d2aBouQXSYWspqxEGlv
         tKKyVM5bu5U/XztlWWrsKr/5hruyeTSNoy0OL9LmW4aaExG5hxX20AS6cbTgjx2+hG0p
         oiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hfn7MKqSlSYbQt1LAbH8OyAIbuccCmklKNSX1/lCLiU=;
        b=u+Q0nOA3j5n0kLhEVvOsiIJwCxDAR1ino9iSIbBbWQf5otKMLk6d+cCr6MejU6u+iR
         y1QSsiszChXg8hvGhVFd8pOehZ+8eK+QyDm80EN7zGfX6qTAcvYYmU9LAio6yG5zAkaH
         cUr8dUSJ+nydPcSMYreJeqZKF4sAFXbZc2s7uRDqHIcl3BLD0BMEM0oMp8urArZY190c
         XC/3OLhOPurORBmq3FM+qWVqxDhYRhRDCMFSql0eK6jlV1oTIbqZcDWw8Jjqv8nCND52
         iVX9FlkRXgXNasdxtvh/Ee7zUSmK0Ai4sfofbehOeXxEuUILDhkTDcg5Tn6A/eg50ykr
         4+GA==
X-Gm-Message-State: AJIora+H4neWnnpMgls+wdMnNZY5XdrBEfbte9/FUDVL/w8xrm7O55ns
	O4FmaVvb1bn5KSJ+gWJrg70vp+a8cY8=
X-Google-Smtp-Source: AGRyM1vq/ebrmUPklhl8GuWq36+Bw7GXhAeUCTBQmhqumdf95xq5y9d39j+guXZvTRxBFH3iJ4HKGg==
X-Received: by 2002:a2e:9284:0:b0:25a:6999:7827 with SMTP id d4-20020a2e9284000000b0025a69997827mr4484126ljh.115.1655983657729;
        Thu, 23 Jun 2022 04:27:37 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id p4-20020a2e93c4000000b00255bd6e1923sm2752124ljh.45.2022.06.23.04.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 04:27:37 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH 0/3] perf: RISC-V: fix access to the highest available counter
Date: Thu, 23 Jun 2022 14:27:32 +0300
Message-Id: <20220623112735.357093-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_042743_815407_8EBF10BD 
X-CRM114-Status: GOOD (  11.24  )
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

Hi all,

This patch series suggests some fixes and improvements for the bookkeeping
of the PMU counter indexes. The first patch fixes pmu_ctr_list array size
to prevent memory access beyond the allocated array. The second patch
fixes access to the highest available PMU counter.

The accompanying OpenSBI fix is available for review here:
- https://github.com/riscv-software-src/opensbi/pull/260

Note that if custom SBI firmware does not support firmware events, then
current driver behavior makes inaccessible the hardware counter with
the highest index.

Finally, the third patch attempts to provide support for any gaps in PMU
counter indexes. For this purpose pmu_ctr_list array is replaced by IDR.

Regards,
Sergey

Sergey Matyukevich (3):
  perf: RISC-V: fix access beyond allocated array
  perf: RISC-V: allow to use the highest available counter
  perf: RISC-V: support noncontiguous pmu counter IDs

 drivers/perf/riscv_pmu_legacy.c |  4 +-
 drivers/perf/riscv_pmu_sbi.c    | 88 +++++++++++++++++++++++----------
 include/linux/perf/riscv_pmu.h  |  2 +-
 3 files changed, 65 insertions(+), 29 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
