Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E61DD1BDD4
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 19:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hp4G8MWXLyLJE/3B0xusIIdt2xMe37mYD4Q8w1wCBW0=; b=OzC0gTWgm9ejD5
	Al/Snb/8CcBEDCzBONfR/XRcVEm1M+aO6ElP6mV3bBhio4Be5wGoGbIMhY/qPJryy9hTlHjJV+b8N
	8R+fLb1P8CYDmulkWRj/UtAJrzLxs3CY0LGYrTkupiyc6eWRhfVHV4ff2o73CyUX+bDVilOQHNrne
	Rw5gW/Qb+6N5lWanb2SXeknkQCYU8tYBZDDz/DC9xVyp/rOBKlDBZm+cZJGsS/ZqQDabo+1XRUvxm
	BvrzGxBbpcCkB3Dp6fGq4L60nl8s1vtoE54iYEupmjJ8dJ4DxsK2gFVBsVzfSv34CAcfp3lcO5luX
	oe6YC+5RecSJZXLU+Vgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQsmF-0000000700R-1dVY;
	Wed, 03 Dec 2025 19:44:39 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQsmA-00000006zzU-1Zud
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 19:44:35 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso103461b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 11:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764791073; x=1765395873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r6JDi8kUcg7AJg49gUFuPpvzfdqLFexCrglDxdNAMAw=;
        b=cXujKlpTFS7lxTevnH/J/31CFx6U2GF80FvPkcSfoYfGjAAr7VKa0geB9IkXhGm0E6
         JbkChNTTXH7AvxkTyOzbQbjJ7GSM4wRDZDM7xWaU72benJqlBC7mLERENJk/OpF3AW0B
         wij6WUTtReFAc+9DiLSesRHzqEihkhrqHyJ5BXHs1m/h/N0HX2glon+PzK7r58lRBG1i
         XSLo7/9tH+Ay5rtn7n/ZARgPtH2KLpVjvtBSJnt6ATKSEzbqeik2xnbXLxQyjp+0E8PT
         oN8UQ5Cy6+xx+yT3bZ+n224/wVOCSNl3sMw59RtxGDEkJ+zMILY87dk1RVOcjFaUg1i7
         NA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764791073; x=1765395873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6JDi8kUcg7AJg49gUFuPpvzfdqLFexCrglDxdNAMAw=;
        b=jBLjALJbMzE1NTGSoDNjSBAJ0BajRBehztNFR+jffAEJTK+E5UqoR1zmMIwwFYRw39
         8Omyf7NGNSqPhEHmXns6NPHdBm4IaDFOKLjR1GFRjceOoFkmOGnmbsL9l78HY9R7wgTF
         ys0nQl/Ly5ygZVIEdJ8TXgQqIgrVGVD5Dwi+0WL/JKWAUC1rjaCUgwqk1fXWqshiP/kA
         Bd7RJRrcyDR4j/xMudGOlDyAf+sacK6devwwwVJkdNyHqj/loVJ/bAb5Xq4x+/dI6vRq
         PFxE7CR4iZyn36vsK0BfAI6Wb26peT/0e9wndAdLOOJR4w0gz1mDT4ZL7s9nbce16F1t
         Ug/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbJWjM5FRe5K2cbEZl1WNDvXkHyh20yuOBZEi/knQM30yt6aWH9IGVl7Wx4xo+opRSHN27hpCzvrRFPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWnpSN2etuqlp+uCyYkwvEQrsG0SaqiRl9hCsjHL6+vC3Z6f3A
	8ri3c3+2vBMxgmdTkcIeGVANwyLSh0ZnEq4CboMaJtaVI1QsygMwkMVQ
X-Gm-Gg: ASbGncsRYTCe5tgY4xd+eRECDhR2WXMJtfA6xfXfMXNPuQYuhw7uNuL8ZV3Iar0plAq
	DAmuw2Bnpg0rw+wIyUevAu74XA7paf+lWYic+zOV0aBThfFgR0/W6hwca8O4wK+ocpmAH0ANuvs
	HPTJ6iXR8HsPKF264qxnaGhiUV05ANEwI50OmMun5XcrTH7VxJ03C2C3EwJlInNLsHwjgvMf1em
	mj/4Szrv5XA73V3tNCCfxlpS8Q2NneDijGyfgIqlevlg/xhYzb5po1pP3vrX/efoujYlUb7XJ4U
	jX484wNG3Cg8POroZMwKYHaEtY3FjjHk2Ll3TuGtqTpxzswMhnGx2NPPh/Ruzt6Y3OdHSicYA9A
	A1+3FJZZ1JbbuGQFNRR+8Ppmq1ChewXjaXwuDer9O1C0GCxZxQm61Dh335jGGMAyYEugtAJdwTv
	X+Huk5QWUc438t5PZ3ejGls0fAbXTssU0=
X-Google-Smtp-Source: AGHT+IEqwOyZ0efP8rxY8KnJXL/eMVL85joUKOrk9i/n5G4c5lEjXYhelXUcCWTp4ZDDJ/Lj8UtO+g==
X-Received: by 2002:a05:6a00:2e20:b0:7ad:e4c5:2d5f with SMTP id d2e1a72fcca58-7e009830ba8mr4358496b3a.3.1764791072747;
        Wed, 03 Dec 2025 11:44:32 -0800 (PST)
Received: from soham-laptop.. ([2409:40c2:116e:6f1c:ab6e:2f5d:e763:cc6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f175d95sm20973611b3a.45.2025.12.03.11.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 11:44:32 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Breno Leitao <leitao@debian.org>,
	Song Shuai <songshuaishuai@tinylab.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: kexec_image: Fix dead link to boot-image-header.rst
Date: Thu,  4 Dec 2025 01:13:52 +0530
Message-Id: <20251203194355.63265-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_114434_417055_5C3DD787 
X-CRM114-Status: GOOD (  10.38  )
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

Fix the reference to 'boot-image-header.rst', which was moved to
'Documentation/arch/riscv/' in commit 'ed843ae947f8' 
("docs: move riscv under arch").

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
No functional changes.

 arch/riscv/kernel/kexec_image.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
index 8f2eb900910b..51dc89259f16 100644
--- a/arch/riscv/kernel/kexec_image.c
+++ b/arch/riscv/kernel/kexec_image.c
@@ -22,7 +22,7 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
 	if (!h || kernel_len < sizeof(*h))
 		return -EINVAL;
 
-	/* According to Documentation/riscv/boot-image-header.rst,
+	/* According to Documentation/arch/riscv/boot-image-header.rst,
 	 * use "magic2" field to check when version >= 0.2.
 	 */
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
