Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45D6C5321E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2024 14:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lpU0adm1JFw6MjrNud3Mr0EvrXV0DCdDYhyQzP98aiM=; b=rTS0OXuAogerpF
	vZpj0/jvXcxwFAwvIqM3rVbY7qts6DQ16ImymZUkQjOG17dh/eE6tbhzwb2ibBowujzuV1z7XdLRa
	JijPYcaB6894N3+LJh8COUs/ViOiEYiVsLZbapq+a21pX/EXbUvotGkcgq1kR39aBMdh0KtK7m7bK
	iIEPzCZaP0qwmIQRwNiq8EBuQwf8B6+K6g0PiVSaRjWYVPyolndD2E7TEoFm34vyPhFA4BeErY186
	UfOzyyBB7k1CNld3h0Nb1Hlas9MyV1/a4sQBkkTmWtvQJkNU/ebbeKmgRf29K1aAXN3RHPVFvm51t
	kBmov8C82QgJxNyYmDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE1b-00000004SWd-3T6n;
	Sun, 25 Aug 2024 14:15:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE0o-00000004SGl-27yp
	for linux-riscv@lists.infradead.org;
	Sun, 25 Aug 2024 14:14:36 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3718d1f5913so74045f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 Aug 2024 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724595272; x=1725200072; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YoFcw2YSN8fNBQRdNUDdvu+2vkq76xrOuLe4i+hjOWM=;
        b=Iz8u5BSiAdTt9qmKp/EmmST+mUnoLxRt4h1M1T1a7jQy/xnLnD00SVm0x8ISJ5sAWd
         M2XN/KCZb73oakSgQihgzw9sk/5//Zor8EX8zL82LJ1UM81medo90POf3wCyqIPSH4EG
         kgzcPFDJm/1uTYs0YW0DNm8giA/wzIHoIKDJtHCFPESnLWpi5qWojF083vzAahxni9wL
         WiA+zv4GG7Y1BS8mYVvCH6cVHzqtmxqNqU7n7eqtZ4Gvc83PKpU/f7+ntd3TmOhkGAmJ
         v/yJIdDKACk9VNBkSwAwT/dSGeyrPeJOTygQ4Hd+mWuuB1KN5pFOOU+q7lCB2Ulp8eaF
         rjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724595272; x=1725200072;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoFcw2YSN8fNBQRdNUDdvu+2vkq76xrOuLe4i+hjOWM=;
        b=gaY7eGS6ploipsiCv9vybZ5Fcfq45VX3wsw1v4WftSf4Aj4FQDmYwsGadZdhhoSb0w
         l69TZ+AJWp2SNZUtBcPCdDJLr7R3CpdeUrQUFjNYoVDl/R5ZptpQO24VS1vdmWqkwbX/
         2lTdnOjH5mTA8BxqsuBB8Y46ufgqBNzo3rWVOA2p84loontD7qNlzs07Orm0VDUVrfcG
         If33IeFVLG5UG0MkNmceMoF9vfnnYpLABstR1YO9oDZpvGcrduIwlCdRyMW/Bd96f7Oh
         EAxevFumxKACoJlASWCrD4ItR+0i5EyXP+XdtuUu8gfDy2SYuGxFSn2JObgM9FZZ3bYz
         mSIg==
X-Forwarded-Encrypted: i=1; AJvYcCXlX9wYU1pVqoxAsqASfOSj3+wba/znOO5ayA+0P9VjvoJZ7OiXUurE8VDfSUUreNki89cRZeuGT8IvHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz57ZhdZylz6JDnTwM7amxReRVqFZM9NXX78JKEtd7wVRGrOl+D
	levfZ+4KmnkGj14auE2a4gpya/+miEjdTxyDbFz39A5vydOjQ8tB33Z94/B3NR4=
X-Google-Smtp-Source: AGHT+IHh0Ll1HP8N31WmwAl7OJfgJMORIGH4OQ+QLhHwtkBEZUZkP57+M7JOktPIULTYmTf2110+Ag==
X-Received: by 2002:a5d:6d0a:0:b0:367:9505:73ed with SMTP id ffacd0b85a97d-373118cec54mr2938507f8f.7.1724595272516;
        Sun, 25 Aug 2024 07:14:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5162347sm122556045e9.23.2024.08.25.07.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 07:14:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] reset: cleanup and simplify with devm and scoped
Date: Sun, 25 Aug 2024 16:14:23 +0200
Message-Id: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD88y2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyNT3aLU4tQS3eSc1MS80gLd4uT8gtQUXTOTpCTj5CQzQ1PzNCWg1oK
 i1LTMCrCx0bG1tQBYNjHeZgAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=yxPhDatH5WUc7tuXzelfpRYfEptizh/+MwSKeXvQgIQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyzxBPdLr1mvgz+JNMlIGh2xNjNChB919QhZU6
 kvQ8y8h6bOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZss8QQAKCRDBN2bmhouD
 1+EVD/9IX0z/uMDEcCWffD+6AVh2mpulFnyUArfMZtoDny3TDw+LwhtG2MOgcd9dhJYuzm9hQa0
 APUdfdmV6DTjCyHzq1pxl7SZMVlcCYuqZqZce8CuGlKttARH6+KD4m5mHUnH+W2ABLWfS7SS3mu
 XS3nBC7x+ouFQ0Svd9hapBqTXq8LCK9JLd8Ih4PDKqnQdDlPa7Dy0tpDtAXOYmIwjj8Zu1fWjaE
 ngcLT48ZljMHLcUVfW7p9CAxLAy5HXOtTCG4Pb1jQyxiNSBC5s8GMR4MDfhGiHnlAiAYf5eevH+
 PvDTa3WQw3j/noAuW47zJIJE5OIdIwGGJdxjZ70UMryRLOiklPAr27xfF81UbVustuaFRdos0Kq
 TLgy9tVZ7KWlPEEGQvDholuG1prUa6R0jxTzs1PbWaEPXp6YQgSCUsVBeMdpsKzFxzCSvMOL5kK
 4yGW4Dc0ObHHDqRc8iUmAV9twMbsLmhvZaVNLQF1hMJkQpVtySBBJHLLBlJqfibxor99apan7y+
 rUvRW6WLc9RbzVydkFV/KmCByBGIfDtdjbIBWfzY7cjL22JYVxzwNEmaQ5P03BXP5mWK1wfMT2e
 QzrTz5sbuuzpJrtsigAVEgtr7rUAUdCJGZwlUrG14XjbBUM8SPL3eORxPod5QxdIQLSSTHDDUTq
 lU53/aEgBhcTKyA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_071434_609272_61FF1CF0 
X-CRM114-Status: UNSURE (   5.64  )
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

Hi,

Two simple fixes, which do not cover real scenario (memory allocation
failure during probe), thus not marking CC-stable. Rest of patchset is
simplifying of code.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      reset: berlin: fix OF node leak in probe() error path
      reset: k210: fix OF node leak in probe() error path
      reset: simplify locking with guard()
      reset: lpc18xx: simplify with dev_err_probe()
      reset: lpc18xx: simplify with devm_clk_get_enabled()

 drivers/reset/core.c          | 15 ++++-----------
 drivers/reset/reset-berlin.c  |  3 ++-
 drivers/reset/reset-k210.c    |  3 ++-
 drivers/reset/reset-lpc18xx.c | 43 ++++++++++---------------------------------
 4 files changed, 18 insertions(+), 46 deletions(-)
---
base-commit: e706b1fe2384d38e6e9edfb6d9e11e26873c24c7
change-id: 20240825-reset-cleanup-scoped-64bb3cb6157f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
