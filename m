Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880C7C54E69
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+5+A+3rY05nkOEfcf99dzHzvcdMpnrisAkfE0C/09Ic=; b=xtpSDgLuEAbUmV
	9A6IiMXzvmqlHro6S3m47r7FdtfODFofdZFGEgrqVW8/smg4Hv4jxNiHSHm/WDs3jH075hvAfJWyv
	cWUA4pj1kc4py+mL8ZQBSJgVKlAUA53LxUt47myTr9zDwiRyrtCfHQ6u3tqZMbnRzlYYLtqMwdcWw
	HCIZE59xH7hxTSJ0013TDI9SiFx386/Q5uzlQTi7IDNqKfcm4rFRf6hCwFdhB/poYhHDav30fYFjL
	10cvN8UnHxhn5Of6DS2578oZUGlJnC3jj8ycsVgljw5TFTcbf0zRBYxdwOQD3ESp+eKGl1+4tAcTi
	sTq+pj8D1eA4x/KX9Uew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl3sQ-0000000HJTS-0uFH;
	Fri, 15 Mar 2024 09:29:22 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl3sN-0000000HJRq-14cz;
	Fri, 15 Mar 2024 09:29:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-33e76d653b5so1651735f8f.3;
        Fri, 15 Mar 2024 02:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710494955; x=1711099755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yy9UuaOwwnjmkLdHpJLRJuDPkF6dNfVXKVVIwe8goJw=;
        b=CertncKLFaxqkYQRr9g0LfkVOSU95p6klbXUP8/BWaTJ5wEq2Li1NwJ4kV0r3lY4Fg
         BQV4/DEBNJwzHNIzrxHS1BsJJYI2n3q1dj+QXrxD9Y8pOEx/3S3T+qYmJs6WnYm0MlKW
         PB/8vaXxm3svDdnT40fDDiocX2CYTnDFf2aHrLOuzbPh4VLHOCBNJy2s9Ez6oVy5CGpz
         NkGFHRm/g61bCMb5WTaeBXoIZv2d1SEJoz6bri6ufxnXLFsewx6dtQZ2yKjG9tyjJXGk
         PW7J15G37E+oW61CEOQSOgtEMXzcL3qE3tAl245xgP/vRawKbY+arm6nWwsSlb1EvZQU
         9MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710494955; x=1711099755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yy9UuaOwwnjmkLdHpJLRJuDPkF6dNfVXKVVIwe8goJw=;
        b=geEhWBbfoJmTi4Ybn6MSYqasDavDD8mhEJOvstsc3Bhjk6Cb1qe4uexXN0p5M8CcC8
         tTvdzIIbusYHgUxG5Ozd+uSexA1SV9CvlL5zMijfr5MmOoMyGpF6UXRmdSRw8hkMhMa4
         fsLOjnXfMkGaWX+hNEcl73rtEIxUnUvu7HH3zQNapCK8vAViyCLb1MWlBAyOneK64csq
         vxnqKoOImUJa2NczzPQWVrtlZIRsDOXiJ9noddTO2JyeHDF+dRCeArl0LTKY74+jtAjC
         fwjrzSpVsc7dAh2oxYQSo8ffnWwgpdVb5UMw8iJZStMKsGvad6cNLZPhgCOyVTmi9Mml
         lRdw==
X-Forwarded-Encrypted: i=1; AJvYcCVBB0HQBLzewz7Ld8ZHn8cwgv1q0ScxN9xExFkH2wBG2en6mnNWrQ1BA0yGOkI8Fnb/k0+5Zee+DxHkLLcS4WBAKL9yjshp3/2JX5f2FPHvDwG0IdAlQcncjn3Fj/jBdars9Ju9nPwPK4cu7bd/oQ==
X-Gm-Message-State: AOJu0Yyokqh+WLnreSsDwJ5bKaywifP4blWGfkc0qW6i/4jX7M2jHMEY
	+rHtVWiFlRi5fIAxUgvEAjxjl1ej1ra2freX3HZVXPzyNdVneGJ2
X-Google-Smtp-Source: AGHT+IEmfGjtXZvqB0qQ0wkuzU6/qV0BfQY1EeQ8qHol34BJoU6SPpfV0XTqiH0QZzTBWkH99PXJpg==
X-Received: by 2002:a05:6000:4e4:b0:33e:78c4:3738 with SMTP id cr4-20020a05600004e400b0033e78c43738mr3615149wrb.54.1710494955224;
        Fri, 15 Mar 2024 02:29:15 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d60cb000000b0033eca2cee1asm2736644wrt.92.2024.03.15.02.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 02:29:14 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] RISC-V: KVM: Remove second semicolon
Date: Fri, 15 Mar 2024 09:29:14 +0000
Message-Id: <20240315092914.2431214-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_022919_313901_0288F451 
X-CRM114-Status: UNSURE (   9.97  )
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

There is a statement with two semicolons. Remove the second one, it
is redundant.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index f4a6124d25c9..994adc26db4b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -986,7 +986,7 @@ static int copy_isa_ext_reg_indices(const struct kvm_vcpu *vcpu,
 
 static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu)
 {
-	return copy_isa_ext_reg_indices(vcpu, NULL);;
+	return copy_isa_ext_reg_indices(vcpu, NULL);
 }
 
 static int copy_sbi_ext_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
