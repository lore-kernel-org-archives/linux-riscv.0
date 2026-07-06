Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AF4C43602
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sexbpXkVxgzqPmIGa+BvqHcmGwxflZc30HfmE8xtms=; b=hBDBVoITZxQ4zN
	rqn+1z2m0Lolv01HLL4gaYwLdKUTcQqKIaYPtbsKIwzSLwx+L/S/VksQtBi/Suadq9kPiahFqSMI+
	NalLBvU4C3W4Cx4CMhwO1xXlu9k2/u/fXuDnT7AYEK/280s6zasXclkENnbGE9N7tTEELTmX+EmFT
	KIR+jvddJYJF/0d9QAWRh7XXXPx2P4xtsYwQqQ7+gmxBebjM8lVbl2Rj/ZJwYnBnKzDnKJFusUZi5
	JywBi0pQSD7htfDcKYFZq3F2Dq1GcXLIkRPrOgXVFCnAfN5+ejyQoNfrq3Bbpjn9z/Mzv8kvkYvuF
	9QMRr/qEijFguM7JgtGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxr-0000000BNTp-1lku;
	Mon, 06 Jul 2026 02:21:45 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxo-0000000BNQB-0ee4
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:21:42 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cac59f8b64so28977215ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304499; x=1783909299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwFDdkksbt790fLoy4tClBNp4x5JbRI/xOADu+E9kr0=;
        b=MhVbzElvJxm6o9XFnXpXDPr2BcM75stBHLMYkIWoU1TJMIX+///JU7NPVf4ZZ4mS57
         p37Fzv0CNYUoP/B3WmUjUZhcbevAzs8DHWnX9RoxtRxrXR9MQGdXPjuBTohbzOCw36XA
         oNDigELbK+5GXvsXpmstdVvxeJ77AKp+GDP9KVAhHSvnGe+tuTMrcDWxNle/w0OFHntb
         JPyibGtqEmp+dSbw8lxxrmko7hMwb1MJ9gDYZVG6aPGAH0rQIcvVEZhQ1xRw/nItH55g
         VnCAFlGFsWxNVu13if8W0vDLWnQ7L0RPsbG8+Wreb+0J6LNv2ry5YZwxaAM3GuHuwuoA
         Woiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304499; x=1783909299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwFDdkksbt790fLoy4tClBNp4x5JbRI/xOADu+E9kr0=;
        b=QvwlIfps5DwPj+Fd8n1GhKEnwP/1xydvfc0MV8wplzD+MReI4HKm0JECFfvTcScLoR
         gmZfM8dvQeQCdI5TVMA2Rz96NNKHSDAerl1xfWDXctRFAnFPLHcZhq8xgIrhbsKzRRWN
         /n+apKYShJld3IPxAI/cQtuwoXjqOtwQk9Fc30KFxB9dEmguzGNRYzz+upKFsTO+IMM0
         pFEuix/4Z+WYvr28sOPHvzHbg9c3XlJmo3sghmC8xYlKfKrUQkbnxErSXfBNNAc7B0Ra
         NfrlGxFp1wEMMPiwvplLazcL2fNdUn8AVBmLaZ/c9f8HsRNwjdFujOnVQbEWIxqwhOIg
         NFKQ==
X-Gm-Message-State: AOJu0Yzx7kRba48qZYAYF3IdoguR83jbGnlQevZcHSdEtIeUq4rpiuTz
	P8cEs/dzE6Kr1B96ZRyqBvQKEdzzWu8kNSYY1jmBEXVrrIAfuhPijG02
X-Gm-Gg: AfdE7clqm3kkB5mQuuZZLwJVk4t1u1aF80tN3ju3XAa9Z/T0CXlAJ3YUSJgl+wgKChE
	aXNF27wbquU9KosGZqF+AkgbIW+Wyjs5bDsK4BG+ioviNco9ki0NEIhyWH0X23P+hfrhKaGRlqX
	xoAGgYNaIRAR4Ri2eEwMIezNCjETETj/rpHzChIt1+I5fj0yIQpj4nsn+ZwtuR2t9KrBboTySEd
	HFl+C5PnzifH9kMKudzRSxGkdjIZ3I+efjzn0hy0T920vTcv5x3pQZya83o1TQIFIgWpJ+dLHIW
	EHaEDb44MLlJlJVfQEKpkfwb7kcDONAyo7ZWQoQqWpFxc6c+qZ3BMCK18kczli2RkFoJ7FdTMF9
	h6btxkqpm/+vKlkkoUe54Z9c9je6bGY4isD2Fx5mkyoCuovpL7v8O5HcIIwQX8EuK
X-Received: by 2002:a17:903:b8f:b0:2c9:bd20:866f with SMTP id d9443c01a7336-2cbb9f0371fmr85608345ad.45.1783304499269;
        Sun, 05 Jul 2026 19:21:39 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7126971sm39828005ad.18.2026.07.05.19.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:38 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v5 3/8] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
Date: Mon,  6 Jul 2026 10:20:39 +0800
Message-ID: <20260706022046.214956-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706022046.214956-1-inochiama@gmail.com>
References: <20260706022046.214956-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_192140_929368_D1AF4D73 
X-CRM114-Status: UNSURE (   8.05  )
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

Extend the KVM ISA extension array to allow KVM userspace to
detect and enable Zicfiss/Zicfilp extensions for Guest/VM.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/isa.c              | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7bbea8812d92..a27de850fa4c 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -199,6 +199,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCLSD,
 	KVM_RISCV_ISA_EXT_ZILSD,
 	KVM_RISCV_ISA_EXT_ZALASR,
+	KVM_RISCV_ISA_EXT_ZICFILP,
+	KVM_RISCV_ISA_EXT_ZICFISS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 1132d909cc25..9852a91fdecc 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -65,6 +65,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICBOP),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 	KVM_ISA_EXT_ARR(ZICCRSE),
+	KVM_ISA_EXT_ARR(ZICFILP),
+	KVM_ISA_EXT_ARR(ZICFISS),
 	KVM_ISA_EXT_ARR(ZICNTR),
 	KVM_ISA_EXT_ARR(ZICOND),
 	KVM_ISA_EXT_ARR(ZICSR),
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
