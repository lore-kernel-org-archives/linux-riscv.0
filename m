Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCB4C77B72
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 16:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1M63AQpbnjkxEqqgLfZg5isZQOOIP8cgCkHLFVSP4Ts=; b=G13Z14Sa/eYqe7
	DCedn7HNl9slVH62FsKxlHPA69I+YQW4AoC7x2kXo/tLSmp9mI3g9uUe2r3kTGAtrVRFxTDwDFkjC
	df+ynE9aZNDZYhf/G1TYUBpCokegEyYco7qkKxASKEyl+PjyV1yfJoHqWXlTHvZkM2G1RGJjKx/r1
	kVsQYsreyjuqfJ/rIaIDTXj6FgTfIFVnm8gMQJRkTri2CdKxrvYt7f2EiptGH765xszZXQe3HTeTG
	B7Oyd19A8ykRHrzX3a9Qpet0LoFIxOyERdSzSR66aVxw8rnCwDNhCyA1srHlwa9vwcYYThfFLn/u2
	kLPC7fi06DMsrrpkEElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMYB-00A8yk-0p;
	Fri, 14 Apr 2023 16:45:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMYA-00A8yJ-0t
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Apr 2023 16:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zmWeoSmrBMtxR3vKNVKojBcvrcQrIEBGMqJAoaelw98=; b=cjDPrrqoSOLlCppQMQXvGQdqAM
	68YzF1wrYM0Jkkwk6eXktr6Scyt7CPlJbvLZrU00Q/Uvi7MB6TfnDvVoFSFfQ/Z89kSh2jcWwqdy1
	54xYsLw9hZUEY7Q3MjEl3ar73eNbO13LhVUu+stlf2yoSNT/cZp0DdG8qCsh8+Oc4ru1vka9Yxd90
	8ObuocbC6DTuBH69tvCAg/Dm/KG9WP/3GSWwPPzTnJcJz259D/vmyCjUeeoIJNisoGP+/F5NVVe1p
	4l3sImbLrz9iVFyiBfFsVBNQdNWtg3dDb8XG1Uy8whZkn6rNISyCOMVJKRHTd0h9RtlsxGaWF1fQA
	aZgtozXw==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLqx-00FcLK-1q
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 16:00:50 +0000
Received: by mail-pj1-x102a.google.com with SMTP id y11-20020a17090a600b00b0024693e96b58so17996931pji.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 09:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681488045; x=1684080045;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zmWeoSmrBMtxR3vKNVKojBcvrcQrIEBGMqJAoaelw98=;
        b=G2pr/OVLqAjlZTUCowmQ8edFsVI/ipTpPtlA8Cefa/YtKrlp3dSIe1ucbn2mJkpITG
         kaI06/iiyzCch4xRRhUP3D6Vx0YcXDUKTNP+uM5XmOihjUxyuq3+Bu2SHAwoWy8DT/r3
         VfYEWh5W8jec6s26Gxzod+MN6Nb8Ua2X374Dq+UuteqPg3wCyKDMxQWvzgPfEPYYGv89
         9kL0zZV13R14WLiJN0V82KZGMhdarOvbHYu9pZouoqrqdmdtE35r/Z3Q+nd0F0XxbCFc
         1Pi0RXacB/bfcqnunIavT1H4gDROfR8Teu06QbF9UGVwqOH8v7JZhVVMaUUAcBWMjeLl
         cXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681488045; x=1684080045;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmWeoSmrBMtxR3vKNVKojBcvrcQrIEBGMqJAoaelw98=;
        b=j4xqm3cTWEZXjZzczU//tYZakvexEF6dXUc6TrnC5ljtq5Z6SL2/2xKrKqDAAR5em5
         1C62tt0RWH5WH77QC4hJ3HBn8xg/nuvj4BrjbUNeJVyMj2HXl4/sV6ovbhxoqVFiwnZB
         TvKbH+OpXCQWzmDpKeC2AIoiiJyQRvIaRl4rpXnMmJNacjhTggcT40KXTlrHoS86a8rx
         qIhnTp6YmyvqZ5Nq4jLWalzLg0MsIScLADDhSqrv+RRb2UkRFsKTsna1U3g+yfGYyjbE
         dpn//OWzG4zY+W0pcZ+DAj0x6l5VsPfYloScwBTN4JN1WiBT5WcdNZDz56jHe/F0t/sJ
         NHZA==
X-Gm-Message-State: AAQBX9eKjZ2WyYNNtt0CTgZjkqif0Rjn6Xey7KkeH2LDO9agUZIlWxjL
	fbHlQb1AaUTYrO0IFkQGRI+YQZ5peEAs5YwE6Q4nXSyFeJRps6J3RHNTZa90+oFm57fLohqrZuo
	KsO59yalNudivDaOMuOsxHlRHl0+Mdhj20SUQgNnbMmYcloX11vR3imJAp3ideUgyV7sLzqCU/U
	BH7GSA5DHqL4fG
X-Google-Smtp-Source: AKy350ZZ8n236tZyzzCLneynVwAEUb3PwX3tobYlXJckVQxkA1mIcx2zmM9lIQADhKB5QaKuGssmRg==
X-Received: by 2002:a17:902:ceca:b0:1a2:a904:c438 with SMTP id d10-20020a170902ceca00b001a2a904c438mr3604960plg.58.1681488044928;
        Fri, 14 Apr 2023 09:00:44 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.09.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 09:00:44 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: [PATCH -next v18 19/20] riscv: detect assembler support for .option arch
Date: Fri, 14 Apr 2023 15:58:42 +0000
Message-Id: <20230414155843.12963-20-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_170047_828533_7726B9B1 
X-CRM114-Status: GOOD (  10.23  )
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

Some extensions use .option arch directive to selectively enable certain
extensions in parts of its assembly code. For example, Zbb uses it to
inform assmebler to emit bit manipulation instructions. However,
supporting of this directive only exist on GNU assembler and has not
landed on clang at the moment, making TOOLCHAIN_HAS_ZBB depend on
AS_IS_GNU.

While it is still under review at https://reviews.llvm.org/D123515, the
upcoming Vector patch also requires this feature in assembler. Thus,
provide Kconfig AS_HAS_OPTION_ARCH to detect such feature. Then
TOOLCHAIN_HAS_XXX will be turned on automatically when the feature land.

Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index cc02eb9eee1f..205ce6e009a2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -246,6 +246,12 @@ config RISCV_DMA_NONCOHERENT
 config AS_HAS_INSN
 	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
 
+config AS_HAS_OPTION_ARCH
+	# https://reviews.llvm.org/D123515
+	def_bool y
+	depends on $(as-instr, .option arch$(comma) +m)
+	depends on !$(as-instr, .option arch$(comma) -i)
+
 source "arch/riscv/Kconfig.socs"
 source "arch/riscv/Kconfig.errata"
 
@@ -442,7 +448,7 @@ config TOOLCHAIN_HAS_ZBB
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
-	depends on AS_IS_GNU
+	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_ZBB
 	bool "Zbb extension support for bit manipulation instructions"
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
