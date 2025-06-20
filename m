Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540AFC7115C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 12:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xWDk687xGM5kUD0tUzv/2IrWSjJJsjqTTnhT9kPCTvU=; b=h5/aUFdHok2LVC
	d1q9LIPvdPUAkxL+If9v4Sfm5TIH81BdtIMWTqwbwPNJ6fyE+iGG1b4hVM5CZRtPwE19yKAt61CjJ
	mUPPRrmsDV17HXPTUxEu3+Jw/05tIjtiA4y5bS2BnXQfhS17ERfQjVaADfm7LNHQMLt/AlQtxYut8
	ucsopU3QE0GzrI6or4zTa/8imGdU8OlLZyvoiCjY6xorpnhePTj5/z16fgsd5PvpvjGDJG7Gd9zrw
	Sd0dX7LBrO1/nXMiICp0OZ0GgV3V8XPbS/uQBJdVVQxSbiQF9+LF1AWvz1uxdNYORdaWlS49TTRNj
	8voFeeA3ddZEzIMBAfiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbJa-0000000Fc9F-3KUc;
	Fri, 20 Jun 2025 12:57:54 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaXh-0000000FXbs-0BZ1
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 12:08:26 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-235ea292956so17982265ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jun 2025 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750421303; x=1751026103; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x1fjBUL2XYvHrykgkOfMnXaOkNrBJXoSMebmbae1qII=;
        b=jcZ84I8HhsI06BB/sbO5Bpg4eBTfrpoQhdKlGs5OyQ5Fz81S5OFJe1397tTwaOWShW
         H1OXvEJyorYFKk1QnKUbrNoAQA7MDlFZ8oxF0BZYy6K1qZV5SFITGhpQu6mkjthdxVVp
         qvaLHF5Me4vOjnZR0oLFzRJ6B6lxCC7elTDyoG/o26xHfy2b2ELkhDRNGE1jaclh4Zkj
         ZFq1cMHPTAywNZobDigpByHFTF27SvYXz7KWyWZ8NjZ/Cx/otfbVAbEBIz91SWFFRNF0
         Ye/ECuskm42iusaOpDrGDyb6W9DNsyzY4kIT1NMHWBRr64nwpGcl+PRgp9nH218xSo59
         lu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421303; x=1751026103;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1fjBUL2XYvHrykgkOfMnXaOkNrBJXoSMebmbae1qII=;
        b=HYU6zzBo1hDKM1/rE+JwoZlSB6ydyPqRR70+mcAr8hHNaFVYLDd3xn0sIT+9pVhXiE
         HU2dWBOLzcsqqMZwxphZjyj4fV53PoZIHaBUwrsucjJgFSuBBER6lK0uWZ2/sDkKaFWz
         apUV3F+eiHA4MQI9gP+MNYqLVzdfHs8lLPs8Ioo/Lg+9wFkPfdrkademAAJCz269VMrP
         VOYvttXODiuyc03vKEUOFPfMXnLiR7B0qWo2/P+H4oMEc6v+51IO67PE6ErogvygY2yp
         jD3I5245jNTMHeFn/3pjEBKenERzGoVByM0TOdaTYp/k6OxDBvJ4kHkzmWLH0kOuA8ng
         /xOg==
X-Forwarded-Encrypted: i=1; AJvYcCUUO8MynMDJyQQ+QrO1tvXB/uvF5Xg+ORMYa8IUpi4P11A46IQ0s3aZ+nBxB8RYpqCWUwgUNY5mx4vS1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6o3b9+iulKg8gAFNU0MEYyZknl9GfcnU7isthGBIp7e23luve
	GRGfpRvnv0GdKPrT8zU1MJ+sW1Ugw3MZ9zTMz9LTvuKy2X1Z8/yHi8Uc3mA/lzxpBl2phgTTyrC
	Ag9gn
X-Gm-Gg: ASbGncu8JfJ5EM7qN8bgkAaHPcgDU/lAxeC2nCHU6B7hWjSuUR+9CSvvH1AnC3Oafqb
	7A/SMOh77AQb6qGulFW9xhIAhwel34tgxeGbtOJUs2cukb2gN8XUwno71lKKOa93lckUQ6oy28f
	rJL4dgSBYpxD6ety4Qf/EPaYhc+vSw05EemSC8Injqfg9ZpzJn3ShZKVDKxIIPHJD3hmx87GFB/
	aj1ntvzvmJUoUNAOX5FYeAf1z/XY6NkblEpLhQGGQOTQKEfhCRMRz0urQQyuBpL1VCtS5HGh/zD
	XWTQuWMeZqUaRHrvSBUZdfHbBzJgCla7EZ7nvgtb/db3NcKA03uIy+uhrXbmxAzVFZJXljjyf0q
	bWvTSPkHO8ysAIvo4KheTeZCAY6fIcO4P0g==
X-Google-Smtp-Source: AGHT+IGycHzAhUJJAN9cpgp+5Y+FIXbfgDE2lvPamJQsbOi0tfEHUE8qePJHDEgGxwDJWS+qCgrtVg==
X-Received: by 2002:a17:903:1988:b0:234:f182:a734 with SMTP id d9443c01a7336-237d9954d7dmr41126535ad.31.1750421303295;
        Fri, 20 Jun 2025 05:08:23 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8664731sm17063945ad.155.2025.06.20.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:08:22 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 20 Jun 2025 12:08:11 +0000
Subject: [PATCH] riscv: Fix sparse warning in vendor_extensions/sifive.c
MIME-Version: 1.0
Message-Id: <20250620-dev-alex-fix_sparse_sifive_v1-v1-1-efa3a6f93846@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIACtPVWgC/x3MWwqDMBBG4a2Eee5ALlrFrZQSQv2tA6IhA0EQ9
 97Qxw8O5yJFEShN5qKCKirH3uAehj5r2r9gmZvJW9/bp7c8o3LacPIiZ9SciiKqLFIRq+MOLlg
 M8GMI1B65oHX//+t93z9FVBIabwAAAA==
X-Change-ID: 20250620-dev-alex-fix_sparse_sifive_v1-4e130e7e2833
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Cyan Yang <cyan.yang@sifive.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=NBzdre9NgtizA5cyu5ssuTUFGpGinr6k0RX+SHNCvt4=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJC/Y3nfbjQHPYnKbowX3HWUfd5d8wWzG3IWWmu+8ZOd
 r2dbSNXRykLgxgHg6yYIouCeUJXi/3Z+tl/Lr2HmcPKBDKEgYtTACbybQojw9PtcupSx3e9LN9Q
 42T8XUS+w+zuzcLfkpOu2JYoVwQpVDAybC8oE3rvUXh55+IT6mp+VX4tU0+wTcoSsvlhISTj8fE
 RAwA=
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_050825_094454_97C41A9D 
X-CRM114-Status: UNSURE (   9.67  )
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

sparse reports the following warning:

arch/riscv/kernel/vendor_extensions/sifive.c:11:33: sparse: sparse: symbol 'riscv_isa_vendor_ext_sifive' was not declared. Should it be static?

So as this struct is only used in this file, make it static.

Fixes: 2d147d77ae6e ("riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505072100.TZlEp8h1-lkp@intel.com/
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/vendor_extensions/sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
index 1411337dc1e61aba0b844902f356625048c85abc..8fcf67e8c07facd1bfdbc0e18dd9b43102f22145 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -8,7 +8,7 @@
 #include <linux/types.h>
 
 /* All SiFive vendor extensions supported in Linux */
-const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
+static const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
 	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
 	__RISCV_ISA_EXT_DATA(xsfvfwmaccqqq, RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),

---
base-commit: e10a0dc2d21fd742c8d6ba042a98c05815011f9d
change-id: 20250620-dev-alex-fix_sparse_sifive_v1-4e130e7e2833

Best regards,
-- 
Alexandre Ghiti <alexghiti@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
