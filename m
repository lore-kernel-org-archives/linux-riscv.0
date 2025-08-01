Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4C0C87FCB
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 07:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6KarqyAXuSQRtxiEYldTZHrVd8S7Z+hDbI0ZwKqKVeU=; b=fY7QdCOAjDu3+0
	G7mCdIxam41G1l2nUkgtQiySIg+MxIBdLfww0NUAkqBLO4acj+mviTXyKsPzNXYpETg6ezs0k6qtc
	VKnV5wITTrW5Abq6NJIoWIVHrFcRXD/zoWCOO1tIv03vNJGbVJulTPGz2lScwP9iEXfgPBQ/Ai2w/
	yNUBn5kSyeFajYaFRbQxESEeUUT1sRBkLCj9C1u2GXObaK4IRIaPUA8qoHttgGQyN9o9Sc65rkpyj
	3EN/NO7yT8rKM6yeAbiDTgI4ADoOlVvwG4wmCIez+WZYefpKZA0uWBiRjrIIy7fb1/nKRiq4CG8XM
	beqAlukFsvoO4eUXPadw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhjmA-000000055sI-0Lqa;
	Fri, 01 Aug 2025 07:01:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhjm7-000000055rp-1jEV
	for linux-riscv@lists.infradead.org;
	Fri, 01 Aug 2025 07:01:56 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-76a3818eb9bso489759b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Aug 2025 00:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1754031714; x=1754636514; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1QL6HLqz3BETHlGyW0GKYu0gTqBWZzWd0eO80if9fo=;
        b=mucPrsEQse8DZM/47Pachmape1wWa4rs8SvUJAkFRzodaXhodFDViTvzNgWZt+XAFf
         JMX0v5jR/BRug2+qwoOu3gS2Q9X/C/cSnm++KKuJOhdJpyuhU1EiDKbgcrh8fytQsp5+
         qYsedUDg4QUa74Un0iS7DQRfMMFhQ6+D1oykGLKvD9/Hi9cd9cLxluc4tkUUOxmmYIuW
         xquCGSuPhiIfg5J4zt45K7qm9qkpf1fWFVLsQxV1zxFtcs9VtX49w3+lpq5J8+qiCcHV
         VQkUMigXyGv41JF5ZqeQDhUeHCj01vPwS4/yHVzTd6WxsgLOodtLDXmK8WHGyDLKwfbr
         yZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754031714; x=1754636514;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1QL6HLqz3BETHlGyW0GKYu0gTqBWZzWd0eO80if9fo=;
        b=A7iP9XoC+T0/2EzatvoKXMK2aR7EkjXAw6uWVubQYhu7DhOc4S+XS+wINBx+fPmGGw
         t1FFxNDvOnFf6RzU+gT2aDvD9Sowo/ZtaLNERVchV4atRczrKmbhdtxjWSjgvFAYbVTB
         qRLTcGQtE7nh3l++4ZtNhpaC7oqyxvefgonN+rsQx6kKL+lKu34Sr2r4ZbihMkdcUwVN
         kU5Z2T8WavoZO2sDiOVWZFtGhUl1xLhz+V628fyTmAWkynJGzahK98dVu2KaT8ipCl66
         B8r1HsHHbkSG8v6DoVHxmPJSxXiHYXTHLJ9V+07N0kBCvwl4sgQqt9lrPTU9j8LMNifJ
         R8yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLy8E4+w76/2NzKpCkdpWzK0U2CzQBRc7hhOxFKwTocOVjvUjzRSB7pnFjdDpgQjO6sfa/q+T0JZ2fwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHOaZr6gqTHk0rBJtROAR57XdTx6aFpvTQfWcfTBZR83Js7wne
	0nFWQTItkQWtwxW4oNZ1wzdk6QvvgkGpRActuFTC2S2hzX9bZjp5Ey9+Uks69H17VaobhaYJBqZ
	n281VjjU=
X-Gm-Gg: ASbGnctY5FYErCpLm+EDCueUgEpRveYB9d7LYL576IHW/HTG4hBbGnl5S5/FyyFUK8J
	ALgWCZuPkj/gcm5P010iabFsQESkhr5zn0VaCJofGAJ1zal6iJPAgXk6O+2JTQMW4WSfELWzW3K
	48j/sTCNd0iW/kRoUwH4/3K6bTmWapXwLj8Yjyx2tI3QGqYEfbDjUBdxYdWOh8Hy9zjZ6pZxpKp
	iKRq5RpjcggEcM74e8ZOCymtcplsZ0aBFsQndSY/uSA45S6wnhIRp2LHYEKUc+ScW/T48ABKqu5
	2WM+NiAwyIDYJd9Ai9YBaIrJ9cj+ZaebXcodDQC1E5SXqFudcpVh/2/zpZqDO18v6sCdbdNbUJ9
	roMCcW2ZI66VQdwxNLvOMcd5a0eNn1Ef2rkaEY1CAzCX+
X-Google-Smtp-Source: AGHT+IGU9ZLun3YXbKoCUx9QZlnwzO5u9ujah9aC8iWcLVseEem42XMHKR5EamUm8BPPO2QR3/wwVQ==
X-Received: by 2002:a05:6a20:a104:b0:220:82c7:309c with SMTP id adf61e73a8af0-23dc0d2c094mr18053041637.7.1754031714232;
        Fri, 01 Aug 2025 00:01:54 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd1a7sm3319043b3a.73.2025.08.01.00.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 00:01:53 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: conor@kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nick Hu <nick.hu@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2] dt-bindings: riscv: Add SiFive vendor extensions description
Date: Fri,  1 Aug 2025 15:01:12 +0800
Message-Id: <20250801070112.12071-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_000155_480224_B0E1D6C0 
X-CRM114-Status: UNSURE (   9.28  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add description for SiFive vendor extensions "xsfcflushdlone",
"xsfpgflushdlone" and "xsfcease". This is used in the SBI
implementation [1].

[1] https://lore.kernel.org/opensbi/20250708074940.10904-1-nick.hu@sifive.com/

Changes in v2:
- Update the message to indicate the user of the extensions.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 .../devicetree/bindings/riscv/extensions.yaml  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ede6a58ccf53..5638297759df 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -663,6 +663,24 @@ properties:
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
         # SiFive
+        - const: xsfcease
+          description:
+            SiFive CEASE Instruction Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/freedom-u740-c000-manual
+
+        - const: xsfcflushdlone
+          description:
+            SiFive L1D Cache Flush Instruction Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/freedom-u740-c000-manual
+
+        - const: xsfpgflushdlone
+          description:
+            SiFive PGFLUSH Instruction Extensions for the power management. The
+            CPU will flush the L1D and enter the cease state after executing
+            the instruction.
+
         - const: xsfvqmaccdod
           description:
             SiFive Int8 Matrix Multiplication Extensions Specification.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
