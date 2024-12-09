Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87837E77173
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aLVk2Qp4TG1UBtWm6X2psZnaYucqQny/zsz3QA4IySY=; b=svEezb8ttLtIbU
	Fm0idUNYN00QLRvIHc1T90ZE4//oQQokY5XEk4fOgnta0ZxSSA4fV0F+7o2JNV2tPrNEoYiqvdSb9
	iljz5j08fJfBGKRaH50Kh1MvX/VfTr4BoMgKhlIXMVAV9j1wYbyqojluKUYAJSu0vh6i0fr00N0c5
	l8bIKI5W1knvJKFTUrANdZbGZ5CuQXawgz1iOWlbfq40bPJ+M+tHBtKZIhP2rkyhIA8VnvmNEUVSk
	esc4yTDN18ghvLzthBeRtkGAHNEd4qMjBG+mo7Wf80ihECT3MBwazT++d26+8rvtOXx3dv9n1F9Nn
	2uRhw7pv77fOOtWzK8Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYSC-00000006ljX-3ZFs;
	Mon, 09 Dec 2024 07:45:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYSA-00000006lix-2S01
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 07:45:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434f7f6179aso6401485e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 23:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733730313; x=1734335113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zcyXUAz4b3DdPe6MIyU8hAlJU3yGxHg69N45Hq+y8kA=;
        b=hrIEcGCc5OBZJwcyRtUtSI2CCDKoDNxFWq9+Thd81vEoWzXcTkywQAvQQcfKACBoK9
         ffXZRMFrCXMZnhZP4USnKNxU+nUhXYCJ2xS4yYh1JUTwe4f3ugQwKyB2wS3hLPibQx/s
         J6tGtHpCZ8JHXSChzJ9VK3BY6e5xKYwqHv/kn4apETwOaP16qUYp9OUQlaOHMp623vY7
         e4HKQcaip1d6OEO7NWIC41u2tuv/7lwUR96XtAfGvIW0YLImimHSP9FMxRil12dfR5BO
         VJNp51S/CvTwf9AjK+cvL4n+6CCH6NE0kY2hFhOOtpQosG5frD0iJiE1YrnlvWHd1D7r
         tRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733730313; x=1734335113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcyXUAz4b3DdPe6MIyU8hAlJU3yGxHg69N45Hq+y8kA=;
        b=ZgTQoH/2PqyCOLL3HxeaCyBYcoz5DlHbAFTzHEQzCFHnwTNZQr5CW7CXIreyWSHMvc
         38k3AFK+0LsLvDtfs807ue18IHJw77mpUBYVsK1SqU+Y2rvo/tXCiQeM7oOCjfGdOxiW
         Hj8xr2+zX5To/U/miyNtBUntEz+LYDYe1KZgVHodmk3TCGAStjAVv2SMkEfZsHQb/CDM
         2gFYu4StrTjN4a+zs6VguO2Dmmne7XQkGs26/KxJsAzyIRtlu0WNceBBsejMZZhwydAo
         FqfxSWlsxvds4kFwbzIhaLdCmvl+0vyQIAH2nnRSNe+QWxKS0ZIcI7znZBUGOMLkL7s6
         zPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA0USC0pTcMal67wZJXo1P34usUht4LZct9y/6LAD1dSKOpdTQ84q6lJLBfDScMW3heUv2ySHWGF7mNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YybnWnShJvR5f9CXttMyCp8Mqc+tmuoDcEA/3wS3UasOAe7TCFo
	XAfdnEJHBU9KAJjq4kY73RgTMelzQkTAQ+ldFGlIcpMUBCeGGKGdeh1oHGbM0TLkSsWwPSZX5e+
	L
X-Gm-Gg: ASbGnctKbBjapUyy//tS4tgUS124L7PALIC2ekl3e9qoif5zmBXNhQ7OtJ3lHqHcI0N
	rEHPRyLrgDmkpfDBNLm+ozIx4E8BJNVXOKaZ+18yD4ihvLB4XFdu2MfQ9xmhdS4AYQEJSaa/rW5
	pjhorcvQVITQ5U/yTWVPu8B/1d8Gbn5RpYsFMZjVizLBdr8NG2fgjHhRWz0rnNV2WZlD4N8clST
	SsgMnimkygQnAq+J0pqeEQJooXHZLyLEuE0wjwwCysy8WcihrdCyEyBmzhQ25v/5ZzdH65uJKNU
	sQFBby6sl2rKAy3byQ==
X-Google-Smtp-Source: AGHT+IEv3hJmUDl4OjMfgDSl5NjxorbWzxMY2ZLItHCtIEDk3YFd6uE4Bo9cwXQKYhJvheOPnw0OXA==
X-Received: by 2002:a05:600c:4fc9:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-434dde6b9d3mr102698905e9.0.1733730311394;
        Sun, 08 Dec 2024 23:45:11 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cbd72sm185576695e9.44.2024.12.08.23.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:45:11 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Usama Arif <usamaarif642@gmail.com>,
	Rob Herring <robh@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes] riscv: Fix wrong usage of __pa() on a fixmap address
Date: Mon,  9 Dec 2024 08:45:08 +0100
Message-Id: <20241209074508.53037-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_234514_618404_40D3EB01 
X-CRM114-Status: GOOD (  12.09  )
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

riscv uses fixmap addresses to map the dtb so we can't use __pa() which
is reserved for linear mapping addresses.

Fixes: b2473a359763 ("of/fdt: add dt_phys arg to early_init_dt_scan and early_init_dt_verify")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 016b48fcd6f2..45010e71df86 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -227,7 +227,7 @@ static void __init init_resources(void)
 static void __init parse_dtb(void)
 {
 	/* Early scan of device tree from init memory */
-	if (early_init_dt_scan(dtb_early_va, __pa(dtb_early_va))) {
+	if (early_init_dt_scan(dtb_early_va, dtb_early_pa)) {
 		const char *name = of_flat_dt_get_machine_name();
 
 		if (name) {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
