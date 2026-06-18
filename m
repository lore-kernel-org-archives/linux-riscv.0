Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73130CD98F2
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 06:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEUfKy9WZE6EQBO0vXOkA3hbaC/+LGBLuK4/LLRm7V8=; b=htk1kPckBaC86f
	9lSZ0b2Rvv8yGL4UxunLhplLkNTa8fhhc4g8QAKNkGfUtJlWI8PoU3pB6Bc4ZXZj9smAmPny86Avz
	sPom3LPFbReqjZN7oLeYVnDQVYc1CdjZnPulNjbaDwwlY/OWSJyIkM8rf8OKVIYBwOSq5nreu/oqM
	X0DhRuBB5FfaKcwAoH0GfAKn2MV0CW7YjXk3wVa0ClcG53DTqKKKM79gmGYeI/SxwUwvSsN08k0Au
	qbXTqKxZS/YxQaMP8USNKFZ0a/I70SY1tw2UxXEjDdz0DMlAu1j8I8pQuVJDLMZ535hSUGh2KtX72
	Y4ovByVCQjUC8ydnUXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6Ue-00000000hwX-2sb2;
	Thu, 18 Jun 2026 06:44:52 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6Uc-00000000hvs-3ylN
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 06:44:52 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36b900f350fso639892a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 23:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781765090; x=1782369890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j85tblnlrIZ3cGvaLyDqF0OyTQiloZz9TV7u7C5kMjk=;
        b=Q8zoNn8X75Ge+Fw0NyGub4e+gyeqSHQWbrFcRw3DA7eJM2q3cPrxW3evNM01I3NQPK
         SudbRE2buVuDXBU7Yrw0lIbZH53RA29PMYss49Lj1pafH3O5Zvo8m1vN0ddWN2doHEhU
         mxFzu1tLlsOcEkbvJOFiGOZtG4tdWDi7IG6PmxX77Z0LWBZiiCUhqHxnbJ5FueFzOl0W
         1g9UXLOuc2jppTXKHjsPs+0Xg7jNU/wBwDwv1ver1vCM4JqWprzCRvRFLxuzd/h6axRP
         FhMkOl95Zyj4CQL3J7SIrA3xoiU7mLFc4RO2pAswTbDYf3nmV5rNKosw6FSEgwfLWA7s
         5MYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781765090; x=1782369890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j85tblnlrIZ3cGvaLyDqF0OyTQiloZz9TV7u7C5kMjk=;
        b=ZKY0MAy7S6fafTI06KSTF9W/r0MuLK6+GJv40p3iTHxBP3RDn3Uul+XPTGZDz2oS0W
         YIJTMTTjZ8SwCUwaNhIC6Kj0AmKEKJSlgmSkxXoCFW321oEPfbZjTZG02PpE76B72AqN
         cqI59PeXs2SEW0DDYngL5NcpgpnfEasTctqAApo8AYWBUJNhWjIYnkoc7lzkVzGfKOC7
         9P7UAihbYwxPv/3qE5eyhEyzc51W3qHkg7N4mrDzXWo4HXd9KFFd8Hqfvkx9US4vDdKV
         LbB6CTD7EM10HHu+sofe0GqT1ivW8g8UH8a1Vsl/lo8Y9jrRpdgZzhmyYyyLmkm7bP41
         fgRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SDYsctQMVz22RxzEdzgN+Bi3xirlEcQnozR63APgO1sqHGOGgaeP/bQ+waI7rjSVMJkzKQ++axZP57Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFo25vQHBipG+F0MwBrEOAQumrQN5wd0lghVhNl0Lz4lm2Virg
	f4ntu4C3FFlK823xAfTJKdTBsnfOuV1kOh0W2oQpfhV+V4PbU1q+AzJ7pJ4Tuap+CiI=
X-Gm-Gg: AfdE7cm1XaF/rXanZLdmBn/mC6He9HSuUnY7/Lme3rtbtYk4oJz01zGCWv9lej60Lw5
	7uFtUtu83KtpwV2sF7E51aoGdo7a5pRTZRWeMeRLvsY4o2Ok1zS1hC830jr+1lFx2o1zgN1pWpC
	EPYWjRkJtEOpmlE1fl2dnWUJGJUGKLgaRaGoWjK1nFWrZnMebC5EwNvtubP8xPgEhlatTJsgDXD
	M56jrLbRJrMJp2v3fDg5AGKS9qvrfvl8L+OyC0x2LBd5icpced7jKyAF4ON/b48JSNd0PSSQ0Jq
	hm6GbIHKJl95hm624uYATv5b0Q+jj9XhHVZP6rf+wkmBxWZwUpBTcPLq8U3SDUIS+Qo82wp8p1o
	wPp7XUy4Qv99y3HuPMpunOBozPLFvypaGTT3+BSgsiDQCQV7i8nEofiCiimyrvmAmjQvR9m6feJ
	jnw7EBBj1fCA3frcLYEhE3kQ6eARXjbDjE+V1u7YEMrfj3wA==
X-Received: by 2002:a17:90b:270e:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-37ce4545041mr2302253a91.12.1781765090044;
        Wed, 17 Jun 2026 23:44:50 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c1fsm185275985ad.53.2026.06.17.23.44.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 23:44:49 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	apopple@nvidia.com,
	atishp@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com,
	conor+dt@kernel.org,
	cuiyunhui@bytedance.com,
	debug@rivosinc.com,
	devicetree@vger.kernel.org,
	guodong@riscstar.com,
	hui.wang@canonical.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	namcao@linutronix.de,
	nick.hu@sifive.com,
	palmer@dabbelt.com,
	pincheng.plct@isrc.iscas.ac.cn,
	pjw@kernel.org,
	qingwei.hu@bytedance.com,
	ritesh.list@gmail.com,
	rmclure@linux.ibm.com,
	robh@kernel.org,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn,
	zong.li@sifive.com
Subject: [PATCH v4 1/3] dt-bindings: riscv: describe Svadu as disabled at boot
Date: Thu, 18 Jun 2026 14:44:04 +0800
Message-Id: <20260618064406.14508-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260618064406.14508-1-cuiyunhui@bytedance.com>
References: <20260618064406.14508-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_234450_990474_118E908A 
X-CRM114-Status: UNSURE (   8.74  )
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

When both Svade and Svadu are advertised, Svadu is not active at boot and
must be enabled through SBI FWFT before supervisor software can rely on
hardware PTE A/D updates.

Use "disabled" instead of "turned-off" to describe that boot-time state.
This matches the FWFT terminology more closely and avoids the informal
"turned-off" wording without changing the binding semantics.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb214..f1e6b0d79486b 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -297,7 +297,7 @@ properties:
             3) Only Svadu present in DT => Supervisor must assume Svadu to be
                always enabled.
             4) Both Svade and Svadu present in DT => Supervisor must assume
-               Svadu turned-off at boot time. To use Svadu, supervisor must
+               Svadu is disabled at boot time. To use Svadu, supervisor must
                explicitly enable it using the SBI FWFT extension.
 
         - const: svadu
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
