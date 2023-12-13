Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDDEC4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 14:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/ABF6KSlKkxOHk6B2d8BAKtLFKq0QYs0TKiA+soxuEU=; b=gF/JU7Tz3tHxzh
	bKSUB3zHS5HXPFHK9sv5B0S4s0QIHvQ3vsQR9HAsCMeGCIz/k4SsBbLGdgsqRaVjCia5tRQM6VeBM
	z026izlqOeDjwWnq7z/GDt2eNJ0ZPgblf6QaYbMmr49PIpCYtpiXvMqf3HqrdIk4EOMRtTQEduT7u
	BDKfknaSOHj7UwvjcAbdDzLhSVX69lAfVOm0MgMuuXEglg+FAH/4VplmIDUaSwdTGJqr3DrnRRTVp
	wT8o4Ssc8ZdbKJQY6A/XJgYNjY3x5LZZzBEftp3l+EnANUYZIykzcTd04dhL/RO0a/CfV/7Ka9350
	C2DfrnpNQZCIe5sKrzBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQVI-00F5SB-14;
	Wed, 13 Dec 2023 14:46:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPTa-00EqzM-1O
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 13:40:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c2d50bfbfso34584775e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 05:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702474835; x=1703079635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AqI6GpSVQ+KOsq7aMEboneAXW3QEiN4V6nA9DvKqtyg=;
        b=GU2HWxCXnxcIRj5PT2kUnP+jZs4mBVAIv/JSMqrwqypnZ3Ha6oCUlDk9o1z6u7oMmw
         ZIiw/zaZaEZjQwzOW9SPjbEqlRgTD8eEUElpc1nV7uGybqvJ1AqYC2uYU09n/Aa2gvPb
         UirzcwZXrNwAZlkC8fsPlrHzXHg8cxUdzKiUz3meSqURlUCL2xkkH88ML9PNA0ucYwcw
         2BKZeky9ny9+VZHOchbe8DU8+J7dWIuf/8upOoXIJOeKXNObf5VqN45BgioYfNB3H7GB
         VikeN4CX9Wj3F9nAV7jpfKksLVnHxuRoBzNiGMIKljEfcBnaFZ/FhEpfjM/xLNdkPwib
         2N5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702474835; x=1703079635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqI6GpSVQ+KOsq7aMEboneAXW3QEiN4V6nA9DvKqtyg=;
        b=INhyZ3esT7uyzizFxnbYeMPPBI4naQhGaTZQtxG4ZD9QAX0dV4enKVEzOywfCjbW3/
         tWX/7ai5SHNhAQUFDL/MwQhF6u3Kr80OSoVrSO03Ww+EifStqVPzmej2KCbS4sujvg9Q
         cAO5UjUgkvzyPMmZozFHWw2l9zU/8gT79iAbwvijB3hgodq3ltR41nsDvk6jSTFj4WeG
         Ggq6f402G44SFLiotHNoplNg+CYZd9IO2NLs9JNwfi9kfvutD2QAe7uIHHYkLZSgyNXl
         7TEQ5UL1MHbWu0hfRqSnCGBEcJxSrFZoi5OKtnKo/eaytVaRaxuV2TT98UI422YIY2yG
         v0Ew==
X-Gm-Message-State: AOJu0Yzlul7Em/4Z1M4WePtcAXW0CZ7Tz99lQXoMChSlz2QFVRC+CbVZ
	zs5aSbLbPNKKj9n+Z/Yzw5tplddxMiufjPAbIWs=
X-Google-Smtp-Source: AGHT+IFin2DG3KbOxzu8WGx9JWd1F8tLUwCZ8e4XQByR94yAhouvmUlh/NTRcf4WjOUyvcSF1HxEPg==
X-Received: by 2002:a05:600c:2a41:b0:40b:5e56:7b67 with SMTP id x1-20020a05600c2a4100b0040b5e567b67mr4163912wme.176.1702474834584;
        Wed, 13 Dec 2023 05:40:34 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id b16-20020a05600c4e1000b0040c310abc4bsm20892540wmq.43.2023.12.13.05.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:40:34 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 0/2] Fix WX mappings in the linear mapping after module unloading
Date: Wed, 13 Dec 2023 14:40:25 +0100
Message-Id: <20231213134027.155327-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_054038_466952_2937B55B 
X-CRM114-Status: UNSURE (   8.14  )
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

I fell onto a bunch of WX mappings in the linear mapping after a module
gets unloaded, this is because our module_alloc() does not set the
VM_FLUSH_RESET_PERMS flag (patch 1) and that
set_direct_map_default_noflush() must clean the X bit (patch 2).

Note that the Fixes tags are correct but patch 2 will fail to apply
since a change in this function just landed in 6.7.

Alexandre Ghiti (2):
  riscv: Fix module_alloc() that did not reset the linear mapping
    permissions
  riscv: Fix set_direct_map_default_noflush() to reset _PAGE_EXEC

 arch/riscv/kernel/module.c | 3 ++-
 arch/riscv/mm/pageattr.c   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
