Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DB5C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 06:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnbptbPd82blWdPa+RcgtJcBy6Zn4gmFyenZW72M4pM=; b=Sp51bKu9Dbt7tQ
	5XHvbzLIHRKPMTetFW4nz2+BskJefJEItp2mLA75C02mc0paa5QdGZym800dhvHWGItmGuTo4Wi09
	ciQjy1o/yKfEihiCsM50UKU+vbRsuWac6W83KkcZG9TSvQ1yqmbe7wOE122+Q3GtbIvI2toaHnCII
	8iFVJaAEIzeCmu2bE2ZW0AT1h+g6RayG/SqxKV4wboaMuKSEhAMvNcrhYgCSTQI80JAdVLa5AJ3If
	D3AY1XZBuOY+7gnyFYBa9Oqt3iqCuQF/oJOh2N9Ndvw/eiC/wv067fB2d5Or2erNlnAWkPs0fvTF5
	OFix74lu2ffF8cj07HkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAik-0000000FdHT-2QKu;
	Fri, 12 Apr 2024 06:49:10 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAii-0000000FdGO-0sN7
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 06:49:09 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ed2dbf3c92so478717b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 23:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712904547; x=1713509347; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srXw+GM0AbxLDkn2sukHjOTHYGaz4TEKS2v/bKB+HwE=;
        b=WTH+Mm64j28fmeUwAFdcKipjm+P6aU4Z2nhXBixOqiw+5wgWDy0XrpqAKI6x8TBPcI
         aw9F07dTtggpGBBtRX0wvXjeq3DFnFRVKaZeSv3GjM8bfeNQ2nncbCxBSquGTZQ/Di7S
         +GiwipumTLdS2nOWOFPCyjtGOYouZMCUyGRmEdAI8eZD9nXqbEFoXYoPg1dU2FLs+MLc
         qw/8LLId2GNTSfns3Pd8dCsKWPSHthVGtOCNwVymc8fv/KRhJ6BBfZWoQ8bIFmSA16SC
         LpuQH3fSKkqQPP0WbWgdWMgslMbpr3WAyIDKHPU9J8AcMxar13zEG0WW6Z+luyi8wMUc
         qwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712904547; x=1713509347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srXw+GM0AbxLDkn2sukHjOTHYGaz4TEKS2v/bKB+HwE=;
        b=d1Du63HoEeN6r/FRNhVSIghhjim4VwIsspwW6oGHHP49mezsl3oTGGOO4yAOBDd/CG
         IlsyjL2StijuGvT0990XoRpuT41LL1wsrMZhQUmQqSPcWgcLkQ49WwZDPiHZGYYj1qGk
         2VPeljsqgt8lVVBIajvLRL0edrWPN7JByNW6mYHhp4arbwcbapSZH4aySLcUGwjJkWPi
         rL0eeENyf9vmb8nJ/7xGkhc12hAjHa9vk8SfKCIwI3V0ru7aKI1LHGnVSd5f52eZ0l98
         V7B/TnXBZI9sguPNsMDG3BFMPhbVeNh1a4IVOlV/RaL8A8vV/K4P3nQpkJUwBC1bnebn
         VRhg==
X-Gm-Message-State: AOJu0YwphkL9FyIf7pryhTZfM5hoVt96BRl7lacnf35KhVYo9LpKCSww
	KZDvbDH0ohZvz/pYgmVEhB5jOEUaeQK0yYTsXugpuxM5GJ5yYMFZFbIA6YsgdpM=
X-Google-Smtp-Source: AGHT+IF5X1v/E+xWlHK5pNpmDBocfNqmMv4DyaPfDHN3Yc/L8+Q+p/aEL01S9Eh4YMSg/dpHO62FGw==
X-Received: by 2002:a05:6a20:bf2a:b0:1a3:afdc:fe5 with SMTP id gc42-20020a056a20bf2a00b001a3afdc0fe5mr1702435pzb.42.1712904546736;
        Thu, 11 Apr 2024 23:49:06 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm2258818plr.191.2024.04.11.23.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:49:06 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 12 Apr 2024 14:48:57 +0800
Subject: [PATCH v4 1/9] riscv: vector: add a comment when calling
 riscv_setup_vsize()
MIME-Version: 1.0
Message-Id: <20240412-zve-detection-v4-1-e0c45bb6b253@sifive.com>
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
X-CRM114-CacheID: sfid-20240411_234908_298751_1843C5A3 
X-CRM114-Status: GOOD (  11.92  )
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

The function would fail when it detects the calling hart's vlen doesn't
match the first one's. The boot hart is the first hart calling this
function during riscv_fill_hwcap, so it is impossible to fail here. Add
a comment about this behavior.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v2:
 - update the comment (Conor)
---
 arch/riscv/kernel/cpufeature.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..d22b12072579 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -683,6 +683,10 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		/*
+		 * This callsite can't fail here. It cannot fail when called on
+		 * the boot hart.
+		 */
 		riscv_v_setup_vsize();
 		/*
 		 * ISA string in device tree might have 'v' flag, but

-- 
2.44.0.rc2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
