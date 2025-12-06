Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6DDD339BC
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cTVIjAmh5r3gou9CcqYMv/cZ4mXPkxRWxjBzbgMfD38=; b=b7LyJnKaIt7JW3
	vuYflSL6ld4m5fp6m9IsZ7DKDIovLhoaPOcVMTyk3OSoQBNvR0D9+v+liIxLGECoxQCEZW57oQT28
	b/LVJiJsBpo4e47XgJyg751/9okXFrcRKfmNW8xvqApvZaqbh+64F6GdY3gjWFnVHyZ5Q3kCUtr83
	b99cPtU1UU48zP2nc0YnTf4f/EYlC0yfmDLK1Xko5lv+2EsVnnIwPQo82HeXZOPA44ETJAfjYPV5h
	PAVn6s7uvyceMNgW/ohfCImatRSaQt/e6lrko9L2oSPyvfwSR+4MNNRJ7mRwnkjh04hKdzS45xVxT
	aTlMTZEd2AMfFrO6SMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRsXA-0000000AwYj-3QDO;
	Sat, 06 Dec 2025 13:41:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRsX2-0000000AwYA-0r4h
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 13:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765028462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QC70i/lfryfDMLlz9PR/W22hsTXwtyfjKxX5Z38dT/M=;
	b=YjmIEZ3qbPC+R4kPn73PXbSJ2Lxnip1Qu96V2IUPZ43eO6WzHrZY1UfgvFlMYaOvluYRcv
	C250b9YcTymoC5OY9Vn+ikS1dH83vMxMbyCPb9w0eiqBRxeyEd702SULbYgg+QWQ3vwp7/
	WLTen+tTdAPYc2Tk2NysTCTiEmR5YTI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-Snq3WT0sNpC7HoaXuLCvuw-1; Sat, 06 Dec 2025 08:38:57 -0500
X-MC-Unique: Snq3WT0sNpC7HoaXuLCvuw-1
X-Mimecast-MFC-AGG-ID: Snq3WT0sNpC7HoaXuLCvuw_1765028337
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4779da35d27so35980415e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 06 Dec 2025 05:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765028336; x=1765633136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QC70i/lfryfDMLlz9PR/W22hsTXwtyfjKxX5Z38dT/M=;
        b=DJ3K205cT0HqXqMYyX3t9+Y2riVb9bdQRBf9PBrVjxrnIuslysH1nd0d7bIcgChh04
         Exbj47ESibvKqXnMVgeijMuZK3ZG7yA9ShShR/ovXwpaAUGmmJc+yzg5yBhXoNqCXfFw
         XCpmhNv93hpcvAX1tl5mvenZq71+3pu3yv9VrPAnbhaVD/lYZVkjILs53+po03qCJtu0
         Rzr9u1MOo38MV6foI4Cgrtbj8UhEtVo5ZVTFS4pd+umsi0/s4pQXkWy3gdBAFKCV6EA2
         cV1ZYr8SAZuAsiSyoiiODpI7oOad0o/0Ju7373nESW98p8zBIUjgdFXaH6qFj5kGk9bU
         DnAA==
X-Forwarded-Encrypted: i=1; AJvYcCUhnDLgt/Xk0EioEcZ9Sx1WAQunzYA0oDO77Ac9C+4OZcKVatvitYg0gkr56EVxCg338BNDhmeGkpsGQA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8efomkorK3QXEFpEv9RewCWKH8frzr0cmowkbDGh7PoKGXtnH
	H+/TDJ3EWBRKkIuD6RtujawGe8EtZpKXg2YSSjgbZHDm7lds0V9cAKGgw7JLxYSvei5lYLVR5VQ
	ZlhSArdsNEFNu587CHcveym/2aGGqgFpH+4E4Rt56x9Ek/tzAY9n9C5F/82YBCJJksB5nlw==
X-Gm-Gg: ASbGnctKnEd0mr2Pm62dEJb5PlZnyjkyhjYcwR97BFE06DJQ3F1ocBfRNW01nOpi5bX
	RT3YeZaec6OJtHVso6XF/3H73e2b783NHjFGjXKV6pIXDgDTBbFbjCH7kaGwjpmkdLpmAr53sSq
	3WgSRptF7vwkGNs4nSviUXvMZfrQ3+BG12VvO4lWhv1SMJsgVRjRgvIjvjgyrPGiPPTKQ0nmIW8
	PtFgr0dFAN2z6FW1VoenL1Vx7i6VQ5Zg9H92w845Hkiael6dJtl/BBK1GqVI1lRvgW4kQDMdJNJ
	plZhExSVqz/8hJyTumBfb+mib5rhQ8z3WIwRk388Sh7k/Fym+bo5r8ZwSFd7NByK2rnAAIJImGZ
	bNXy4GM2UTg2t9NyqaGo8VidzCBt9bH2nCCc=
X-Received: by 2002:a05:600c:1e28:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-47939e38284mr26973505e9.23.1765028336550;
        Sat, 06 Dec 2025 05:38:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt+JYoskz9q0dOZUvI2zbL7PpqoIgzpl9VZcFu80JojTUue0FS/d/Bo0yeWUR73XDazyVsPw==
X-Received: by 2002:a05:600c:1e28:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-47939e38284mr26973345e9.23.1765028336171;
        Sat, 06 Dec 2025 05:38:56 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeae9sm15157012f8f.13.2025.12.06.05.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 05:38:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Alex Elder <elder@riscstar.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH] regulator: spacemit: Align input supply name with the DT binding
Date: Sat,  6 Dec 2025 14:38:48 +0100
Message-ID: <20251206133852.1739475-1-javierm@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WEpfB_AMmL3YkFnVAeUWthEXjq_9k306A-Klj06AoSA_1765028337
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_054104_317821_BF93BC54 
X-CRM114-Status: GOOD (  11.86  )
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

The Device Tree binding schema for the SpacemiT P1 PMIC defines the main
input supply property as "vin-supply", but the driver defines the supply
name for BUCK and ALDO regulators as "vcc".

This causes the regulator core to lookup for a non-existent "vcc-supply".
Rename the supply from "vcc" to "vin", to match the DT binding and ensure
that the regulators input supplies are correctly resolved.

After this change, the regulators supply hierarchy is correctly reported:

  $ cat /sys/kernel/debug/regulator/regulator_summary
   regulator                      use open bypass opmode voltage current     min     max
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

Fixes: 8b84d712ad84 ("regulator: spacemit: support SpacemiT P1 regulators")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/regulator/spacemit-p1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
index d437e6738ea1..2bf9137e12b1 100644
--- a/drivers/regulator/spacemit-p1.c
+++ b/drivers/regulator/spacemit-p1.c
@@ -87,10 +87,10 @@ static const struct linear_range p1_ldo_ranges[] = {
 	}
 
 #define P1_BUCK_DESC(_n) \
-	P1_REG_DESC(BUCK, buck, _n, "vcc", 0x47, BUCK_MASK, 254, p1_buck_ranges)
+	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 254, p1_buck_ranges)
 
 #define P1_ALDO_DESC(_n) \
-	P1_REG_DESC(ALDO, aldo, _n, "vcc", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
+	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
 
 #define P1_DLDO_DESC(_n) \
 	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_ranges)
-- 
2.52.0

base-commit: 2cf7bc86f10d99b72707b1c1c654f78b103f2105
branch: milkv-jupiter-fix-reg-driver


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
