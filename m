Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71A2C5321E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2024 14:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1sfCmtlUwsqKJJgnU1JocSKDfIq6V5+l5iy1Ucdv5M=; b=KZrNB+kDY/B4QP
	RV2BVHv3yX+z9vCKw3DJmortJtiMNzQsa8hbrh5+j4FkvZQz+NM8MTYirzYYCZlhzs3yKVWrsi5aD
	ZtOP3ScRyHoKYVfVE8euBzJTp3GwSxznWL1xwX8hMZ3XIuyxdZTYXIUugpTaVcIUKU896Z2vE1h65
	m/fKHkZ/utPdrY1UlmtJRcP9pVeS7Gnej63NcihHIEGlY0PT4oyCy2uZTakk/QwC5n2AvGEXmaF4k
	ONNN7ACqPVBVU94rnV63TokRTZtcBYX3u8Xw+rLfKzI77lwDmqh4sKz/VR5gnCdN/2KKAc2m2cb7z
	6f/onxzoIQfQqusRC7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE36-00000004Swf-1Isz;
	Sun, 25 Aug 2024 14:16:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE0r-00000004SIF-3Y6y
	for linux-riscv@lists.infradead.org;
	Sun, 25 Aug 2024 14:14:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4281da2cdaeso5392115e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 Aug 2024 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724595276; x=1725200076; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgnZ6ZqZdmNcLaioI4ubaYNngOpE05oWSti+DXvBHck=;
        b=UnpXj9sMkUlalAg4cWJ6hJFo/WwRYxSlGRTR0tQlh9UA3l64C559QEPeZELzxt1Hrp
         kE18GA4cslHI3a+6YlUvQoNDQQXZC9rH8T9gqcUiH8e3paqVdEmudYVmT04YJThC6XRi
         TVsOtdYwK0mNIckuKhyGpDcwo42fmWI3FNXChrLFGPv5m5M5LCl4xLndZpSK/vCFGDNX
         tn32N/FQYzOm9+NTuJkOA2HcmSPs6C6XfRKZvMV1MpMoT573ncjxfdOdfj/kJhqWJqhE
         rn88ITkR5NO/PQcGFWLDm4vcoF8Z1XVQT1WiMnOAPD238UqjtPnV6r8YfkdaVIOZCP++
         Y4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724595276; x=1725200076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgnZ6ZqZdmNcLaioI4ubaYNngOpE05oWSti+DXvBHck=;
        b=qv1sWZ7VDZRXJK8zQlprGgoU44pI5nS4mS2kj3UO7t/0UighITVlitzgdN9lGiQUvI
         Am6KTP8p81bAz+y7NedR9TVFJW2Py3BjysCI4hgWY6HiqfOgpneaDDMTU2fW2+SGobp7
         vrXjMdm5PMWhBsEwZmJOtba6DhDHET/eTlSMt9wQ3+EaOBQmC9rY9vU87B1rsaa0xuZo
         5ons64TFIsNzeH2WkTGyGjQRADYL2aMM1cbnWhU264YXCoKFQ2ku8r+m4lLPMPXiSrEA
         85yDYBjFGlcY6jsXrGpBK6tfV7mDSFTX8gws98k/nKFw01h75yLOYRyICNSVPCPE4N4O
         7ezA==
X-Forwarded-Encrypted: i=1; AJvYcCXL11oLzr4dA25Ij2LAv/K82EIo7iFg0xwlSZLgT8/6WtDObRlBvoxSMgM4X62J+veIZXBGFmdOoccAVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrI8sE+khCGGI2YPnQ82zTfprPDZ250Kc+Il/KtTt53eyni3mA
	ty4xD/MiMidfSZtnfMbyrJFHq6mDO8N4T8le/GzU3MkuhFfstl/wm8nuXiqhQOg=
X-Google-Smtp-Source: AGHT+IFuxALm/fRk7IdAEl9tHnqRf3lkS/IQePpSj6npJhpr82rrpicyYF4ug/0SBMzTwrc8Ul4eLw==
X-Received: by 2002:a05:600c:46d4:b0:424:8b08:26aa with SMTP id 5b1f17b1804b1-42acca01063mr34147235e9.3.1724595276499;
        Sun, 25 Aug 2024 07:14:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5162347sm122556045e9.23.2024.08.25.07.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 07:14:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 25 Aug 2024 16:14:26 +0200
Subject: [PATCH 3/5] reset: simplify locking with guard()
MIME-Version: 1.0
Message-Id: <20240825-reset-cleanup-scoped-v1-3-03f6d834f8c0@linaro.org>
References: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
In-Reply-To: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Antoine Tenart <atenart@kernel.org>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Damien Le Moal <dlemoal@kernel.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Ytuccfgs9TsHyxm9hDxL6CEbdGnLEij+BN4ZXAevank=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyzxEEiERshJp4P/O36tRaMG3GnkMMvYxJ9g39
 bFAc2IS7BSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZss8RAAKCRDBN2bmhouD
 104EEACHYXj9r8WaYp2o9fRW7dCF85yE11j+zp1IjAWosumCqGUSVtaVcJW0o6mKFDOTGul1Wmo
 MGE7W1EzVXd2ZyZNNLAWa51uznABmwL5ZSkg+AyjwrZx1lfZXEzPZb+MKhf46k1xFZ9zoi0Onam
 AbtiaiV/t2b4em83210TuqxSqsc3eSpkq/AXPN82gw1cHeCNA2H46wvTQ8/rQnBB+nBvPwiaocj
 nmyC7d3OlrR/xjr7T1ulZN9Or0ze+vm1Y1EVBZ4j84sz/fwmxtFQBNmC6/81lInJ4OScRLCjQvp
 wlCsXhPQKhluGr0r2UOgtXk84h1kdik+M6u3yL5HNMK1QomVKwfFkFJaHe3UKbnedEJ1DhmJY6v
 /M1aagcB3QnKmvBfK4XUsgDMJldJs0jQgOxJp0dgd4oY4sK9hgojSs2m3lVpAe/YHT788A876/k
 C9gRgcuxs8Y2lK6ktL71UuVKnLQwHAOWimTwIDcp8rNJ6naGB5/iITiRkdBh1EC8VRiYrIK3CyS
 GXP0khpho7KVDnNld4Vu7c1kYdbGqm21HiJnuMCgPl/tX60dfG/NDMu0WxUNKYWnjz6Zd8OWvm4
 viMP4fPY4NQ+9emd1ZPd+/JbZEcBj3++KrIc7DKp/Ylzn1+ckWQHIdd/1yATfUUliOQ/kShZjZ3
 6L2Gi0ciWufsHyQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_071437_920142_49D0662F 
X-CRM114-Status: GOOD (  11.62  )
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

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/reset/core.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index dba74e857be6..c9074810306c 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -916,20 +916,18 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 */
 	lockdep_assert_not_held(&reset_list_mutex);
 
-	mutex_lock(&reset_gpio_lookup_mutex);
+	guard(mutex)(&reset_gpio_lookup_mutex);
 
 	list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
 		if (args->np == rgpio_dev->of_args.np) {
 			if (of_phandle_args_equal(args, &rgpio_dev->of_args))
-				goto out; /* Already on the list, done */
+				return 0; /* Already on the list, done */
 		}
 	}
 
 	id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
-	if (id < 0) {
-		ret = id;
-		goto err_unlock;
-	}
+	if (id < 0)
+		return id;
 
 	/* Not freed on success, because it is persisent subsystem data. */
 	rgpio_dev = kzalloc(sizeof(*rgpio_dev), GFP_KERNEL);
@@ -959,9 +957,6 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 
 	list_add(&rgpio_dev->list, &reset_gpio_lookup_list);
 
-out:
-	mutex_unlock(&reset_gpio_lookup_mutex);
-
 	return 0;
 
 err_put:
@@ -970,8 +965,6 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	kfree(rgpio_dev);
 err_ida_free:
 	ida_free(&reset_gpio_ida, id);
-err_unlock:
-	mutex_unlock(&reset_gpio_lookup_mutex);
 
 	return ret;
 }

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
