Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B88D3B7D5
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfAfhcDvShn+8pvdH5M0zyIhHPLs78DjD5SNU2k9J6M=; b=fHMBAVQP/ZbVmp
	QvaMxmaBFD6WQn4bg4DkixK8EcUKtjcSVQzuOf4HDbq5K6+GU4J9RWMdXa8Eic+B9Ep4jfloXuEEL
	j+YOs9YJZBkSG386chDcYt45VHe+HEZRnrO3qad4HeI1Fk+HpwTCTQ6cj6ulcZxd9yVNmdwJhQqjA
	nnDaJYRpYyDbwJo2GhhGs8HCF+j2pxKyUTKmbgOQDHM2g6fawuE+bW8BKh3MmIwZSjBr16fZnGh+S
	2vTIxCnEt8J+3ZD2QQ8041jjcOohwt/QeWJ+lN17qZZ6I71FxR4xmFPbxSQytaspYR7DIuhe3O7FJ
	U65ZMCLokKO+5P0KKRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRsbe-0000000AwnB-0FVD;
	Sat, 06 Dec 2025 13:45:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRsbc-0000000Awlm-0evI
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 13:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765028747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7PpSxu0uoTQw/bfHDFduC0nyICCWSnMwL2fSnPGX/mU=;
	b=EUJqHy2KleUe1E8evok4WiU6YXa9jAm3Hfxcm0L5u8XkMSsOQ8MEsDYr6oOjzrj5o9wVR7
	UVIY5Zn7mLNHPjJ1Gvanj8t5qzbb8uFSRL1sE9braECymu7RNKqL06bgqcGGpXm2683bzQ
	Cntv4kZrd/iuH001VDdydupf9ZJdg20=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-pQiFtNDvNfmmw13O7LSj3A-1; Sat, 06 Dec 2025 08:45:45 -0500
X-MC-Unique: pQiFtNDvNfmmw13O7LSj3A-1
X-Mimecast-MFC-AGG-ID: pQiFtNDvNfmmw13O7LSj3A_1765028744
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42b487cda00so1695741f8f.3
        for <linux-riscv@lists.infradead.org>; Sat, 06 Dec 2025 05:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765028744; x=1765633544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7PpSxu0uoTQw/bfHDFduC0nyICCWSnMwL2fSnPGX/mU=;
        b=o86hB3D2mssomu1NsRMk7wQ7jMW/sKz5fz8wOlOvtaVlF24z+Y3x2u08BW+Sc1ZwOI
         biTvn3wiGbew73UeTS5Wq0qQdwcJ06wWesslef9tEA0pq3cDrHu8tZ2+xlttgeKZ6OLK
         VADEHs1CCHffwDkw/Rvvi0QIz0iza+h8wR17zxGqm9FPRrNGM4A52l73Las7re7zEfLF
         ObnWmcOGwzsYEPuUaOkwqTOrGFre3SQgIYvjVSkAZS4qJNTPYUJ6it5Z9TVnkshKwQNH
         Sct/zFpQ/7lJdLUtDVXczTRHsTBrxoYKls7lpeDQyfnJKu7Dru0B966LHUTqMuQEa1R2
         81Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWPxoJdbEiDbiUYsdMr3a+9nk6CDEFKBh0Tuu9oBcyyhqzOqBHRovfrB2hEQ+7W4/xQs5IjlUHb8mDGXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YymoH4gMRXMnaGqauPI9FrkDwXzInb6btfDalKfkLEd/G3oXkTW
	uybn9XJ7vgekWreVQWApj/ns5Ikr6TPmhysM3QV/tsc+QpxSsTjLEnqgjkWjbUk+Q3z5P1hM751
	iMgrCgQpzl5qhuQM7bGn5AdjQivucdT2woa2jd9RMMuoz6XMfI1xS6nUXlkvs8KXsJavZdw==
X-Gm-Gg: ASbGncuKFjr05F5QbNfk8vRdoQgVVbXNDS1YxQuwJUJ+uzW3xPQQujVdgwZMuNWZA3l
	V1dtSTTm9jUFwPAJqYbdkU3JOy3ubcw/n53yFOPJ3xpRFHj4Qm1XPJmQivoDJo5gbW5pXhfOHjY
	GNFgKYEu14jW9owXmeQCkDrEOrn6tH0Ego+cLDLmFNkrBmhydTKttGlx5xTj+Rh6vS6Sc2g3LN7
	kgTAo7R41LpRJk4qHRbdRCKRIOh3Q0YsqzfCU0RklQHz+wm8HBPBvvvgcQAm5GkQtTb4ur3eDSs
	UA37PLaoSy+9MgdBj53bFtUfUUoWZZgOBNB7QCSYkwx+m9/MrNpKH30fdJL6rq+pLRreRd+63Jb
	UUJjTlb2GOCaR1nVVbGhgUwFo5jTheWRMRXA=
X-Received: by 2002:a05:6000:208a:b0:42b:3afa:5e1d with SMTP id ffacd0b85a97d-42f89f0e1f6mr2491539f8f.20.1765028743895;
        Sat, 06 Dec 2025 05:45:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjfQ9aaQ81hkEvl/6jCgpaRsHR00kuYXGCail9JraZcQS5ddTMpKEXXaLIqt5hbjfEo6K8hQ==
X-Received: by 2002:a05:6000:208a:b0:42b:3afa:5e1d with SMTP id ffacd0b85a97d-42f89f0e1f6mr2491511f8f.20.1765028743424;
        Sat, 06 Dec 2025 05:45:43 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfee5bsm14698899f8f.16.2025.12.06.05.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 05:45:42 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Alex Elder <elder@riscstar.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 2/3] riscv: dts: spacemit: Define fixed regulators for Milk-V Jupiter
Date: Sat,  6 Dec 2025 14:44:54 +0100
Message-ID: <20251206134532.1741648-3-javierm@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206134532.1741648-1-javierm@redhat.com>
References: <20251206134532.1741648-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SUr2FX3GtVfyE5IfgjGsdOmrLnwSFplcb0WgVHDIBHQ_1765028744
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_054548_263362_752CEC61 
X-CRM114-Status: UNSURE (   9.25  )
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

Define the DC power input and the 4v power as fixed regulator supplies.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index aa425f02c1f4..5babed4d7094 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -20,6 +20,25 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &eth0 {
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
