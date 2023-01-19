Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B101BC6379F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8HDG1Ml8ouenZjFyR2o044kCWiX8JRWES+7BY60KIQ=; b=bwuEEMc9DjNRSj
	dWKR4vpNi+nZlu88Wjw3SOgxRT7je0Lr+yNEyM3qxItcZMxg/KUaGnx+m0VWhY5noRIX3FDbFrsSW
	sXWtVd1ap9qwr9jJ0U8KNClJ8QdHZlTTPiaxw+dfrnGSv+VQsr4Kh32s4a4YWwiHVnioqEq4BFrX8
	caPv0qFIwi8tkZ2qjrkDLlGOwsZwesnnkFN72HA2ADwUDuCYpcfEWxheZMTn8O97Ix8rjfsQweWsb
	F2Jr3+WKMtn+TevJ5QiaO1lgq7/6dr+/CYdgScjYSgYFSJydEcG8N0XPKEOlYcHQWBpZ/rH+xmBk6
	RUhoxEBjqdb34hXfa4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXPg-005q14-BC; Thu, 19 Jan 2023 16:05:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXPC-005poB-Qg
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 16:04:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6081E61CB2;
	Thu, 19 Jan 2023 16:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2773FC433EF;
	Thu, 19 Jan 2023 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674144285;
	bh=pK9Wljug0Rn52ySou16paWAQsJuCdZT50slSKiioR6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I2M7OjAvb5J/bLEAc1b32Jtbukywae8404syAwBYwhKyD3JPidlY3A/Es8gJ9BQAu
	 Qp3p/b4rqgs8vNq/1frbEJyI3+RM1MtOo9DD/VCKW2lRBqscBhmIZpxiSHWL2aY4Pw
	 RdH4jlK74S/mq0YVuTN1YkdGZzaCjh8SJmPJyJkqoidzKDfoxrLjAhOxPLwnmmwJ9V
	 a3b/giUqbhV9myKXy0jPD8f6ZNFRvNZw9GTjnogGUilLxlvCG3/kvhLhBy79ECywzy
	 XiMevmoyYtgRE3B/EnERlqPBLQH5PPSmaelHe/isPHMXpPMzdRh02oY/k0x3sc7Y4L
	 Jqvc86erhRayw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] riscv: vmlinux.lds.S: explicitly catch .init.bss sections from EFI stub
Date: Thu, 19 Jan 2023 23:54:16 +0800
Message-Id: <20230119155417.2600-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119155417.2600-1-jszhang@kernel.org>
References: <20230119155417.2600-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_080447_176572_6B92C1B2 
X-CRM114-Status: UNSURE (   9.96  )
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

When enabling linker orphan section warning, I got warnings similar as
below:
ld.lld: warning:
./drivers/firmware/efi/libstub/lib.a(efi-stub-helper.stub.o):(.init.bss)
is being placed in '.init.bss'

Catch the sections so that we can enable linker orphan section warning.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 7eb3d25d0dae..b2813b5e47a0 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -87,6 +87,9 @@ SECTIONS
 	/* Start of init data section */
 	__init_data_begin = .;
 	INIT_DATA_SECTION(16)
+	.init.bss : {
+		*(.init.bss)	/* from the EFI stub */
+	}
 	.exit.data :
 	{
 		EXIT_DATA
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
