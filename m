Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5FECD98EF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 21:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97S6IkNgxdYDL0kY4shvXNA1QOaxgZkf2BURW4jNbaQ=; b=zQE0V+1fjxXuFn
	SWSDsdSUw9ONZ3YKm1GDE+RBOf6IFmWXkeHfMF5TlCyfY3/Di60l6QAYKpqMNFcIHukAztLi3P0fY
	G34Pe20LPW41r16YPfH4sHwluiDK77rx2cwGpEktX4d0trK07BZCLPSZb2JiSLtG99r12TV1qGG8n
	OQWmI7ZOmATggsadVd67mWHh3vdWX5JhJ6h3JLa9l26Gqh+SXxi7i53+sePandLZ4CULkcg483SIa
	dr03UiGm4v9QuSi7J0rNM6ezEN7Q22NZuj8rGWmXp5x4WlwY9I0HDyoqLo3fbxOZgZ+znc7+O+pZo
	rEdAUzT6CgHgg4xd+Xpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJf8h-0000000B9JV-0iGH;
	Thu, 13 Nov 2025 21:45:59 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJf8e-0000000B9GL-3zMe
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 21:45:58 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-433101f2032so6228315ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 13:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763070356; x=1763675156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrbGzwoMT9Ducrx+C40YCeeXZtuMUvm1QSQu39eFix8=;
        b=SRb/p2f5gTIDPvwuNULBSCb7eiJVp25SjfKVTHhKpwLrfYUDUzab4Q7ls7pE/u3N7a
         Tvjz64URoFmzOVyogq4Ddrlz7FRix5c12zesyMiquMiz1MwT7JuDA2vFACfmpyhrRjEu
         8FJaiRA24awIqLM/UrrAPqm/haBjo/LXZ1j/vRB9Sn5INwkoG0I/lo9VLKrOyffWk7uz
         i207QIxMMB6HS49iNpXDsvq36RwiuwZrSdD6GTvmTDHxiEp4EFGR25THVCXwZXl0XpQQ
         DFAZCMWNTL3TuzgD185SD9UljeMA67dSu/plUMDzVPZQaBSV0wLOv/s00jsFMiUxLIKb
         3KYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070356; x=1763675156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UrbGzwoMT9Ducrx+C40YCeeXZtuMUvm1QSQu39eFix8=;
        b=PD05DOhnSFGZZooAZSfy3L3ofjAbAP2h2xg6QR+FYxgL2ZpQGgcK3q43/bpwPfM9Ds
         DtFJObD27IWgc4d2oaKj6kttUQSj0XSzaH5DKhqGFbJBt4RLocHHdqu1WzWa8P9RRPtD
         NqtBWWa5iknoGDEKSJGqg3S87yFnPjUHKl2PBqy0v3qE80E29G6pXUhwAhhIhJipRPB6
         1R9IZXYbVe9pSg6GnjBvEplfHwTBp0mTKg85w9zAp8zGml9hSkSUr7S4ICvfBQz+kohk
         yZwcp5SLsb+IpPhjyHp5WtRuJBRcZM0AvT8VZngvdkZPG8AQ+CLF5jaO5HmkGI8xy0wh
         n6/w==
X-Forwarded-Encrypted: i=1; AJvYcCWmWUdj0vOELo6KMkJhlLss4/BlQy39e5tgWZpBJgxVFVYoRtZUW0cCSeoWRvZ/uNX35ED/RU2cScMKkg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7rx8/VFu+DZ+nLaRxNtrtAA7k+ooICN6NPP+G9CQWRALwPq06
	eFom/ADVV2FeBQB5/bOmq04Ua3cYUceA79RPFvKDfBARvA9I6Fvr54rUBQShsabJZeg=
X-Gm-Gg: ASbGncvHD26x75kclQfPQ97yr5QsU1vuyQfbDWdTwCtOAcWSf2+D4+l+SKEFPd7HENR
	YPksJLBp8fJB7I57/blWC9AoHhuUlzV6WLww6ZytSaKtp/iuEroYOvVP7gnQ/+8Juuxad1qrm4/
	m4HsN1TP/ik6JlqFl0xW39K6Jkj8vVeMk/qPM8L8OljuiuvRiSRLnSxHGTZh8bG//1L1Nd6h6io
	qmcL+08f7OHgNDDe51rrDpy0M4uJLJ4AJaa8zBF9HBIT8XaW/NVUV002oi7UxGCcnx3McLCi3CU
	Ugv2r4Wh2LugNiwhKEJ5TtvDpdJmUCNNbZJ/AKocFqDmiIyqlpulCPjo3AKRt4bzE82M+eQ7A9m
	VuRXfhrtYLiGZxR6G3MOMHllZ/9oBnYLqS98NMqe5R1TD2I/yJfYRGEcLH+bLDtxVWwrGtskBeu
	r3ytNtyNF8aNqXcn4aXKW9GaGcT9RoDAHyu82rcyAr49zUidvrphvChg==
X-Google-Smtp-Source: AGHT+IFomP3OhkAPUlXBqH3nkrCRAP2vPJKy7pF18zv2dwYytVZuZbONaXMoLuyWSdunyx1jnM/2/w==
X-Received: by 2002:a05:6e02:1d99:b0:433:7e25:b93d with SMTP id e9e14a558f8ab-4348c949c9amr17614215ab.28.1763070355985;
        Thu, 13 Nov 2025 13:45:55 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839a4ac7sm10877115ab.25.2025.11.13.13.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:45:55 -0800 (PST)
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
Subject: [PATCH v6 6/7] riscv: dts: spacemit: Add a PCIe regulator
Date: Thu, 13 Nov 2025 15:45:38 -0600
Message-ID: <20251113214540.2623070-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251113214540.2623070-1-elder@riscstar.com>
References: <20251113214540.2623070-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_134557_003197_01A22367 
X-CRM114-Status: UNSURE (   8.58  )
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
