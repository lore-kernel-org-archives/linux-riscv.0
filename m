Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6ECCCD184
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 03:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PY4JrwDTDHrVX3ywWguN2+S8pZXCnyOlCMCIPg1SjUc=; b=qDEBg2j7nZRuZJ
	eFpqpxbGkwMdb9JR8v0IIckkeEwDsKHuoFwIXU8u7s4WnIz0fKjgpIDB0dM3yl1YNgkFXrUSAVOXY
	IPhZz7Gfark19F6AdX2N/P1VKs88VTV2y9nx0pmU2DIQuXi/rnKW0BiB7P+hkse9+AXt//bgoHXik
	/8kRBkniNRooWS2BlgMDiHnnS4xlHoRvHcSvrUQ6ZuxeJac4EgxIB7eazvL7xR1nFiohdBkFPeKqF
	vDVCdG12YGThSQZ9Za62TJQHnC7PR8i4PIh6mXzecqeZyv+NQrtsHrCZ5BE72r52O9aG9bShDni5m
	J05TZ8nKoT630dKtRDHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgf4-0000000Bmod-30ea;
	Mon, 20 Oct 2025 03:34:18 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgf2-0000000BmnH-1Fsk
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 03:34:17 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-3729f8eaa10so582616fac.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 20:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760931255; x=1761536055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rSqoF1bhRIMRZ/Ngttka/3cr36QgYmwYc1FwmVj14E=;
        b=OTbfPwnUlSmf6NxzJdFYm08wslWxZ+PTeEsNwashsxMyUOc4FMUMCvUP8lmpHcjv38
         oueVJerCkJlXoeQUQGsZWBdH2Rg7l8Wvvyy21J/z1rFh6xAGhDfp5mX0YYaf8Gv55iJ+
         I0kfZOD/OrdVj2FvG5oB3wQ2ifoTM2oYW9qqg2Oa90WoX9LKbg/MxwKXO4w8puvBw7Jz
         NkNuFNkXjE+g4+Cov1tAf0P7AJIB59ycQJpfgntB8ytGGyEKp26CuuIhL9PBSiHvLMwK
         HZXjz9VpKMGZn6P0sdqNBuQ6L8Y+mhbGpNgyYxaKqLHaR0VrbmzjuSBpLHkhvZ1/iQjO
         Qpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760931255; x=1761536055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rSqoF1bhRIMRZ/Ngttka/3cr36QgYmwYc1FwmVj14E=;
        b=vEOyzehsz7A8MjXxaU/lWMsE0IJ1yO+ExRjiBLZ4pSAQ0jAhdvOgFaBJOC9Qhh3jJB
         nz2adq26apRm/GIaBgDXMJDm00bp2bpIaxQkAUpP2OzdgrpGRd1mNsZAjaUqAVlWwiS5
         MsqwE55xA6y9sKcRcWszEhn1UV1iKr1nwlSiWrE+2ds82nmTSYP+/fJn7hktvP4Y/jKS
         4yxMbNzBm/gJGW8+tOrFvmm33f9xp2QRUE4CDsa6+O+Fg8xFC5w5N++n3HzPIg1yOrOv
         fkP1dyRkM8QdpUf30EZsrYmNorBcJvGNW+3EohgrZynjxfDkSf35jmID+mVkcRFuEgDf
         ptMg==
X-Forwarded-Encrypted: i=1; AJvYcCUoaZPjPqgxSwXVpBAlXZhb0GYpPJflVmwJ1aBuw3n6gct94XTqVnPxba+o4G7zSJXEzn8y92VDGaqHjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyV4SjIVQ7LAInidU4hs92thOsuDgUfXlW0Yhf3Xn7wY5Hj/qPB
	LpSlRzOKLHKpgd6JEvSH8yDScxh1Qwn17uYDfKjhPLVHx+d8gWBBoM6j
X-Gm-Gg: ASbGncv8JLk4Nu3/qCZawU2KBNJWJsmwg8qiAzsIWgakVwPsc5Fcyn7p5WlBUFtAHLF
	hOTGNlZA50f1nW0sfjh6dTyfvzpbB7DCUCaFb3bUo3GEJ6NaT5qu93VtSKZ+BkRpL5xJZGf+yUb
	wO5EK6YQZCsFWBIvmvfdgJ6IqDBShepz8kjaDI0m9G8DkOX6bre/MCF4Vg9WJ7G/b/9AcwoYGCh
	Ykf6WRoPDfKUjYZ6/fBh11+LiBxAskwvQ1rztyNKutAN4TFqtn7sCrxbWxQwcnTZAAoJleqbGHC
	LQROGrigLxjy4IHUGFwL0RlJBDlV7XCqr+elvVaWaruFY9x1QRwAeHTeRlVJBEMflGf9NSXEXA9
	ax8r5+1x4y1TzclpOoy1vZFQ4pctK2O+sYL84ScT0zMVXr3QF/DOHIryNfESxOlionWbeT/140j
	66fO8Z94tDoZlcVNwTBbNt
X-Google-Smtp-Source: AGHT+IE9q9Mk98lP6hBRl0yUU492JUXYJJQ2DgdO+Y4L3lDypf5RtaLyuDaSNhzNdoqOYTgHdrMLwA==
X-Received: by 2002:a05:6870:2b12:b0:331:9036:6151 with SMTP id 586e51a60fabf-3c98cf43502mr5122705fac.4.1760931255070;
        Sun, 19 Oct 2025 20:34:15 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3c9aefc51c7sm1878073fac.8.2025.10.19.20.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:34:13 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	rabenda.cn@gmail.com,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	mani@kernel.org,
	liujingqi@lanxincomputing.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 2/4] riscv: sophgo: dts: enable PCIe for PioneerBox
Date: Mon, 20 Oct 2025 11:34:05 +0800
Message-Id: <ec474c5eefb79626dd6a4d65454da9109aaf2f4d.1760929111.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1760929111.git.unicorn_wang@outlook.com>
References: <cover.1760929111.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_203416_337006_0455B1C8 
X-CRM114-Status: UNSURE (   7.79  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Enable PCIe controllers for PioneerBox, which uses SG2042 SoC.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index ef3a602172b1..c4d5f8d7d4ad 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -128,6 +128,18 @@ uart0-rx-pins {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
+&pcie_rc3 {
+	status = "okay";
+};
+
 &sd {
 	pinctrl-0 = <&sd_cfg>;
 	pinctrl-names = "default";
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
