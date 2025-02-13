Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B05CC02198
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 02:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhmmFFzf+DWuUWNdxML22q7+LN6LgnwkWkj7da3w5p4=; b=LhGoC0VOezD/1P
	1+47kH2lVhSG1+RD4fHR7gsJ/fkQgzAQZ1h5nUp7SvkBKg+ncECVGOzVdbQB0n5bIFsCEEFnQt2p/
	GcFZ+SCz7pIT2GQOHCMEaXh6uon5Q38jizAl0FU52l61ItzcmQnyVYUn0tautbhr+vE764+UZs1qe
	8+//IRPhApYYYIWMR2EStb7DVttYU+BEldKaY3djjmc2IlQBbSjuhTjIv5mMwjHiKy2GMwLoPQLUR
	+rdpnI7+xgBtpzDKqNfMd2kFliUJ001UJtWeAFO75xwOjvrN935nOlF3bsl6V0FDoCYJdgslkdlnn
	tWU+lPIYhXunx7GYJa1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOfR-00000009T2v-3w25;
	Thu, 13 Feb 2025 02:09:29 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOfO-00000009SzZ-2yXQ
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 02:09:28 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7c079f1d96fso39175785a.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 18:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739412565; x=1740017365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtFDrrT3rCYjoOZO0OfQ9Vc45JJv/q5OCfIu3p4OZZg=;
        b=htf0WwiXlZVHmJQykj0a39eMJu78h9YYMuTMjhiVvpIthWPLkJWAu25Td7LHRTxt8Z
         iNEM+I01uTYNdRZrGB9J1pnNebAKU+l0zi41bJaBkA6+xxfSbLN2PMT+F/k2qXgnxUAr
         wrtm0dvIGJJ4QbyowAprSRG569NUcAHxMVkikTGxJglXiAHwjrku1iXyhP2o+UeFvIQ2
         dD8kDqu9X56cb/OpBgtKRyXjg+Xvrl6i0E+hy/WdC1szVLXR3HAbQynZc70dUDW84KTH
         fCpmOQlSadlTmjcXDpgUDDhvFnJw2l8jaywsJX2m+T/yzPy5/uLzyboFInKKcDsXEdpJ
         dGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739412565; x=1740017365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtFDrrT3rCYjoOZO0OfQ9Vc45JJv/q5OCfIu3p4OZZg=;
        b=FiFD1Kgu+rzQyC0QKtDNhq9GzzOlWD9nVbjehR2bqtOruUR2Ki+mD2KFtntTJEn4o7
         +oG1H0mkKb2NTjJYkqt7x1Zgko+r35h3gOMbSyq0N1qccxvmFmyJiF69GmGdB/ShEl1H
         EkNT765mlveom60CCafE64pttmru5SpTEXB7yc3Zi7jCrLHHHsvA2UMx7kUnaruN/O/h
         8TxfAnXzlXIzxO3fhCerYgxAZwQ885aMg1IgAlUl/QE6Y0egzjCmsnqASzy4QNRzqE+U
         OORq38K1awnt/F0c3nXVzGYj0H/1MV5XvSUWQguaP2dgOhN6I6geCNImdYXm8oz7Xhwz
         KKvw==
X-Forwarded-Encrypted: i=1; AJvYcCWB/1qRQngpqNoyDgSGb5bXNTRPtMqM1LABek4H55ELdnHp8rWlNnCyq0HZqeELmknIuHgyCWpopZ3JIw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp7ogLM7o0DjwlR1m8Y/siNILqEIN417M3iN7X87CySL0+oJM/
	Qpgb3hGrW7+X8jHV71RkiG8yDAZVOEu98as6b8/2a25bkgvd8BN9
X-Gm-Gg: ASbGncuzSOAV+Awjd7c5aGa4AiTSEFYqdrfvh/N1mDs9bXMF3Zy/E3OWlWCUhwmaIjr
	H83HJ/IWIa2FbwUv/OrZoUxTQeYbtz6Hblqjc48WdFMsLrnUTQWqRPBcL0Z04rawXsGzM29fOJt
	6AZPyPkh569aesisgMjl/2veAUOuZ2ll0AlBpCahjZErPAUDm8rRIRAcyuOrCtIAJRmvbuYcDuP
	h3WNwUmn/YmI2awWwrZsvOSs7iS5xAIfQW+Ac6pPMLsxkOJ1/kLYYvIEYwMVC5lHU8=
X-Google-Smtp-Source: AGHT+IE0LFF3/PieQBcv+/M0s57QuYZfV0AqSx58CzpD01bEJ/HlCWgUX1jFHn2Bh1WE/RrZetIfow==
X-Received: by 2002:a05:620a:4894:b0:7be:6fd2:938 with SMTP id af79cd13be357-7c06fce2424mr1035985585a.53.1739412565595;
        Wed, 12 Feb 2025 18:09:25 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c861552sm20492485a.79.2025.02.12.18.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 18:09:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 4/4] riscv: dts: sg2042: Adapt reset generator for new binding
Date: Thu, 13 Feb 2025 10:08:57 +0800
Message-ID: <20250213020900.745551-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213020900.745551-1-inochiama@gmail.com>
References: <20250213020900.745551-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_180926_781665_D49F5A40 
X-CRM114-Status: GOOD (  10.74  )
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

As the SG2042 reset controller reuse new binding, change the device
compatible with new string.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..1e29f5975af9 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -499,7 +499,7 @@ intc: interrupt-controller@7090000000 {
 		};
 
 		rstgen: reset-controller@7030013000 {
-			compatible = "sophgo,sg2042-reset";
+			compatible = "sophgo,sg2042-reset", "reset-simple-low";
 			reg = <0x00000070 0x30013000 0x00000000 0x0000000c>;
 			#reset-cells = <1>;
 		};
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
