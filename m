Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75D5E776FC
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 03:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQLFfe+EM7Rkc3GQ13F0uSLomiECLeGbiatHlz/4w3o=; b=ond3+8m6kTu5ZM
	w5pM2Ft7HkDRkUhH6r71Z1JNLl8XGyT8i7WAcKysMMBTL0P/G4VfldU/h0XSEdwQtYnk+n4z1J26n
	7j1NpehLDAVMhoOSkh3BetUqmqP0GuirU9QafEGNl3/50csRBK5nv/jz/eSHhYITh7WQ5xDUGQnBx
	aYQbcy/NjyuG6U5tgjWC0734DCJBJU2X4Bwxf8dg0P14x6qgcKCT8VArEUErFkmEKloYPbEREDTW2
	sWNWrNvBmWlUnXyYaZHjJP0I2obU6NmCuE3mFDB70ht/6/xH44P1LxFYNu27X3rYU3XERQnyZ11P+
	yA6Qy8vSGMOuVQCHht1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWSp-00Dk13-1k;
	Tue, 03 Oct 2023 03:52:51 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWSk-00DjyI-2l
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 03:52:48 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-69335ddbe16so339719b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 20:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696305165; x=1696909965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNMR0z51QCYQRxm83f6KHDy6IPGxun19enYMfTcEza0=;
        b=XPp5WX/3qpExKz9jDhtPbep8PV3QR80sOUZKJnGAExNTKjNY3yuEIzq4xd6WITXXxO
         TZ0zpPnxVkBn14UFEuoNJavnRCKu62xLKQMQkepwj/gv3Jx98BS29h1+pqsb3+Vox6QM
         VIeMvEWrLXX6nUv8Nru+RHzLjw7F52MFy3HHHkzulCKBgAsD0V3DARaSFkkkYkFD4lHV
         0/mfG3KOiVK9dQbk7datqSkQDZ/960/LC6OXZK6KfVTiZi01rqLwAbdjhJrHWXjGXkad
         ylj6rYcxUQd9vI283Cajj2KZEyR3GCwQimp5NLVwuLcxCCuwHtteUJSW3zld3rPMDUGz
         bJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696305165; x=1696909965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNMR0z51QCYQRxm83f6KHDy6IPGxun19enYMfTcEza0=;
        b=XxSBUvkGV6J9GZXZUQmoc+Jq7zf/ObM70z/q7O8NqZd1LG1YRdioSlyUm3IJKyLgdQ
         fH01zBjtn1WpT5E2Kvh9nXVqFYhsm5dCTTxmq24uiBAjZV7L7XQyCI53CdymIo0sB/Z4
         kT+UczeiY9M9c1Qbc0zm2NHgouFjDZ5zux5eox6lKswVE9tCFzwgEfWuHzxKqLX7Mqgs
         tJ9heVmwCItru9dM4byAVPlH5aL2VV3bsgg/y8qLNNqe/3fG1/5e8SfD2CFfpZgJVZ8b
         0MOSfjKNOF/ZjABZzf0mCckIr5zmojHVv3C4Su0RpzIENRYdrlvfwsfIMsrKHoHxmohp
         hNVA==
X-Gm-Message-State: AOJu0YzwcaxPCy9abeFwYTP42qs/3ezRQk/8b6L9cXrCegotnipc6RLP
	QKmpbnznovRsAsB2E8lWW4cIcA==
X-Google-Smtp-Source: AGHT+IEXaDcHzxAlzMbKUPrZP+5G33t2w1p3iqVmidYV0CelUUVsWLM8+GU6BDI/ydkZJPXQ8ve69w==
X-Received: by 2002:a05:6a21:99a8:b0:161:76a4:4f79 with SMTP id ve40-20020a056a2199a800b0016176a44f79mr13310303pzb.23.1696305165279;
        Mon, 02 Oct 2023 20:52:45 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001bf846dd2d0sm277381plb.13.2023.10.02.20.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 20:52:44 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/6] dt-bindings: riscv: Add Zicond extension entry
Date: Tue,  3 Oct 2023 09:22:21 +0530
Message-Id: <20231003035226.1945725-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003035226.1945725-1-apatel@ventanamicro.com>
References: <20231003035226.1945725-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_205246_891629_FA0E517D 
X-CRM114-Status: UNSURE (   8.12  )
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

Add an entry for the Zicond extension to the riscv,isa-extensions property.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 36ff6749fbba..c91ab0e46648 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -218,6 +218,12 @@ properties:
             ratified in the 20191213 version of the unprivileged ISA
             specification.
 
+        - const: zicond
+          description:
+            The standard Zicond extension for conditional arithmetic and
+            conditional-select/move operations as ratified in commit 95cf1f9
+            ("Add changes requested by Ved during signoff") of riscv-zicond.
+
         - const: zicsr
           description: |
             The standard Zicsr extension for control and status register
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
