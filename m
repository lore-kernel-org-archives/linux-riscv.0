Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147F3C072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 20:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eawESJtUgqzX9tWE3Hr+J47pQCZe6ZXlRCSFWckESUw=; b=v5922eSC7KCRgM
	XT8lDIExXl2bSPKn39ulppUdwbNMz/ThV1zklNcrKxLEBtVDo02F4nf85cW11bLqEVVLsb9JPlFlr
	LHXPAKU4GrXWUBPNY3zjQjnV0ScH0FjOp6ZU7cBuGib24w6Jul/KQTLWudddnmXIszUGy97/7gSi3
	IhTfldktRscG0xWY9qlUR9IXHTjkv6lLK+QnYcMnv0PX9T15kN9pILebgixTEzAKoji+CbeyzIZ/I
	oqW65LceQBDBzF6jxOrl0cTBHEEb82/WpeQ9LaNW/3a9WmJOuPajmYB1DweyD6lW5vZTfm4aSTc/v
	IGf5YgBQ8feKnri+RlNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r451h-007CM0-0w;
	Fri, 17 Nov 2023 20:01:17 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r451e-007CJJ-0X
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 20:01:15 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1ce5b7040e4so11148805ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 12:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700251271; x=1700856071; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5N8jhPC2zAZdLSZQNFglxA0EJk3ILNqkyKhBDD9MOWg=;
        b=ifwu6qagv4wIUio/5rCPD0TTwio4MFSIu5fJ1N/FW0A7fXIC6ye41CZhuK2AbusYIO
         asDg+5AKGznrUzaboYyxfGc/3SRfYCg618kSkEZXKJtm4kjhU2wjHzeucEFQ7QcGMmaS
         j7rAcgXas6dldq5b84J1CuXoyAEB74QR7lZqzzNScDbOXNsaARUrwV9dujKqY5VWEzaX
         WEaVmREY3PxOIApkpESRVQOO5V15XENR3gYNQ1+X8gIZLqJvz+SE2/KdRpOQubcUotTq
         HKr3DwpdA7ih3P8eW1IX5Ls9uJJDuRgg59L22zC0KUlhb8AnROFepnyy7cojHihlUXIq
         g8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700251271; x=1700856071;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5N8jhPC2zAZdLSZQNFglxA0EJk3ILNqkyKhBDD9MOWg=;
        b=AQIMHwlT1s6Y1PRVRwTdE752UyAJ0Jr0EhOVa84fZZLsuUIvSp4N70YopzPK3tKq66
         1Kj/UKMccOZGCz44hZH55eyrnel1WM1giLlpaVSIHdXkQK+joeYb957e9XjAq/g7NegU
         pebJBZmJBrgjhs+JWKJ6L2aqosR9byr1W0rqgffUxs+Vn25yRSkN3gAaDbwiHQNFjMzh
         0mhrRiooQlJPWJ/iEfwPzgGRdsun36ZwakgW9ah3UGBpUOrnWF80tzNIvUZ+dcJXGei0
         NHKCkkzVZIzXcRQrfWStpjhCp5rbym7onbYfqdrO+ebp82R6TtrkmF0Y4FSgWYYePyaq
         Oj6g==
X-Gm-Message-State: AOJu0Yy6q2SfsEK7TFDFgNKqd8bcN85DEb1Pg8Hphoc80lXA5zg5P09n
	wEsYVcmFCXuNAwNlfn84/n2TwA==
X-Google-Smtp-Source: AGHT+IEtyI1dEot9h2n/T0d1ycxinXg8zY/heVfpoPKEeMwwX12IT+/3OVGyAeHlGjsRBtdvsTxuNg==
X-Received: by 2002:a17:902:ce81:b0:1cc:6d2c:fb59 with SMTP id f1-20020a170902ce8100b001cc6d2cfb59mr855254plg.28.1700251271032;
        Fri, 17 Nov 2023 12:01:11 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id bf1-20020a170902b90100b001b53953f306sm1749737plb.178.2023.11.17.12.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 12:01:10 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/2] riscv: Resolve module loading issues
Date: Fri, 17 Nov 2023 11:56:10 -0800
Message-Id: <20231117-module_fixup-v1-0-62bb777f6825@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFrFV2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDQ0Nz3dz8lNKc1Pi0zIrSAl0zS0tzC/MUy2RTM3MloJaColSgBNi46Nj
 aWgBtf/pqXgAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_120114_544913_23DC188C 
X-CRM114-Status: UNSURE (   6.39  )
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

Previous commits caused compilation of module linking tests to
fail on rv32 toolchains with uleb128 support. The first patch resolves
that issue. The second patch resolves the type issues pointed out by
sparse.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (2):
      Support rv32 ULEB128 test
      Correct type casting in module loading

 arch/riscv/kernel/module.c                         | 8 ++++----
 arch/riscv/kernel/tests/module_test/test_uleb128.S | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)
---
base-commit: 9bacdd8996c77c42ca004440be610692275ff9d0
change-id: 20231117-module_fixup-699787d9c567
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
