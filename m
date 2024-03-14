Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343A5C54E68
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y25JGuWMTsKnJAEyfj1Cz5+AmYMhaRnopmoBG7iHjp4=; b=xbxClKezg5wzPg
	81YEHvqYz3rnWoGOZiz7C3/2X4eMPE/O9YapO4a6sg4rAUpltpTPuwUPG3tQouezfsN3B7JhfpdUm
	wB2CEj3uceWgwkaciA3Fyq7IW3NkEBdyWbrV19OEOnshbSufRRQg8BnjvjhSY6BK2BgGzslE76Sta
	iquh/QGDqRPJaUBU05N6dbkJtpmttZupXdmGImqJYhGZ26+ZrXnO0F5SHJ9xRMS1QNByLrMPUhZAy
	55r6/r28H0lF0HoibZRMNe6FDy5wE6qBaEQuYesBeEdXmaAETv1/kIoIYunPpHrts2sehMAKt3xGk
	az51J6arLgfsJ5iRYLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2K-0000000Ed0F-2uAO;
	Thu, 14 Mar 2024 14:26:24 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2G-0000000Ecxh-3hAk
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:26:22 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e6ca3fc613so854779b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710426378; x=1711031178; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0RWcXGue/gfY9OKJ292NjaWEFAWIFQZ6x8/mR2rfnyU=;
        b=Yf225b3p1Usc1dITovrim0i58WgKfZWAaoCBktNlGLRIDa+G5C/zP9sSxsdnouzCMD
         aByrlNJtLxytxvff6uLn6h5PH6k1HftuH7F7aoBcI2IqZTBvKOSy4/fCCfgvmR2D/HCA
         IpL1WxNx5Qo9I7KUjK0XhfOwYSWNIy/qMUnTZ/H4Y+h29QkomM6hBVa2cJTU52m/pzof
         uTsLPQIyYxL7/9QEYScCic5/DKkW336nzXSd01aWJQLD0A7Yb8X3ALONwLLrxflKRAXM
         abChB969CeWz2cm2FKWiroEiJmqq4KtZbBsoM0lonO1nMhLDeFp5RwQwe7Vg7ArvGWYp
         +GtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426378; x=1711031178;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RWcXGue/gfY9OKJ292NjaWEFAWIFQZ6x8/mR2rfnyU=;
        b=Wz0femOR7Se48SHRCV9L5ovOo/hA5Huoi4X1bySk4gXMp2VPr0FPdFkAvgKlQ5mqgp
         DkgCfC/zwx4gXZvjJlZoDThAkkow0/GCXJX8pKEL2oVwY79G5cwvkSfqtWU7agYReyhK
         nIdoK9INrSyQfxBvBiWe7YLlE9sqhsqEs+Yg6UTtAmQgcW6oXWgWf28ad3O7X5NlfQ0R
         X+O976m5yxtYVC/iljPOyF6naJqK32JQnjP1//WzHwbtC+MkUkLEmmPG9j32A/rhik+W
         ywts8yZZl4ls1FP7xtkoU+qdjLESO0D9G/B4mZzF5ICMzVCkeBxI7Huhp4xsZuOCtqKF
         HdjQ==
X-Gm-Message-State: AOJu0YwhdVTR4VZ7lI3z0BwCumKIi1JSA7UTPqH9pl11ZVB3VA3DGBYX
	gTdhSqV+ZjmWBpve+wzwa65L1IFKP3x1RbeZSPMqLpcyNbewOI05Eqdl/blmS6GeWiqorZqK8be
	/T+IXcz5BplKVlWuqvQFtR2Vd0dCvwCx/c5VqCIqlKCQfLTt9wonZm7Kv23t8TBXuw/qVsej3SF
	a5tXLahmYQW3fSOGZeyC5riaDF3742dd2QTXLHRp+LGUgIeZ+UgKQZ
X-Google-Smtp-Source: AGHT+IHuftXG8zKdOyv+t0/jmpAE1s0mt2MOGG2qqQqNzQqq1oGeWVOUIWoY7YLK2500AaxV+K1M2A==
X-Received: by 2002:a05:6a00:1897:b0:6e6:c38e:e8a6 with SMTP id x23-20020a056a00189700b006e6c38ee8a6mr401804pfh.4.1710426378488;
        Thu, 14 Mar 2024 07:26:18 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y9-20020a62f249000000b006e6854d45afsm1556435pfl.97.2024.03.14.07.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 07:26:18 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [v2, 3/7] riscv: cpufeature: call match_isa_ext() for single-letter extensions
Date: Thu, 14 Mar 2024 22:25:38 +0800
Message-Id: <20240314142542.19957-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240314142542.19957-1-andy.chiu@sifive.com>
References: <20240314142542.19957-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_072621_151217_30ABCCAB 
X-CRM114-Status: UNSURE (   9.61  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Single-letter extensions may also imply multiple subextensions. For
example, Vector extension implies zve64d, and zve64d implies zve64f.

Extension parsing for "riscv,isa-extensions" has the ability to resolve
the dependency by calling match_isa_ext(). This patch makes deprecated
parser call the same function for single letter extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/cpufeature.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 36efc8e77ace..d836241a1f11 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -470,6 +470,10 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
 
 		if (unlikely(ext_err))
 			continue;
+
+		for (int i = 0; i < riscv_isa_ext_count; i++)
+			match_isa_ext(&riscv_isa_ext[i], ext, ext_end, isainfo);
+
 		if (!ext_long) {
 			int nr = tolower(*ext) - 'a';
 
@@ -477,9 +481,6 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
 				*this_hwcap |= isa2hwcap[nr];
 				set_bit(nr, isainfo->isa);
 			}
-		} else {
-			for (int i = 0; i < riscv_isa_ext_count; i++)
-				match_isa_ext(&riscv_isa_ext[i], ext, ext_end, isainfo);
 		}
 	}
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
