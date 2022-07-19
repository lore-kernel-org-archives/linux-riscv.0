Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6412C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 10:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZtzqAuZdYhSZdNlhltJtaz7IiwSbqUUkSrcYVMZjHg=; b=Vq8+/3SBoJmeLw
	WdmHOEC3/FpBvFaRT9X3UbIq//Jbn9OmIlDrGWGREcrLRiNwYh/5If79P0R/08TUEvlHuyvrDQaAw
	MPEh5znrY6zD03jvFa6x8BdHIljlV7+QdFx3Sz31p5KgbjMGN2O+scLUvSDGKptOBX+RCq1SClvYx
	+OKvATOUWCXYyiHjFUHqy1LcdmNaDyyzgZhJ7gmAfoQ4dwbD3/Wuy4MPEJWmE99eYzS920XItWY8m
	1W0wRhRlNqkS4WeHXTUjUtjwvz0Rprb3z60DWZpIRLI8Rd239BtAEr+9tukFD2y1AQUoNdbF4iGHP
	t6GOF6CWzaA031TyvoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDktl-0087jS-Gu; Tue, 19 Jul 2022 10:56:17 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDktY-0087gI-M1; Tue, 19 Jul 2022 10:56:07 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d10so13169203pfd.9;
        Tue, 19 Jul 2022 03:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jqUQh3DjM8ZqS4zR5Pyl1XmHXdFMTXtpYO7CRcJ8kXc=;
        b=RXuqqdktl/r2ImUrJKyuAoct8ZkcUcMy1RfX1r3ogHvjuTmv6yOfd4kfYqBXFo+bQa
         VXbnqxtkJL3fISkD87xkYiKDDHnGeFk2JXjm2H7XMErajmikSr/lxMYr//5nz5iDt8Xe
         pMAKglNBxdLETytDYMuVKt5629G7RFy2U1luW0LVOWlLMOgc/uhzMRz5kgyM5D6xOsOi
         G8BH5lUnbxccLAfz3ohp/22C9UVwCNkLyeAF7PrOY5l0PP06frqlMOWsdjvcIln456eH
         5oAgexoSRCZtc89MtewsvSYxiLrvRq0bdQurtd4ftkz9tCoeLgC3/44IZplKHGhBTdpp
         YT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jqUQh3DjM8ZqS4zR5Pyl1XmHXdFMTXtpYO7CRcJ8kXc=;
        b=Fagm0Si8kGyaGS/NG16XND8YUq4zvbLCRuXMtyLXGO0DcFA7TzhrgXhz1yWtiKxCXE
         vBVOwYyiqJObEbtRZoNJ3+k19PK3Gf1XirvPG+D+Dj414aqmehhrx0PPwPcajBmMxIsD
         kzHgeIWAqQ1J5q3jjKGS7vkbPJ4BqKz5PMVMscQCYwe3CirJ7VZRSSAUNnvbN+/o82jd
         ufoi/t7z36Uvos7kpv6aCSAZXt8n8w5r1ByT5bfNITj0+6aSBK/1CXoINBbpQmLJoU+O
         Kma1BxkwRnsuTFZ9FwTCVXuxhB10GPVJ7TTksxKBdo3lqRDJg2SURTPDhwapiNFFMnFr
         jiIw==
X-Gm-Message-State: AJIora/elK0MnY5SAlEQpPBZzdr30iYzwTMwKLoRhqoklMD1EiKVYaly
	ul9hOhcOjfg2zzzl+9cvfFs=
X-Google-Smtp-Source: AGRyM1taRmeVEuAQW8FbPRjqRyf95XmuSzpjoAKvmlJSD5JGCH2/Bfg7Okm9KF9IPGvTp0P7uOE9wQ==
X-Received: by 2002:a63:84c7:0:b0:412:a0b2:3add with SMTP id k190-20020a6384c7000000b00412a0b23addmr28965015pgd.511.1658228160909;
        Tue, 19 Jul 2022 03:56:00 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id p7-20020a17090a748700b001ece55b938asm13291111pjk.32.2022.07.19.03.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 03:56:00 -0700 (PDT)
Date: Tue, 19 Jul 2022 19:55:58 +0900
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-csky@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-um <linux-um@lists.infradead.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] asm-generic: Add new pci.h and use it
Message-ID: <YtaNvpE7AA/4eV1I@antec>
References: <20220717033453.2896843-1-shorne@gmail.com>
 <20220717033453.2896843-3-shorne@gmail.com>
 <YtTjeEnKr8f8z4JS@infradead.org>
 <CAK8P3a1KJe4K5g1z-Faoxc9NhXqjCUWxnvk2HPxsj2wzG_iDbg@mail.gmail.com>
 <CAAfxs740yz1vJmtFHOPTXT6fqi0+37SR_OhoGsONe4mx_21+_g@mail.gmail.com>
 <CAK8P3a1Mo9+-t21rkP8SDnPrmbj3-uuVPtmHbeUerAevxN3TNw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Mo9+-t21rkP8SDnPrmbj3-uuVPtmHbeUerAevxN3TNw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_035604_753741_14A9DDD3 
X-CRM114-Status: GOOD (  30.11  )
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

On Tue, Jul 19, 2022 at 09:45:58AM +0200, Arnd Bergmann wrote:
> On Tue, Jul 19, 2022 at 1:19 AM Stafford Horne <shorne@gmail.com> wrote:
> > On Mon, Jul 18, 2022, 3:56 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> As mentioned before, it would be even better to just remove it
> >> entirely from everything except x86, and enclose the four
> >> references in an explicit "#ifdef X86_32". The variable declaration
> >> only exists because drivers/pci/quirks.c is compiled on all
> >> architecture, but the individual quirk is only active  based on
> >> the PCI device ID of certain early PCI-ISA bridges.
> >
> >
> > Ok, I was thinking of that route but once I saw the pci device IDs I
> > wasn't so sure it was limited to x86.  I'll go ahead with that approach.
> 
> Ok, thanks!
> 
> I checked all the PCI IDs yesterday, and I'm fairly sure they are x86
> specific. While some related products are general-purpose PCI-ISA
> bridges that have shown up on mips or arm boards, the ones listed
> here should all be safe.

This is what I have now, I will add a similar patch between 1/2 and 2/2, if this
looks ok.

It adds a few ifdef's which might be controversial but I think it provides more
cleanup than added complexity.  I compile tested with x86_64, x86_32 and
OpenRISC.

diff --git a/arch/alpha/include/asm/dma.h b/arch/alpha/include/asm/dma.h
index 28610ea7786d..a04d76b96089 100644
--- a/arch/alpha/include/asm/dma.h
+++ b/arch/alpha/include/asm/dma.h
@@ -365,13 +365,4 @@ extern void free_dma(unsigned int dmanr);	/* release it again */
 #define KERNEL_HAVE_CHECK_DMA
 extern int check_dma(unsigned int dmanr);
 
-/* From PCI */
-
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy 	(0)
-#endif
-
-
 #endif /* _ASM_DMA_H */
diff --git a/arch/arc/include/asm/dma.h b/arch/arc/include/asm/dma.h
index 5b744f4b10a7..02431027ed2f 100644
--- a/arch/arc/include/asm/dma.h
+++ b/arch/arc/include/asm/dma.h
@@ -7,10 +7,5 @@
 #define ASM_ARC_DMA_H
 
 #define MAX_DMA_ADDRESS 0xC0000000
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	0
-#endif
 
 #endif
diff --git a/arch/arm/include/asm/dma.h b/arch/arm/include/asm/dma.h
index a81dda65c576..907d139be431 100644
--- a/arch/arm/include/asm/dma.h
+++ b/arch/arm/include/asm/dma.h
@@ -143,10 +143,4 @@ extern int  get_dma_residue(unsigned int chan);
 
 #endif /* CONFIG_ISA_DMA_API */
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy    (0)
-#endif
-
 #endif /* __ASM_ARM_DMA_H */
diff --git a/arch/ia64/include/asm/dma.h b/arch/ia64/include/asm/dma.h
index 59625e9c1f9c..eaed2626ffda 100644
--- a/arch/ia64/include/asm/dma.h
+++ b/arch/ia64/include/asm/dma.h
@@ -12,8 +12,6 @@
 
 extern unsigned long MAX_DMA_ADDRESS;
 
-extern int isa_dma_bridge_buggy;
-
 #define free_dma(x)
 
 #endif /* _ASM_IA64_DMA_H */
diff --git a/arch/m68k/include/asm/dma.h b/arch/m68k/include/asm/dma.h
index f6c5e0dfb4e5..1c8d9c5bc2fa 100644
--- a/arch/m68k/include/asm/dma.h
+++ b/arch/m68k/include/asm/dma.h
@@ -6,10 +6,4 @@
    bootmem allocator (but this should do it for this) */
 #define MAX_DMA_ADDRESS PAGE_OFFSET
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy    (0)
-#endif
-
 #endif /* _M68K_DMA_H */
diff --git a/arch/microblaze/include/asm/dma.h b/arch/microblaze/include/asm/dma.h
index f801582be912..7484c9eb66c4 100644
--- a/arch/microblaze/include/asm/dma.h
+++ b/arch/microblaze/include/asm/dma.h
@@ -9,10 +9,4 @@
 /* Virtual address corresponding to last available physical memory address.  */
 #define MAX_DMA_ADDRESS (CONFIG_KERNEL_START + memory_size - 1)
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy     (0)
-#endif
-
 #endif /* _ASM_MICROBLAZE_DMA_H */
diff --git a/arch/mips/include/asm/dma.h b/arch/mips/include/asm/dma.h
index be726b943530..d6186e6bea7e 100644
--- a/arch/mips/include/asm/dma.h
+++ b/arch/mips/include/asm/dma.h
@@ -307,12 +307,4 @@ static __inline__ int get_dma_residue(unsigned int dmanr)
 extern int request_dma(unsigned int dmanr, const char * device_id);	/* reserve a DMA channel */
 extern void free_dma(unsigned int dmanr);	/* release it again */
 
-/* From PCI */
-
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* _ASM_DMA_H */
diff --git a/arch/parisc/include/asm/dma.h b/arch/parisc/include/asm/dma.h
index eea80ed34e6d..9e8c101de902 100644
--- a/arch/parisc/include/asm/dma.h
+++ b/arch/parisc/include/asm/dma.h
@@ -176,10 +176,4 @@ static __inline__ void set_dma_count(unsigned int dmanr, unsigned int count)
 
 #define free_dma(dmanr)
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy 	(0)
-#endif
-
 #endif /* _ASM_DMA_H */
diff --git a/arch/powerpc/include/asm/dma.h b/arch/powerpc/include/asm/dma.h
index 6161a9596196..d97c66d9ae34 100644
--- a/arch/powerpc/include/asm/dma.h
+++ b/arch/powerpc/include/asm/dma.h
@@ -340,11 +340,5 @@ extern int request_dma(unsigned int dmanr, const char *device_id);
 /* release it again */
 extern void free_dma(unsigned int dmanr);
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* __KERNEL__ */
 #endif	/* _ASM_POWERPC_DMA_H */
diff --git a/arch/s390/include/asm/dma.h b/arch/s390/include/asm/dma.h
index 6f26f35d4a71..dec1c4ce628c 100644
--- a/arch/s390/include/asm/dma.h
+++ b/arch/s390/include/asm/dma.h
@@ -11,10 +11,4 @@
  */
 #define MAX_DMA_ADDRESS         0x80000000
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* _ASM_S390_DMA_H */
diff --git a/arch/sh/include/asm/dma.h b/arch/sh/include/asm/dma.h
index 17d23ae98c77..c8bee3f985a2 100644
--- a/arch/sh/include/asm/dma.h
+++ b/arch/sh/include/asm/dma.h
@@ -137,10 +137,4 @@ extern int register_chan_caps(const char *dmac, struct dma_chan_caps *capslist);
 extern int dma_create_sysfs_files(struct dma_channel *, struct dma_info *);
 extern void dma_remove_sysfs_files(struct dma_channel *, struct dma_info *);
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* __ASM_SH_DMA_H */
diff --git a/arch/sparc/include/asm/dma.h b/arch/sparc/include/asm/dma.h
index 462e7c794a09..08043f35b110 100644
--- a/arch/sparc/include/asm/dma.h
+++ b/arch/sparc/include/asm/dma.h
@@ -82,14 +82,6 @@
 #define DMA_BURST64      0x40
 #define DMA_BURSTBITS    0x7f
 
-/* From PCI */
-
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy 	(0)
-#endif
-
 #ifdef CONFIG_SPARC32
 struct device;
 
diff --git a/arch/x86/include/asm/dma.h b/arch/x86/include/asm/dma.h
index 8e95aa4b0d17..0c34c658f57d 100644
--- a/arch/x86/include/asm/dma.h
+++ b/arch/x86/include/asm/dma.h
@@ -309,10 +309,12 @@ extern void free_dma(unsigned int dmanr);
 
 /* From PCI */
 
+#ifdef CONFIG_X86_32
 #ifdef CONFIG_PCI
 extern int isa_dma_bridge_buggy;
 #else
 #define isa_dma_bridge_buggy	(0)
-#endif
+#endif /* CONFIG_PCI */
+#endif /* CONFIG_X86_32 */
 
 #endif /* _ASM_X86_DMA_H */
diff --git a/arch/xtensa/include/asm/dma.h b/arch/xtensa/include/asm/dma.h
index bb099a373b5a..172644539032 100644
--- a/arch/xtensa/include/asm/dma.h
+++ b/arch/xtensa/include/asm/dma.h
@@ -52,11 +52,4 @@
 extern int request_dma(unsigned int dmanr, const char * device_id);
 extern void free_dma(unsigned int dmanr);
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy 	(0)
-#endif
-
-
 #endif
diff --git a/drivers/comedi/drivers/comedi_isadma.c b/drivers/comedi/drivers/comedi_isadma.c
index 700982464c53..508421809128 100644
--- a/drivers/comedi/drivers/comedi_isadma.c
+++ b/drivers/comedi/drivers/comedi_isadma.c
@@ -104,8 +104,10 @@ unsigned int comedi_isadma_poll(struct comedi_isadma *dma)
 
 	flags = claim_dma_lock();
 	clear_dma_ff(desc->chan);
+#ifdef CONFIG_X86_32
 	if (!isa_dma_bridge_buggy)
 		disable_dma(desc->chan);
+#endif
 	result = get_dma_residue(desc->chan);
 	/*
 	 * Read the counter again and choose higher value in order to
@@ -113,8 +115,10 @@ unsigned int comedi_isadma_poll(struct comedi_isadma *dma)
 	 * isa_dma_bridge_buggy is set.
 	 */
 	result1 = get_dma_residue(desc->chan);
+#ifdef CONFIG_X86_32
 	if (!isa_dma_bridge_buggy)
 		enable_dma(desc->chan);
+#endif
 	release_dma_lock(flags);
 
 	if (result < result1)
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index cfaf40a540a8..60c55d2cb2cc 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -41,8 +41,10 @@ const char *pci_power_names[] = {
 };
 EXPORT_SYMBOL_GPL(pci_power_names);
 
+#ifdef CONFIG_X86_32
 int isa_dma_bridge_buggy;
 EXPORT_SYMBOL(isa_dma_bridge_buggy);
+#endif
 
 int pci_pci_problems;
 EXPORT_SYMBOL(pci_pci_problems);
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 41aeaa235132..cb7715a0f339 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -239,6 +239,7 @@ static void quirk_passive_release(struct pci_dev *dev)
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_82441,	quirk_passive_release);
 DECLARE_PCI_FIXUP_RESUME(PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_82441,	quirk_passive_release);
 
+#ifdef CONFIG_X86_32
 /*
  * The VIA VP2/VP3/MVP3 seem to have some 'features'. There may be a
  * workaround but VIA don't answer queries. If you happen to have good
@@ -265,6 +266,7 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AL,	PCI_DEVICE_ID_AL_M1533,		quirk_isa_dma
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NEC,	PCI_DEVICE_ID_NEC_CBUS_1,	quirk_isa_dma_hangs);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NEC,	PCI_DEVICE_ID_NEC_CBUS_2,	quirk_isa_dma_hangs);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NEC,	PCI_DEVICE_ID_NEC_CBUS_3,	quirk_isa_dma_hangs);
+#endif
 
 /*
  * Intel NM10 "TigerPoint" LPC PM1a_STS.BM_STS must be clear
diff --git a/include/asm-generic/pci.h b/include/asm-generic/pci.h
index 556147983911..3ceb0cb12321 100644
--- a/include/asm-generic/pci.h
+++ b/include/asm-generic/pci.h
@@ -18,8 +18,6 @@
 #define pcibios_assign_all_busses() 1
 #endif
 
-extern int isa_dma_bridge_buggy;
-
 /* Enable generic resource mapping code in drivers/pci/ */
 #define ARCH_GENERIC_PCI_MMAP_RESOURCE
 
diff --git a/sound/core/isadma.c b/sound/core/isadma.c
index 1f45ede023b4..8a6397109c56 100644
--- a/sound/core/isadma.c
+++ b/sound/core/isadma.c
@@ -73,8 +73,10 @@ unsigned int snd_dma_pointer(unsigned long dma, unsigned int size)
 
 	flags = claim_dma_lock();
 	clear_dma_ff(dma);
+#ifdef CONFIG_X86_32
 	if (!isa_dma_bridge_buggy)
 		disable_dma(dma);
+#endif
 	result = get_dma_residue(dma);
 	/*
 	 * HACK - read the counter again and choose higher value in order to
@@ -82,8 +84,10 @@ unsigned int snd_dma_pointer(unsigned long dma, unsigned int size)
 	 * isa_dma_bridge_buggy is set.
 	 */
 	result1 = get_dma_residue(dma);
+#ifdef CONFIG_X86_32
 	if (!isa_dma_bridge_buggy)
 		enable_dma(dma);
+#endif
 	release_dma_lock(flags);
 	if (unlikely(result < result1))
 		result = result1;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
