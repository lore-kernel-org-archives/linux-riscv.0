Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67564606A884
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 16:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=faXlGO/n;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KUKvwTYz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=y/DS/YC3VXwQ2dKsVcEUr7xxTYcMzaxT1XRBAFtOlY8=; b=faXlGO/nqRQC6kcFEGHPJW446Z
	wgn9eVzkBwJq/phtd80WU6rWE6DI9yzVPGSbv66N3+fBWHxryvgVk/1Jd0IYDtoZVN9SbWkx03yyn
	lIXoNrZZh5/fMcxYN9XB23jmNhbVD8SY5V1StghmLdjUARQVpMLJDF6OxUpkv81ZfznVJHH2urrs3
	81myANhrUsg/X+XQhpG8IeSkeTno6HdZEmhOysN8T0WqzCS5FsaWzZ3IuHraQXNLYbSLAf+KI08s3
	I6sRdMf5VU9HpdZMJNo2y1yrSa5O6uxCdTTYvo10W8RJ4KfPs1uDPU/dRXV1fsHAjH66tVVqUZaGt
	fVHefevA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQq-00000007E4B-46LM;
	Wed, 11 Nov 2026 16:44:20 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQl-00000007E0I-0gkR
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 16:44:16 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-492e3189fc9so2440571f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 08:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794415453; x=1795020253; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7jtARyRrlvTBzKX/llBKMEK2/+TQCQjH76pC25b6sc=;
        b=KUKvwTYz28D/SJ9P+Fz2NzTgBOEIddD8SDZ1nDhoT8B+LSllWHO4LSVX2xljtX/yUb
         BxMzIS+Kz5IZ0o26nOlUwI2JLACBOV+HvJlTtqBR66ZJ59/PCpjAdyEgYbYVUxiNKQ7v
         /Xu3Y+Ke2uyiWeK6fKcZjjfJHP0yyQZ9vcCMmt/QIOVyQ7kQ9c5AXoD5zYSCU+rOw2yF
         IVkSoH2U1Y4g2RZlNdRh8L5F1n2V1Up9WL7Yg6QvrhvfUuIannaGX676ci1wN3m5J7oI
         ZV+RUQCduZX3pMVeb0vQzHDDDHKVghglbE+pCst0bnCEQgESHSzza5VJ5J2xOJzixblo
         VWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415453; x=1795020253;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7jtARyRrlvTBzKX/llBKMEK2/+TQCQjH76pC25b6sc=;
        b=XFnyKd/iZyMD/BBjxbQ01RlvuilS0WP4toBeDe8CZqaXgfEOsirj+wzKrxv8Pbvlbx
         6AfjW9qwWUC+jZMYL+q6uL1zRwVcxCiJgLDdYHuSJ9aAcU3XDy+99Wu6I+XqWImoT2uo
         16h1V2nWm2/0gwQslmJZDfdJ/NBPhEvslNhU7hFPSgB/7Odj0VjW+CoNeYHNG+/yDf2L
         /XAi9TVDYjb15Nw4xRnWt1nE1SdYosW/VJTgr+Dz2At+gtSfnYCgCoaO3HIIixT8aTSp
         jGJeQ80GWwVuopAa9SJUFI3jpgukJxVtYaXhWpVo2QjOc2/rTrjIbvUVtpCriVoNfJLq
         4sZQ==
X-Forwarded-Encrypted: i=1; AL+hErFTFApY0Y+4E0+8hmPe++Uff7z38d8xAheJyJxW7xbhYAOyOr5LkocbMmG8V2j8/POQcBcPOTf4Yo2wfg==@lists.infradead.org
X-Gm-Message-State: APuU4Z82/JOGop+lsCX68qigPzPnR9h0nhfI3C4B88JyIGxkOb+ruulQ
	Bf+NW4SUzCLrU9POylnXbH5TglUAM8BEJmetGlg+iEuDC+9QqK4G686bfnBXj4EW9aFL/sc+vQ=
	=
X-Received: from wrvq9.prod.google.com ([2002:a5d:61c9:0:b0:493:1d71:a33b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:6f16:0:b0:491:6b1b:7f25
 with SMTP id ffacd0b85a97d-499c792ec97mr4620755f8f.45.1794415452403; Wed, 11
 Nov 2026 08:44:12 -0800 (PST)
Date: Wed, 11 Nov 2026 17:43:48 +0100
In-Reply-To: <20261111164345.4059964-5-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111164345.4059964-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766; i=ardb@kernel.org;
 h=from:subject; bh=eT0StU5ofM1ZIeiPxXpHgj6oh7hxI9c/ggA+8N4HDMw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevLbBffTtWWursvTF4WB/ztn8go9jvqlO/VVKbY+6wvp
 kV/SxLoKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABN5F8rI8EhzzYs5ZyeXSl4T
 uijzXX7Zq6JdjJpN6gsKnD/3ZGifMGFkmHLoRsSjyKRbXJrf/+zd4Opoub4g5Pb3CVvMV5jU5f1 w5AAA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111164345.4059964-7-ardb+git@google.com>
Subject: [PATCH 2/3] riscv: Make _text point to the start of the kernel image
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_084415_240466_3AA45DD0 
X-CRM114-Status: GOOD (  16.00  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

On RISC-V, _text currently refers to the start of the .text output
section, which is placed after the image header (.head.text), and is
therefore equal to _stext. On most other architectures such, _text
refers to the start of the image, and is used as such by generic code,
e.g., to describe the kernel mapping in /proc/kcore and in the ELF
headers of the vmcore, and by the EFI stub.

Now that arch/riscv no longer uses _text to refer to the start of the
kernel code, move it to the start of the image so that it is equal to
_start, and the distinction between _text and _stext is the same as on
other architectures.

This also means that the image header is no longer omitted from the
/proc/kcore and vmcore kernel text mappings. Other users of _text, such
as kallsyms and ftrace, only use it as a reference point to calculate
relative offsets, and are not affected by this change.

Note that, as on arm64, _text will no longer appear in /proc/kallsyms
unless CONFIG_KALLSYMS_ALL=y, given that it now lives outside of the
[_stext, _etext) range. User space tools such as perf already fall back
to _stext in this case.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1f4f8496941a..9849a3e4d102 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -28,11 +28,11 @@ SECTIONS
 	/* Beginning of code and text segment */
 	. = LOAD_OFFSET;
 	_start = .;
+	_text = .;
 	HEAD_TEXT_SECTION
 	. = ALIGN(PAGE_SIZE);
 
 	.text : {
-		_text = .;
 		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
-- 
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
