Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7975FD4660F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 19:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BG61mTjoDiSvFXMkvEf4vfCvYeU2YUPLy0oV9A2mvs=; b=2D+HcqCK6X97Rn
	K77Sxg0ZMSDpu7/jrPDpIY5+lHy7XGeYnPb76Y76mLiwS9LtKuLMw3+vTd5WCUlV/DG89k4hPUMIy
	5J6W4vbS9aV8Wi1oPx7OBxSP/np57o2tD9SBmGRVuP72jW33ykGe6+1M/k7DMM7k2ZBxqmtBt9TRF
	89RIiO+QHYmr9rQWwnUfIbeUlewVUW5xD7HNYbc+TQio9HmNEG3K0pwPWmirH5csqR20pLUazQZ2c
	PMMzrsUq2I8dW0t56sCTpIJruJyqkLVbUjLoDbY1IljIVNYDJwSHHTu3pHxi8M8T4wrYgjhsx9RB2
	VsMdvWYG9CMsO/+Vs2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSrN-0000000D2iS-2nS7;
	Thu, 15 Jan 2026 19:18:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSrK-0000000D2fl-3cLV
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 19:18:20 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so1157965f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 11:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504697; x=1769109497; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WczvYa8CE5EVgqZyNZGoJ41lrxkL4ZBfyJ2rH7pD8I=;
        b=Nlh0gUDMHd9AH7c/fI0yTASqbLxbwnV1r4I9iqltMnW3A9JbgvGikTq1mS9fdAq6Wl
         PbtuRsxVC2sXjAXR/Nq2W4IC1h45QQxV0oe9ivgvBptVt4Dlq9xm3qDslErRu7LO9yZ4
         ZqcKJIjo+lYyVhxjRWz9ifzmax0wBTorAXA71NGB0eu6X3j6CndSFPWds9QAnkOCkkjd
         w4VdpS7EYgWr1Hb5RB1XyD8JwTfI9wtiHbjTvpZEYrXvwjAI9KTvzMeV316Ug+frHgTh
         +Mi/b/r0WuKLhMaXGUZTKRTsZfNNy5FJ/7/IKhTCKSa0Om5fztCQHRDSzxaYanWsYaPg
         qdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504697; x=1769109497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WczvYa8CE5EVgqZyNZGoJ41lrxkL4ZBfyJ2rH7pD8I=;
        b=cyi6SwwQHwiijXTwMatZDrCZz98kuYQAx6DM9MGq45KqaJb5bU1CiD7WNbRF2tTdVh
         17EokzAjf6xJ7Pb0XDa8eNn3DLWdGIlRwEZwAcj3uDxRFj3ySuaDvarOJtjROswbCMoB
         uX9GKdcBYkm3YAiqLY6BsyNNPGmn6AbmIDCtpGX9botImbl5msZYz/1hQOKkKW4may+V
         S4vEJPlaEUaPLk7fIHj1CqbLe/3JyZ3K3hdKcq7GIZ0dQAZ1zio+OMIe3glEJ6XDAFr5
         2uQN+0CV1wyjOqsviTUsHK2pxiSprlZ2U4CQepx5PNfTN77R0SeG9ZcN2CNFUpDZ++BF
         ZnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtNvB8C37mDxpaz/PlVMYtu+s+VkvVBGE5Kdh27/tA7Yc0GLPO4JRb/3ad2Ku7m5C2G8GDAsMIDHqWsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzM8lOzzel6qo3e/34p/jFy4ZKDCe187ViEVi+5u7lkKY5kMvai
	ORqcecroZXfV0++P/4e8ZH++5UOsLkSZJOhhb3v4aBI7V61trKX75oFF
X-Gm-Gg: AY/fxX5cBz9LOgmugPY1BTs78qzVEPBBYuWbAZlZTP8J5LqRaL+70d8KiwEHVs1GmKA
	l6L9IxCatgQ8BKGD1bTvAmAsYp4jrGLaEvneGPGESmbWkKaVCopNULWT8vWP03reOigtdwsck3w
	r66axySNJiMf/QZvyAunto0MRhrB673NwDfurl+KmUHVlo8r6snNE4ROH2a2rOLG44eWsosjyjW
	1lxsMfWaT9AlRm73pJ/QrNPdJG2e+8pDnkk3+1LbppTEUxVwJFfIN1q3vlxd851goOjYae8Ynob
	IThGLTjOxnnQgvfWz3zdDl2HRbP19ttIvc7c9b9QOdXtiWjGazwgTv0Gue3OPHNSK0xZJncUlgM
	Zq2AgB9PE34TCE3Mpp9ejmOcMhoimXEBiH95lAXw+LUn006f4gq1HbF5On60vS1LOCZ1pG6p/M7
	9JjlgE0abscNsObe4s61lA9UeY4sMtMp4wXLNdeSzWjT6y
X-Received: by 2002:a05:6000:310d:b0:430:ff0c:35f9 with SMTP id ffacd0b85a97d-4356a082e2dmr403974f8f.48.1768504696733;
        Thu, 15 Jan 2026 11:18:16 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:16 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:42 +0400
Subject: [PATCH 5/8] dt-bindings: sound: sophgo: add CV1800B internal DAC
 codec
MIME-Version: 1.0
Message-Id: <20260115-cv1800b-i2s-driver-v1-5-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=1672;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=DQtXugkjv8oX6MRmxxnR9guqKGpU+4+ND0DSGzuSelE=;
 b=yM+zC4fx7IIosib9wWNkVnBDpFynlEiv6ynEXZvFjIYVeO78hrI1gJgz8ZSXSXR1lUTlJNP4a
 qleFH+mRy5KCKhR5BVRssDGDyFSa0R4d9EPyWyCc2OxMY1+wN1/pcIG
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_111818_924236_3B1E6225 
X-CRM114-Status: GOOD (  10.79  )
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

Document the internal DAC audio codec integrated in the Sophgo
CV1800B SoC.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml
new file mode 100644
index 000000000000..2a35e38dc7f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-sound-dac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B internal DAC audio codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: |
+  Internal DAC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single playback DAI and is intended to be connected to an
+  I2S/TDM controller via an ASoC machine driver.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-dac
+
+  reg:
+    maxItems: 1
+    description: |
+      Register base address and size of the internal DAC codec register block.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-codec@300A000  {
+      compatible = "sophgo,cv1800b-sound-dac";
+      #sound-dai-cells = <0>;
+      reg = <0x0300A000 0x100>;
+    };
+...

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
