Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC30C04FDE
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7wncuwQLTDwnlpp1htRPhCnx828C2IvrfA+Uj0s4WI=; b=rboOsu8gZ7OTb9
	L4dewt+ytbQfeTWyA8OQ1rb/Ud1oksX7Vh1mhvNAqETy9fjDTLW2aJ0ALLovWSyPtiUAASDdkUYNn
	lsQcizW9emjXN8Zk+c0kExPjcmjMkfzK7cu0v+yWVCdtq9G16nsdYdnO0Qmt+JC0lgY9oYv3T4vha
	bz255GhSqL7CN+1OYApp7aGcXcC8EvalhaijNdWuY1dDKSgONaqVFyp6ngINB/H5+Oa4nvQpXlQ+Z
	oVesenAssehKjAlSNi1/0lpbb3oHcZRi9alm7kCCnb6xi7a8a4CG5Q/jAHPIBcFz0mPKC+2XsZjtX
	qWjJ8HWvGf8rAw2pklZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3gnK-009pyx-4f; Fri, 09 Dec 2022 17:04:18 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3gnH-009pyB-4J
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 17:04:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id w15so5804456wrl.9
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 09:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hMwgF31yt45Od11ttat9M1Z3Wb8PR6YXQp5UysWDrp0=;
        b=iJbr7/S14vD4CTY7W69qWMvrpa3tGfQUq6MB7JgyfLuQBy97naJxJNRERxsLotyuQS
         WOc4swam0S1g7RNq4hpGHUnUGdnguYaXvgHWNTsP5Sj9H4tfBPz73j5D2qU/8IrnJQ94
         eo+8LxAZm5xORAcKWHyw+z+O+MyZCgiAmgqQ1Jp0TMnMw1gYHW3+3gYCJwYH1Vt9S0OA
         LZbAEc4iKnPMsuJ8AsSB1XO0NptfHkhBTr2zWnLS+eo6FY0+hfPo1Ig4l3VbToSPpvYW
         EbSMLeLxC0GGGY2svcwDSW5AV0L7p4Pj2leINle0zusUkEI6D4xpBBL+e7JrAjdstprm
         DcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hMwgF31yt45Od11ttat9M1Z3Wb8PR6YXQp5UysWDrp0=;
        b=xYHkmfkPmN4DawREvY7iKnlAakq0NGe6xYTHIkmwtI/q111W1azds32wT1fbsSYObS
         akrLqoiPFHKrfbgn8Ou3ZTg3dMExPwbTNRZ37hWal70C+UNUvkUcp4SkmkgNj+qCjDvH
         aCKWuUgEHqqnRI9qGnbcn+Tmk7kAoY7yNNtf2E1Xix/1U4ARMX2zgHFpLPidEHiU91PW
         bIQbHrwcpjRRrno5XwdT8pVtqAcZnCh30NZYocX50j7xDqnM+hxgJos01UN/D3BH4AJU
         9blTLRfBPC8Bx5ZzBDKsSGQ7VfmDfjYJm+yCNGzuhcxlizGPEFNpxw30aC7KXbxlb6Hm
         8oRg==
X-Gm-Message-State: ANoB5pmoTxtZu8caj9XkbP0US/peRBihPXv6dhKlRzU6tkN8GolS28ZJ
	6bPXvmYQZhdx5Pgr3crnWW+NUk8/nycH1n76
X-Google-Smtp-Source: AA0mqf5AtKjQrKfF8KpSn2FXdWU1BdSChZ+k6waw25tiWbWBkXZZFY94GT3KIu93k+vgwf7YvMYgeQ==
X-Received: by 2002:a5d:4344:0:b0:232:be5d:48c5 with SMTP id u4-20020a5d4344000000b00232be5d48c5mr4016200wrr.57.1670605452476;
        Fri, 09 Dec 2022 09:04:12 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id e16-20020adffc50000000b00241fab5a296sm1817608wrs.40.2022.12.09.09.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 09:04:12 -0800 (PST)
Date: Fri, 9 Dec 2022 18:04:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, jeff@riscv.org
Subject: Re: [PATCH v9 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <20221209170410.2sakdw6uxki3c47w@kamzik>
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-2-panqinglin2020@iscas.ac.cn>
 <Y5Dfog2HYhejuDX8@spud>
 <ae8753cd-038c-ecaa-3a39-72cf1340d764@iscas.ac.cn>
 <28494e11-8f4d-7466-13d7-12e22f8f67fe@iscas.ac.cn>
 <20221209074229.iexrvp5hkuq3qz2l@kamzik>
 <CD44ACE9-43EC-4865-8604-1C7876D5EEAE@kernel.org>
 <d32afb75-88b4-6629-1ef1-2ea2e8d2a98c@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d32afb75-88b4-6629-1ef1-2ea2e8d2a98c@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_090415_196129_184CF0E5 
X-CRM114-Status: GOOD (  40.70  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 09, 2022 at 11:36:53PM +0800, Qinglin Pan wrote:
> Hi all,
> =

> On 2022/12/9 22:33, Conor Dooley wrote:
> > =

> > =

> > On 9 December 2022 08:42:29 GMT+01:00, Andrew Jones <ajones@ventanamicr=
o.com> wrote:
> > > On Fri, Dec 09, 2022 at 01:34:42AM +0800, Qinglin Pan wrote:
> > > ...
> > > > > > > +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> > > > > > > +#define HUGE_MAX_HSTATE=A0=A0=A0=A0=A0=A0=A0 (2 + (NAPOT_ORD=
ER_MAX -
> > > > > > > NAPOT_CONT_ORDER_BASE))
> > > > > > > +#else
> > > > > > > +#define HUGE_MAX_HSTATE=A0=A0=A0=A0=A0=A0=A0 2
> > > > > > > +#endif
> > > > > > =

> > > > > > This is coming from a place of *complete* ignorance:
> > > > > > If CONFIG_RISCV_ISA_SVNAPOT is enabled in the kernel but there =
is no
> > > > > > support for it on a platform is it okay to change the value of
> > > > > > HUGE_MAX_HSTATE? Apologies if I've missed something obvious.
> > > > > =

> > > > > :(
> > > > > You are right. If CONFIG_RISCV_ISA_SVNAPOT is enabled, HUGE_MAX_H=
STATE
> > > > > will always be 3 whether has_svnapot() is true or false. I will t=
ry to
> > > > > fix this.
> > > > =

> > > > I am really expecting that HUGE_MAX_HSTATE can change according to =
the
> > > > platform situation when CONFIG_RISCV_ISA_SVNAPOT is enabled. But it
> > > > seems impossible to achive this with a minor patch. Because this va=
lue
> > > > is used as some static allocated arrays' length (for example, hstat=
es in
> > > > mm/hugetlb.c:52) in arch-independent code :(
> > > > =

> > > > This immuture HUGE_MAX_HSTATE value will cause no functional error =
but
> > > > it really makes some objects used only partially when
> > > > CONFIG_RISCV_ISA_SVNAPOT is enabled but the platform has no svnapot
> > > > support :( I am not sure whether this patch can be accepted with th=
is
> > > > feature? Or any other helpful idea to fix this problem?
> > > > =

> > > > Please let me know if I ignore any information about it.
> > > =

> > > I agree that the only problem appears to a waste of memory, particula=
rly
> > =

> > Caveat about ignorance still applies, how much of a waste of memory are=
 we talking?
> > =

> > > if cgroups are enabled. I don't see any easy solution either. Maybe a
> > > warning in the Kconfig text would be sufficient?
> > =

> > I think that entirely depends on how wasteful it is.
> > If it's minor, sure?
> > =

> =

> I am also not sure how minor this waste will be. But I believe it will
> be acceptable. Because before this patchset, we also use only 1/2 of
> HUGE_MAX_HSTATE value (which is 2) when CONFIG_64BIT is enabled and
> CONFIG_CONTIG_ALLOC is disabled. As HUGE_MAX_HSTATE is a 'max' value,
> it is normal to use it up only sometimes but not always.
> =

> I prefer to do as Andrew said. To add an notification about this waste
> in KConfig text, and still use the immuture HUGE_MAX_HSTATE value.
> =

> @Andrew @Conor what do you think of this explanation and this solution?

To get a better estimate of the waste it should be possible to write a
quick kernel module which outputs sizeof on a few structs. But, from a
quick read of the structs, I think we're probably fine. Certainly it looks
like without CGROUP_HUGETLB and with a small MAX_NUMNODES it's no big
deal. With CGROUP_HUGETLB it's definitely more, but probably OK.
MAX_NUMNODES probably won't ever be huge, so, while there are five arrays
of MAX_NUMNODES elements in hstates, it's unlikely to matter much,
especially since the types of the array elements are small.

It'd be nice to get actual numbers, but based on that analysis I think I'm
OK with the comment in Kconfig.

Thanks,
drew

> =

> Please let me know if I ignore anything. Thanks a lot!
> =

> Regards,
> Qinglin.
> =

> > Thanks,
> > Conor.
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
