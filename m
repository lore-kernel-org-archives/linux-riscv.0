Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0545FC352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 02:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Unax4XezO1OMEbCTl89vdkULBZxEliLWP6xwVFKxjmY=; b=bL8c8NfCXXUHJk
	/Q35MPYEQrn9fYLRWeLORRbcbZ56KvZ83Dl4BzIiXLAMQRhd9BOkluq/fA185Y1VQFUupX92oLyls
	zn8lZ8a03mLdFDQFf2l98k0ZT2uSBLWVYALAz5B1VwYMrOPvDhVHvDI5Q7AbyCObo6TLqwY6I5jJL
	4P0i6z6g5K0DZByEILzSx2dpHR9dEz2MJJdJrMJ6S+pB7m3KGmPrit+134R+l9axwBI7mcO24zX8+
	0067zPmYDDhA/WBtVUpN3v26Sw1upewWpqFzyjBN6XdJYE1dGWbpsEwmC5z+ZSpRve4YkXXd+A/WC
	X0i+g3xr9Kw+d1DGWmjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jsV-008L0z-5R; Wed, 07 Dec 2022 02:09:43 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jsP-008KoF-2G
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 02:09:38 +0000
Received: by mail-pg1-x530.google.com with SMTP id r18so14971645pgr.12
        for <linux-riscv@lists.infradead.org>; Tue, 06 Dec 2022 18:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+yAE65xXwmxOFqH7VxpvN2I6hRDzDY473Yc+U9Do5k=;
        b=V0KZN9YXtfpoRWGAWRCE3g1iH7eEINDrON06qErBp7i5rTG6xWU0cnHW3gnR8L8pOu
         JekXgFHlrs/aWOcxW9SlIf1oHqxWtsADcxV+Y6w8/zGlBZFmapkfSnx7MHzJGMNIuCbw
         9h5jGt5WuA1u0HJclFZgrO7mOWekIQ7C8TbMWzjKiS2Xc2gFoAns/P61N46mE5BLhb/7
         ZCVC42beEwFUc3fc4XnwBTEW5uYwJDmvriL4kkQsY4bjjz/A40bc3m55vTgClgfPIUZy
         FIC+RJHkqykIvXdLB2Y+yCVxYu2oRxU4hbj+ACkOM+IKajkyrieyDG3yyZmUURuBRUxZ
         Hp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+yAE65xXwmxOFqH7VxpvN2I6hRDzDY473Yc+U9Do5k=;
        b=AQE97RbR+BfAuASu/GvuOtl/T2JMC1k2gtTlFagub5dxrEXzDtfauQJITf4loYPAPL
         QPvIXIFFyjjwNaTBAXkom6kJuA9YVrmyG5bAP3AUiWf0TvlTJZxGNVHqY5B8g5/NC6e1
         S6UzM0jB1pgYB3FPp/VTcmUiNW+90a3SE1mLm7XMjBiwJ7mSUO01rf09e0X5ZimnPGKH
         OU5x7cmg4ejug4paMVfJOkKcwX6dK3Z2HMe6LyT9DAkWehBxUOXruuKCXdyb7JYK1GU9
         Mb3ifLNKGZms9AmlCAIYtBSD6nROUjSxhP0pLQkoVdv+IwbNquMUZEs4VtBlv9BgQvgL
         MPXA==
X-Gm-Message-State: ANoB5pmZ+6j1fexYIFK76mnMypa9IAwxd/Z0DWe0jZ7cdPxgd7GI+n7F
	0acu2fpY8hYw/rkr3+rNAlj0FA==
X-Google-Smtp-Source: AA0mqf7H59UQSAfACrtMGR0E/FwZ91MHqTTaVimzebPKTWc9FPObxmBbryHyXQRn635gjJ4JyuQ5ww==
X-Received: by 2002:a63:ce42:0:b0:478:d4ce:5d3f with SMTP id r2-20020a63ce42000000b00478d4ce5d3fmr7083291pgi.277.1670378975497;
        Tue, 06 Dec 2022 18:09:35 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id t10-20020a63eb0a000000b004702eca61fcsm10428105pgh.36.2022.12.06.18.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 18:09:35 -0800 (PST)
Subject: [PATCH v3 3/4] Documentation: RISC-V: Mention the UEFI Standards
Date: Tue,  6 Dec 2022 18:08:14 -0800
Message-Id: <20221207020815.16214-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207020815.16214-1-palmer@rivosinc.com>
References: <20221207020815.16214-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
  Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_180937_128320_7DD75EB4 
X-CRM114-Status: GOOD (  10.12  )
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

The current patch acceptance policy requires that specifications are
approved by the RISC-V foundation, but we rely on external
specifications as well.  This explicitly calls out the UEFI
specifications that we're starting to depend on.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/patch-acceptance.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
index 16b90a31d267..02e6a48809ef 100644
--- a/Documentation/riscv/patch-acceptance.rst
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -20,9 +20,11 @@ Submit Checklist Addendum
 -------------------------
 We'll only accept patches for new modules or extensions if the
 specifications for those modules or extensions are listed as being
-"Frozen" or "Ratified" by the RISC-V Foundation.  (Developers may, of
-course, maintain their own Linux kernel trees that contain code for
-any draft extensions that they wish.)
+unlikely to be incompatibly changed in the future.  For
+specifications from the RISC-V foundation this means "Frozen" or
+"Ratified", for the UEFI forum specifications this means a published
+ECR.  (Developers may, of course, maintain their own Linux kernel trees
+that contain code for any draft extensions that they wish.)
 
 Additionally, the RISC-V specification allows implementors to create
 their own custom extensions.  These custom extensions aren't required
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
