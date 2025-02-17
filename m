Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3ABC021A6
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCtYOyICtIIdFDvacmrvtTDlN9ck4L1Vaq7hcBa8ULk=; b=VJAFc/6u6nx7Wf
	XJaNOBZgoY4gGG1xeJ5ZbOvfTt50vcK6Cf40o6xVXQ5KLpWjquhYuNZUhX953dkG0FSo+KxhqG1if
	dGB/FGSTWrph6LTDqgLb6/WsdaemTYu6dCrfcdMzJyf9YxFbH2GwB3oHHxHQucrlGs/+0h2c+F42Q
	crkSDutn4tyTqDws4sRfkJ/RjMrlzmQ4s8FwNh3U++gKGdGUx1YgfeiPulJM3/vAr7A+KFa75wI47
	Qlu0v464y8l3/3GbEqc002UGstXMVrjBHSQQ6GmuH7F6onjvXnCBIirQDE6UJeA0zWGik1W5adC5q
	i4mX0H3rg93pbneuNqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwki-00000003nX7-2lc9;
	Mon, 17 Feb 2025 08:45:20 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwke-00000003nPV-0dmK
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:45:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38f2c4382d1so1468856f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739781914; x=1740386714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUiohrMXynF4IhELzrFmGh0geLQ0Ng2lOgwpKuwejQg=;
        b=iiZ5u8Rfw8UV5cc/zYOwdNTA94g/jUOxGiorYpdnbmQNUlGHj64atzHqNYp1nX/ldK
         jydg6M23jCxjLFc5uflf32Jx2rkesJ0Tp9Dw6SM/bRstITPFjCfofbPSOt6Oje22HNUB
         q6OBfGJz+J+9qrLdjhWVDZc5+NVi8B7BmwxZ5oJP6Es7ByrbpzTcmolFMmXKKNgTJacm
         eCEMhO61G3MMjaZ4pkdvOFV5Vm6DpQD4CV1WVOfsHel5huXTYZPGKYUXeOOLdIRHjlg9
         tZ3WzSrbuifFST//REiDbZGfe0OgkfFtLLzjmdaxxAdjb9hH6rPKkuv8YIru6vhKRNwJ
         VepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739781914; x=1740386714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUiohrMXynF4IhELzrFmGh0geLQ0Ng2lOgwpKuwejQg=;
        b=Fjn1xTnzE1Vexo2KZ1Am8ZL4SfHRdQIZ63BvX7cMDwTwEvRVmVT7EPfOupIyfgI8OY
         dFPk3QG+38AFqyCG13K37vOKnRDT3MKOqe92CkG4G2DQodFshSJXBCBOlSOjnQQXXGku
         tHB02I1raUGMFL0MZ95UebmVqqBFP1si1VeTEtiV9XBFZhrNv61UtTitcZTjkuUCP04g
         7XFryuyhOsMAq6GfOLNCJODmY44uZTLN7G90euzyXY9lFzfQjRA6YYsWEEKOiV+BuPri
         PSFYGmD68WhkupUyVpxQrexKIQ+Rc0bQPjuY4H+czmeCfi9aHAUjMf3+6Z+CFS6UumI1
         3Q2w==
X-Forwarded-Encrypted: i=1; AJvYcCViiHvKDajtIGpOmb5AvKJlFkPpP4/R+dkpw18pUthFr4EZZK+ljeXQSZ5uQ+cKsW7sejSs+AWPyDfC7g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjc9kMOWu9lNqsLHlpI6U2JkMfWK49XnEJ0fLzffkH1o1EKJAM
	u3iuK4WCi/V3d5RPFdWXmbIzb8EehmvhzhZJprFaeyUVaUOZAJjFNZ9+I2cVFsoa4pGREEMSIc4
	I
X-Gm-Gg: ASbGncuxv1Vhl9bL8z/bEaYKwICluQuylHYkCaZGsQlOYGRHLoLWGkXhi9BHHlH3SsS
	Xwl72IOStrSZ8rxc/pHhj8KJkgY6xxMY49v8H/mpio/W+ifSXCl9UPWCl6zzF4TBIOGtWeh1LHq
	sxzSkNxmmBObNN85fAA2Tbxtz80Eu+cFFasltaFr+PrmbLbHejObKtNE67HLxeMIKeC3gtDnRr4
	GPora6u7kRdPMGyB7GlkOjbvA6dy21m0GFHg4TC2gx9FEMryOmhrBTw0J3tFWuCg598JK7r7ZW0
	6Q4=
X-Google-Smtp-Source: AGHT+IELeloq+YGu7jeWFNzVErrIwYQyO3BkZOQqDo2NauOC4G+f26bXlMmY85lR2Dzf3d+ItLp71w==
X-Received: by 2002:a5d:64a7:0:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-38f33c2886emr8174108f8f.25.1739781914336;
        Mon, 17 Feb 2025 00:45:14 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4491sm11387499f8f.7.2025.02.17.00.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:45:14 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com
Subject: [PATCH 5/5] riscv: KVM: Fix SBI sleep_type use
Date: Mon, 17 Feb 2025 09:45:12 +0100
Message-ID: <20250217084506.18763-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217084506.18763-7-ajones@ventanamicro.com>
References: <20250217084506.18763-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_004516_266215_76377CEE 
X-CRM114-Status: GOOD (  10.98  )
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

The spec says sleep_type is 32 bits wide and "In case the data is
defined as 32bit wide, higher privilege software must ensure that it
only uses 32 bit data." Mask off upper bits of sleep_type before
using it.

Fixes: 023c15151fbb ("RISC-V: KVM: Add SBI system suspend support")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_system.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_system.c b/arch/riscv/kvm/vcpu_sbi_system.c
index 5d55e08791fa..bc0ebba89003 100644
--- a/arch/riscv/kvm/vcpu_sbi_system.c
+++ b/arch/riscv/kvm/vcpu_sbi_system.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/kvm_host.h>
+#include <linux/wordpart.h>
 
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/sbi.h>
@@ -19,7 +20,7 @@ static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 
 	switch (funcid) {
 	case SBI_EXT_SUSP_SYSTEM_SUSPEND:
-		if (cp->a0 != SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM) {
+		if (lower_32_bits(cp->a0) != SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM) {
 			retdata->err_val = SBI_ERR_INVALID_PARAM;
 			return 0;
 		}
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
