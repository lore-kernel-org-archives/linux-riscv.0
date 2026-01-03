Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C6BFC6176
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26dsXStTM0aGOTwSHwogx+3r2F6C3pBeluFnlLnQVh8=; b=uUChRgS0B74lOC
	Bw1KuZvrjoZ+6YsejB9a38EzKq/JjvMJ8UgFIsZ13vu6hWcpit20ajJuPlf4gFcVnIcr7yGd2gmhR
	QYRfgchuKPv11T5WEov76a4e7o4jOKocQKwwGFVqjopTidfvQHylFNz92fDDFsQENaeG5Z2QgKJOD
	+PsrFqp+evCx4mfH3VQLvFx+z4gmM4xuDLe4gW1YG8rmAmW13soG0qMKXeAWiGd8G14uv/bua86xT
	fODt/Lg/Mj8GKZ7O4fkRcZ9hZiEv3+RAN5ZCvsBvlmYIycqWpsfw7aONwqOxBpQY7xGRUH7m3XaAD
	0jnDbolLeAibu2siuTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIx-000000097Kc-3dC8;
	Sat, 03 Jan 2026 08:48:11 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIu-000000097Gj-1gDU
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 08:48:10 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7f651586be1so232665b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 00:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430087; x=1768034887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHUhniRWcOleZ/LWsZA4B498/r40yHnXuPYvUqkOFcY=;
        b=D+XAV7YN6cVLQzR2LSH1tl+GP8pYDh09oIJm8nsybzEEfLg1O9XZcrsuUr3pZ4XClU
         D47CcN2xcG8zGdHqsN51MEgbQh3PaWVSGcC5FgIOFXQg6RtQ99cg3plfGoBW2yekHaN4
         c4shuL4CEhL6RPmyR4v50doPU/O3bYUVVMlgHk8OKMAuNSP1+98AR+D+G6UGFiMiDNnA
         SAXKe5plWNmYjIJSPn8PAPzeUse4vqOZQy/LOISmeU2kTmsMP4ODRCXpDghd+wIfUvOB
         R/kJP+ezQWbWY2O1rwO6CB7hqTxX79RotF5KgXyXjyHUFBs+6iuxH98Sw1Yddj2Fn3gp
         P8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430087; x=1768034887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JHUhniRWcOleZ/LWsZA4B498/r40yHnXuPYvUqkOFcY=;
        b=hp9zzUFFkI8H2trXef85X769mmY7cODRw6iYdKOWjZeuAMEJoCxhjcQDIRYoeLQl3w
         GZGSgzOnAYPs42MNhENnHwntYFeVj9HkDOzwA3oaPzGi7VM6Fuhg2s+ZarbzXr4xZ42T
         T7SSxPFW0M01lz5Co1ykMZwQRKLH2zw4+NhH/fCJQZu6fl52nm3uLtA6tJfkE2QIegmK
         c0ozuTuzWIXNC1EAFC+QKa5HV2WiVXSTMGyAQjtF1dlz2y2CbeZe8GiZ/2eP3cYho8y1
         Ftzo3YTCQrhuMa189EUDI4Rr+1hJzouzxCCyrjLS2Gw5YaV6oT+tqSUL2BekY7vFC3OH
         MPYg==
X-Forwarded-Encrypted: i=1; AJvYcCWMcLtpjJ4+YZEQfoovXZWacHXlbWvMkBVKqATNB2FXekD0WgCz5lvDR5zqrQdKf1hKPtcceAWYJErhWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yww1xjW/ZSCAFtUHhZ0CMPBeOCz06fmzQGcGaAEKsIM2LAlu/Cx
	BDFuq1kp3bAiwSas6+WpitCewPeRGmq1mLB+s65htL7wkR0qxX9QS+0S
X-Gm-Gg: AY/fxX65qyr+Zzu5AtE1jZwhDHZxnVJvVcjg/bhFso15h4lbSi5BvaX2x+gfe2IxrtW
	u1kf7Xfys64LMJmAB2bBM0Vv9bH7I9iLgWzuau28RCaGT6oD9C/7uqw5sjkXdkpM/819giXnhl0
	fIBhU/ctQbyUAZfEl5vCubWdfZhgtOZ1/kC8Od0C+kI2ycqDvYR32KUwwcLGAXKwUgTJdk+3jD7
	5ySKBa0bz2I+rgPlmXCu+yEgopJSvj44/ekJUEdaj+OBit+qcvTTuRXibuDcEbBrQR57PSFbwbB
	QJzcaIlvV76kjGK6Bs4wrvaf2TicP0M2vsMV1e9/Eaos0XbX+KzXrBnXWS3wLocSU5H7Zl5hV+e
	zQEjvNT+UMpl5ZAnQq7S38RVkkbp57XYNgiFtvdzPOt6kXHXbeyMQSH05A/ZHlfkwysBxlOD/y7
	659+f8MxgFnaE14MnJew35CHJWI1WnU2587eo=
X-Google-Smtp-Source: AGHT+IFoiqDv7u4QVwPAsnB9Ilz+AGYXHXN7Krwf9OXzvHcyBpVKkqOp/lFBq/KGwKuFExK695g6Ag==
X-Received: by 2002:a05:6a00:4895:b0:7e8:3fcb:9afc with SMTP id d2e1a72fcca58-8148ba1ab36mr1175712b3a.18.1767430087435;
        Sat, 03 Jan 2026 00:48:07 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:07 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 4/5] arm/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
Date: Sat,  3 Jan 2026 16:42:42 +0800
Message-ID: <20260103084243.195125-5-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_004809_575261_D71556C6 
X-CRM114-Status: UNSURE (   9.30  )
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

Replace deprecated kmap_atomic() with kmap_local_page().

Signed-off-by: Keke Ming <ming.jvle@gmail.com>
---
 arch/arm/probes/uprobes/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/probes/uprobes/core.c b/arch/arm/probes/uprobes/core.c
index 3d96fb41d624..0e1c6b9e7e54 100644
--- a/arch/arm/probes/uprobes/core.c
+++ b/arch/arm/probes/uprobes/core.c
@@ -113,7 +113,7 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe, struct mm_struct *mm,
 void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 			   void *src, unsigned long len)
 {
-	void *xol_page_kaddr = kmap_atomic(page);
+	void *xol_page_kaddr = kmap_local_page(page);
 	void *dst = xol_page_kaddr + (vaddr & ~PAGE_MASK);
 
 	preempt_disable();
@@ -126,7 +126,7 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 
 	preempt_enable();
 
-	kunmap_atomic(xol_page_kaddr);
+	kunmap_local(xol_page_kaddr);
 }
 
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
