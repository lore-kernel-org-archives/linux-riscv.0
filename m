Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022C3C43327
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 02:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdJvFmQMYrq4jQX9j4G/To8GCHiPhO2oMgobpx9FRdM=; b=Fxk5Wyqp2WcGwp
	r/eMN8plna0o/EbyyLM26kra5zCRsnspeHko8OjoyQiMpDwFNXL80HnLAcsSngZYMx0xXbA4385hv
	uitfPo73TkK63ztUHo7cgXI5zofsBv7BbQHsFSNma3/q86Fq0rfW1L7uUPKwQqz2Ntgofe9wW9Tzr
	OL4VcvDBuk1HAsDEEgFQzilLBifDumu62Uk7qy0DXLgKylrBMlA3FSZH6wtRXrObidLi1HHRYcD6T
	XlrqopDuwysk2+UUjMmjv/2SLJ3PwtqcHCYxcSQr5aKqMFWKfGOrleqG1RKQHaFUNGoK8ZIue+HUb
	zSUkjvwEGgfytB7Pm2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNR-00000000Uyi-1wHO;
	Wed, 01 Jul 2026 02:08:37 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNL-00000000Urn-06qm
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 02:08:32 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-37d82f3a244so56362a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 19:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871710; x=1783476510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGZz7zKK7YB2BzQhv1X8PZ94iNsskXKsVTHTOVc0QYQ=;
        b=DAJon+4uISSHho3QUxw69NLLLlhceMBJip6waiM/qValopOIGIpjzQ7htI4GFT01UB
         ajaBhfhjORFdIVSr/eP2Ue6tLwLmj/vw5SRAZjYjg07fJYCw/Ue0IcT42rNsRXfK38B9
         ITPW8Ar4l3TJoT+GRZRWEaGfsP+f7WA3ELP2bADbzxJ0jwexX9sQdVMg2MvuQm0h5VjR
         K9mRD8jno4UtTTakB3bydBRjWQhOC9w/gtd3FiSHCNLTpTIrqGxiLfd7+62ey7acLdm5
         LijVSUnOYHe2qkj19Xv3afz5HAbZ1bkLBcVSvkKSRcK00UymAnbGo/8yyRqEjCrHG+Cy
         qk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871710; x=1783476510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GGZz7zKK7YB2BzQhv1X8PZ94iNsskXKsVTHTOVc0QYQ=;
        b=Uo8K7my/tiYljOPqbtOcHU93ynj/lL9M037x+gmlYJsXZkiSl8OEkBkR3DK1PDUIH7
         lvMjq/+8CVbfkpONYSZwwmr4a4+2HuYkpMkOn56azbEBgsjNPr60PhbpNW5avcLvyXTN
         Qp1Ljgcq7fRsOPxRoZAQzAG1257ToRwHBzb/s2bTIMgNuukcZXw7vpzC0wmBhQlwo3F7
         YZBRpf43pgaAewps9tXgq2y77hxg7m8WcQW4qVu//a+iTbkdq/YIfZwmc4aj6yC0ZRmv
         jNONeFLbuya/gevEXbesOiRtAPTfS0rzSc8dL/VTs2Kx8Xm8P6hwI9W0HwgUiQqe35GY
         mkWA==
X-Gm-Message-State: AOJu0YyKFlsmGbt6UUhsJEgWbWlUCmIN+AOhVsGl6UJP+Xa+ro8Ihnok
	A0KT6CbbhzJ/Mq9Uuo+KLjHkFmvqNq87i8EY10//w3/H2XkMdcFQcgJ+
X-Gm-Gg: AfdE7clYbe4fniMfdbPSIQrjaNSvcIG34NJ7v9hOjTNGUiwn68pUSmRoEQ7xJDvXCRY
	Awe5ptI1FccadiFHDe0A8mA2bmEV4WqKBXMv1zhPtd9dffDuzZLC4R31/yn80+CJK6CsiMdLqhb
	WEIpUJzZ3tllTf3DSiWiVg4iOuxpeneUsObepoJvSLm5rAzGTCGg9OZasZc1HHhrLCYOTBexeGf
	qMIe/+pyjXPHK5Fcdv0Fs63BTryDP9TsOzb5oceIi4e3lrqxi7IpnfdX+K21RH59gWbIWQaRUg8
	8ZdS3njYfLuBno9Ei8R5CumqtD7o1qg3TySBUregAKhoUT74qVxSdh/IlJ6a2i44UHmhxLtffdq
	MuVlrUOJX9KkOa+fz9e1HZppnLEh+u15y2PbUAzGGjVkmzKIlWE2FLxbtvJI+2mv54qzuzllm4x
	EQNwLTGdPVj85eIylaB/p6aA==
X-Received: by 2002:a17:90b:2249:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38083fc45e0mr2967850a91.21.1782871710420;
        Tue, 30 Jun 2026 19:08:30 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380964613a3sm803133a91.16.2026.06.30.19.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:30 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 6/8] RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is enabled.
Date: Wed,  1 Jul 2026 10:07:43 +0800
Message-ID: <20260701020746.170157-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701020746.170157-1-inochiama@gmail.com>
References: <20260701020746.170157-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_190831_131177_33F879AB 
X-CRM114-Status: UNSURE (   9.36  )
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
 arch/riscv/kvm/vcpu_exit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 12eebeabdf14..61305da5256d 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -154,6 +154,12 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	/* Clear Guest SSTATUS.SIE bit */
 	vsstatus &= ~SR_SIE;
 
+	/* Change Guest SSTATUS.SPELP bit */
+	if (vcpu->arch.cfg.henvcfg & ENVCFG_LPE) {
+		vsstatus &= ~SR_SPELP;
+		vsstatus |= vcpu->arch.guest_context.sstatus & SR_SPELP;
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
