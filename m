Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65C0C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 18:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BUrI0UqdeKi1BFuI+7LuBNHmnqUgIh5qkrYeOGTOs3E=; b=vRfaPbgxWC8QoO
	60WHTcc5apWULazu3HMAn6AlPDR2dh/2RV+5gbIRJbYhAZm/IBtbUohQLuAyWWKIO8S8xR7VDRiHG
	Wt348hi1bv0Qs4KYuQBJQf2Um4MTWdvPSNXAnpa15zZ73CEZaNFEF0QQWEVFgsT9a9HVA1VrHFRSd
	N8SghKqvjoKFDgVcmyFrI45pICX6WsWQQacj97Iq9C871BY5LBDMMvt/S3k2wAQGTdtHsE8N4YtQQ
	e5TB9+uDM1e2Ybw52dzMi26uB2CCM67tQdslQzn/PqmYf46UO2z76MBWneMd7PB/y/xxHLqfmEQrV
	vfxthmfJrCrA1y7TXJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6y6J-006sOz-2D;
	Wed, 07 Jun 2023 18:41:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6y6H-006sO4-0m
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 18:41:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9CA6A63BB8;
	Wed,  7 Jun 2023 18:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF79C433EF;
	Wed,  7 Jun 2023 18:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686163300;
	bh=FMIrMDkkbrc7ewKcGZQ+8+8zBkRdDfwj755JEnjZJxY=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=M29dsddKgVo2OUsqtVT9PEx58laR+B4qKPt2B5C4KwVSLpc/3VojfB+gWwAxTFy52
	 kGbn7XOnXcT2I4nWUn12Qgp9R8PP/bd2Z+oGGIou0LZE1RTqBIz/kpQlY/o/AM7D8W
	 F2ylryYOYZl6Vp9y1I6aPzl+P0QMeB5uRvQ8z0G0=
Subject: Patch "riscv: vmlinux.lds.S: Explicitly handle '.got' section" has been added to the 6.3-stable tree
To: aou@eecs.berkeley.edu,conor.dooley@microchip.com,conor@kernel.org,gregkh@linuxfoundation.org,linux-riscv@lists.infradead.org,llvm@lists.linux.dev,nathan@kernel.org,ndesaulniers@google.com,palmer@dabbelt.com,patches@lists.linux.dev,paul.walmsley@sifive.com,sashal@kernel.org,trix@redhat.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 07 Jun 2023 20:41:28 +0200
In-Reply-To: <20230605-6-3-riscv-got-orphan-warning-llvm-17-v1-1-72c4f11e020f@kernel.org>
Message-ID: <2023060727-sphinx-obtain-935a@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_114141_368651_4777B296 
X-CRM114-Status: GOOD (  14.52  )
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


This is a note to let you know that I've just added the patch titled

    riscv: vmlinux.lds.S: Explicitly handle '.got' section

to the 6.3-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     riscv-vmlinux.lds.s-explicitly-handle-.got-section.patch
and it can be found in the queue-6.3 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org  Wed Jun  7 20:32:10 2023
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 05 Jun 2023 14:15:08 -0700
Subject: riscv: vmlinux.lds.S: Explicitly handle '.got' section
To: gregkh@linuxfoundation.org, sashal@kernel.org, palmer@dabbelt.com, conor@kernel.org
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu, ndesaulniers@google.com, trix@redhat.com, stable@vger.kernel.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Message-ID: <20230605-6-3-riscv-got-orphan-warning-llvm-17-v1-1-72c4f11e020f@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

This patch is for linux-6.3.y only, it has no direct mainline
equivalent.

LLVM 17 will now use the GOT for extern weak symbols when using the
medany model, which causes a linker orphan section warning on
linux-6.3.y:

  ld.lld: warning: <internal>:(.got) is being placed in '.got'

This is not an issue in mainline because handling of the .got section
was added by commit 39b33072941f ("riscv: Introduce CONFIG_RELOCATABLE")
and further extended by commit 26e7aacb83df ("riscv: Allow to downgrade
paging mode from the command line") in 6.4-rc1. Neither of these changes
are suitable for stable, so add explicit handling of the .got section in
a standalone change to align 6.3 and mainline, which addresses the
warning.

This is only an issue for 6.3 because commit f4b71bff8d85 ("riscv:
select ARCH_WANT_LD_ORPHAN_WARN for !XIP_KERNEL") landed in 6.3-rc1, so
earlier releases will not see this warning because it will not be
enabled.

Closes: https://github.com/ClangBuiltLinux/linux/issues/1865
Link: https://github.com/llvm/llvm-project/commit/a178ba9fbd0a27057dc2fa4cb53c76caa013caac
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/riscv/kernel/vmlinux.lds.S |    2 ++
 1 file changed, 2 insertions(+)

--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -129,6 +129,8 @@ SECTIONS
 		*(.sdata*)
 	}
 
+	.got : { *(.got*) }
+
 #ifdef CONFIG_EFI
 	.pecoff_edata_padding : { BYTE(0); . = ALIGN(PECOFF_FILE_ALIGNMENT); }
 	__pecoff_data_raw_size = ABSOLUTE(. - __pecoff_text_end);


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-6.3/riscv-vmlinux.lds.s-explicitly-handle-.got-section.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
