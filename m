Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF164C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1f2rF0mTZRNYj4dPd+j1Jwv/EedFpEO+DxeZkjEWT6k=; b=02xpUqRPvasOko
	xN/Emuegp+IShox6NHU7q/xsH4kwQg1cvWP3DskXop7rhlaHVl/lMgxJhejrbGez6tqbJ0uytae3+
	6fu77LQBV7ym0rA+cPhO2vCPA+by87XHkEyGbUp96748pPuznL8yHCajBCdQT0GhGPs8/99iWU9OO
	70C8dGWjfkZrxQY1PecoQMboGBgOoe+C11Ux+vKvWpwTchhGUiay3eTi21H5jPAjCBLAd+WhV2Mte
	DFDjx3E75U7kRXFm05PEoE+Kgbn3Iirjb9wcUDume61YipwSTJ+EkDOxjT0BariwHgdT0ygRvTtqA
	nFAkqHC5VXnAwP4nK4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDila-00HRqN-34;
	Thu, 14 Dec 2023 10:16:30 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDilI-00HRQg-0I
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 10:16:16 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33646500f1aso508395f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 02:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702548968; x=1703153768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHgnsxYfxbVMyX3m0HtccyvAeuvvFGofY8I7vS+QRNk=;
        b=cm7YxAuryY5/cXofiiLmvlo+a+G9LiE4NbXdfFYkLzYzHLEnR4FJMvWhmUifc2YjSm
         6/0XKRUyMIlcKzuuL6MqHKu7i8mYz9upnVmzZZ6QIPc44k15TKrlhgh+1wcs6EEK9+bT
         UN4o79pW8t1aQyu6s04/7tuYDf7ulnj+HvBmahclLKTLuC9EWDmf9kcCAJhKyU01Z7TH
         x8vxzN/juyGsU756loLiOKOcrGSOnR462jaos4JBOyTXGabw2/9b9S/6FcS6GKVxWx/r
         wVnehDV4llUoVmR3hKkb6D74Cgk9yQLl2f8kK4EsKQZyKCZZR8bHJujQyqEo789CngTm
         9gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548968; x=1703153768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHgnsxYfxbVMyX3m0HtccyvAeuvvFGofY8I7vS+QRNk=;
        b=MeFqIftOOCtqH9b7EVOJhwR0rqYB/oHZhLyBoLS3EY8vFDur3PNUetzLirJfqrRxUO
         NRN5DHur3k7UNRAXLIzJLcfWQ5Lq0Fx0syxkGm0QUPwQQ0NaAstjW8scHMkmfIl+aRab
         Vrvh2/DCuZQuAWy+yxqiqWt45vTViNTPuyn6TW26RDbwltlOj0bxQTLpwydDjcQ26U+K
         pPLzzjTgvtBE0oEozX5aFRED9InEqc492U+ulW1ec8SewZhjTw+XlHtg3WZCReHTwWBe
         CjbGO61zSvKJ6ixoxjpmKfBHO+UGRC6VC00khVOKB3j+7UAnvLyo/pY7IaNGDqWN2YCE
         M2Mg==
X-Gm-Message-State: AOJu0YyZhsDgJWN4kStqhZI/R5JKunGXl9U6PXhlqQvwA+CK0MiJpMGy
	QK2GtHYFiks+EzI8mCqcR97V9g==
X-Google-Smtp-Source: AGHT+IFK7EzLkSeVAeCsSbYgg462lJQa7nX7hRuOXjYRawScJxweAERIujFIU30qoQ/mOIpaXLOMxw==
X-Received: by 2002:a5d:464e:0:b0:336:3572:a1a8 with SMTP id j14-20020a5d464e000000b003363572a1a8mr1519890wrs.114.1702548968253;
        Thu, 14 Dec 2023 02:16:08 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k12-20020adfb34c000000b003333b67f58csm195794wrd.48.2023.12.14.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:16:07 -0800 (PST)
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
	guoren@kernel.org,
	conor.dooley@microchip.com
Subject: [PATCH v2 10/13] RISC-V: KVM: selftests: Move sbi_ecall to processor.c
Date: Thu, 14 Dec 2023 11:16:02 +0100
Message-ID: <20231214101552.100721-25-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214101552.100721-15-ajones@ventanamicro.com>
References: <20231214101552.100721-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_021612_171035_B503D4E6 
X-CRM114-Status: UNSURE (   9.31  )
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
