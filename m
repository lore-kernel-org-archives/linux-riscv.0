Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D07D6D230
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97S6IkNgxdYDL0kY4shvXNA1QOaxgZkf2BURW4jNbaQ=; b=AulJ1IFEDxAvXD
	58bsj5uP2ZLmfCKXB2jWwB2NFe+UfMnP5g9A4wwkuxvDWwOapXuUjJoKNi5QCTKHDp8Ce/Mne6C7+
	nzCtc7rjhMnl0U0772HZgUaih09Oe3YMQl9DoHyLxnfjJestqLjUDHDXzOc070OiuesftDaLN7EjI
	TMDlNx0Q6744/A13secAKJn2bNXXTHN5VDKszwVaR3KxwXiiKlMw70u/Ir9YYo+76+93CdFcdxJQO
	EmDY+T8c1jzfLJF184GnEnfv1eDb0RFsga+k01B18Sd2w3zCUZlKQaZ7vk1nqPPtzrvVHSZNSJOB5
	GtWFUwvrHqeXxITlDjfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFgQ-00000008fGx-37iD;
	Thu, 18 Dec 2025 15:12:50 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFgN-00000008fD1-0XGz
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 15:12:48 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8804f1bd6a7so7514636d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 07:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766070766; x=1766675566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrbGzwoMT9Ducrx+C40YCeeXZtuMUvm1QSQu39eFix8=;
        b=ZSd+vPNvQIwfkbEnjcHlIhGoirvZAGzCA9yXy0IEnkiywzKikx9TQF32SRCu2N6rWO
         QJGJQ4r64COLI6zE+xgdRq4lUfpKnoAJNEp1AhfWWnn0cJdC5sRhDgXIwYchoBrJeflb
         Yiyydo5EEeWKKEo8YHCmVgAaP95ne/k/01ruQbA39iGMg2nz01qf8+h5F83wCJ2Lbdov
         9cv3N+asXRI4zwkFEyCmWZ3dQutS4mhZK/J2k8eU//5eupVqEWvwXqyCUqW1l4RM9nHe
         ENXZp0Z+pSQJZuPEHTsZLilBspsF/RPYqr8/7gS2OkZ+LkN+LDpp04717QZpAKtQMRw9
         JwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070766; x=1766675566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UrbGzwoMT9Ducrx+C40YCeeXZtuMUvm1QSQu39eFix8=;
        b=De6fiXgCBx2hhZ9QHXZulxlQXhbaeLezfNVg4AoEqvMpKKNG0i2e9xT6dU7FISwJjH
         rAIXLTvWWLvcRtLKoqltm2vrgHeyigLD5lezP3W014IdsIXKTjIpoDrI1+kN4GGPkRRE
         uYxiPmxqQUdPVsF9zN38nUkUAxKYo4+fyITRcHhPa3Y2nN05rVRQovr/42+O/iqNet+N
         6tv6Kvj60ONS52mLxuQMZ0v6VaQ6FP3Azt7CWQG1dGK/3hsO1HEb6evZyp+cPW6GkWDb
         XvdkwJZMJ4dF+VKE4eT8ihtsAVxv6jffkNoXPkSbkpFpBgl02//fD4eeutDJWle30T7b
         dSdw==
X-Forwarded-Encrypted: i=1; AJvYcCVEaW8bgj/Dpxw4m1NyhctS2cvGrkNpfbzNfwfN/uH5ajfpH+7b6KHkKnkLhkRxQ1u7e0jcTBk1xmup6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvr9hO2A536Z5B3b6PKsMQD8dlXM/Gl9EgPhEKLOlTiBKsWtER
	eG/rOIWWm5mYg1E+ugtjHaVs6ohRX9XqDJNZ+nw0nzpzixoK4OAekjCB3EsIoGie244=
X-Gm-Gg: AY/fxX6WqixX4VdZ5q3t9Hhm1YSowb/cm188E+GqpEJ3Bgmn8S0pdm33rZaR6XQMbhM
	3EVgJu2UxQqXkyOUPuBHIeqWPGTErRl2jdTDQHrO2V/WfcZnHHfDB11Y71z53Nz85Qs/wPEZVKL
	ilJmHTrvK3G4Prunv3kTw38LCgCMzaxG5AkSoV/l9nMfaQLgQTYZlZAq3VhvBp1/sXLw7rJEkSf
	iPd71GBE2jvtIf+p2spIa5G9VRPeoWZtkNtftgTLN+wUdxfXxRNvwC0vygKYaYUqi4OqPrSr6xP
	rf4mbuObVltDqJ9tTQp4QraaYQj9QgJY4GMekToirYTS1sepGZCkI9xY12aTuVMsvLP9VyLzrdj
	MzHNsFaUP98d6JJWvPCAsvaYIRaLFHtzbUfA3AYlpmmDOPVkrKdSPzjyv2CeAGjgP0CmY/KyoXH
	kBbAddBetwWHNjja+e4W4E1b0sWd2NETSbxu9JWTjuF81IBwPBa5sO0a4+88XTCsYn
X-Google-Smtp-Source: AGHT+IERRhvykRpFylfwji2IOQvYUcPVAffeIot0RaCQgPjegE4XUR5NaxLoYPi/HSBk+K0ZcroidQ==
X-Received: by 2002:a05:6214:14ae:b0:888:7c7e:fce1 with SMTP id 6a1803df08f44-8887e1e9bd8mr237057126d6.4.1766070765721;
        Thu, 18 Dec 2025 07:12:45 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeb5d6952sm186866985a.3.2025.12.18.07.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:12:45 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/5] riscv: dts: spacemit: Add a PCIe regulator
Date: Thu, 18 Dec 2025 09:12:30 -0600
Message-ID: <20251218151235.454997-5-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251218151235.454997-1-elder@riscstar.com>
References: <20251218151235.454997-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_071247_175721_4DD10A1D 
X-CRM114-Status: UNSURE (   8.50  )
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

Define a 3.3v fixed voltage regulator to be used by PCIe on the
Banana Pi BPI-F3.  On this platform, this regulator is always on.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 02f218a16318e..71f48454ba47c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -33,6 +33,14 @@ led1 {
 		};
 	};
 
+	pcie_vcc_3v3: pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_dc_in: dc-in-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "dc_in_12v";
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
