Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDD8D3B7D8
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N7P2YLiv61oPzcVV/TAGwXViujTvj1oUPBs4rLRIYeI=; b=QMt1wBSnOiphEO
	47g2pWTIt99997q1GXxNwiDmraE0sPAlMCw1mEE0zqn3PQsvAgB9Q4JYn+6+TPXRDoIZIhLqZg7jl
	VNfCx5gR+IArQM3MREhFjextOGqlRNybWz/6/Z2ksqL6fbMsRCB2/iQBeTU97gfTw1H0dTTJX/JjG
	lVxsJ3zjvqyyLN1l8lxEgEhX0JUxj7De+bobO11KaFlaPXoUUVt/YbSoGjHM9toySPrFmDR9yqeiy
	60zMi45OMf8HRIklO4mLrHDaMcwXgBIjbkxFkQtXvl4JSTJYvawZ3G0hPQYM/L+TLDLh9xkGsrIZZ
	XCftp03mr5u5tks1rgQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRsbb-0000000Awln-1ndK;
	Sat, 06 Dec 2025 13:45:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRsbY-0000000AwlQ-1lk7
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 13:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765028743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9piyTpQ6TT5OHkiv6/B5x9F9Sfk8WGsncGds5Tl6KD8=;
	b=Y+1/7XiIdgQDYB0XnuytprJWuXfzLktnW8A5CIFMpCroXQ+tLWyfpMC5yWt9rn8FxGpVha
	whSAFuXz7IzciifLi3enGce/5R2r5/G8i3pZYrYMJxzgJKl6e8TSMhKmJxrEIulXWOQ7Dt
	S5xLI4K61uzk4EU4YRCbCO4HPkQUpdM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-K390S-3TPtqwJzjis-eMXg-1; Sat, 06 Dec 2025 08:45:40 -0500
X-MC-Unique: K390S-3TPtqwJzjis-eMXg-1
X-Mimecast-MFC-AGG-ID: K390S-3TPtqwJzjis-eMXg_1765028739
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-477939321e6so19287385e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 06 Dec 2025 05:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765028739; x=1765633539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9piyTpQ6TT5OHkiv6/B5x9F9Sfk8WGsncGds5Tl6KD8=;
        b=gvYmDXUi10fGOp9Z4C1gEewsEdTXoD26dKfjoupTSyz6/Ai6vEQM9vVhG8Jot46PhX
         n+OvvvGGYUCs/LzP8XTh5Ukkgmkz0kFqxB+uxdSTscu3w7FTNEJGAzLxHZ2omD0Ks/45
         JKTROq0A7W/uv5EuWgg2qYhTo3vyE67PWnifcHN+0Slc4rUVIiL4nQbFJm3gUOPuV/6t
         ttSSHppIgNnoeI8kBZa+bUYZCx+3XKsFHG8PAh2wgiSENqyyQTzTIqfHa59+iXjDKVJN
         Yx9W1BoU+BQ4WgAD3nGiCLNq9hK7Z7bJqdMEdVKU8KMhuw2ImjWpRoN9L/8jKFysOUWa
         FQ7w==
X-Forwarded-Encrypted: i=1; AJvYcCWAXVPiXiMNoxqBWHSNCvI8OSCpDYsn0K0lqPMbS1hrAP7GITVR9WZQ87X5D2xZ+3I1eZJ2hcqPoRMpGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8TSUbwAWslyqz+8j+/l/ajzxjSAcXIFDS8VXZ4AOeB3ehP9bF
	sQCBfSiahDuJJjBww38fX5ZrnUm9YkHIPtL6RSEUvtZpWicPogf1dKwb7FAvjRqnlvRHZwUphiM
	Co8EblrUpKcQtAsSUXxVh6d3HY7Fj568r6IGLdhzGHCFM7N5KYI6uEk4Scs4xQRtV+7tmWQ==
X-Gm-Gg: ASbGncv7LJcU4pA3jrjXFn1KrdOE6RYuNzQhN2do8ydfpsFsf+/t0mA087/tRhQol+v
	XtFC0Kq3D89xxBe4I3JRe5hzlIvxmTMJgqR/B12qTPgcuAzdtqjy5NuC1r9SqONTzLMp3q1pQkM
	+ngWYm1O9v5vFzjSKYwqbNKjGcgqGtYk+OVkG5QvGjOlwa63jpjxgBjLoLZw0hHz+F7aC2qJhUc
	nmSvbRpIrbScNTamVNbFFCZY+wqWVFOU3m7rBlPvvoTbGRjrvVKEC0dWN7MAeddY1IlgwGEQKnI
	2wT8GNDZcTypqIqkneWrL+GsRN8wn1IyvtCwevE4g7/NHCC1VmPmNalFUCsS8JVEFwoe0Vxq8eH
	bMxUKADMnaVj6uGWndeOA1xY8mfTHJZL5sTs=
X-Received: by 2002:a05:600c:524a:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-47939dfb06cmr22732315e9.8.1765028738880;
        Sat, 06 Dec 2025 05:45:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRf68G+11uMBoOmMOztce9Dtg+7RUcAPRCNepMNXIDMmbVwb5H+ngp0wvK48xMgJehotiAqQ==
X-Received: by 2002:a05:600c:524a:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-47939dfb06cmr22732135e9.8.1765028738491;
        Sat, 06 Dec 2025 05:45:38 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d330b20sm14457955f8f.29.2025.12.06.05.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 05:45:37 -0800 (PST)
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
Subject: [PATCH 0/3] riscv: dts: spacemit: Add PMIC and regulators constraints for Milk-V Jupiter
Date: Sat,  6 Dec 2025 14:44:52 +0100
Message-ID: <20251206134532.1741648-1-javierm@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1vGo_yDSg-EERd0D_Fyjq1nyCuCUjJcab42Aq3gYaqc_1765028739
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_054544_535561_888DF320 
X-CRM114-Status: UNSURE (   8.80  )
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

Hello,

This patch series enables the i2c8 adapter, the PMIC, and voltage regulators
for the Milk-V Jupiter board.

The power management hardware design on the Milk-V Jupiter is identical to the
Banana Pi BPI-F3, so the DT Nodes were copied from the k1-bananapi-f3.dts file.

I have verified the I2C address and regulator constraints against the vendor's
downstream DTS to ensure accuracy. I have also dumped the regulator_summary
debugfs entry to check that the regulators and constraints are registered:

$ cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage current     min     max
---------------------------------------------------------------------------------------
 regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
 dc_in_12v                        2    1      0 unknown 12000mV     0mA 12000mV 12000mV
    vcc_4v                        7   10      0 unknown  4000mV     0mA  4000mV  4000mV
       buck1                      1    0      0 unknown  1050mV     0mA   500mV  3425mV
       buck2                      1    0      0 unknown   900mV     0mA   500mV  3425mV
       buck3                      1    0      0 unknown  1800mV     0mA   500mV  1800mV
       buck4                      1    0      0 unknown  3300mV     0mA   500mV  3300mV
       buck5                      3    7      0 unknown  2100mV     0mA   500mV  3425mV
          dldo1                   0    0      0 unknown  1200mV     0mA   500mV  3125mV
          dldo2                   0    0      0 unknown   500mV     0mA   500mV  3125mV
          dldo3                   0    0      0 unknown   500mV     0mA   500mV  3125mV
          dldo4                   1    0      0 unknown  1800mV     0mA   500mV  3125mV
          dldo5                   0    0      0 unknown   500mV     0mA   500mV  3125mV
          dldo6                   1    0      0 unknown  1800mV     0mA   500mV  3125mV
          dldo7                   0    0      0 unknown   500mV     0mA   500mV  3125mV
       buck6                      1    0      0 unknown  1100mV     0mA   500mV  3425mV
       aldo1                      0    0      0 unknown  1800mV     0mA   500mV  3125mV
       aldo2                      0    0      0 unknown   500mV     0mA   500mV  3125mV
       aldo3                      0    0      0 unknown   500mV     0mA   500mV  3125mV
       aldo4                      0    0      0 unknown   500mV     0mA   500mV  3125mV

Best regards,
Javier


Javier Martinez Canillas (3):
  riscv: dts: spacemit: Enable i2c8 adapter for Milk-V Jupiter
  riscv: dts: spacemit: Define fixed regulators for Milk-V Jupiter
  riscv: dts: spacemit: Define the P1 PMIC regulators for Milk-V Jupiter

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)

-- 
2.52.0

base-commit: bb3a1f127972ea262f98eee55068de1e54ab8d57
branch: milkv-jupiter-pmic


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
