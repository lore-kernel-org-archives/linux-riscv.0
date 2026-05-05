Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FE6CD3427
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tvUMGXqHS9AS0D2QzVVfv56AM5wIPc1LQjIKyLLo98=; b=SDGjannn0MjVLm
	xVtO13nW41fGSGNaVg7lw0mHaiBJ3lhLY8NU9NLdVCNeE5Ze3mT/gf/8CgnO8hrhARbtVBfEbr7gJ
	2kmOqcn31m6q120FWZZS6I2aNV+zOMG2ARMS43TZDOFFg1EraPQOTcZvwdZ2g/Cl7qJE46oF8izmz
	6tJfvFwvAacWcj9BpHpmN3JqysuSw5LqMoJx27y/roB4pQaoJAdkngXYvhUF7XsOs0XuVLXUMxX2c
	pNlNMT4NQLEWYa1FRUQ7U8iYqb30tjn0AsYiuz6+vCAgYtGALSsAVBYPPSKzdc0wTI+aJq/SQW7kc
	MSn65M1leR4UhOXzMarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIIA-0000000GmLR-3QpO;
	Tue, 05 May 2026 16:06:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKII7-0000000GmIz-3frR
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 16:06:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so69822805e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997194; x=1778601994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MKKxEhH/PG8dHPKGObXTAHe3ka75aRhCwPBKx/xAmY=;
        b=sxQMi4B3qFA7gGkBWIVi+tcL4hekPSp223wML4yvbVwvpzLkj/QkjCAHBYBO7/7K9a
         HsQlp+COCb4QM8ZpnCC5mPhq9r69UVTu1UVQ4+QuwpFOpb6hz40qWbuo1pFICRBfNshV
         qqt0VRWYVLN0i+24b5OlYZtjPwTgA2HpEf8B5LgcHcCjcIZggSj+ZCiEmrT5xZYnJ2hp
         D2TyHNSLsLVG7BK51Sl/WfBDwrEpRUxBtPCS0WBscdImaJhK2jZcEyqk1r71pnxuEmbN
         0rew62pbc37TUe7BWHgygIhjdW6SubGjkUIikmcZQX1epBEeRQtK0YSZi8cGImMHy09S
         YR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997194; x=1778601994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6MKKxEhH/PG8dHPKGObXTAHe3ka75aRhCwPBKx/xAmY=;
        b=Ietb0yNIhJDcFKVIVQDqpJNcvcwkD5IR2l/0vS7yYdU9v6uHgQihXeEac9yiFnpFN2
         Bj2WVr0bwaFSyMQJdAqPHcFtt3tkusVqC8xKgoqIwNbZodd6Oewga7EvBMKqXNkDBkrd
         K7x9MVG8A8AoPfDcv+AQlQnQDTzy6ee/RyAWX/fEJsZI6RUOIy6XCHB0tUhlumHB21ks
         +8xYy6/I3hU76CeTxu+2XQHoiaYFRoVevB0m0AdCKPMJpvmmgP20af+8Tj7tvMqtcNxn
         7MIQt9263/UQtbKNl1u/jltQLYmqEKECH9BNazDY0EDFa1wvfDEeLSgnMRRFxt3DoLCK
         IVtA==
X-Forwarded-Encrypted: i=1; AFNElJ+Vpxh3xhI8DHvb/Wk37cJwEFzcyA3t5K9QNd1RosK72LpmHQw63fMR06kjwQ5HNCv1Huxg6jgo8aeUJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGSzLYRZUtAIqo303uXH67SOq5MMP/L8OXHfVM6t8mQbbznjML
	jjKrsemMJpsy6PNH0WoOkR/lARN9OFvGLCFwCDAA+OUJtqOheda3etEH
X-Gm-Gg: AeBDievVyPCGkdJz38Jf6+JYcYEJw3uYnK4Oj0Gc32zlUTiKQw2+j50nBqI3IVbnKWB
	m5prRypTyyHydfTvDJUa80he2z8K1D8VKGpUaeJrpl/fIgpD6iWyjn3ML8rAprC9g6ufuQMFxoT
	QqYcDUaoi2frssSB/G6rNdduCHXFA6zx6arbgUJz41h4QHmtNCEDgsIiTXYM+VFN7ZyURFx2b2W
	goyshkBnYkv0p/E3EX8VoHlS8Nm+jwqVdcySto5i05heR5Rvak57gTel10viSu/CW38ovD7JxQw
	7An6e9gpNqmSur/5+mVjdbK0GuzH9FnsVZn81wbvTiqXfm8aggm+B+fBI64D5GoE+TGGoPKUu/8
	iRMWsDI6TXLUbAbgUDiz5WKEDMenmeFe2HZKf0dSmV7NpAAm98l+O/kGTsSpjDqj4ruRo169s6f
	O5QdVtxOv2aNm5qkeS1lveJQRlPj8K7LPHo6/TcR7bPneQN0jEoh8efT9Wf3KoVWzLbGZgNHqFe
	BGJNz4=
X-Received: by 2002:a05:600c:a118:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48a9865e188mr184980115e9.14.1777997193775;
        Tue, 05 May 2026 09:06:33 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:33 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
Date: Tue,  5 May 2026 18:06:20 +0200
Message-ID: <20260505160623.1369347-7-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_090635_916775_15CC1BCE 
X-CRM114-Status: GOOD (  10.71  )
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

Allow serial output with the same uboot/opensbi settings so the
console works without providing a cmdline.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 3ba6244952b63..edeeac501fad7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -22,7 +22,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
