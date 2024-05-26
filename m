Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843BDC25B75
	for <linux-riscv@archiver.kernel.org>; Sun, 26 May 2024 21:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X/7yhAcxigDu7rwgsnDe33ccXj0wtBEvwDk21Fm62i8=; b=QAasn5mzoNsiQB
	/7x1N/+hzmOJU5pb96uR00jMT9A39gTwGmOe1gppmDCBXjMX4VqfGWWoWO+BUXHH0ZAb7VQ8geY+U
	3YbgbYDNR4rEWMbFx7b6duafA6po0FDUFVBP9+wnc/r8FNKlZqMCKVuluRhwF433eeRy5x2284niL
	1+WhNaFZPinf/iFy9W3n2xUZpqP4Im/QXxKxcaM/TOaEemje0SinoNXgG3opX10a1E2tvkTBgwdfx
	GqsLA/JGdkjThpHfqmO+i2qY7bNSvdTJSSoAmVvks36jTQPtsG/oCyNanCnh3iM5CAo+0SsAUN4wG
	OEf4MFDoM5pQBlLKOKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBLaA-0000000DIz6-1pT5;
	Sun, 26 May 2024 21:39:10 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBLa5-0000000DIyH-1GYs
	for linux-riscv@lists.infradead.org;
	Sun, 26 May 2024 21:39:08 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6f8ea3e9543so2078497b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 26 May 2024 14:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716759540; x=1717364340; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=hAMlX33W9IjKkHEusypxGF2R1l5CukQEbIR+DcnKwQ0=;
        b=ntkxRMZ+hbrjriURvECR7dseD1NzenQkeVP694lxandz3GuqC3pHU23ZfeLFDsawrd
         OlWoeovWCTrurWhyYZmcWIULKwhWQ3OhqNESzEn+AZo+MVvoYW2im1W1ECliLAx/Hh2Y
         J3OCPuW7BGuO3sS9+Z20xGcYrV3ExhXklzzMErzf1IZLym3TXIpYWrRjeS0qhYAkXkDN
         nJVB1aCOPWwDVN7SiNbYA9gBaM14AlHiC/NDy7cQVQOpyoz457qCtSunGDS375z50tpw
         hUuX8+wwlKvIDeNx/HpDMkTeGeVlHKoPJyrpikXd84IBnl3/bMfFem0kdFAdAsqit8f1
         pDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716759540; x=1717364340;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAMlX33W9IjKkHEusypxGF2R1l5CukQEbIR+DcnKwQ0=;
        b=X4noJr4IU99ibPPegOJn33x1KnS2W/tCmKjw2yghUyKwzSUkHzeJ0b+Tm61aqlL/Cs
         QkEXgqWRBebAOdsLA7HpOKPnMBuJVbA6qQykDwJa79TRrT7B84xyIorUHVXGy8yQgzDu
         Urm/pMTQ/aD5AWtZxI31cFdtVMP4Y1jwhzeHuO4Tir2Uh4SgEvCpG0W5x4RO+4MBsLBu
         HN7ooR/JiqmGUn94WyQmw0M0pYRTdJZfwtRcVMLF12QUXY49Xvm9655ojzpy1kpEwPAK
         BowxbK6Sz/bkbzNMenYAEJUf8J110uq4TeEJ31sjZKlFF8Npk0XuWAn0r1O22bc3oli5
         uFPA==
X-Gm-Message-State: AOJu0YzKXu5hr1LQyo7Qf+MN6+kKhAITcsWtHnnnJ43+gFZM68a5j7a1
	bJnCdmVrN8N3WGhbxljCgQzlE3Z6ocSeFDsvftlw6vbc44Ovh7+JypMYow/t35hOYkgyWHD2Wxp
	8
X-Google-Smtp-Source: AGHT+IHe6j6oRy6jILTsWV8CqjnYy2eIt92dCvYk79kBOxT3hFxDA821iorPCYAhqJr0KM1d2raY7Q==
X-Received: by 2002:a05:6a00:1f12:b0:6f6:7c6a:2c14 with SMTP id d2e1a72fcca58-6f8f2c56e53mr8097963b3a.4.1716759539558;
        Sun, 26 May 2024 14:38:59 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd4da8f6sm3838392b3a.210.2024.05.26.14.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 14:38:58 -0700 (PDT)
Subject: [PATCH] RISC-V: io: Don't have a void* PCI_IOBASE
Date: Sun, 26 May 2024 14:36:18 -0700
Message-ID: <20240526213617.12890-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_143905_484465_1AB4F19F 
X-CRM114-Status: GOOD (  14.53  )
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

I recently started noticing warnings along the lines of

    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
            insw(addr, buffer, count);
            ^~~~~~~~~~~~~~~~~~~~~~~~~
    arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
    #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)

which are triggered by having PCI_IOBASE be a "void __iomem *".  I'm not
quite sure what the right thing to do is here: having it as u8 to make
the pointer arithmetic work seems reasonable to me, but a bunch of other
ports still have it as "void __iomem *".

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Not sure if I just started noticing these, but a bunch show up when
merging Linus' master from this afternoon.  Having some sort of fix here
seems reasonable, as "void *" arithmetic is undefined.  I didn't check
if the other ports are suffering from this too, I figured I'd just send
a patch so I don't forget about it.
---
 arch/riscv/include/asm/io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 1c5c641075d2..a2d2d10c48cf 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -27,7 +27,7 @@
  */
 #ifdef CONFIG_MMU
 #define IO_SPACE_LIMIT		(PCI_IO_SIZE - 1)
-#define PCI_IOBASE		((void __iomem *)PCI_IO_START)
+#define PCI_IOBASE		((u8 __iomem *)PCI_IO_START)
 #endif /* CONFIG_MMU */
 
 /*
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
