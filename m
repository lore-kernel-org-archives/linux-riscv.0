Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F461D3C921
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Oct 2024 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MyPfrhI4dqG4GytpoX2eIAbIKh4l+pqAG++iq1T17IM=; b=MrXx0g6QgEj1al
	0inmYRQe6cA3LG7SDk1ri7driAZASaCIR+L9K8QTK/d8byuzGmUxazBo7itJJ7nNXwLzn9E++sFqB
	isx6gUOA8fa/lVGm9R0EgfA02webA2AD2xUGJSR671NSxDXUoAWcP3aEmO7OFB6fXv07NQUMLAXmT
	DElx+1KNvOAI9VNaYeslYoBXopQSWU1H9V5Uu9Q6hLzLyKMNobZsn+XpLJYx3a4ucpDaeAOb/Zpg1
	sR+X5g5YBm5xYtO/cjGw27zEHcKoDA2qK9x/owjNXzBtraF4RCV+AjTWUMwUgRSbaj/n8jDo+15oA
	rW4wJfwKAIRYp6VSZDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2CIZ-00000003bA7-0fLx;
	Sat, 19 Oct 2024 16:27:27 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2CIW-00000003b96-1jp9
	for linux-riscv@lists.infradead.org;
	Sat, 19 Oct 2024 16:27:25 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20bb39d97d1so30108735ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 19 Oct 2024 09:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1729355243; x=1729960043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayyCub6qQl7nB8NfvKhUdob3RBjft3xPo4E//xagIW0=;
        b=IV5Oj3pX3qog16cBTzEWh85uCDtQgHB4gSlSYjOfcz+Q1wrUdDgi92wCVeWtFEZTwu
         GjxSGE75O+LnS0nbzbygcxd0SZtBemDNJEzCUwkvftl9KBhDw47z7fMZxIJb78yZuruw
         PE3OWUqEpXgMcbiO+AEV8cO/kKl61avjDaGtbOU7UikEPwkR9QfWzfflpv5QW7OJYJ6M
         cYLKRFL6WtZ7m1eX8uKKIdkFn6OhkNijPyqF9gKARPF+sTwmn0zQ0mowMRMTDpoulD2w
         XITLeEOrfZ/QCS8HV2wyVCQMVyzIkFN/vfE/eKMvBLf7STxAonZLfPlKTlwTR9eh2rSq
         BL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729355243; x=1729960043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayyCub6qQl7nB8NfvKhUdob3RBjft3xPo4E//xagIW0=;
        b=g/uBF/ddb8oBLpBRqOCXv/cdiNXbt4UoxSruVDl/2D076qiVWg7LMGjThDhehHe9np
         SJKiMJfUBzXrn0lYyLNMmoDIQ4RdhQ99g+8Se9pAWP2NUiif7D0DCC014KUJMm6UlTDC
         67seLQ3r0HyA/YijTC1zWc4IfpCu4W5wTfwX/rfxVtmhb1pQLLzBbtieG/tDoMspD5Lc
         Az0HrM6ET1ZRlLAuQk80qwpxiGqDdCRcjyH3HIM6u1akUX8b0ig2pZGFCwjcFk8K08O5
         G5NsVem2ToS4/nmGbZjEDJya4b3WSi+up2/YUy6MP2vDlwPmKXahriI+Mk6W1ZptorRW
         j8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUAWhBoBEIbfGXL+LZt2Kj81XQfL196uulcwXOwMdOCtM0eoeFITGDf0fkVnU8O9uPhHLIugfd9IRTOaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzU22oxihpkTvfCdy0jn7sz+7evrpPFdQzsvkAkXur5ZY+agjD4
	Xj2IFtgrt6xYccWy0suM4WhfARcljeyMHn78XrSWbwuCoLJdao3juC5AhJE5fZI=
X-Google-Smtp-Source: AGHT+IGRiLKGL85dRLzDgmFfmI4bKce+qOy+rBWCEkJrRSeKD6oaU3345MPGRp8gkNXz5lOalMXPMQ==
X-Received: by 2002:a17:903:32cb:b0:20c:9da6:65af with SMTP id d9443c01a7336-20e5a9581d1mr88430965ad.57.1729355243177;
        Sat, 19 Oct 2024 09:27:23 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::30df])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8de4bdsm29567625ad.180.2024.10.19.09.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 09:27:22 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor: add deepcomputing
Date: Sun, 20 Oct 2024 00:26:03 +0800
Message-Id: <20241019162605.308475-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241019162605.308475-1-guodong@riscstar.com>
References: <20241019162605.308475-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_092724_483463_FF652319 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Sandie Cao <sandie.cao@deepcomputing.io>

From: Sandie Cao <sandie.cao@deepcomputing.io>

Add "deepcomputing" to the Devicetree Vendor Prefix Registry.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
[elder@riscstar.com: revised the description]
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: Updated description
v3: Add Krzysztof's ack
v2: Add deepcomputing into Vendor Prefix Registery

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b320a39de7fe..f8bb3df65797 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -356,6 +356,8 @@ patternProperties:
     description: DataImage, Inc.
   "^davicom,.*":
     description: DAVICOM Semiconductor, Inc.
+  "^deepcomputing,.*":
+    description: DeepComputing (HK) Limited
   "^dell,.*":
     description: Dell Inc.
   "^delta,.*":
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
