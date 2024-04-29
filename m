Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E321CC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 09:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ldeGimNSdX4nG2EtdtFdW03YXLeKAlgrCMyc/MQeAs8=; b=O2z45ZZKdX3LcJ
	ZlAcF36DWP2cSPpKrocdhb+r2d21AG7zXDfpfyd+lgbdHRoQ1C3YffyysGKQTt9+KLRsqPg6RWdjI
	WmKX0fFpHB8azThCkOKBWrxTYRS+6pUO7c05l109Fgg0hw0o/fvd/FZzRkeZso9Xf9riJoomWSBPE
	Uy2ms7/VqoSKONGolUyRKkmXOdHmKg7SvtxmfTIRx3matQIxk3xwWyEGcaTkoOBnla3Ue0zEQ+Vlp
	wbYizJkUM/f6tkEq/dmIxeipO6fCHvYmB1aP8aiPLZgNMlVm6K4CvgMBwuY/MDDRd0iP2dg7TGqyu
	6xXY35EoKY2MSV2Sj4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1NCx-000000025xV-1ojU;
	Mon, 29 Apr 2024 09:21:59 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1NCt-000000025u5-01fL;
	Mon, 29 Apr 2024 09:21:57 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ecff9df447so4104309b3a.1;
        Mon, 29 Apr 2024 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714382511; x=1714987311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J9UFM0QgrM1FAh0+vb7l+Th4iJA3HL3efcqlB9gfYVY=;
        b=Oq7hmeHmmxra/m4Xl2YwpGn8lzsseOo0UPQc2aiHe7I0gaqkXquKmaqpkqrM1vlGrL
         GMB3/YPzDqlxsKCgppyi6iZEYHvsFSxzf/sQ32q/VXOv5pd62ew66eBuOA0oZQ+Rg4Mf
         mbwgu2c6pAMd8d9pE/lVYdQ/LNwPb6eZqei87OghLEPNhKJQhHnzq3aEzka1tSuPEyCh
         1B3xwAdVBngOhqFv0xuUW0EbbTvKocItsrD8J/1L3L/jc8Jkit+yBZ7wIHbc+YCsBGe9
         2rCQOKuNVitSCjD7OogmAK38aBEiioH1srX7EGRpN8WdnhLy4Q2XJPNWjcn9/QoBIcvM
         68Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714382511; x=1714987311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9UFM0QgrM1FAh0+vb7l+Th4iJA3HL3efcqlB9gfYVY=;
        b=wmCyl3TYMdkZ2/8PkgSY2c57ryVOFWAj5tLEnJKsb2re/ly/TrLBsBmuuALEf6wm1r
         EYl5vRQ+daFdG8qJGKB/PLzzm39h5PBcPifV0uERuUAkDqoAHfhI+IBzrZcdySBBecwC
         BlReA1gsia9H5mh7WFvlP3wvuVGy93fNLRkGZE3sGHvTXGHbaXL7uAqEZjIIVRAQocZ6
         57mJiHVbQxLpiYpzp5GP84b0mzjNwQGAperXR3c9cfmqBW+flkFCeugKJcSWt++dv16W
         nBeMCgTA6nSRHRN2hAzwQJK9reNG3nL+VJNt78QNOrZ9MajAKn9Dr/juJAJc8ifOgVr2
         J2Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVrK1h3GozzefsBkrabziYm8vSXOjpffmPWuz9X8zrn0xG9R/NBeTuDT8JSKppGQUv8Zs5aTH6tx8QcAowpIHznbKzRWOF0r77psrW5eEBEWwf+hY49tLB5qeO4JM1uhfA9uKu8l4AOSWfnJGWZSQ==
X-Gm-Message-State: AOJu0YybEKGzr1BimK/E7uQyeSHlbRRkppRPgOt/etnIPMHQfMVifXhk
	O4/x1UdqpzcGtY7DoVGN+7WmtXaI3gjl+FbS/fqRmVxYn5uEmQYI
X-Google-Smtp-Source: AGHT+IFUWMxCtXR0YEgu24XHMxJDW5kxEJj7RXx/NjNPsp2tU9ljNIxOlNFDAkPSTudVDNteHZSAFA==
X-Received: by 2002:a05:6a00:3a09:b0:6ea:74d4:a01c with SMTP id fj9-20020a056a003a0900b006ea74d4a01cmr10302896pfb.14.1714382510598;
        Mon, 29 Apr 2024 02:21:50 -0700 (PDT)
Received: from localhost.localdomain (122-116-220-221.hinet-ip.hinet.net. [122.116.220.221])
        by smtp.gmail.com with ESMTPSA id b16-20020a63d810000000b005e438fe702dsm18503787pgh.65.2024.04.29.02.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 02:21:50 -0700 (PDT)
From: Yu-Wei Hsu <betterman5240@gmail.com>
To: anup@brainfault.org
Cc: atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yu-Wei Hsu <betterman5240@gmail.com>
Subject: [PATCH] RISC-V:KVM: Add AMO load/store access fault traps to redirect to guest
Date: Mon, 29 Apr 2024 09:21:13 +0000
Message-Id: <20240429092113.70695-1-betterman5240@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_022155_115805_01018229 
X-CRM114-Status: UNSURE (   8.09  )
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

When unhandled AMO load/store access fault traps are not delegated to
VS mode (hedeleg), M mode redirects them back to S mode.
However, upon returning from M mode,the KVM executed in HS mode terminates
VS mode software.
KVM should redirect traps back to VS mode and let the VS mode trap handler
determine the next steps.
This is one approach to handling access fault traps in KVM,
not only redirecting them to VS mode or terminating it.

Signed-off-by: Yu-Wei Hsu <betterman5240@gmail.com>
---
 arch/riscv/kvm/vcpu_exit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 2415722c01b8..ef8c5e3ec8a0 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -185,6 +185,8 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case EXC_INST_ILLEGAL:
 	case EXC_LOAD_MISALIGNED:
 	case EXC_STORE_MISALIGNED:
+	case EXC_LOAD_ACCESS:
+	case EXC_STORE_ACCESS:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
 			kvm_riscv_vcpu_trap_redirect(vcpu, trap);
 			ret = 1;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
