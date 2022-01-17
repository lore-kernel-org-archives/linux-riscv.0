Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7914BC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 17:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvsEbNMrfO3Ci4I6FWRXTuAkJJZG3aBMJ6WvOaWZ50g=; b=gQbgwCXWmJRpEo
	1vWxv3g4TnfWOfjJiHfxl6nrF6o5KUcgFSSUaXh48tUnurRtNK/HUcTiC91tIAe+RNdaR+whIhFVS
	1k9Mr32X05gDKS8m+/EHG2g6EHP6vb49E6a0BaiMYquWUxc6Zcyi8qgcLUBh3eNkKMtmzU5JFXKSe
	ZVBqkpMUL8w4eVfrHaPFI7zDaDSGILIKYuQCl9V+LP+B1MuJK6jQRr1+189x7lfUXlbhLZvhf7tD6
	ygiDZrAayJfMfkYmtla0lM4rmP3mmy90iAKL8MfRWgNoAI+H9F5hHDdk3rDqUSoZsznVVD9VuFvyx
	Kpvcs+xui+DX50UYCIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9VzY-00FyLK-9s; Mon, 17 Jan 2022 17:40:28 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9VzV-00FyK1-7A
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 17:40:26 +0000
Received: by mail-ed1-x529.google.com with SMTP id j7so20285612edr.4
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 09:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nextsilicon-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version; bh=dvh9B/iN6tFm97H5e9ZMgVfJGyBFtyjqorhNkHtVR2A=;
 b=lB71ek0rcs5L4HBIIcTtWDUWmyszojqj4CrYuXJxI75vvIRUjrk9ObSYqqZFYglD4z
 7porrmEWcPtcC+Ls2pw6S7h89MYpwgsroaRB4ZyYk0wse8YQ6K0n61l/xnVAilWJASPQ
 VUiPUa3I8h6JOj+Uw4tLhhOGHysLhvwLUzpxRErqzuEn0Q9+nipmcjJv/yXEc/8lT3XU
 pLhGwWuZwEvTrayA9BhTGbqUIrwzDPiqLFKg3kRdXsvTxGKiBaEMWGp6GZGtmBNhqoVf
 /UzoPN+ARrJnRRHD65YnU59vFR+1D8CvWydO2cfjkWnaDhT626VjbIIoK6GutWGCIEqs
 CbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=dvh9B/iN6tFm97H5e9ZMgVfJGyBFtyjqorhNkHtVR2A=;
 b=XePM4nVI9GnEGWzYTkzJ8m7IYFgX8q/lxI37JocbyPimO9PZfwZes6WXENE9JNVCDm
 DoQS7GRNMQpnPMvGFQ0pRh+ORxQiaVH2ORB4LdfToMHvtSE4VnBKfhY321610V0VisEi
 k54NMopLqnuR/sBiAXxh8/Qi5z1biBwKkQKutdscBIkrwyNsvTcKIN6KPQ/+umZDkn+2
 DeqCCEu2e3TCo2HrnWuUYPPOtkTuGz7RJP+lFt2Wi0rhl8MU1Gnd3vpL/YrdVo2ySMbn
 gxIcCd4H0smtNfbq2+g5s6q4qI6PE2ttsEu4E5M2rSL4FsFogpeS+cAYyTDsFglTC/0x
 eImQ==
X-Gm-Message-State: AOAM531OI8+lML4T44gQzXyTMa4TkxU26u8iZVKOYDfC8oWTOjvFBk8y
 3YlAh5T52D5Jheq/GE020HyN5s51QYhlvC0FZqwZ95Xq0vLBq8cMckYGsQC6APESU9HiJd1IyPf
 WQr4lPwB6WWAtJNKSpvcbDQ==
X-Google-Smtp-Source: ABdhPJw2Z6bqvZp2HLqKCG6ikV3r5R6drO6EBXyBWVmeTMw9Uuqm3LYWf2SbmWhUHT2u8jcUEdN8JQ==
X-Received: by 2002:a17:906:4998:: with SMTP id
 p24mr17238830eju.131.1642441221562; 
 Mon, 17 Jan 2022 09:40:21 -0800 (PST)
Received: from florian-Latitude-5420.fritz.box
 ([2001:16b8:c2de:b300:c4c9:2ca6:b54f:5c7b])
 by smtp.googlemail.com with ESMTPSA id gn36sm4651779ejc.29.2022.01.17.09.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 09:40:21 -0800 (PST)
From: Florian Wagner <florian.wagner@nextsilicon.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: yaron.dinkin@nextsilicon.com,
 Florian Wagner <florian.wagner@nextsilicon.com>
Subject: [PATCH 1/1] RISC-V: Change signature header field to use `.ascii`
 instead of opcode
Date: Mon, 17 Jan 2022 18:39:41 +0100
Message-Id: <20220117173941.3798325-2-florian.wagner@nextsilicon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117173941.3798325-1-florian.wagner@nextsilicon.com>
References: <20220117173941.3798325-1-florian.wagner@nextsilicon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_094025_297035_4D988138 
X-CRM114-Status: GOOD (  11.03  )
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

The `MZ` in the signature header field is now encoded via `.ascii` to make
the kernel compile without the `c` extension.

Signed-off-by: Florian Wagner <florian.wagner@nextsilicon.com>
Signed-off-by: Yaron Dinkin <yaron.dinkin@nextsilicon.com>
---
 arch/riscv/kernel/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index f52f01ecbeea..931b63464b90 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -48,7 +48,7 @@ ENTRY(_start)
 	/*
 	 * This instruction decodes to "MZ" ASCII required by UEFI.
 	 */
-	c.li s4,-13
+	.ascii "MZ"
 	j _start_kernel
 #else
 	/* jump to start kernel */
-- 
2.25.1


-- 
This e-mail message and any attachments thereto are intended only for the 
person or entity to which it is addressed and may contain confidential 
and/or privileged material. Any retransmission, dissemination, copying or 
other use of, or taking of any action in reliance upon this information is 
prohibited. If you are not the intended addressee, please contact the 
sender immediately and delete the materials and information from your 
device and system and confirm the deletion by reply e-mail.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
