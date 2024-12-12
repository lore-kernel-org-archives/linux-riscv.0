Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0601E77180
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 13:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iz51Se9YTj+Llkd2WdCkdszOoikFUnjKb5JsMDe0bLM=; b=PCGakGvGT7O/av
	fo+htENJFcXOmofeyExP4K7Xv7tTUzMd0+Dxvk7Qk6qXlaM0HB8S5OlfI3rlF2/bW8KuwBI8fm4gw
	lpPrPpF7jzZaLUfbvOK7337FX3vJvoJLYyEhIp3MrsUPkj4otRwejQxjioeWg0FB6gua6ian4sWEu
	4lSkZ8bCH4fESjTJ7E71+N3EvFcDAjW6OY0U9hpJLHokELm5earA52bXPrSLu4jbCJNK9/EfIF+T/
	COPXb/8AAzKiPFSpF9edvTBNAbv0/wdlr0ItzHmbZYqxLp5EFqFjkztOkOw6ZBAfLbzJXXS8SFhH9
	jauf5CSnwzYeTQIem09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLiz8-00000000Siv-3bLC;
	Thu, 12 Dec 2024 13:12:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLiz5-00000000SiM-1DPK
	for linux-riscv@lists.infradead.org;
	Thu, 12 Dec 2024 13:12:04 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-435004228c0so7005755e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 05:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734009120; x=1734613920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N2YgHN1u42ft3i81AHB8yJHaifZcAL+5WACka8uiNrU=;
        b=FAJjkTNVhLmfPJc+esW8uIxugJoOnVMpCpQNY/AaA2ZmAgFMf2ZIh85w4a0Ohd3VmK
         ud2AdIigp/4Gcjhlvq/J3SHGUMy8lL8hsL3t/WZeWs9UX15M8qJIOhauTeQqeGxbi25W
         rExn6N+JtIVzBb9fn+hV9ozNoUAWP9ECT45xytgUgSmlF6WB+qNAuKJLvtwSFNhygaW9
         KNsb2w9ysa+iraK/j9NXzYSN8agGoM+gZ+ebduMSVd30rkFFoMbAgLFJIW6rX0naAD6X
         CVuo7DbqBJYyXt4JzWa08wgW6MPW0zEUYBK3i9QLiZxaQKGyPgxazduy882zEseVtb5z
         f3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734009120; x=1734613920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2YgHN1u42ft3i81AHB8yJHaifZcAL+5WACka8uiNrU=;
        b=lFfJEFaGt20Dol2V7ACMp6dy3ug1sm5TMHRIszcMEoAtwHYYK/WH20vOvRNBiiuQQW
         iUBIFJ0NDw8hTtjPoFnxqlDxKEbGBBu9eYClkN1bSmR4aYdHw5o6UfFrM+fIQ5clxbQi
         SGToTvMTs4+kL3ZlruxMQkihlQCl25IxmbiR8ylPaa1L2wIS3ejkbqrMveJFpmSmNZnu
         9tHjCHP1trhTo74bHmTWojxo/gfaMGd/miC7paiCF9hbKXYB8qE8hBACl1cG17odLXc6
         h89BkHgdOLGGSLMGoi0jq+l2/5GDc6/PHs+uDXm/s4pq9AKnw0WvtwbeS+zVWljoql0h
         zf4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfOHBf5I6FLbaET225NlZAO6QBGq40LMifxgveNRToe3PBMgy6KKAWBqIp4bT3hUe5AJ//YQZoPHillw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcjYJNl99oqVfoA3utMV7wqk3C6Fbdiw4EPEhnSZ0LBikoCzGe
	CNrLAamuCxlcMHToGrcLArAuieyFBf+u1IGZDHBDadrQEakiOKmOgPny41ykwHA=
X-Gm-Gg: ASbGncvVTntdtIR3qbKFEHKLSXodLtqJ1o8oBy1zHqyZqjK9r9OGXg7H/vrTc1msGer
	9BNbPCHztBN/YaG1llkJRsEhsQrRADsciZgC7wtpFu3kJRQ2QZa1B2rjDc2qqFngpOQJ+NUvAkf
	4TbDBqhpamp6Q9bCJqk+W+pIepjqy8foUMA+tTxgDQ2IR6DugFhBimB4hyxc4GvH2DzkkROmtiC
	RMg3swfg3M3t8mqv0evybGXfMedmyT+/s9As5/XNPoYCTqBhOmqdU1usJHuT0HY9XYoH0H2cJ+d
	Xecwc3aTvEJAqcMz/idek+FF
X-Google-Smtp-Source: AGHT+IGwIC4usqpXrWrDNnBStJNdRLcYsV/1KRF1pj5B+SiFE9zAdRezZDXrjrCfRGTU67Ud290XHg==
X-Received: by 2002:a05:600c:cc7:b0:434:f4fa:83c4 with SMTP id 5b1f17b1804b1-4361c43d6bfmr57259765e9.29.1734009120475;
        Thu, 12 Dec 2024 05:12:00 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824bf187sm3996700f8f.49.2024.12.12.05.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 05:11:59 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] MAINTAINERS: Add myself as a riscv reviewer
Date: Thu, 12 Dec 2024 14:11:34 +0100
Message-Id: <20241212131134.288819-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_051203_588776_1C0F098E 
X-CRM114-Status: UNSURE (   6.68  )
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

The goal is for me to get a kernel.org account and then send pull requests
in order to relieve some pressure from Palmer and make our workflow
smoother.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 17daa9ee9384..1c7838642398 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20108,6 +20108,7 @@ RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
 M:	Albert Ou <aou@eecs.berkeley.edu>
+R:	Alexandre Ghiti <alex@ghiti.fr>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 Q:	https://patchwork.kernel.org/project/linux-riscv/list/
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
