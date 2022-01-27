Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D26C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 20:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9JzGGm1xJhdpvKZ7Y6zqLC8hQpYgIhIyqc8us2hBM0o=; b=yCljWVo3TENiue
	p1NqHKicq1k5YT/K6EXqEmS4ux7VXgnC73+DSg5K245BgMEKuEkosN3ysgGWnAh4IbrUdIt2dEZA1
	+UVJuYSnOlVZZYGXrCmDepZftYKI5wmqwq1UXvAQIjd3WOlf8PKruhkTGs8GyCa0hTZdzdIyzi2b7
	lDepmNDgVSM7EN2pcZso6rGBTGxg139+ZD4eTgxZebfOPGT3PlCvvuVvnlQR5fdpl22/DU4kCmDSb
	fCDSTcjL5lQ/pSMrm1u/tnwdH4H5MH457kGwoFsXzwznjTh1eivf01iCzbKJMzdzm0BXGi+hyO6BN
	ZErKDYtU3ZPONfv/nyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDAz5-00H1G2-9z; Thu, 27 Jan 2022 20:03:07 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDAz1-00H1Cs-ND
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 20:03:05 +0000
Received: by mail-pg1-x535.google.com with SMTP id v3so3258733pgc.1
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 12:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=pS6oAPlQasQLltOWbX6ybr6410G9JsawVRKiZZSuto0=;
 b=OkmBR46itpSo80eYP7SfR78XlDnMDrL9T8FDPQBDH5rBgiD3BZFfwLp2IIx2tdkHR+
 ttRdpr4UVF+iNyhTIs3m0ikyxmU9eeIljF9uOY9Wc2sJLPWeE3QoI2R21yFiy2C4hYY7
 qP+0Cueu8u3d84NnxZgzByglJXfgi37r0teIb2DzgVYRuND/lMRdW3Myoloks8Lc6IR2
 a4SRgnrJi5GxFgixdCQnkHAwOVTjduufc9hxgByV58qNLUFcYCziJdvmlF2DMzSzc5Ax
 mE1T78oc8dnShG9T0WwD8JfGPgAQnfc03kPCxAzDENXCdRj7VHYVAj942yBXtMeCxx1w
 7inQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=pS6oAPlQasQLltOWbX6ybr6410G9JsawVRKiZZSuto0=;
 b=UPgEXd9EbfbXwlkdJeaus27XajrcmYSo4pxk2whwTv8q237GaqxIJkJ8Eb3Akd7zte
 eNv99sV13+oP5vBnqyILElH0xVrY9P7i6V8/ZpQin4FWq6LzdrupyzRJ4LvT3AThzAtY
 R1ZvQH0m5Z54Tyzalx1ReDEPuUGDAU4Y4Ao7LVYJ9zFgNwxV2iT3MxgoAuaTjHga3DP/
 k5JkIHs9tcTI+hJlw1HgT5Q2YPshZGliaCOx82Ao4Edmwax6UZxShbofmuYlkzsout3s
 b2mQPT0pW7arGn0SBod0Qt/vEZss9REYqrghbOIRkRTgUXd/RH6IDuCShIVepZjZFUoX
 lwIw==
X-Gm-Message-State: AOAM5306nKrjgqMxFvGl9ekmYuz6NSMDc1L2ydRNu1Ftykgt+P/DKw6C
 iSZVasaYX5/+ufiAoURhwg8A5Q==
X-Google-Smtp-Source: ABdhPJyiiccrnWius1BWTgJTa5HN7sJBk331iM3iM9Jv7+uIfjVeO2PjkPDHGJ4ZwPFA89JxLPZ6Rg==
X-Received: by 2002:a62:8fcb:: with SMTP id n194mr4258239pfd.29.1643313782059; 
 Thu, 27 Jan 2022 12:03:02 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id s2sm20501253pgf.56.2022.01.27.12.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:03:01 -0800 (PST)
Subject: [PATCH] RISC-V: Prevent sbi_ecall() from being inlined
Date: Thu, 27 Jan 2022 11:55:55 -0800
Message-Id: <20220127195554.15705-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org, Atish Patra <atishp@rivosinc.com>,
 jszhang@kernel.org, 
 vincent.chen@sifive.com, sunnanyong@huawei.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_120303_871292_654199B7 
X-CRM114-Status: GOOD (  15.66  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

The SBI spec defines SBI calls as following the standard calling
convention, but we don't actually inform GCC of that when making an
ecall.  Unfortunately this does actually manifest for the more complex
SBI call wrappers, for example sbi_s, for example sbi_send_ipi_v02()
uses t1.

This patch just marks sbi_ecall() as noinline, which implicitly enforces
the standard calling convention.

Fixes : b9dcd9e41587 ("RISC-V: Add basic support for SBI v0.2")
Cc: stable@vger.kernel.org
Reported-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
This is more of a stop-gap fix than anything else, but it's small enough
that it should be straight-forward to back port to stable.  This bug has
existed forever, in theory, but none of this was specified in SBI-0.1
so the backport to the introduction of 0.2 should be sufficient.
No extant versions OpenSBI or BBL will manifest issues here, as they
save all registers, but the spec is quite explicit so we're better off
getting back in line sooner rather than later.

There'll be some marginal performance impact here.  I'll send a
follow-on to clean up the SBI call wrappers in a way that allows
inlining without violating the spec, but that'll be a bigger change and
thus isn't really suitable for stable.
---
 arch/riscv/kernel/sbi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index f72527fcb347..7be586f5dc69 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -21,6 +21,11 @@ static int (*__sbi_rfence)(int fid, const struct cpumask *cpu_mask,
 			   unsigned long start, unsigned long size,
 			   unsigned long arg4, unsigned long arg5) __ro_after_init;
 
+/*
+ * This ecall stub can't be inlined because we're relying on the presence of a
+ * function call to enforce the calling convention.
+ */
+noinline
 struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg1, unsigned long arg2,
 			unsigned long arg3, unsigned long arg4,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
