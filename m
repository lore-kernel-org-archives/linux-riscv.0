Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDFBE6F08F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 12:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5igbVqt8irDv0xraf6GZgXQZA9C9AhbL5SKlE/1sAr4=; b=4RQYIz6Wu693Xt
	ug9Rn6wwEYFviwqnIQGc9neFXHOZjicx4uj3F6NoGQPBAvE6ep1MKkwgEWF7Nn+JluSQYf0Q6ZAGq
	Mrv7h2ONDcaVUprfCfdq26N6NWnEufYrgX0SqGguZvOhAB5lAadcq7w86vh4k2W0kyVKcoURtCsE4
	+Byw0SCEh09c3OsHFdURA1Mhtt+Ety3IjsMqfCcHQDG3HHBbGalKrdCRyCVAJohb7xKHE20ybb9LF
	X93jxFH8ge9lLKpMXzIfdL5Y1CLXy/upjc89VT/fgIzI2ECI8m1xgXqGbUqvKiVz/0ZS0qoLAC8kq
	w/fkp0DdGAImcKaAmFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1sf-0000000FVcZ-2buw;
	Tue, 23 Dec 2025 12:52:49 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1sc-0000000FVc4-14EM
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 12:52:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a099233e8dso42680475ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 23 Dec 2025 04:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766494365; x=1767099165; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUft/djecL/633yjqFPHb2fTczKMYiorjO+DCBYlTTw=;
        b=R3Z0YrxZi9bR6kJEFuYfhC/OJ+FEfSTW7YVn+MYBAnrSPtY5pXw1fciiNu1BT7wviB
         rRnewuoDICGZ1rO0RIQhQ8xD05Fzgrcrl76a6Rr+Zz1UfeTZeXbwdPNyG7f2vKltDkn/
         lViaR1PVXQPsH+DPZ9xSSaG9PG6c8V5fMj7Ivj0IMzwhqBKcxaVbwpgUfB9XbXWZGy4Y
         eOJCMaSLpUV1WWAJmFjYZ5eJpXcR8oBm6sfpTbC3g7wOeLCFbVCBx2kebzodfE0+ieXT
         T7qbkkwndXEsh6T0kmJIHc0ExyC7rG4hMlKekv8V7yqslK3eRfpRdP9XJwckiMwwr283
         hFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766494365; x=1767099165;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUft/djecL/633yjqFPHb2fTczKMYiorjO+DCBYlTTw=;
        b=GT1/Ofkry/9CGT/6xn6CDuXkxjoK+HdQThAVr/uJEaUDWWFqri5rU3wJw/YK7dxk7g
         xhk2dmRbhuA48j0KopcLDUWz7AfQa3tSFpM3JU2SaFWqsGPsBsYNVfbs4H7sHF7Wn1v0
         alt9U5s3EeIieOrUY9RyAV6VLhSHvh0Cit4xrpF7t3v9GQmUg305oDpV3HjDdupatENu
         leG9w6UA619R/qUerHWcei7PGVNiJU9yOz360ajr5HvxZOIsqjMzQkMXLjUZiDOx6rg4
         mnykzxrSYOCqobKZeV8gtHNk+BLPpyFBKC8RBH9XAvU0g689IOk/F72GcVpBEtdraFYv
         Ysng==
X-Forwarded-Encrypted: i=1; AJvYcCWNIuxh/qXlAK4c7DSmSGJgHn+1TN7SZtmH/zTvEFzNr6j/0uz8vqWkGs6BwTWqIuonACBwcSe54A9KCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzA7Eg3/MDjkVL/2KeAoOI9TMKLHmtrVfc0asVueg/mX7Qazw0U
	OVA+KlleNGWeROC+MFqqMf65h35j8PjHGlt3zyxLhOfFHNe7lzFTKmS9yQr1oQIVboK2miWb2fY
	+B+ex+so=
X-Gm-Gg: AY/fxX4d0U8xr/jYGuvAabEWuefzR/HgfY0sssXI+6mKKL4Rp0Ic25spxJF6m0VbyVT
	SlY35jUMOrDWj91z3zRBu88SFz7ZcHxSKyzdx7yI7lPrcP8qD3EYMB/sc/v3wKIQw6FIFv5QN57
	dwWzr/kSwAFd2T8/yVoJjr0QKWJUw9zVbf+VtxmFGiDyqZzfRDs/H4zr4gNcSAu1xq80H6lSHZ3
	p5kl8Pk0BW9lwj+KujC6ezGvv/W2t1+3ikiiF8PALDVA4s1UPrhygDk1Jj5Cl9Fl9Eq6Jj2b8Ny
	NtRVbHJY1hN0inNbagNUxvUoAx9967cC/FQS3vQoTePv8nYMNhRzNXO+TTjQMWOBa9o8LWwaFGC
	iYzWewK/xorLLjqEUzygclkVV9hYsY9hSBtBm21ILNH8TVK+Rn/wINmekeUSqIiyzxYZdtVb9wk
	WOrr/GsN/gMQnYHpk1AVHtyVc4CQZcZiA=
X-Google-Smtp-Source: AGHT+IFXXeWneJLmEXSTz/XeUq636FEGDnRNwLIerGkMy48rLshAsmW/d1IdhfLR6XjRug2K5XkhRw==
X-Received: by 2002:a17:902:ef52:b0:2a0:dabc:1383 with SMTP id d9443c01a7336-2a2f22234a1mr170426955ad.14.1766494364842;
        Tue, 23 Dec 2025 04:52:44 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbdasm128789745ad.65.2025.12.23.04.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:52:44 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 23 Dec 2025 20:52:24 +0800
Subject: [PATCH RFC] dt-bindings: riscv: update ratified version of h,
 svinval, svnapot, svpbmt
MIME-Version: 1.0
Message-Id: <20251223-h-description-v1-1-98bea93b0919@riscstar.com>
X-B4-Tracking: v=1; b=H4sIAIeQSmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNj3QzdlNTi5KLMghKgSl2jJMvElLQko7RUizQloJ6CotS0zAqwedF
 KQW7OSrG1tQB8jjB1ZAAAAA==
X-Change-ID: 20251223-h-description-2b9adfb2fe8f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_045246_466406_E762026A 
X-CRM114-Status: GOOD (  11.39  )
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

The descriptions for h, svinval, svnapot, and svpbmt extensions currently
reference the "20191213 version of the privileged ISA specification".
While an Unprivileged ISA document exists with that date, there is no
corresponding ratified Privileged ISA specification.

These extensions were ratified in the RISC-V Instruction Set Manual,
Volume II: Privileged Architecture, Version 20211203. Update the
descriptions to reference the correct specification version.

RISC-V International hosts a website [1] for ratified specifications.
Following the "Ratified ISA Specifications", historical versions of
Volume II Privileged ISA can be found.

Link: https://riscv.org/specifications/ratified/ [1]
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
I'm not sure the 20191213 version has been removed or there are other
reasons. But since RISC-V International is the official source for such
documents, I think the version history in their website should be
respected.

I checked two sources about the history verisons of ISA Volume II Privileged:
Link: https://riscv.atlassian.net/wiki/spaces/HOME/pages/805568665/The+RISC-V+Instruction+Set+Manual+Volume+II+Privileged+ISA#History [1]
Link: https://github.com/riscv/riscv-isa-manual/releases [2]

There is no 20191213 version of ratified privileged architecture in
both.

Actually, in version 20211203 of the Volume II of prvileged architecture, it
listed the following extensions:
 - Svnapot Extension 1.0 Ratified
 - Svpbmt Extension 1.0 Ratified
 - Svinval Extension 1.0 Ratified
 - Hypervisor ISA 1.0 Ratified

That's the first time the above extensions appear in ISA Volume II
Privileged Specmification.

The version before 20211203 is v1.11 (Version 20190608-Priv-MSU-Ratified),
which contains only a draft version of Hypervisor extension, and no
mentioning of Svnapot, Svpbmt and Svinval.
---
 .../devicetree/bindings/riscv/extensions.yaml         | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 565cb2cbb49b552959392810a9b731b43346a594..6a4697b36b8d540ac14bcad6373ffcf3db13d3c0 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -117,8 +117,9 @@ properties:
 
         - const: h
           description:
-            The standard H extension for hypervisors as ratified in the 20191213
-            version of the privileged ISA specification.
+            The standard H extension for hypervisors as ratified in the RISC-V
+            Instruction Set Manual, Volume II Privileged Architecture,
+            Document Version 20211203.
 
         # multi-letter extensions, sorted alphanumerically
         - const: smaia
@@ -202,20 +203,22 @@ properties:
         - const: svinval
           description:
             The standard Svinval supervisor-level extension for fine-grained
-            address-translation cache invalidation as ratified in the 20191213
-            version of the privileged ISA specification.
+            address-translation cache invalidation as ratified in the RISC-V
+            Instruction Set Manual, Volume II Privileged Architecture,
+            Document Version 20211203.
 
         - const: svnapot
           description:
             The standard Svnapot supervisor-level extensions for napot
-            translation contiguity as ratified in the 20191213 version of the
-            privileged ISA specification.
+            translation contiguity as ratified in the RISC-V Instruction Set
+            Manual, Volume II Privileged Architecture, Document Version
+            20211203.
 
         - const: svpbmt
           description:
             The standard Svpbmt supervisor-level extensions for page-based
-            memory types as ratified in the 20191213 version of the privileged
-            ISA specification.
+            memory types as ratified in the RISC-V Instruction Set Manual,
+            Volume II Privileged Architecture, Document Version 20211203.
 
         - const: svrsw60t59b
           description:

---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251223-h-description-2b9adfb2fe8f

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
