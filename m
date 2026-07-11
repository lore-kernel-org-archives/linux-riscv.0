Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D561C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 12:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lf4m2bi8fp2cgickoYTqO4KqeqjcV+6vfYIA9yz1NHw=; b=R9WTHTR4LYNpAD
	eNx2V4gY5OjgR3Bs6rxa8GU4EyzOTy9Cl4c7XOvMxKghfUCBC3COMg+cyG/bmRtfPAhLTfY2Xz5ri
	WzFRRO60+P20dmP0dS3ze/1zELjvb6WCDJjHn0FEsPzZxmxr4/Y51nxtTdGTzOaKlCBWt1Xz8J8Bp
	PNNmKP3TB1jr/fTBjCvpo0KHoF4LhZ/Zd96CUgG1z8u2KQj9PmVFSj/+KWEyvIWgYD0tdvK62gDW0
	53rMF4egW9wuT3kbWK5C21bRrQydiHukgvlBj7UZTbDpmLSVOc+Bp/GTBeZbM6hKGlS/6DBsD+4yZ
	iUEc3/apTgcWzRydffTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWpn-00000006XDF-0ABt;
	Sat, 11 Jul 2026 12:29:31 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWpi-00000006XBB-2XBn
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 12:29:29 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so2734947a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 11 Jul 2026 05:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783772964; cv=none;
        d=google.com; s=arc-20260327;
        b=pBDs9N8PnHnFRErBkOuP/1fhVTf5MBMHjiCXpbEIWjdypBqcHH7oU1AhhoHeJptbLJ
         5DAbBLXElm+gedGYuHc/TlzGI63Zct094hDhQW2FXbQH69CO6wiDN3zTb5DRKYhXlu6Z
         NApXsiZhXqHLtxZvXw5PNOFR2gf3t7oxu5xUpxKgFZiLhdDvH7TMjVNWCUHb7sJw67Dm
         GDhDUje8g9J5eeUBn30DFRwlPowmlvzldaeWH5P6/gAhpWTcjxZwLja+lGTxXQrcLmcT
         gXPYfpQTnkBd1EG37GKf4LZfjZtifL2e1QGZHJYieyALJEvQtczM5rAADKkyzECBaGZi
         g5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        fh=iH0mJ5aBm5l01/jM8KfHKcc2nLfM3/yvCQzkPx0NRGg=;
        b=p2ptgY6/nyjRiAdpVE1nneIQwgTgSjABtxrVE1Cr5KxoosHyX1160GPGMgxPGqy7hj
         kW2QpJshNXOficIHZuIl1x/Z+TJOjKEe4H37/9mL4c0fwJVg7IoEjkMkoScOFcYfBrFu
         5oP2DUdoCZeBuDIDlCJOI7ZBS07RslV6qpkPQcNzQtmx5fj6F+8jIaG/0IJTmy44ytxR
         J//qsk/+4QYYBxZJJ2gBuZ062UGV8Yiim8wyQUoyhGSVfLdrODEq0g9y98p/2KLWtG9Z
         Q2BOmjfLDKxXvqeXD8zNeMGsVuH7vW2DxKc9enmc4NUf+mQcNXXLIBzWJltWqD24KDA3
         8A4A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772964; x=1784377764; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        b=AEPV4U7oDhfoNmqPDLaJ5QJXi/cv5i1t9ID+/SIMQcOTMF855h0YJxeIClVcO8nsxU
         /QHXNkyvYDFV9l9RfKYAv27CiZkFIhxggU4ZZ7em2xpr/rQMXmPbiGmKE0RiRswiq2en
         r1geol2s09atm+oDNqTF6Q867dOKKrsIfc1uNwZkJ2KXqTUVPbIKR/0YYRauvd/x50qj
         du+9HvPAU8TAwFLofxhJsiR5yT2kUBK/M6Zw3ksqFF3R2KB6SEgskVOEdZbT752LCQmX
         k1iHJ5ok59FaSc3Ka0tBupMMcM1rSw+2KcNHmwiaPfY4B8N+SQF6lFVqIbbpZrAqoNZM
         f0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772964; x=1784377764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        b=U87E7Rs4Es8axX6itrSslzR+Jkx7tgbOFbE2O1W7C100zTjF03uXvI5DfjwtLeFjKt
         Z22uijkJeZj4rgtQyPWsL5G65y6/xpRIyynbGj3NM8fYnUpLjR0ovTFDtOVtR6uRk8hL
         A0uM2mN92obgYYJmOhhIkLFjvs5QijWEs1qzZLZujrAbFp0S3o+iUmDLVGWzCElxxl+z
         0MjiaSm1q+YTeNC9B1I2aObA9ouFuICmLMBTV/3TUKDU8bO3HTRHcC/KCKKKCPAPZ5o+
         J3RHBGARFVgJy5lHFxX1FCnIAV9XVetXbADLry8lMFA3rLzAPcf5cvrZnk0vZm7nNhl7
         H9cw==
X-Forwarded-Encrypted: i=1; AHgh+Roi8H9EimQPVc+qWFVZg1Xg5Y+r9hsKYEzVRgnQp9pQg5fC3RowfGjVSYjZFrPljQnu2A/xQPBzFJp88Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMpcn43B+aB56QagcbXNx9KM/+AK1rvh4QkmPsGJPGnxVsCcn1
	C3hS7MNiiF1Gvo+gxxTBpJZPKubp/wwfcEmsMJXHWxVQ/g5pexQFu6GogZid6ZG8AUUi5CJG5aJ
	Q0Tr19D7z5s8Oaqgy601kgkmucfwMIoY=
X-Gm-Gg: AfdE7clBfA5MWtbq1BX0JPOA0tvB+CKn/aq5zEfyZdvhc0K04rmWwSSdM0ThSM1PJef
	uY1fqPZvJmlCkHp5jsDAIjCSClSiHwjDPngZLYKYgnZSUCLyyrrN51z62anFPnK8fR5adH5Z6bR
	rxufz/eMc1nfni5zxNfjTvPs46fAsKub8/OIAqvz+txGft8xoxZGYcO2EMavaLZZWQESCpezE07
	HMvyC3SQSEOuDK6hRgU5J3/jBefc6rJj3XVVCW5e7xFC6nAJ5FAlbatfAGVa89yp9opBL5vJPVn
	t4TZNtOcsLvEtVl+htzKdiDsG+NwlO51V4DTHYCwNBDoVwg3BB3Xa87pB/p64Yg=
X-Received: by 2002:a05:6402:3512:b0:699:728e:48b9 with SMTP id
 4fb4d7f45d1cf-69c5edb9cb3mr1210325a12.0.1783772963919; Sat, 11 Jul 2026
 05:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org>
In-Reply-To: <20260707181957.433213175@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 11 Jul 2026 14:29:12 +0200
X-Gm-Features: AUfX_mzOlRB8ana7x7qPQc4frMU9J060tNH0Z2GPCNvL1LYqDKQBjM-XzHbrvno
Message-ID: <CA+=Fv5RpgQ-UeGAT+VcLufte2gAp0H=J5GqZEFR_SuQsmnzy=A@mail.gmail.com>
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_052926_670892_03CCA854 
X-CRM114-Status: GOOD (  18.41  )
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

>
> With that all architectures using the generic syscall entry code follow the
> same scheme, apply stack randomization at the correct and earliest possible
> place and skip syscall processing depending on the boolean return value of
> syscall_enter_from_user_mode[_work]().
>
> There should be no functional changes, at least there are none intended.
>
> The resulting text size for the syscall entry code on x8664 is slightly
> smaller than before these changes.
>
> Testing syscall heavy workloads and micro benchmarks shows a small
> performance gain for the general rework, but the last patch, which changes
> the logic to be more understandable has no measurable impact in either
> direction.
>
> The series applies on Linus tree and is also available from git:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry-rework-v1
>


Hi Thomas,

Thanks for the series.

I have an Alpha GENERIC_ENTRY series posted and planned for the next
merge window:

https://lore.kernel.org/linux-alpha/20260706170019.2941459-1-linmag7@gmail.com/T/#t

Only its final patch intersects with this work.

That patch removes Alpha's architecture-specific syscall_trace_enter()
and syscall_trace_leave() implementations, so the Alpha changes in
patches 11 and 12 will disappear once the GENERIC_ENTRY conversion is
applied.

It also currently uses syscall_enter_from_user_mode(), so I will need to
rebase it onto the new entry interface introduced by this series. I
expect the integration to be confined to the final GENERIC_ENTRY patch.

The Alpha-specific changes in patches 11 and 12 look correct to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
