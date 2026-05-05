Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5ABCD342C
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 01:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m5KpRYIVJN6y2JCFf4cfML268cXq/OERlEUfi9c37EQ=; b=l8F/W/u1Yf/pxi
	ictui66Qk/bykyWcv7qlIwnrNONxpYPS6KTXw9W9yIf68MGUPcSR4x20XKwcJfn2qvO5HFejX0HIe
	gQN7pq3fkTUQN4BqtiHCr7Yy7Fqjx7/xSMoX6SQPb0G71N8nuhOlPJgBvhHo4zJEGamMQVQUyn+yq
	YKOo4YVpLaz1o9jDiwg9Ju06zyr6WqJHRJWcarNiNXNwmRXcPTojKO4OlV4hz8+nHGwwzulPI1SmS
	4+l6N0u7K/oy1Z9GOnoaohNurbY7HH4A4OJMN6fOmTtY/N+plib4CTh0FXujHzfP4TlQcU4qDKdc3
	cStUXig8SsVKl7o92UqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4zA-0000000Eqo9-0Iv6;
	Tue, 05 May 2026 01:54:08 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4z6-0000000EqnW-1qwz
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 01:54:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-83537a80ab6so1320948b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 May 2026 18:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777946042; x=1778550842; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A4fW5IFCF+h7MNSs7mItaLMetGKpr2bIN5LAG6vg93E=;
        b=kLWJmyBZIyXbHnsXYcwB6ugXqI1hzCmYb43ovgldVi6xJX57Y8lxgD6X11+p3vEIes
         0jcgVjgdF15CZ/EIM7Dbe8fpv0tHVDMUjWQA/ukiL1ep28Qibt1c1xNQ+Q1ko4JkgcLX
         WZZLCo/byGMJDkfVvKQCw1aOGV0ZPRscrGGy0VZHaVPbMw1rYaoT4cAnTqoJ+TAnKPG9
         6p0CDk9IfQoJGFObGAt39D61S88a5hWgAP+Hl26aWs5dhBWWjETeioSnlvBDJsbVuFfp
         jlI7IGuKyFedNcPIZsCfdzzAO42B5Ap3VMHEb0c9Yythe5Fenn4DPk5Kz6szX4K94j6p
         xjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777946042; x=1778550842;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4fW5IFCF+h7MNSs7mItaLMetGKpr2bIN5LAG6vg93E=;
        b=Pe7T4x0zpkO0pFHDhyfFSO5e8d6Sbd8sJS7/fYLvXsHCb6DOu4dywJd7t6gEmskkEG
         cSZ4p7SvLBukMSLMl2kKsZp18xlkMPMuFmMtvYg6KJl2X9WmRpp/vYiejbzn3y3gXXrI
         912+DoAxOGbZ9/rr6NKcf7dRIqJdkUMoQbicBrWPnwN4HsFxor4oF7rIqd2zBo7eOeXH
         266m2y8iqm00T6Zi5ZVr9U2exN/DlcdKH1TaWv/v4HpNCay+X2eCJWA9EDQVsD/XCIuk
         VFcMaBg+OJqGuROApKHU3QQKmYhGk8UQG+YSRIIvKOPoniRktdQnu/HD6YaGalxfDES3
         5CAg==
X-Forwarded-Encrypted: i=1; AFNElJ+zKCFGlsVctb1utsmuPUk49l8BgfdRx9E48CAVh+TgO4iUUHdc96woeCErPyPUvHyQUQxbA3MnLPtLGA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp857X8R9fnoT3KRDaR33hPlnr7kkPcJqpY9wav1IqCnalhar8
	ZdRqhQihN7Iw3qUqYD4C8ehCeXyZlWkwOaRkdXfXvvfj8d/XmHjHziAG0THTpg5TlLY=
X-Gm-Gg: AeBDieskpEuiF+bnE/q4zpeOIL8jxYL7CNT2jedGvpv8ZjL9+2OzIrb3PKXBWy22Ggc
	yNOGcp2EZNTc1T13CY7R2yrm/P4iqRGEXMy9K5IAQUEeb/vTH6mI8J/nSQ916GTfT3kVqll8wZI
	tHjTdH8eJmW4SWLsOkKd1Tq+qrftZ2txbOlg7evSmZgNXrGYT58kws+eJ9uykjkxc9OcLo2Eqq1
	wVo1sSTFHtdUoWkiD9Ow89Jn1IG1q4Fd2GD4+Cp1xs6XxwacuO7kQDfbKfGl/eYb3wzmccfgrvY
	lfQWZ7TVwCcfEarxE2pD03Xb+3Qt3nhccQEuJgtupFyLpHtHrtjvsUPpZjsqO1DhU0nNrYAgg5Y
	ZZO1B/LNrqNa2VYL1uEdKLIiQvM4lFIOPqW+VH45qexz0L49z2aNoeDbobCGmuT3n5HwxCePAvQ
	IThUod2RNatsObN/ToxoTnebolKcL1Hnx68AKdCwH3vSusaXt4gp6uod2F22pglduB
X-Received: by 2002:a05:6a00:1250:b0:837:a211:4edd with SMTP id d2e1a72fcca58-837a21153a9mr6252120b3a.3.1777946042159;
        Mon, 04 May 2026 18:54:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3016])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a4bffsm211375b3a.56.2026.05.04.18.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 18:54:01 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 05 May 2026 09:53:34 -0400
Subject: [PATCH] spi: spacemit: add u64 cast to NSEC_PER_SEC to avoid
 32-bit overflow
MIME-Version: 1.0
Message-Id: <20260505-spi-spacemit-k1-fix-overflow-v1-1-77564c2e4e86@riscstar.com>
X-B4-Tracking: v=1; b=H4sIAF32+WkC/yXMywqDMBCF4VeRWXcgBqymr1K6iHHUsa2RjDcQ3
 73TdnEWHwf+A4QSk8AtOyDRysJxVOSXDELvx46QGzVYY6+mMAXKxDof6M0zPnNsece4UmpfccO
 qdK6pg/XkStDElEj/X/7++FuWeqAwf5twnh9PJHf6gAAAAA==
X-Change-ID: 20260505-spi-spacemit-k1-fix-overflow-8799dbc2ae97
To: Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@riscstar.com>
Cc: linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_185404_739932_91C486DF 
X-CRM114-Status: GOOD (  10.16  )
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

NSEC_PER_SEC expands to the long constant 1000000000L, so NSEC_PER_SEC *
BITS_PER_BYTE (8 * 10^9) overflows on 32-bit-long architectures
before the result reaches the u64 nsec_per_word.

Promote the multiplication to u64 by casting the first operand, which is
NSEC_PER_SEC.

Fixes: efcd8b9d1111 ("spi: spacemit: introduce SpacemiT K1 SPI controller driver")
Suggested-by: Alex Elder <elder@riscstar.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605050437.RS6mmV2b-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202605050317.Tf9j487w-lkp@intel.com/
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Hi, Mark

This is an incremental fix on top of your for-7.2, addressing the
overflow warning.

Verified on BPI-F3 with a GD25Q64E SPI NOR, read/write/erase still work.

Thank you.
Guodong
---
 drivers/spi/spi-spacemit-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
index 99db429db0b26..215fe66d27b4d 100644
--- a/drivers/spi/spi-spacemit-k1.c
+++ b/drivers/spi/spi-spacemit-k1.c
@@ -390,7 +390,7 @@ static int k1_spi_set_speed(struct k1_spi_driver_data *drv_data,
 	 *   ticks_per_word = BITS_PER_BYTE * drv_data->bytes;
 	 * We do the divide last for better accuracy.
 	 */
-	nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
+	nsec_per_word = (u64)NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
 	nsec_per_word = DIV_ROUND_UP_ULL(nsec_per_word, drv_data->rate);
 
 	/*

---
base-commit: efcd8b9d111177d48c841d09beca43b15d5b9e5f
change-id: 20260505-spi-spacemit-k1-fix-overflow-8799dbc2ae97

Best regards,
--  
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
