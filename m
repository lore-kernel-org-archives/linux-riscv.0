Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C81E63C8E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 05:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIhY4PdxUe61GfWqHY2kfJSCoPu6UomyIyPbYsc8qzk=; b=ZpeEGhXC956EtU
	bJLcdWywMiM9nAa/1lUFup+ds2a3seuOqRww4nX7D67HQ9jGuQRovL1mkvzCZhuzHe0mfMnQ+ssrr
	zDGWJb/uQi/gqSswkUx+E6/uXPCXB7aJfuJ7ipTfNnqG9+VbUoBE3RYqX6YOBOKR/aOvOsJ8rJ7yg
	1woDrEkAbR3ntN1660r+qA9O0zri6fA7Xr8YNCepVaoaRQKK31j/ikmR+IW4VuUz/p9aflZwUe/8T
	o4Q+EIi5zsntZnY+p3yy95iksinJDMbNipT9JbONwz5o109xSvGucAnov+R6EFdKlxXa/LvCpg7dq
	AdVXAYoz2mEv4IR81SbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjszL-0000000Asu8-0hJi;
	Sun, 25 Jan 2026 05:48:43 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjszH-0000000Ast5-1VaZ
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 05:48:40 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-823081bb15fso1800860b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jan 2026 21:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769320118; x=1769924918; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4A63a5MkcfqNFPDYb3h6iUN+5H/Fq6V9l7kfp7+HlTQ=;
        b=yh/WZpPjqKEkn596SeX8ytNe1KVAjawRpwIl8RNPo2k/f06PBq1bdWiaASRCcja5WY
         FHRggtMJQ7nxKSo5X9bmUKkJKTKSlB1/MEayz5MPM8JRPDSln0qeLfpyzAtOTs2oKX41
         Cg5VAEzWGVNHh/KiCBYvrCzoXDNSNMfVJdE/Ttll6vt0CywZNE/7he2z19FsZ3GRnHKO
         1OPDsZXNSN4w8DfLaYWwtfDWwYVtCA0rUCX57XprwZ2EtfzlGyOcDJopxiBFuk7oPfuM
         xacVVpw/tsWgfB916cPbDrqy22iKBIjDbs5Zo0w6ge4f3WzQ5CaYTo15EpmoouqI3cvW
         6ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769320118; x=1769924918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4A63a5MkcfqNFPDYb3h6iUN+5H/Fq6V9l7kfp7+HlTQ=;
        b=MR7UodNSUqPHSaDJGNRcirW8hvR2++p0c7ZPQGNq5uul8u+KBHKj6RF1tSjekZpVS/
         WzhwO1t59JPafXextOnv3X4c7KpoH/MXkcZ0/ssdr9LxXoQDGyHDlCDAw/z+5Uz6JaSU
         0+wFMWMUrvWg4wZMQM3YsUTD02UDlfUpOQdrwjGm8Nwi+DMfg2SiXnZehAYbTHpxoqF9
         4BTtdSrEh5qAMT6WHiIJ7rgk5sjJGZbYDnH6vEG4V8tBfS/KNeWMrFOwcFkqfPqKvTsT
         D9RsIGpkoB7FCGdfdPxcVzCD1MnxpD3CtZVZmO99IG7yDbcTHodvPBJlEzkhgNoHBC7N
         yQsg==
X-Forwarded-Encrypted: i=1; AJvYcCV5LG2Is2+XSy0axTZ0HPV7WHN0jAQMdj0aHwOud5j1GKSQ08Dpja+p2y7THqPYHDr0vBke6Gy95DGvBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUQuxv+uB5dJheIC1jdANYpEnMwgLiQ40m5gVWsG3GADmFPNUD
	ki7upXcmP29hUlnioHeba0bJ8U/yDq8fBsPqPs6Lj4MVE9mMKEwt/77IMiNJRh7twBk=
X-Gm-Gg: AZuq6aL6ka5ZanW/TQgLPrHzP9kjDRRh2Jt5q2eXjv0jz/Q2bhBbXyp19C0IO4BguKy
	ww2OL+0gvZ/5vZ9DL15EKard/Ra56ygGvtLTAiIXLT7pznA3ZflR40k5Q3Syf29XyDrgg99YJC5
	fHnzDRxm0YwGN52lhk48cZo64/x+aBF+fIxTbAt8d+akDRoW4dUmm5pVUr1kXqL5umgFJXz8eGT
	+tgpMs8h0Q0rwnqCphFsLxmk9Q4XO3ynhbLQzQGCH+TLkBcA1x7vg2d2qO4XohNuKYLutuULGa/
	Wwbe3ukLcuuOpGZ1ZnFsLMdsqnrYO6UtMfnYjQXqEDOdwxI9R6HNXqw4AToqIkxNsQCSJp6nprb
	qG3Tpsyx33uS94cmwbdAz8+48Gvp39zSmYmEV+FA7AgCQYkJ/uAszXRrMRK3buwo+4+MOySzbTV
	9bQg8qJLU7fdzomsgIeHJzuqWL6qir4K4kpepjWiLLoQ==
X-Received: by 2002:a05:6300:8d:b0:38e:7422:ac83 with SMTP id adf61e73a8af0-38e9f0f4274mr627411637.10.1769320118423;
        Sat, 24 Jan 2026 21:48:38 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a3f1ebesm5680016a12.19.2026.01.24.21.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 21:48:37 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 25 Jan 2026 09:36:08 +0800
Subject: [PATCH v2 3/3] riscv: cpufeature: Clarify ISA spec version for
 canonical order
MIME-Version: 1.0
Message-Id: <20260125-supm-ext-id-v2-3-1e3b9714c860@riscstar.com>
References: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
In-Reply-To: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_214839_407697_AFB7E0AD 
X-CRM114-Status: GOOD (  12.89  )
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

Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
Unprivileged Architecture. The chapter numbering differs across
specification versions - for example, in version 20250508, the ISA
Extension Naming Conventions is chapter 36, not chapter 27.

Historical versions of the RISC-V specification can be found via Link [1].

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://riscv.org/specifications/ratified/ [1]
Fixes: 99e2266f2460 ("RISC-V: clarify ISA string ordering rules in cpu.c")
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add Acked-by from Conor.
    Update the Fixes tag to point to the original commit who added the
     description.
---
 arch/riscv/kernel/cpufeature.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e1f7ad882289..63ad6393b2c6 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -482,7 +482,8 @@ static const unsigned int riscv_supm_exts[] = {
 
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
- * chapter 27 of the unprivileged specification.
+ * Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
+ * (Document Version 20191213).
  *
  * Ordinarily, for in-kernel data structures, this order is unimportant but
  * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
