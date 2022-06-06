Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19479C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 20:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJ/mB1InioPGumS0Ycmv1XKjxuR3pnxGhBedv4xUVa8=; b=MjpB3WCQMkyV77
	5ym6Wev86toJ1HEQG4ixG9nHNXfo+41f906NC8ChJY6emvWrmd3flFkBvZdSKZQaRhi/eWC1h0h7j
	xZRdsddbwGG8Wzl1IMhQNE5dSMgqGcR6dTOEsIoX/8RDaXmNcNjBf7ChSBtw2HPoJ9cl/s1FfksT4
	ju1tC/zgIhtY0hBh9LhsynhmfAFUWAcVWuV9lRXIynfk9HBoHvTJ8m0T3cgMzLhCjVx8iAn4Du+F7
	6QgNrpiPNFbCj+s21mOLz7CqZLzKyOf6PlvcXYSl68o5ssSSIITVygf3My2zZ4a5PtFTkVQOtdzWI
	BhWgruLuv4n+bnLH0UZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJ78-002YKw-MC; Mon, 06 Jun 2022 20:14:14 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJ73-002YIq-6h
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 20:14:10 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q15so13249706wrc.11
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jun 2022 13:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gKndGtfRMJoB9VZHAXJ3155b6Ocgr/Z/0m5W/nSp3fk=;
        b=R3sETjnSuiHTlG/IUAzV7fv8dB2d7Wfi3qLYLNc9aIyzyelXvPU2/mkdqHiJ8OxdOK
         9EjpPrT+BIuW9BnpUX5pJVptwi19xM1aqlQ3ntH2S40hkm/uJRXdQVZ2TmJvQMr4XbcF
         VdIoxfrs97B8KLigTlKKPvrC5tp6w+YaeOg06kxlzvWW885WtneFPzVamFPzvto1kl5J
         vu0AV4mMAvhrfjf9qxND5ndORn1bpfOaJhqU1Awf4OwE7Sw7DDLNBxys18uyxQ/GpZwe
         95O9Dx832MZjcqSiJ39v5GdixKb9ETtsnviT6fuZDmmM44dK4epNnYyydTHlDDHRy08U
         Yhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKndGtfRMJoB9VZHAXJ3155b6Ocgr/Z/0m5W/nSp3fk=;
        b=8QfX10pAkqVTBux8LDs76yD8wHNRtdeV7G2Q533msag0BlD7t5yoUeLX4FKpv8KhtP
         D902DEJ3+toM2nxl31xQUsEv6G6kwRQhevtWdK+qYvBz2Qf/igkIVaxct4Gsp8ICg+s5
         LdJuiEmI+VTtuhTJ0vqLwqZNZhEDf8+bKvjuOiBhvniP4dJL3QOxl9eMRSPm9sEB+e8R
         XhA5kXD28HfyLIjXyiu9EgbWmFzjxuTa+I9rot6bLV7qVgnyS6gExKzBsDLKgCTS/9PI
         YaGgm+6RywBlE/lBkE51nPO48ufBcGNdn4uvgHs+jkZAIPMbtCGOR8aCbT22qDE8nMiP
         0lhw==
X-Gm-Message-State: AOAM531ABOKwjUTwyZjdCtYLDL5aF+XhPhVfyT2wMMHheqivj8LyuixG
	7XhMqsg8b5tFBxj5Eriqb1o7YA==
X-Google-Smtp-Source: ABdhPJwht5UACwjuoVJK2k9+/Vd37V0UwaPay+ABBXzqJFR7D3rCMgEzfyarZa6XGbyJAiiVBloG5Q==
X-Received: by 2002:adf:dd0a:0:b0:213:ba65:73fa with SMTP id a10-20020adfdd0a000000b00213ba6573famr18855142wrm.521.1654546447347;
        Mon, 06 Jun 2022 13:14:07 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d4589000000b0020fcf070f61sm16038489wrq.59.2022.06.06.13.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 13:14:06 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
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
	Atul Khare <atulkhare@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 4/4] riscv: dts: sifive: "fix" pmic watchdog node name
Date: Mon,  6 Jun 2022 21:13:44 +0100
Message-Id: <20220606201343.514391-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606201343.514391-1-mail@conchuod.ie>
References: <20220606201343.514391-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_131409_290689_78C9B339 
X-CRM114-Status: GOOD (  11.16  )
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

After converting the pmic watchdog binding to yaml, dtbs_check complains
that the node name doesn't match the binding. "Fix" it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index c4ed9efdff03..1f386b07a832 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -90,7 +90,7 @@ rtc {
 			compatible = "dlg,da9063-rtc";
 		};
 
-		wdt {
+		watchdog {
 			compatible = "dlg,da9063-watchdog";
 		};
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
