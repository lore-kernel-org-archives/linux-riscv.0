Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8736C64ED8
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 13:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Q1S5Aj4MA+T3czSChAYb1xGgt7vbOfKrAx2PNzN0d4=; b=Ab3EIaTPJ1a3+B
	gwa5C0RLfZSZwH6pNR3VZkdKvDBnPn/0g1MCjNMIlIzaWITLTY7663ltrNdLRdsQx6l8+9iQqj5o8
	1x4ozdT8Etw7dRhX4aSL05xBq6Zhujss8M8Q78G2bIyZsrXuqZ3rUGoyI1TKMjXXoNRMIke1K8uSj
	J267MIhhslKb83dJBVsSH2QW8Q0Tz0uduYsq3iJ5DP2HdBd8hPLcyS88Ewk2sZo/1K96i062FK7eh
	c05KwjfLWvjb//+at9nnPqLRME/ox9pgt3F7GRQiuXWKJ2Ldm6b8b9waSSHWkiBkmrbtuOj6Ynk8u
	PhsFoRKhPp1Wd77OVDTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBOR-00GPn1-UB; Thu, 23 Feb 2023 13:12:15 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBOM-00GPlF-Od
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 13:12:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id l1so10363206wry.10
        for <linux-riscv@lists.infradead.org>; Thu, 23 Feb 2023 05:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb59OZw0P/9NeiLo7j0/pIIcP5QkKD4A9oJDDcL4MAg=;
        b=hrlRDOKwOAsNkn63EV7n3EEAQ4B9IaQtA8AIfHsOiB4TORHkWY2kK38L935i7RoAkO
         olQa3vClBYmwI8KwEFJB6OPacgNRv5x0BN4vdHf3XCEpriaGT+omA4tS0gMZiZxKcc3F
         KYWPSwsUHx/frhqkq7A+J1wZizAG8ePYV7KvjhBPsnTPCUograCrVBFqcg6srDhRwA+g
         U3yCkqCB9uB9VtPc5hwrVaCL1hVrTXMesQpZ4o6rR2fhIdFruEUpbstEzITPCLTBBZC5
         KBWMT1Y873RFeL8aM322RZ3QoSZitsWNIn2ZjY4a1FDfQORGN+A8UZHYx1nVnn/nmc6t
         CSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tb59OZw0P/9NeiLo7j0/pIIcP5QkKD4A9oJDDcL4MAg=;
        b=IWd2TeL8hQxPzwD+GbiQSrzPuYiUQ1bGKsnDsoDUuwnJJAHJp3I68K6gIraaaAn2Ax
         Mcj1EBssfyEoEbgLauPWHOPxjxCtUBDcxI7wbbT7WZf/TkCBkK8KmkqVDQwkM6zkz6m7
         g66398suu8JBhiuGzrcO4xNuefHHTHS4I3jx+4Hpe82XXQVy96sBQ7RYCQuLWWdV1gcI
         ZlNDjyNywPD7vdJzAU/d7nOSzhaYYZEpNGVQSbYcAPwM1Exhe2tXd3g/wc+ut0wOOQfG
         Zuz4wwW+XVq1HigDWcWMtbnjEd6t2NLDmc7cf0J18UnqfQt9rpAaWLjLsOzh64f8BuIg
         By/w==
X-Gm-Message-State: AO0yUKWds/ETRfATkkDuvlczBS4znNW8rl5G8iTTD+vdMaoTkZZSA0c3
	A//x7e5MV6Rc+D1vEaePDNsyp0V98iHcl6dudI5Ifg==
X-Google-Smtp-Source: AK7set94r7NGT29eIpH72O39BJhvhcK+eRKfihpjHL0Bl53RKHrn48B3FXlJGKNmfO3t+QnjF/nB7RwGXZWsm1mLo5s=
X-Received: by 2002:a5d:4d0b:0:b0:2c5:532b:cd20 with SMTP id
 z11-20020a5d4d0b000000b002c5532bcd20mr663712wrt.11.1677157925879; Thu, 23 Feb
 2023 05:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-4-alexghiti@rivosinc.com> <Y+zXIgwO5wteLQZ5@shell.armlinux.org.uk>
 <f3e1585c-0d9d-4709-9b21-74a63d8cc9ac@app.fastmail.com> <CAHVXubgsvjxGbgM6AcxfsHDsHT0iL2pAemGMr5t8KVLKiqC3RA@mail.gmail.com>
 <874b8076-b0d1-4aaa-bcd8-05d523060152@app.fastmail.com>
In-Reply-To: <874b8076-b0d1-4aaa-bcd8-05d523060152@app.fastmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 23 Feb 2023 14:11:55 +0100
Message-ID: <CAHVXubidtBHNi8iFrFAWqRtkxiUBbmzzXFn+=R1DjEd5X0SpQw@mail.gmail.com>
Subject: Re: [PATCH v3 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_051210_827220_7FEA97FC 
X-CRM114-Status: GOOD (  31.75  )
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

On Thu, Feb 23, 2023 at 2:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Feb 23, 2023, at 10:54, Alexandre Ghiti wrote:
> > On Wed, Feb 15, 2023 at 2:05 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> On Wed, Feb 15, 2023, at 13:59, Russell King (Oracle) wrote:
> >> > On Tue, Feb 14, 2023 at 08:49:04AM +0100, Alexandre Ghiti wrote:
> >> >> From: Palmer Dabbelt <palmer@rivosinc.com>
> >> >>
> >> >> As far as I can tell this is not used by userspace and thus should not
> >> >> be part of the user-visible API.
> >> >>
> >> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> >> >
> >> > Looks good to me. What's the merge plan for this?
> >>
> >> The easiest way is probably if I merge it through the whole
> >> series through the asm-generic tree. The timing is a bit
> >> unfortunate as we're just ahead of the merge window, so unless
> >> we really need this in 6.3, I'd suggest that Alexandre resend
> >> the series to me in two weeks with the Acks added in and I'll
> >> pick it up for 6.4.
> >
> > Sorry for the response delay, I was waiting to see if Palmer would
> > merge my KASAN patchset in 6.3 (which he does): I have to admit that
> > fixing the command line size + the KASAN patchset would allow 6.3 to
> > run on syzkaller, which would be nice.
> >
> > If I don't see this merged in 6.3, I'll send another round as you
> > suggested in 1 week now :)
>
> Hi Alexandre,
>
> I have no plans to still pick up the series for 6.3. The patches
> all look fine to me, but it's clearly too late now. What is the
> actual dependency for KASAN, do you just need a longer command
> line or something else? If it's just the command line size,
> I would suggest that Palmer can still pick up a oneline change
> to increase it and refer to this thread in the changelog as a
> reference for why it is not an actual UAPI break.

Indeed, we only need a longer command line size. I'll ask Palmer to do
that then, thanks!

Alex

>
>      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
