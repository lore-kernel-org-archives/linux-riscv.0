Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D6C606A330
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MszBxgTK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K8ZgQ5po
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=b83i8nFWlQhTZTX24/ufWerR1XFLpMkg2gMTifqgLvE=; b=MszBxgTKx+uE5x9oI5546l/sXe
	9hEnKZkkYd/vxwjFNgICuB9LhWtK8BAiQxTk3wqg5JlBRGYQDvhqh1kyoZfkWwOfhPx9kfVQxhAhb
	YOB7nmgHuXvPb2mXCP8VdJr3Ns2FVu20uSyczxa9pVEwHcj5LfJha3jDmBorwdfEVE4t+YnupzTso
	0RFx2hpGurDsHbDF4y3kMehpU2Nz0l8smXjWXgUdzU09bgct8KllYD26OKGphVaa9up/V2Xi7Yk/m
	zW7gxIt8xmVRXl6gv7qqRfBv4Uua9hu2SpJXq8+ua7IFynFxHjdvjF6o3r1WLt1TxnI6yo0JaLIBx
	1MfTU4pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkJc-00000009vDM-2DYw;
	Wed, 18 Nov 2026 18:23:28 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIR-00000009tVm-1RIc
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:19 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48df02b91f9so41094f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026132; x=1795630932; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufXRKDkvqGZ7V1E+zy+j379v8X/+jc3iv3T/Ea9AhuA=;
        b=K8ZgQ5poRYbqNWT6CUreXrIWxLieIpAzC81xueH/jC/9vIOykjs3b8fqZztr5+B7GH
         DIZcr9EatC60Dee1IwE4BUBxj1DXgxHzVn8vXQVsg57pksfiWFD1+UJpG8ahFn3ieTcc
         WCoYXPThWWofD+npynRGSNE97brR546WNOcnTa+3DQnFxFsGo81Ntf7KrJ39+dbZCaWK
         uSq2sPPCNgSo8Ua1v5IkDTHmlrppSc0mA/Sh1rzvqI3lqTy4bNaVmRbSCNA/J+LnVQvo
         k0x7VYBITSah8XklLuoIw/BRw0X1eYShlTHLSwNVzSTix/RP4ZXjr3IMTAs3wszPNdp4
         MzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026132; x=1795630932;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufXRKDkvqGZ7V1E+zy+j379v8X/+jc3iv3T/Ea9AhuA=;
        b=pYmtY7FogcAQIvCWE/juni85spYOGU5JGA5jAgI6hP4qtCwwa0kG15MKX4sV/glBjn
         zNcRKBWTd8gNZ7Hjmh2xsNZ3lr0cCcho3MHshJeZhuy3A6W11+ZbEVnE2G6WsfyG+YWe
         +TKXBpxvw9sre2yYZSgZKGvtyxogkFwZ4H/1K9y37r65BmPfIKKNCoqGVFYwTlEEOUvv
         GeRi9tdKpwChs+wVdyJ8t55r2O+0pzadxBSPH6v+yyX9NbCmJ4rEN97ry8bkSG8Mug4o
         pDlQj4l5HLSf8yLdHTfLYqUBRmOPvskhCmvDsrFtiRqKWRTuRasZbmUgDLU0BVSYW3nS
         Zj2w==
X-Forwarded-Encrypted: i=1; AL+hErGRfZSOfFXlMYISd2AWYwgH40tkr2hSbZMTpvq17KYVXo1oZf5/0L0EH6R0xhea/OQhVNfyrR+DZGJ9HQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z99vbUC59cEhkMhfsTVMt6V3btEN4uJnemVOydTCEqprDHUVPjC
	5XYTGRrOxb+QgPiKhsysYae8p5Xn+D9UqAz8v6hG5FL/CSdkWQts9l8nU5qPKHa0JVtmGmZJiQ=
	=
X-Received: from wrbdh5.prod.google.com ([2002:a05:6000:a85:b0:48a:f5b5:2f71])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:41dd:b0:492:b1c5:6db6
 with SMTP id ffacd0b85a97d-4a8e3f70001mr836395f8f.6.1795026131432; Wed, 18
 Nov 2026 10:22:11 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:20 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1259; i=ardb@kernel.org;
 h=from:subject; bh=2JP+cT9iihC5uYGXzSyzWCniO925ZMwvqz8a7g9Ari0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm6WGnSc5J+WcVbnAJc433bqPOze3x3t/lFj+ivTJ9
 1IurmjvKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOxXMrwz2xaQsuyS1zrH/yb
 dOxUcZ7zBe4/av8WMjnc3BUXcZ6ldALDP4s91ycxG6wzmBcq1hDzZc3ikPLX4te+xBasDvn43ri fgxEA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-35-ardb+git@google.com>
Subject: [PATCH v4 14/19] efi/libstub: riscv: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102215_440098_1A9E9A64 
X-CRM114-Status: UNSURE (   8.34  )
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

Instead of exposing individual symbols to the EFI stub explicitly via
the linker script, use the generic struct efi_image_info, which accesses
the original symbols via PC-relative references from the stub itself.

This improves code reuse across architectures, and makes it easier to
add new references in a generic manner.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/image-vars.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index bf703eba3fa5..c18b24792a29 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -23,14 +23,6 @@
  * linked at. The routines below are all implemented in assembler in a
  * position independent manner
  */
-__efistub__start		= _start;
-__efistub__start_kernel		= _start_kernel;
-__efistub__end			= _end;
-__efistub__edata		= _edata;
-__efistub___inittext_end	= __inittext_end;
-#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
-__efistub_sysfb_primary_display	= sysfb_primary_display;
-#endif
 
 /*
  * These double-word integer shifts are used by the library code, and
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
