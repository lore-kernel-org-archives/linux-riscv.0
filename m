Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A603C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 07:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4NfrRRXteZ+aBI91s+NbtcQ7W4uXnJsFbGh95CfpkM=; b=XKZbTCyplAyiEL
	Mj5rhqHV/tD2aO1y7aBm6sQ3F1LPSUtPvQxzI2ZeUGPfxgobQXtprX/OrPMzXux1VGltepG+5i+rO
	bqmrIvfcHDP4KzOCROz/zep9OjEgPc5znBJbeKN8Xt1X0k2iro9RwqZvhJcwQYI6SfyTO3MZ0g04c
	DOg53lJzfonwfbZFqRkNGFZZUe/jD+OQBEIwcEKLfGhMSglmDNNfX+r9HnfBX2r5IthZWRxwTEY1j
	roM7E5/ahOxu9ufZzIatTqywkOIv4y8QtL35IybOpKTrUchfXj2J28N5WGlxqNBO7crCRVkUvuVU3
	oDTEkBL+kiZ14ifsRyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6P3-0000000CxSl-0wU0;
	Fri, 28 Jun 2024 07:52:17 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6Os-0000000CxMz-2kvi
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 07:52:09 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e026a2238d8so253771276.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 00:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719561125; x=1720165925; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eu+2wcx6ARI0Khk7sEf+LxSnsWz3kwiEgnTb6o13mh0=;
        b=HexzIX4TmCJw5ffFg1RBIp/yhoVDls2a7Wfv8Cbp5gct2fZMPGhuMl4G/q3m/kSSAN
         2aqJ+21N1IEyDStTAYsawGmZZ6+U9gS795JPsgI/HtQtE2Gs1S/Eo5Iuo05hhqRLEgWk
         53q+kAtOy3xwI3O2O5K5dUMvFAk7Ef0Mw1hlUG8pWesz69F+qYmd1dnc+ODtYsjZm1wM
         H1C7wfKvc4YiCwyBqX+Djr32FwrVEMlh/NCHJ2k015VtfpKDtUL0e5sKwBtFu2S+Snhg
         uxEzSd/JockWTj2lXFH7q1NUIEigbbmVZnr/EfA/VHmOm4Bz/YoDsJaJK9W7uypPa8Mp
         Wqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719561125; x=1720165925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eu+2wcx6ARI0Khk7sEf+LxSnsWz3kwiEgnTb6o13mh0=;
        b=dmSLFURkhHNNP27MObnGpe39qn3zGsoVnGLqqUaOBiN4uBJnfj5C7SKyYAx5yyPmyj
         l0sR7SFIqAZzPtpKmfmTgIxDDmx+IUHnMyWeLEzxnD4VkJ4ITreFxtC17tDkj6ESz2he
         tTrXuRjV6pkOnQ/F83LMohjMoOmUF6Fb/M53Y+64zHimfbmi9/wZ798HJEti9p3h415L
         hM++/Pe3RKmq6HZGNduRKg73lAqMpmGm62HCsVk/W43cieVv/qcg7nJ2kNL20jN5kPzi
         XcqKCV6JIiEpssolsCxanBq8V0zlqzDtXyWB7KLRv+eL+UkTNonzNC8Hxra46t5OCr6L
         l6lQ==
X-Gm-Message-State: AOJu0YwgFOLh4vi3hNEmGE5IzxhnDyGIqxj9vBJPG5y+iHRWPZshahHa
	JahK7GKEctHLImNrKHW8z2tLspwGZGgeyem59xOrRiXJ+u8KMXy240uV7DcxnGc=
X-Google-Smtp-Source: AGHT+IEZUhwullYVKgF25a+0boKvH0ownItzxOgMvrt6D0RnS9rjqr16EhSB3iPBE5ZjBx8I+fBacw==
X-Received: by 2002:a05:6902:1701:b0:e03:48ed:d275 with SMTP id 3f1490d57ef6-e0348edd2d9mr4844561276.61.1719561125224;
        Fri, 28 Jun 2024 00:52:05 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c69b53bf2sm685068a12.2.2024.06.28.00.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:52:04 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 28 Jun 2024 00:51:41 -0700
Subject: [PATCH v4 1/3] drivers/perf: riscv: Do not update the event data
 if uptodate
MIME-Version: 1.0
Message-Id: <20240628-misc_perf_fixes-v4-1-e01cfddcf035@rivosinc.com>
References: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
In-Reply-To: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, garthlei@pku.edu.cn
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_005206_736533_BD9CA892 
X-CRM114-Status: GOOD (  15.56  )
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

In case of an counter overflow, the event data may get corrupted
if called from an external overflow handler. This happens because
we can't update the counter without starting it when SBI PMU
extension is in use. However, the prev_count has been already
updated at the first pass while the counter value is still the
old one.

The solution is simple where we don't need to update it again
if it is already updated which can be detected using hwc state.
The event state in the overflow handler is updated in the following
patch. Thus, this fix can't be backported to kernel version where
overflow support was added.

Fixes: a8625217a054 ("drivers/perf: riscv: Implement SBI PMU snapshot function")

Reported-by: garthlei@pku.edu.cn
Closes:https://lore.kernel.org/all/CC51D53B-846C-4D81-86FC-FBF969D0A0D6@pku.edu.cn/
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 78c490e0505a..0a02e85a8951 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -167,7 +167,7 @@ u64 riscv_pmu_event_update(struct perf_event *event)
 	unsigned long cmask;
 	u64 oldval, delta;
 
-	if (!rvpmu->ctr_read)
+	if (!rvpmu->ctr_read || (hwc->state & PERF_HES_UPTODATE))
 		return 0;
 
 	cmask = riscv_pmu_ctr_get_width_mask(event);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
