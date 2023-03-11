Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B23C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 11:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uWInq8wwhVXTP4UUWdJLMmPFDP2zMOYI4QWF64cF7X4=; b=At+7wCavfMSBX1
	rT1yaueTXviQRndRgxBRyJ5iz6pLvT4bX9pVY6P5lAzZjpdNkaoUSD9xoxag+PONuqUsSywU8U5yv
	nl4q1D99loeJtnMOj2LfSYiHTowx110tCMWTL6uQkETKqCDArt0dbs2PAtpPRD96Tj6PBxhcg26A+
	uX8L23OPGP/Ba7rsInWApEhQhgDiWzvEeVU70UjXZjPXPL/2lvHfOYi3VDJvZ9GBYQN2whqx0kTct
	fQk0es/+AxMEXreV69x9A6GMZk5m6atZexfzNtzoTQmTj82OIDDH26LAGntc4hq1DiqBnAe425o+4
	S255JaO5hOtLR/U9JdBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxA3-000Ecg-DD; Sat, 11 Mar 2023 11:13:15 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pax9z-000EZJ-JF
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 11:13:12 +0000
Received: by mail-ed1-x52e.google.com with SMTP id cn21so527253edb.0
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 03:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bq/suyyejHELTOKo5Lqe9JDVsAF8B3eTSU6jYYaw5rs=;
        b=GcR1BBQCdR4Nyqe7Dp9VmqBVN4+13vTx5EQOi44pJiaYeXD+D+mKtO4fvpp9GIPG7r
         BRskmMZAc7XIdFRRJjgBgEQ1P5GIFa4CF13JemkF79TJICvhP2c10MUllTPK1seye4pi
         re5dV0XML2v+mh3EmItQ33rYyB5W+zffyWOzFosg/rs/L4s7KEG0ns7ppsI7jsSDRr5F
         W2qiVDcRrk8B46+pmYoU4PIX7mUPqicOY9cvI7rvl/lClgykghEKJdGipn0oy64VBbz9
         cZ3ElInRGqJOoyxjVR0VwTCWuuHRceQZLGarrhTJRQ2bWjnZs0TKtT3xc/PFhZQxHq1+
         0p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bq/suyyejHELTOKo5Lqe9JDVsAF8B3eTSU6jYYaw5rs=;
        b=L/Z719Ef9YxozQQwKL1pNeobIaJZdp1fWWyKwWO6H08Aqtzq1FjUtNBiLAgatOVZtY
         ThecVtbhg1/66d21HfES8BiXUUBclOI0q0Wzdvkri+IL8ifmhL7y5kPfy95KJZUFlIkt
         EGDX3O/h2CpD8yul3uMqVeKRJzfA6gHahKeh4+3jq1//aqthVQX19UR+GPC5syrFE6xb
         BJLhXfQ7iikcPsVceM+83vFNLSvDQ8ovrWGKp3PnOqQl+Mls1qeuJHZYGuG1VbYYkped
         KE9WAxasgWxw3dTVHZkPcMfgkPIgN+RP6SvCd/DR3SQCfe7ACcdonkxlD0aeZZncWlUm
         bmDQ==
X-Gm-Message-State: AO0yUKUD0ddjl17NTJRoyb6QA48pRYRs4S55dfp336tv3lz6rTV17Wua
	uZyM/FQHhyOvwpyFKlDC2/Xjdg==
X-Google-Smtp-Source: AK7set9dk+CAqDZes0jxHQYmgJHEtMKUFbr5JbHgUMiQ/8tZWwFWDoce+nP6IcyAWHRx026mDdaNnQ==
X-Received: by 2002:a17:907:c61b:b0:878:4e5a:18b8 with SMTP id ud27-20020a170907c61b00b008784e5a18b8mr30977606ejc.66.1678533189212;
        Sat, 11 Mar 2023 03:13:09 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906bc4b00b008ee95ccfe06sm973189ejv.119.2023.03.11.03.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:13:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mun Yew Tham <mun.yew.tham@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Nandor Han <nandor.han@ge.com>,
	Semi Malinen <semi.malinen@ge.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/8] gpio: ftgpio010: drop of_match_ptr for ID table
Date: Sat, 11 Mar 2023 12:13:00 +0100
Message-Id: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031311_660395_808B5488 
X-CRM114-Status: GOOD (  13.54  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBz
aG91bGQgYmUgYWx3YXlzCnVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBh
bnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQptYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZl
biB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgoKICBkcml2ZXJzL2dwaW8v
Z3Bpby1mdGdwaW8wMTAuYzozMzY6MzQ6IGVycm9yOiDigJhmdGdwaW9fZ3Bpb19vZl9tYXRjaOKA
mSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQoK
U2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBs
aW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWZ0Z3BpbzAxMC5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncGlvL2dwaW8tZnRncGlvMDEwLmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1mdGdwaW8w
MTAuYwppbmRleCAyNzI4NjcyZWY5ZjguLjMxZTI2MDcyZjZhZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncGlvL2dwaW8tZnRncGlvMDEwLmMKKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tZnRncGlvMDEw
LmMKQEAgLTM0OSw3ICszNDksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBm
dGdwaW9fZ3Bpb19vZl9tYXRjaFtdID0gewogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
ZnRncGlvX2dwaW9fZHJpdmVyID0gewogCS5kcml2ZXIgPSB7CiAJCS5uYW1lCQk9ICJmdGdwaW8w
MTAtZ3BpbyIsCi0JCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihmdGdwaW9fZ3Bpb19v
Zl9tYXRjaCksCisJCS5vZl9tYXRjaF90YWJsZSA9IGZ0Z3Bpb19ncGlvX29mX21hdGNoLAogCX0s
CiAJLnByb2JlID0gZnRncGlvX2dwaW9fcHJvYmUsCiAJLnJlbW92ZSA9IGZ0Z3Bpb19ncGlvX3Jl
bW92ZSwKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
