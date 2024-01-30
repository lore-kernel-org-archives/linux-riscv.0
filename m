Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF320C47DB3
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 00:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzJbv6IFhbU3ZSa/ypo+JZS06g39iVeDssDHiWjXz5Y=; b=iz/0Hhy4JIfkFO
	vn7Iq+ZK4iyi2kNFhJoKxbBv74UgWNCn4Yt14J1tjxOkReDAtx0n5B21lLs3kanCTt+YeoIHt0wUg
	alHjGsRBCCTwSo8Ijak0GdjFw4d07vRCxU7YAjR9yNDzPYwqVsvMMIWoV+Js8NGY/k664UEiNopwY
	+t7jgHOXQ70G0xa4smNwQrQcE/Pxy/NJ2dnxM+qionOc2ZBNtYOHFeyymRTKNcAHeO2ZFEw2JGjDh
	j5lI55SRlUvZk2ca8GdLX+Aw+Kz74+lfvx2N3RkXLZKA9DtAaNWTThDcq/85s6a2TlWSNwoEPfHci
	ECnwOtFXS39gLpz+jppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUc7m-0000000EiGr-2bls;
	Tue, 30 Jan 2024 00:37:14 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUc7i-0000000EiB4-0Xhg
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 00:37:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d74045c463so17740085ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 16:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706575024; x=1707179824; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBdnavPhPLG4hLHe/lbowMi09bgXqSC/rhZZs2QP0QQ=;
        b=eDo5NYLRyauKM5hUDbodlbxD6g0Xp5gU0XXLQFKXXs5KM4+9DF4PSsdPogNpjT6lFt
         Ri2F1GMUgpaWVCKlsRmaXy0MZJ0z0ohqpphEN/7eRvsHAzi0PSgaq9/QHZoLprAzqjOL
         geE2MQSBR9LHxTliIWp7E8nd9kGC05NykwupmIIAbO/3YYU1WP7GjuIfKZXTmUMWiKVi
         g4ycxqOEv38zoGlHUUAt/in0kaUQLvxcb2t4rpI3zVPOrvSi67WJAFSiA7d3HUr+PgtX
         JbLL5+ynHKKbSdmFKiFf2U9u/+zavJoGP90/kTE8Dg3MJREVtyOcuoDHnWa32e2xfLrn
         Hfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706575024; x=1707179824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBdnavPhPLG4hLHe/lbowMi09bgXqSC/rhZZs2QP0QQ=;
        b=bRClMeDahUJTxJKCVRazESZYhH+O/zDUjn+erwhumZNc4zIxDTuUWXBAaA+N2eX0/w
         l41Yxslif7zxhPgR86HXdccdziQGi3+YhQlh95Nlz9FTW6CJ7oU//vAWenWORixSUDOQ
         VUuUoCBncNLJ8cOdHLpRZre6mLyFALhcDhFBypZ4ZMpddLnu7ncU1gNa5s0eYRMFy3Hf
         v3qo/VHvdwmF0xasKE6fgUauwbUqQRgig2u9L+K3GgvTs4PKJBljwuGCzqq1Aj6cFbIl
         Zb/zhAouu+zLhlzwjPOqxsLSbOwsTucVeevEY3PXV6pkkZ9J13IrRXQbg5E4cRhNMiGV
         V+ew==
X-Gm-Message-State: AOJu0YzfQ+93Q9VBYgvn9/5B3xHUZpM6XMVUbv1sI4wkOgQM7KNCU0ZN
	cSLJ7D9+YzP4BAeql2bWYOzFRrDEIFHzYabBG9LFWLCl93wfagEZFoQuMHzg1Y0=
X-Google-Smtp-Source: AGHT+IGUsknhl2CDcef7BUE1BsiJx3EyQBp1F7tMWLKnMckNrmrOa3LA4FFwrTaqlOeS/OBEkFdUbA==
X-Received: by 2002:a17:902:f551:b0:1d8:f21b:809c with SMTP id h17-20020a170902f55100b001d8f21b809cmr2649429plf.60.1706575024448;
        Mon, 29 Jan 2024 16:37:04 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id jb9-20020a170903258900b001d8ca3f5e3fsm3406375plb.295.2024.01.29.16.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 16:37:04 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 29 Jan 2024 16:37:00 -0800
Subject: [PATCH 1/3] riscv: mm: Use hint address in mmap if available
MIME-Version: 1.0
Message-Id: <20240129-use_mmap_hint_address-v1-1-4c74da813ba1@rivosinc.com>
References: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
In-Reply-To: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706575021; l=2676;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=V7pluBm2W1PoZ2bBLrm+qZq65mTPWf8JJaZyD0Mij4k=;
 b=xLofBRKvo5qnvg1/QxrS9M++r6DfPgaAnZCvKPa1IRqMAJzNlfAUw3QxPPg3xgb0XIbJE85Ak
 oCl/l13iT1iCv7LIAifwyK+c286DNL3c3U9kefDRkWMehYKkGUTw++4
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_163710_280151_37538FFB 
X-CRM114-Status: GOOD (  15.17  )
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

On riscv it is guaranteed that the address returned by mmap is less than
the hint address. Allow mmap to return an address all the way up to
addr, if provided, rather than just up to the lower address space.

This provides a performance benefit as well, allowing mmap to exit after
checking that the address is in range rather than searching for a valid
address.

It is possible to provide an address that uses at most the same number
of bits, however it is significantly more computationally expensive to
provide that number rather than setting the max to be the hint address.
There is the instruction clz/clzw in Zbb that returns the highest set bit
which could be used to performantly implement this, but it would still
be slower than the current implementation. At worst case, half of the
address would not be able to be allocated when a hint address is
provided.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/processor.h | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda54..f3ea5166e3b2 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -22,14 +22,11 @@
 ({								\
 	unsigned long mmap_end;					\
 	typeof(addr) _addr = (addr);				\
-	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
-		mmap_end = STACK_TOP_MAX;			\
-	else if ((_addr) >= VA_USER_SV57)			\
-		mmap_end = STACK_TOP_MAX;			\
-	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
-		mmap_end = VA_USER_SV48;			\
+	if ((_addr) == 0 ||					\
+		(IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
+		((_addr + len) > BIT(VA_BITS - 1)))		\
 	else							\
-		mmap_end = VA_USER_SV39;			\
+		mmap_end = (_addr + len);			\
 	mmap_end;						\
 })
 
@@ -39,14 +36,12 @@
 	typeof(addr) _addr = (addr);				\
 	typeof(base) _base = (base);				\
 	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
-	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
+	if ((_addr) == 0 ||					\
+	    (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
+	    ((_addr + len) > BIT(VA_BITS - 1)))			\
 		mmap_base = (_base);				\
-	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
-		mmap_base = VA_USER_SV57 - rnd_gap;		\
-	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
-		mmap_base = VA_USER_SV48 - rnd_gap;		\
 	else							\
-		mmap_base = VA_USER_SV39 - rnd_gap;		\
+		mmap_base = (_addr + len) - rnd_gap;		\
 	mmap_base;						\
 })
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
