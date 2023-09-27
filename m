Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B26E810B1
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 09:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fncvohCdAR7uiMy2M7/AvNqgj9rYAL27TYQaCESA1GY=; b=iFicoPDyOUzQS1
	zRUWpWDmuL79IUxoHftINJRu3KA6+nNGghgutD8yne6FDDUquN7uIZExuW2SgV41h7bqHDIS2/Mic
	xydnI7UXhqJNnzSRh3YKB3WH7KUmq2O21pmgFiPN0dQVzaxO5+Oo0SJ7DwsFptlkgSOEYTWSCJEvz
	mLi/nwfSCpTvqvDZcVAQGfs50uxoz/bAfNEkdVgnVfOGaqRFeIFAosJFBFbGQmBFNC8CQ6Mk7OmQ2
	PXf/GHU/Dq7bv50YQHMmt2W0fMOPgqN+/nlZr1hJ0zKhQIK1QapAO9XNJRkUxqzQhFSSglFjvQ0SP
	xERGxJh6jJnaOxDa5JeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQR6-000Poc-0L;
	Wed, 27 Sep 2023 09:02:24 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQR3-000Pmm-1P
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 09:02:22 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1d637f9c587so6010272fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695805340; x=1696410140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3kjAZv4Q1aFQqlWexZgG0kQvPcOdl7qnOTAp0XEAeM=;
        b=jPXKC+Eir0EfkvW8+7kI+beAz6hZgDXkNK0gX071D8IYa9m3ix84lcKfB24o/r2Gve
         tyDJwTz18BSv5hBFE/hMJTLFVoeJ0ZCiJfjtCOBQuRd29rdz+Ypzo6z85e/fL3XVEaYF
         DT8lapLtJl4+lCaKCn8EPgbpFDgOr/AOwiLjTsvP4l+jNpAFlylBtZPdcu17AAGqjI25
         eALoxStAZdzIT299Rqav+0Pg+lbXIoigMjowhOKKBmH9Byo7hUVLLA8BLmhqEbmcuJbd
         Kw4eoj/Dza6JlReFG7J/fALqEY8eQa9cVc8zchiUw/1vx8lzrbWGc7ij5Dn8ej5t2PeC
         hkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805340; x=1696410140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3kjAZv4Q1aFQqlWexZgG0kQvPcOdl7qnOTAp0XEAeM=;
        b=CztvWH96vIbnUpmdjmmo+e/dCXcj0YeUrkTF6ntjl4Ll9x+XEr7NN1MNVe6UwQJ5IX
         kuPLn0dh2tEbBAEyzIgty+/9iVEOZH4+xhtVo4FX14afNNTrj4gdIWBuCNH1JD3k20Xl
         EGJ4TcoTa+jwplS9jdwYXZStzCZm/ZcIBXuoPJe7B8vjxZ+xSt80cJOaNBDECT4OE1zN
         6aHLTU6GBIdv2CLgheifQYeR3X9F6b44I9gCzns1c91xCBAJ3tsXtLHjl3iSoGFR6aQo
         mqCsdZeujzWKgpe84q2i8aLhAwNKrNtiOsLWE2MlMYXBwCj4+EF32H1jdkxHNyeGC1AK
         Co4w==
X-Gm-Message-State: AOJu0YwKQreLo0R4KR1oZfDKzBWsjBaTkvV5V+0We1mjk4I8W/If06Ox
	Y/4oIYqzasFmUopcOjCbqMo=
X-Google-Smtp-Source: AGHT+IFIHuBhbshT91AHG9ueKxUgL4LBQPr6uM2bI0g42q2bzbUMbNX50Tb0CUCbgMfELjQ5f7IaJg==
X-Received: by 2002:a05:6871:154:b0:1c5:1269:9e2c with SMTP id z20-20020a056871015400b001c512699e2cmr3560933oab.9.1695805339718;
        Wed, 27 Sep 2023 02:02:19 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id v3-20020a056870e28300b001dcde628a6fsm1963655oad.42.2023.09.27.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:02:19 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicornxw@gmail.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v3 08/11] MAINTAINERS: add two files to sophgo devicetrees entry
Date: Wed, 27 Sep 2023 17:02:13 +0800
Message-Id: <0b86b34672bac27be09c315485aebd33651e1b20.1695804418.git.unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695804418.git.unicornxw@gmail.com>
References: <cover.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_020221_477361_F6E4E579 
X-CRM114-Status: UNSURE (   9.48  )
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

Add two dt-binding files which will be maintained by SOPHGO DEVICETREES.

Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
Signed-off-by: Chen Wang <unicornxw@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9114a14ce991..3fed8e3d273f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20067,7 +20067,9 @@ SOPHGO DEVICETREES
 M:	Chao Wei <chao.wei@sophgo.com>
 M:	Chen Wang <unicornxw@gmail.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-clint-mswi.yaml
 F:	Documentation/devicetree/bindings/riscv/sophgo.yaml
+F:	Documentation/devicetree/bindings/timer/sophgo,sg2042-clint-mtimer.yaml
 
 SOUND
 M:	Jaroslav Kysela <perex@perex.cz>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
