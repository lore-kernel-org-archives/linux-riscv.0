Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A6EC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 05:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sIiG9DrpTeyE8r1h0GEMSaph2BpGL+pcr+NLcjZf9oQ=; b=Qa3+7FD7Dh/Kkg
	hKDODt4jKLi0m+CtgCc7QsZ+ZBRzy1XDuFeOgVsKfONtlkKIx38jRY5Lz3Na8bloU6vDjar8LAku5
	i+WE/DKh4D4xnlciZr9uQKBPeeLPml4PTd1rD27qT4/TkmzYYRYmqpNeDvmSVm6Axqf6GAxftEBy8
	RrsFlzOfICiHCsJhQ6wuzSkw7KVgFfGqhIP2JzDeqoeknGQPDEEIRZQsuhhuW8eaSo1KDG6AH/fvQ
	1tkha5ew5kbJt7jKXrNdsrFZgNcV2QcdbhibXN5+QnRe2qwCQ1knXR+gaS9JfNOXYJU8UDHxtGvrf
	HECaIGGEHPXVpq2leZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naVvi-007zh1-K9; Sat, 02 Apr 2022 05:04:06 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naVvZ-007zd0-O5
 for linux-riscv@lists.infradead.org; Sat, 02 Apr 2022 05:03:59 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so4332309pjm.0
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 22:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=iJ7fDikEqxd3GQyUocX9wfBcccairETEQwPSFnMPpXo=;
 b=g8LcAt61UEx9yt7MWyScZYveSn/vFYcCGkBunwwIdZQZcamvIemmUr4GO5W9ximu9q
 2D2FT4C1o5AuLuNgDZnYDJ3cvndbVlCs2U+YNvMlDM34B3RzGCkDCbaT3WHMXorHdSE2
 wvHt1PLakzKy0LfnlLUYzx/OcFAdxRldQI+6L3zJRu+Dqq/P0Zuc4uqdn87EUac9tjA/
 RmYM1shl9saPk3MfQ67VZK8b0jG0vqBhzdmlO9GL+kOsKCGueY1N+2MysOjGD31oFdgO
 s6G60n8XV6AN43A28FU0cuS2kgKZWtbTaolxj//q4EspOOHzV1ejh03himE4uANlF9ue
 OcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=iJ7fDikEqxd3GQyUocX9wfBcccairETEQwPSFnMPpXo=;
 b=nBWraIzW9h2/T1OXPHNjkOK58lwzMXN1B6aM4EUV6WfyT7VNmsf7Np6/1Y70OFVXR8
 VfU3s0CSWgnM4z55KRlLu4TDMVBbcA94gTH5kbxxVHFpgJnjYprKEHZQbNp59y/03emI
 CnKI9hSSKMqobsboyj1jtQnk+fvATUPCVCaXRmI10Dfdqj21sZiwVH/pva8Y8iNnrDiV
 VGG7ebKyDnaqvSx4OLXXjS9LaQxzXRCv3FJ2ckT5a2kB9AxhgMwd5NySIfEyxrwVZY2j
 Xe8aIcRtIdjt9AqGL08eJEmPpBkgGngTYdvSz07hLLHdojIAaTpIkKU/8BmdqyiYtQxH
 iMkA==
X-Gm-Message-State: AOAM5312+9DQMTu2pwJn0ftgYpzVkYGMHJEIj332eiwkg3a5g9urGqZq
 ynPhH79EDsxX6k1v5WUONvirOg==
X-Google-Smtp-Source: ABdhPJwm12U+bQZZZiIWlcjUiM4qVbUHU8stSqN84SjntqT6rmw6vuOxTNzZ4EV5HsrEmwJM+5VehQ==
X-Received: by 2002:a17:90b:1b10:b0:1c7:3413:87e0 with SMTP id
 nu16-20020a17090b1b1000b001c7341387e0mr15537870pjb.132.1648875836629; 
 Fri, 01 Apr 2022 22:03:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 v189-20020a622fc6000000b004fb72e95806sm4574382pfv.48.2022.04.01.22.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 22:03:56 -0700 (PDT)
Subject: [PATCH v1 4/6] RISC-V: Remove "g" from the extension list
Date: Fri,  1 Apr 2022 22:00:39 -0700
Message-Id: <20220402050041.21302-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220402050041.21302-1-palmer@rivosinc.com>
References: <20220402050041.21302-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-sparse@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 linux-riscv@lists.infradead.org, mkl@pengutronix.de, aurelien@aurel32.net,
 Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_220357_815051_92AFE36F 
X-CRM114-Status: GOOD (  11.08  )
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

"g" goes along with the base ISA, but it was being treated as an
extension.  This allows for all sorts of odd ISA strings to be accepted
by sparse, things like "rv32ig" or "rv32gg".  We're still allowing
some oddities, like "rv32ga", but this one was easy to catch.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target-riscv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target-riscv.c b/target-riscv.c
index 924259af..5076bbaf 100644
--- a/target-riscv.c
+++ b/target-riscv.c
@@ -36,7 +36,6 @@ static void parse_march_riscv(const char *arg)
 		{ "a",		RISCV_ATOMIC },
 		{ "f",		RISCV_FLOAT|RISCV_FDIV },
 		{ "d",		RISCV_DOUBLE|RISCV_FDIV },
-		{ "g",		RISCV_GENERIC },
 		{ "c",		RISCV_COMP },
 	};
 	int i;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
