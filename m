Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B10BC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 13:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZkcRJT0M/hgEokVuRrvc0cvw+oIgw/ujOmRqkvlb7E=; b=cfs6M3Dwi7YJB9
	8FvlEzC3xTfmd0aTmeGJjyiZnh4xjykHzla/PImWFc2zKxsZzfxwzJ4bvL287M5Ih7GF1dVmWndYs
	hOuV58AZt4sIHYyA/rYAghpAHZ26Qn4QFSXPyMoMs/RdnGgcQc4DYxLlSYuPDCEI4meUfysn4KHFa
	n8y9v5zmZWgfbDJVlMaXnYgyVKKITaAbraGBnv8eYCINJP4zeNxExfzwa095ZIpBAE4aqBCo+0zCH
	Dcz0hOHXc3akx+b7I+v696mRov3/7JnUkxqTTU3nWii0cbg11HouAMez/yVFPrTL+tCvGUtYNPL23
	Dvwks3whXzTz0puEc0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxogR-00000005pO8-4AE1;
	Fri, 19 Apr 2024 13:53:44 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxogI-00000005pEk-31hO
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 13:53:36 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a52223e004dso196700066b.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 06:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713534812; x=1714139612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/o9GJYOsp32C4ZK5XVSIqlhvuJ+jgCOlcUd/wXUyPQ=;
        b=lXILVhBodE2N+sdutNRZP9t8S0KJ+rESe6Z/Jshe3kRWRXXFM8bHJ92hI4wn+kEHJW
         41S1ED0P3/vjDhR7QUivDkHYNE7iGl+fLy9r+5qhKDFlIUXu8jAvJPPe9GZmaA7l9gYN
         WpWMv32fIJNyijyJPZ8EdwEbh7OEWNJLLdx58WkP9eXwXvzz4AixQNkChRBoPnZMHF56
         PrWWuvXkKqGjqIatnt3Ag5gXeMTPFkqtnbbpYpJTH57oGR2Z1VRRpl0v9mt5LGjLmu6k
         yWApRjHXE6+LIw+yS/n0ErriEK8diZevg7gVoU8fV5G8wLSLawhq7zHFuKtJUQ4pnJo3
         FsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713534812; x=1714139612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/o9GJYOsp32C4ZK5XVSIqlhvuJ+jgCOlcUd/wXUyPQ=;
        b=qPA5CwfIl7qTnoPs5OtavCU/aaVnGhQ+VY/QgP6rsN9olwe6ZfGJcaaBYBIPd5Hw74
         3/HofIZOpRHRDETUoIVyKlZMeSVq8A8t3+jcwuOoWi+II2RPet/ykAkyntJDhBhgwEEQ
         1dce1lmxg3rO5leRGul5gtF3mhVscEybGZZ+rCXVNQfrefPen8kvpmPI03ZKp2hxVxRl
         Xei1sMiHE6bGs3iIkImOSdwkWPAfRN5rsstGGNp6z8LbPSU/aekgTFScfBSHN5fl/PbL
         n3PPcoH5N7NGr01pVL05yfCGO3KM5NUnPPLaPX9iO4V2+9zyThJNE2idd4spKlXtu42r
         LAQw==
X-Gm-Message-State: AOJu0Yz+DPOrwtcdshlhWq6qm6tfnSlMHDd08HaWChfbMnxqjmIyCTZ/
	rVzs03PGTSyn7U6HuiJktd/5jTeM41c0sgBLhSVtbEYy85cIhR+v+cjd1KmJLS9vooF+rWRnzEk
	q6Jg=
X-Google-Smtp-Source: AGHT+IGBQ9t0lRGzscQAhpOHuvu3T6H/3CaUBbGTMF7yl3wKq7mI9JkjJ8Ug9d+DetW6DEe2LgbkcA==
X-Received: by 2002:a17:906:6d54:b0:a55:7837:b546 with SMTP id a20-20020a1709066d5400b00a557837b546mr1941644ejt.57.1713534812041;
        Fri, 19 Apr 2024 06:53:32 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id lk19-20020a170906cb1300b00a526418d0ebsm2233256ejb.74.2024.04.19.06.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 06:53:31 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM,
	parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: [PATCH v2 6/6] KVM: riscv: selftests: Add Zawrs extension to get-reg-list test
Date: Fri, 19 Apr 2024 15:53:28 +0200
Message-ID: <20240419135321.70781-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419135321.70781-8-ajones@ventanamicro.com>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_065334_852651_D714E32B 
X-CRM114-Status: UNSURE (   8.86  )
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

KVM RISC-V allows the Zawrs extension for the Guest/VM, so add it
to the get-reg-list test.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index b882b7b9b785..8c4c27bd4b88 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -48,6 +48,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBC:
@@ -413,6 +414,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(SVNAPOT),
 		KVM_ISA_EXT_ARR(SVPBMT),
 		KVM_ISA_EXT_ARR(ZACAS),
+		KVM_ISA_EXT_ARR(ZAWRS),
 		KVM_ISA_EXT_ARR(ZBA),
 		KVM_ISA_EXT_ARR(ZBB),
 		KVM_ISA_EXT_ARR(ZBC),
@@ -936,6 +938,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
 KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
+KVM_ISA_EXT_SIMPLE_CONFIG(zawrs, ZAWRS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbb, ZBB);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbc, ZBC);
@@ -991,6 +994,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_svnapot,
 	&config_svpbmt,
 	&config_zacas,
+	&config_zawrs,
 	&config_zba,
 	&config_zbb,
 	&config_zbc,
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
