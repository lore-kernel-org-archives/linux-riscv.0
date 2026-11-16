Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D650606A329
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ftxwfDlK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G+wCd10j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=J+JxKcIW0CMtLZiVKr5jJ7xLYIcKEaE2uSQ2yqCofpU=; b=ftxwfDlKwwMU4S8K+/cK0URs8K
	Xq4hSBET8VwsVsBzbY/yWNH+Py3EuvADFlYqq2UrencNFwTAbixy3rsIUDV2bvT4NicV/nM8rQByy
	hq7nG83LqzaK7hXPy2H58DqWxtJea1YPNoPXqH796Pkn4wL8IO2Nr1F+ptl1kSCDixONBbv2Nb1Vq
	LQxOwpXXLKENjzBKdnLRyswWQMzpTjUYjxKactEJ+mKE4tmB35x09l5Q/kDVnBkTAlvYnNp/pf0Z3
	ZX5r9jWHk/3GRgu+l0Wrgn+gYcTITsqoR312O8fsrz88gOs196bQwV9u6tVowuwN9hNFZxpIwf1WH
	UfrIa/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg5-00000002pO9-33jB;
	Mon, 16 Nov 2026 14:27:25 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxfx-00000002pEU-05t8
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:21 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c4d34d6082fso309592466b.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 06:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839233; x=1795444033; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90r0f+b5kRu0Uic25PAyXOgLnJJKMJ4pyDwq3qDyCYw=;
        b=G+wCd10jjSepX2EH7AH2w5oEZloa8zDq+il2svQIF8rgZ2i+/hrFMfx/lCpNRLRhyd
         FgHfaRnNpgZ7Aro/8Ni5MN4RljcuCiyI1paIsTjBGflwGBvaWUPChdT23b5zGhI55Iyq
         eu0zCrsIl4QkDST7shD3l9xD5vU98Mx1PauTA3Dtzzgr6Z/9bZyzVxpWDoFT7xMe6kFk
         CYoDtQCiIhAUjkrDdvy8t9mB3zhuQKSp+OVO3OAZquwWRLL+6Q7SLqER6AGfoPAKnOrN
         BhkcMGacLIctNOoxn6kJtG7o6OeQP4VCfWthdLrMyK1ld39ddOy2DPYVHGvzl8rtfACh
         WHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839233; x=1795444033;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90r0f+b5kRu0Uic25PAyXOgLnJJKMJ4pyDwq3qDyCYw=;
        b=Pmlw56E+SDWXJHIThPMLxuyHagvDRkKuH05VFHkGY12HbwCfgKLQ1Zhn7ctPQFpfhu
         gEtFM3eamoT+HHcl3vRaUZL/ln0TxpShOQiM2kuvSFLHUn/GOHxHhLeCPV8/ZWSFBam3
         Lym/QegJiy/FN9XU3Wus2RdP39XIzyy8fdy4yznaURx+NrbPdmiqFKh939v6rejq7Cb8
         itUP0GcRW5WbZKHm/8/kYkToHSsj9IiLZ1nnE/qHDfdJ5quJ+jDVooSQYLPfK1zu7MKt
         mDO4wXNNfZBmHdCCgFxZ113FmVPxjYioLRYy5Q7RKKqU6U6nTxWOx27NVjtE2fm7WYQc
         qk3g==
X-Forwarded-Encrypted: i=1; AL+hErGdiigxiGByMtWz/qxnZ3kI1cYVobDDu858VUNXAb7sHYcjCFHtc5soUT/unVQa8f2CGS2P3aohpPykKw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Tn3i4c4QbqaFLoKPIIV8UVPlVC3XuezlAoerthPcRQDLKLFxK
	eHR74K3Ql+2NsvhisRJteqrWGo/fvjH8Mup5JwplBJuoiUorRPcgbPNJiCaY5XR23yWhx3eAMA=
	=
X-Received: from ejbm16.prod.google.com ([2002:a17:906:2590:b0:c31:b9d1:9418])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3f93:b0:c50:4a71:cb5
 with SMTP id a640c23a62f3a-c5096325a62mr886143966b.15.1794839232899; Mon, 16
 Nov 2026 06:27:12 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:20 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=ardb@kernel.org;
 h=from:subject; bh=iJCrUIisab7JCQVRK3E8zIw6kz1I277eBbn3gnc4d2w=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu3UG90+Yzl1rc013y9ZXnQWS/H/X/bfbaiq8UBCq2FN
 gdPX+bsKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPh2cPwh6dmke6e8uL/z2ad
 mSb4JvW/NQNDXmW2/c78Vb+e+jD+jmP4X6y5KONutmDPSvfWR4F7GjZoFLxQSRbMnznVJfniZ95 cXgA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-18-ardb+git@google.com>
Subject: [PATCH v3 01/15] efi/zboot: arm64: Add missing barrier after cache maintenance
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062717_090609_9CE4ED33 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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

Prevent the I-cache from fetching stale data by issuing a barrier after
the data cache maintenance completes but before performing the I-cache
maintenance.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index e57cd3de0a00..d35c6dd76601 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -109,6 +109,7 @@ void efi_cache_sync_image(unsigned long image_base,
 		} while (size >= lsize);
 	}
 
+	dsb(ish);
 	asm("ic ialluis");
 	dsb(ish);
 	isb();
-- 
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
