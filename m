Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D98C36002
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 01:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSbYfB3B7NxNcRWhp5cdqEOWwx6JP/x1bvGilcuhhTw=; b=yn+NUXrsPsndpm
	w0qTtzkaRFiE84e+qtD4+/smgT8FYa0+QI0MEE8HXYi4HrFolS4I3+sGKhbZPyiJmwBIIbLa6RZv+
	rh91iFLRvdpviauynTpOSGY67FYSaskaNLx06UeHnTu1TELaNZ7bM6fZd7NfJIlIVmid0nuYDkGu/
	BvU4BXXsG6tzPTLPM/RT91OfPP04awtGzxBrQCBjcW3ZIZIMcPrG2jjifOYxsNNRQSttzd0bkgQNj
	19dzbPlqJqni/8ev6zGyHnRbC3ibsBGsm9OBglM/SIt38SNRQsTI3Pr9iT+xD55BU5+/N7VwUrkps
	PESu2rIoQwiRiRQh8VgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ax9-0000000G5IA-2oZ4;
	Mon, 07 Apr 2025 01:07:07 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ax6-0000000G5Go-2yYB
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 01:07:05 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c5b2472969so388522285a.1
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 18:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988021; x=1744592821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siqPQU+FyAku8vhhn3ZUC1oR8uSZvTqCHGJlE8+8NrQ=;
        b=HZRJ/HrOqCEHsFLWqZet8wA7PImN6GFAAxRDfhIxF9qtiQz67nEbXSdnY+fZgwv+Fi
         9S9W8XQ8QS+58sjNSSdWOSagl/kb+k8tWYuOgBV81B0zwGupnuoKM4KFN3PvJDm08ckm
         Pd0xfOUwsaD/3t7gdD04HRV1kKIqwK2hKSvHwx8dshMfsMmclqlg6tMEnsAn2972nofK
         q6CjRWda0Y0RLs+V8P1Jk6FHXpeJL6rXcdiz8HwsQzfMWyRAqXS5gPumP7ucUOxHEXHN
         xAc8E1h6OGmsmhPdVpzd25KxFhGmsTScv3a5pX6DwiDxECCDKx2fl6b80rV3H1pXkFyP
         drcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988021; x=1744592821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siqPQU+FyAku8vhhn3ZUC1oR8uSZvTqCHGJlE8+8NrQ=;
        b=fmBdF4VOvo3ByxoFuNW1xYeabeY6GBjaniT1oQ0NOQNwvaxImhiKerNqua5uIYn6RX
         UExgvvKtem/GlvFJs1BhFbSsLiH79/4lEPCMSQsVTYS52s3oh0i+XU9Z/zy3o5JgVBk5
         75l3Ss9Rnr2WTVrUfwdj3tybyIL/MUdEVZzmmg88XVC4wXPMdANMrvQ2Yug9qZtZ8Umi
         OQPdqI/pBao7HCtMtwdeVt9i3q266Vo/ESUT1ME5MfGYKCN6fVNdN2EqgGqKcqFwKMFP
         /bwBOcJxzQIs6K3NUP6pHgOtt2lWw+e0zRH+SgxisABbSACAZVcNNbp9w7qDrjcFzgPh
         reVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWccUKtnnepX+aIm7rKiAYTFv0am5SaRO1ebsXc9S1TfYflafPSvizF48mxMgcVJmJKLlH1h2wOSMGz9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIG/5NYRiHMHhC4gVOJiwooL2OCgglksxe79Y7QnmlQbbrM57t
	N4pbyrQdc5GRPPbEKBQXdFE5nManrUYDw09JjP9VzA7B1TXs+uw9
X-Gm-Gg: ASbGncuJ9GkBagYqEn87zzbfaF6c4xEhoa309jogAt4GLRF++8bSzZq6lk9mlWSorE6
	nipxe6cnZOp6WUgNAor9jh6VJzpiWpyh64vNRIMQH1PGM2yRAsj2hshn31t4ZHJmYtajxeTPdza
	s+hBmdtocIyTxiRRCXlsKy14anUjQFvIy9BhmYt3NgxRtj9e9JO8LZAoNWrh+pN0Lp7ftDzhAns
	H0DIiNL216WS9hd9JRuEhzAusu4qAIJJIib3xgfLst51r57LEebtFvBGe56zlmNs5vLBFVis8Sq
	FYyB9gMazYcT1R2QmUg5
X-Google-Smtp-Source: AGHT+IHOF406ZAY4FtFhD2l8xlyDvh5PHaA+xtI7orTdCQHDTm8ZGVImUr8k5ecrmbJiiqwwrdv5HQ==
X-Received: by 2002:a05:620a:280a:b0:7c5:a5cc:bcb9 with SMTP id af79cd13be357-7c77dddd878mr1080915485a.56.1743988021428;
        Sun, 06 Apr 2025 18:07:01 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76e96cf01sm528160285a.55.2025.04.06.18.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:01 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/9] dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
Date: Mon,  7 Apr 2025 09:06:07 +0800
Message-ID: <20250407010616.749833-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_180704_781935_2F8ACEE0 
X-CRM114-Status: UNSURE (   8.75  )
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

As SG2044 also implements an enhanced ACLINT as SG204, add necessary
compatible string for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 065f2544b63b..d6fb08a54167 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - sophgo,sg2042-aclint-mswi
+          - sophgo,sg2044-aclint-mswi
       - const: thead,c900-aclint-mswi
 
   reg:
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
