Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EA9C5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 03:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S/zBhbL3uDzD7mdjbBDW7hS+CHCyodLI8CwZdU0z1wM=; b=tne0dREMk0eodM
	AATQKzsUmAvHm+iFd+2p11JlXF3/sqfSR18ECv4BV8lfNhg4ey2zTmhZL7Nc0CeP5vxtCy1cGhX3G
	XTK8MHBjSYoQBW6uLKoBmCXmHnX0RBPWNQ9wce1Ymjdit7fyA+uY/JhUPl9S5150Hn78ZauiijZq9
	qAhk+32BS2tDzi0reuNdezAK2OkVy7Fx8NjaiUdNWD4ZiiU9+a4EevgRumXNgnKhMajWPEBDriXZG
	ZuSBRH7SsRT9qLlVLGNPChwANnA7OcnGIA9J1uePYfWSgivuxAGCMFGb+WxkiVbNxdZ+iKaUa81f4
	AdBaLT/20uHpDW+O5bmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMIdz-00000009bBo-2Y1d;
	Tue, 03 Jun 2025 03:48:55 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMIdw-00000009bBS-3yjc
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 03:48:54 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-60bef8e7bb3so2299253eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 20:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748922530; x=1749527330;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdL6Pc63Mfaws2Erg/4lSldp2avlQyahxxSrxGNP9Ww=;
        b=EUONT2JLfH/n6cHI8o32ANkyMqFeWZzeivlubZVO22CQzy0Vw0sxtC87cZ/iuM0xrI
         JC9sE7BFolNltS40jTPmubgHhq0vGlNtarBCYOTwqicYt7UbyxaIlDvEhupXBvVCjvr9
         FBhoCLDmaZswkeqnDS1XwpZhbHfL5NTBQhMBaCZLeNNrPDHEYnapzaEQgupsfEMlx+7y
         Tglv4OJ7hQO+ktXTLvmAoKK1XIFF1pdr9cAdyO3saXPcewd1TMGDbxvY8xiUrWjgtOTn
         jLPw8rkMZ/x52LRkAEai7uPfaCHoJntEemjLMfLsWT/HMCa80Pl5mErwkbIakeIL4jOD
         p4jw==
X-Gm-Message-State: AOJu0YwWq/7rJ3189APjHjDGejvhc7TFerPhYiJqYs3xgC7Zi5IiP2mi
	F/6JJR+KIRiQESJYGX7uMP/aeSm0DdrZEBwIrcBA7r/a+axYYXS9nNrG
X-Gm-Gg: ASbGnctTHFg7x1AvRi2CFNZcZk2WDdzuET2S3Q+FVM0y+lWeFgWJXCOmkIjZ7izFnib
	UJUKOXT4SDU+KwLOPbk6gLw4+Ja/8zQ4hn4ZuZJ8OpKmCFU09n2KxthCkMiBGMJx991CGXyr5AV
	+IxHnOOPuajoZV544QYs2ai8bgtSm4fXX02ixGrO+lfn4IU19cjDbGo1QgO1OjJ2PiT/bPbIlcZ
	9H0J8mST/E3ho1jyHK1VeFjwksMcciCtpWBwZ7Kw9xL4HiP1bS5zAMt1D1Rz4JMQssrKdzZzNbw
	TIdE1cDV5y46GNpWRluTFY+Qn8sgtKd/c5f6X4H7vPsJ7vRVfI8F9aUPvJ7YH189kzTP9tZJQrG
	kd4lvjG2KTKEOl3U=
X-Google-Smtp-Source: AGHT+IFJ0a0/7zpdoajtkBcLg0pJalyYk1624WDxYssQNRcHtUpuFOsvwX5Z/G9JDfUurD4GyikbgQ==
X-Received: by 2002:a05:6820:2782:b0:60b:aeb2:988c with SMTP id 006d021491bc7-60d52db217dmr7757340eaf.1.1748922530242;
        Mon, 02 Jun 2025 20:48:50 -0700 (PDT)
Received: from localhost (37-72-172-174.static.hvvc.us. [37.72.172.174])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c14c7122bsm1740655eaf.14.2025.06.02.20.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 20:48:49 -0700 (PDT)
From: Fangrui Song <i@maskray.me>
Date: Mon, 02 Jun 2025 20:48:44 -0700
Subject: [PATCH] riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment
MIME-Version: 1.0
Message-Id: <20250602-riscv-vdso-v1-1-0620cf63cff0@maskray.me>
X-B4-Tracking: v=1; b=H4sIAJtwPmgC/x3MTQqAIBBA4avIrBP8q0VXiRaiY81GwwEJxLsnL
 b/Fex0YKyHDLjpUbMRU8oReBITb5wslxWkwyqxqU0ZW4tBki1yktpgionXeOJjBUzHR+8+Oc4w
 P+u4HylwAAAA=
X-Change-ID: 20250602-riscv-vdso-13efdee34a24
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Fangrui Song <i@maskray.me>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_204853_034741_BC047A7F 
X-CRM114-Status: GOOD (  10.40  )
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

.rodata is implicitly included in the PT_DYNAMIC segment due to
inheriting the segment of the preceding .dynamic section (in both GNU ld
and LLD).  When the .rodata section's size is not a multiple of 16
bytes on riscv64, llvm-readelf will report a "PT_DYNAMIC dynamic table
is invalid" warning.  Note: in the presence of the .dynamic section, GNU
readelf and llvm-readelf's -d option decodes the dynamic section using
the section.

This issue arose after commit 8f8c1ff879fab60f80f3a7aec3000f47e5b03ba9
("riscv: vdso.lds.S: remove hardcoded 0x800 .text start addr"), which
placed .rodata directly after .dynamic by removing .eh_frame.

This patch resolves the implicit inclusion into PT_DYNAMIC by explicitly
specifying the :text output section phdr.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://github.com/ClangBuiltLinux/linux/issues/2093
Signed-off-by: Fangrui Song <i@maskray.me>
---
 arch/riscv/kernel/vdso/vdso.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index abc69cda0445b1f500a89b47deefa31349103f08..62e0410f69f09e2bbf27101c000d604193f525cb 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -30,7 +30,7 @@ SECTIONS
 		*(.data .data.* .gnu.linkonce.d.*)
 		*(.dynbss)
 		*(.bss .bss.* .gnu.linkonce.b.*)
-	}
+	}						:text
 
 	.note		: { *(.note.*) }		:text	:note
 

---
base-commit: 1a3f6980889df3fc90ad3e4a525061d2c138adba
change-id: 20250602-riscv-vdso-13efdee34a24

Best regards,
-- 
Fangrui Song <i@maskray.me>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
