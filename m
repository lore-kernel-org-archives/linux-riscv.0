Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39F1C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 18:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghcdxjlUI5A6y2cyZSWuDtvmXoyfK+VY2l9oAGciovY=; b=u82w6nTBJQBgX8
	S53vO4cuGqV5XaucLKE8a3CT8UwGwhREWZ/8JG/6AAA2J+kGwyfi6/WRjk3TIP2TFOvg+FJIEQA/1
	xl4kWPF+L+kMzz4ldkFBqsmv3UG+jDDBFu23I7ECXjpVxMJ1uNp7EE8v3yLMFx5wjxyXCuI9ynCYX
	E5nCvT+Z4vSaITFvK1gEB3yuZWOexDjhWt8wCoD4a8ezXe1VcO7+wlWjLOTmxSD0X9nUO5GoyfnG2
	ltPjxdtcWTIBj2toIHXbpV+uDDc5+PaDRzFGmaSwIq3wS/mzB4dGR+uKVIhAbEdMNE8EGh+4roRMC
	hPlm5dVYebCVKwcPp47Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhFNI-00A6Fm-EN; Wed, 20 Apr 2022 18:48:24 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhFNB-00A6AJ-Az
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 18:48:18 +0000
Received: by mail-pl1-x634.google.com with SMTP id q3so2621540plg.3
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 11:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=LErP8U/PzejnwsS9KxvOA1A5d+doq+yW06k2+06H9yw=;
 b=SrUq1R9xL5OZEC4Ze67UAVTlCaR8u01nNPPk8oP1eppqz7PD0gBzsRZXnuhDevMwsl
 JKPcgMqhBle7UJ1lQpjq81l3IaPYq1YfYIuc22hlfQe+sJEpAGeTpitbhg0M9FoMS6Eb
 JWh7O5Qk/dz8TgOSvZTVv8rfk+D9uarBySHEo1zK+XMILDSzBxe93kfQ/D3iNRSmWyHv
 MrUz5aeweAEgbOxEYUVYklujxkRgWZAP2UNLy2aImjJR3QZW2LwyKanqf0piJX1tCQxW
 p6gg7IVLhUVllO4RYluFhedDiovafl5YmzL0213rDk5ywouSLj4h86NRtxyqUbjVmbcm
 hyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=LErP8U/PzejnwsS9KxvOA1A5d+doq+yW06k2+06H9yw=;
 b=0MD5+FC4HnKPCJg9/RAFi8udgx8a3E6xivHNvkNI9gw3qqs07cOakj5kV1tTslHMW1
 TiUm54qRKVSUu26MyLp0RLH2RJCwEhoVKtSS3s3fHTnHclFMHphp+aw2/VT0cR9WK/PP
 4O4vgleFY3Aagsp/YiMhYjBgzvA7v1HIE6VeoSQdMSUFYmrfbhiXNS57AQZXu0YCE9Jn
 fTQkghpLdQf32HWH70M7gw6X5g88T9kkVgyg1mmex9ou/D68x5XSPoFbHE+TTclU+rCa
 7+snKlA1T7tz5WBDJHi+UvCzY+RWygDiO4hTjBdkjIHSqll+4KxG02LLRinhU79aWMPa
 lfeg==
X-Gm-Message-State: AOAM533vfLQ8xeVcadye0ii1xm4jHnRAn0mR+pyrhxC5wqE7w9jt9ST0
 ZXY3MfuHYHqr5XJzEwtzDBHUPg==
X-Google-Smtp-Source: ABdhPJwMcgsPdT/Mfw3ofmgGrcnyzn6fQu1hFzXbYaHfj+5RimVQrPpgk9LKR0TuPR+a5veVzb58Yg==
X-Received: by 2002:a17:902:b590:b0:153:a243:3331 with SMTP id
 a16-20020a170902b59000b00153a2433331mr22836465pls.129.1650480495784; 
 Wed, 20 Apr 2022 11:48:15 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 g14-20020a63200e000000b0039d9816238fsm20335794pgg.81.2022.04.20.11.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:48:15 -0700 (PDT)
Subject: [PATCH v2 4/4] RISC-V: Fix the XIP build
Date: Wed, 20 Apr 2022 11:40:56 -0700
Message-Id: <20220420184056.7886-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420184056.7886-1-palmer@rivosinc.com>
References: <20220420184056.7886-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org, vincent.chen@sifive.com,
 guoren@kernel.org, 
 Atish Patra <atishp@rivosinc.com>, alexandre.ghiti@canonical.com,
 jszhang@kernel.org, vitaly.wool@konsulko.com, 
 gatecat@ds0.me, wangkefeng.wang@huawei.com, mick@ics.forth.gr,
 panqinglin2020@iscas.ac.cn, 
 rppt@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, rdunlap@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_114817_440891_5B66B4B6 
X-CRM114-Status: GOOD (  11.13  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

A handful of functions unused functions were enabled during XIP builds,
which themselves didn't build correctly.  This just disables the
functions entirely.

Fixes: e8a62cc26ddf ("riscv: Implement sv48 support")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 7bc9a21e29fb..d2054a6cd791 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -660,7 +660,7 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
 }
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
 static void __init disable_pgtable_l5(void)
 {
 	pgtable_l5_enabled = false;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
