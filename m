Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC8C606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4PW2+Ly8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n9N/kw1w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=T54g8ZvO6THgx2QfhAHtn4ZnTTAdoDKsMwpUXOACuR0=; b=4PW2+Ly8u6nkS4jdLzamJ3Fq5C
	0d5yQgwaCKb8MH3x9bruAnp/hd2XvHv+m7+TTnEfaBC9a85AauPSpypwFrokj7sWme+U4B5a/SSrU
	AWtmtQNDRQBy+qQhoJ+GyoLWENquUMb9Dy8TER6h2aIhsbtTaUP2+sxb/4vXvnc2vmkx/WTqsy8Dp
	NUudCZF+CUntlr/LNHoeRtJnqqFoYeLfesUYfmi3ppjXxQa9wxQMTrwBX70k9NGIuhqDoRJbTg6oQ
	mGdtDU3alRL+pV4kcB76BJUHc+JXy7xnqwGtKwBE/fPD7dviTneZfNCebwCMYKvmUJWqwdVSOr37H
	KX5xmQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg6-00000002pP6-1BfS;
	Mon, 16 Nov 2026 14:27:26 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxfy-00000002pFA-19oQ
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:21 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso16461065e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 06:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839236; x=1795444036; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pus6Zon9bBsFufoopNpQt/nFtp2HWtzZyOc0mElYIXI=;
        b=n9N/kw1wASmK8eFo3HwDKbLkV6owW9hGiko9VoTgp352T4eNHhBAvWFcamam4LUVfk
         U6MxB81bqOHhm+OVf85ATluN2EsmkAPQDLi9agISVgzf4dWFHDLzjEufv9Tv+DrbhV1R
         walaw7XW5LKi1gHc7yRDp2nGqzgIekQIkJNHB4hJv7ZHSXtnDVBlpm+DAYkqNgGTVDDC
         efKGu8D5TMkBnXqq+gOAEItK7rNQIkFrcvtDVMTe1ZvTbP+3fYT9NLYyNFVODbC9u/av
         bEDx8sdXE678Ewl4R+/xnl9uQBOq8wXwULuNzqtnBYiFTxRip+TADZV7wTAFbzyGdvAY
         eVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839236; x=1795444036;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pus6Zon9bBsFufoopNpQt/nFtp2HWtzZyOc0mElYIXI=;
        b=I/DQcPEnMiYzoI7NbTIrOuGG8o8VONpX2IAyeh75JgISQRNzFNcSXQvEhLVlLWvyYw
         SJjz8Ig9OS5SxbJUsXVMMEdWLORzhdSW1yXpU+D1xASUdjNowpIkymP8cUp8H2OrPQz1
         W2I7RZPUxu08h9grw0qqz39iVolLWetuGZfTfDqnF91ZcE9S3IMI9g/i97mjmvRLzp4P
         wnR3GPpZOUVl935kTixqhov2UR8p6t3LaBDc0z97cFPuS/slHzjvybfZ3cKU46DiJ7QM
         Qdi9AZUejA8Co64VqdmiIGPug+yK3QcSguj2MInOHJFmYvGp8KbOaoTvCdZwxXlzwbTr
         35XQ==
X-Forwarded-Encrypted: i=1; AL+hErG37l5yw6Rhp6OggqzGBkL5shUtmRBr825P0Hvr19VDJhpbEP9N58IaKJEEaBh9/EzXrNsvm930xSc8mA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+b491atYd5UT1uIL4mrqLP3CTMrSCyQemR5EVVPsVBMn4hfr39
	h///DqiTR5UjXnQQuw4eXgH956QXpavYw1tLv+Xo9gsyUwVwtLXheUT4TQbAaavjNDZ/hbGlpQ=
	=
X-Received: from wmbjj17.prod.google.com ([2002:a05:600c:6a11:b0:4a3:5d5b:9ad9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f81:b0:4a7:a5db:a93e
 with SMTP id 5b1f17b1804b1-4bb5f3f7efdmr165201905e9.4.1794839235418; Mon, 16
 Nov 2026 06:27:15 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:22 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1529; i=ardb@kernel.org;
 h=from:subject; bh=A8MzxjCVv4eM6mkH8sNsgPFkx7gf3UVeNfnQwzNCuhw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu3UH+bU9CjRLa86aIH37lv1jSRj5ac/GX6sgW335eei
 XnJtiS4o5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExkww9GhpVnbigaHjHPy5/x
 T+3HCq6Lcfahm4w+9y/uK7/85oP80ccMf0Uu3/pS4j2j8IbsHeN/EQ3LQp32pvoesD+jcquOmev MfjYA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-20-ardb+git@google.com>
Subject: [PATCH v3 03/15] riscv: Make _text point to the start of the kernel image
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062718_371635_C624DD08 
X-CRM114-Status: GOOD (  15.36  )
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
therefore equal to _stext. On other architectures such as arm64, _text
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
