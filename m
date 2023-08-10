Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1475FC001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1s0XjsAvCBJyc5h3sgkaZdP8ul3Ri6G6ddv9uJy1orY=; b=3+sCmUphixW2Nf
	9Y9Zmw7VuH27gaVbImtKf7112IT128dULL97kVm7+QmetM6GkdXXcDeDbayihj3LsggJj3LMGd/ef
	uBaL9UpFZS4/J48r27BZTLX5JuAQKNpX9Zz799oo9b2zDBPvW1+BAfIYhSIPNxumjX7caMn3bAsbo
	mzRrKaokxOwdjhWz5/Mb7tRFt8V84VTC8vw8VC7z8ZUyNU3wsqRNRtBwzy+eGWGyAB8xtCuVQMaYm
	9DWFYFkA1l1NScVKnC9+EQBJhJfhiRO9c6gnlZxT0QOdz+JzB8gaHCcXIlGfnf+gr/bStPw5H2ZaQ
	DapBXkLuSxMWHyMqTF7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3MH-007JwZ-0U;
	Thu, 10 Aug 2023 10:57:37 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3ME-007Juw-1g
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 10:57:36 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe655796faso1128822e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 03:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691665052; x=1692269852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KNFOCURfHemjafvPthT2J0BgBAs3jcqNoiIUaxGGTVI=;
        b=iOrO202SWa8+5r0mOIr1ZfSX4hVHuMjxmBDHcHAsdZIGb5RN3OOvLa/5rJlH7gR3sl
         jhYnZeoB0NKNzm0O2NH+R+JxsVNy2BjA24jpI/Hlx7IJexV4753ce3Z/T/CEcei2Cxsy
         lpqLOukP/0+R5SQJEkWOmO8bgSknDwcWzceQYivMzjc/woTRBz+90pAdjMT2yogH1XAt
         CYUjNKTeqXbtbk+xvBikiq1WGixzdUljZZcaI0MXKm4RarE28/qHrU4AZDXMpfE5016N
         kFH525RlA9cG+YGN3CPXEatIvaH+PIENtiFAa85qZlaPew0sQlTuJn+U4mlbX3Y9P4pF
         YlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691665052; x=1692269852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNFOCURfHemjafvPthT2J0BgBAs3jcqNoiIUaxGGTVI=;
        b=eVvkq8BbP1EYoTARMHG1jLx7I+3Y5E/L0P8GXYnDfNhDeYz9UJofX0A21QHh2y2Hvj
         BGabsYZN9ZG0jJcGkSYWfRCpT097EhWuO9dJUg11qmiiBo8j/2kEZSHU4zfHRXPzqoUt
         fNNEU58tBhrt5JGFAUS4zzUGG36/oVdo56M5UfnzIqRJQbUDcf0Pk0UT9bO6iWE3TpJc
         CSKHnWyWcw6QdoceiKxkiq3h4BfhFbUVwHEY9didXdy0dwQwhb3VNpC+oQN3TLeH9KEU
         9b9T264IXSier8MO6VnGvJbVWtWpf190H3sPtqxt0B5zxHwR1Ru1LpS1a2QpK6mJHmsl
         wx4Q==
X-Gm-Message-State: AOJu0YyDrqsiGDDkrFuA7S24Al0Ho3G+O9db5iE5rfO7spNgbRtuuCJl
	67ga5IiLTy/C62WBpTk/zUUgE2CgzVAVHrJhR5N3Ng==
X-Google-Smtp-Source: AGHT+IGtX2+Yln3kp/vV52ZbfUvw7TuIK1tIqzqgI59owA3rprxHVJnwdQ2iRbK2NQuvUA6mtcE3WQ==
X-Received: by 2002:a05:6512:5c6:b0:4fb:8939:d95c with SMTP id o6-20020a05651205c600b004fb8939d95cmr1406733lfo.30.1691665051910;
        Thu, 10 Aug 2023 03:57:31 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id d9-20020aa7d689000000b0052237dfa82fsm646219edr.64.2023.08.10.03.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:57:31 -0700 (PDT)
Date: Thu, 10 Aug 2023 12:57:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, evan@rivosinc.com, 
	apatel@ventanamicro.com
Subject: Re: [PATCH 3/6] RISC-V: hwprobe: Expose Zicboz extension and its
 block size
Message-ID: <20230810-0c9993116a87372bf4fcfe9e@orel>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
 <20230809115516.214537-11-ajones@ventanamicro.com>
 <20230810-revolver-krypton-ab1883b361a1@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230810-revolver-krypton-ab1883b361a1@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_035734_558080_85A0EC3B 
X-CRM114-Status: GOOD (  30.30  )
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

On Thu, Aug 10, 2023 at 10:49:59AM +0100, Conor Dooley wrote:
> On Wed, Aug 09, 2023 at 01:55:20PM +0200, Andrew Jones wrote:
> > Expose Zicboz through hwprobe and also provide a key to extract its
> > respective block size. Opportunistically add a macro and apply it to
> > current extensions in order to avoid duplicating code.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  Documentation/riscv/hwprobe.rst       |  6 ++++
> >  arch/riscv/include/asm/hwprobe.h      |  2 +-
> >  arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
> >  arch/riscv/kernel/sys_riscv.c         | 41 ++++++++++++++++++---------
> >  4 files changed, 36 insertions(+), 15 deletions(-)
> > 
> > diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> > index 933c715065d6..6a17c2872660 100644
> > --- a/Documentation/riscv/hwprobe.rst
> > +++ b/Documentation/riscv/hwprobe.rst
> > @@ -77,6 +77,9 @@ The following keys are defined:
> >    * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as defined
> >         in version 1.0 of the Bit-Manipulation ISA extensions.
> >  
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is supported, as
> > +       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
> > +
> >  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
> >    information about the selected set of processors.
> >  
> > @@ -97,3 +100,6 @@ The following keys are defined:
> >  
> >    * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
> >      not supported at all and will generate a misaligned address fault.
> > +
> > +* :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
> > +  represents the size of the Zicboz block in bytes.
> > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> > index 78936f4ff513..39df8604fea1 100644
> > --- a/arch/riscv/include/asm/hwprobe.h
> > +++ b/arch/riscv/include/asm/hwprobe.h
> > @@ -8,6 +8,6 @@
> >  
> >  #include <uapi/asm/hwprobe.h>
> >  
> > -#define RISCV_HWPROBE_MAX_KEY 5
> > +#define RISCV_HWPROBE_MAX_KEY 6
> >  
> >  #endif
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> > index 006bfb48343d..86d08a0e617b 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -29,6 +29,7 @@ struct riscv_hwprobe {
> >  #define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
> >  #define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
> >  #define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
> > +#define		RISCV_HWPROBE_EXT_ZICBOZ	(1 << 6)
> >  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
> >  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
> >  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> > @@ -36,6 +37,7 @@ struct riscv_hwprobe {
> >  #define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
> >  #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
> >  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
> > +#define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
> >  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> >  
> >  #endif
> > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> > index 26ef5526bfb4..7d970358597b 100644
> > --- a/arch/riscv/kernel/sys_riscv.c
> > +++ b/arch/riscv/kernel/sys_riscv.c
> > @@ -145,26 +145,33 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
> >  	for_each_cpu(cpu, cpus) {
> >  		struct riscv_isainfo *isainfo = &hart_isa[cpu];
> >  
> > -		if (riscv_isa_extension_available(isainfo->isa, ZBA))
> > -			pair->value |= RISCV_HWPROBE_EXT_ZBA;
> > -		else
> > -			missing |= RISCV_HWPROBE_EXT_ZBA;
> > -
> > -		if (riscv_isa_extension_available(isainfo->isa, ZBB))
> > -			pair->value |= RISCV_HWPROBE_EXT_ZBB;
> > -		else
> > -			missing |= RISCV_HWPROBE_EXT_ZBB;
> > -
> > -		if (riscv_isa_extension_available(isainfo->isa, ZBS))
> > -			pair->value |= RISCV_HWPROBE_EXT_ZBS;
> > -		else
> > -			missing |= RISCV_HWPROBE_EXT_ZBS;
> > +#define EXT_KEY(ext)									\
> > +	do {										\
> > +		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_EXT_##ext))	\
> > +			pair->value |= RISCV_HWPROBE_EXT_##ext;				\
> > +		else									\
> > +			missing |= RISCV_HWPROBE_EXT_##ext;				\
> > +	} while (false)
> 
> Would you mind adding a comment here that using this macro is only
> permitted for extensions that can be used by userspace regardless of kernel
> config options?

I can do that. Then, as part of the "extension available" API rework, we
can maybe drop the comment when we use the new call, which will be
documented to say that as well.

Thanks,
drew

> 
> > +		EXT_KEY(ZBA);
> > +		EXT_KEY(ZBB);
> > +		EXT_KEY(ZBS);
> > +		EXT_KEY(ZICBOZ);
> > +#undef EXT_KEY
> >  	}
> >  
> >  	/* Now turn off reporting features if any CPU is missing it. */
> >  	pair->value &= ~missing;
> >  }



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
