Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699A5CAC5AE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 04:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RpwEaGx5t3Zd3p8/lJUajLActzHh+Fji1ExzOavGErY=; b=EEFHfBol/9zb9A
	Db5nTGtiLoBXOrRIKoezdjjLY9ZAxfKAnIO210orkw7k75fwaAgJhBwq6mf83BKGFTwEGSCJ+aFvo
	xxsASKNCH/X4W1gVs4cDnsM4hblc0bkUUlHBDkASZa7BuIzcDIQicKTMBuMkV7z3mFVT9xe4nhUso
	iIxxRLBNEZ6DkZZbyADGT9pCrpxpEqw3rpNJdxtuYNkxY4burNcc4Bwa57Kx9GxssbaTH4kt/G6f5
	sVSKEUOvKn6e0iG2UBwtUFk5KNGHmCZdyLFElZoe2LufBtdzhXhJG4VLIxpdfm2fs4D4+RO5ZNA1N
	9QlSl0PQBWDZSv68m5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1zgH-0000000Fa6F-1DQG;
	Fri, 26 Sep 2025 04:03:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1zgE-0000000Fa3u-37GC
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 04:03:35 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso1627740f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 21:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758859413; x=1759464213; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jAvxUIgiwZnoN4z0j99g7O5RjAHri0iT1cfvlyji2fc=;
        b=Ez2ntdOE3/xdXR+6Oy5xAc6Rjeu/dWFQBbUUQVS6u+4iGj2njixqNjUud31uy1y6Hz
         1dwEmv8xXZ2UV8B8hZvHxtts+99TtvPclM7xjvV1B7sSXBEeqLhMqyjU/YE7AjbfE61O
         KXjqEIt+b8tuPAmf+dfuGPwSdjlADhpj5YtXN6IrPzV819d1EbIi8NcmcvKoBsEvJfiv
         aPUlW7XoJkYL6X4o3ynkZ147Qix86zgAiBTh83hH5+m5WtczqwQsZkmRvbwpmUr5e2Au
         WZUMGtU7nfXn/9RmGW9dXTIU0r2pV6hM7ow6UWMowPNm6kMrwI78Kmswf8FSTd+vuFQw
         ZXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758859413; x=1759464213;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jAvxUIgiwZnoN4z0j99g7O5RjAHri0iT1cfvlyji2fc=;
        b=jQ9KXZUJndsrW29NRQ0j60oPRl/NBgpoIg0LCYQ8KAKuN/aGlbLuBCujUrz0nPX7uv
         iVTKbMiD2fce6Vo0TtKFLB3GJKxAE7cHX4c+07cOrJm94CWzQ4MhYJhdMgE5e1y4HgHE
         aSR5tk6GGswGw7aS2rQpX9VCuZQuPvgSl80kvMONQNFFL4ehfR2T63aQ1t6GenrG4qcn
         YplmpcyIvlAsHujWiW63YN2y6PuYexhWbHPzEfrDhvVKlE/gA74agF7W9I5p4qqmDBWE
         luLDb19/WGvPr5sa7E4GTy3lCGf6jgki91Muvi+vRiLSTNetGg/S3dzpJLFFpJapLWmo
         8HIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnhvI9PoiHSKP27Rbi38vr9hSQGZ3dO9p8cMwZdP3kJ5o0b5LLXDpssm4h6H3wWSrRit/zRdzDqs6TiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZnLYJERuAUCgsAdrPrVABrysDoK54ohlnqxY5rZe6tgd8BCaX
	TXrifVDRyZrClquNq1JzxFWm1/r4VocK6wsO8AXgQ2Xxx7aSYQyKPp5pXF+KWZnZGyI=
X-Gm-Gg: ASbGncvE5DL6mCSPcIZU+9rqxAe48LwjvawHvPELMCP9BSpkZ1UbRh/Fe3YF25VK/Ta
	eeemfXAZiZFD/Ph4t3A08MsgSObHNNaDdAn/Gd8Dk2lcH8T92hQT9n23s8kPpC/hkTAXDlm+/cf
	WNvZptbzNYOmr4z0PLISyE7JrJ7PnyePJtE0fGBTFymnjr1I/eTXTmZ4FltKSZew5A6FUtOPtb6
	jghuMjDBrmBueovANkGRyuakdXwU5sFE5+5XgjQNCL9+wb3ZCf4pwcRFc2FD1folKg2Q6e6ueGJ
	2GpzLpwlTJvok/0gn9qxWy/qAj+9VnFnQz2iHrBNpY+XLdYhlwmJ/eIeO/ulmqy3F4h3Qswsmh8
	5yqszz/EmwMtqfcKrjVBY1zPCWvJ23+s5fBw+phgZ8a0T7X+vyA==
X-Google-Smtp-Source: AGHT+IG5qSGA+zLmaSVai6Z0wqDL5M4a9N7yHXLm/VuFTKV5wrkMZ8mE7n7IYfhWmV2EMBcPnVktpQ==
X-Received: by 2002:adf:9bce:0:b0:411:3c14:3aac with SMTP id ffacd0b85a97d-4113c1440f0mr2029219f8f.7.1758859412949;
        Thu, 25 Sep 2025 21:03:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e33bf70b5sm56361345e9.21.2025.09.25.21.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 21:03:32 -0700 (PDT)
Date: Fri, 26 Sep 2025 07:03:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] pmdomain: thead: Fix error pointer vs NULL bug in
 th1520_pd_reboot_init()
Message-ID: <aNYQkVuVpP3Daq7x@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_210334_787638_7118529E 
X-CRM114-Status: GOOD (  11.17  )
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

The devm_auxiliary_device_create() returns NULL on error.  It never
returns error pointers.  Using PTR_ERR_OR_ZERO() here means the function
always returns success.  Replace the PTR_ERR_OR_ZERO() call check with
a NULL check.

Fixes: 64581f41f4c4 ("pmdomain: thead: create auxiliary device for rebooting")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pmdomain/thead/th1520-pm-domains.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
index 5213994101a5..d7cb9633c7c8 100644
--- a/drivers/pmdomain/thead/th1520-pm-domains.c
+++ b/drivers/pmdomain/thead/th1520-pm-domains.c
@@ -179,8 +179,10 @@ static int th1520_pd_reboot_init(struct device *dev,
 	struct auxiliary_device *adev;
 
 	adev = devm_auxiliary_device_create(dev, "reboot", aon_chan);
+	if (!adev)
+		return -ENODEV;
 
-	return PTR_ERR_OR_ZERO(adev);
+	return 0;
 }
 
 static int th1520_pd_probe(struct platform_device *pdev)
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
