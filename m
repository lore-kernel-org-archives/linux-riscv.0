Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE93C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48B5D61AF0
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48B5D61AF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fs3FHIUjjcAdnGCHDA0Efh36uSAcqSdJ6W7oVCiWBaQ=; b=Po/n9Gcp1hXk3S
	2TYb+bzk3ZyHeDzI5yhb1+rGNkGDIdINZzEkv35qEE5LfZAz1unUboFlxwWL/xosjw1XfJdTObP+D
	3/FV6KBlcCIGTH8Gr3F+yV1cTOxW38NHqNiFFjX60LhwjwIyy/07Jb3o/q3yjoOW7p1oakH5vnPmn
	staHn/QgWa9b6+Yzl7pUNFxxMQIRvU1EB40Ys98F3HbWySOoZPq1VwKVXBA6mFXOiSTNKFdAiuKJW
	r/En33kjE9x5fYH4uR/kxXRwyEuhNpoiJHaQnId5YQLAWFKvtNjZU4b4MRDhqhS3OF5mkF0cs5+qG
	DFMfc7CXp5W6D9tb6KMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo71H-00B6HY-CE; Fri, 19 Nov 2021 16:45:47 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo70c-00B5ov-6S
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:45:07 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so9253319pjj.0
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=XVDzNl5P4QbzIYx/RkvDJ3xwFO1wfoLlk0Fo30BJPkI=;
 b=w+LQmyRAZkZrbqIBM7nvAvs3Z346eAzu5bMdTRDbICl47c4BayUT7sbCU4Yg29klim
 BCC4W7GlnS4obt7mvj8XjZzdTaf9Z5w6Z1uOvmL59OIEZi14lM1xg9ATgRwjCpWwbWHe
 CtxBpQAQoGnbC8lzvvzxLfBvwrg7q4//8zuJHf12qb5i4Ftr+LdBR9x5gDOmmoyMh/QZ
 bADwvbynDYnGLkrHkhyx+saSAJSm2EXXzHR9gUhBkCfs4mpLQz7YJukFHy5Y98mhbp1v
 4sRN+kkGfbi8BUIlX2dyei7SCPwIbHZvB2dYGf+DjRfCTQ8TNPrxv4ivECdPGzA1Hc6J
 k4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=XVDzNl5P4QbzIYx/RkvDJ3xwFO1wfoLlk0Fo30BJPkI=;
 b=Hsc7O+1wdQAe9Fo4YPGntuJ/jE2g2J4bBFjD+DJSCzU5tyHvoKMgqSrlSa8baiBO2R
 6TQb5u7hD3nqdPgXzARxMGJKyg0QW87fhqYd455M15cYBu9D+BKcurr7cSZNoPVYZSG1
 lO53epTXSUjvJegvg0qrPM9++ibWDT+8R1bCmwqvXpSbELmqWuxwKx8mWJUUetu4xw2g
 gr3xhCZXLOO2J2LsoxkyTqgTzJt/2bmbyrBVSxstxmAxavUAybkvPQpFAYh4RJmUlQRD
 WHB803HXpfpO73qo3zBYw7uMPnOpgx6JhVgXOUWqsCTHhxptiTlwhnvpb4bqfhzl+IYY
 mjpw==
X-Gm-Message-State: AOAM531uhx0FAFlvsXpPpmwQpRKYJYYwDnrhvUcyl2Tj44Df3vGr1muz
 Y7LJomTvnlGTfAyFY/HakgtfSQ==
X-Google-Smtp-Source: ABdhPJyy4gAQ08NUgm/LC6JyiF7yQwuEfYBbqCDVVXx/a5iu9/1PwjiKlJJUKsSFiz3Yuh66waG5qg==
X-Received: by 2002:a17:902:9692:b0:143:d9ad:d151 with SMTP id
 n18-20020a170902969200b00143d9add151mr30611268plp.40.1637340304995; 
 Fri, 19 Nov 2021 08:45:04 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y18sm216925pgh.18.2021.11.19.08.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:45:04 -0800 (PST)
Subject: [PATCH 11/12] RISC-V: defconfigs: Remove redundant CONFIG_EFI=y
Date: Fri, 19 Nov 2021 08:44:12 -0800
Message-Id: <20211119164413.29052-12-palmer@rivosinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119164413.29052-1-palmer@rivosinc.com>
References: <20211119164413.29052-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup.patel@wdc.com, heinrich.schuchardt@canonical.com,
 atish.patra@wdc.com, 
 bin.meng@windriver.com, sagar.kadam@sifive.com, damien.lemoal@wdc.com,
 axboe@kernel.dk, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_084506_301190_535C4F46 
X-CRM114-Status: GOOD (  10.24  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

We've always had CONFIG_EFI as "def_bool y" so this has always been
redundant.  It's removed by savedefconfig, so drop it to keep things
clean.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index a72dbd74b93d..f120fcc43d0a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -143,4 +143,3 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
-CONFIG_EFI=y
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
