Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D12C43334
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jun 2022 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWav9aTX/AhWWEMR5C/zfNOmU7qe2g9y1AqbLAictW0=; b=iBXvmHIDB73cSf
	X3PEB5YOSwkynX1SkY3HzkVl5QBYBLp9tCaAbQex5prWDPFXa8/HDIlWH3m4T+GGV0+3X/98+ZQAN
	GHJO9Mr7/BiLpdWojKZ8BpdionO4cx/3az3u0DYoQ/epAY8hlhMhjToQn4tLesohE8IunP5J9m7VN
	XDCDpLMH7qsBgOKlCKsUm65MJhvWgS08pMusXYq9ZrtYxGT8WB9vf0158PjTu0Q9f9QSfuVJyZaLw
	2cAOuBJDLcsApsYimiFVh31q2Zt2GAZb8hVMNkN04i3aav4d66sKgcYsxnxLQgG1K5eJUTxOSxSeE
	VwXhl3oCxn2HlNPbmkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNl-00EYPM-Vv; Sun, 05 Jun 2022 13:33:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNe-00EYJr-SS
	for linux-riscv@lists.infradead.org; Sun, 05 Jun 2022 13:33:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id n185so6342919wmn.4
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jun 2022 06:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mkd6aXMnIDerQLoHrLWEjvYyGr3xupK+E9ATz84tnuI=;
        b=bl8GOPL/9Anc8bPUu5kO48+tI7Y4tEopw6WUpip5A2dIGh4+3aRt3lXY6dwxGUPfYq
         A85sZXax9VvKJ2EQXrR5PlrIa0KsLMDvcy/mz9qEdfd+BmbG25/QnoIB9sZmm40B+B4n
         1YPl6h5ocUoGZSOPLgCeMIctRYnP5Hc+4W/XhCkRghlvw20ny4WKudQTxVKKimVFmrmd
         UK71jcEk6sEQAt/v41CfLGm2yUNAHj2MJq/maynD7W0Q20Jzd2xtuJQ/Ne/P2PWEcWrt
         VczdkTgTYJ6vt/Sf8SXiE/qglL9oHLPoWDG/T45cwdSr8bgOj9G0EHASeO5yecZ5b6Fd
         cYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mkd6aXMnIDerQLoHrLWEjvYyGr3xupK+E9ATz84tnuI=;
        b=bmbT/jEtdDNXs2sC5+YANXddREOF36fZWDTMI0XbzZR0YV2zi4gCPXUx+C9FMwyjzL
         0Rp3+RwzWtFw/bYP0Z0+HHt//5xYzWHzLLe7rcPXVoPjFEgWPEvgtpnUuxJyw84W9luT
         6neWn1a9bQR+UFp8Z0ND7IddyoUXybVu+RjWcmwmwyd5tcn2deYwbqdBhM3rRz8lTai0
         iLh47wDA6m7J7sx4XtaTcT3jQBTLxaIjfiDrdPOxk0NFzGp1RGfCxuqGvu5F7a2toBuF
         EQTDBxtb3qPs6QkwPDFIRki0fqSNTH/ztmBaLIY/RFNjA26h/Lxb+5Md7Oei21KdJSmK
         gTUA==
X-Gm-Message-State: AOAM531K1Eftz7mwtmHZE+CeATS3I6/6ys0ZNyjDvvO4RhE6pZDeo/zN
	DXxXcFVs1BwIE+PTgPn9xdABgw==
X-Google-Smtp-Source: ABdhPJzmtD/Gqhq7VtIjO7czq3hs4rt6LGJN9waxCjTI4IbAjjLaG5Fwrvpsj4ytTsG1+gypnWX5rQ==
X-Received: by 2002:a05:600c:4e91:b0:397:8870:a3e9 with SMTP id f17-20020a05600c4e9100b003978870a3e9mr44366442wmq.141.1654436001738;
        Sun, 05 Jun 2022 06:33:21 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n187-20020a1c27c4000000b0039c151298b7sm18217076wmn.10.2022.06.05.06.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 06:33:21 -0700 (PDT)
From: mail@conchuod.ie
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee.jones@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Atul Khare <atulkhare@rivosinc.com>
Subject: [PATCH v1 5/6] MAINTAINERS: convert da9063 to yaml
Date: Sun,  5 Jun 2022 14:33:00 +0100
Message-Id: <20220605133300.376161-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220605133300.376161-1-mail@conchuod.ie>
References: <20220605133300.376161-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_063322_961858_74784700 
X-CRM114-Status: UNSURE (   9.01  )
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

From: Conor Dooley <conor.dooley@microchip.com>

As the da9063 dt-binding has been converted to yaml, update the
maintainers entry for it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f799cf34ea52..8e51bc154584 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5805,6 +5805,7 @@ W:	http://www.dialog-semiconductor.com/products
 F:	Documentation/devicetree/bindings/input/da90??-onkey.txt
 F:	Documentation/devicetree/bindings/input/dlg,da72??.txt
 F:	Documentation/devicetree/bindings/mfd/da90*.txt
+F:	Documentation/devicetree/bindings/mfd/da90*.yaml
 F:	Documentation/devicetree/bindings/regulator/dlg,da9*.yaml
 F:	Documentation/devicetree/bindings/regulator/da92*.txt
 F:	Documentation/devicetree/bindings/regulator/slg51000.txt
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
