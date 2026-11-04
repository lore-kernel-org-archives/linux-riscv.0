Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7902E606A326
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yjqlBPFJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gCzum4+g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WeEl5fEJ0l/70GoKhODmsNm4IcRLuaAumWQ7L5Ku+u0=; b=yjqlBPFJpkyHs8kuEP21CN0PKv
	vvfOreFAwuZZ4/KjynBKgPvEUvS1XK8QNV0DAu2m8ANTwdslDC1UQmIcJTX9TIKkc2eVMfY+sjI8g
	U+ERbSA0L5RMi+zmFqhbO76VHc77S6E1ZR4Bh4VMnu+aLVTe8T87eK+LfWSK57HyRoTrL7Qi88ZIS
	+A2WcZx99qtlQr+yAeCA7D6+AtdQdRL55VPbiLmU9aVFJJz/6JIovAVL2ww8hvelnbCQ1ioEiNkc2
	v+HlevQ1LibQec9MDhPHOjQELPIKXcrWFrnLmxbAmwNxUgzZ7A4+Yc5y7FoSu5l3+m5UEvV1/fIYg
	k72uQD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcMW-00000005hAn-0mvS;
	Wed, 04 Nov 2026 14:53:16 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcMT-00000005hAD-1jVR
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 14:53:14 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-679334baa1fso1171536d50.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 06:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793803992; x=1794408792; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bdpb7DkbNvx1cd2LuIdKPUEVWFbLibGs47NkSZrjc4Y=;
        b=gCzum4+geH+OA/0AnsQri0PL/EBE7KArOG+zHoKnYjbHNL468VLZ/TRQPNWrWf4AW2
         mQL1n6Rbo34yWl9o4I+mept/YtpkfRSnRlKdh35FHNhEpBPNbPfocuwxNKSWAcmPT954
         lEDxi16xmWYBTFkOP+Ns/RMPuG9IF8d+gt9hqc0IcRqrQ4UShWZ3VNlTm8GYO7ZYUzvR
         rKVLeZTvq3qZmVuDwSuCT6V4n8CLHqiqSQAWzu00QTgMe/WekOH1XF6Up6+0V9/B9Tt6
         gOwVDjwgkzfrh8Zh8/ABA+fg0oc5f4xaDuvJBzaR1ZIpW/9J8/NA7D05WkzK34PQf30Q
         mmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803992; x=1794408792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bdpb7DkbNvx1cd2LuIdKPUEVWFbLibGs47NkSZrjc4Y=;
        b=a8AnY12d0FWKik6UcrkIHWUlnq3diAeoLgppf39iTRUBZQc2LgvLuN4SYDCsb0fHoT
         eHDiUSQ6Koff3vO915tUnOVu6E4DP/W9h/75Whe+J31pigayybiTPxpbRMWQzOQqnC70
         B3ltUZTZaVTApKutjJPXBuNruUk31VUQze+ZR9jSHytugxvYfVBCni2cXeGmmOXop8IA
         UH57YwTnM1qJ1U452byMXXPYOkSVAAXugelT34Hv9H7b3y/VyFWZqKMSJPQtwjMF4dqZ
         S0p0epxrGGaMwyGs1W2nR5KA2Cg2Xp1jtDiJvObtWGLyn0IiQiKGsZBOwm43weFGJlG8
         Yd0A==
X-Forwarded-Encrypted: i=1; AKwUvBx5uZAegH41vz5TXN3GwlInQJjQ3iqx15Z59LTfyzEXTm2mzgXY/KTrbey+ml22FjbUYvpcpywPd4GP7A==@lists.infradead.org
X-Gm-Message-State: APuU4Z+zK2DTc6fDItERr8D5brww1TOxfz1hvrP5nQ/BGohhOqdp8U9t
	qkTWMdVqvsjf8loA4ruE4qnkcglIHG3hxBI72gvu4XTrhHf5U1JXhKS/QkA5ZG6eGiM=
X-Gm-Gg: AYBFou21M0oPUdJp7GT57JM24QNu+p74JoHQp7EUawrGQX/dZ88iNPy4o0Lee98ZLzx
	QOeII5MrnT1R63vbcLPzVGq/TRc5OUt3dlH6C+UvQCYi0mFdxceMyVAYSjc9ZU3L2kwYVLhc5KW
	/jdVmdn+znTTuL5Lh26eTcbbpBSYszmzGg+NYJcCw1SVl3Jr1NLn1MCkEtM8Hnm4mpTfIURWiD5
	6fwNNZAt2Syyc+oe/x4ncO1ycbZy1BHChe2rW8XnpIdsyH37kBVGeaFcUD6LLJSJNBsFiFAwGZ3
	JPt2RDS19/VKkBS0EI0KzkRZUof7t1V/akxHmH/08VBI3aTajkPs14ffA5yRraExv5FQte/ztz0
	J8JxkU3Tqx3XO0RRm0vsoUrqsfjiAX9KnndVg5qsgJfEibRYrgdYXdkjKg6f+MtE6FOKCBBF/Y7
	bgzsWCocuDCD4oN41P74rL+1B60T1OuCH70e6DkWmeZgN7gqq47EHQAi7+I76AvfjGbUlFtrG8T
	x9bGQxMYdhvmPRj1j5Q2pjUYoRqqMUSp8gErMBRVTCUJSsC2peZ3VvhTHIO+96n1SuqAOw2ZXzv
	MfA+ug39KAUI+gYraLOQGZmVuXOdnRXyOhuGxwR2nHzU9Wzy0bxtINd7Eq76bjbBqoUoMfOUM8F
	SM7pyK/OWDEaMRQ==
X-Received: by 2002:a05:690e:16c1:b0:677:b9d8:a475 with SMTP id 956f58d0204a3-67ba50cc6a5mr6545943d50.147.1793803992459;
        Wed, 04 Nov 2026 06:53:12 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee24498dsm1569080d50.10.2026.11.04.06.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:53:11 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Wed, 04 Nov 2026 11:52:34 -0300
Subject: [PATCH v2 2/2] riscv: dts: sophgo: add Milk-V Duo ethernet DTB
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261104-milkv-duo-eth-overlay-v2-2-e3d2d39cf229@baylibre.com>
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_065313_467867_66EAE61F 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a DTB that applies the shared cv18xx-eth.dtbo overlay to the Milk-V
Duo (CV1800B) base DTB. This enables gmac0 and the internal PHY MDIO mux
on boards with the Ethernet IO board, matching the existing Milk-V Duo
256M DTB.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 arch/riscv/boot/dts/sophgo/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 440acd0aa55a..3c9f3530526e 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
+cv1800b-milkv-duo-eth-dtbs := cv1800b-milkv-duo.dtb cv18xx-eth.dtbo
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv18xx-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
