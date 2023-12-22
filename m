Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7F6C46CD8
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24+ay91AO44kiszV3UWnCY8rW0oApa+joKYLs8H6viY=; b=hdFJXhifUZGVGM
	CWBKkJNMM2KxZzXYHo82dCOGp2GBFKV4zUby+NKpzd8iqy7mNrROsnr43LB90HuO6F10V4qeKYLaC
	K08rSY6w5NUZUXY7GS2eVJbYZhTqeTAndcZvTMmSbkSZvXoPnfekRSgZHxo+vOfDDogdlbGxYevLJ
	psVosmBJUWCR8BBEwGcgNxktfVv3fcITN2fTWAlLbks9hvm/2QGFiDfNK7mrApFkClxvMl8xdOnTL
	tmN/nwODWOu34niK88PfLRiD+HLGB6NzaPkoJu3JjFQbz/J7Az6YZcAqfpZFmWsdV04vTjnrpSefc
	BD2qNQKsDgjle+9Cmo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdUb-005dWG-0U;
	Fri, 22 Dec 2023 11:15:01 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdUY-005dSh-35;
	Fri, 22 Dec 2023 11:15:00 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50e6a806e4aso379427e87.1;
        Fri, 22 Dec 2023 03:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703243693; x=1703848493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=422E8D0hJIO/x9qlN5M/YDPeDy51iO5eXq4u7UbXCT8=;
        b=lhb79QMWNwh161y/sP1yHhnAcUZryMZw0tVWcw25DMwRq8X2IJOWYFKoF/PNi0ZxeN
         7ijdd2uv1cOwPC01SQl50DP1cDlkrbFDh5v8gpC50OvV90rq7fsQFHYySgN8n1yosG2/
         dGQF1SmEhmNjmX2GE8zpG9Ro69dTQvgxGXFHYdzryTuUjuVxFctDZvtjAhDgkEBdof1o
         On9y5hZEIDzA4U26WC/D2mReU5t/sJte+dChaG3Erd3gg3iL82OvdbqC2cy40fm3Tayh
         zJnoWvRJnsSRLas1jEc80E3AUNDPG4swZQlOx/zyNk/Ul87GEni+XSz890tHkJbYaAJO
         K6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243693; x=1703848493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=422E8D0hJIO/x9qlN5M/YDPeDy51iO5eXq4u7UbXCT8=;
        b=X2IR2p49VsNcBh8DmQtW4KvoNSrP6rF/1tfNvTjKgH0s7YuHdNYcv+B/dXFqOvF3qY
         ls5s9Ie+QjeVCO5rUau6I4sdKYizH7+NTQht0ZwWJoXq/Xt1FhXyAEHzdRHu/QRPAcHj
         WO9itZvaBd+xS0rl3pAKo6NZJ3O3Vet+oanDwb92nVcKoFrRYgcui1ItciB8wY8h3yGu
         00qtJm7KbJRUBbC6CbBSHW7SC+edt3ig5lSTBdGbDhCgRFTquC+f7N7WU6pbVoPePtX2
         qKuYmU3a4uC7wmy9DQjtBo7vepAjo+6xlkJop8hpaNdBE7sRINEeUjJXGLVJev63zjMp
         eN1w==
X-Gm-Message-State: AOJu0YyaTVd/1eiVoRzDOkRovYOO+Z7gJ0fA8wTAm5chmbppJ9UT1xot
	k91u88a2Ar31+NfWwJHuaxc=
X-Google-Smtp-Source: AGHT+IHvAdtVCOCM0VreRerqB83H12IHnADRmj9a8fDFQRtDWT3/nlvul6XbQlcen4QGsNI+A1vNAA==
X-Received: by 2002:ac2:4db0:0:b0:50e:375e:735f with SMTP id h16-20020ac24db0000000b0050e375e735fmr494437lfe.74.1703243693363;
        Fri, 22 Dec 2023 03:14:53 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.91])
        by smtp.gmail.com with ESMTPSA id es15-20020a056402380f00b0055267663784sm2420469edb.11.2023.12.22.03.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:14:52 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH v3 2/3] cpufreq: sun50i: Add support for D1's speed bin decoding
Date: Fri, 22 Dec 2023 12:14:06 +0100
Message-Id: <20231222111407.104270-3-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231222111407.104270-1-fusibrandon13@gmail.com>
References: <20231222111407.104270-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_031459_010026_94F92860 
X-CRM114-Status: GOOD (  13.63  )
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

Adds support for decoding the efuse value read from D1 efuse speed
bins, and factors out equivalent code for sun50i.

The algorithm is gotten from

https://github.com/Tina-Linux/linux-5.4/blob/master/drivers/cpufreq/sun50i-cpufreq-nvmem.c#L293-L338

and maps an efuse value to either 0 or 1, with 1 meaning stable at
a lower supply voltage for the same clock frequency.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index e8c2a1dc3..26bb5217b 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -29,6 +29,29 @@ struct sunxi_cpufreq_data {
 	u32 (*efuse_xlate)(u32 speedbin);
 };
 
+static u32 sun20i_efuse_xlate(u32 speedbin)
+{
+	u32 ret;
+
+	switch (speedbin & 0xffff) {
+	case 0x5e00:
+		/* QFN package */
+		ret = 0;
+		break;
+	case 0x5c00:
+	case 0x7400:
+		/* QFN package */
+		ret = 1;
+		break;
+	case 0x5000:
+	default:
+		/* BGA package */
+		ret = 0;
+	}
+
+	return ret;
+}
+
 static u32 sun50i_efuse_xlate(u32 speedbin)
 {
 	u32 efuse_value;
@@ -46,6 +69,10 @@ static u32 sun50i_efuse_xlate(u32 speedbin)
 		return 0;
 }
 
+struct sunxi_cpufreq_data sun20i_cpufreq_data = {
+	.efuse_xlate = sun20i_efuse_xlate,
+};
+
 static struct sunxi_cpufreq_data sun50i_cpufreq_data = {
 	.efuse_xlate = sun50i_efuse_xlate,
 };
@@ -54,6 +81,9 @@ static const struct of_device_id cpu_opp_match_list[] = {
 	{ .compatible = "allwinner,sun50i-h6-operating-points",
 	  .data = &sun50i_cpufreq_data,
 	},
+	{ .compatible = "allwinner,sun20i-d1-operating-points",
+	  .data = &sun20i_cpufreq_data,
+	},
 	{}
 };
 
@@ -182,6 +212,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
 
 static const struct of_device_id sun50i_cpufreq_match_list[] = {
 	{ .compatible = "allwinner,sun50i-h6" },
+	{ .compatible = "allwinner,sun20i-d1" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun50i_cpufreq_match_list);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
