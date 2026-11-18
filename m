Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE30660A5BD3
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dTL+H5/s;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WGI2yeFZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=dnRyV2orWwo6wUQgMi4AcIlc0aqItqB4fhipuC9wW0A=; b=dTL+H5/s64TSZN5XyqDyLEKa5v
	NWBprip0rUn8gVs6FY+gFxz3gBagKW1b1LCazfHL0jQ/YPLe9SISadacbuL+1rbWmFOkOdPnE2CQh
	JlyC9sQckWFiZeZ48JneiFYxC4mOwFZyMwGdKUHqP816T4sqrhAr8KTY0RKDKb1BV4PDrdvkBESO3
	SZ5/SY0VqIvxVWAGbAN0viByWKcaqqKPO/an8v1tlSVhOrEwdRLExrUEwTrPSfWKcnFknHQnLdLdB
	rLuye3zmM1AKa+oiZzMk+RWv9G0Yy+ONnqHmtFII1NP14IBPCftYZcnwjKy5vxCYLf0qWOYE+PQxG
	ZvzQxi9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkJH-00000009ufS-1Hqg;
	Wed, 18 Nov 2026 18:23:07 +0000
Received: from mail-lj1-x247.google.com ([2a00:1450:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIN-00000009tRY-1j8O
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:12 +0000
Received: by mail-lj1-x247.google.com with SMTP id 38308e7fff4ca-3acf056c220so6323031fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026128; x=1795630928; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/w24HJ5snxMHL69L/+mJ+Lj7pv3WZPo9wKgPL92/NjM=;
        b=WGI2yeFZ6Snpal/fvnvpr5soa3b5B4EvzHN+2nBvyEqAyGyFjh25dRgnXKmiBH/l1q
         4xKHHT9uEIYTtgtJWbxm0jlB/snW5TukJC0+sjztN4/nCTOCQiwlUqNIEMMMggJi5PnU
         lxsXhljc+amFCqY2BqQzJSfAQH/sRekYuHTc30jf1nd4jT+Cc2TzjrF3PYyddAl3CB2M
         PP+VhjnhbZNWoRG2nHu2l/qgjWvxhXugBzlOPFgQ2zDg7K0gn5Ro8kHA9COUVHLE02Vd
         XMxsmfTdBhMsioK0KDdsmLmLp5fyhTM874QDzFEytlS2BFJPWcyERx1W/jrhQTgz0T2v
         IvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026128; x=1795630928;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/w24HJ5snxMHL69L/+mJ+Lj7pv3WZPo9wKgPL92/NjM=;
        b=m6YtFo84Z9uOfLJ4Mi5EeU45OxM0H8CsPpt8yFyk82Ycs/fCB6fgKQu5reGIqO9cti
         trw2DmeduDhJprzCkRjJxOwDDqIR6scB3muwqrGFTZn1B38KtyyImP1CA4h0jAfsBl+d
         jGmh0VDWmIWZfaAmzjc1lLg/+HnL9cv0d1dmZep+Y/seTqqPigwcgxS2rxvFC5IHhSrk
         bKrg2ofmqYfcfdB3w8lbDcrniF4et+orSswUX8iDGhoRHt6rlzpzwosBc7Z4GIausLm5
         YmiyT2HTudt3SNTllebNSoqik21HQ57dXpnWFAYxul3ATyftvZqOONXZuLPfEgYGQpsL
         7efg==
X-Forwarded-Encrypted: i=1; AL+hErGJqLe4kaVR3pQWa1vlc5WGjEZk+T4ISUyTgl7WzbXCgk7NWkfI+ZKNi6820n71dX45qxHlb1AqSBfdBw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/4vrThVP/IU6YaHgD02+KRfvljLzcYB1iown0j77X/eWO9ePaR
	4/FzFugr81J0r44wH8ROL/WClNpeKsUIsSuwg0YJ2M7wOayYKU6Vlyi4hni2Wu8cnhFogvVr2Q=
	=
X-Received: from ljke10.prod.google.com ([2002:a2e:9e0a:0:b0:3ad:cb6c:2eac])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:128e:b0:5c1:57c0:50a
 with SMTP id 2adb3069b0e04-5c1a9a70da2mr1102294e87.6.1795026128043; Wed, 18
 Nov 2026 10:22:08 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:18 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2668; i=ardb@kernel.org;
 h=from:subject; bh=wNLIXVywodXJ9QBXpbGE8MqPkM5GL227KxQF5YBIKeY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm8UspUdmNPI807zatFKuZGFOu/OMG3lnPcRsJ5rUJ
 X++mbG6o5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExk219GhssVs7fNSPr4JkY6
 9cIMJd616y69vOvOc1Xs3umnGyxWl+QxMhz7evb0mumaBSbvtE8JXJ+SF/3miIWf0/QjVh27X/6 +xM8GAA==
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-33-ardb+git@google.com>
Subject: [PATCH v4 12/19] efi/libstub: arm64: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102211_490219_3272BEA0 
X-CRM114-Status: GOOD (  10.94  )
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

Instead of exposing individual symbols to the EFI stub explicitly via
the linker script, use the generic struct efi_image_info, which accesses
the original symbols via PC-relative references from the stub itself.

This improves code reuse across architectures, and makes it easier to
add new references in a generic manner.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/image-vars.h            | 10 ----------
 drivers/firmware/efi/libstub/arm64-stub.c |  8 +++++---
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 19d602e45523..329d5e214b36 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -20,8 +20,6 @@
 	PROVIDE(pisym = sym);		\
 	ASSERT((sym - KIMAGE_VADDR) < (__bss_start - KIMAGE_VADDR), #msg)
 
-PROVIDE(__efistub_primary_entry		= primary_entry);
-
 /*
  * The EFI stub has its own symbol namespace prefixed by __efistub_, to
  * isolate it from the kernel proper. The following symbols are legally
@@ -32,14 +30,6 @@ PROVIDE(__efistub_primary_entry		= primary_entry);
  * position independent manner
  */
 PROVIDE(__efistub_caches_clean_inval_pou = __pi_caches_clean_inval_pou);
-
-PROVIDE(__efistub__text			= _text);
-PROVIDE(__efistub__end			= _end);
-PROVIDE(__efistub___inittext_end       	= __inittext_end);
-PROVIDE(__efistub__edata		= _edata);
-#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
-PROVIDE(__efistub_sysfb_primary_display	= sysfb_primary_display);
-#endif
 PROVIDE(__efistub__ctype		= _ctype);
 
 PROVIDE(__pi___memcpy			= __pi_memcpy);
diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index af38cf73cf01..351fcb4493e1 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -19,12 +19,14 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
 {
-	if (image->image_base != _text) {
+	unsigned long kernel_base = efistub_kernel_base(*image_info);
+
+	if (image->image_base != (void *)kernel_base) {
 		efi_err("FIRMWARE BUG: efi_loaded_image_t::image_base has bogus value\n");
-		image->image_base = _text;
+		image->image_base = (void *)kernel_base;
 	}
 
-	if (!IS_ALIGNED((u64)_text, SEGMENT_ALIGN))
+	if (!IS_ALIGNED(kernel_base, SEGMENT_ALIGN))
 		efi_err("FIRMWARE BUG: kernel image not aligned on %dk boundary\n",
 			SEGMENT_ALIGN >> 10);
 
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
