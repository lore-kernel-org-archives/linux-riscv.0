Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DDBC10DCE
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1f2rF0mTZRNYj4dPd+j1Jwv/EedFpEO+DxeZkjEWT6k=; b=Cdofo/6q9lCxlg
	zfjCNd8oQYUFz2IiIxHOfNfdWez21PSEv2obzE0NY4iSImAh3nZSYm3etZYGHD2XdxfoXEsj3d0dx
	xda0aZgH0D15oIq3mUgNADGRHT+COVRrzNKScoLVvWor+4TBExynR+ysOYB3XzA4QFtRqL15aHVqi
	zb6hLgnJBHheO6xRF22Zdr9mxtNk9cN+4sIrUNUjI/lwnr0EHxw6ZRzdISsfggM1Ce/uotGq3DyII
	OtW+emTo28/WwJU0qRPscrBhLqJq4h/6KwT0SLXZKhWaKazZkkV6z2ugHU1VT4WxrLS+/WMDOKApT
	62fd2XPu8joyB5IideqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtd-00876B-0g;
	Tue, 05 Dec 2023 18:11:49 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtR-0086qg-20
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:11:39 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ca0f21e48cso23465271fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701799896; x=1702404696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHgnsxYfxbVMyX3m0HtccyvAeuvvFGofY8I7vS+QRNk=;
        b=MGfgvf3pbVJeok6vDhUTJngMUPNFxjeHjl2rk2+Y80DgAXjWfWIUXCJLWrjEBkdi1B
         JGX/YeZZ4bpbLIL1Ie2mGOvlic23ElUE1BPHz/RRPMKo2tto0Wu8OUB+3k2w/3Nl7vDF
         JTBvdtuFMlvYF1JPUlPcfkJbv6ANoKCAtr/R7ccE/9XntMGjZcR6flSIeRESjfWfzBm+
         0fayy2T0U2Ni3K5cSeBZf1XFO74FZsc6Lud0+Jerjhf1DapRziYOdrA6Y1bVCIFKuPq/
         +EplveWIS3gdRT9QBX1G9E5h4f4SO+QxUHnhkMXkXUv2FtA2WYFcWMY986eH362me3yQ
         6XFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799896; x=1702404696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHgnsxYfxbVMyX3m0HtccyvAeuvvFGofY8I7vS+QRNk=;
        b=WDj8Hr7yMZGqmWDfZnGY5wFCQVPwCL+txSbnEX9dHhEHsaAd/exI5JPZ4rAjK0sl82
         bAfbNr5ZPnQUK9wpCjQoQ60wm9zuv7Ws79IpACQ9gxCWV7Z03Lv9xMP1BPFx7LO3ctvv
         ne5PJTuql9lGpsTCRUgNEaVRIJrhqOjAUPlUL45kI8vZtHaEPHqW77BGcDo4X8MjCmzW
         s65RbPjA+jg9lkeegE6OHlnV8plYGC8v4TTPWr3P/de53CkW76Bgp/1gtIZ5xRsVYRGb
         +cm/YBhWZHuHpH1UfPWXdm3Kdb4xW9GG1UzFeu6ScqpT283eeUU8XeNxWcfTVWzTUtYC
         AT4Q==
X-Gm-Message-State: AOJu0YxRnDuKU3aSAm1u1nWSSs+USqVWAv9W0Sy5izcroTI+LCs3wair
	+0fzht84qL9/22FIlc0PX3KWkQ==
X-Google-Smtp-Source: AGHT+IG97AuL+LChjgF63QnqtOy4VATXl7JSYLwN+S1ivGoshvCJ7pJfDLFDe3G+/9M89/kMqHoxhA==
X-Received: by 2002:a2e:9156:0:b0:2c9:fee0:5743 with SMTP id q22-20020a2e9156000000b002c9fee05743mr2721950ljg.99.1701799896195;
        Tue, 05 Dec 2023 10:11:36 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id d22-20020a056402079600b0054b286fa48bsm1384933edy.91.2023.12.05.10.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:11:35 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org
Subject: [PATCH v1 11/14] RISC-V: KVM: selftests: Move sbi_ecall to processor.c
Date: Tue,  5 Dec 2023 19:11:31 +0100
Message-ID: <20231205181119.207204-27-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205181119.207204-16-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_101137_694107_D63114AB 
X-CRM114-Status: UNSURE (   9.40  )
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

sbi_ecall() isn't ucall specific and its prototype is already in
processor.h. Move its implementation to processor.c.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/lib/riscv/processor.c       | 26 +++++++++++++++++++
 tools/testing/selftests/kvm/lib/riscv/ucall.c | 26 -------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 6c25f7843ef4..6905a4348380 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -367,3 +367,29 @@ void vcpu_args_set(struct kvm_vcpu *vcpu, unsigned int num, ...)
 void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
 {
 }
+
+struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
+			unsigned long arg1, unsigned long arg2,
+			unsigned long arg3, unsigned long arg4,
+			unsigned long arg5)
+{
+	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
+	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
+	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
+	register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
+	register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
+	register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
+	register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
+	register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
+	struct sbiret ret;
+
+	asm volatile (
+		"ecall"
+		: "+r" (a0), "+r" (a1)
+		: "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
+		: "memory");
+	ret.error = a0;
+	ret.value = a1;
+
+	return ret;
+}
diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
index fe6d1004f018..14ee17151a59 100644
--- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
+++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
@@ -10,32 +10,6 @@
 #include "kvm_util.h"
 #include "processor.h"
 
-struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
-			unsigned long arg1, unsigned long arg2,
-			unsigned long arg3, unsigned long arg4,
-			unsigned long arg5)
-{
-	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
-	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
-	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
-	register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
-	register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
-	register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
-	register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
-	register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
-	struct sbiret ret;
-
-	asm volatile (
-		"ecall"
-		: "+r" (a0), "+r" (a1)
-		: "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
-		: "memory");
-	ret.error = a0;
-	ret.value = a1;
-
-	return ret;
-}
-
 void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
