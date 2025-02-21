Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813D5C021B8
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpVytkROoQ8KLEo5D8s+IvnezSvzbcCbkVQipzKtc1E=; b=1nIaig6+3yrtRv
	lVrftD/xU34ZU0AjIN15G72iICfg0G2EjW6pULEoiTxbh7+oR1aY9d6Fzc4mRlRlZH1i2bVfc9yJ7
	g1X2z8rXCeUDAJWUoiIz5NsWqvYNNZfVT8FuGvpe6rfOKM2jLlg3ZHAJjkIvOWo00W/KYXsw3buvh
	JDDgJSj//7R1yv8DqaB4PlEitD64eGCVWkIafxwBFYTISjsGk3teBaKO6c7F96fd8dJgJVQFjpNV/
	XYVfI2z3oRyceYh845gIB7jm7MqTRRZsoWBUosV62ti2xhXqAWKEb3UG1wsuTqExgXaxw//dawKBK
	0jMQZ8FBZgv4vR6nmelA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUTB-00000005u0z-32CH;
	Fri, 21 Feb 2025 14:57:37 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUT6-00000005twg-2VAQ
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 14:57:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1145426f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 06:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740149851; x=1740754651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvHP2BboCGauKM0TvBqQfBu7j1TlN9OaRIMMc+Vl6gA=;
        b=Kiy9KWC3DSHTr9BmhC0B22Rsx3KhjmlFCwc5cicHFWVIe9v3rrHu/o83dYWEzdrCJa
         f8cLVSuDYowmEMWlbYgzHSQPe8WITRXs8CPrRsYRap6vMRGbJcuDSuoBLDcVFrz0dVTK
         bl4hJ3qqBETZ84xfezI54Hy0IGqykGoYVnPQ4oX1Er65PkqKcX7U2HvXApNiuuRKE6mY
         mClqclajEy/y1V+6ap9WglqSdf9bjb+89DrDJSgNZdNLzVGcHrISHvwulIB9GDywdW69
         F9O1h/zW5ilcGu8ErknJ8HvdFMG4T0U+EcJdVIJ6D9bV+fZQf5aVLW33sEc+y2pe0CMX
         qSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149851; x=1740754651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvHP2BboCGauKM0TvBqQfBu7j1TlN9OaRIMMc+Vl6gA=;
        b=EJUdhNz7RO3V+XlIJ+9WeLDGS1j78Aen7s1SHts2dVuPjyuBlQMH7LXke5cl3TcoGp
         mQMARHIpzXeNiyMUvVXMnq0vvnYfTnS6A5BuvqYW/Xk5DJ/utXYfrnDe1NrkyoKSVCnM
         w3kp6LsMCSV9JZBwmGDL05T/L1fSxInA5pKZ0R3iqsiaq3o8O4v4C/M9C1KOv+w1Oflr
         oq8XjFNYTVYdsm0aKK5RB7HgjO6BtBiEn9n/8qa+yv7hnpq/4WLDxaOclEakLkG/MDp5
         zW4M9xWrSmgNMRGnhZxl9zRQVrttzpC6JCkuh5mMnsZ8QtnuTF5vGNbOHpSuI6P5k4hQ
         VJcA==
X-Gm-Message-State: AOJu0Yy27+dio5fTjDXbql9bM15ofv4SHExryf+ZSs0Jjm/I+18z/pOx
	gDAD2v5kiKTosiSzc6aOckA+8F28uKJDojUy1sqQIccn5a3u3quQDew0vcjC/ryd9frARbYJL4u
	/
X-Gm-Gg: ASbGnctJLGniIXEjg+fiV5GAO1QdNVjrYdmoYv/gKbPyDApISyDZISLTqsBDqXKHXEi
	EyM+aJDfn52328R590B9UJnF3xOHA2W6KQ3PQ5kUhCwjZbpJK2rbvt/2Ok0mDSVrzlNjn1aMmtm
	bEhes460gRgXqm2g+VP0in7fxFX0vTmaxxjJv0MdA6TfWLLx3SHZCo7R0nj47nwrhd7T5lU/+JB
	DVJoBKz2Ay+OHPk80j86wgFTX1kOyrIeAkNlSMhZ0yLOo5t0YU8tW8yeeXHtHIZbdPMKR0wl+fg
	yB3GcgaJAUhNcA==
X-Google-Smtp-Source: AGHT+IHcoDd+Wx7yCfHbXvCGdFs5uIccGxXcfrSZqLhmSwNHn36B0PnuR7cIJZPeqdU6yBBLobUiMA==
X-Received: by 2002:a05:6000:1a8c:b0:38f:2113:fba0 with SMTP id ffacd0b85a97d-38f6f0c3acfmr3393343f8f.50.1740149850872;
        Fri, 21 Feb 2025 06:57:30 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02d6974sm19479585e9.14.2025.02.21.06.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:57:30 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net
Subject: [PATCH v2 8/8] Documentation/kernel-parameters: Add riscv unaligned speed parameters
Date: Fri, 21 Feb 2025 15:57:27 +0100
Message-ID: <20250221145718.115076-18-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221145718.115076-10-ajones@ventanamicro.com>
References: <20250221145718.115076-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_065732_632630_1641FA02 
X-CRM114-Status: UNSURE (   8.31  )
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

Document riscv parameters used to select scalar and vector unaligned
access speeds.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb8752b42ec8..9e3c5fecfa52 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7477,6 +7477,22 @@
 			Note that genuine overcurrent events won't be
 			reported either.
 
+	unaligned_scalar_speed=
+			[RISCV]
+			Format: {slow | fast | unsupported}
+			Allow skipping scalar unaligned access speed tests. This
+			is useful for testing alternative code paths and to skip
+			the tests in environments where they run too slowly. All
+			CPUs must have the same scalar unaligned access speed.
+
+	unaligned_vector_speed=
+			[RISCV]
+			Format: {slow | fast | unsupported}
+			Allow skipping vector unaligned access speed tests. This
+			is useful for testing alternative code paths and to skip
+			the tests in environments where they run too slowly. All
+			CPUs must have the same vector unaligned access speed.
+
 	unknown_nmi_panic
 			[X86] Cause panic on unknown NMI.
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
