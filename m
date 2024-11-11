Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896ADD12D72
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 06:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+5vCalCM75F19s8KI5XOs3FwqPaacutGwJak0dxoxs=; b=sI4LmHBcGZ66UE
	RSUZfwUs/1FBRzOh/P9rksHEQrgA85k2WMaXykq2jseFXqqysMjMFABN3wNPLgDS3D9D+drOjUcKN
	7RCyzyw0yIbpaUjWHlCNc7nJ67phmiZmL2soK1eCHMBYz9VcEXGaKcDefV3K5SHC+SeCCnGU1je+L
	ofNhe27opTp8souInZ4ZWD84OsMzWBhd7fGI+qny8u6WlKqFOg84mWpaMVQwLn+SdI1riliwlAEjG
	1+Z852IJ62L2wYIhqb+bS9K9tQyj8NXMwbs+gOJZR7AUPe42kLezQ4l+wgQObH7BkaIPDUOr5BatA
	eZ4fi4XO2pYF6kH79orw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tANTR-0000000GRBB-17Bp;
	Mon, 11 Nov 2024 06:00:29 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tANTM-0000000GR8O-3q45
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 06:00:27 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-71808b6246bso2338164a34.2
        for <linux-riscv@lists.infradead.org>; Sun, 10 Nov 2024 22:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731304824; x=1731909624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HB3qPjMrBpNHrB9kYUUmbwc232oS7W4EAFSAt7K/O60=;
        b=ArfXwSy77wOzrkwW8ivizM41vytx5pjrw9hN9Qy5S6ZzdRvY1FnFWF2X7wDjcuOaeD
         t7DrhCzck3saI++TNUcSGQhtBxgzbJB1DLGgv1gzMrAPKXpAp4UwhjsIlxKqZXcKIT9M
         2oQ221w0woDRuJQzaHX+q1XMHSuhZNPK7qRP+TYbvM9lnSvC7LwLEjf22qItGbHbtZzq
         jH6K5plJtA2JMYb/+LBT3suBGrmXRATFn+sAl98PzVQ1OqCfHOY93oZihC0s7T0OcG8/
         wtIoJKpaAxd5yteKpa1voSfwLNvlZhO0Mo2xQhemb8Csw2gQhci+xiJec5j8ubNicKCX
         IvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731304824; x=1731909624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HB3qPjMrBpNHrB9kYUUmbwc232oS7W4EAFSAt7K/O60=;
        b=GJDfprhhFM2syAP2aIAOp5o8rBe0ZNw2LMJYPaLcFZ/WyUZGOKkkAWJMYawCJ3zSqU
         9RXgVWLIFN21dJuoUjGsGTkgeUIDcKZ6yDY/9XD0MK90nWdax+Lmw4viw1Uq1TeoVw/a
         bIEwPAeW5fP5gTyRVdZASeShDIqTHZ+1TwO+8k7AFJc5by8R1EcA1jDC8jLUbgmu8SMl
         HA2VJBdD1tKoxPgHkwe+axv0/sJpyKxtMNL6S2TLKXOHTx7Y4efuWkuTzGeKLmLGgXko
         HjvpI0saQx7iCa7LMzgVoxm3YknmXBlU9VavvCDsrxFxXj78ndd+Zy05t+FpV820IiUe
         2pTw==
X-Forwarded-Encrypted: i=1; AJvYcCXT23ayzY+FRrKNaD4EYPISVm8v35BbKlzJDDZ7YR18nktb3yAwcJTxDtGHJHyF+duGO3C3yB617GbdOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlVS6sDcRyX2yj0LU11fGyND1eB/9sE6Lrd2ixp0HBQAlaJluk
	wBHN3xLXfwhJoLoZqnL/zqcSBU44PkVngRsaPvNcgTYoPuoIAxTc
X-Google-Smtp-Source: AGHT+IHlyAOfWAKE5ev2UjvU1fNznXmdq+01HKo2SJuPfm+QU62k9qG+BkGkD8K2V8IYTqwnw4le0w==
X-Received: by 2002:a05:6830:631a:b0:718:bdd:d1d8 with SMTP id 46e09a7af769-71a1c1fc074mr9175544a34.8.1731304823786;
        Sun, 10 Nov 2024 22:00:23 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a10920002sm2116864a34.65.2024.11.10.22.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 22:00:22 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: kw@linux.com,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbrobinson@gmail.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 3/5] dt-bindings: mfd: syscon: Add sg2042 pcie ctrl compatible
Date: Mon, 11 Nov 2024 14:00:15 +0800
Message-Id: <4f030066767c2a3b3acabe24e3dfbb8d87b42bfe.1731303328.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731303328.git.unicorn_wang@outlook.com>
References: <cover.1731303328.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_220025_023764_76E38451 
X-CRM114-Status: UNSURE (   8.26  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Document SOPHGO SG2042 compatible for PCIe control registers.
These registers are shared by pcie controller nodes.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index cc9b17ad69f2..55f919690001 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -106,6 +106,7 @@ select:
           - rockchip,rk3576-qos
           - rockchip,rk3588-qos
           - rockchip,rv1126-qos
+          - sophgo,sg2042-pcie-ctrl
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
@@ -203,6 +204,7 @@ properties:
           - rockchip,rk3576-qos
           - rockchip,rk3588-qos
           - rockchip,rv1126-qos
+          - sophgo,sg2042-pcie-ctrl
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
