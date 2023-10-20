Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF096C00A98
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kt7TDor2V8+i+0uLrI5Q0DY2HOyGX82IWXecX1Plj+s=; b=3ZyRoSqCE9bSfy
	CAaBupCsM7Pwo9h371+lEtO2NHlcLLhXi+1GxJZRKQW/MqhZAQELi33CYpdgtroTRlCNBqJscm3Yr
	q1twQVMO0gyDDa37uzTsWAU92OeVEBNSzIpS15AClEqRsP8ja9Vc9SJT0HrvvAiDqThh46Chf22+c
	9cbWAlJSW8GouYaOIBApIZIzprpcvoKmNMr8H3lyrINyI6a+BMNUVQSSC6wNDtfepSYRnBtbQIhLN
	WXk5jnzwdMRgvRDwWL3C5WOhaxwtjmu2GWLf5r/ytA2U0y2DFDMKPhJqZOpX0h6l6GZANCVekUwOQ
	Qdfg/QOO3QSSfFWAcmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpC1-002Jjf-2C;
	Fri, 20 Oct 2023 13:05:33 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpBv-002JgZ-2k
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 13:05:29 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9936b3d0286so127171766b.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 06:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697807126; x=1698411926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W2Ir1Sk4srM7JCVvNjwrt7XvrtWi/G5OfkZCNgeg30=;
        b=FbDkg7fbHM0XM02i1MFWd2+bhmJMtu/7qm5ijr8F1H3oX3rRc6k3snUDvJ0cm+jcUm
         oezBNvk+sh5aj1xcNoJuP1u0wHGkZG7wAQ1BStgGEn03YpqjNWNqbsBgO+U4gcGp1x7y
         N0M650xo+sTWnAMsowRzoajgsE8C0Ea1UhWYpUpmoAzMElonuDBNQWYL/Vd+G6TBH6Up
         EVPfhvx+WXIoZibnYg+Pmc2I+8SSijeNoeFPTJTU8q7zp6m7yp6uHhDnHH7xuDq3crea
         3/5RcEPgetFFxU0jP6SjgUGiiKbQvzfxbB7KwvXqh/GpmV66vJzhsp9Z+Gj3WfIOyLJL
         Q5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697807126; x=1698411926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W2Ir1Sk4srM7JCVvNjwrt7XvrtWi/G5OfkZCNgeg30=;
        b=Q9GYGSdO36LYib8bF1fOW3DfXe3y9I2WIGCEHd+7WAnMBwYtcllETEftFGZnCET0CL
         5W350tr2XEHJm6+nsY8t4NVHgRVRohPY74GtEObjmSry7mkeWi2m/ugWCcIpYX/r/hVy
         3YhOlz9C2IEhxgF6fyM8ytqTqzrQSuL08Eu+dk0M2PX2NjtFqYoUL3Dam5EOHu6MK0K8
         FOwPXaqf8mpGlmvGfiYBmMiuUmzn4Q3zO3N87r8Wb0P31CqvBErcUTAPVPU49BO97u9l
         KC/nOi2tXHD5MOAUK93cXSZhIZtu++Y+18PhKXN4G/zYWhm4kIX9IFk+iwzBgJp/oCqW
         NRcA==
X-Gm-Message-State: AOJu0YwgBcAmv05ornzcryos3Q5q/ekZxSVegeVLojYQhgumTpZVLKuW
	yEvlOlThHI561WMPUunrT3NMDkhw5rH7MTKLqiw=
X-Google-Smtp-Source: AGHT+IEeLMdNlcWGwhTyfCcbIougaSkJjQMx0wwYOth/fMBwTHnFC01w+j9rQlSZf6cXZ/dJ4ZlpBQ==
X-Received: by 2002:a17:907:c0d:b0:9be:8693:66bb with SMTP id ga13-20020a1709070c0d00b009be869366bbmr1203195ejc.59.1697807125614;
        Fri, 20 Oct 2023 06:05:25 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id cw23-20020a170906c79700b0099cce6f7d50sm1473853ejb.64.2023.10.20.06.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:05:24 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v2 4/6] RISC-V: selftests: Statically link hwprobe test
Date: Fri, 20 Oct 2023 15:05:20 +0200
Message-ID: <20231020130515.424577-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020130515.424577-8-ajones@ventanamicro.com>
References: <20231020130515.424577-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_060527_920129_9FC6B6C3 
X-CRM114-Status: UNSURE (   8.34  )
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

Statically linking makes it more convenient to copy the test to a
minimal busybox environment.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 tools/testing/selftests/riscv/hwprobe/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
index ebdbb3c22e54..5f614c3ba598 100644
--- a/tools/testing/selftests/riscv/hwprobe/Makefile
+++ b/tools/testing/selftests/riscv/hwprobe/Makefile
@@ -7,4 +7,4 @@ TEST_GEN_PROGS := hwprobe
 include ../../lib.mk
 
 $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
-	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
