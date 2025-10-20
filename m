Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F03DCCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 16:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNnWXRqoKAgSkCCThvyqTSsDruW6SOQQNsriki6XdDc=; b=NGCBbPF0JaHwgn
	u4mJYNAUGVJ2jmAPWaKvehoy1ANnhiFIPzHMaxKfP5tMcBXYSls4pbhvAcdlM4lkou7SFx5xiGKZM
	yAQSxWHthKi6S+39mTniA07t/AgSl1Cpxn+n8y6hfqdpzNtHX6hpWxFObLDiWEDc5e4jTfftBt8PQ
	M5+6pjX2WIoEjwi6eFTZE+JFzeqBp1PaSzVo2m6CiLX4A1GY3JnI5r6agoEV7nLHWzESWmlahd7X3
	RfxJLMUzOVQbrIVt6qzaJwOB+D3avVt2YUMBLDfjq1+WKKnTSIrQFMW2JmqkGgnJ1Ojb0fcuChkUe
	TbGHJxuS8LVybxDbUOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt76-0000000ENBd-2mzl;
	Mon, 20 Oct 2025 16:52:04 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt72-0000000EN9A-3hH0
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 16:52:01 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-430d0d37fd7so11746125ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979120; x=1761583920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAFHx5Fe28+JucgqjXAxBLPfwtGRK1k39/wAp21/umo=;
        b=n1SNzyQWOx9MZtTTEnO/skyJWo7yHRfPrOtVbcTwuYGghjT3Z8q4DEZbTmQsbSKTY4
         GibkLkUiwQjEVXb7hmJ3FMI7qlw1ppzgbFPEJOwPUOT2ZZuevpiyGWmJtOA8AymIDjWU
         XmnoqJS7gWVvZ3P3ZrO90p9kUZkmGq+4BwUEm2vWULdy2E+UL7zpMFQYVIvShLJBnaB6
         ujCYpdDESbfzsczt0ZdOIPgd9spJAnSnJG8sCMGrIF5n0TjGchJm9y+x7yOqTRHBZG2M
         eo/Ub3JZPOEWMjkV6fXcFLaB7VkxiujtdfaNPqdsk/NYBmn3hos4gwRVkWVhSvrgYbRF
         0Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979120; x=1761583920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAFHx5Fe28+JucgqjXAxBLPfwtGRK1k39/wAp21/umo=;
        b=ftVfzwISo28SDX7VuCDjHzEKefi79sDS9wXI8s+nqxLWSAZeQAsV9btJi++QacxK5h
         YfqmsSfYMKBjwI7mBLsYW03Sn4n9Ny7QCVdTox+WWSAxTP1Wjc2AM4y+7ppFxI7VP61K
         qMZY/hS9UvnyrnnU/YRuSkjiaQhE+2aWfmCNVIJ+iJqv4kCEoJRdY5vIiPEe2t3ZOAYh
         V3+zosqUiljE35ufecEfmjBddfCy8aStV9thSAcA/e6tJWXJ5tvM+caIvjF5cHEzWSnk
         W+rPP75LNpRuTsWd6WBcEwUIlO7MJEUFS/sq2FWAPA1laWUgPPp8qIZXjuqVQg4/eXzp
         aSew==
X-Forwarded-Encrypted: i=1; AJvYcCVbh7jdTGcEvCoiRwgpIO+A0pt+NenOg+stwLUz9TlwDUbamUzXpFG71iNAC92WXn2oOjUmk7kNkc9mFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXVnMweNgNlRgJ10TRXiD3w+DOnb41qV/Y4XB1TMYtyWfWGdht
	qn0LzLVPRMMR+6m+6+c8KwpzKd4FA04lN9tOV2MEoJSBhxRBUm9wtC0UW4pMXUlkqZ0=
X-Gm-Gg: ASbGncsaCzXprWO5cz24a4O3J/81LmYsASCrhNZ1FMviYcQ6SU4ioKkYQyS4mK7WS6l
	b7MN/VzTHnHPePv8cdNISj6cqsASk772RsBTFFOkUtlMdCCIy2J35jTyrBNHuAtrJ1pVj1rqceI
	RbZximZUloH/eBJ7zBsUzv6b+hPM+2o2+66Ex9mN/Sr3eYumMUDlsJXqtrAqd7RygrtfW6l71sO
	G2eWm/CPvuk4GufmjXnUHH5qi8pr51FcGDuu4j8DI0ySIVmkqk6PDKJeNEWfCpa5IFhHGRkmLKg
	jV2fKMdE8nBROZ121Vp94dReBqy8Tt2mMewYu7evBL5mzMadYkdHZeDeAZxf9sgmOYQtPHOaQyX
	YtPwjG8+m7f4HB2bbGMrkCJjHAv2BHqHkwdrT+XSX5AQh7Huqes3TpIGbEWkkO82l6GLf2K7Ef/
	TsioV7o4DBIgdk1nYtDc2ic0xHgy+KzpW9f2vERTDw/qCJGKhWPr07sw==
X-Google-Smtp-Source: AGHT+IGrysi/n+6wy3sDQX5W8PX80X7sxp0qMRXdkSjXbUhQItP2k8/GDMxk0YCbp0Wy5FwbdhktFw==
X-Received: by 2002:a05:6e02:3e8e:b0:430:ce63:4180 with SMTP id e9e14a558f8ab-430ce6342cfmr168487305ab.8.1760979119873;
        Mon, 20 Oct 2025 09:51:59 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:51:59 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Date: Mon, 20 Oct 2025 11:51:45 -0500
Message-ID: <20251020165152.666221-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_095200_919336_98811643 
X-CRM114-Status: UNSURE (   7.70  )
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

Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 0315a13fe319a..5bbda4bc33350 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -22,6 +22,7 @@ properties:
           - fsl,imx6ul-qspi
           - fsl,ls1021a-qspi
           - fsl,ls2080a-qspi
+          - spacemit,k1-qspi
       - items:
           - enum:
               - fsl,ls1043a-qspi
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
