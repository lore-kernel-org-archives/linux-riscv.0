Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9353C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 09:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qIwsZb6DseU/0J6Wj9wwbVJdbfqAW2NCo2ywhmjEA/U=; b=UjZXuW895lCMET
	qyYXdCHdp6XG85j55rhzysdRcXbORrv0mpRMEsrpovYaIZswXif/H6EsEOPyflmmuLe0Rc4UcVdQC
	xVIgVoEvBZS7/jB/k630Nabs6/sEJDcoD1eYqGZnyxylNsPj6cCaK6rK3YKW9GUQ7bCjmRkhTiFGN
	R+sNvw+kXkfLXnN0SNFYlAFTD+0GDX4nk0RbHeQWqZt+267iaD4vep+jKqNMt9ZukAgIh9XPgSYzN
	C+tnvJ3PTv7LCA1TuFbPMqtj9ZifAatrQrLNTvamyTUir0UlZnyGsw6nKs2w7sbPrlU5mUHDe7nT5
	A+tfAfrv/ZNMNheIqJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQWp-002tuR-Ri; Mon, 30 Jan 2023 09:32:44 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQWk-002tpx-TA
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 09:32:40 +0000
Received: by mail-pj1-x102c.google.com with SMTP id b24-20020a17090a551800b0022beefa7a23so14786397pji.5
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 01:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W7Rfwt1I+uGLH2WvGyjGS4z4+0W1oBU0PyN8+ybwBQM=;
        b=hCnLQngH722sIEXN1Gho9Wj1ujABjTtK8JX/cG3wwwGaTKdAB+ey7HkETd6oZpO8tv
         vLdoPzqJLerf49cPLSpjOorHVag3ybhXhpYr/77qmDgvjgzmFdT/0d3bxHOZj/e7n+bY
         t8uSp9ikhaT89Y8/DDu/f6YmDsbqbCtH9SHKNmJGAis1CHdAD2Vg/Us25RsC2Vxm6SGm
         6peI7uPrZelCCu4EcstZZseRCRQsCrohoNKVVIoWxmA+RdjN7nMbH43Kb9cIzmBoXo3D
         OU6oU5ZwPVpKtUhF3UDUADSHTLP/R+4DWP3Ll5ImHlmOricvo99OaP/0pQI1SvA4a9R8
         yMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7Rfwt1I+uGLH2WvGyjGS4z4+0W1oBU0PyN8+ybwBQM=;
        b=UoPipNNUj0mK3Y0vQbPYJ5+8n+Pj32k59+aVNLhxKKHz+PQKniCWRG0w3rKff/fwrt
         xaGF58Q2PE7WCtpQq2tw1FSba0p10VSbhh6fODBQrPMm13cqEjYJWklx6dSDwUB+JkFr
         ZbgRxajPvL1W/VZ/A/4bDv0FAf94ZSLQmAb4kkvCqlaBDbemnewrDt+eiDnTYHXCM6M6
         u0aRvDTGUd3iAslVIe6lVwbcw9UDPCk42IoB/eZbCRvhEgrg/VovZ0vd1RPvKFwtsi05
         H4ha+SqNRIHwa8mSlsQlxzxsp4stCsItvviH41WXJj4o5U1Lk0Jo2FGtK8FvbuVv7/Yj
         fVKw==
X-Gm-Message-State: AO0yUKU+hP/SLR5ehjpLLUbIB0rSh0TBO1udHJY1/Tcjrdz2Pn2NcMBf
	hHqXlPw46m2cNDZlsPOQwLzhgQ==
X-Google-Smtp-Source: AK7set9QLGZ+95SoqxDpz0fnhu2C6Btygt/5TP7yC/t6bY6mZyLjmV3rrULbqSgdQtIJkwB74RFyog==
X-Received: by 2002:a17:902:c406:b0:196:e8e:cd28 with SMTP id k6-20020a170902c40600b001960e8ecd28mr30471930plk.15.1675071155816;
        Mon, 30 Jan 2023 01:32:35 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id t13-20020a6564cd000000b004db2b310f95sm6245704pgv.16.2023.01.30.01.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 01:32:35 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: aou@eecs.berkeley.edu,
	conor@kernel.org,
	emil.renner.berthing@canonical.com,
	geert+renesas@glider.be,
	heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: nylon.chen@sifive.com,
	nylon7717@gmail.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com
Subject: [PATCH v2 0/2] Change PWM-controlled LED pin active mode and algorithm
Date: Mon, 30 Jan 2023 17:32:27 +0800
Message-Id: <20230130093229.27489-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_013239_048106_B241C1DA 
X-CRM114-Status: UNSURE (   8.92  )
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

According to the circuit diagram of User LEDs - RGB described in the
manual hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf[1].
The behavior of PWM is acitve-high.

According to the descriptionof PWM for pwmcmp in SiFive FU740-C000 Manual[2].
The pwm algorithm is (PW) pulse active time  = (D) duty * (T) period.
The `frac` variable is pulse "inactive" time so we need to invert it.

So this patchset removes active-low in DTS and adds reverse logic to the driver.

[0]: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf
[1]: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf
[2]: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf

Changed in v2:
 - Convert the reference link to standard link.
 - Fix typo: s/sifive unmatched:/sifive: unmatched:/.
 - Remove active-low from hifive-unleashed-a00.dts.
 - Include this reference link in the dts and pwm commit messages.

Nylon Chen (2):
  riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's
    active-low properties
  pwm: sifive: change the PWM controlled LED algorithm

 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 4 ----
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ----
 drivers/pwm/pwm-sifive.c                            | 1 +
 3 files changed, 1 insertion(+), 8 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
