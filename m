Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A94C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/rsv8inJhngMwH2RITWvknbc7hPsZDXeMso7v3K/JE=; b=stH/WPbrESA84z
	oUQ6sa9QbQye0OUs8scDXbtNgd0UWorXx5BQyMUokrN/MigfVLBemFhodyrvot2Xq7GB/G6AHosb5
	50x0lCmEghLfgEpnJFAaETTVDMeIR/KyxoiaEXGwabeUzR5DHdDu6+CS7vqT30FhEFNVTE0K/yYfO
	5wAIMbzTnTr6AvroeWsQ0xULP2DWWfN1krovUaOyrUzheIRkyttnsz2xJlj5ee3HRjjFvaEQr5/3z
	h6sxOnGhSJIl04YkC1zo2alpHF8dhG5sekoSgGE4c6VKFif0RcCtLlZhO1JKUdK+1e1hRyOV5dW7n
	Rh9vCeLmfVm0ISUjvHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cl-000000022i4-2Uul;
	Thu, 09 May 2024 16:28:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cc-000000022a7-1Vql
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 16:27:56 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so6590085ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715272073; x=1715876873; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6E6ZusRhlxuRh8LTz85NPr0A8l1rMIJWkDOWsfceGk=;
        b=FD//LIzhPgGCHpmwLySh9jJN73NfFOxQdqTuzobGApGVpDAiCz5EK9fi6Vugf5MSDT
         LGgEY73QWQyeUHIny+rG++JsASyxSPqyxeRBIUCLnTYiW+Qt45v3THi+acZv97a1CaYq
         ioY6rqM7Y6pgSkcOyMHHenUPb1MlwhZ+oRsil3UrheCElxfeupNeftmJrFAXnV0Dqeim
         aXJbUwppgvhOyX9xStZvpz8k4y+TGUOP+lGomj1+ekeyylDVnoZw2kICk7AFoI2rBqMi
         Z/YX9Rv5vZfkGL+kEB8j9+e0/NS96VoBC8mXXBCmnfdnwvmwco9seWUuG6Xs9H3Id2pv
         kzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715272073; x=1715876873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6E6ZusRhlxuRh8LTz85NPr0A8l1rMIJWkDOWsfceGk=;
        b=cjGpLs824UpCDIEFRQRfvQjWi0P3iPPVOFwcrFZTrQ41KD5gse2oJ2GBTOHlWAP2BS
         5116KF3wa/sunkOUvB5H/PW5wEL8RVOAErw1gek2MK8ciXFrWZwCb7u/EH868y4IiqWV
         fFwHbMSKF0wGeZFv0yHK4WgSlIXwGktMK1CJBJ/zN/r3T6mWc9njkkCjQQxKGjB1fEf4
         qS+I+UBEkyHCfK58GkAqtDdTkd/ekBJYNp46wZF6anq3ZOBe28I53J/VmJ7TmAGgyshz
         tkDRxdJkN83Y72GWtW5/JrlzcaZMrFrv0Yu1gMXwrCVq0zU7OaJxaYztVktZWuqtTIA2
         BOVg==
X-Gm-Message-State: AOJu0YwghKvq26M7p1Q0Ot+Mt3h08KHn3YLTniO0zHHsWUuz3Yiloo9l
	djD5Sm7G3FK0mxVMVJfJnr/L0PRbNWNHiPauoh+YeqEc0WhQvnwESWX6Gao97R4=
X-Google-Smtp-Source: AGHT+IHxBUHRPrw0FqUS+OM/NY9GyC13nGox9W5GwUl+ZolYupUN16LsN4HIr69L69inYwc5kfUyjg==
X-Received: by 2002:a17:903:2301:b0:1e4:6253:2f15 with SMTP id d9443c01a7336-1ef42f74cfdmr2685595ad.16.1715272072597;
        Thu, 09 May 2024 09:27:52 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13805asm16210285ad.264.2024.05.09.09.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 09:27:51 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 10 May 2024 00:26:58 +0800
Subject: [PATCH v5 8/8] selftest: run vector prctl test for ZVE32X
MIME-Version: 1.0
Message-Id: <20240510-zve-detection-v5-8-0711bdd26c12@sifive.com>
References: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
In-Reply-To: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
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
X-CRM114-CacheID: sfid-20240509_092754_759172_12A769D1 
X-CRM114-Status: GOOD (  11.04  )
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
