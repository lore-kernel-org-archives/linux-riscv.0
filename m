Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C9EEDE994
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 02:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIdt+gYsO0CEMbSNeJS4NVQ2yiTq9iLxzjyDgU1rV+g=; b=ensxk+F9IMFYzu
	tVZPJzbJqBE2f8hvIAmNWmlETM2h7IbSPN2AhhrNW0kquTVKs5ohL4SD9rgwu+YluwRKCkDHgBv3G
	xcx6bB4z4FbsZmY2MxW+2VaSuw7PKhUSy7FoLe9GbmS+6Sg1VF84iqjwXx2wIi2c+D5kaSFmOEsPG
	mNkFcINk7zqicXEDW1C52Eq24PD7zUWr26H/RaUo0+w4XSPzTYesc5wnD4Wmz9VyNNf14GGCGN6+K
	BKEYJmCQPhxVasnHCqP8eSMSfnvTJUSq3Svwt8tV0IKC3V9MuKol4VWZpsPGPX8iHvPKVDGjx318H
	9RlT6XjrYtG1h2yjZZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snqIn-00000003uwb-0fHn;
	Tue, 10 Sep 2024 02:08:21 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snqIk-00000003uvr-1tnD
	for linux-riscv@lists.infradead.org;
	Tue, 10 Sep 2024 02:08:19 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-710e489860bso734077a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Sep 2024 19:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725934097; x=1726538897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BI30WVVFXk39PBBMlPlqzRH+DTqK3h2z+UCMnQv1Ops=;
        b=KIPIWMU9zO4zT1MeBvUo2mFnlONFjh8RgggQqiehtDVhETKanW7RQYruqZBPxzmUT+
         Colld8W9uPYHqpjpvlltrCTrVV+qIiMqL+seEv4s4i7fnSFYCXvhvLWO3/PpWLv9FtqH
         3UVPW2Ab+VMzUVFz3VsOG8D1D6T4T9ff94uW791StRGWYu4x1jlXySayzbMbi1o0nhHl
         nnMxPcMHAs8+6gxTKdI81zLuHTEHX2vebyCQlii1skJMsDu5Xiy5VcC0wbiNRVVC6IAZ
         HeKUkwHCY7fPnClZWBWltWGOIDc0UuacGlBtx2Or6bedUkYOVh5UehLekcD91lzx4DhR
         Vf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725934097; x=1726538897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BI30WVVFXk39PBBMlPlqzRH+DTqK3h2z+UCMnQv1Ops=;
        b=umMFZfWyemtvC2CCmjNOBko573pN926J55Jb695NAfsPCuKCPlieuINZiqROY1AL8P
         GaL9Ld6/787hyF+68AdvDaoPHjFpHZi6EcH74Qpb0t6rRr5IXUW4vFjeOmv4NWDR111k
         llPXhaN8xr6EOcGHmCdwlyAJLLSSwnVWDIjDfza7uK7vBiptBS1n/+7++pYFEwlm/hII
         HO6OjdtUBKEQzmovZ1xDN2gFY6dOdqJ9kKIc2MUv6tXVwEMjpRyCJ6p46TRHtoQIrJxa
         7wjIGfGOfNraVlgoBFIsBsHIeBwY23HZuJpPLKoV58ZaorEtPugTQVFUCs95r7pzQpSP
         YsSw==
X-Forwarded-Encrypted: i=1; AJvYcCUNxzAmTD2Re6xTM2jdokoHM7CGPI4LBp2f8qqFPyi7QLQEtUYCuJEUBBY4UPXK7XEn9AOSAnHQvDfdMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5wLq5VyOMlatTc5Zkto1YTq4bMc/nfZqJup3ctxAo6u3ZhRqi
	QCBBypqJRZ11z9vrE0y0xyVdmFlqzIohGeASqZz2Dr0PuMPt5oN+
X-Google-Smtp-Source: AGHT+IGFLWDdr/KERlkpx8BuwbDh6erVc7wsCpO7c1sCwII502DRfQ2scgY32Y/Ts3V/PR3030bhNw==
X-Received: by 2002:a05:6830:3c08:b0:710:f76b:350b with SMTP id 46e09a7af769-710f76b35b2mr307494a34.5.1725934097103;
        Mon, 09 Sep 2024 19:08:17 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-710f40989a7sm380982a34.59.2024.09.09.19.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 19:08:16 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH v2 1/2] dt-bindings: pwm: sophgo: add PWM controller for SG2042
Date: Tue, 10 Sep 2024 10:08:10 +0800
Message-Id: <c2b237b5b2430b0715c9c3dee043d30fe5216e2e.1725931796.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725931796.git.unicorn_wang@outlook.com>
References: <cover.1725931796.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_190818_519492_969448B7 
X-CRM114-Status: GOOD (  12.04  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Sophgo SG2042 contains a PWM controller, which has 4 channels and
can generate PWM waveforms output.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/pwm/sophgo,sg2042-pwm.yaml       | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
new file mode 100644
index 000000000000..fe89719ed9dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/sophgo,sg2042-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 PWM controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  This controller contains 4 channels which can generate PWM waveforms.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: sophgo,sg2042-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb
+
+  "#pwm-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@7f006000 {
+        compatible = "sophgo,sg2042-pwm";
+        reg = <0x7f006000 0x1000>;
+        #pwm-cells = <2>;
+        clocks = <&clock 67>;
+        clock-names = "apb";
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
