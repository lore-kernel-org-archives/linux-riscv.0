Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92858C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JV+bC1DmaxpkzWYmS0qmztBEVGMtJzsiQSqR4cUsuo=; b=Fa6cYsvouWjPPl
	HM7IoFzHSeRglk/xu3XeeoQTPAzNIM+XMa3u+Lm0rtlJPSoaQQCSvhlzspChYpEkss18KU6yOStT+
	2QNtF9odvRJeleAPjPSy8SZDsFAkLGrFMamNXK/hydMcIeE0NAvKvCDC5Hif+q8fxryCYTC0tmx85
	J6ELNeDau1byr3OT1VTZ+TbIxxv17pHrxH83tm59PdXMerHK/i4h1eE8SIt27wR5xpo1RrWjxXQ+x
	TsXngFxBGvigW3YeCZz6R9Trjj9I3qujNVKbRdIK+ZmjSLlofZe7uMG1YDCsYsppwESQFeWb2YytB
	e33sh4M31HfWkR3Io8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYy0-0000000BNek-19xV;
	Mon, 06 Jul 2026 02:21:52 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxv-0000000BNYC-3Clf
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:21:50 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-37defb2f231so1560440a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304507; x=1783909307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nI0CkxxyoH8k0I7InDiV0iYilFi9jdMMJ7m2xkEZwHw=;
        b=XWPo7XrM4fDrtlIabHNfLfFymRP5unU7czORVYvcYrBpMNQ35QHIEmbefAJfS7OxJk
         7VBxb08xjt+OXZX1omAqq8Tz4Xf94JJ+lMM/gVTn6+2waS23ed39JP2g6B/buc63uk6/
         uN+Q8ih4wdYDKQSFtGcV56scr5Sqq+67YyBcAWF/BvfMbnc0nHvkuDJ680sqJtDmVA9h
         xEEF/56sVoLiWDGKUAP6IXidly6tEFzNQ3X0Ucf9BCJZQeAYToeOwC5nGDlFpI9ZMAA2
         2renkAwK4Ruv10MzYYpHVguY58plJTLG3N1PHJfiqg0+G0lhJT1VHRGe9iEXtDdygjI4
         9kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304507; x=1783909307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nI0CkxxyoH8k0I7InDiV0iYilFi9jdMMJ7m2xkEZwHw=;
        b=onyZk3Bqfd8AvPsjU3wHNjDoqkufnBx9/+p7cw1Z5GKi8T4jcgnv9XPARq0grmArL1
         S5OEyTlbIh7ESBz7llMfU5dhmLtrvrQHPy76LUAQ8hlH7auFh/yC9DRmdNuIYXqvFLvg
         jkzsLYw63JUNIDT8xQXYHPEL/iNyK3pzqpXOrJP+/wd5irDQCdY1r+2Hc/yWgxcQxUJF
         Vfa2wRq5O7tXE9UOAkccw6JsIVaI2hwOVcYyaeIsRu0cXxcJcdAL243Y4uean5SZwfsh
         baHaH8Fik0N+LOs0OaexS/78dYkOfGMpAKgOcVO8t+ieBrytJp3Bawd4hxLCcqrzjbyW
         Wptg==
X-Gm-Message-State: AOJu0YyijWpQ3dqdSggmRqttnL3Jj+bHGGd0DA3xJGD3mwSX83xhCZk7
	RCmrn6kPoucpODUZsPn7JqCuVAeJPckvHoWVg+orIlmEMOYE4BsdcpBY
X-Gm-Gg: AfdE7cmbk9oCxkhAJNUfjrN6/xqsZ55PSk8IejgCSQKRdPfseTJY8+LzSXMnSlMg04m
	Df6Bb/rXKZrI/jggTVrjV/EJl1Z1/Z7Hm53n1TWziTMkV9cvxuNhUJrwxnw9ZT5cQSuUUjy1skc
	JMYFanQdG0dIo8KGCGDWfVdoBDJVGRuXLiXBpAtBuc7WyFWX2+cPYtGwLWzU1ruNNkS21ymFbhN
	Y5MjxuW2mGoVITnHHAhJxkAp/0pYdGZLPM97IYCGHZI8trUxxWkD2ZWQSLsQ4qxB4KNVuAC5C3B
	p0Rp+qtd9miVMeCUajhwF+jiC+IQBkg4Jz0gmi85JEdDd4j6sWCGy5OIqg3Zr2M3+TsJfDFOgQ5
	oyzmEOObLDadqdW8A62Rk8tQhUtAkjFSJYFot2LTWArRoptKXJaNZkmWrKEAVvvz4
X-Received: by 2002:a17:90b:288c:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-3829f00021fmr7476641a91.23.1783304506913;
        Sun, 05 Jul 2026 19:21:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3854f03f92dsm1348394a91.6.2026.07.05.19.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 6/8] RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is enabled.
Date: Mon,  6 Jul 2026 10:20:42 +0800
Message-ID: <20260706022046.214956-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706022046.214956-1-inochiama@gmail.com>
References: <20260706022046.214956-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_192147_819676_07892E51 
X-CRM114-Status: UNSURE (   8.59  )
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

Delegate the newly added SPELP bit from Zicfilp extension to VS/VU mode
if it enables landing pad support.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_exit.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 12eebeabdf14..92a3ea7c7ffb 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -154,6 +154,13 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	/* Clear Guest SSTATUS.SIE bit */
 	vsstatus &= ~SR_SIE;
 
+	/* Change Guest SSTATUS.SPELP bit */
+	if (vcpu->arch.cfg.henvcfg & ENVCFG_LPE) {
+		vsstatus &= ~SR_SPELP;
+		vsstatus |= vcpu->arch.guest_context.sstatus & SR_SPELP;
+		vcpu->arch.guest_context.sstatus &= ~SR_SPELP;
+	}
+
 	/* Update Guest SSTATUS */
 	ncsr_write(CSR_VSSTATUS, vsstatus);
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
