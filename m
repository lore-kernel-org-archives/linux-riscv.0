Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877C3C88E41
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 05:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFyuAKJisyvvhQtuMCgF5IMxu82Z9fOS/+JdOLXaVqQ=; b=A9ySuSrpbSnfIb
	do1a4kutCUnLZpWNElGWh9XghVlt3g7APZeb6BTfCXltxBZrKfjSuNeoNv3uLXKeC/rzV/+mpKG7c
	CTRUOW3j1cj9izkztv2WA4C7tFiil2gPBfFr/laQF59O999TybiLkuuxQl3DtlJlmVdufjqpRyHQG
	qGl18+qXAytzo5/tXpJbJUC9P+X1sSI/+f3lI+c/3GhPd2vUZ/qzvNb+m0GKkWEp/s1+c7FvjJ+g7
	qLTOE+5OizCFxY20XZuXaX69aO9Ugh1N9Hlt50gKk91V9srupVt2HXcRB4jKjD5lQD0e5JUGrQl0H
	LPctzmqdIfguZpDX+L2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tko-0000000Frzr-1VYc;
	Fri, 11 Sep 2026 05:24:50 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tkm-0000000Frz5-0Dnl
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 05:24:49 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so523962a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 22:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789104287; x=1789709087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPT5/AHY7+piJs39GlSgVXX0zmrz48MGY79/VqTO0Wo=;
        b=IMkZ8ABOZXeX9Kudn4sAuV6Owe6R8HXuQqAZ8HFQq0QhHUfYb6PkhupI2nupjk0aTf
         4sQUyH3jEn89h87qnZWZ93nV6tfzicUjBNcWnKCoDz1hfbCZZI6JgiJ9Bs+JBlLAzGnB
         SZSEDJt1Tv6LmGlDOcJYU/R9HR2ltk1G/RAphf6L7GPZHoum3cPjwXa/sD0zn1VuCl71
         aopTcQD6Jd5M7tHHK1aitpM36ZINwZ3gU8Y9dXxPODAYKeFqJLRTTAhnqCrUBmYR6LaW
         tKiWlWe+/WU8RRwMXL3FYogHfcVVB+QTtlVRiOPtXRVIcwSOHorY6u6R0QLTh/hvQmjw
         9tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789104287; x=1789709087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPT5/AHY7+piJs39GlSgVXX0zmrz48MGY79/VqTO0Wo=;
        b=nfTFTwDplWWqN0jDTd1ReVOliim9LUwxKeS/7uLAi4vuN/Ycc91ffLFDB0Mo6WYucj
         9qQo1DcNkd1MKDPx125u1UZEfrzGapQTIslSaTOgW6QNugjhmjlq5l5bfSFIkyMFPDsV
         DJlSjx+Ghd7BQYuVAaJN/yKg+CYS5y0hDwoG6NTl+ptZKXayBvm4IqvyYWWKw4mTRST9
         J42b9oOMdAnXqjkf3f5XfdLUQmSa2RRq4bx1rX0lzBbkdOjGfgJXPdvjy6qD6/7bS8MU
         /+Hp8q+vDBM5/NPJitoZzaXxOB3dxRrI7nEIGWw3Tggrk64dXY7peLoc+qeuToc61AwG
         mqOw==
X-Forwarded-Encrypted: i=1; AKwUvBwsnBUzbObdIsspoAqcFlFe8CoOn2WiGPd4WgqwoMYtyy+EU1lFlOqk6ags2xIyhjjJDe38wkyNEQSn1Q==@lists.infradead.org
X-Gm-Message-State: AFuF++kAHbGjvXEYGsST6fCwYj+B0lZuIF2RV6pNUSMeKh4lnwxwuSMO
	IHOi8zd62/2OSA4YSkLX6agkBV4qZ+gYbc7yXqhJ6V6vK+TDgl2ywwav
X-Gm-Gg: AYBFou3ZPyeO2Eo+V5L6DYomZ99jyEvRpFyOPLo0cUYT/zQh3QKKgvfEZaeHs5uDL6i
	yXh4HpHoqd7M/RZAzVH29STzVvxFmYWSlzezvRdXiyWIZvd/Y/+XnWP+5UTuisiPvF02djfgvqb
	pUK/WtJi4feoTlzirLGqpuBUCIOqssuNqCq7YYLDrMja97i/OmrUeuzq0rOk4BeQOQugeV7tWW/
	Ol2lf1yotIUEpF8L7vvm9U4n+C+R4vJWY53rDW6w4vbYwLADz6mHApFDjNWcrcZmdtRReL7kOrN
	XHTa8RmqPzXUYo9tL42adBFV0L7B1Ccvsy/uvNS7z1iIh03EcnvF3WfuKIkBzIL14jlsl/Ox87L
	fm1EkpzUf+uRWFjxLRzR8E8YEgBa4m8YG6sMSrEV01E57+WPMRaSxOX22IsIzS6scTnRypp7S3P
	CCgh9BxOGXBkn8JkVDgDQepLKXB/VvdE9wW4QI/EzHRY4Yv/mYee2FDlyI2Kbxg0NZncgHXt//0
	zLlIbqr7Xe/pHRSKYypCyTaQwUgLWmw7WS18v94wbthKA==
X-Received: by 2002:a17:90b:3906:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39d9c3727b3mr3899237a91.17.1789104287013;
        Thu, 10 Sep 2026 22:24:47 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba71cesm3416735c88.13.2026.09.10.22.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:24:46 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:54:35 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH V3] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aqOP8C7ahcxCng7L@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260910100801.2159785-2-mkchauras@gmail.com>
 <ffd8e0c3-0d78-46ee-9ab1-59dbfe0b6d27@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ffd8e0c3-0d78-46ee-9ab1-59dbfe0b6d27@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_222448_111901_DC80E1EE 
X-CRM114-Status: GOOD (  11.53  )
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

On Thu, Sep 10, 2026 at 05:08:48PM +0200, Christophe Leroy (CS GROUP) wrote:
> 
[...]
> > -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> > -   sizeof(struct bug_entry), respectively */
> >   #ifdef CONFIG_DEBUG_BUGVERBOSE
> > -#define _EMIT_BUG_ENTRY				\
> > -	".section __bug_table,\"aw\"\n"		\
> > -	"2:	.4byte 1b - .\n"		\
> > -	"	.4byte %0 - .\n"		\
> > -	"	.short %1, %2\n"		\
> > -	".org 2b+%3\n"				\
> > -	".previous\n"
> > +#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
> > +	".section __bug_table,\"aw\"\n"			\
> > +	"2:	.4byte " label "b - .\n"		\
> 
> Ah, you left the b here. The label is 1b which mean "the first 1: you find
> going backward". Could as well be "1f" instead meaning "the first 1: you
> find going forward".
> 
> So I think you should use 1b or 1f as the label, not just 1.
Hey Christophe,

Thanks for the clear explanation, this helps a lot.
> 
> I would also try to use #label to stringigy the label in order to avoid
> having to put the arguments into quotes (untested), same for other ones.
> 
Ohk, letme try that.

> Cdlt
> Christophe
> 

Regards,
Mukesh
[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
