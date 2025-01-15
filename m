Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BA2C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 07:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QYxB2G9Bcq4NsmnuTqO+9ov8y1w1hzUrPxjGH+6lj1c=; b=ldb6Sjia+VG61o
	c5rvRLNf4LOEN2Qr5FInLi8Er5Mo61KfA+yyr+5nuRFFtV1M990h8bglchvrENBgyPie0joTKLc/5
	pPI0EBtZx6SLYxrqOsTEwKwW1SCEP8H3SAgJOYR4fG5Qlyuup+Ro/Zhw5w2tn9CKxVjhMUvKWYHNJ
	EA+EuJuBIfm0cyO1I+Wv5veSw0EsVsC9HSyOBIe/hdD3L6sTilgye1gXWzameczMmk5GgNvswAYOK
	znc+SIYGO6NiHD7mBzAxVnKUJj3jmhz5Y4eNCdlpvUOwOHR/pSUecVEQRRxPwEN6VhiwGbzu9zrbT
	eBJbk7XuAeEHgMqqZJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxWZ-0000000Au4k-0ozJ;
	Wed, 15 Jan 2025 07:09:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxVW-0000000Atqr-0gyW
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Jan 2025 07:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=Sywd5ibf/76z5+rkZ7ijeWmGFF2MBuEBBfOcYOD/r6A=; b=jqltuF9zCJUp35NpaAmIikcy06
	UAxwI4UVgUorGhMPwbGXDjRy+rWFMNGwVsBbBf5Wcrsr3a+joeuL/Zg3ZZsTyMEcoYYrzhIslGi/w
	0wvMCXWLAc/rEfotYzpXTOsY25icdQ0l0YXJdITm4QNmgPBAd0+/ubfxanTB/VoEpEqRoEMIfg+fi
	2EcrJ3XutAmwN4t+YueIv/oTURE7BstXf/JovftfqVnFTNoq0IRl+YwCIi9Mt0ZRX7mr+gVOhBBh2
	fdxn3md6wdTFCv7QUVUdYO22PYRTDtHIkdoeODYaRdtTq1ZNeF/RzYIyuWOoh7EELOVbJjdZbsrWY
	t2y1pvKQ==;
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxVT-0000000AnIj-1GF4
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 07:08:04 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-71e2766994bso3216886a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 23:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736924880; x=1737529680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sywd5ibf/76z5+rkZ7ijeWmGFF2MBuEBBfOcYOD/r6A=;
        b=N5oA3lvRxjr+LqvFMx+mVCB2bKWz5/VrexAIuI2ug69u4lsjGt7TbwfM+qMwkk/aKO
         Z0ChRenZXMYjomlx7Azq7bp2xIUvRSYHye/eQX4mk0sh5D1e6aFSKPtSotksTl9W3uRU
         I2HaywuI03W67PpfseXD2LD/oqKo+tbnyPGLsgblVYOH+88JqOtCM2neGyoBATDRVDN2
         RJF7EzdN3BoW9jPGE7TMiFK+5eBod0pdYIARHktC8WIQLvDz5QWE4oFMo5LMuGZ4ZwQl
         FiIsCbOB9ViYu0dsknbHdn/qonG8E6SFTdz6gOkZpCD2EwNJNIxAHUn9ihOHppH30tsO
         2ngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924880; x=1737529680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sywd5ibf/76z5+rkZ7ijeWmGFF2MBuEBBfOcYOD/r6A=;
        b=JknkqieTYfEeNhLdTovhW/fkKeU94FoAcP/regLFAgN67NPn0k8lnnWMVEitv5j1tc
         snE5iZ/XjCuYFNMyiPtW+KZu4G/TjT64t4oiLhkNgAH2hNw/oml0gQMpkI7esVm2jlty
         OvWmEZEY8b2Ya4tw8aRp+CpZZxm2EDjUWF6OgzU3kJYxwY40oc0Na0b6nnOeAIsFnYKq
         /3MmjSZT5q+Fx3boFTZM/VTCuMiQOjOyCVgc9ejQ+BsFE/HSihxA4a096OvBl13I4IM9
         5aAVUYBXRPBu0ceeXlSpSo7joBAeAHWs+tKP62cRVH/z4AGe+0ncRC0hSz+DzXe+34Qh
         qZew==
X-Forwarded-Encrypted: i=1; AJvYcCU6TrvN7fWKCSp2oRu6vgDl9v0x4Wgx+J7u8IvV20LqJVLlhUqiMOZv3PQOY4Z2xD5hoirclMkZkr27sQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAGJe+Bj4aybW3ockS3iNxNvXo0I6cAanm9fmnd48ZWPCeNPiK
	pS8yRsjnz/jWewwBZQ3+qO/USsMTOlMsybWl5O/IWGD87kk2GYnC
X-Gm-Gg: ASbGncvo77kLysBHArSunpwTr/IK3g2iAbB7VsOyPKeyMUXm0moO/5aoK/n19e+oIRq
	TZDLBMSgYTtSL/iiBHpeehwxghQqJDhTshJ/oVD7eVAyD4dvZxAGF6ytCbSzHJnGnpYdMH/Kbe9
	Cb86J22ntAAkmmJzbe+h2s7lcNkDe3BUvRkUe21Ku6e78ZSbG0wnOjVJn/HfF5Ukpnet7x8A1ZC
	YiXvVHY4v2eehv3afSNw2+aQx4T3E2iaXcBC/C3Y7W+GDacvK6rjy+N/1JQCzOVe1s=
X-Google-Smtp-Source: AGHT+IGnl0S3Vd8pXkdIN3HJE5SIE22G/XRqd7+QGJZecFn/BIUmK5lpK0e90tA5t6cvwvK4WGpw4g==
X-Received: by 2002:a05:6830:670f:b0:71d:6543:e83f with SMTP id 46e09a7af769-721e2e2e8f8mr16534130a34.11.1736924880145;
        Tue, 14 Jan 2025 23:08:00 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72318538401sm5407820a34.7.2025.01.14.23.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:07:59 -0800 (PST)
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
	fengchun.li@sophgo.com,
	helgaas@kernel.org
Subject: [PATCH v3 5/5] riscv: sophgo: dts: enable pcie for PioneerBox
Date: Wed, 15 Jan 2025 15:07:50 +0800
Message-Id: <eb2e8c619a4dd53f9bb1aa33add4f85d4ffa7d79.1736923025.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736923025.git.unicorn_wang@outlook.com>
References: <cover.1736923025.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_070803_390497_750B8CA4 
X-CRM114-Status: UNSURE (   7.84  )
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

Enable pcie controllers for PioneerBox, which uses SG2042 SoC.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index be596d01ff8d..e63445cc7d18 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -60,6 +60,18 @@ mcu: syscon@17 {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc1 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
 &sd {
 	bus-width = <4>;
 	no-sdio;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
