Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC54C04FDF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 08:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdVngwqNhuj5uBZBbB8mwxiIL05v8ibbhRyr++erR/o=; b=uY3fhNcW7yNXHZ
	00HYabjXFixP4sqFzzfTygxL6p8vmNkcZMzdb2NG6tNuN4x4o/N8tKfxgodFb2djndKGPwM1l30yU
	7voWjZZfEDjydYL9Ss4AEYV7AnM2lXyDYUgK5Tq10WWdjt90io6s7z05QeuJhb70fOsy3DP/2a650
	EOMzxV27PTvO/Ccm/Bx5IPXgWotq4ZpwLGLSCau57tHayNuUE/CuQ6op53QHsF3/5P/mDsv50YnSX
	x+SVRUG9C2MbcKelkjTe1RQftpAEuY5IGxqJ22guQaDKm+zUkwPPQnF+seQfxHjcdgp4UDxqMfy2i
	ANnMk9hjwJoX4G52YYRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKESh-005ZFW-0T;
	Fri, 14 Jul 2023 08:47:39 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKESc-005ZCL-1s
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 08:47:36 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51e57874bfdso1975575a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 01:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689324453; x=1691916453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xfnzqz2i7m5w9zMzOs0RqunR9vvDiHlmabhYNl07DtU=;
        b=QRTexeIsaQuwzZmHHH1qWjMfaVgQohb1jM0TSX3h4pKx34oQYn6cbwXTCromOfGYcL
         Tta5/ZU3WfrIC8LZEwrhwIv6Fl5UViGAHoX4Z40wOK0wfmiDGYo6M1P6RYRh92tvEm1A
         lgjoNI1FK4t3XozduDsu/mzKG2HtaKxRew6IKwKC+SHAtHe2meEXKda8QekvCoagcIO6
         KTWXFl0cFonQ/GYkBq3XXft+Mu0GybbpwqYcmIi8CIbvPujfORGmzQPb5wgTdps6gVYC
         XOQqon7bQHYJpakPB9YpjonH7WCwfyozV/VhsVBrmvQZoqqXDWTApIdqBkRxZJmpK9Mo
         jkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689324453; x=1691916453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xfnzqz2i7m5w9zMzOs0RqunR9vvDiHlmabhYNl07DtU=;
        b=QIIgOCpLxGHcYVT+YeMZuXoQg7zD0U5EbCrNYteb4+q5j+BD3vLvyyw7FN6H+JigWp
         NF8vRgpU/vEfYQ+mOv355dDvYxM3VxE1Itl1qD2FhfDVGkGJk6mYH+aSyN/1O/cDLCbu
         tQraGVIDLeIZvWgVVy2A1duT2EGc2HGuqE/NDaTL6VNpVLkJ941zuEAmJDO+1II9mTY/
         jMAAZWX8cFVHulqn+ftRyOIF3cYaNNbI3+LUOQasueIPTW1Ye0rpxbqoDuGwWe+3XcNE
         opR/NaoNsgvRfOMSFOdLK6GjdQhpSQw4LlnPsxrlqCALnYizByEXn4CcMwxTLuFfzbTb
         HVHQ==
X-Gm-Message-State: ABy/qLaTFGshmhL0yfFyINnNm7rGbvtRkQKaFBFbSC05RL3C+PRL2chL
	QGEr3vrAmvHU3fiBz6QOtYX6MA==
X-Google-Smtp-Source: APBJJlEuf4i2pzMRoEofkzTMljBMlpAzj4iNGEl1v3hbp1MIkjUaSwOo0LcuFm7jwuef4HKv2BzhmA==
X-Received: by 2002:aa7:d359:0:b0:51e:4bd6:ce4a with SMTP id m25-20020aa7d359000000b0051e4bd6ce4amr4058266edr.11.1689324453302;
        Fri, 14 Jul 2023 01:47:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w24-20020aa7cb58000000b0051e0f8aac74sm5480662edt.8.2023.07.14.01.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 01:47:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Nishanth Menon <nm@ti.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] MAINTAINER: samsung: document dtbs_check requirement for Samsung
Date: Fri, 14 Jul 2023 10:47:25 +0200
Message-Id: <20230714084725.27847-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_014734_638232_AC1E730D 
X-CRM114-Status: UNSURE (   9.85  )
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

Samsung ARM/ARM64 SoCs (including legacy S3C64xx and S5PV210) are also
expected not to bring any new dtbs_check warnings.  In fact this have
been already enforced and tested since few release.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Previous idea was here:
https://lore.kernel.org/all/20230712084131.127982-1-krzysztof.kozlowski@linaro.org/
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7405fb6e38c3..9a539af4d775 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2632,6 +2632,7 @@ R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+P:	Documentation/process/maintainer-soc-clean-dts.rst
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
 B:	mailto:linux-samsung-soc@vger.kernel.org
 C:	irc://irc.libera.chat/linux-exynos
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
