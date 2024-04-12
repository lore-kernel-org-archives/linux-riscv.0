Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B6CC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 06:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/rsv8inJhngMwH2RITWvknbc7hPsZDXeMso7v3K/JE=; b=iaEXHq5yK+bXp2
	NlzmVmwkzK16duljCB/ocoWx1oRdHyPqOILuFiJW9P+EdKgg9webG+XyL9Vc/VqUd7UzJkO05lYgN
	lgeIjH2uzAcwunRhjn8H5fR56WAdg6EHkkyvKikG0UcZFOsno71KxNJSG5gEBDihmuslFU/v7dqAI
	IN4c5SZSHBt4G5OglvR1Pi+dVZ9o7NDBN/ALI0bHJ0v9SJkaDcIM6MEpC65oRSvE45+O0YB6uEAL1
	0dS/8dKI3GosMd6yd3YBcVleWhRd6FLFsvm9oJm2/0vdEG0W1szTvOQuW6QKItXZ5Jmv3zfqRWCmo
	HS99nkBWEr8eSv0XwLzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAjK-0000000Fdkx-2SKq;
	Fri, 12 Apr 2024 06:49:46 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAjA-0000000Fdad-0wqW
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 06:49:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e4bf0b3e06so6348085ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 23:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712904576; x=1713509376; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6E6ZusRhlxuRh8LTz85NPr0A8l1rMIJWkDOWsfceGk=;
        b=ZOB9NgbiWBxXOUvLsLtVJuaYraSlMjKaG8S4FBFo96tRynr5Mc+YKeEYwrh6AODVYh
         9xEcaZ6JRnneeKSHdQRU+SxUMocpN38B+RZpgFGSa+kXuDQhrfim+CT5W8Gh/7rxhJVB
         8i2DxIr+yPhhxQRqQcOSLoGFnwrrX7fuI82BgUwIAwIE/MSWGFWjdQII6sbdAxrUXZfs
         ccV4MMifgvzTJA86WpEC32N9XhMZW93q7O12+ZrZNUZP2MXY+kpy+F7S3mAYvUdovd6V
         Zui9JoKauVCXID7lEYRLWgErMkUj93x9piz6m64mVR52TcjtriTfEf/eTlMczXGhoZ6a
         wzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712904576; x=1713509376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6E6ZusRhlxuRh8LTz85NPr0A8l1rMIJWkDOWsfceGk=;
        b=mmlr5NiSs+ymVtQpnuS2MGMZVjnJA+ItsfJDPWaaKKvXr4ZSG9wCHSlclTwIs1+d2r
         OeMv2vXZDvV7YIito2toqhzol7Ud5m3q2/9HNs3OC55iyu8jaW24D60s+5A80QJCT2Ui
         ve0Dni4X/0TEFdb9ufoTcPovLws/tbkCE7isEXrhNORoV6EpdRZ3qsklVV52DddARUw+
         agMNjcXzRGEgXIutdtjMb+Fj+FY+bNTISJ54I/JA2HQn+61Yq9EOfOXrc3B4XrL+FrVu
         Pb1EGK/+5ig+uCZU9WX+rGotT12UMq1tAl0ycj8u2qRj6jXqW1Aq9/LZBt3j+JV5moKy
         V3cg==
X-Gm-Message-State: AOJu0YxOizdRq92yECxZIL4bfc5rT80E0UVR1OCsqnfnkubt94ZkFrkJ
	s5JEJmE7hLrtWFBZyLeB6PVlXvcgIlepeE2S+Epwk3SHl3czftIY+3oAInTTZzg=
X-Google-Smtp-Source: AGHT+IFN+2rlBM0atFvz5drmpqdxYuReC7akcGJxFgtrZUemr79CcqpTCReQ9/O3Fl7hLYkZ38tKJA==
X-Received: by 2002:a17:902:b187:b0:1e0:b62c:460d with SMTP id s7-20020a170902b18700b001e0b62c460dmr1459758plr.38.1712904575557;
        Thu, 11 Apr 2024 23:49:35 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm2258818plr.191.2024.04.11.23.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:49:35 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 12 Apr 2024 14:49:05 +0800
Subject: [PATCH v4 9/9] selftest: run vector prctl test for ZVE32X
MIME-Version: 1.0
Message-Id: <20240412-zve-detection-v4-9-e0c45bb6b253@sifive.com>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
In-Reply-To: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_234936_869304_539813EB 
X-CRM114-Status: GOOD (  10.55  )
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

The minimal requirement for running Vector subextension on Linux is
ZVE32X. So change the test accordingly to run prctl as long as it find
it.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v4:
 - new patch since v4
---
 tools/testing/selftests/riscv/vector/vstate_prctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/vstate_prctl.c b/tools/testing/selftests/riscv/vector/vstate_prctl.c
index 27668fb3b6d0..895177f6bf4c 100644
--- a/tools/testing/selftests/riscv/vector/vstate_prctl.c
+++ b/tools/testing/selftests/riscv/vector/vstate_prctl.c
@@ -88,16 +88,16 @@ int main(void)
 		return -2;
 	}
 
-	if (!(pair.value & RISCV_HWPROBE_IMA_V)) {
+	if (!(pair.value & RISCV_HWPROBE_EXT_ZVE32X)) {
 		rc = prctl(PR_RISCV_V_GET_CONTROL);
 		if (rc != -1 || errno != EINVAL) {
-			ksft_test_result_fail("GET_CONTROL should fail on kernel/hw without V\n");
+			ksft_test_result_fail("GET_CONTROL should fail on kernel/hw without ZVE32X\n");
 			return -3;
 		}
 
 		rc = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
 		if (rc != -1 || errno != EINVAL) {
-			ksft_test_result_fail("GET_CONTROL should fail on kernel/hw without V\n");
+			ksft_test_result_fail("SET_CONTROL should fail on kernel/hw without ZVE32X\n");
 			return -4;
 		}
 

-- 
2.44.0.rc2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
