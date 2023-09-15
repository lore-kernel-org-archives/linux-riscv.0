Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E75EED61A
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 17:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3GrSk5A6c6extEUAAapVL4upci1a9QXSi0FDy7BXfQ=; b=y/CZpTn/uFkxCT
	0CP3vrebmMf86ONHFjCJVHMm7zh7XsebLWIqyN/sXWSgQuZx9XVus4cMZPtl8GauyqFmz3Evl8UUz
	BaIGA5BWPd0GI6xUletMLS1u4qfAwusU8+fVKgsb28P79aHJv/HAmmzdI/UW45fC7pvTR50DgtOEi
	3R1wowNztQHTQtkw+R4JzIj4aHRQlBIudpIXRazkW7j4zGttDVqmYKClG0r9EHnBfXJoufkXmYAZ/
	oraKP/K927D03KlqfefDnJgubZZoL3HEF0Q8wGtNqj+3I/C0X7uTZ6vHhuxbxJ9D+4xSZlwknenbs
	4wfrp9sr0bNLQzqce3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhCDE-00B69t-35;
	Fri, 15 Sep 2023 17:02:36 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhCDC-00B68Y-10
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 17:02:35 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c4194f7635so13007825ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 10:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694797351; x=1695402151; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFaSlC1Eanb+aGEVXbnD8fQMHZ9ukouqu1oCkaPSAho=;
        b=yCM9pLwOL2ZE7FXryqAXnHyZR7VzUsmF8IKgJsXKX2P/XHk39MCIMLBKleFSM8PrTE
         TGgjoU0oEQmHE4JySGdjc5XgHX/YzbZblMW3kMiDtfcNKpzEVexNG3xrR07fhloD6jev
         evnV8z/OVfq+X4Q/uAoBuDuiiYh9DcSgNDdmVBFH6x+6esc0AaDOlJF2tvO7BJx4B1Yo
         1bwwcV/Fp5dE2owUL2f/vu+IVcfKB23RlFGqNaN9a4kbN4DCR+91Q/HrA5ErhbIZxifE
         /O4P0aLfSTsZCV/Tl0l128Ou18lruIwMw+rLXIX3UYPzTRzSjg8thUFPXDG9Qso8ShJs
         MNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694797351; x=1695402151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFaSlC1Eanb+aGEVXbnD8fQMHZ9ukouqu1oCkaPSAho=;
        b=SEol98RSnFm6wUbfNyyekMxTRzLq2hj2Hs1oK9VmwgvwR9uhZ3H0GP3atr3NIp4VJb
         4c3p8zroSAx+Big+9VSrfj+554ZuI7k/zjbYUUjGkKqCXp//+tbaeH764tZRQmYfA+xe
         vB1bc7dzHU9pfT/Uh/7xQ9+n/ttPBYqEGVSOWWTmis0etHKzjlvi0TkdHJy047S+RjOh
         jFYYO69VlWvgXsOD3ziwJXU1ZkkPQ0ZRNrYdTmAfjmqbpZVjipaY9JpSkLtDfOAMeTrc
         2VEumsiF2IxEqIoG4fdFgzrrjJUcWVJHpwj1waetfyBMtP5A9IZ16Gz8YvHdewAtojB+
         8K2g==
X-Gm-Message-State: AOJu0YwES9SskMWFHSsxLk4dwoIpsb6FzCf2ygEQv1WSUGdmm7QrNlji
	9HlzRfNsVGyMisPvLfgudsj8I0OLkCX/9yudyKg=
X-Google-Smtp-Source: AGHT+IFFMibfbK/b6MF0PIVWRSmwbwEFo0xt9xmW39fVktXtWQqqhBw6BFOrekLnp5F5kducpmo6Rg==
X-Received: by 2002:a17:902:dacb:b0:1c0:bcbc:d67 with SMTP id q11-20020a170902dacb00b001c0bcbc0d67mr8332563plx.22.1694797351144;
        Fri, 15 Sep 2023 10:02:31 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g22-20020a1709029f9600b001c44c8d857esm34299plq.120.2023.09.15.10.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 10:02:30 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 15 Sep 2023 10:01:17 -0700
Subject: [PATCH v6 1/4] asm-generic: Improve csum_fold
MIME-Version: 1.0
Message-Id: <20230915-optimize_checksum-v6-1-14a6cf61c618@rivosinc.com>
References: <20230915-optimize_checksum-v6-0-14a6cf61c618@rivosinc.com>
In-Reply-To: <20230915-optimize_checksum-v6-0-14a6cf61c618@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
 David Laight <david.laight@aculab.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_100234_345599_FCA25415 
X-CRM114-Status: UNSURE (   9.54  )
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

This csum_fold implementation introduced into arch/arc by Vineet Gupta
is better than the default implementation on at least arc, x86, and
riscv. Using GCC trunk and compiling non-inlined version, this
implementation has 41.6667%, 25% fewer instructions on riscv64, x86-64
respectively with -O3 optimization. Most implmentations override this
default in asm, but this should be more performant than all of those
other implementations except for arm which has barrel shifting and
sparc32 which has a carry flag.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: David Laight <david.laight@aculab.com>
---
 include/asm-generic/checksum.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/asm-generic/checksum.h b/include/asm-generic/checksum.h
index 43e18db89c14..37f5ec70ac93 100644
--- a/include/asm-generic/checksum.h
+++ b/include/asm-generic/checksum.h
@@ -31,9 +31,7 @@ extern __sum16 ip_fast_csum(const void *iph, unsigned int ihl);
 static inline __sum16 csum_fold(__wsum csum)
 {
 	u32 sum = (__force u32)csum;
-	sum = (sum & 0xffff) + (sum >> 16);
-	sum = (sum & 0xffff) + (sum >> 16);
-	return (__force __sum16)~sum;
+	return (__force __sum16)((~sum - ror32(sum, 16)) >> 16);
 }
 #endif
 

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
