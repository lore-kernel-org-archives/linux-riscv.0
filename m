Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79F6606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 03:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OzRDyfp9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOhdWH2F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RULnGtQe6bngm9IOCqZmfUqAwQYFVC+Rt8zBQWJDDjs=; b=OzRDyfp9geCqXBSq8hroyeSsit
	x+4Zobo3dcyXSHs2U5TKZPCEqAVx/CqQkxpIs8QgBAvyEabeLDQhjgCP3st/iljPT3bEoSlTW0544
	L0DJFwFdFOTYrBYhbuoC8QP7RQeDnXudSgN/oqBdFG4tDwrlcUp08loRul/wfnRWHNBPCeoZcjNEg
	XxT1SlBk8qq0ou1XhfcJzqkN190Dr/a2ORb+H1tEi1/UAzjVqCZI3v6huS2ZcqalNG00WIhi6DtV4
	QsagBqkAg7/uEQKCgMC+BSliInZj8kfzIyp0P2b33Fiagr5kU+SzHbLZy6h/oTBTpxsJTwXEmzXmb
	AdBF5UfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPlW-0000000BxF6-2aeX;
	Thu, 26 Nov 2026 03:03:18 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPlL-0000000BxA1-2L4h
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 03:03:08 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso4559425b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 19:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662187; x=1796266987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkTmeYNebhkrqLGwJXoMAq7CpBRUkvwi7hUAFtPicvg=;
        b=YOhdWH2FJCHbkHoHP1USWskWMmajmBIQERQfxKK6IIdfAEs6A6/xrWI1oyQ9pKXmaC
         mMdjP/lugS5QKpSDt34k7LYSmhKlvZb2SqPVn7TrjvYF4yaJzh9yILLQjzA0DHDMAGys
         Yz22wHP90NlruIB447EZDg3wjigWkS99ALoShbNFzTc6ek88b0oVbLzmQUjQf642oRpo
         ZSCgqY7pVrnWFpkwiAE1+Potsl4l4BOIAmPzQnLiWATbMXb63f2/eTs2xe5NQYP5MrTZ
         cXZqMjJAuQUbWchSSFepB+Wb/S9oD4RSQjrdB1RFT4yQ1iaZWcRrzi4Ry/zr4MKVIoxf
         ExGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662187; x=1796266987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BkTmeYNebhkrqLGwJXoMAq7CpBRUkvwi7hUAFtPicvg=;
        b=B8hvaxFTRn1LbYy+yIQKHpxbgrhPTRJng3nauwXdR96m8u0bw1EuIMPlqMmqb0iBGT
         I1cqlVGmUr7uf9GDYVKsEIwtRdgJZHs4yMzflmqv0KyfXRaaDunQJggsnQcxGzCwtvCb
         fAUFQQpbKq4neYLLeM0sKJaYcN/Au7c5nAKw5HnfJB0dvw70+xrR4tbeI1HLT9C5V78+
         rO+hRz/CLjEG36v4sfSWMC+cHNdtxfN32Bgxs31g18wxiwHuoG1xfSOfRWwbENzrD0v6
         mRqPmG6FYTRyi+PtocSSHMhD0+yQIPwHWErIOS2ayy1kqI4d4mlk+GHbJqzQuVdDl4VM
         ixIg==
X-Forwarded-Encrypted: i=1; AL+hErEE2ecxIUZD5eBeTrdOYINx2o6c8pWFT7EkmqyUqkpL17vHN27pgRLRiaNgwo+HuKLYrSga808x3yhXRg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8QUXLiVIEc8AYfb1SVsXODQZbAHMcg/B7920oIW451x+lo2Y2Y
	i4oHVbHt3XYkJ4WqcaFfKMgbJLEDd58DLMqSJoQ1AEIg4WK55geYjZpl
X-Gm-Gg: AZFdTZcMi43Wk7FBzYXTzo/RCPR1I9m1VNKQco2Xz4HEWS5iIBRrXBaduckjZiaXruL
	kEOFi5j4WAmf34qlH43mnNEzCdolsAYHewt2ptOZzOKHnMzCMuZW7WN6hZ4dpbfYKspzD1Khtxs
	2Q3AXEWutO8xxeLVh2IWcAdEJ4Vjbck/rIzOY5TG6mJS8peukoLWUPyaYHCaeJDa/JA7H/Ic0nC
	/3RjkmxMEX4zureaK6h24p7mOv730rNHjm2mpSibyZkFHqUCDtkx8HWynlQeifgp01u2o9NdhxY
	LyEEA5zCWVJSLGdSnZLVJSNKZ3Hy/F7kZhYWIqGLfnizu3xGQ0kX4ATlw1v8BsQ6b8ZHPd2Ui89
	/3sw7dn6gn1vE3e/U6y0gR6JRk1AE3e6APkcD7ODP/p4IQ59yjbgzYdsmVvtrNE6KqBgGPXHeua
	uSzY/DJUCYQFL6aI3HIp2Sm/vLSco1rK80eokdXg1qh6JT9vOg/KNfC+6+NUiTUwYjeQuMAxtX0
	S0IGztMAsWRvbLbmD8M8Az2yAE9ZZzIYfAXfWIRltvYfsuh4FMd6plP/mCxtjd+3FBLztnxys+k
	6x56H+8BFvF7Ch4qeb1nDItvT1STBWHasQ==
X-Received: by 2002:a05:6a00:18a0:b0:899:268e:c848 with SMTP id d2e1a72fcca58-8c87cc450e4mr17627128b3a.48.1795662186926;
        Wed, 25 Nov 2026 19:03:06 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm9231474b3a.23.2026.11.25.19.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:03:06 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Cc: cyan@meta.com,
	mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v2 2/2] riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 11:02:33 +0800
Message-Id: <20261126030233.2546274-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
 <20261126030233.2546274-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_190307_604780_2B71B6E2 
X-CRM114-Status: UNSURE (   9.89  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Like arm64, a compressed riscv boot image is decompressed by the
bootloader, not by the kernel itself.  The shared cmd_lz4 rule
passes -l, producing the legacy LZ4 format that only the kernel's
own decompressor understands, so U-Boot (boot/image.c image_decomp
-> lib/lz4_wrapper.c ulz4fn), which only accepts the standard LZ4
frame and returns -EPROTONOSUPPORT for anything else, cannot
decompress the Image.lz4 built today.

This matters in particular when CONFIG_KERNEL_LZ4 selects Image.lz4
as the default boot image via boot-image-$(CONFIG_KERNEL_LZ4) in
arch/riscv/Makefile.

Emit the standard frame through a local rule, leaving the shared
cmd_lz4 untouched for the in-kernel users.

Also pass -BI so the blocks stay independent regardless of what the
lz4 CLI defaults to in the future; deployed U-Boot decoders reject
linked blocks, and lz4 is considering linked blocks as a future
CLI default.  -BI was introduced in lz4 v1.9.0 - older lz4 versions
reject the flag but already default to independent blocks, so the
rule probes for -BI support first.  With current lz4 versions the
output is unchanged.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 arch/riscv/boot/Makefile | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index b80a077a8e8f..ab2b1b77e21d 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -33,8 +33,20 @@ $(obj)/loader: $(obj)/loader.o $(obj)/Image $(obj)/loader.lds FORCE
 $(obj)/Image.bz2: $(obj)/Image FORCE
 	$(call if_changed,bzip2)
 
+# U-Boot only accepts standard LZ4 frames with independent blocks;
+# probe -BI first because lz4 < 1.9.0 rejects the flag but already
+# defaults to independent blocks.
+ifeq ($(shell $(LZ4) -BI -V >/dev/null 2>&1 && echo y),y)
+  lz4-bi-flag := -BI
+else
+  lz4-bi-flag :=
+endif
+
+quiet_cmd_lz4_std = LZ4     $@
+      cmd_lz4_std = cat $(real-prereqs) | $(LZ4) $(lz4-bi-flag) -9 - - > $@
+
 $(obj)/Image.lz4: $(obj)/Image FORCE
-	$(call if_changed,lz4)
+	$(call if_changed,lz4_std)
 
 $(obj)/Image.lzma: $(obj)/Image FORCE
 	$(call if_changed,lzma)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
