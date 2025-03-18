Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3E1C35FFA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 06:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PDsACv0gBGi1i4W1yr67QCtiDzTxJAo7GkQoT6zHpo=; b=DkQlCq7Ck4bBUT
	WIJTOrMnBJch1k+OWuLcKfHI7oP8E8yekw3+C3ku24h5lBWCiKFGp5lOhPL2anCLoT/Ts5zcGzWYZ
	xpe0SpADe4tnY5TIWxlM9hBoMkIc9+LieyuHvI8R3+WN0jnR0cMU4Rku0aci/B74caOOUWzH62R58
	HFZclwgtISVVWcX4k6+dAjelnN7t2Aw/Mb41YGmZX4nNm8PmOTyBOBAgbO5sriE7ZMv8eSTawLEyj
	InvCQ9Fo71DPebYBxLU1AI7hH/sulP6TD/Wk6T746/9QNwfvyb41QK/8YTXGP3n/FOZLnRFXFtl2u
	trQhOhLRQtRIXlza1E+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQEX-00000004niv-1inI;
	Tue, 18 Mar 2025 06:15:25 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQET-00000004ngU-2Rjr
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 06:15:22 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3f6a92f2328so2580507b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 23:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742278520; x=1742883320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STOmRD1NGs9uSMt++nKAUKoj9Ow/rlWCVnbqWbWWLRY=;
        b=T0OMwn3RItUSEAcDAREIkKqnUzuo+LWjsvqAQgeNYEgnuO6qKvU6QOqbh1f1IBxVfF
         17x7zvUDOTKmDqyfPeX0DnejsS90/dfH+mMQm3E8EN8tl/GruPXkp+QaLL4+cTiWxGA7
         T2kjHJkhQwKmmTd1GyFfJwMmrCYXj3NqwbmOA8myYhAmYAl/Cm/+AkkV6BsnN4MHfUlS
         BgCoqx/p6miz2Puks65MDgOAYSB3/UrXk2i50qB5sxRDqAyGRui/cjO++PltJl8gM+1P
         gJFVnfe2gCeGvP3p85AZWWh+zJ3l6za5wFS8tVtHj1jZBE+nsfBRc33sY8z2RX7CJHUI
         4K8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742278520; x=1742883320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STOmRD1NGs9uSMt++nKAUKoj9Ow/rlWCVnbqWbWWLRY=;
        b=wNWZX+WdgUtOj8caLRVHsRgfrSrRapyBW9xWuTdhC64PD4FC9svtr1MiW5BaRbA6Un
         B/LMr7I9lcgqYx45W4QCoLXnK3KjSEFzty/XI0tGph+nxHJo+GMeZ8KctxWmgdeOCBJT
         CpbrrKEeZtmlJRV1YEccsc42jWKD5c5ysmXd2c1zIxHAvAHzdDko2NjnBl5xNbd9EVO3
         gHrbgO+fNtRdjnqA7sNU7HtwUj20k/i11W9KuPPKP/jHaELjt1R1gZT9I6nKY3aXyvSg
         Ac3hY5+8FLN+OBv9wZzi/nKLK4OOwB4bH2CXgaGxYjVYKyi2x2ti/2DG09FhLGROJTGw
         ccwA==
X-Gm-Message-State: AOJu0Yz91Dz0XmsNW8JSPWPfyqjiTHy4GfbmwlfjejPATJBV1JsVuoPn
	D6IPFBJ/iuC8Xybzr80UREM6HnUE3EtoE9iRU5eoJtGnMDW1b7TYets60v5zHg==
X-Gm-Gg: ASbGncuXZODVIBrcKhY+GyysGAuOGr122/DdIpoKd8OAk7FPw57FFxqtlceWa3ILVwQ
	hEFjsdqCohwwFg3yaqGuytv7/QQhds2SEHxFyDipuavgz1DGIXAxLgnbXpPM3v0jMnQ/gUbkCLh
	4rVqeoaJHzg9N/PiS00LxRZvnzvdMDKXCVC1w1VHT54rT1QhgpAPVpY1Ci1Pf4ZYFCQR9AwCKOI
	CG6DWLSgZVoDALy6MC8FKf0hTzKbJTbN8rvarca+w+PBTlMjn/onn0g+RZWhwtYee5p3vBwLrAM
	riGTM/Q82NtM/d6Ud/CQJgFf0RKia00qA2N3M7+Cu9V1VC+hrREhgCOTkfQO+hs=
X-Google-Smtp-Source: AGHT+IF+QEcnPvq7HOQUCyqTY14BOpN8Y8eX1PyixCC8ZH0S4NtzfP09P+KLDIccR2wqd6pOP+an5g==
X-Received: by 2002:a05:6808:38c4:b0:3f8:18a3:b1cc with SMTP id 5614622812f47-3fea2482935mr1337534b6e.12.1742278520647;
        Mon, 17 Mar 2025 23:15:20 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd403b882sm2051642b6e.8.2025.03.17.23.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:15:19 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v4 3/5] riscv: uaccess: use input constraints for ptr of __put_user()
Date: Tue, 18 Mar 2025 06:15:12 +0000
Message-Id: <20250318061514.1223111-4-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318061514.1223111-1-cyrilbur@tenstorrent.com>
References: <20250318061514.1223111-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_231521_625337_39C84AC1 
X-CRM114-Status: GOOD (  10.01  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Putting ptr in the inputs as opposed to output may seem incorrect but
this is done for a few reasons:
- Not having it in the output permits the use of asm goto in a
  subsequent patch. There are bugs in gcc [1] which would otherwise
  prevent it.
- Since the output memory is userspace there isn't any real benefit from
  telling the compiler about the memory clobber.
- x86, arm and powerpc all use this technique.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921 # 1

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
[Cyril Bur: Rewritten commit message]
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/uaccess.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index d7fef81b7969..180d6e21d5b5 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -219,11 +219,11 @@ do {								\
 	__typeof__(*(ptr)) __x = x;				\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
-		"	" insn " %z2, %1\n"			\
+		"	" insn " %z1, %2\n"			\
 		"2:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
-		: "+r" (err), "=m" (*(ptr))			\
-		: "rJ" (__x));					\
+		: "+r" (err)					\
+		: "rJ" (__x), "m"(*(ptr)));			\
 } while (0)
 
 #ifdef CONFIG_64BIT
@@ -236,16 +236,16 @@ do {								\
 	u64 __x = (__typeof__((x)-(x)))(x);			\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
-		"	sw %z3, %1\n"				\
+		"	sw %z1, %3\n"				\
 		"2:\n"						\
-		"	sw %z4, %2\n"				\
+		"	sw %z2, %4\n"				\
 		"3:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)		\
 		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)		\
-		: "+r" (err),					\
-			"=m" (__ptr[__LSW]),			\
-			"=m" (__ptr[__MSW])			\
-		: "rJ" (__x), "rJ" (__x >> 32));		\
+		: "+r" (err)					\
+		: "rJ" (__x), "rJ" (__x >> 32),			\
+			"m" (__ptr[__LSW]),			\
+			"m" (__ptr[__MSW]));			\
 } while (0)
 #endif /* CONFIG_64BIT */
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
