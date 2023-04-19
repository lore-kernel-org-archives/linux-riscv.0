Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA19C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zI1FKlzHnMp/zIiCadgYTexIe6tmr9IjZSjvHFo1vc=; b=ZL37FI8UWIz6j5
	zLinFbHLoq16y1QQVxjOulBceL8ltSu7+ucOBp8x5O4FmsCkbopdy0tPUBaiTm8Ric0HBVzTQR9wI
	xgHBlJR4Atve5sLhw9xSjkNCKzXDzOxLxSugeutiHunYBvxZ+BbpDb8ghomkMqb+YzGLbQdJa8hlO
	hysjT2Q3moD2OP6377G6pU+Wf8afItvmAcNRuwdhca7F5dIW3k9n2qRsLW/qosQUBvfcEnnUD6k5j
	pyTzaqpLfxIRYxoUVhsoajabsZ2EWTiUMUzu0x85j8f5b/kFUOoAgNOjHF8vyYjbdWjZ1qrkOhgQ1
	X9PKwyj2BHQChZbigGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG93-006Tjj-1F;
	Wed, 19 Apr 2023 22:19:21 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG90-006ThT-1v
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:19:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1a9253d4551so4770525ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942756; x=1684534756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8D5qQaAsWRyihppL8lxgNE7a17gNAwjOwZEXYQRMgE=;
        b=KY3qeDkuqx7ojUE9edJo91m4yJkLaFWv5WBr0z1XBW37m3Ugju5gvpwIFDQff0jKms
         +hgKcILxSjrfAbaSn/gsJas5jFwQYwJwvq++pUZKG2L4GsKhyqTPcUu6xp5ypSE2166a
         M9MbN1bFoVVAdPgWpFhugIMpkrykve+HvKmx+0rzvYuv5b7fjLguHE92nxuCMfaazyT0
         EjqjUkf7F7QIDOnYykXPXccd7CL3t2WBS+Rd2ML5ADa2yHIE2iBIctAwVUyHJ5XwQDtq
         3t1dyXic09IH7MeVfo82H9l2jXFUHVEBVSeBHFYy8QxMmo1hXkdwnKJUN8t2qaLHF1ux
         +z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942756; x=1684534756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8D5qQaAsWRyihppL8lxgNE7a17gNAwjOwZEXYQRMgE=;
        b=JE52ZKvI10MSfOKvZTew1es2NLploNrboFmJZZao7MfcmKPQLBsC0OOUbR5SObFwxE
         sElBkF+S5SyGQJNFEfrsUdtxq3GMr1CmjH+Zz7qcoBID0mgjtGVdNOEJtaOiApirIEdn
         1msVg6hLjYPPyF/8qFxFhlVgNsw9leE1hQjDordyE8SB9lO/MoaDA+K7T7UUR9RDF8sR
         TYSVjqu3Yv0WX3h+j+97Lb3Tx8vGTVKEQS/hTTjraL0HikDOX5VotaFcjx/EvlWpNyv3
         kVkTODTaNr3O7K1tdegfN6CTaEaI+wehoBCrKGTjDKeM2NKLGaex6H7PHBjSyhK5gts/
         fFlw==
X-Gm-Message-State: AAQBX9eu8sM+qpYw/nrneWiioRa6xhVL0OxYtMlbQvHjp7FB9o5+ncQE
	FbrI8LuerT4iwtm1/RcUo0kjLQ==
X-Google-Smtp-Source: AKy350ZigrT04ztZNfYo7vxPOIAk65YMZhdMrGeFS26zGyCIXgxICUZh5tguDmZpxCxB9++y2y9iww==
X-Received: by 2002:a17:903:2288:b0:1a5:2db2:2bb with SMTP id b8-20020a170903228800b001a52db202bbmr8899588plh.15.1681942756356;
        Wed, 19 Apr 2023 15:19:16 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:19:16 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 48/48] drivers/hvc: sbi: Disable HVC console for TVMs
Date: Wed, 19 Apr 2023 15:17:16 -0700
Message-Id: <20230419221716.3603068-49-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151918_632767_15E2D8C6 
X-CRM114-Status: GOOD (  16.77  )
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

If two same type of console is used in command line, kernel
picks up the first registered one instead of the preferred one.
The fix was proposed and NACK'ed due to a possible regression
for other users.

https://lore.kernel.org/all/Y+tziG0Uo5ey+Ocy@alley/

HVC sbi console makes it impossible to use virtio console
which is preferred anyways. We could have disabled HVC console
for TVMs but same kernel image must work on both host and the
the guest. There are genuine reasons for requiring the hvc sbi
cosnole for the host.

Do not initialize the hvc console for the TVMs so that virtio
console can be used.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/tty/hvc/hvc_riscv_sbi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index 83cfe00..dee96c5 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -11,6 +11,7 @@
 #include <linux/moduleparam.h>
 #include <linux/types.h>
 
+#include <asm/cove.h>
 #include <asm/sbi.h>
 
 #include "hvc_console.h"
@@ -103,6 +104,10 @@ static int __init hvc_sbi_init(void)
 {
 	int err;
 
+	/* Prefer virtio console as hvc console for guests */
+	if (is_cove_guest())
+		return 0;
+
 	if ((sbi_spec_version >= sbi_mk_version(1, 0)) &&
 	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
 		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 16));
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
