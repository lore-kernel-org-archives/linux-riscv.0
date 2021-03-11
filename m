Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FFCC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 15:30:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A961A64E3F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 15:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A961A64E3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HtZQPwOqex0YVsXQnLA9jD1tIwR2OftIMcM8ON2q4+k=; b=ec+zi6ihmn0hkJ4EoMofbXEx4
	Mq72oUzEnKNN36VVeevSBqbd58ehorflU03G1rWD2ls+aC6H41JEjwHOfjeRO10JBsgYW7G8RSEuJ
	G+2zRCW9TAE0Kml6pbGWJGsyrVqgMGqQoVq4KkwLYPnEEtxDewQsK+54VYzCEm4DWWNaznntlfs4U
	BHZDFVW9McJ/aQkdO6dtWcuU79YE1LixFcB6MOtDFfBeh/+uAGPK8VfYPgY/4snIJxyIJtB4zej3v
	piUVaAVWnziPek+BBGuux7ntBfebLRGLtol14Sea5Df/fHO0F22tgBjNm7Yr2LgaSF5LBjd+nP8Rv
	iUgUeXJ1A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKNGS-009RuU-PK; Thu, 11 Mar 2021 15:30:16 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKNFW-009RXY-Pk
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 15:29:23 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso9514744pjb.4
 for <linux-riscv@lists.infradead.org>; Thu, 11 Mar 2021 07:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=20z5QeuI02GXdah6qR7u3G+9Z+n4hUFUmKM27iHo86s=;
 b=cQ5bgexn0wzKYx3ELEJ3xFRz1zyOfm2CBiSRyjaFKyyWbL4gc0nER2iDV+W5c5wb4b
 4Cigm5+ytit4/N1NJa+3EsYO2ddQK3JVUkVEyTtcnVdlcDaMc7auS6lb2qMkIw6eng+3
 CBVeUgo8Ex4dOR5omCsn4IAdeUnKuF2WX/ZBYyyGSYalAT0wxfmJ9iO4kfaOXtPvQTrM
 DtKhQX9wuEhbLcY74jZhGdKpw3boifJhHVi08D4vMsE/pmtVaDogQMOZZkGTayH/eoB3
 BSma5fLFYn9K03pF4ngkSzW4fT1tEj8ZOuXah1PYtCKfDycykqeoqkhiRgh0Kvnspbgm
 D1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=20z5QeuI02GXdah6qR7u3G+9Z+n4hUFUmKM27iHo86s=;
 b=LN3HuVt6DmWyyRR6kWU2ntwo5j17ThWGPsrRQ8bF0bO8VBYq6y4Phmq0LVyw2wZs5u
 YdSZ0IEJB9nEEsSt9VWNUqNQkcDZsPTRlXxjLYAdC6i1uUdKSssNeGuH+ZSJ4d7WI0y3
 axIL844AbiqTUzmXtqIlMeQsTOMidG9WG3HjEHbnfymf0H8trNwCDoYHUN1yKvrU0pAK
 DkVOh1yws4cELWmZ7k/Xi/gFzBeUvpAqTFZAC9KIzSp88TEhAszAb05srk06HM4roLHW
 W1a+DDKj/gaB4a9dsdoW8lpDluUDkbprnC+S4RV19Zqxx5j/m4KRfj2fKJebQIIvfBx2
 A0yg==
X-Gm-Message-State: AOAM5337P7j0UAHmSHh599moFfZPQ9vfXO8umNFbIV4ghQKeA0dL43Wb
 Uav+adzfSXcEvDjiueyZ5bd6+qeMGRIo3PKpIXsiEMFVRbLvnniU
X-Google-Smtp-Source: ABdhPJwkGWldhvKogXG206w7G054+9Ycj4sNVHyhr95G+Wvv6lgoDZJFOyNSH66E/F8/5rTEXu/yNjqJIPPuu4mjdhY=
X-Received: by 2002:a17:90a:a10c:: with SMTP id
 s12mr9359264pjp.166.1615476556007; 
 Thu, 11 Mar 2021 07:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20210311034707.GA7334@APC301.andestech.com>
In-Reply-To: <20210311034707.GA7334@APC301.andestech.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 11 Mar 2021 23:29:04 +0800
Message-ID: <CABvJ_xghwbPJPKnd+ksSzAq5N0PkjhGMKKz88pT5smgqKz6-JA@mail.gmail.com>
Subject: Re: [RFC patch 0/4] riscv: introduce alternative mechanism to apply
 errata patches
To: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Alan Kao <alankao@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_152919_182583_D2F4BB36 
X-CRM114-Status: GOOD (  32.12  )
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

On Thu, Mar 11, 2021 at 11:51 AM Ruinland ChuanTzu Tsai
<ruinland@andestech.com> wrote:
>
>
> > With the emergence of more and more RISC-V CPUs, the request for how to
> > upstream the vendor errata patch may gradually appear. In order to resolve
> > this issue, this patch introduces the alternative mechanism from ARM64 and
> > x86 to enable the kernel to patch code at runtime according to the
> > manufacturer information of the running CPU. The main purpose of this patch
> > set is to propose a framework to apply vendor's errata solutions. Based on
> > this framework, it can be ensured that the errata only applies to the
> > specified CPU cores. Other CPU cores do not be affected. Therefore, some
> > complicated scenarios are unsupported in this patch set, such as patching
> > code to the kernel module, doing relocation in patching code, and
> > heterogeneous CPU topology.
> >
> > In the "alternative" scheme, Users could use the macro ALTERNATIVE to apply
> > an errata to the existing code flow. In the macro ALTERNATIVE, users need
>
> In general I love the idea of fixing errata dynamically, yet in the past,
> vendors sometimes bump into the dilemma on the necessity of using alternative
> framework or just plainly "ifdefine"-ing the CONFIG_ERRATUM_XXX to toggle their
> fixups.
>
> Quoting from the Qualcomm Falkor E1041 dicssusion threads [1][2] :
>
> "Just do it with an #ifdef"
>
> "There's really no need for this to be an alternative. It makes the kernel
> larger and more complex due to all the altinstr data and probing code."
>
> I wonder if there will be similar disputes end up here. And having a conclusion
> on what should be resolved by alternative and what shouldn't might be more
> complicated since we're having a more diversed group of vendors (or "users" who
> can access the errata as you mentioned).
>
> Cordially yours,
> Ruinland
>
> [1] https://lore.kernel.org/kvmarm/20171201112457.GE18083@arm.com/
> [2] https://patchwork.kernel.org/project/linux-arm-kernel/patch/1512957823-18064-2-git-send-email-shankerd@codeaurora.org/#21249629
>

To be honest, We had a similar discussion in our internal group, and
someone voted for the ifdef method. However, in the end, I chose the
alternative scheme because it will not have any performance impact on
other vendor's core.

For the "#ifdef" mechanism, if we want one kernel image that can
include all vendor's errata, all CONFIG_ERRATA_XXX should be able to
enable at the same time. In this case, the code patching may become
the following pattern.

if (IS_ENABLED(CONFIG_ERRATA_XXX ) && unlikely(has_errata_xxx))
{
      vendor's errata ......
}
The has_errata_xxx is a global variable and its default value is 0. At
runtime, the customized function provided by the vendor should
properly set has_errata_xxx as 1 for the specified CPU cores. Because
the default value of has_errata_xxx for certain cores is 0, It is OK
for all vendor's to enable the CONFIG_ERRATA_XXX. However, this
implementation will cause other vendors to suffer some performance
impact. I used sifive errata cip 1200 as an example:

+        if (IS_ENABLED(CONFIG_ERRATA_SIFIVE_CIP_1200) &&
unlikely(has_errata_sifive_cip_1200)) {
+                asm("sfence.vma\n");
+        } else
+               local_flush_tlb_page(addr);

In this case, except for the particular sifive cores, all riscv cores
will execute local_flush_tlb_page(addr) instead of sfence.vma. The
corresponding assembly code is listed below.

        if (IS_ENABLED(CONFIG_ERRATA_SIFIVE_CIP_1200) &&
unlikely(has_errata_sifive_cip_1200)) {
ffffffe000007416:       012dd797                auipc   a5,0x12dd
ffffffe00000741a:       cfa7c783                lbu     a5,-774(a5) #
ffffffe0012e4110 <has_errata_sifive_cip_1200>
ffffffe00000741e:       e7e9                    bnez
a5,ffffffe0000074e8 <do_page_fault+0x33c>
local_flush_tlb_page():
/home/vincentchen/work/64bit/linux/./arch/riscv/include/asm/tlbflush.h:22
ffffffe000007420:       12098073                sfence.vma      s3

According to the objdump results, before executing
local_flush_tlb_page(), other vendors' cores need to execute three
additional instructions (from 0xffffffe000007416 to
0xffffffe00000741e) due to this errata. The performance impact from
these 3 instructions may be slight. ( 1. The branch predictor may
always do the correct prediction at 0xffffffe00000741e. 2. If this
errata is inserted into a hot spot path, has_errata_sifive_cip_1200
may be stored in the L2 cache.) However, I am still not sure whether
each vendor is willing to suffer the performance impact. Besides, I am
also worried that if we have a lot of errata, the impact on
performance will become significant. Therefore, I finally chose the
alternative scheme.

However, if all vendors are willing to suffer the performance impact
from other vendor's errata, I can change the framework to "#ifdef"
scheme. After all, it may need to take a lot of time to accumulate a
lot of errata to make the performance impact obvious.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
