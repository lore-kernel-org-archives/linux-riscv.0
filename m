Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3189C32771
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckWnyZvALje7WOjXfdgboxPpmLtpOF7Ee4zhps0vv+s=; b=BsP1MKieRLwbjY
	oezk78Wb8XDkDUI12y9PPy+qXJ0tq3VHLae2PexFm+W/oOl7oH5OMKu//n4GZq/EXeHroSNgdyMZp
	3EaHnUtYBvG5PtkhkjutJLueMxOEfKdLwme9O1ICloOLnnzk1W1cN17JmiOS/tOa23p0R8c7C1uIJ
	gDPVGYEmZyoClbT7lMNeXB4mzH4K4+YJvaIbyrLniIR3Yu5xeWN4VOuqqLC63cHVHuH+KIjKA9OY7
	IH8eE6LaKvfCWwQEApUnif9uzajeKgVIaYP2pwUf0OXOS2jmlxzK3h0A8RWKpYHW99F2V58YXSTF4
	zya97k9SqqUVNMnN7LgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwbl-000G3K-I8; Sun, 18 Sep 2022 15:53:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwbh-000Fyg-L3
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 15:53:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4F8E2B81055;
	Sun, 18 Sep 2022 15:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02694C4347C;
	Sun, 18 Sep 2022 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663516399;
	bh=DEvoceoa51GjIrkhPQ7BHRzc0Y6qi+1P763yh9ux/40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JhFp5reJF9cDjf6/Si7RZI2tQrtbVPM2/vkE9VqbSilKbjOwao9QPp9VVbaSzLjVK
	 5Hbi5RWAzZMu3RmFzF6m/Qc9mjN7BLH9LONJmoeuIn8NNblCMG+k54WHtlwXpUY2DZ
	 0dw3QcGiQJK7GNyIUMglnrWxoJPYuhEjIUKsnWuDADZ7tLffzpiniQry2Y4tXJyuV4
	 oanQqNfESqmHGvoIEQMsoNGk9owY3A7lzgAG5igr+oVSKbTjjMwC6DYTvlN+EEauSJ
	 BE6YhfVquM63iesh6Y6WMyswwdnQvDjnpvyJQEwhhE0sSjl4u4It5YFtTi7AFsGKbU
	 3t6JM1U57qUSw==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Borislav Petkov <bp@alien8.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH V5 04/11] compiler_types.h: Add __noinstr_section() for noinstr
Date: Sun, 18 Sep 2022 11:52:39 -0400
Message-Id: <20220918155246.1203293-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220918155246.1203293-1-guoren@kernel.org>
References: <20220918155246.1203293-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_085321_884175_D05D899C 
X-CRM114-Status: GOOD (  11.15  )
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

From: Lai Jiangshan <laijs@linux.alibaba.com>

And it will be extended for C entry code.

Cc: Borislav Petkov <bp@alien8.de>
Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 include/linux/compiler_types.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 4f2a819fd60a..e9ce11ea4d8b 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -227,9 +227,11 @@ struct ftrace_likely_data {
 #endif
 
 /* Section for code which can't be instrumented at all */
-#define noinstr								\
-	noinline notrace __attribute((__section__(".noinstr.text")))	\
-	__no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage
+#define __noinstr_section(section)				\
+	noinline notrace __section(section) __no_profile	\
+	__no_kcsan __no_sanitize_address __no_sanitize_coverage
+
+#define noinstr __noinstr_section(".noinstr.text")
 
 #endif /* __KERNEL__ */
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
