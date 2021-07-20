Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6BFC636C8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 08:52:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6D461209
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 08:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6D461209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3/ifXeJOSEKpXjyWUuoEahW7SW8zLtwtPSdRzwli84A=; b=lBsWipBkllJIuMvlTaw7i+nabH
	pRJoqCdQq0qVtWDQ8d2RBB8DLJiojUEtMFDLhmm7JV3HHHnwg7kmvHRf0du9kn8k4/sEpFaZz5vOy
	u7OKbXBbYGsya2C7fjYAYwJAICechIVcZFhOGLJrm4Jzg6g5UpxgpFwOK5ZHXcPDL/1+JBNyjF7lA
	/xu8nsyPEe8RJBwut4y+1p9rDbprj4xIOL5ere3XxTKyLYxFm7Qt8P8RM5eDe56un7Q3Aljf99oMS
	zYK6Ky0XFWY0MUpJywi8BMn1XWD+htB91ZmwxYRQCFGM6W9hghLkDhNdxE2JAOx0XQZdLzCdsHyrf
	x6Wt3y0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5lTm-00CHmh-O7; Tue, 20 Jul 2021 08:51:54 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5lTj-00CHlw-EF
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 08:51:52 +0000
Received: by mail-pl1-x629.google.com with SMTP id o8so11093762plg.11
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=aTo/UaN/uIwO2OnmcLf1Lt/oTHeOCsH/C4eq+JFYMqI=;
 b=FdF6KxfXqg4yzB+3kblIIryje5mWoAjr5ZUjta4Ib2MBg2eJbhNJzUfoY+9kQT9F1V
 nXlVx7lzes9NycArJ/ycbBVl2h7sGllfG4rCV3pJTyCWQdWtnlRANLZhsTDRi9ZFSOpg
 AppXUyVUO9bQXnVzpW5lIFX/1KwHLvb2V6beq6CQDrfXHq2gQOOa/aSZkywOJOC2Ukvj
 DOfnZsUrjx2u/uXyrZuxpyK8cXXeFeHanEKztIajUbZUHJVTj4Ic10Vqgq6uLICy2NTx
 bNJiEaT+Lh/JSlCXNDoOp9sbz6yIOqOBnzHb7BaYtbSyybGBxF+hxGXUH1+WzwMdZLFD
 dfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aTo/UaN/uIwO2OnmcLf1Lt/oTHeOCsH/C4eq+JFYMqI=;
 b=nb4Bt+k1CFs8JqDbosI3JQVoiv+RfBNUZXvcT/LNzLPKhnfbt2BxmUf4fCXzv7AhS1
 Hf9OFrPEYQ8alK46P2uv22hsDNNoCFDPRjI7T0nmjVuLzhaaoi6LuxJIMreukj3kXDCS
 /E1IiNkb5rhm2hqU/sOh1NmzwfP1tNIPmB++0OZdetLr+93qd00hn6FDX0ZG9lJjSr5P
 TcC4bSzGF2QZCNjpGq7Uf3/tosAL9XaZzForXr5nZqAXtkPU3HAvQ5X50HR6cTui8sGi
 UJ/LsvvVudDY80gvmCbmY5C5KkGwq8rLy20GisrjD6arAQx/pyaqydeYdVx5ieKVus1G
 pHhA==
X-Gm-Message-State: AOAM531+HUaXafzDgWp9z7U3GMnhllPeb1vDe0CXeTaDo4g20hBuQ67w
 2dt4e982HItmvthK2z7dCms=
X-Google-Smtp-Source: ABdhPJxzkHbKv6A4saCiIqD0Ek9+anWOZa0lmykmowFKmIYPEIifzYM70dRvTR2asELYuBGgEXurqg==
X-Received: by 2002:a17:902:b418:b029:12a:edee:a7ff with SMTP id
 x24-20020a170902b418b029012aedeea7ffmr22916098plr.59.1626771110340; 
 Tue, 20 Jul 2021 01:51:50 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id b184sm18479456pfg.72.2021.07.20.01.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 01:51:49 -0700 (PDT)
Subject: [PATCH 2/4] riscv: __asm_copy_to-from_user: Fix: fail on RV32
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <93a6ae3b-3271-5edb-0a1b-260ba789f3f1@gmail.com>
Date: Tue, 20 Jul 2021 17:51:45 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_015151_538449_0D86F0C4 
X-CRM114-Status: GOOD (  11.84  )
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


Had a bug when converting bytes to bits when the cpu was rv32.

The a3 contains the number of bytes and multiple of 8
would be the bits. The LGREG is holding 2 for RV32 and 3 for
RV32, so to achieve multiple of 8 it must always be constant 3.
The 2 was mistakenly used for rv32.

Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 8bbeca89a93f..279876821969 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -125,7 +125,7 @@ ENTRY(__asm_copy_from_user)
 	 * t3 - prev shift
 	 * t4 - current shift
 	 */
-	slli	t3, a3, LGREG
+	slli	t3, a3, 3 /* converting bytes in a3 to bits */
 	li	a5, SZREG*8
 	sub	t4, a5, t3
 
-- 
2.17.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
