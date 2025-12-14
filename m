Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BF8D59D99
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 16:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jW2aGfc9bOHdhHeoNJo25pBRIJhHw+Q5YhnyKyYnwY=; b=Z4hiHeT+bt9KY2
	m4HHxi3osyobFhfqstOjE46WVgm1nBSJnDeVgtrhYf5w+y2RvK85QveC2LgF3OQeO475KIStSJEde
	KDmLULLQMXaZKFF8pkt2WrCMC/T0bgK93N2AOSjaZk8VpqOPbSbB2tMc0TIzBhL4lynsIJD5FzUTD
	BGOt7Tk9PrbX4g3zsut/z9kxkELJesaHI0TiQYc2QmV/7B0AAdaflU59vLzqNnqbDde44JJFW1aQS
	KPYex+qe/XdsC1l4hbalZ4KYpYA1GqL+zCGvpToN+HESpCEdtzrAVB25Lupx4VU4cMBQQhV0H2Ab+
	YSQhoIicTL2ODolzmZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4f-00000002aFC-2I6p;
	Sun, 14 Dec 2025 16:35:59 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4X-00000002aDL-2bPP
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 16:35:56 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-594330147efso3449925e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 08:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765730147; x=1766334947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYG0UzrVNvu+sJ+OoGaiC09VrdPSEEepGbXjW8i1wGU=;
        b=Dx7rr0ZeCDhH03rnyHJdCgnnzdteMlDTmTaSS7wTRwO+nBgK5frd+Bhrt0wuohYmH+
         9ILhkBU73WhR2f+MMLGqIHmc9A8eAK+Oi+wEq4G5lVvSGPliYcbR/oDM3QDbCeImKc/r
         57Dus4mkh2cqyaGyz/Yw/S7K5/Mw+XvYUvpjqPdLpRZJ66ywwM34tqXLeRRoUZYCH11z
         lJeIrhT6l0sXxmA+duBsPrEsT/8UMu0NZmnN29RPcj62v9tO6zudoaneYIgE75iT8qVf
         XBdNv7U0wPTuYwELxjiXgP+eHMu3M/9hKvWqwFsoULvZJ5QmoPArD8TTWEhaTa3cs5zQ
         93EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765730147; x=1766334947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iYG0UzrVNvu+sJ+OoGaiC09VrdPSEEepGbXjW8i1wGU=;
        b=NE0K2wAVcb9zQ0PCje9iy+cslZz2tWBbpQGKRnGNDAz6f498fQydXrRgKFaj1xFV60
         tuc4j7uan5fDI1Gc6541I8/oUzs1D6RNz2V4i8pBBX+Id9cxbDlTLMiobOa5puo0gkhZ
         QvtYwUnRAbanPus0Wsi24CYgw9Hqs0ryjNWUMYPklBbH3SqGk/CRDgRLJsqqE2qlRPyO
         dQgyveebs09mbibRdFkPC9kV3JBi05s+dDbMST8tDH7xRKpVdTNjlBvo+/+I7AXwlmIX
         ZdACaBJM4f94IN9kv2VW9N8EVedfF8XNYVtiWx4tc+B79/Ia35l5iicyzwTHc809DQW+
         RdyA==
X-Gm-Message-State: AOJu0Yw+Uy5YO29pvHBYPyZ94nYTmwPTCbPSRmrF5+a3xXAPo+xAP3x1
	jUH0h0Kllyq3onNDVX149/EUkMeiu7dkX6vduXdqv2umfFEvoA8bagp9PMN9reDb
X-Gm-Gg: AY/fxX7zfhXvIJk+NdWoJG82Kk2AwVvkVxCINNr10Xqu5IG2PoozUqXDadJr+gdRz4s
	hJYciF5bSy+hpjzJK24RPCGicI4Fjg9FNJU9XUxdWVZkejOCKrDWVGCTwZegIl8oPUhNTKJ16h2
	QPSMbTlpQfEplIFtWHiIIo2hmfqZZSeozL1PYunc0xSREqU7UsbYcAKFJE/VUiH863uW8e77iBe
	seNr3g46O2AbaVk3N1nOCvCMUBw/ronyKWqiXXirk3sjdbHgfiT00qtjqW3NlPcOu3pRz+nwiJY
	gJS+ynLmf3q87jepRnJUv5ExDibwabBobh8E8SkIUj/ygKh5wEw85FOKoqdwtWjHXQRZEBMFXh9
	xtM7JNYroolmIONQucciZrQWM3fws696XtmqIQcwi7X04wzg1thLrc8URvYbx1mjtB4KE4V4L5i
	D9Qw==
X-Google-Smtp-Source: AGHT+IFa8YrKVxWZ8N5CZhPJ/l8DS6QHhWtXFyJ2Kk/ViapXJFN4nzGXTae+4TaN+8nHnP2k0U2DqA==
X-Received: by 2002:a05:6512:3d23:b0:577:318a:a1c6 with SMTP id 2adb3069b0e04-598faa448aemr2580474e87.23.1765730146784;
        Sun, 14 Dec 2025 08:35:46 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-598f7717b79sm3789618e87.60.2025.12.14.08.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 08:35:46 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Joel Granados <joel.granados@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Ilya Mamay <mmamayka01@gmail.com>
Subject: [PATCH v5 1/9] riscv: ptrace: return ENODATA for inactive vector extension
Date: Sun, 14 Dec 2025 19:35:05 +0300
Message-ID: <20251214163537.1054292-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214163537.1054292-1-geomatsi@gmail.com>
References: <20251214163537.1054292-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_083554_183963_D85D7353 
X-CRM114-Status: GOOD (  13.82  )
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

From: Ilya Mamay <mmamayka01@gmail.com>

Currently, ptrace returns EINVAL when the vector extension is supported
but not yet activated for the traced process. This error code is not
always appropriate since the ptrace arguments may be valid.

Debug tools like gdbserver expect ENODATA when the requested register
set is not active, e.g. see [1]. This expectation seems to be more
appropriate, so modify the vector ptrace implementation to return:
- EINVAL when V extension is not supported
- ENODATA when V extension is supported but not active

[1] https://github.com/bminor/binutils-gdb/blob/637f25e88675fa47e47f9cc5e2cf37384836b8a2/gdbserver/linux-low.cc#L5020

Signed-off-by: Ilya Mamay <mmamayka01@gmail.com>
Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/riscv/kernel/ptrace.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index e6272d74572f..9d203fb84f5e 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -95,9 +95,12 @@ static int riscv_vr_get(struct task_struct *target,
 	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
 	struct __riscv_v_regset_state ptrace_vstate;
 
-	if (!riscv_v_vstate_query(task_pt_regs(target)))
+	if (!(has_vector() || has_xtheadvector()))
 		return -EINVAL;
 
+	if (!riscv_v_vstate_query(task_pt_regs(target)))
+		return -ENODATA;
+
 	/*
 	 * Ensure the vector registers have been saved to the memory before
 	 * copying them to membuf.
@@ -130,9 +133,12 @@ static int riscv_vr_set(struct task_struct *target,
 	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
 	struct __riscv_v_regset_state ptrace_vstate;
 
-	if (!riscv_v_vstate_query(task_pt_regs(target)))
+	if (!(has_vector() || has_xtheadvector()))
 		return -EINVAL;
 
+	if (!riscv_v_vstate_query(task_pt_regs(target)))
+		return -ENODATA;
+
 	/* Copy rest of the vstate except datap */
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ptrace_vstate, 0,
 				 sizeof(struct __riscv_v_regset_state));
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
