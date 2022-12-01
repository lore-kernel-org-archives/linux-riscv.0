Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55E3C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3n+zM2wo5vkGKrZcEl8Sw4dvcHNCiofk8LVcjKTbec=; b=rekmTI9EEj7yhL
	Vortr310W26xjex/6KG8D8vmCY404m9cJZeQAHRQywkz5EdgRWLScF3j+4m8zFx6LVnJe9mSYkJdE
	MV7cCsTzkjepCzSQ6kgC2VYFTrdWNosGPiy0IVE3bpj7B4B6g98Esy6j15NgzYxC4/GvzY3eHjNnK
	jAMd1q6kIDU220b02/+llcJL6VuCgnNI8rxGrO7NCZ/mD5tZDYXNp/oUIyc3S9/hDRPg0f6u6pudH
	cnzKO+MLjdVGk7YYoEbL30UJKQxLu7r9Tc+ZEQyJDr/1eeVztAiQosHdMtyU2H98VfuM2UFQ1b94S
	odydpfkiXYMbH7uPj7xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fFT-00621v-4m; Thu, 01 Dec 2022 08:48:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fFG-0061pv-Am
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 08:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669884518; x=1701420518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e0sGk5FC+bQXFAkQVJL15UcqqaRVlO2Lo1qDc6ms+U8=;
  b=BEhSChQ25Unu1iX09QXtANCO2EzU++igik8uK5XRlK6xa2CSPvFjgQOf
   agFwQf6GD+t6zmk7CeWYkU4H6UoPsPxhxTxo/NQq9xQ1JWkjEmoX8eaeb
   kZY2BO73sEs8V+AsL6X36Tkw1aD5fDX19EvsI2I433DcRsF+w761Pl50p
   0bAYO/XyOGxb4IxVh4jNO7TKoNrqC9xqoZ/66TorqyA6LgTv/r5KPu+EM
   xwUL4JWq2Ec/J7QCr3X/FKrMA+xeWmJALIrJQRivRc0S3artqiGFbbLmL
   yXwQ0+QDIulHd9eMJU+6v/dlbzdf9QiPaLWPAyfUGzB9HmcFRgV3I7wQQ
   w==;
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="125953620"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Dec 2022 01:48:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Dec 2022 01:48:36 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Dec 2022 01:48:34 -0700
Date: Thu, 1 Dec 2022 08:48:15 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <aou@eecs.berkeley.edu>, <corbet@lwn.net>,
	<guoren@kernel.org>, <heiko@sntech.de>, <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v1 1/3] RISC-V: clarify ISA string ordering rules in cpu.c
Message-ID: <Y4hqTwpyxMqZTyoC@wendy>
References: <20221130234125.2722364-1-conor@kernel.org>
 <20221130234125.2722364-2-conor@kernel.org>
 <20221201082743.xjxcnx7zcwycdwy7@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221201082743.xjxcnx7zcwycdwy7@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_004838_502133_09412B21 
X-CRM114-Status: GOOD (  31.74  )
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

On Thu, Dec 01, 2022 at 09:27:43AM +0100, Andrew Jones wrote:
> On Wed, Nov 30, 2022 at 11:41:24PM +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > While the current list of rules may have been accurate when created
> > it now lacks some clarity in the face of isa-manual updates. Instead of
> > trying to continuously align this rule-set with the one in the
> > specifications, change the role of this comment.
> > 
> > This particular comment is important, as the array it "decorates"
> > defines the order in which the ISA string appears to userspace in
> > /proc/cpuinfo.
> > 
> > Re-jig and strengthen the wording to provide contributors with a set
> > order in which to add entries & note why this particular struct needs
> > more attention than others.
> > 
> > While in the area, add some whitespace and tweak some wording for
> > readability's sake.
> > 
> > Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/kernel/cpu.c | 49 ++++++++++++++++++++++++++++++-----------
> >  1 file changed, 36 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 852ecccd8920..68b2bd0cc3bc 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -120,22 +120,45 @@ device_initcall(riscv_cpuinfo_init);
> >  		.uprop = #UPROP,				\
> >  		.isa_ext_id = EXTID,				\
> >  	}
> > +
> >  /*
> > - * Here are the ordering rules of extension naming defined by RISC-V
> > - * specification :
> > - * 1. All extensions should be separated from other multi-letter extensions
> > - *    by an underscore.
> > - * 2. The first letter following the 'Z' conventionally indicates the most
> > + * The canonical order of ISA extension names in the ISA string is defined in
> > + * chapter 27 of the unprivileged specification.
> > + *
> > + * Ordinarily, for in-kernel data structures, this order is unimportant but
> > + * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
> > + *
> > + * The specification uses vague wording, such as should, when it comes to
> > + * ordering so for our purposes the following rules apply:
> > + *
> > + * 1. All multi-letter extensions must be separated from other multi-letter
> 
> 1. All multi-letter extensions must be separated from other extensions by an
> underscore.
> 
> (Because we always lead multi-letter extensions with underscore, even the
> first one, which follows the single-letter extensions.)

Yah, I need to think as if I am using De Morgan's... The DT ABI requires
"should" and permits this. The uAPI is "must"/"will" and always has an
_. I'll propagate that change to the docs patch too.

> > + *    extensions by an underscore.
> > + *
> > + * 2. Additional standard extensions (starting with 'Z') must be sorted after
> > + *    single-letter extensions and before any higher-privileged extensions.
> > +
> > + * 3. The first letter following the 'Z' conventionally indicates the most
> >   *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> > - *    If multiple 'Z' extensions are named, they should be ordered first
> > - *    by category, then alphabetically within a category.
> > - * 3. Standard supervisor-level extensions (starts with 'S') should be
> > - *    listed after standard unprivileged extensions.  If multiple
> > - *    supervisor-level extensions are listed, they should be ordered
> > + *    If multiple 'Z' extensions are named, they should be ordered first by
> > + *    category, then alphabetically within a category.
> > + *
> > + * 3. Standard supervisor-level extensions (starting with 'S') must be listed
> > + *    after standard unprivileged extensions.  If multiple
> > + *    supervisor-level extensions are listed, they must be ordered
> >   *    alphabetically.
> > - * 4. Non-standard extensions (starts with 'X') must be listed after all
> > - *    standard extensions. They must be separated from other multi-letter
> > - *    extensions by an underscore.
> > + *
> > + * 4. Standard machine-level extensions (starting with 'Zxm') must be listed
> > + *    after any lower-privileged, standard extensions.  If multiple
> > + *    machine-level extensions are listed, they must be ordered
> > + *    alphabetically.
> > + *
> > + * 5. Non-standard extensions (starts with 'X') must be listed after all
> > + *    standard extensions.
>                             ^and alphabetically.

"If multiple non-standard extensions are listed, they must be ordered
alphabetically." I'll also propagate this to the doc one, if I have not
already.

> Otherwise,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Cool. I'll give it a bit before respinning, but I think we are at least
getting less ambiguous as time goes on..

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
