Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E575EC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 18:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/RbjbTT49tkBxJBM2jbHgL3OllrUP52HV/9dAsihzg=; b=JG97gKEooRPIwC
	l9dkLY6IsCHIsaZ6HNq7n10eW7VisuZ2KC1thsY+Lry0DZyRZL6NRfC8VUJCM7qHKGtFSNhbh87lg
	DfztD4pIZU2551yxkeuc93rlhffZ6Gngf5PPdzBVCFTpsu1p7F0n5FJvhRC/P4kuwjg9i1do31juD
	avsht6kyNIpXj30dl8JtMwiUW7xvZdXrC4GNBDMcTn12uWrxR/SEH86HJ3pLd6Q96VCt4ExJIZ9b/
	UoNpPOdMmqHpl7M8Uem+kzkuLXRasHno4pvJNOS+UPXdzmTQcoMDVZS2XdseSxkHnIdFD4bCXP2Ar
	RdHYCMxONy/Cl1xd244w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBv6-002tEW-Bu; Thu, 09 Feb 2023 18:45:20 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBv3-002tBj-AF
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 18:45:18 +0000
Received: by mail-lj1-x22b.google.com with SMTP id h17so3171644ljq.4
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 10:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D9Vua8LHA9JDjb46CzlFrnWZQdagkljpU9vsHTc0DF8=;
        b=4Asl2/b/Hg5mXqTofzECxhuPfV/1ELQIDimYZFo5ccuAteJziSJW3pYDXsJDmq7Y+p
         lpDDHNBVBIsZjuYrhT/8CO7je+D0yRIjnKBMx7GuQ3Iwx4I+G+nLehVUbH0TEajH6s3U
         IGsZgyI4UYvCbVRF6nLgaIyeCV3hvJ8a2V3A2Vjy++cLtMJNGrdeWeSVfxiocHfTBnmv
         cOjTcm/RJ8fTXs6aU7mjTOA1KODjFpjh2yfJC5p0X/XOKH0yKrgYtdSeuIdVkI7TSyDb
         19CjtZZWizsZnlrnI2iIceIRDLtgL1q5rBjOWBiImMnlyVTMwktoAUn5RJDzF2BRDSRK
         /9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9Vua8LHA9JDjb46CzlFrnWZQdagkljpU9vsHTc0DF8=;
        b=EFRv/yhDl8fZ0YeoyyW0O7IhvUh1v8ZZfMF8Oq/fPX99kd0x7gw7BHcbXU1xioB8J3
         dk+HhYbUwceWxExbUf4RPQjKzIrWYO/rIpZicK1783x5jmy55x1CgaWX3GFpt3X8Tpeo
         PVmICTS4udOIgs4x3WDNrFJHi3pwt2IWdkStDNClnanCYQ3UGMnOioHGdqvwp22KFIbE
         uxrdPkTtc9ozjH4lKnYWG0ZpePP0iN9o/93zcapQzXBtu4TBzKJQxcI7nZDQF1x9qoMy
         BFbwH88eJH5emDbHFWFQyIGZ5kn1e5139Q9hCZrkUPGAouG4RAyZuuwB7Kt9ZhTvEC/A
         2U/g==
X-Gm-Message-State: AO0yUKV7sAEQuxO6nAbzsVDhHgn5o31hT4ppGmQ0bqHhtfvNJPvo8e27
	WiZyz6dS2a2W+9QGfkQHG+WegvZW5EdlBnimtHugdg==
X-Google-Smtp-Source: AK7set9BEO75w+/zGEdYth0f1dUrFoFb09CZjL4/pITzFZUZHnpCtKSQrnmioh62h4aT4HugkczFG9LjIBQvWztIKT8=
X-Received: by 2002:a2e:6f14:0:b0:293:125c:284f with SMTP id
 k20-20020a2e6f14000000b00293125c284fmr2100576ljc.148.1675968312327; Thu, 09
 Feb 2023 10:45:12 -0800 (PST)
MIME-Version: 1.0
References: <20230206201455.1790329-1-evan@rivosinc.com> <20230206201455.1790329-7-evan@rivosinc.com>
 <Y+FwvI+xRg7zMhSx@sirena.org.uk>
In-Reply-To: <Y+FwvI+xRg7zMhSx@sirena.org.uk>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 9 Feb 2023 10:44:36 -0800
Message-ID: <CALs-HsvQiRm-guFMy-E4J+CTLoOMoxb=JiedbtFrdXwzz-oSoA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] selftests: Test the new RISC-V hwprobe interface
To: Mark Brown <broonie@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor@kernel.org>, vineetg@rivosinc.com, 
	heiko@sntech.de, slewis@rivosinc.com, Albert Ou <aou@eecs.berkeley.edu>, 
	Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_104517_375563_4024EEA3 
X-CRM114-Status: GOOD (  11.15  )
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

On Mon, Feb 6, 2023 at 1:27 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Feb 06, 2023 at 12:14:55PM -0800, Evan Green wrote:
>
> > +int main(int argc, char **argv)
> > +{
>
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/libc.S
>
> > +.global _start
> > +_start:
> > +.option push
> > +.option norelax
> > +     la gp, __global_pointer$
> > +.option pop
> > +
> > +     la sp, stack
> > +
> > +     la t0, heap
> > +     la t1, brk
> > +     REG_S t0, 0(t1)
> > +
> > +     li a0, 0
> > +     li a1, 0
> > +
> > +     call main
>
> This looks like it's just a standard program entry but I don't speak
> RISC-V asm so I might be missing something.  If that's the case might it
> make sense to use nolibc here?

I think I can just remove this file entirely along with -nostdlib, and
just let the compiler add in this glue.
-Evan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
