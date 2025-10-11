Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6830ECCD18D
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 01:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwQpGXFnRMp3HwxUlguwZ6+I3UeeqPs/mtMYC0ACy10=; b=j9erBtc3JxFMNQ
	jjkRqdZfnTKaMu60bliB38aYFZPg4AWW+jylz4rq+wGh4tMbE+6T5XV2Nb0e41WsBtk6t505GB7M1
	Xp4lYUozzMFfftrjZ4lHmIPKJcTNKKHGtLsdn8Ra8+k6gkSVIeK+XNEeo8Am+d+HEhlMwBArwIkfy
	yiRWA5Axxux1ELxJ1TzzyiTKHLS+p6f6wAPbywTLw6lxpF0pWvGV5H5syOrSbzW8/bnaxMIpSXNxv
	n7vnThV884Ul214oDjmRN+DPyg0gz4PAJltIBjzL22q1xXCIrN7LkW0aGtRXDGW5gZP8kIP5v4Qk8
	hhlo5D8vGcaSwpAwSE6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Oit-00000009fN1-28RT;
	Sat, 11 Oct 2025 01:48:39 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Oiq-00000009fM4-2ju0
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 01:48:37 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-791875a9071so29225626d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 18:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147315; x=1760752115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dq1v/Nf3lHeaiUxgTl8qnZzG8T6G34OVI2HiAKdMAek=;
        b=WZWL4b2UqTbojm8gmh1Qvsl0qGe/tVBRTfCS22mupRP1FX9KyPOK+yGyRt3Hc91YzO
         tKD/axi4GKu4MGQmh4SjSS2WeuI7YJo2NQswSDcemn8DFnIFSTyVyovPlpirvqmh85ZM
         s+GpUgc6lt8q4jA3R/i4Ng6eB5xENIX214HMI4loCx+FgsdI8Pgjleauh4x+Qlow2Qm3
         nawj2Z999LrZMOcAMnzf+4XX1PRp3LFl9MK+XQNzCTCmfrSm+wYlQ/g0GAbSFwmBkdED
         TWLUCGP7mQ6isf1paVJ/4KBukbzPAC76pgxlDNDsl3ix0+NHus9GpAAwTjdUHbaoPALK
         xxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147315; x=1760752115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dq1v/Nf3lHeaiUxgTl8qnZzG8T6G34OVI2HiAKdMAek=;
        b=epxHWU3zriXoPt0Dlq5hKJZDTm7oJpT4CvA/Za2S79VS4bBMu1M+6oT4Q4Ei9ylBZ0
         PPnpAScjbb9m7SwgO6VS6nXHzHA/Wn8T7HS8uzHeHdTfexuGxJvDW5G5ztcG3jaa2H3u
         eA55hGJssCHLzEFQK0Mr4S2FbVrnOimosir9ML05mCOEWaplVpHhrmf8/THguoMNzSnw
         6u8LkXtHcqiCCJ1C8iullgxk4WTY7k/NDeiFjGxUMvg1LY++GqSHF5hMdcbsLo4qApKP
         FvWpF/EMAWlIKaAdk8nAlVuFn18vTgR1gwxcPeRKSkx8w5VhH3ldlmhoHTIWoIlD71iG
         UJEw==
X-Forwarded-Encrypted: i=1; AJvYcCUzbBq9SMp3D+sToXZTxRLZ8iKP/O+/25usf0j4e7nw4wKJyAvXOW8NGimH3J1Ql43oP7G4+EV/mDH42A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0wLN5Mr+1XyKBvEtqoo6AE+2sV5qHPlarqsJB8dvZKHLbJUOg
	9uJJMuapYkqjFCh4FORmEVE3K8R2MbTIQb65eTQShnzDaljvoR68Ciu6
X-Gm-Gg: ASbGncszCrlCX/uDOQ2EXjl4uY3zlR4c6/zta+kCbtESQ/1cAK86mgQwMPMT0Awe7ca
	KP5cE4g9SSBtdxI5Di9cHxMvsMsvVtEaiI5vrTmhH3XWWUPFHbx6J962qcrKG95uMF3WkPmMFMM
	8g4hXaRBVOXWgINY6WbH9yy/wYni9ZpHfLcpq+R8MbUQYa55Rl5nouV0zkUOfh78JyuOoRBl5cI
	tXKtvBGu9HRm77MjcYmg6ejTZ2iDhDhDk3gy0k4+DcqhMT3stluuDwgLyaxA+ehZuQdENtwK1pb
	0QUzGzdo5WLzmW/tfYDGEvuKP/3sQPgK3KU+Jr74o5QO5DpQ/vnXfkXzYJgtu3vr0lADendHTAh
	JBtcGkE3AhPIoqLqjaWs2oh61pWyWkx81OrB6BmfKtjgN35EEG0Y9uhzsK8oTBF5gtB+3q+xGqZ
	7XOO02pydVfw==
X-Google-Smtp-Source: AGHT+IEJw4orlmJ4tYBxRoLE7eRi8PKUBgmmkCLHKFSaNSJu+ZXO6O/fHEeJK38T18LVEo4ah+bedw==
X-Received: by 2002:a05:6214:268b:b0:796:6034:c0fb with SMTP id 6a1803df08f44-87b20ff9e9fmr191000946d6.13.1760147315339;
        Fri, 10 Oct 2025 18:48:35 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc3574e71sm25978806d6.36.2025.10.10.18.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:48:35 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
Date: Fri, 10 Oct 2025 21:48:09 -0400
Message-ID: <20251011014811.28521-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011014811.28521-1-josh.milas@gmail.com>
References: <20251011014811.28521-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_184836_718078_9663E94B 
X-CRM114-Status: UNSURE (   7.94  )
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

Document the compatible strings for the Milk-V Duo S board [1]
which uses the SOPHGO SG2000 SoC [2] on the ARM64 side. The RISCV
side uses the SOPHGO CV1812h [3].

Link: https://milkv.io/duo-s [1]
Link: https://en.sophgo.com/sophon-u/product/introduce/sg200x.html [2]
Link: https://www.sophgo.com/sophon-u/product/introduce/cv181xh.html [3]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51..63773811b80f 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -25,12 +25,17 @@ properties:
       - items:
           - enum:
               - sophgo,huashan-pi
+              - milkv,duo-s
           - const: sophgo,cv1812h
       - items:
           - enum:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo-s
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
