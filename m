Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED0BE7718E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 21:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/AKWhu+MMV5Wt8qWidqEPX8X3hFWWiMGEg3OXQU18A=; b=Kha6rrodmsW36H
	N8l2NI+9wv5Gb3T6gjSS/EwASFquX8OscEtIMAhnhr2Wq3fekNixhScZFMyxv1nyeYtAY9gGzXBas
	RLn1u+5ehu7ajXobJNWfj1U11Dc9si/++fHgtGTauU9l2IE1Nn/+ApTtJfsOx7nZE9zgXs0RxFbkA
	MgaBIrm1ppOdqYRHDEiaiId16+S+MYjKmv/SfSxDWlG5Pn5YLac8b16/KjJC4n8g0lPvhsJX+aYzA
	VWXMZoFmPG76isvYuE/K4mkkxwnMQf1TAxNrzZsxoQcyaI86jA5BQ9vMvU7LndUe4CbyOBmO+yOnr
	fRaz5JWJeKEccl5HjQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC5P-0000000CnTv-1sCu;
	Tue, 24 Dec 2024 21:05:03 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC5M-0000000CnRB-0NNg
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 21:05:02 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-216401de828so55240035ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 13:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735074299; x=1735679099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7Pb5Vxtmu1FY9/J9EKk+mhOADazj56h0vKNA3c2QKo=;
        b=zLQqCeTA8kG12fOAPvFCvR1bGqL9AI8qTX9ic4wb7/Np/2oc30/PeLMcQfszohurNu
         uq1Xc1xt33vT3Q4Rx1GBJdg3SSXzdh0ecz47LH9L626nMI0rE8rBAFLtgYrNh90dL6Vd
         aSf+lCZBStZ1czE/x6qr36tSWdzIaZzacEspT99bkFXj/V7Jeo/t3Q3XcbsVKxuHFVww
         Iah/dHPrj+cEIGetq+XLvcn6jRh3djep7jOqWstxJ916/TiR8OQ9W2YedtvBBd8YzTeG
         I4Ihd5lmdaUljIc5IME0T1ZiA9TwbMkGgnLMqTdfrBUIV4vc8USfiGR7dzMc53WCk8jB
         +E0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735074299; x=1735679099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7Pb5Vxtmu1FY9/J9EKk+mhOADazj56h0vKNA3c2QKo=;
        b=gl5oyOZFOUubaCkLpI0v514AY3J82N5AoKQqbaRl3m6XhnOpOxichcCQ+p69O7Fswt
         XVvrrkzHdwksiUMSmF5Coilt9ykfx4DpqYCOZPmnuUEd7U8ScyBQ1LzNMtfLkc30+P20
         aj1dc5q1xb2ZJyFn6c0GMr94j0x+LoWThSPXVyRMbRdeA5mG63GxprB40VsKDRsZ9YmN
         RKKOhxNoNfvMyYm+o+JFjdjhnZdPdKEqurjjkZkUUpb9n3Vesx1sikKEcCDP+71Oz12I
         sjJLq5MUUZUpY92R/8/hUnqs0p9ALt4otHMs//XkIar9ph9eZ4ZRRQuygSwIV97WTsQh
         5pJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHbYO9KSxPZVYe6na8YbzHFFIX07P1H4So/6yE+enzTNKe8hftWrpJ45wbf9F2AiV7C/30U4zcySgECQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzuueTDwv1GGnnO/IhO/R4FSn2CDxxOKSycfQCsthJUQbbMGVI
	/LO+cMav4wzmqLeem633ssiK4tBEDMWHuXYMgrDU6NFDKpmuPipVhLhSqihBcro=
X-Gm-Gg: ASbGncvoLaM+mZUuT6cZjqKOBfYPcJhRdcfes5hr6VIYO1ZBGnjwJQATY6T44m2eeue
	O6lX9DOHh/l4bztzU1a2FVLHQFMGkJONAGr81oxYMiJOnQgiz4NGk4+KsozoD0ZDH0QppBvHnC+
	PU3Iw5CkdTcDiII1px8ASVFit0f9U1iDpBNOjMNfpaaVuIn1hca8Ko8cVdfcGCx2G/tIyS/Uyhe
	XG4T+1nQxagaUteURkMMtAOrp0uMfHJdJcinwVABWFRxLuC0D9hWAOM/PlcMxh8+AV5dA==
X-Google-Smtp-Source: AGHT+IEINBS2wMAKPXcEeiQvMr4mHt6N/s5a4KNXcdkRoepKl+xENIOeQWFga5Ts/3lf9tV+pKQhqg==
X-Received: by 2002:a05:6a00:3905:b0:725:e73c:c415 with SMTP id d2e1a72fcca58-72abde8fd6fmr24905523b3a.18.1735074299238;
        Tue, 24 Dec 2024 13:04:59 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c344sm10445925b3a.186.2024.12.24.13.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 13:04:58 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 24 Dec 2024 13:04:53 -0800
Subject: [PATCH v2 1/3] RISC-V: KVM: Redirect instruction access fault trap
 to guest
MIME-Version: 1.0
Message-Id: <20241224-kvm_guest_stat-v2-1-08a77ac36b02@rivosinc.com>
References: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
In-Reply-To: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_130500_137472_5F123742 
X-CRM114-Status: UNSURE (   8.84  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

The M-mode redirects an unhandled instruction access
fault trap back to S-mode when not delegating it to
VS-mode(hedeleg). However, KVM running in HS-mode
terminates the VS-mode software when back from M-mode.

The KVM should redirect the trap back to VS-mode, and
let VS-mode trap handler decide the next step.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_exit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index fa98e5c024b2..c9f8b2094554 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -187,6 +187,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case EXC_STORE_MISALIGNED:
 	case EXC_LOAD_ACCESS:
 	case EXC_STORE_ACCESS:
+	case EXC_INST_ACCESS:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
 			kvm_riscv_vcpu_trap_redirect(vcpu, trap);
 			ret = 1;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
