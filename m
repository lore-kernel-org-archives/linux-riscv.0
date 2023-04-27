Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1627FC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0KGgA1oBseGoQ1LJKW6M3hB8V9EuTot//JXc/Ikl48A=; b=giQNL+u8RFh9Fw
	S9a3of6Y9Hxb3WITppqQvpIemA0bkzyZTABiPidXTvwW7+jbUxLlLrKL+P7RrRF8ChUQCQ3IN8urD
	tXnC+T1J892iE2yQFAr3jzlnfQ0i4VM+zfEPZUmlMuAUwPrqjY5vgHMPhI5Tnbk8ncSMqb5MdbrpT
	1EMAVP5B9TLEyMnzELGOTxExloK28xQK084J3OFl5EmyCuIJe6F3AZ5e68ON6Xg2HIJlIhi3+R5cf
	wDkDWHnKqVpuLKAuw9/Wu8YU7IOkJt+tpjwkmLn1XWBBYfNUk6t5MVdiUdzY+mx1H6AUhOgecsIaJ
	c/8Mva+QWljU02F8hd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prwRT-005jjd-1O;
	Thu, 27 Apr 2023 07:53:27 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prwRQ-005jig-0h
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 07:53:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-2f95231618aso5163057f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Apr 2023 00:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682582000; x=1685174000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gQ0f/TLmE6U7KpFTCCjbNTVanhPmdFTeq8v4yjZN2ZI=;
        b=CqxUiw/EOFD+4saU2CtOjJuaEoGRFUP84mWbHi2NQCp+AkbBmiMbJOVkVUtEBsRoPa
         TtQs//PK6Qo302tpqyCi91d7nmCdcu5KkYXyNlq1rgtT3IfBd+LbE5cdrj2PiH8pr1dU
         3SHBUJzBAbJxIEwC5tIjzkPJR6xy1T7Auay6xhpP25MUefnkjuYmLYZ0S3gGAfTIPhkv
         Ub5NPTr1bLN8FGTMlQxUDGggN1pv1NIY/d/nADdXvVUpgt0ACCNKX2y3PE+MCvOh4F7y
         ib4xH/u18g549yZryyt5XnGjtV5NL/Wd/j8FF4kpjzb1WIboh3mnmaVG+l3xxxPiX/u2
         GCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682582000; x=1685174000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQ0f/TLmE6U7KpFTCCjbNTVanhPmdFTeq8v4yjZN2ZI=;
        b=l0P0capSwVzubBAHfA5EReaLF73lX57GzG9iuaxtq5vstXR0XVySJq00WSViXPq6Vt
         CDFjLD+RMKbcjDYsvc+ws8YiZp0n9m3KFuIS6vgaMefAUJSb6uJJB92BTDxP/AykSdAI
         Ab3XRRjB6eieuoiMd3oA2w4zh82p0EXYLYljGJCqZfRU1U47QagWfXTbX2MrSUmrB1Ty
         JIqeHVeJAyOKIHQJ2tj2cSbkUSERcFqonY9JSbAXCohoEkv2/xO6L4JdebbOuUchkcf0
         nEpIlseNH/hmQSVrclOIXMPTgqzERJrqnrtIIZXmlNa+Y7BAX9IgS0AQlCr85As6xtsd
         9IyQ==
X-Gm-Message-State: AC+VfDzy/ZhApKU9tHX95JoB7uKQ5EIycJ8K8qtZLEZ+AqtRkGoCqCiZ
	jNRqE+jdfo+gr3tpuFq07dyzkA==
X-Google-Smtp-Source: ACHHUZ6ItBA5+WYUdMqatlEghXuSEneRgMvehNHJKuqkCqKnWTFM83WWEHlM0gRD4mZKspxfzUZVfA==
X-Received: by 2002:a5d:60c8:0:b0:2f1:dae:100c with SMTP id x8-20020a5d60c8000000b002f10dae100cmr552626wrt.5.1682582000492;
        Thu, 27 Apr 2023 00:53:20 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z16-20020a5d4410000000b002f79ea6746asm17718846wrq.94.2023.04.27.00.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 00:53:20 -0700 (PDT)
Date: Thu, 27 Apr 2023 09:53:19 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Wende Tan <twd2.me@gmail.com>, Soha Jin <soha@lohu.info>, Hongren Zheng <i@zenithal.me>
Subject: Re: [PATCH 1/2] riscv: allow case-insensitive ISA string parsing
Message-ID: <6kjgearxffbnnq4bsqs7e3jz6efz436m6gb3zjh7cfi357oxlv@krxto6orxwwn>
References: <20230425120016.187010-1-cyy@cyyself.name>
 <tencent_63090269FF399AE30AC774848C344EF2F10A@qq.com>
 <20230426-porthole-wronged-d5a6a3b89596@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426-porthole-wronged-d5a6a3b89596@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_005324_252607_C40BF7F5 
X-CRM114-Status: GOOD (  29.67  )
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

On Wed, Apr 26, 2023 at 07:54:39PM +0100, Conor Dooley wrote:
> (+CC Drew)
> 
> Hey Yangyu,
> 
> One meta-level comment - can you submit this patch + my dt-bindings
> patch as a v2?
> Some comments below.
> 
> On Tue, Apr 25, 2023 at 08:00:15PM +0800, Yangyu Chen wrote:
> > According to RISC-V ISA specification, the ISA naming strings are case
> > insensitive. The kernel docs require the riscv,isa string must be all
> > lowercase to simplify parsing currently. However, this limitation is not
> > consistent with RISC-V ISA Spec.
> 
> Please remove the above and cite ACPI's case-insensitivity as the
> rationale for this change.
> 
> > This patch modifies the ISA string parser in the kernel to support
> > case-insensitive ISA string parsing. It replaces `strncmp` with
> > `strncasecmp`, replaces `islower` with `isalpha`, and wraps the
> > dereferenced char in the parser with `tolower`.
> > 
> > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> > ---
> >  arch/riscv/kernel/cpu.c        |  6 ++++--
> >  arch/riscv/kernel/cpufeature.c | 20 ++++++++++----------
> >  2 files changed, 14 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 8400f0cc9704..531c76079b73 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -4,6 +4,7 @@
> >   */
> >  
> >  #include <linux/cpu.h>
> > +#include <linux/ctype.h>
> >  #include <linux/init.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/of.h>
> > @@ -41,7 +42,7 @@ int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
> >  		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
> >  		return -ENODEV;
> >  	}
> > -	if (isa[0] != 'r' || isa[1] != 'v') {
> > +	if (tolower(isa[0]) != 'r' || tolower(isa[1]) != 'v') {
> >  		pr_warn("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
> >  		return -ENODEV;
> 
> I don't understand why this is even here in the first place. I'd be
> inclined to advocate for it's entire removal. Checking *only* that there
> is an "rv" in that string seems pointless to me. If you're on a 64-bit
> kernel and the node has riscv,isa = "rv32ima" it's gonna say it is okay?
> Drew what do you think?

It makes some sense to me as a garbage detector. It's unlikely the first
two bytes will be "rv" if the string is random junk. I think it should
also do a strlen(isa) >= 4 check first, though. of_property_read_string()
will succeed even when the string is "".

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
