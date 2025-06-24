Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250FDC7EE33
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oW/y5QKeW5nl8k1jc3aqwCW+iauGb8Z6xSWCeIguw+4=; b=ewnczyIg6C8JPm
	COAf4mCU+eI8F1CSJuGbvHuEdPy5LaSJpVjEXWRBp2Wjw8Hjn2iOGmudUZFMPJXRGq9NQwrU45Oa5
	V57Yf9qopPaomYSnDbZKsyfDQTV7hqsObIwT/M3jZCHT1NqrJnPQ96GdqFeu0idHWKcgkb/NgbL2X
	6/01S24MvmUOYCXIgW4IpvBqvBwkrK+aPuCmGW2ihRjgW2CAtfpvCDRRjAmXM/ho52Dw56OAflLEX
	Icw858DGqJAPFrDJBRCrVf0BvMu+jYEDEPSvZW7hFvOLxEIlYAQLm9vctfOPpU/uf2jAlow6ZlaYo
	G931baKNvPy9iPzDx6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU64u-00000006DQi-1aaK;
	Tue, 24 Jun 2025 16:00:56 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4hO-00000005vLu-3sSU
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 14:32:36 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-453608ed113so48019155e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750775553; x=1751380353; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CNIW5cNjKjCoab6AIakbGKNTJu3VYBmTvjInHO0Kug=;
        b=AhsnR9h8RuWBUXJmiyiJxLDvn51/Sn76I+ebXtkxKFIxHR5hGBDpZvxRLP1LTN4RkC
         nN+s5Xt4FDX8YqiMxmd8ywwayF+LZ65pCQ7anUQOdRTXnywPLLRuqHS0eAvgQAh3sAz/
         ZyTmTWB/Og1+aW0c1uRS4Gkk19FvHS+zUiZFSnd2fTT72eOHKtYQFr9jDrOdI/VzrWVq
         yaD4iR/B6tVxmTeVqEnZkRZNiCWshKmN38vfDVbxF4X88n9QTSED5iSVOxwBruGHLFBX
         ez17NrjIbE0J6jXQhHHtMIYpHtGpsmdXnSjz54VZDtDbj0bCkXJYWxHBH+Fq3TKV6rix
         sIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775553; x=1751380353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CNIW5cNjKjCoab6AIakbGKNTJu3VYBmTvjInHO0Kug=;
        b=M7bA6dpOhUICcPzWgWP5zpSYlCpJEjDf5ehhjOAtZ2KHd5O7FVb6J7soZzH8TXjIDu
         n95VIX9Hw69Ah6dOVSHOkP7z9hpdEtL9/U9ABUOZkZJrTrU8M/a9wIIwetwB4sALE7ka
         Uhb1KrN/uoOBNfiS0ENkTFlSsL9oPdUNwWoyrqL+pKQkAzk7btLkTdo51W5vi5WtYvv/
         KVxk4EARcrCVlitBc496Pcuug1hdImXOX+qWLmdwi3ZgtyMoc4/N3eaHQUvEtOocmeoX
         8t0x4Uk86O9kLL1dZrZO4cQycmZYdwQfChXBeZCHc0iCo8i5Fy3rxoR7vBfhDJtshHMr
         i64w==
X-Gm-Message-State: AOJu0Ywd1F4DTlrUx7tykRcI4XmLAQHcEOPC1Om6XragqVu+4SJH5N/U
	CkAkbiP53Ttrcv/n48hX7QxUtcj2+sN1HhXU9nU7SBLFo6KLiKL1+qk37uV3sFug2S0=
X-Gm-Gg: ASbGncvoydMVj+co4bpk8xOL2vPVxl9WEJw7auughuQDOeGlKU1mRggGDOQloLK7xsV
	xIcwa43CZKwlxKmc0DqRw0lwGGGTGRNvBT6qITtaJfy380nFoIGWekQohWWxrc1m++Dy/9NGqf9
	89PtT0gWuj47VKgDDo64eHCs327HBzUeqvHtQQLlGQvSo9l35lrIhuMGYcYXQPOtKLMjfgG4LkP
	5gzANyTRRnyTpgH/WNfxZwod73IqKb9Dui67W0WAc9t2jWEI5FlESI1U9dZ8HRHCE6DOf6lIInw
	4ocNOo2xb/2xf4nMXxfUKKU/pIRvK/qU/BTbzJvIg3gMcNiDC09G2JHk
X-Google-Smtp-Source: AGHT+IGpuQeND4OkNgfppr4DzG+xyz0jUMqc4qLMdr3DGhKhUgWRg/xb9I4Kd3VA/X3bAzgBxw7ciQ==
X-Received: by 2002:a05:600c:8594:b0:453:9b3:5b67 with SMTP id 5b1f17b1804b1-453659f8324mr83368095e9.24.1750775553416;
        Tue, 24 Jun 2025 07:32:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a84sm178512935e9.32.2025.06.24.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 16:32:22 +0200
Subject: [PATCH 5/5] pwrseq: thead-gpu: use new defines for match() return
 values
MIME-Version: 1.0
Message-Id: <20250624-pwrseq-match-defines-v1-5-a59d90a951f1@linaro.org>
References: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
In-Reply-To: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yIgDwVNP75QjxnnqZUB0eGQftgqLdSGUdNGqQ1mRb+U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWrb6qvHHx1tWdZ36+EKv6o8uu1Y32EArBy66E
 w7IaTlvyISJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFq2+gAKCRARpy6gFHHX
 csZVD/9fv5ytgmoZV9N33yr8RMxpPBdNHbhkZf5RLOhy3kaBXhDurMDLG8dJ5gKQFjqAlE3EfXF
 eJv5toKg4IJYqISkg5O5CnP2z5+DYZLrVhsvD50ZTLF/SxmuoJr+Nm761WUIotQm/fyaVlG5L16
 YpuTxlQx32/iAfiz5p2zcoR3as535Y4h0/uPtpvx96MA+K4G/8iv3m416K1ucMaFiGKXFhLLdxG
 pAtEFKVWU4znKw8FzQfdwGV5D4Vpx0GpBGSz1VIT1hkhnLjgUgjXMOUmeWuvJtPm+lGH7zp5f/F
 83VVNmuppn2vC1clDinjXBZxHEyX6X2nZ/tDgXXJr3UI0QeOrJH8cq3Yz9sgkFlHKd/Vw8/N9nA
 G1QqG+Prg1iL8tX0ntGheLYp52P4yVg2LCc+G7T5btmiuvWE9gsU/hU/4eW7ogsbrWHCDwJ1dYj
 i6mxMhkOLxVjNB8GnhbYq3D/kNwAcJHyaUIebLmPmjgf2iaioEnWBTJajwEr0CsJCq851pDlCPg
 7uQrZiFWMv3OVzsX653lXcONTHxlEZM/yTNo+UcguuyUI66JQY3pRu5H4NHxUwXRtnu01VcND7q
 uZnFMJVi4uupkyRhrVT7h6v7UGwdJhtA0BsQXRbI+gveepJ+I2hjVNjbzRo+SBDsDh6O61455YC
 +QHJk5DawusRH0g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_073234_972415_F3368344 
X-CRM114-Status: GOOD (  11.07  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the magic numbers with proper defines we now have in the header.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/power/sequencing/pwrseq-thead-gpu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-thead-gpu.c b/drivers/power/sequencing/pwrseq-thead-gpu.c
index 855c6cc4f3b5bd1aa6e93305af0417d5791b092d..7c82a10ca9f6917e673711c55dd5e58e58dc8f5c 100644
--- a/drivers/power/sequencing/pwrseq-thead-gpu.c
+++ b/drivers/power/sequencing/pwrseq-thead-gpu.c
@@ -124,24 +124,25 @@ static int pwrseq_thead_gpu_match(struct pwrseq_device *pwrseq,
 
 	/* We only match the specific T-HEAD TH1520 GPU compatible */
 	if (!of_device_is_compatible(dev->of_node, "thead,th1520-gpu"))
-		return 0;
+		return PWRSEQ_NO_MATCH;
 
 	ret = of_parse_phandle_with_args(dev->of_node, "power-domains",
 					 "#power-domain-cells", 0, &pwr_spec);
 	if (ret)
-		return 0;
+		return PWRSEQ_NO_MATCH;
 
 	/* Additionally verify consumer device has AON as power-domain */
 	if (pwr_spec.np != ctx->aon_node || pwr_spec.args[0] != TH1520_GPU_PD) {
 		of_node_put(pwr_spec.np);
-		return 0;
+		return PWRSEQ_NO_MATCH;
 	}
 
 	of_node_put(pwr_spec.np);
 
 	/* If a consumer is already bound, only allow a re-match from it */
 	if (ctx->consumer_node)
-		return ctx->consumer_node == dev->of_node ? 1 : 0;
+		return ctx->consumer_node == dev->of_node ?
+				PWRSEQ_MATCH_OK : PWRSEQ_NO_MATCH;
 
 	ctx->num_clks = ARRAY_SIZE(clk_names);
 	ctx->clks = kcalloc(ctx->num_clks, sizeof(*ctx->clks), GFP_KERNEL);
@@ -163,7 +164,7 @@ static int pwrseq_thead_gpu_match(struct pwrseq_device *pwrseq,
 
 	ctx->consumer_node = of_node_get(dev->of_node);
 
-	return 1;
+	return PWRSEQ_MATCH_OK;
 
 err_put_clks:
 	clk_bulk_put(ctx->num_clks, ctx->clks);

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
