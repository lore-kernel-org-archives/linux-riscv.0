Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D0BCA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 23:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GoWw+JVxSj90Y67h5VjJtLumz58FujRSsW2QtYDwHi8=; b=bEHyeKdldKn5E/
	GkRO/OE0w93dpClNwR06WMPHAGXJsF+uFKjptFkOzT0JCkEFnM4Jhaqozl6kw7YNsvNvoqniStMwX
	IIgwo/G3zjxzINz+hQEeZt5pq2fT+VfPIEs2GpVGnDJv+hNMem/z3ekidQrYBGopOU23kzkyfrbz0
	1VeOanEUNE8k6VmCSF53R1S3W8udvJwfTiGjwbz+BhGlcIN+vTsXwUxMyRpmZSc/CFyOOkObt9a15
	deP69+4wHdaWG+f7WI6ZIWH6qKj6lRziXYqLFT0suYHKBp5ZVGaVovtVotPpQA8nhIFGTM5Q/KC5N
	gworr4oqi9hwyv8wHkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEkd-00000001VBk-3Abe;
	Tue, 06 Oct 2026 23:39:15 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEkb-00000001VB3-15cY
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 23:39:14 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso2945958f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 16:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791329951; x=1791934751; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p6vQUbClVDpSCeEbk4enL4LsUUIDighbOrvskTUgMlI=;
        b=WQs2Fg+c+Os7Xc+3upPep4M/Q41/GYihan4ym7XzNuifVvbKzdfw0L9trMSxV4LKdz
         k0PW4j69QrygdHJhuK33W5sjIK7IFEOJbHWdTjOy456epj1VZ6+6/LZ0rX+kafGDbd9l
         /quKD/mb8YLn8+qplmfbAhRivFvnS9MhmCuxlHP1Y0utazRXQ2LbJDnlgeRAfpam/3Z7
         bIIIDAX7SrkWQSo8mdG+64zx3BtrYCxpeTnBVeWiULmtuYay/N8K4V9ePF7YgtRQV33H
         QZYzsQFsELs9miKAB9x1s3hOZ/RxnAVpUMNrwYmtjO/enTj5m/I2Mw04hwcIyw8XqjZg
         GcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791329951; x=1791934751;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p6vQUbClVDpSCeEbk4enL4LsUUIDighbOrvskTUgMlI=;
        b=scH/uBuh+INLZsDnpTBfmeifCdXdjCOX4pDp3JHxKqDjIC9d+wJRuQFADEXbgOIsvI
         vf3CHRfWM90oOH65akzsPf1w0UhDF0wyQ/YuNat5qjxzyCpzW0mdlpv0N7WtXt+2BDz7
         /clgvJErbBSxt356+oDBMXjJcEwhREH3oVkoAfpypm5JSkpvggWq39YIcwkD8RBCUX3Y
         z6qvpDor/dMxx2tCX+JeBpbJwbNLoE/DWpfYwtWhXrD5eRnDIosKlpn4BpR/tzonItch
         5aFgufgqK3kdD2zbcNXO5tq7fjka97dCTEr9/xT+FcHiLOucndv+0Gqt3cssLM0Nvste
         02og==
X-Forwarded-Encrypted: i=1; AKwUvBxUCpftZO86LsDCc1sMUmrdMe0Tu6BpGolgbAKQ7h2iGxycun7VlUlJ5re0fQVIgL+8Sxq4VbN0ULLkZQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLY3NchOKaLAMteCqP2UoeGIpncxw2rUtLcNFTDnKzVIZZfZRWR
	SKYFB+xxqU2FxEzG3BA0uZz4SXAjGrWWx1cTA2mp1iI5SybJuw6ZlinT
X-Gm-Gg: AYBFou07IkfjTcO8m0GcglFSdlyRdcxwUHaAywr1b2NjSOC2+FSAAzsEKlaLoy2vqrN
	UOR7g7eUemiTu4FdK1DtfYFvITTrrHf2nt2UzHtoBe5D0H9pbt0etwX2hp2XwSXh9FuVZ02gnPm
	YwoUw0Oc8jXe1lzGO5bvY5Fw7e7P7A8zl8QKbWf32L/fKcB+2/Aicb5ROyI+MtqZo83ancQhotm
	nOUGC7gFqOhw0MRdwRG3t3r7E/XnaQ33SVXuzheomtWJsqSi77B2SpB0VSuMNVd/F0HRtyGMQJY
	JMkY3FTCgO4cLXXz4RR/zwAg2Jdfp1+10OQPLRFOWIJBr7rHRy+FzDiK4FU+HjM+mhhZ3s1RcQU
	WWG/taAWNR9+/rZXAz0xW0ZsOvPWyzYV03g5tQnx7+3HT0/1yMqrWOuWPgFp68luVWdT55owbcd
	kr3pcqFEvL4WQPk5KzunhgoSGQQYjFoDbNPqyj5PH026k1Qwzv6fsfSa8BSFsUdanK11kQDHt2L
	/MfBTRXrABfHa2ePpEvZkDFSnXamR9KyP+TygTnVxd6IoX2wajPk1KD
X-Received: by 2002:a05:6000:2585:b0:48a:f8fb:cd49 with SMTP id ffacd0b85a97d-48c72889ca6mr1289357f8f.22.1791329950735;
        Tue, 06 Oct 2026 16:39:10 -0700 (PDT)
Received: from [192.168.221.223] ([81.0.216.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d10216sm1881368f8f.20.2026.10.06.16.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 16:39:10 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 06 Oct 2026 16:39:03 -0700
Subject: [PATCH] riscv: KVM: Fix compilation when CONFIG_RISCV_ISA_V=n
MIME-Version: 1.0
Message-Id: <20261006-vector_off_fix-v1-1-9e48e654d445@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QpAMBRAf0X32WqjFn5FEtsd14NpYyn5dxeP5
 9Q5F0QMhBGa7IKAiSL5lUHlGZh5WCcUZJmhkIVWUmqR0Ow+9N653tEp6rKyWo3K1VIDR1tA1t+
 w7X6Ox7hw9F7gvh+hxdj4cgAAAA==
X-Change-ID: 20261006-vector_off_fix-938d61b1f906
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Andy Chiu <tchiu@tenstorrent.com>, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791329949; l=1885;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=BWQi6+OUEp/tu9l1mkI7xW4X2+ly+BWbFk1Zcp5roxc=;
 b=fIJD49rfeAewk1vKo3AGACkBEa31o13TCmZF61L5MsBbstc43N/TbELEyoRMR0rhStTq2fWGD
 hT5PT2sRkL+B6oSNnlTW2Mo4/PGgShIdVRbZ3Yn5vuC3tmu1dzV+Rzw
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_163913_329294_30E6B10C 
X-CRM114-Status: GOOD (  11.14  )
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

Fix the KVM code to use stubbed out versions of vector functions when
vector is not enabled instead of failing to compile. An alternative
approach would be to ifdef out the vector code but since a handful of
the vector code already just uses stubbed functions to tell the compiler
to drop the implementation, follow the same pattern.

Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector")
Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
I was reviewing [1] and noticed that when I disabled FPU and tried to
compile that vector got disabled and the kernel failed to compile.

[1] https://lore.kernel.org/all/20261006075303.205216-1-radim.krcmar@oss.qualcomm.com/
---
 arch/riscv/include/asm/kvm_vcpu_vector.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 6371d5ea5392..1c9efc6048bb 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -11,9 +11,9 @@
 #define __KVM_VCPU_RISCV_VECTOR_H
 
 #include <linux/types.h>
+#include <asm/vector.h>
 
 #ifdef CONFIG_RISCV_ISA_V
-#include <asm/vector.h>
 #include <asm/kvm_host.h>
 
 static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
@@ -55,6 +55,14 @@ static inline void kvm_riscv_v_exit(void)
 
 struct kvm_cpu_context;
 
+static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
+{
+}
+
+static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
+{
+}
+
 static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 {
 }

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261006-vector_off_fix-938d61b1f906

Best regards,
--  
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
