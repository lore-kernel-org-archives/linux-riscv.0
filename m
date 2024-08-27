Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F81DC5472F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 17:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZnLhUKI+89F7SowbUm2ZcUSWFJNoTINhCrclto/p7IU=; b=iZHFLo4kqWBXa5
	i/MT6SW360C//JkeTRgI3sFhCNV6NMY1NgyXdvyUFxf/RS2acxFLne64GyA+EV2Z26/wNbM2mk2cz
	kz5Yfp0sqcWIEWcSyf+MzvVt0x42Ly38O06X9rPF7Z7H/fHzDpy9fkS/zBOS7n7UVsJ/H/aPQnooU
	iSwduP3yMgMP8i9y+o5/x+866+QrhUwbDg1Zdfv4cQzZLkY75GSkI7VlXCYc32GHiffDJwst26QOl
	HFB7ekLiSbzySRRBUhIy9eDTOaAWzbcVHpG+cSKr+b5DTwrX8U8JGbJVRipvM1KKuBtzZcoFnG8fI
	C95cNOQtsW54VpNNMCEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0J1-0000000CM9p-1pja;
	Tue, 27 Aug 2024 17:48:35 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0Id-0000000CLzL-3PJr
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 17:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1724780884; bh=Bkd8gFeLSf6g7a8IsJ2hm/2hCok13/+tTgniHLVL1lU=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=ExfsgvKrjIaXGs2ha3dh2uIpv6csDYSum/0rJ7Xe+++TS0U+QDteYeefBMK2FPRaO
	 352N3txmwOu7or2e/iBmaGIjzB7vsiNvWpIQ0d1tIckVUQqF45yvm53GLD+O0rhFwN
	 KlP6zrIwH/DEc7FJL6l5xI5+5Z27XuaSYhL7gL2c=
Received: from smtpclient.apple ([2408:8207:18a0:bb80:79e5:c8db:9406:ceaa])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id BFB9A4CC; Wed, 28 Aug 2024 01:47:59 +0800
X-QQ-mid: xmsmtpt1724780879tjalo6r6g
Message-ID: <tencent_04EADAB08E75B88431FB219C8D757C108208@qq.com>
X-QQ-XMAILINFO: MLAWG7dqOaka7Nb1xVPHfb7JG1kJ36BetyPhzCvbVVudcp9kJlLa/63mWQq6j+
	 PyMBi6irRz/tB3D2gbm4frIj4bkIxUA88BqEfbp8++n9BomqVAm3Ok1b1bFESGUqcKQFnuVqzgqu
	 uf9XC4JO2s8QWQEXs2i5sJIy//O+3xlRpotgqrgQBesW3Mp4z6rBwVRYQXME31bRN7cn0dtIpW8P
	 zzb0FYkxVhpckNC7MlY56ruTQiX4EpkJDGh9paXNSmrnEtNceHydRXPh4z7Sk4U95VLZHymOS4Hl
	 HEOiuzSGGBq5e3wl6/vry+qddJx6qQVFQO42+vBm+2S3YQGvGdIN4KGlwNJ2YR+onBKAVlTsciIP
	 bG99SSqX6gO0gY86ZRGxrOGPXVOpmmRYL4sXrwhCn9UCeCsuHbbgg0Yk1h9xOBk6QcJi7ZUz6Fa4
	 1oUlnFUldVMc1CMZRrDIpq1OeVJiWOB9OKSpu9kRa2PLbMtIyKKhJ8HkRy5kwpGv+jsP/sCQsjSv
	 ozrUk/LH7HhS95+RoU66X8Z9EONiOiQzYminWziZ891oQNqJ064ZcsPEOT2iWGKPkRqgbC2Ce/lb
	 8K68b9TuleTQ4IuxicfoVgj+k7b+mRVrjh6xUMzQxlQm/NogJqEAdsjTTEstlRLq0jXcbvaA86g2
	 S0Rw6SuK+rI4+KC+YkfMc9x812AzZe5KOey7hlPrxn3Yk/vMAyzghjOly8P4jVn9laXFxDFerCat
	 Bj0XzKQwGOoRqd25wMMGqIY+LQv/NRd3wqi31XKPdKZsHdJNNoqdsbjGEsA+rgdF16avD3ifx6F/
	 hgMygs0wZ9eeBQrpm1a0+MwxbE47mRBnzXffGzlwBGAMRRNqsy2kaOOf4C0OqSvBSMyWqc23AT61
	 5nPMr0uACHb9W98Qz4JzSNB3ZuXIC+VzF06UObRzAwZL9yXsOXVVEo29u9gedObJkqibAy+0ZARC
	 QWEUQ5cyrGooI5WucgLmLHIgsJTpxdnvrIdpzdwnjTwHi9s2/R/ije9mPz4nECFgtcZndfcgLHNm
	 HaH4ozseKt4cVlTzZ5oX6IftKSuUqUzmEVM4l2NPli6cHU8lnw
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v3 0/3] RISC-V: mm: do not treat hint addr on mmap as the
 upper bound to search
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <mhng-a7dcdfb5-0232-4ffb-8a20-13e564904da1@palmer-ri-x1c9a>
Date: Wed, 28 Aug 2024 01:47:49 +0800
Cc: linux-riscv@lists.infradead.org,
 Charlie Jenkins <charlie@rivosinc.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Shuah Khan <shuah@kernel.org>,
 Levi Zim <rsworktech@outlook.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 linux-doc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
X-OQ-MSGID: <05A72DDA-F689-403F-9214-6392AB6B5C29@cyyself.name>
References: <mhng-a7dcdfb5-0232-4ffb-8a20-13e564904da1@palmer-ri-x1c9a>
To: Palmer Dabbelt <palmer@rivosinc.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_104812_217477_BCE2AB03 
X-CRM114-Status: GOOD (  29.38  )
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



> On Aug 28, 2024, at 00:33, Palmer Dabbelt <palmer@rivosinc.com> wrote:
> 
> On Tue, 27 Aug 2024 01:05:15 PDT (-0700), cyy@cyyself.name wrote:
>> Previous patch series[1][2] changes a mmap behavior that treats the hint
>> address as the upper bound of the mmap address range. The motivation of the
>> previous patch series is that some user space software may assume 48-bit
>> address space and use higher bits to encode some information, which may
>> collide with large virtual address space mmap may return. However, to make
>> sv48 by default, we don't need to change the meaning of the hint address on
>> mmap as the upper bound of the mmap address range. This behavior breaks
>> some user space software like Chromium that gets ENOMEM error when the hint
>> address + size is not big enough, as specified in [3].
>> 
>> Other ISAs with larger than 48-bit virtual address space like x86, arm64,
>> and powerpc do not have this special mmap behavior on hint address. They
>> all just make 48-bit / 47-bit virtual address space by default, and if a
>> user space software wants to large virtual address space, it only need to
>> specify a hint address larger than 48-bit / 47-bit.
>> 
>> Thus, this patch series change mmap to use sv48 by default but does not
>> treat the hint address as the upper bound of the mmap address range. After
>> this patch, the behavior of mmap will align with existing behavior on other
>> ISAs with larger than 48-bit virtual address space like x86, arm64, and
>> powerpc. The user space software will no longer need to rewrite their code
>> to fit with this special mmap behavior only on RISC-V.
> 
> So it actually looks like we just screwed up the original version of this: the reason we went with the more complicated address splits were than we actually started with a defacto 39-bit page table uABI (ie 38-bit user VAs), and moving to even 48-bit page tables (ie, 47-bit user VAs) broke users (here's an ASAN bug, for example: https://github.com/google/android-riscv64/issues/64).  
> Unless I'm missing something, though, the code doesn't actually do that.  I remember having that discussion at some point, but I must have forgotten to make sure it worked.  As far as I can tell we've just moved to the 48-bit VAs by default, which breaks the whole point of doing the compatibilty stuff.  Probably a good sign I need to pay more attention to this stuff.
> 

It seems the issues have been solved in LLVM D139823 [1] and LLVM D152895 [2].

[1] https://reviews.llvm.org/D139823
[2] https://reviews.llvm.org/D152895

> So I'm not really sure what to do here: we can just copy the arm64 behavior at tell the other users that's just how things work, but then we're just pushing around breakages.  At a certain point all we can really do with this hint stuff is push around problems, though, and at least if we copy arm64 then most of those problems get reported as bugs for us.
> 
>> Note: Charlie also created another series [4] to completely remove the
>> arch_get_mmap_end and arch_get_mmap_base behavior based on the hint address
>> and size. However, this will cause programs like Go and Java, which need to
>> store information in the higher bits of the pointer, to fail on Sv57
>> machines.
>> 
>> Changes in v3:
>> - Rebase to newest master
>> - Changes some information in cover letter after patchset [2]
>> - Use patch [5] to patch selftests
>> - Link to v2: https://lore.kernel.org/linux-riscv/tencent_B2D0435BC011135736262764B511994F4805@qq.com/
>> 
>> Changes in v2:
>> - correct arch_get_mmap_end and arch_get_mmap_base
>> - Add description in documentation about mmap behavior on kernel v6.6-6.7.
>> - Improve commit message and cover letter
>> - Rebase to newest riscv/for-next branch
>> - Link to v1: https://lore.kernel.org/linux-riscv/tencent_F3B3B5AB1C9D704763CA423E1A41F8BE0509@qq.com/
>> 
>> [1] https://lore.kernel.org/linux-riscv/20230809232218.849726-1-charlie@rivosinc.com/
>> [2] https://lore.kernel.org/linux-riscv/20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com/
>> [3] https://lore.kernel.org/linux-riscv/MEYP282MB2312A08FF95D44014AB78411C68D2@MEYP282MB2312.AUSP282.PROD.OUTLOOK.COM/
>> [4] https://lore.kernel.org/linux-riscv/20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com/
>> [5] https://lore.kernel.org/linux-riscv/20240826-riscv_mmap-v1-2-cd8962afe47f@rivosinc.com/
>> 
>> Charlie Jenkins (1):
>>  riscv: selftests: Remove mmap hint address checks
>> 
>> Yangyu Chen (2):
>>  RISC-V: mm: not use hint addr as upper bound
>>  Documentation: riscv: correct sv57 kernel behavior
>> 
>> Documentation/arch/riscv/vm-layout.rst        | 43 ++++++++----
>> arch/riscv/include/asm/processor.h            | 20 ++----
>> .../selftests/riscv/mm/mmap_bottomup.c        |  2 -
>> .../testing/selftests/riscv/mm/mmap_default.c |  2 -
>> tools/testing/selftests/riscv/mm/mmap_test.h  | 67 -------------------
>> 5 files changed, 36 insertions(+), 98 deletions(-)



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
