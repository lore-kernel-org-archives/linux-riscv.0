Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B49D3B7D1
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eo6ZI/qxJnM3+nYuNBYPAHHubGOfPxgJ1JvG5tIOeY8=; b=0Z1+v8gdGdvfSV
	WLJtL4tLXtwHLPtaD+hobltiTb9Dh+R9gZL6e5oT5TNW+86u4K4QNS03xLwgJw7y0gDLJyfk9CXKn
	HN0YkXmGxiqPJ6qMWx21DTUauGHQ2F/zrcWBuiG8vjgLEg0IQ+45Rekic+5Um3EjwO/XcyNH/Qk+5
	SqOR3+A7oJgi0ZD6Riep9o2fRgDDS0HxSCpfiH3+Vcs72aU8Scqn4s4uOd7MpY765kxVATKiUM2N3
	wGaQxGljTOP4O9biQZzbnZcvQQadje9PpDr9jCGJAzMpeL00ZWv7YC1uMR16ooe1cm5WM3y2H/nq3
	4FkGp+L9UmVWD5X+WmuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRsbd-0000000Awmk-3BHQ;
	Sat, 06 Dec 2025 13:45:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRsbb-0000000Awlj-26hm
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 13:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765028746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SGJ/YBkwQ5juZyABcErVQlUL02+/JW8TWX/SMrvHfxQ=;
	b=iB9VhP8mFxltzzoQDhXa1rUpHfCfwNQrOonc9tDrZPfRg/Z4oxCiR7SoEzB35ZhK7VO/JK
	lMiyTfYr+niqyKlfRheu/LjUWtnWxrYK3WmjqAWgpk09iKAdZhjaF1cR1nyYfwPwEywdFt
	lX8P0iC92UrWbqDeKH8ioOm/6fHyX3o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-HvkVnUeXOTW9mb7nx861DA-1; Sat, 06 Dec 2025 08:45:42 -0500
X-MC-Unique: HvkVnUeXOTW9mb7nx861DA-1
X-Mimecast-MFC-AGG-ID: HvkVnUeXOTW9mb7nx861DA_1765028742
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-42e2e448d01so2779373f8f.1
        for <linux-riscv@lists.infradead.org>; Sat, 06 Dec 2025 05:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765028742; x=1765633542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGJ/YBkwQ5juZyABcErVQlUL02+/JW8TWX/SMrvHfxQ=;
        b=u43M52uZzGUUzpo1qEIzFEzvklKj8oyVm2Wu0vtP+ZBsoGt5frr9tBGGDWrpTT70ZI
         jHcfkJnq2YUzs1R+yrZ33BgibO38gS42BPbU4O5tB0J7LZOtkEtQDnpqNWghsFA4X7Dw
         F/Sj28llvxvKKDrUQpmzY8ObE8m25hXImgLiQBKJS1A7fbdGoUO+VtE+IFTdtS/v74a7
         Z2zTLPuzXe2qZjAUPd3Kz8cRwGf6tAT8q+KeUDNQGBlDVpygAtDZqTz3rzSWxVDMazz5
         yKew/ayC3OEEhAJoCxmTLCU13CPiziQKosgwidDPZFZu6vfP6b6P+7kVWmAb4psRabhz
         fzgA==
X-Forwarded-Encrypted: i=1; AJvYcCX6eX0dJf90GnjoffFRuXrTYk5o36rmwyjxILvfP8+v1XHSzOVr39oS5vTj41epemef6GNiQc+NM6g4+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMGupePiixu3PSpB5sJO4hExxMGrgSHJTR1rGVkfY3gz86NZPU
	UEqhim9lV3IZH5/lBICHwTgeeYs91JIOm/fokypWTgSGlpliu5oVFmCrI96dVtE/iCT23C1/MRr
	AKM32vKjMMHiamScjwFg0xjud+PStT6ve4Ea5qISILnBX8+y3p6bkBS71VDVuQkRXbUZTig==
X-Gm-Gg: ASbGncsSH3/TLXvslUDbiEiNubbRSTo2zpAby/Q5jeRhNkDFiC0qlgRkd+4XeLtDZZR
	ol7xTHmUyRZE15POuVcyZOr7S2g9jsEIYHAsvsfmLItU63kA/z9kEw7BGNu9qfb41D4Se1ydlUL
	qK4mJBExiWK+G/mCgB7jSu6D9vINaXdjLiO8iNF69g6VYW4GlhkRoABnOAVDylBx0ZAB4d8lWbC
	35i59Tdwf/oMnaKMttu/Li6F0A71XvJNNgw/BmG3n5WZeBwObFf9zF80EeTp0aL2+tP546++hiL
	9bsRON4R/tcvUrQOwhMzmuAGLyQBIQmDx/o6nAwsL1U6ojdXsXYd8FxqV+AKY1iwOsFo7jE5DQr
	mW7tEDVWs4mzPq/iZ2P7nfLPxFwvIeeRKyg8=
X-Received: by 2002:a05:6000:1863:b0:42b:39ae:d096 with SMTP id ffacd0b85a97d-42f89f093b8mr2876373f8f.10.1765028741666;
        Sat, 06 Dec 2025 05:45:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8K8x9eGlvEeI5+9B89BZvFAXX9KzP07SGmLffrHPHT6uNDDPlREapDk1gOmKWFS75ycvHSQ==
X-Received: by 2002:a05:6000:1863:b0:42b:39ae:d096 with SMTP id ffacd0b85a97d-42f89f093b8mr2876336f8f.10.1765028741201;
        Sat, 06 Dec 2025 05:45:41 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331af5sm14206871f8f.31.2025.12.06.05.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 05:45:40 -0800 (PST)
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
Subject: [PATCH 1/3] riscv: dts: spacemit: Enable i2c8 adapter for Milk-V Jupiter
Date: Sat,  6 Dec 2025 14:44:53 +0100
Message-ID: <20251206134532.1741648-2-javierm@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206134532.1741648-1-javierm@redhat.com>
References: <20251206134532.1741648-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HXrB0bJ2xBF87wHM1DoF7KJLKH3ORbvdgrOTBUvsR1E_1765028742
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_054547_614262_D43CCFB3 
X-CRM114-Status: UNSURE (   9.24  )
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

The adapter is used to access the SpacemiT P1 PMIC present in this board.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 28afd39b28da..aa425f02c1f4 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -72,6 +72,12 @@ &pdma {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
