Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639E9CD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 09:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ag0aUQ3KNgUNVSdZFe734AJbcJa4xIid6zP8gH5nc1s=; b=SqXwUyeUSBvj33
	jjUHavoUNSsUnNNXTyMgmmhHc23ZWDCjBcEOA9kHheOtBY1kj7tjr/p6qmducD8845GEqFJTnepPn
	k87H1tJeY9CVmwnG31TbsMfKYPSeY9ZWxllZQv+T1hKPIBO9rAE7bjmjP0py96U/f3tsD6RRDeS9h
	t74a37S4MXCQ+fx1hzBsT3knJHuadp+rOfqWG3YONFQpcHax86KjphDtUWWVw+kTFd51B4olM+Fe5
	YJbEH2ZmZTfsPQ6aftDTpqsrZDpUxnqsZmjrkL4jcHls6Ouh+KdjlNqmVTRQ/4NwD/8A55ISegQZI
	8QG/Mc2Wx2W/wVFNg/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMJA-0000000ALea-0LzY;
	Fri, 22 May 2026 09:36:44 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMJ7-0000000ALdm-29Ol
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 09:36:42 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-13663f68983so648691c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 02:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779442600; x=1780047400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hqbz0O8aEWGA0yKkRsOUbhxvZ23lpVZ1rZzCE1TMpVs=;
        b=alpEAVN7KWzrKqDWU0A1qgZ9/47tTtwvdTk9QhTY+qyRiR8rrjEn5vsbMJCGMgOg2w
         nE/9yr/qi0v/CBIdLKDDtRpnEVPtmTGbWyEf9UOJemJj0XYLLtDuYga0LPi7nUMVjk88
         9Fh9hBKsYE8qRXuURM+fGkF9PG55vG9qE0fNQvuiBW52qMTyWW9pvWbh0fVebTHMhZZW
         wpwwmp8F7Kt+Xp4za8tObuBVid6bGvi1B4RZCY7hD8VaYyaZPzPoB/+KkPsSEGS2INwV
         JUlIzo1H//MLBPgulSkxcjXLts0MAG/OeqM76da0xLBVZalb/rZQuL9sVx2X9S/8lTug
         GqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442600; x=1780047400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqbz0O8aEWGA0yKkRsOUbhxvZ23lpVZ1rZzCE1TMpVs=;
        b=Kg/QZRMk1ZVk5cpIXaEey1qzDHf1UmPXnXWCu8ynIPn6zMa5/uwY1Bq7rkFRBxLHOi
         0/X1EB9R17OOEmfwj9VJtH6LGOnnjuZsFaCjVZaOSrmWiUgY20oTclMBWz96k49NPGx5
         fU1yGqd6MlxGKnPZaN9VsLyVPL2oFVUBWymJQDjL5qicJDbYgPwsTfw28QwhCa3lGzaf
         r92CssUHTleU+ZlnVvVB1MUjXT8ilIKAW/da8VUFcJx825MxmEUAm9a9XbODiMO8lihx
         /YYtPooB9MUJPWcex13+HHDucRYx1oNaobB3vXNW7Q6ENT7IaTEu00K+uvrdsWU8RF/S
         J49g==
X-Forwarded-Encrypted: i=1; AFNElJ95WcOH+hzsybX0e0wGOPpwbWBFPsAx+OaZPy2q3MaB/MC3QrcHN/QlmQE6bIGy7w/jnH6rwgXGP+NTyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/SCeaBKYEqlunNjkOx9Em9lL54PKUSG1FX1e3TVJStL0PEg4a
	tWe4hPr6CqDNzF/7qciIcnhCLCP86IG+jFSyyqBxXGKLouvR3QIefOSmEx5TCPLW/qg=
X-Gm-Gg: Acq92OFfDvUWo2XCK32eXMWhTJ5N/r8ck5fU7XQub/cgrsrUx1rSkUj6ssCwtLl8ZPh
	UlF05ETlIJuLqzrWVpDAFj8Haqjy0JO4vx4QRiaiBnQ/c+sv4G1CTlr/BxQkMJoc6KOx+63EfnM
	uUO6wofiFZ2Vu9TkSCWVIvRxwsdDZrA35BdrunktGip+i36PyQwthBUViAVpoeF/R6yVirw2Q/a
	oqFCQn4q7vvRW7tshSXguIIohQiIlSaA8To5HzISYjNsNkI5qQrJD4gDKxCErP4Vcen23JoOMw7
	2tg6wRaGyFV0V0bEvJD4py4b9jzt2cdmImRerPYuPZBhG6Qzoq3hcOdKS39LEydg9DRWh85Xzqs
	+Y9JA1GXzDon9k+iXXV/Ir7az5ucFG1rg/8mFaWMbzg/Bi2O2ZFkwdWMe2mjWKP53Xw8QCsYhYs
	X0PQsVQMJAKb2XkvCG4g64SXtdGCsQd2uzM4s=
X-Received: by 2002:a05:7022:671f:b0:12b:f616:1a4e with SMTP id a92af1059eb24-1365fa45a25mr993856c88.23.1779442600181;
        Fri, 22 May 2026 02:36:40 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366a2e672asm801474c88.3.2026.05.22.02.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:36:39 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	debug@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	re@w6rz.net
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH] riscv: cfi: reduce shadow stack size limit from 2GB to 512MB
Date: Fri, 22 May 2026 02:36:34 -0700
Message-ID: <20260522093634.3530233-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_023641_566921_AFC4C661 
X-CRM114-Status: GOOD (  13.25  )
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

Change the shadow stack size calculation from RLIMIT_STACK/2 (capped at
2GB) to RLIMIT_STACK/8 (capped at 512MB), following David Laight's
analysis and recommendation.

Rationale:

David Laight pointed out that the focus should be on the ratio between
shadow stack size and the normal stack size, rather than just the
absolute upper limit. His analysis showed that while there are many
functions with small stack frames, the majority have stack deltas of
over 64 bytes due to saved registers and local variables.

Shadow stacks only store return addresses (8 bytes per entry on 64-bit
systems), whereas normal stack frames typically consume 64+ bytes. This
8:64 byte ratio means that programs using a lot of stack space are
dominated by large buffer allocations and local variables, not extreme
recursion depths with minimal local data.

For example, with the default RLIMIT_STACK of 8MB:
- RLIMIT_STACK/2 gives a 4MB shadow stack supporting 512K nested calls
- RLIMIT_STACK/8 gives a 1MB shadow stack supporting 128K nested calls

Given typical stack frame sizes of 64+ bytes, RLIMIT_STACK/8 is still
conservative and provides adequate depth for practical applications.
David noted that this could even be safely halved again.

This reduction also better accommodates memory-constrained platforms.
On systems with limited physical memory, allocating large shadow stacks
can cause virtual memory allocation failures when overcommit mode is set
to OVERCOMMIT_GUESS or OVERCOMMIT_NEVER.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Link: https://lore.kernel.org/all/20260518105725.7afe7a4c@pumpkin/
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/kernel/usercfi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index cbfb4e495e9f..adf97426a906 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -110,7 +110,7 @@ void set_indir_lp_lock(struct task_struct *task, bool lock)
 }
 /*
  * The shadow stack only stores the return address and not any variables
- * this should be more than sufficient for most applications.
+ * 512M should be more than sufficient for most applications.
  * Else PAGE_ALIGN it and return back
  */
 static unsigned long calc_shstk_size(unsigned long size)
@@ -118,7 +118,7 @@ static unsigned long calc_shstk_size(unsigned long size)
 	if (size)
 		return PAGE_ALIGN(size);
 
-	return PAGE_ALIGN(min(rlimit(RLIMIT_STACK) / 2, SZ_2G));
+	return PAGE_ALIGN(min(rlimit(RLIMIT_STACK) / 8, SZ_512M));
 }
 
 /*
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
