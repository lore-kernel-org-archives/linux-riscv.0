Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFBBC54E60
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 12:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yi/H83VuUh2ESLgZqXw3WhLA9GRDjXShVBaka1CEzEU=; b=BpeeZm7V3Gm2iQ
	0caeC0sorXiDk0uV/UWjI5QUieu8SsQ8cs2BYI2afamJPeoelfRDw2UQ17kl6fZS+RPB4or5Gu1Vk
	6E9js6DvWwbXTalxAH1QoUFSHzE4msp4azYiuXw1rg85bEbCNXsfdBIuQUJD5+TgPg6EvOxGKK49K
	b8rcA9J2NRfcSqtkg7ysVjUVTSh7JtGdxYSLmN2ZriKsjZGIBEng/+tcRpnVpeTIuSpCTEfVzpMTC
	IK21okrzk2EHC68jyXQt+9VV/LBcsycMF5QfA5bA2FTlu83DiGkge1xAcYZb/6DVGjOPh6zxjJCzc
	32mZ19PIVFxDoAkXzl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1N9-00000005ldG-0b2z;
	Tue, 12 Mar 2024 12:36:47 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1N6-00000005lbj-46UY
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 12:36:46 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5e4613f2b56so3766790a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 05:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710247000; x=1710851800; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3LUOH45FD+q43FIVXh9HYVnjhYf1Qb1SK5glU4t0vJg=;
        b=DS4RJBb3xNf5YkpxiYiEjrYnVt1KJOpUlUGNfrT8BM7sGnWwF+SWxJcJtHUkgmVlmq
         dAVSekfzj9XVRiJzW88woXUgA1C0+pbm8+g1yc2mVfdAHYGWmaJorL/0JkuT19UJB8+e
         0hqDo+nv9q3DPtJ2Ooy2lgZpcVDtogPP4q42piqcmxiedEfaXxS/DvRroOyulxfRvPBu
         C+HBrN+WtzNwKMiTTjtzdl7DsElgr0wyJZzfRQlQuzajmXLUrzAiuJWhqsoIJH2Ufbdq
         KDXsg7pkb0m+77oqWJf3mFLrllpjBGu0BCGKUszawCEZeUuQk/bNLNSFFG/yoIfJRgdu
         QEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710247000; x=1710851800;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LUOH45FD+q43FIVXh9HYVnjhYf1Qb1SK5glU4t0vJg=;
        b=rhRuA7cLHtRmnaFNCXwXcBc7ulf0JiSxnX3rosgn4rtRiXlfObJKk+IreQbC5GCwYi
         Fdq2h05m7jrga2d1Z1rFfSEwaN9bjfZcHPpIgbJ0C4FzTftt9FgDgiU0/tN8h4EsThv6
         hPY+WnXZgN9tz787Rj3+tOvfbvYfnQyIv4JRfdvhxgwZE3m4E6Inergcx0eQOo31ZoC6
         GnF+qAvcx9jOsOk9MRvSRYwKF+kzQQMH2zorhmxq+qt0K4zUHjJIVj9kRaeTmLiD5y9o
         vxVAl9t7HjRnWPfSytAoYt8Hh9AHoh/Cz4aGS7wLE2paQU7R1QeSEBNu+YaNL61/wEMz
         QCfw==
X-Gm-Message-State: AOJu0YxcatFVYCwE6q1ELm+/i5pP2kYX+UMLWQx3/ij+0YCHNvKzHQCE
	SRlGldCc7vA/ytc5cOaVKdeXeQCYSNGWDLNA1waxlJ5vYbmOlN8TiGqnaW+pZnStwtlFm67D4kA
	8+B8bx0YTjqk6WL6G4t9lZ12MbCmjHwXAd8CB48I8FVFxDh7AfHg4pgdi+0j/lSVleZdHh7Z7ZU
	s5K7N2OjIdBWSi3feVIFiMXfJ3dCOVVflIaKd/51lJ7ZMcZM4QxalS
X-Google-Smtp-Source: AGHT+IGYEhaF1PneeikJyHvvcv5F64ZSGoJWcGbAMYZWK42U0fmfMHXBjnuZJhLk9lkb4kb9p21Ypw==
X-Received: by 2002:a17:90a:c7c1:b0:29b:f999:2ace with SMTP id gf1-20020a17090ac7c100b0029bf9992acemr4182686pjb.47.1710247000039;
        Tue, 12 Mar 2024 05:36:40 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id hk13-20020a17090b224d00b0029c2794d3f7sm1804233pjb.7.2024.03.12.05.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 05:36:39 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [v1, 1/6] riscv: vector: add a comment when calling riscv_setup_vsize()
Date: Tue, 12 Mar 2024 20:36:22 +0800
Message-Id: <20240312123627.9285-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240312123627.9285-1-andy.chiu@sifive.com>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_053645_042493_8987BFC5 
X-CRM114-Status: GOOD (  10.08  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The function would fail when it detects the calling hart's vlen doesn't
match the first one's. The boot hart is the first hart calling this
function during riscv_fill_hwcap, so it is impossible to fail here. Add
a comment about this behavior.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/cpufeature.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89920f84d0a3..1b21f1e568e1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -671,6 +671,10 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		/*
+		 * This callsite can't fail here. This is the first time we
+		 * call during boot, so riscv_v_vsize must be zero.
+		 */
 		riscv_v_setup_vsize();
 		/*
 		 * ISA string in device tree might have 'v' flag, but
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
