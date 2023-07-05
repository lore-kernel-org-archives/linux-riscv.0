Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF55C001DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H6t8LaoSIs6GStt4XQqFyFRrMvddGolNNNJQUN5s6gY=; b=y0l1cBQXboOrGk
	sUJO7Lj4DIiX7Sq3UYbzIb7KD2F9crR4T+oMR3ewQ9giEaNbPnLGMR4ugS11/nLrsqMq6Dmp7qiPn
	KV24v0/L5EF/1mfEDBofC6SPoNKXnRHxUcWwOLEazxgKYkAIyoDucT/U0z/XfL9HEtglzNKolF+aL
	ynWpUBJqYwDsdPG+uTr0JIJytcBaG8k8lNO6vC7JSm8R8CudT61Pw0qo/rj0F3gZ6qtkmkGWFUcEz
	pQ3iSLan6IjsX73NtGYfWuh9QNsNbUlfMbgYC4edQDJtru+acacfRL3Y2qjEOFwjzt3ODg03voNdt
	TMRv1o7LPkoat/uf+ThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGyby-00FKFW-2D;
	Wed, 05 Jul 2023 09:15:46 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGybu-00FKBq-1a
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 09:15:44 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1b06777596cso6062182fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 02:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688548540; x=1691140540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WbwVyC6fOUxdMPZng6GXOKeTpMZw4Uea4VKPOQCS1kA=;
        b=hoBRqNpxZLjhjng/wvEo1GY+oC9pDRblaGFYgrepCrMMWzyZEGZN8/tY+kS6kAVONe
         1DUEQ8wF0HXMnWSPBqD7AiBrkw3J9p3CF8d1/6XD3m0rDYSR3xc6kiewP4do5ugZe8Ij
         fBUpzBDkLHPjRzgfNtyiLxy/wKq+/zQyKRCLbI/DFJBYMXdbjgz1/Fmh3KdOiVnStgsa
         TmE7L7+JL1M10IboIONEXvwqneMdrlou00fIvieX9YZ/81oF//GQW5OiNavYdyTmVc5J
         v6GVFKzmiNKnCQZm0pUecLZv1tvrEJSrmU1o84k036yZ2Eckv9TEKgF3EpfgM6R48qFu
         zUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688548540; x=1691140540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbwVyC6fOUxdMPZng6GXOKeTpMZw4Uea4VKPOQCS1kA=;
        b=HJHIC5p/BWO55cgHavEVhjktrmkoaJtHxwKdEuoTpS6pJ31axhDU86/tGzHKR3kQS6
         c4vbEBMdm5AmlcdXD6Ui176G93yaPTqJEtgfFxHH1C4+KpZTTQiTD0w+7sfFBR1gYW4l
         JI6Hp1yJEYZZcOa+qnAd3SwyvNeyvFdpHxmLnQkRPez0tnCjF3OlU3TUbLjhwSOT2KLD
         uP7fZj/aFY7b6mlLbIGrIEeM0EI6vVmn7GljyHNgMpDC1Rb6xhXQC5yVoUwZkhwmdK6h
         JVtNkZ+OB021tSy0hO9S5uknF8lc3OQ2bcDIqenoTwwFnryWUcHE3czDFYu4a2YMJwbA
         tgmw==
X-Gm-Message-State: ABy/qLZdjlPoMhqd45S4NYIeVGjuc99EqXPedO3Wyo1hvIKAWsEVXa5P
	WIDq7jXaW18FOTVAtv7ABPOn+bP5jpwZb5pysUI=
X-Google-Smtp-Source: ACHHUZ6P6BGgfJQ/l26Ogon7fmyXPy5Gtkf+9NSeBNJqUqQElHKeOCgNEcWp4DJV889yGyelvkfq3w==
X-Received: by 2002:a05:6870:c192:b0:1b0:37cf:5af9 with SMTP id h18-20020a056870c19200b001b037cf5af9mr19169800oad.2.1688548540392;
        Wed, 05 Jul 2023 02:15:40 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
        by smtp.gmail.com with ESMTPSA id s3-20020a4aa383000000b0055e489a7fdasm2637414ool.0.2023.07.05.02.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 02:15:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH] RISC-V: KVM: provide UAPI for host SATP mode
Date: Wed,  5 Jul 2023 06:15:35 -0300
Message-ID: <20230705091535.237765-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_021542_526484_2F36E598 
X-CRM114-Status: GOOD (  12.52  )
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

KVM userspaces need to be aware of the host SATP to allow them to
advertise it back to the guest OS.

Since this information is used to build the guest FDT we can't wait for
the SATP reg to be readable. We just need to read the SATP mode, thus
we can use the existing 'satp_mode' global that represents the SATP reg
with MODE set and both ASID and PPN cleared. E.g. for a 32 bit host
running with sv32 satp_mode is 0x80000000, for a 64 bit host running
sv57 satp_mode is 0xa000000000000000, and so on.

Add a new userspace virtual config register 'satp_mode' to allow
userspace to read the current SATP mode the host is using with
GET_ONE_REG API before spinning the vcpu.

'satp_mode' can't be changed via KVM, so SET_ONE_REG is allowed as long
as userspace writes the existing 'satp_mode'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h      | 2 ++
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 7 +++++++
 3 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index b6acb7ed115f..be6e5c305e5b 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -46,6 +46,7 @@
 #ifndef CONFIG_64BIT
 #define SATP_PPN	_AC(0x003FFFFF, UL)
 #define SATP_MODE_32	_AC(0x80000000, UL)
+#define SATP_MODE_SHIFT	31
 #define SATP_ASID_BITS	9
 #define SATP_ASID_SHIFT	22
 #define SATP_ASID_MASK	_AC(0x1FF, UL)
@@ -54,6 +55,7 @@
 #define SATP_MODE_39	_AC(0x8000000000000000, UL)
 #define SATP_MODE_48	_AC(0x9000000000000000, UL)
 #define SATP_MODE_57	_AC(0xa000000000000000, UL)
+#define SATP_MODE_SHIFT	60
 #define SATP_ASID_BITS	16
 #define SATP_ASID_SHIFT	44
 #define SATP_ASID_MASK	_AC(0xFFFF, UL)
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index f92790c9481a..0493c078e64e 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -54,6 +54,7 @@ struct kvm_riscv_config {
 	unsigned long marchid;
 	unsigned long mimpid;
 	unsigned long zicboz_block_size;
+	unsigned long satp_mode;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 8bd9f2a8a0b9..b31acf923802 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -313,6 +313,9 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CONFIG_REG(mimpid):
 		reg_val = vcpu->arch.mimpid;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(satp_mode):
+		reg_val = satp_mode >> SATP_MODE_SHIFT;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -395,6 +398,10 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		else
 			return -EBUSY;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(satp_mode):
+		if (reg_val != (satp_mode >> SATP_MODE_SHIFT))
+			return -EINVAL;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
