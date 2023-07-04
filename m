Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C32FEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 07:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1V3M45iPnSxNf6Y64d3lgIrnmUUphL+0L+8H6+j2kUc=; b=ah5iKxti8WVpY6
	NYgQT0kQddcIUpKOLjvn1u5rMUX7LAIo2t/UqwGytSZofyJT52mRzxOxLArjDchCC+LsBHofxMy4r
	7D6VRPaWL6QbhZtE9THN9AxeJRNMnw2JAWXvAprWDltlBCALWIPdK1iw+kJRiYwNDAvFUFhwFRYX0
	EEOOry+aeln12QLK766/eHyjPjxfzUkut0Ko0LhlsUvruy/zN381UpeJLWUbjMujIt1HNbPlF0ews
	QMRrPWab4JMeDrm+Sdk2Kv+uL33mNDcrJUIZWjWFt26+SzoHWBZ+dgQnU+tkrJyHs6DxprY5H0dhI
	hVfT6FSTAwor6UPuvHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGaih-00CTGl-35;
	Tue, 04 Jul 2023 07:45:07 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGaif-00CTFq-0p
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 07:45:06 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fb7769f15aso8318312e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 00:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688456702; x=1691048702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=da1Ya2LZv3Pi8isMeSjt68UFYCIa9e30GSmEnk1v2WU=;
        b=YBFkVrQUVuVXwwqDBTbaJzy2/t3gm5gTRh4YaK09x3g6uBEJPRDKE8NS/9McR10pkx
         P5AOrhmEQMhod+anbEHbGZuuS+GpFejHfrmbGZ41RL1pU+LGRMXu7nUNqFqNWewQd4sO
         kf6i9i039rdr8OPy05gX4wq3SCdopIoOXFYGZAUtqBPRk1EBV1J+MLJeFuncm1jilmjc
         utZRmxMCCJlnOUm5KNtQYNVWgPztKtInGKQo8hp1wH/eg97MVKRBmFL4q3dXk7UgVviq
         v4RixJpiBg7Jw1cubz5N39ErtAt7ZxQltLf0KWtnzrTXgo4PhZw9d8kS17eXR4rb7a7Y
         tiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688456702; x=1691048702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=da1Ya2LZv3Pi8isMeSjt68UFYCIa9e30GSmEnk1v2WU=;
        b=hU+DijHipIfLAW3mYJIfJN++pOikM2VlW+sCFHI8QUGQ68Gm+s/UZzEF9DlUn7E/Vz
         tH/ElFYWfbqxdQpOAN2KU32cPqk/kNtngltQ34e90lll2fwEQ8w3438RXkilT6mzEY+d
         mEszmyo2+Ufkh5lKDqWYDFnAwWuu+nbmN0ZUO7A1SNKZ67TP7Q+Hbg8BvcUbUHebGS41
         Dkl3S7LRcrsfkZM2T6NsGOPKiJQ8kO/eNfa25W1Uo8zUB7dPDcTysdhWxB99FWrBQRUj
         JioJq2fMlnegkLCi0Sz7HgyylK3v0YRQ69xUr0u3sAqwlHwATqll2xtmBbBkRjspFrbp
         381A==
X-Gm-Message-State: ABy/qLYweL+R0duSEv4QB08KqJjbynJhsVx79sYZJMLEa0qjR7f1r/dF
	BeoD1P+ayVfJJXovBIcC+imJvw==
X-Google-Smtp-Source: APBJJlHvbp/jKnp3/lAXPD2+TrpDqD1OgqQPu97Sba0NY8V3T2Xj8Pr94eByk1JhAXXIELZd33oU1w==
X-Received: by 2002:ac2:4f0e:0:b0:4fb:8bea:f5f6 with SMTP id k14-20020ac24f0e000000b004fb8beaf5f6mr9893002lfr.34.1688456702503;
        Tue, 04 Jul 2023 00:45:02 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([93.23.105.195])
        by smtp.gmail.com with ESMTPSA id a20-20020a05600c225400b003fbb06af219sm17455668wmm.32.2023.07.04.00.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 00:45:02 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: Move create_tmp_mapping() to init sections
Date: Tue,  4 Jul 2023 09:43:57 +0200
Message-Id: <20230704074357.233982-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704074357.233982-1-alexghiti@rivosinc.com>
References: <20230704074357.233982-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_004505_300466_7ADC2563 
X-CRM114-Status: GOOD (  11.01  )
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

This function is only used at boot time so mark it as __init.

Fixes: 96f9d4daf745 ("riscv: Rework kasan population functions")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/kasan_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index b88914741f3d..435e94a5b1bb 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -439,7 +439,7 @@ static void __init kasan_shallow_populate(void *start, void *end)
 	kasan_shallow_populate_pgd(vaddr, vend);
 }
 
-static void create_tmp_mapping(void)
+static void __init create_tmp_mapping(void)
 {
 	void *ptr;
 	p4d_t *base_p4d;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
