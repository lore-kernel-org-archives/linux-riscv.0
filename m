Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65B1C04A6A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 04:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RY+wXQbF0QqX0daD6f5lhyRJr4O8w2RQnuZC2ji4jRY=; b=1WD5AEzB5mOv08
	Lt31E6MFGGkzxxPNC+MepAz8Eownih/4W92NycggYfeg1/pPAQoeH0S+QIWksg6VzS5RvdA35E2rP
	o1vntp64tYMCqHsHkba5tgvuMokCI39vKfwj66NWUjfTnVla7N0WwSdwbx0FzS8s4X+PZQF2fUTVG
	GEaAxHh3WELrc/Bfu1P+yHf02wajOJQJGp/yA8OrJsTArwBKJcd2W56Gv/C1nAghYUNT+3rLK46l/
	X185HqhaV+nP8Re0Bl0wb6dSgqG4p3/MLuqI8Q/vXzT9+fBwDQA8zQiJdQmLt6fR/TMq/ExB0Rx6l
	8HkL0MzgWxP9gz1FHjZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVPZM-00G9RJ-2V;
	Mon, 14 Aug 2023 04:52:44 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVPZK-00G9Pz-0P
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 04:52:43 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d67305c80deso3432750276.1
        for <linux-riscv@lists.infradead.org>; Sun, 13 Aug 2023 21:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691988760; x=1692593560;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hN9qvX/xkO4ChcVbhI2c0MqS74wWxK/MncyAQVTXkuY=;
        b=6JHbjA8d7uRMzfo6/hSK3dYn0G2W7xFG1hgjAnfIbo7EUB1TTZHMpZM3W32r8bfun9
         9S1F2xR2z31Lidlmd4TS5seiojs14TfLajh68iuTRNZWhT9i2tnWHS0LVQmcjiB5FTQO
         9B9dQYMQcNTjDaFxQcQbkA++BMN97pR8vnOPBYFW55Zu8jN1jWRYlaNclUdvbz5lZg6U
         TuzJmZASu1OuF0HfX5mdagQ6q8xLdrfcQlgv+wgEmqqRggWSLsRkDv8A0g+7c0oeOZQJ
         9G7lOLByRzRvhUVTJTMRVoT3z4T5aAFSnaiLQluRWcWpZrHGv0kT8Gw+bmrdyPpbifjY
         dKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691988760; x=1692593560;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hN9qvX/xkO4ChcVbhI2c0MqS74wWxK/MncyAQVTXkuY=;
        b=kLN3iya3YQ8TDn96BCs0MDw48UW4K6LlL3U1J9vvffaVRyUbSWWGyYCWscimECyQ/4
         U/FkBs30ujMOl4mJaWZ6OtaynhczbXGpv5UKS+o9Nuh92R9wnQHsRshlQ66uzhN1S2uy
         bToPHeMGDSo7S1+vJdCFWmL8trSeDaqpeSlEWrjoGJrBl5KFAyTi7zimfaPCbMBLUfUo
         2+wJTxqn5misvE7teMB6K7z0AQ8INteBy84hGl/Lz1upvgoRq39EEc6wn4RMmXjEpWoM
         XDEE/Ulll2CDa6SCWKKykUnNJ1uw7M78meUTxxE4Bbr/fMmYurYW6BbbNPEqjPMiLGpz
         H+wg==
X-Gm-Message-State: AOJu0YxhbiNfaSRfsMvjtAmxXjuP5fSTek1CIFuLp7kxabI3Q9CKSAu8
	zrg2sd60yWxCFyZ2N+wvNJks0g==
X-Google-Smtp-Source: AGHT+IFGfapEBJ5M8Smgl8R0ZbfWGqBsgKp6orc7Q4/qciZRFjmp6G5wAjCZN2qLbpYAOHBfty4dvg==
X-Received: by 2002:a25:2984:0:b0:d4b:50d3:b5c4 with SMTP id p126-20020a252984000000b00d4b50d3b5c4mr15149463ybp.1.1691988760571;
        Sun, 13 Aug 2023 21:52:40 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id i62-20020a256d41000000b00d6861b49f01sm1190958ybc.65.2023.08.13.21.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:52:40 -0700 (PDT)
Date: Sun, 13 Aug 2023 21:52:38 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mike Kravetz <mike.kravetz@oracle.com>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org, 
    linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: [PATCH 1/3] arm: include asm/cacheflush.h in asm/hugetlb.h
In-Reply-To: <6d2acfa4-7f44-d3b4-b0a8-5495c5985e4c@google.com>
Message-ID: <4b055d0-7b2e-72bf-9b9d-8f3f1cd312d0@google.com>
References: <6d2acfa4-7f44-d3b4-b0a8-5495c5985e4c@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_215242_162405_C1236B01 
X-CRM114-Status: UNSURE (   9.77  )
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

PG_dcache_clean is used in asm/hugetlb.h but defined in asm/cacheflush.h:
builds rely on an accident of that being included via linux/mempolicy.h,
but better include it directly (like arch/sh/include/asm/hugetlb.h does).

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/arm/include/asm/hugetlb.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/include/asm/hugetlb.h b/arch/arm/include/asm/hugetlb.h
index d02d6ca88e92..a3a82b7158d4 100644
--- a/arch/arm/include/asm/hugetlb.h
+++ b/arch/arm/include/asm/hugetlb.h
@@ -10,6 +10,7 @@
 #ifndef _ASM_ARM_HUGETLB_H
 #define _ASM_ARM_HUGETLB_H
 
+#include <asm/cacheflush.h>
 #include <asm/page.h>
 #include <asm/hugetlb-3level.h>
 #include <asm-generic/hugetlb.h>
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
