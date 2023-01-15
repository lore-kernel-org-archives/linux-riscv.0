Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9CBC3DA78
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jan 2023 13:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odsMpyNMqGSwKky3oBnK72OrjgP4HesQywRWDa6kjFY=; b=ZERI3PmyKjDVKK
	97FbYHTPjKlVHqHwvvLUTC2G6cnTKsOvFk21PdCbyXREzTeLxfE/2N7aPzfrfadjsybhCZeqJKF29
	byV4O/CsWrjnmIDKQ0nCN91sIVYrlDTUCLQTlWyi8uoHNTOtsrPuN3QLJ3w/G4tLTPgdbyNcOm1bk
	/HuZDiO1MdjxRYHmH0trefxYzhh4fESC+KzpVHFndqZzfaI2SktMQR+9geAjuJLV9WoxdhQPuaiqD
	8kE+KJqZ0FL2EtmylRrT/CaPKgjKMobEMJ8UikSqNdKv2OTqhnYxU9NRFSofghu4+9/N5HpzWcPw1
	d+yDkb3cXAMuY86EoiMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH2zI-007Njd-8f; Sun, 15 Jan 2023 13:23:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH2zE-007Niw-L0; Sun, 15 Jan 2023 13:23:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 61058B80B4A;
	Sun, 15 Jan 2023 13:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2EC3C433D2;
	Sun, 15 Jan 2023 13:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673789024;
	bh=kMyv8k6SMnlLiBSspFW/pId/wtOb8eflFppDpBbdhL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UxY83zagTgPkSEEpR9ySkbxvLhwg0GtUqRgsSjoYHPAf4xrxQSgHf6OnyXJHRaNKz
	 eLB+7ZMJEe2pwQrIqB7RsiTvhMg4mv9cd1Zv97WjcjHl34MSYLitF3gJJpYnT+0jyE
	 +bMYxQdaq5BkqjLILaMfujfEF69C3VlrwlkieK82a1IPiPjyxJsKO7RIJnkW5Uvsje
	 48g4Vnxle64uRN1jmJB3wHxA+WGXTTs+ilHw0+MtjyxQexaN5h9sTgUVXLiF3aVoXm
	 GN9r/Ic1GGEn+kaALDPHRElvRRNld/oiuvQOIpg3nvGy5+IA+9dkTXqrGunG1SNZXN
	 ne6+RSAkppGYQ==
Date: Sun, 15 Jan 2023 21:13:25 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v3 04/13] riscv: hwcap: make ISA extension ids can be
 used in asm
Message-ID: <Y8P79ap+UbyZUdZ2@xhacker>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-5-jszhang@kernel.org>
 <Y8B7lw0iPXJlr8mB@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8B7lw0iPXJlr8mB@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_052349_024944_811C54C0 
X-CRM114-Status: GOOD (  31.48  )
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

On Thu, Jan 12, 2023 at 09:28:55PM +0000, Conor Dooley wrote:
> Hey Jisheng,

Hi Conor,

> 
> On Thu, Jan 12, 2023 at 01:10:18AM +0800, Jisheng Zhang wrote:
> > We will make use of ISA extension in asm files, so make the multi-letter
> > 
> > RISC-V ISA extension IDs macros rather than enums and move them and
> > those base ISA extension IDs to suitable place.
> 
> From v2:
> Which base ISA extension IDs? Changelog should match the patch contents,
> and it's a little unclear here since the base ISA extension IDs are
> visible here but in the context not the diff.

"that is not what git thinks you did" is the key, see below.

> 
> How about something like:
> "So that ISA extensions can be used in assembly files, convert the
> multi-letter RISC-V ISA extension IDs enums to macros.
> In order to make them visible, move the #ifndef __ASSEMBLY__ guard
> to a later point in the header"

This commit msg looks better, thanks.
> 
> Pedantry perhaps, but referring to moving the base IDs looks odd, since
> that is not what git thinks you did - even if that is the copy paste

Aha, this is the key, I moved the base IDs out side of __ASSEMBLY__
macro protection and move extension IDs to macros, but the git doesn't
think I did the base IDs moving ;)

> operation you carried out.
> 
> Content itself is
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks,
> Conor.
> 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 45 ++++++++++++++++------------------
> >  1 file changed, 21 insertions(+), 24 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 86328e3acb02..09a7767723f6 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -12,20 +12,6 @@
> >  #include <linux/bits.h>
> >  #include <uapi/asm/hwcap.h>
> >  
> > -#ifndef __ASSEMBLY__
> > -#include <linux/jump_label.h>
> > -/*
> > - * This yields a mask that user programs can use to figure out what
> > - * instruction set this cpu supports.
> > - */
> > -#define ELF_HWCAP		(elf_hwcap)
> > -
> > -enum {
> > -	CAP_HWCAP = 1,
> > -};
> > -
> > -extern unsigned long elf_hwcap;
> > -
> >  #define RISCV_ISA_EXT_a		('a' - 'a')
> >  #define RISCV_ISA_EXT_c		('c' - 'a')
> >  #define RISCV_ISA_EXT_d		('d' - 'a')
> > @@ -46,22 +32,33 @@ extern unsigned long elf_hwcap;
> >  #define RISCV_ISA_EXT_BASE 26
> >  
> >  /*
> > - * This enum represent the logical ID for each multi-letter RISC-V ISA extension.
> > + * These macros represent the logical ID for each multi-letter RISC-V ISA extension.
> >   * The logical ID should start from RISCV_ISA_EXT_BASE and must not exceed
> >   * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
> >   * extensions while all the multi-letter extensions should define the next
> >   * available logical extension id.
> >   */
> > -enum riscv_isa_ext_id {
> > -	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> > -	RISCV_ISA_EXT_SVPBMT,
> > -	RISCV_ISA_EXT_ZICBOM,
> > -	RISCV_ISA_EXT_ZIHINTPAUSE,
> > -	RISCV_ISA_EXT_SSTC,
> > -	RISCV_ISA_EXT_SVINVAL,
> > -	RISCV_ISA_EXT_ID_MAX
> > +#define RISCV_ISA_EXT_SSCOFPMF		26
> > +#define RISCV_ISA_EXT_SVPBMT		27
> > +#define RISCV_ISA_EXT_ZICBOM		28
> > +#define RISCV_ISA_EXT_ZIHINTPAUSE	29
> > +#define RISCV_ISA_EXT_SSTC		30
> > +#define RISCV_ISA_EXT_SVINVAL		31
> > +
> > +#ifndef __ASSEMBLY__
> > +#include <linux/jump_label.h>
> > +/*
> > + * This yields a mask that user programs can use to figure out what
> > + * instruction set this cpu supports.
> > + */
> > +#define ELF_HWCAP		(elf_hwcap)
> > +
> > +enum {
> > +	CAP_HWCAP = 1,
> >  };
> > -static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> > +
> > +extern unsigned long elf_hwcap;
> > +
> >  
> >  /*
> >   * This enum represents the logical ID for each RISC-V ISA extension static
> > -- 
> > 2.38.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
