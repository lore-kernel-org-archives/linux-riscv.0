Return-Path: <SRS0=q/zc=LH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C096CC48BCF
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 17:12:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27E9A61107
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 17:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27E9A61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8TRziaErQ7VAjekALiOtJmEeNK5jLaLA/iEEPx79Lo=; b=L5rP/OfajvfYpO
	DTTyFcj5Xj5N8WwjSJ3l0kSb5P03bkLFdoChEoJZHL2EapSLByV1mCm5PgKus+XYlHLIUX/8ftia8
	mS4H0nlxwjQ2rOZ26rvCVLMKuj2JbPtPIzQWGbo7moewH772I/TC3GiNuUgcEpN733t0km/IgAyMw
	k/Z9H0QopN+avHF2k+/QdsS8KD28nf4GZYeKEI+bl+mcIjzEYbjG4lQPyMDNGX5qEIjPnYgUelL79
	qqeN5RXIILB7fRyZFVKCJ5rkYFXtsjLg7AL0wiCebYRlRbOejA4j0raFNBluVhz25mHmtBeKzBCsl
	WtiUt9Ewl9Yl4TlVV4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsTeO-00AqPn-HY; Sun, 13 Jun 2021 17:11:56 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsTeH-00AqPR-34
 for linux-riscv@lists.infradead.org; Sun, 13 Jun 2021 17:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=9YrEcNG/N2YFUqtgoD+2CSLrFOJntdnn7M
 Cq89XsJdc=; b=oZ8DSkyl3+yzFHd/bMM1IVyZR4lHE4DiiDHKsVLWkCHYILS2SF
 xqU3nsWL92FjLm8qwLrgL7LPMQWfHnVLRWkWOM/qBCEYJtlOiAm75Yseriobp9hY
 u220xym9G2f7sidk/jOrCjv269pdfSloeqBcTIit4McfRTumFBZkhXhCI=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygCHj1s2PMZgI9DTAA--.35616S2; 
 Mon, 14 Jun 2021 01:11:19 +0800 (CST)
Date: Mon, 14 Jun 2021 01:05:46 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu
 <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH 7/9] riscv: bpf: Avoid breaking W^X
Message-ID: <20210614010546.7a0d5584@xhacker>
In-Reply-To: <87bl8cqrpv.fsf@igel.home>
References: <20210330022144.150edc6e@xhacker> <20210330022521.2a904a8c@xhacker>
 <87o8ccqypw.fsf@igel.home> <20210612002334.6af72545@xhacker>
 <87bl8cqrpv.fsf@igel.home>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygCHj1s2PMZgI9DTAA--.35616S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1fKF4UZF1fWF17XFW3Awb_yoW5XF4fpr
 1UCFWfKryvqr1Ig348Z3sF93Wjvw13J3sxKrsxXFyUAa1IqF1kZw1YgFW3JrnFqF4xK3y0
 9rW29rsava95Zw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkGb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
 wI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07b5sjbUUU
 UU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_101149_767333_E0A54630 
X-CRM114-Status: GOOD (  16.27  )
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

Hi,

On Fri, 11 Jun 2021 18:41:16 +0200
Andreas Schwab <schwab@linux-m68k.org> wrote:

> On Jun 12 2021, Jisheng Zhang wrote:
> 
> > I reproduced an kernel panic with the defconfig on qemu, but I'm not sure whether
> > this is the issue you saw, I will check.
> >
> >     0.161959] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
> > [    0.167028] pinctrl core: initialized pinctrl subsystem
> > [    0.190727] Unable to handle kernel paging request at virtual address ffffffff81651bd8
> > [    0.191361] Oops [#1]
> > [    0.191509] Modules linked in:
> > [    0.191814] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc5-default+ #3
> > [    0.192179] Hardware name: riscv-virtio,qemu (DT)
> > [    0.192492] epc : __memset+0xc4/0xfc
> > [    0.192712]  ra : skb_flow_dissector_init+0x22/0x86  
> 
> Yes, that's the same.
> 
> Andreas.
> 

I think I found the root cause: commit 2bfc6cd81bd ("move kernel mapping
outside of linear mapping") moves BPF JIT region after the kernel:

#define BPF_JIT_REGION_START   PFN_ALIGN((unsigned long)&_end)

The &_end is unlikely aligned with PMD SIZE, so the front bpf jit region
sits with kernel .data section in one PMD. But kenrel is mapped in PMD SIZE,
so when bpf_jit_binary_lock_ro() is called to make the first bpf jit prog
ROX, we will make part of kernel .data section RO too, so when we write, for example
memset the .data section, MMU will trigger store page fault.

To fix the issue, we need to make the bpf jit region PMD size aligned by either
patch BPF_JIT_REGION_START to align on PMD size rather than PAGE SIZE, or
something as below patch to move the BPF region before modules region:

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9469f464e71a..997b894edbc2 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -31,8 +31,8 @@
 #define BPF_JIT_REGION_SIZE	(SZ_128M)
 #ifdef CONFIG_64BIT
 /* KASLR should leave at least 128MB for BPF after the kernel */
-#define BPF_JIT_REGION_START	PFN_ALIGN((unsigned long)&_end)
-#define BPF_JIT_REGION_END	(BPF_JIT_REGION_START + BPF_JIT_REGION_SIZE)
+#define BPF_JIT_REGION_START	(BPF_JIT_REGION_END - BPF_JIT_REGION_SIZE)
+#define BPF_JIT_REGION_END	(MODULES_VADDR)
 #else
 #define BPF_JIT_REGION_START	(PAGE_OFFSET - BPF_JIT_REGION_SIZE)
 #define BPF_JIT_REGION_END	(VMALLOC_END)
@@ -40,8 +40,8 @@
 
 /* Modules always live before the kernel */
 #ifdef CONFIG_64BIT
-#define MODULES_VADDR	(PFN_ALIGN((unsigned long)&_end) - SZ_2G)
 #define MODULES_END	(PFN_ALIGN((unsigned long)&_start))
+#define MODULES_VADDR	(MODULES_END - SZ_128M)
 #endif
 
 
can you please try it? Per my test, the issue is fixed.

Thanks



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
