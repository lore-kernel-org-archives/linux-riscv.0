Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF62C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 17:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzKf0VQEMKMCyUajXhPWw8fTle3RASYyXMyeauIlTXc=; b=Ay8WkcLgXSIaw7
	yQcChmeAnGYmtg9eILXMkSYwY6LW+PuSO1Da1XziivDQesccIGEvERBI2QaScx1LMuJsjqtfAEuLH
	goIlm6xE1hc7Ma9sVG5ppyxToPPtBdDBPYwsjSyw714BNnOUdbo/V0OB90sQmwUB+oJSw0A+Vr9n6
	oxtIomm5bDq/17lBZf4O+eRXUkX3jMC/gkc3IxB+1oXkimLW+EgZzs4Z6ewz3StDafNkgKa5Qsr8t
	N/4h5AZdVVUFhrSiTwsWDip49vEp9Dr35MMxrtQQLoNB85yxqbwKGyhb7ffK0J7JLavSB0kBa+Yon
	5LzCOTHFNf+KG3Ccvbtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJfMm-00GPcx-Mt; Mon, 14 Feb 2022 17:42:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJfMj-00GPbh-GT
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 17:42:22 +0000
Received: by mail-ed1-x530.google.com with SMTP id q17so272589edd.4
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 09:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hl2tx2/b0j1as4iPc8br7ak6VbssTN3Lkaa01qKImp4=;
 b=B3+89vMVlD+t/jr4Ir3J5heCAGLy+8O/Bfqv5DSjHS7vGRacFAUCCs0TF2tOD5+IOJ
 DARHbhMwmXg8IKTGNN5wyW1UIWJ3dy3zDkUXnMSy6euD4EH/SAawjrYbWaSs+0JtxWja
 ZBOb3OkzZ9V/CSYGxjkJVHb89skxzNvZve0yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hl2tx2/b0j1as4iPc8br7ak6VbssTN3Lkaa01qKImp4=;
 b=b1rhQTE5MeJ3elkfuMetFLKUdSFEkk8EUnvhvroOifSCwJ/xAavYbRWDYkGNehwrVb
 g0zQd+DeQ0Vpo3mU/UG42m/oINFxOYblriye5/ni6lSIk9ZFD3PwZ2zKhYQGaejT/+XJ
 3xVp4z0/rZVYOEdlaZuR2BhyrfJw4a5qKi3XEg6Zw3xRqHdRrLi4n3EQ7NTUQGkY6E/Q
 9ofr3K6QInEEoN/iny+5e/oU/I3YVcm16ajxY4/KCh+UFhJg2xXFCB3lGSdFMMYfohqd
 1b9Ov3q5js0E6VfQ/0WAejZR+v8oa4lzcsCS9MbpjyYm4iabKqcmBuSL5lVj52QY51QO
 Ib4w==
X-Gm-Message-State: AOAM532y+qyvfarJzeh4oG1459vxJZOhEX+AtP62bYjQmWlP975Ekruh
 TImXvoytnCeWsEj1/c7F2Ud/xeoFgB4Zj/1bcjU=
X-Google-Smtp-Source: ABdhPJyjPFPg9ljHL1JmM95uomz+na7cX7HKZa4PpkPjXMycTcKHjfOuozjIIpZihPyo9tjf5QnIYg==
X-Received: by 2002:aa7:c3da:: with SMTP id l26mr758506edr.294.1644860539540; 
 Mon, 14 Feb 2022 09:42:19 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48])
 by smtp.gmail.com with ESMTPSA id a20sm1899882ejs.85.2022.02.14.09.42.19
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 09:42:19 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id d27so24323773wrb.5
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 09:42:19 -0800 (PST)
X-Received: by 2002:a19:4302:: with SMTP id q2mr49672lfa.449.1644860131952;
 Mon, 14 Feb 2022 09:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Feb 2022 09:35:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=whXYWoP6of7js=f4zov62on97mNFRSVRWhY75WoGM6CoQ@mail.gmail.com>
Message-ID: <CAHk-=whXYWoP6of7js=f4zov62on97mNFRSVRWhY75WoGM6CoQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] clean up asm/uaccess.h, kill set_fs for good
To: Arnd Bergmann <arnd@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>, 
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Rich Felker <dalias@libc.org>,
 David Miller <davem@davemloft.net>, Richard Weinberger <richard@nod.at>,
 "the arch/x86 maintainers" <x86@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb@kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-hexagon <linux-hexagon@vger.kernel.org>, linux-ia64@vger.kernel.org, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 openrisc@lists.librecores.org, 
 linux-parisc <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-sparc <sparclinux@vger.kernel.org>, 
 linux-um <linux-um@lists.infradead.org>, linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_094221_554643_1F768C6D 
X-CRM114-Status: GOOD (  13.99  )
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

On Mon, Feb 14, 2022 at 8:35 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> I did a patch for microblaze at some point, which turned out to be fairly
> generic, and now ported it to most other architectures, using new generic
> implementations of access_ok() and __{get,put}_kernel_nocheck().

Thanks for doing this.

Apart from the sparc64 issue with completely separate address spaces
(so access_ok() should always return true like Al pointed out), this
looks excellent to me.

Somebody should check that there aren't other cases like sparc64, but
let's merge this asap other than that.

              Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
