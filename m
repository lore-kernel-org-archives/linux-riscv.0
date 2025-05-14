Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269ADC3ABD8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+168ivtNOJvTVUO5zCGqs0aAxY9aaLLChNN00RSJ6yo=; b=Ja+9J826JpwH73
	dTKyuxDi+HHZb8/b35eEkmxipPsvdRdm2smZT05n1Ow26piJflJQMSFdBAudL8bRWspQSvySMKT6X
	+EiVOdYm0Xme8SMYevwpYABEgc/nfOIPzPZ9IAoSw7KfPjrhwZi+UOTtIroEJfQK3tvSRwSWLnwDy
	aO/45chfIvQ6jTyBnOsJ16RNf/DqN0FO407pgwhylE+gUpoVf+hhWUoH50jsNweWtdJ6UGCk37r0C
	KypsqDAt8xNqxYphLHHTEf2e6ayKZyvINZwqNChMgoOEykBnFPvpJe1o697yNKkQWuSCntjzgdwtX
	Pb80A/Zrlbd0AjE/YJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDGM-0000000FRCd-0skW;
	Wed, 14 May 2025 14:39:14 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCnm-0000000FN7W-0PDM
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 14:09:43 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736c277331eso809656b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231781; x=1747836581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi4Jjo5G3GnzckLRIAYTmEBkSD8of8vYNq8Vo6cNBQo=;
        b=geoVWu1/u2RjqNiFnnT1AI7l4hfmvW/cFmVloctdLtjaH0EI2O8NCVP0Gpi8uIEJ1h
         yxGoqDSQ49iOqzUBFIyHsTKHhRR/oKcXxKrsge8bs8Up212L2YIVemClogz0OGtqKWlp
         kOdHHpfc2zdYOKav5EJC+5ryeOIGKTyy1aMtf+4zIEgJpbOM6TVBIlAYxYRoK3w8UI1Q
         9QeqGlCqwaKDY6wr0WqZKHxF+TJN+Wj6yzCynJcCQqtxPtdXSVJyRnww+qg9dhgZXdAY
         z/B3HDAUrp9GVd65ycH267MdRZB3xLZ3jQZVU3l56pn57BlIsoGbgRKrjZsteol5WsD5
         9IWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231781; x=1747836581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mi4Jjo5G3GnzckLRIAYTmEBkSD8of8vYNq8Vo6cNBQo=;
        b=l3c7xTMdXB89KKW7mMH+tH3gB8KnkRZBXMUm+uYt2qt9Cslxwj7h8Sr2zyBUHgM/2v
         TwXZlrvrSFAG1y5pyArkbcqakkfh4HHm9urlWS0pJaGjlxth/miS1qaJZOtpfK65E9lb
         q7BDhtyd8/uFeNFnbtfyH2sRVvs2+3G6QEiIyf8fq8V/h0ustvllmd9nQOoTiWGYEUmA
         hcrfKogtEmGTEUGP2QqME5UGI9zTCRg7RlOu8ACzrqE8X7zsX0NcTHmPgO7tsYOoblHi
         YEFvNBMfnC98/L+g+vW1D2e7HO1xMXPnFSAccnpr4AS9x8T+jxumNnvXdYdKgbtEMYeK
         giPw==
X-Forwarded-Encrypted: i=1; AJvYcCUflzXX1QeJYZbEA904FkITPEs4joXou5VlMKUsHtjgy8WTodaPXT2RHtUB3XkJ/MGYLXH9BqZR+UznoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yym5HdsniaWN30dNWojcBjrBu4q1NYQBZAKpF35IzO9HEbtoKcZ
	Mr4nQhaClOOOX5y3WqlhLcZQjrJgrMZ4IJ4XGkBILecJ+YefBxFn
X-Gm-Gg: ASbGnct4HLqBF7zgXq8RG5rQRNRs3KDGhpkACZViaJQ4hmAEpduMK6yS/NCOFfv1G8W
	ZhJ87ooA53fzmZGEp7dl0xAAWhwXEHw4xUp6VRO1aClKaAYcFcUfhj1vgyhFMLwb9ElAihw6IMi
	ooDthbaF1s7jUsNRzxMSvwq6lHjRy5IzzWCRrJUBBK81hd3s3LVEv3fjA1mb+jBzLSlqPdhS4J7
	t5Aggqms7oVC0FZfjhTs/GBgb30TcPVu0+sP0MR2ESSPo5D43Y1QJNisF9fy0s3tGSwI5xwuMnM
	f5tGe2l3KblASKJu4AxfPAySFUhev87vJG/mVSD3S8kIaB3JBK/2KKaWdyvogA==
X-Google-Smtp-Source: AGHT+IFeGj2HFjh76QOSi0Fc/JuAVTbh4RgUmkQMbFSYupsEYoo5O+6KS/6gkrMF6eL36ZIM3Ny6dQ==
X-Received: by 2002:a17:903:2f88:b0:215:a56f:1e50 with SMTP id d9443c01a7336-23197f346d8mr58402225ad.8.1747231780498;
        Wed, 14 May 2025 07:09:40 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm100407975ad.128.2025.05.14.07.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:09:40 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X bindings
Date: Wed, 14 May 2025 22:08:59 +0800
Message-ID: <b538e2b24eab8b740091d80ca76b20ef6014a4e5.1747231254.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747231254.git.rabenda.cn@gmail.com>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_070942_134951_0C3E80F8 
X-CRM114-Status: UNSURE (   8.45  )
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

Add DT binding documentation for the Sophgo SG2042_EVB_V1.X board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index a14cb10ff3f0..6c82f89b56ca 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -34,6 +34,7 @@ properties:
       - items:
           - enum:
               - milkv,pioneer
+              - sophgo,sg2042-evb-v1
           - const: sophgo,sg2042
 
 additionalProperties: true
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
