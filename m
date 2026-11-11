Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A9E606A324
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G476I4MU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YZT38HjJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=UBIfh9AWsjrnjYdw6Cs5FN5K8ysgcz237nnoWG55liY=; b=G476I4MUpJzD+ZxFjf1LR29393
	jH8nH061TNFQKFffbITPvjlbC12dmIJtsp0f7GjFULDNiKjKi050db4uYp1d3pU0EtXnUvZjgRemu
	Qd6Z7O0LDEGzzUImoWFdEBAXuqmm6S3L2P8sNOnEZoQdxlkiaOrk5914u/7dFFZfhS5HFqzfrZnB2
	d/VkiqwVoBwV5q9J3NfjpfeydO8TaA+PAygzGwXgJyM3Okk9t7YWzJbCV/LlokVKWo3n4GwWH7qn/
	RBcNuKQ7JxTKmjCkExRfbY1ENrzBnRheDYM+MfrgtTNlvKUuZ/fmguelxtmF3mPxIlXpPGDgxTauF
	4GSMLHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQq-00000007E3w-3E5u;
	Wed, 11 Nov 2026 16:44:20 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQk-00000007Dze-1Mza
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 16:44:16 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-49034831bb3so2963408f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 08:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794415452; x=1795020252; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUSsS83QN+vD2vwv3edINs9yAbdxie8hIvWNEo96nL0=;
        b=YZT38HjJliOwnBzGT84Czk+wyMAKZWJYVaNcPJm6cbMm0r0VhsgBV10SIlpHL9QtPv
         of0tBGRcGYVT6l513cjzJaUdjdfevWuGLKCyBVuzRCkszuJmUMZ/jkjYY4p+zrmx5C0f
         aaaozj5xe2vVJsr1BjEKXOUQqkTGhXKnTrcM6tgPMw6HPO96a5BcYJIiUlzJzzRHJeY9
         4QD+TaAZV6jSlC7YRSX2V3UlMRUGJKYDpz1Yaa8f5AdNFfQPnG7lnEbhElgOMOHYlJ2s
         ziipAUV1yp3zKlwZmWUxRsOpdKAHwQYN8kNFW+ySz/nXg/BDlzOjvK6/FvH2ie5ai9E3
         B18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415452; x=1795020252;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUSsS83QN+vD2vwv3edINs9yAbdxie8hIvWNEo96nL0=;
        b=Shb5AwfUpdYS1x9bONmeC8kcplUsSFkR/RfYEZnOTiBuvMBBg9eYNw4+WzfnmeXKwK
         0pvPwddHrl09KlvATPXINCwAESAsgqGVlsROgNkqbErAHeRCxvm47lj6tFzdJJSaVqX1
         Q3LfGI/SDnJaPq8bdi+cIIgEoLfvx1vf0TRit04DQXYi6pufolFxP0LIU3HlqgjU2SwF
         5ip+bS1Lcz83CBisyCicBeycnPQI/mGdqDa7xYC7YUAYAIOYhVQ8kPySLb8GKLfgktOz
         kb5SPklIe9s5RAr1FBEjDbROf7KSfUkVk4s6S8H0C+HgiV6YswzuTL9feFLkn2PB11MY
         7Lug==
X-Forwarded-Encrypted: i=1; AL+hErH+ZMnsAPh3Em6rofk6Ck80Pak1Wj3njh7YAUETXXSj+wIxyAyMGoMnmqYV61B96W2AmsctyMvjtARutA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+JJicTTlRJcdZTjT6hH/rmX3BbSyUKEgfVOTfgbHdKlMYJcbEq
	pX1JsQ7cNhCgZBv0Kj5/R3o0iFN5ZFEsGSDO5stb8Z2FiQK7x4sS/0ZRxvzAdvUXiojfkWaxhw=
	=
X-Received: from wrms3.prod.google.com ([2002:adf:ea83:0:b0:48e:a84:d884])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:41c7:b0:48d:fd4d:7fbe
 with SMTP id ffacd0b85a97d-499c3b9e804mr4839243f8f.2.1794415451474; Wed, 11
 Nov 2026 08:44:11 -0800 (PST)
Date: Wed, 11 Nov 2026 17:43:47 +0100
In-Reply-To: <20261111164345.4059964-5-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111164345.4059964-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463; i=ardb@kernel.org;
 h=from:subject; bh=CVFgIkpTiEZmWTXEYfFE5fyWaPqBrt/l+On2oTA6XXc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevLbOf7/A8/m++efrPI1Sdy99vd6ozzgkxf33823Uws+
 fgs25xDHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAi2uUM/4y667b6rH7M/CtX
 9d4coZm6M27ynb+5s3jPffHDQo63Wq8yMhx0TH18Un5+hOqs8waWCQ8kPcImuWx9dM+IsXimW0S vLAMA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111164345.4059964-6-ardb+git@google.com>
Subject: [PATCH 1/3] riscv: Use _stext not _text to denote the start of kernel code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_084414_369851_05F60298 
X-CRM114-Status: GOOD (  14.56  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

On RISC-V, _text and _stext currently refer to the same location, i.e.,
the start of the .text output section, which follows the image header
(.head.text) emitted by HEAD_TEXT_SECTION. _start is the symbol that
refers to the actual start of the image.

On most other architectures, _text refers to the start of the image, and
_stext to the start of the kernel code, and generic code (such as the
EFI stub) may start relying on this distinction.

So switch the only user of _text in arch/riscv, i.e., the "Kernel code"
resource that is exposed via /proc/iomem (and from which the "Kernel
image" resource inherits its start address), over to _stext. This is a
no-op given that both symbols currently resolve to the same address, but
it permits _text to be moved to the start of the image, making it an
alias of _start.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index d79f99b86033..e6112d424fde 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -91,7 +91,7 @@ static int __init add_kernel_resources(void)
 	 * child nodes.
 	 */
 
-	code_res.start = __pa_symbol(_text);
+	code_res.start = __pa_symbol(_stext);
 	code_res.end = __pa_symbol(_etext) - 1;
 	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
 
-- 
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
