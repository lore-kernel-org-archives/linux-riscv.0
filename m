Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E8CC3ABCC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 20:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZiVws2oZGKHIHDV6vAIyXq49oOVb+DxSQKB4HcTbllk=; b=Ts5iENTbXbB9EU
	aAVXmpwbF/xxYX4eWxN0tGJ4ALfGf3saTVpjEEWHXYw1ZOIwiijXDnl3FenUnUD0T7zSh1j0pB+49
	zRKKwrlq7wd90/HoYKB7AyqhhLgUB+2PW6VRrBeRFmKyLvygXTtu/m14M+eVCXNpWcwj7OnaSwm5J
	hyPIeHOFDr+FvKEdSktUVfnUEyf5mS5I/pNfVsIHn6grb3bI3mv8/PwGL8kXBIKkiVzlD8PHE0Q+f
	8o1E7o2ljuF1pMuqHw9es74tGr/vXeZ167Mq3TuA1Q4KOarPYEZfPbp905UTn6y4vNtG6Exr5Ot0v
	AR4rjnhjt3UEPPKsKCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJq-00000004opR-445Y;
	Fri, 09 May 2025 20:27:42 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSEW-00000004Xil-2Drq
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 18:14:05 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-30a99cff4feso2946996a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 11:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746814443; x=1747419243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNRo9fm7iyINTImWyidU3KVyi4MQmQ7f0YzWwyxxaXc=;
        b=DxLp3adiL07G3sdb316aUVnfFfOTfBrMa3v3rDZmcGdNUSo6nq2em9pEB57CAh6gdq
         ezepOBhX0dy26LR+AfLYFT+mRuOTQmYxwp96SlSS8N/Kh7lDXKL5snky3DcgYstMUP+O
         aeKQFmMe35NefwPQ1R3reBMWFnhbgQNXBDRxPTMrDNVe5ntgpc7eRJ9UrScet0GF3jYU
         VhVK78chROWRU3phdo3j+EV5PC/Rp8THFtaXVSw4ANzP3iG3zPZ0NMkfyKZ2SpfSd8GQ
         dK1xEiircHGsf4Qpx+7HF9NgXuNsdaGxg07kTVKAM9GgvKW+zjg6z70Yfigwbg+HUgms
         tPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814443; x=1747419243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNRo9fm7iyINTImWyidU3KVyi4MQmQ7f0YzWwyxxaXc=;
        b=IhuHye7A+8eLolhzEDAWUtyRaWlwlHEYKdp/fnp8M6K1Wer/n+xZMhL1NnUvLmn3Ao
         AJFzVQ9fZoSHlMLS3U71VooUVdRRsZbroOjy1y2wr8ve/RDaQaRJRI+bgMZBxWjHrDGe
         J5wh5RrFN1z8asRQkFDbbRZ5qWVFV+vE0oaOGFYSnwnUHpMfwlLM/txUOOLhOLzBddX3
         9DKS3vQ5WD+cVmBEIZfr5d0Q9CGi2320Fkh61+qIM6H9KEFKjW24ss0ldia88eAxd2sS
         t8hleNJxEbdC86TS/wi31fbxKotWctdOa5x4VzbyRtKfMib0ssA5loZGUSW/qMWmhCou
         TNXg==
X-Forwarded-Encrypted: i=1; AJvYcCWIFY1Zt0ohEvHypt1QKHYBz7+pNdTBMVsjeNiBJA1G9xm36dzGncHBPxulhSXKyECSpdlC1wxiLbsR8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXfB1gYREXV6Ix3wmGw6S0hVaiqPI+UuqxseHFzq0eGvlngnU3
	Mh8GiPSXVEGXiwjtJx2n32nKVFpeXrWvEPv87D74nLOucoRRTODW
X-Gm-Gg: ASbGnctLQNosPnFOpNJOLg4B0j2iQO3t5px1i9VyOL+WbjnGtzr3CAc19k5CuKZvrKA
	9kiQ52GjJM0vA+N49stmTb7/gq6SpEehxWUdCOWOGyLLcHq9uyfOCuB2AMTrD5sUY3SgnYrQQ3k
	y2kP1C+IMi811UgbH31pk1AzxjoalMYalEAvTybURnbrJCC6pmMm9xwuxYSD8WTgWvRskXcdKhj
	UdC816/qCuGpKQVEfWMPXw3vP8wRDtT44mHI+ajS62P+JDyLp0Mm3qkoIBmvaI4yvc/OmDNs+bH
	LC3UpNtnxz+g6UH3+fuK+Y6RWKYtkGOqN3Ek1fljbBnX3kDO41Y=
X-Google-Smtp-Source: AGHT+IG1IDbBo8zSWgCQ3XPdci2C5OPmRAXOekINXprX8tfkSAK2JEHQY3UrbKWp96pgR7JLi921FA==
X-Received: by 2002:a17:90b:4acb:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-30c3cefe24amr8073503a91.12.1746814442868;
        Fri, 09 May 2025 11:14:02 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e61083sm2127309a91.30.2025.05.09.11.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:14:02 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
Date: Sat, 10 May 2025 02:13:27 +0800
Message-ID: <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746811744.git.rabenda.cn@gmail.com>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_111404_565172_AA477C53 
X-CRM114-Status: UNSURE (   8.89  )
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

Add DT binding documentation for the Sophgo x8 EVB board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index a14cb10ff3f0..ee244c9f75cc 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -34,6 +34,7 @@ properties:
       - items:
           - enum:
               - milkv,pioneer
+              - sophgo,sg2042-x8evb
           - const: sophgo,sg2042
 
 additionalProperties: true
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
