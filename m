Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CE0FC6160
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1BlxXvfoVsQJHUM0EIKPDp2fwejIpCdF0Qt2gSyibo=; b=AamCruxWGn7cUD
	SuT3BXtQG0Wewnwfb1YaPLz9ESYtKLu97NqQIsnUewqbiSxvHmR1mLEGVGhFrlQh5IaTVOfa9o9aB
	VJmNZ3/hHYYOymquZAFflDkZpil3h/vuv7G74DdTbyy1NyXMqP96E104YIwz/uTMeqfCRqTYEhnzm
	fHu5RY+3NjFxqCboGRrXcKUCFxcj9iYtSGw95evCzHRnYrqqKAcaFXpmASaCSJ085QpdXM4tdlTLd
	XnjmohxI/zqHTd016L/bTm0RjNbH+BQWt67ELt9t+MEJnRkqya6nB34l0KTXZWD0lW5lpNT7Gjc7N
	/yXEBEBRY4J2hHYikTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIw-000000097J8-2B5n;
	Sat, 03 Jan 2026 08:48:10 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIp-000000097FU-1or4
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 08:48:09 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7baf61be569so13213992b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 00:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430082; x=1768034882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvs9mu39u8pUKEaoauSfWHl5WiFJwmaNAiuKq3SpZKw=;
        b=iIUplYs83FarEa4c8rEDrLRCeMilUc1ymK5CCvZAeYJ/QNHdUaAIl1TPbeZezRci6T
         RTexWOkM3sjsf/Sh1FcrzvL5AZuepe9zvxy3GCZvva57Jt+tMfaymFCbOOw5N15/oZ88
         e1LYEY5Tgp491oSs7/oK05bFMKpiRsi2N3IPjpUp4qaMjUPOpFJum4cwRc03egbtLC/j
         pmx0VSoC3OkqGxlDYDSjwILiAX1FrRbzzwDQm39w4oO+hBhEFSA8Bao+WWlZaQyqbF44
         ktLd92rilqfYgxgToRe6rokZyX2hJpEGhL2DDqVZi1kn7mzDR0R9EQbKf5YO97iiapeo
         ktdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430082; x=1768034882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bvs9mu39u8pUKEaoauSfWHl5WiFJwmaNAiuKq3SpZKw=;
        b=M30K8lxNNCNWH0d2yARVdldMsreYGwM60k2fO4lEfC7dE9erJXsC5OBs1YBZSsDZC2
         oXmIFkEv88YIopKf4Ey6+BCl+hA8SBRE+6BwGozLWLc6cz3c4KHLVYrUqeJzqTZqyWSU
         GGrnYd5amB9Y5kkSZuX318KDwxRz4zikkpbtTVM7OX9/z/ZwmLYBoTOaTEijabrwIha7
         cpzBf0h8eIZN9TXdYAYoP2Ym+jAV7u+O12jIr1R7bBn8zaFsauyK9d/03G3dfDuaKYvj
         vpwDUDrZPN8nBjfnWB9fOVIn8E5iEHMjLCgfgbEyj2vQBOH8qz21psWSuPEgW4c0DSvE
         /fmw==
X-Forwarded-Encrypted: i=1; AJvYcCX0NHthejcrZNgag0aTMjfGHlXHMOpXbvpEunuOQwlHrItZWxfxouwVYUrpXRhWXbue1CjyGa7Wf8YKzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsfv8lz5ynlRCRw/705dJrTJnhfd29xMm1HCYuvlDAn8+ow76x
	tdEX7xX7/eFXWepeaKXfs9Hzo98GoLmgHqVlrWojG3BFvjCyY6jUVU+HW2jmGyyQ
X-Gm-Gg: AY/fxX45lKTd2EVsI8bovf6/S0iKJqIJSov7EUvQKo+Gra7sIUxVh1yO9EqiVmV/2/V
	dAXTYJzAi9UlxgVRrwvPCR7sTel6/T4NnmffEstaV3hE/57q5YxgtQb3Uq/sQaK1TXOci+0GtGX
	7MUZu9EjQqDJvT0zhTufzBb/Bxt28Qn5G+5NxUqwKTcC8Q+WIgQlCYyEIOMoEO8Tyss7DlVBkDu
	zOR5W4UBRbOcp23T6wqMtyZRyWCqmz1bn+eRF4xLCHdARx5s+Ac8BsTshTmkl16DtHWe2Tg3ZW5
	LRIQ7O8ofNAiG/HJuazVyvzgXsv+GyOkKpj4ZAxrtp/6i/v5eIimzpXjk0hyn1t4epCwwnYIxMZ
	SY92Qw92k2bNUBBAw+jS0wIF8HbOJdAkg99ZE8sx0EuoFuF2fAboti0mZdoKOCty5pwhR3WyY5z
	rbx4oHMjSBuTu4oqseV4KyHu+PvqDNMyYFXgY=
X-Google-Smtp-Source: AGHT+IFtMJvjrpfUuqAmA+OpACtkefUVF2XH5YredFgsYPdy6OhoXIwbDm8pMiudZkIWzurpixeN8w==
X-Received: by 2002:a05:6a00:338f:b0:7a2:7792:a477 with SMTP id d2e1a72fcca58-7ff65d7e81amr37223258b3a.27.1767430082432;
        Sat, 03 Jan 2026 00:48:02 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:02 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 3/5] mips/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
Date: Sat,  3 Jan 2026 16:42:41 +0800
Message-ID: <20260103084243.195125-4-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_004804_404224_9D262678 
X-CRM114-Status: UNSURE (   9.33  )
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

Replace deprecated kmap_atomic() with kmap_local_page().

Signed-off-by: Keke Ming <ming.jvle@gmail.com>
---
 arch/mips/kernel/uprobes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/uprobes.c b/arch/mips/kernel/uprobes.c
index 401b148f8917..05cfc320992b 100644
--- a/arch/mips/kernel/uprobes.c
+++ b/arch/mips/kernel/uprobes.c
@@ -214,11 +214,11 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	unsigned long kaddr, kstart;
 
 	/* Initialize the slot */
-	kaddr = (unsigned long)kmap_atomic(page);
+	kaddr = (unsigned long)kmap_local_page(page);
 	kstart = kaddr + (vaddr & ~PAGE_MASK);
 	memcpy((void *)kstart, src, len);
 	flush_icache_range(kstart, kstart + len);
-	kunmap_atomic((void *)kaddr);
+	kunmap_local((void *)kaddr);
 }
 
 /**
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
