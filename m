Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDF4CDB484
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TaDDDQsFwRLIEOGWjDYdg1x9uk80zjzCD06pZw9obc4=; b=EZrRScCHIp1dQY
	CvQRSBpE8HXEOKoseDyp44rDH3pZ13nBVVoJf1Qh/HPUdNFdNTHP3YRvN1HXRiHQ9CW6p4IogheNe
	62blfGa+Vc9OK/FliaQDROw8tUonY2k2YCieikY0z0oCarg1j9SviGjiAb9NUakF2fJpggYBLo6vV
	1LdSzodf5kiPugLPhBAlc+lbdRMm4QEHCDuei815qAE7qkhVUXy7/iOv/rhxXa1jwCpa8fmmuvUVD
	MY2Vys9ZMXynxELt0JNcj38Mki+hVjrl/N1ZycjHy8G7z8gIMt9LsvgJJn1fppKXU1kY2lyRcoD3H
	LQyN/4NoQN/VrHCbHI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvX-00CNcC-2H;
	Tue, 17 Oct 2023 13:16:03 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvE-00CNBN-0q
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:47 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c52407516bso3494831fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548542; x=1698153342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtPMZdfKNirfdqr6CT25Ry/Z9PXKAMnWV/SarPOTmxE=;
        b=nbSuenBK5XZFpVVMJKf4IKLLWkJ/vRBTLrUo4tmcbzAzaYLTv+1bHdWNLAYfm7uBqc
         BjhJuhEdi1U2L4x4py8iDUmaMgixCyPz3xNvYS0iO59pSMYGcjct6KwLiLFEkEmrFY9f
         y8x0GOh5BU9crvhfdLfRx7IXYutl740GABix9IOorg2KR1NlGRSqA4cS/tIjvKHJa1e7
         SoT/v2dh9hK/YyMmbBr9osYkGOL1MAiP5R/aT+G7CsxAVqGPuQLlOtb9XzuKPIXPUfcO
         GGzXr9uf/SAF3Gs1y0QPo/IttQl9R67TkOlLoTtpbRznYPsOUNB1AOtiz4+krrqYRRSy
         htcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548542; x=1698153342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtPMZdfKNirfdqr6CT25Ry/Z9PXKAMnWV/SarPOTmxE=;
        b=ruI8eM96nEJjZNPJNq6glwTOd7KHJvFpI13gzYza8D3CY6Te/qinB+HYEnT0CHZ/7s
         1VC9Yn2Kx9iBhI2y5pbm5zY3ezrNubg9aBD5f3WzD4bYVzArnB3FkbUAw3jMiyiDcfhi
         EXV8V5vgqnAKurGoFugWZSleD/Zg6sNf4/gsvXg43Bvl0n6CA56jwzeL0ihEyydJqANE
         ewbK5xfc76HVMWJgVIf08qzySoUJ9C3iMpgm6fQn3czVDCzyVAYJ6Gpz/KnOJGXuykyF
         F4NH/5ENvalVS8G5FIez7XXa/Q1Vx93f0CJmEUsH8HS+j5ypEYCMq5Z1RUrv3YdEPaR0
         u1eA==
X-Gm-Message-State: AOJu0YxsYCGJjOVrFLmXtUXFRK/BWA6sz5vHa1cakWoBm/Bar1TDcGHb
	+KWkmrAH7zYQAf9VJg9qdxlyB068XVCeC9kzaKEwnQ==
X-Google-Smtp-Source: AGHT+IExgz+Jty8kJFWoAX6Xk7Uc1rKCCTHS2Tyfw+6sRSdA20AS2nN44InvEEqP/AyJZhlfjEW/6w==
X-Received: by 2002:a2e:8745:0:b0:2b6:cd7f:5ea8 with SMTP id q5-20020a2e8745000000b002b6cd7f5ea8mr1903128ljj.1.1697548542173;
        Tue, 17 Oct 2023 06:15:42 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:41 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 16/19] dt-bindings: riscv: add Zvfh[min] ISA extension description
Date: Tue, 17 Oct 2023 15:14:53 +0200
Message-ID: <20231017131456.2053396-17-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061544_322885_8C1C298E 
X-CRM114-Status: UNSURE (   8.53  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWRkIGRlc2NyaXB0aW9uIGZvciBadmZoW21pbl0gSVNBIGV4dGVuc2lvblsxXSB3aGljaCBjYW4g
bm93IGJlCnJlcG9ydGVkIHRocm91Z2ggaHdwcm9iZSBmb3IgdXNlcnNwYWNlIHVzYWdlLgoKTGlu
azogaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xX1l0NjBIR0FmMXIxaHg3Sm5zSXB0
dzBzcWtCZDlCUTgvdmlldyBbMV0KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgpBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25z
LnlhbWwgICAgICAgIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sCmluZGV4IGViNGM3N2IzMTlmYi4uMDc2Nzg1NjRmMTFkIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwKQEAgLTM1NCw2ICszNTQsMTggQEAgcHJvcGVydGllczoKICAgICAgICAg
ICAgIGluc3RydWN0aW9ucywgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDU2ZWQ3OTUgKCJVcGRhdGUK
ICAgICAgICAgICAgIHJpc2N2LWNyeXB0by1zcGVjLXZlY3Rvci5hZG9jIikgb2YgcmlzY3YtY3J5
cHRvLgogCisgICAgICAgIC0gY29uc3Q6IHp2ZmgKKyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAg
ICAgICAgICAgIFRoZSBzdGFuZGFyZCBadmZoIGV4dGVuc2lvbiBmb3IgdmVjdG9yZWQgaGFsZi1w
cmVjaXNpb24KKyAgICAgICAgICAgIGZsb2F0aW5nLXBvaW50IGluc3RydWN0aW9ucywgYXMgcmF0
aWZpZWQgaW4gY29tbWl0IGUyY2NkMDUKKyAgICAgICAgICAgICgiUmVtb3ZlIGRyYWZ0IHdhcm5p
bmdzIGZyb20gWnZmaFttaW5dIikgb2YgcmlzY3Ytdi1zcGVjLgorCisgICAgICAgIC0gY29uc3Q6
IHp2ZmhtaW4KKyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFy
ZCBadmZobWluIGV4dGVuc2lvbiBmb3IgdmVjdG9yZWQgbWluaW1hbCBoYWxmLXByZWNpc2lvbgor
ICAgICAgICAgICAgZmxvYXRpbmctcG9pbnQgaW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBj
b21taXQgZTJjY2QwNQorICAgICAgICAgICAgKCJSZW1vdmUgZHJhZnQgd2FybmluZ3MgZnJvbSBa
dmZoW21pbl0iKSBvZiByaXNjdi12LXNwZWMuCisKICAgICAgICAgLSBjb25zdDogenZrYgogICAg
ICAgICAgIGRlc2NyaXB0aW9uOgogICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFp2a2IgZXh0ZW5z
aW9uIGZvciB2ZWN0b3IgY3J5cHRvZ3JhcGh5IGJpdC1tYW5pcHVsYXRpb24KLS0gCjIuNDIuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
