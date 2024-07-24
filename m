Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F59C3DA63
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 18:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEmMkCsP7UYDHMI2IpgBNjSREcK0CyNTY9nOT4sM7SA=; b=k60WnFHAosZbau
	nLAQ1D6TXjtqoMePvidykoo20KdUQsasEN60E+bUUCMk7+C1pPFIyJLgS+fgdNq+gPsqj43tHdRlL
	1OUbEFbvfuPW3/Ld/FvChQb/G2fb2zgc7RdfRz7P+rcgopYUocXgu3J3Hr60zdsznm3oaYA3idoYO
	ZZoOMTTpklhhgpQRGf9OskPOV67qqogKVwo85tJ/ivEU31mxR+xV324Q/Znr5Lb/6+y8+c3r9NdPw
	MhHxCTFtbCIoROS8EeKNrSgQrPJ0Am6i1ICPvDHtLJu9hyCEi4dXn9+im0iqoaz2h76KmHl5NMniB
	2zgcCnpGvJ7NLfzAjGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWgqq-0000000GDY6-0km1;
	Wed, 24 Jul 2024 18:36:36 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWgqn-0000000GDW2-32CH
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 18:36:35 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-71871d5e087so85124a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 11:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721846192; x=1722450992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T446nGf9VV23fAkbt86c2AUWhCfShpS9fTRumPDCq6I=;
        b=AFye0LVAOh5Kv6J4qe3WbuXbigGE7c8zrZLQJvVjxVzRLWo1C7uvb4ci4PLcqSpMKZ
         A+XWTj02wFjw6QlJBes88tB6wcJwNJ4iS0sxm72rRt7U3sEONmSau7yBjH70Nzy5/4Z0
         0+xIs9EhK2O+ItwQHBPgmFR0/N9Up3w2EV6nXICLVuazECmRCl7We3BIF8rITz0ZYuVe
         pYHeVA4ro+2SFBvR2jJWMP/oh1K5dCkneuRbBYgb58Tcu9uSB8zC9R661wKivdwHVrfY
         K5yQyKCyp0AdtZ5gLr1xryC0Mxiem3MRo7/o/75H3bGIZlRso8xg+yEj3ZTCCLQ2vpbt
         Ob4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721846192; x=1722450992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T446nGf9VV23fAkbt86c2AUWhCfShpS9fTRumPDCq6I=;
        b=t7Zc7Xcnt1eRioGc4lsL1Ji0G+ghaTtqseKeAMHUv+0BHjNVnv7BwBCdX1n/2nfnEq
         jSh7u4bf7BHyN7f05/rn+NV42BXgU+yZliQ9cjAwuTgTxr8bp+IIdD31gNzZhGzgsEnj
         MgM7SUI78/kQxdxttA38lZenUSvNn8gdfmvHppXjIFGNpQB8CT31hgZXhKJV8sFsUOgd
         GqsayWM8nwMvQqfYCyXiLQCE2TRE7MSLD6wZ+RfmwSm6G3xhlNRgdF+ipDGsvCynTGDw
         dwiUy1qAoU0dZzJXYuMLW+wuzZgVAfd57pDi1KBWucgPr4eTAxvyn4U7Tf7NKmjWqlqF
         z5BA==
X-Gm-Message-State: AOJu0YzOmdpPkrIsL37eFyv5kFuOQNcSbbU/2ntrYIXVyDtC+g9oL8tK
	j3gCAiuDRYNOxAzA6bdko+3QKwX5iu5I/Y6b4XBO27g2mpGnWdjnmeb8RUt+U+gfb3hGX4CZpu4
	v
X-Google-Smtp-Source: AGHT+IEVw0YyWnr/ziifVhnrBto5RhBD0kOQUk7xLSjSQ1xEqKIpwjmfsGUcpP1EYEE4fhGC6iOuIw==
X-Received: by 2002:a17:90b:4b51:b0:2c9:a151:44fb with SMTP id 98e67ed59e1d1-2cf237d73c2mr449140a91.22.1721846192001;
        Wed, 24 Jul 2024 11:36:32 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73a189esm1997830a91.2.2024.07.24.11.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:36:31 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6 4/8] RISC-V: Scalar unaligned access emulated on hotplug CPUs
Date: Wed, 24 Jul 2024 14:36:01 -0400
Message-ID: <20240724183605.4038597-5-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724183605.4038597-1-jesse@rivosinc.com>
References: <20240724183605.4038597-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_113633_832775_29041A8F 
X-CRM114-Status: GOOD (  10.68  )
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

The check_unaligned_access_emulated() function should have been called
during CPU hotplug to ensure that if all CPUs had emulated unaligned
accesses, the new CPU also does.

This patch adds the call to check_unaligned_access_emulated() in
the hotplug path.

Fixes: 55e0bf49a0d0 ("RISC-V: Probe misaligned access speed in parallel")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Cc: stable@vger.kernel.org
---
V5 -> V6:
 - New patch
---
 arch/riscv/kernel/unaligned_access_speed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index a9a6bcb02acf..b67db1fc3740 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -191,6 +191,7 @@ static int riscv_online_cpu(unsigned int cpu)
 	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
 		goto exit;
 
+	check_unaligned_access_emulated(NULL);
 	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
 	if (!buf) {
 		pr_warn("Allocation failure, not measuring misaligned performance\n");
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
