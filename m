Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E0FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 11:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pq8izXXKcb1ZuR1BjMXhkr4lcpR6/YI/2VKv1L/6VIM=; b=wJ/5cnkEs9tGVB
	ybMV077ohNzNEDbjt/ax1BUZflLnbJH/VgWvJbxfBhAGDpzjFAEsnNhw10dmkI+RePyMHfpfUD9QV
	8laVwcyn+WjHF/2+a5p8vUHfxDB4V+rt5yuybsPDppyl5gE9SHYncLjM4LoyfJq4MggL44qy0V2t6
	sw6RnDqqAnUii18BI19GhFPRq4HZiVYFGZOuZREb4AUnG1d9b9xpQqOSV3V2BGqenabZPZ8DTYG/U
	zDrc47vaRPWxLNbAvfHftIecIYvVyZMPhArM0ohz9joXV3yp0O1YeeULyDbf8UP7LeWE3AV9LYuOi
	1yXU6Mu+jKpOTUUYghxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA9W2-005Fvf-Oc; Wed, 19 Jan 2022 11:52:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA9Vl-005FpK-U2; Wed, 19 Jan 2022 11:52:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 92085B8199C;
 Wed, 19 Jan 2022 11:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2160C004E1;
 Wed, 19 Jan 2022 11:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642593139;
 bh=QfpuL80/duahPHOR1KalTLy06DYEW34Je3XdZ5Xf75o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m20X0mJ3MzAXLJNXcmWwhF/O7iTUjdtfIexfjhZORLToSTg97fm/4gM9W6iaJgCeK
 LDE/VvkdorLX7OPmUYCHGd3iKRDjEBlEAY51Mjrnj75VWOSjRPbgHbDK099v510ybO
 i68wLNd1mS+hqMXQIKZyTtGLrBtmVYVgrOougnyK5KWeXCiM1YqF7+rfOyxiID29p+
 KyGnJZFjKCTbNwPDlmuHFFOzU3MSLGpfF1Kjf1CKGFiSDMafyPeyHobNAcCXSTWE6r
 Sykn4NY72ExihyXhecuVSwaJbwbTciTKlU2coZTaPjAn9IUSdFe7ru4In6WdKyec3k
 WRmakSOBFkXcA==
Date: Wed, 19 Jan 2022 19:44:35 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Baoquan He <bhe@redhat.com>
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 hpa@zytor.com, Eric Biederman <ebiederm@xmission.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 Alexandre ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2 0/5] kexec: use IS_ENABLED(CONFIG_KEXEC_CORE) instead
 of #ifdef
Message-ID: <Yef5oz/XiZT/Pxfy@xhacker>
References: <20211206160514.2000-1-jszhang@kernel.org>
 <20220116133847.GE2388@MiWiFi-R3L-srv> <YebK70Sx4w8zLfj/@xhacker>
 <20220119080859.GB4977@MiWiFi-R3L-srv>
 <CA+zEjCvqYAWaWW9hVbHqYm_GbV-BaiOM4c77WHnxDNh+SRDUuw@mail.gmail.com>
 <20220119093322.GC4977@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220119093322.GC4977@MiWiFi-R3L-srv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_035222_281529_FF3FD9A0 
X-CRM114-Status: GOOD (  34.24  )
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

On Wed, Jan 19, 2022 at 05:33:22PM +0800, Baoquan He wrote:
> On 01/19/22 at 09:52am, Alexandre Ghiti wrote:
> > Hi Baoquan,
> > 
> > On Wed, Jan 19, 2022 at 9:11 AM Baoquan He <bhe@redhat.com> wrote:
> > >
> > > On 01/18/22 at 10:13pm, Jisheng Zhang wrote:
> > > > On Sun, Jan 16, 2022 at 09:38:47PM +0800, Baoquan He wrote:
> > > > > Hi Jisheng,
> > > >
> > > > Hi Baoquan,
> > > >
> > > > >
> > > > > On 12/07/21 at 12:05am, Jisheng Zhang wrote:
> > > > > > Replace the conditional compilation using "#ifdef CONFIG_KEXEC_CORE"
> > > > > > by a check for "IS_ENABLED(CONFIG_KEXEC_CORE)", to simplify the code
> > > > > > and increase compile coverage.
> > > > >
> > > > > I go through this patchset, You mention the benefits it brings are
> > > > > 1) simplity the code;
> > > > > 2) increase compile coverage;
> > > > >
> > > > > For benefit 1), it mainly removes the dummy function in x86, arm and
> > > > > arm64, right?
> > > >
> > > > Another benefit: remove those #ifdef #else #endif usage. Recently, I
> > > > fixed a bug due to lots of "#ifdefs":
> > > > http://lists.infradead.org/pipermail/linux-riscv/2021-December/010607.html
> > >
> > > Glad to know the fix. While, sometime the ifdeffery is necessary. I am
> > > sorry about the one in riscv and you have fixed, it's truly a bug . But,
> > > the increasing compile coverage at below you tried to make, it may cause
> > > issue. Please see below my comment.
> > >
> > > >
> > > > >
> > > > > For benefit 2), increasing compile coverage, could you tell more how it
> > > > > achieves and why it matters? What if people disables CONFIG_KEXEC_CORE in
> > > > > purpose? Please forgive my poor compiling knowledge.
> > > >
> > > > Just my humble opinion, let's compare the code::
> > > >
> > > > #ifdef CONFIG_KEXEC_CORE
> > > >
> > > > code block A;
> > > >
> > > > #endif
> > > >
> > > > If KEXEC_CORE is disabled, code block A won't be compiled at all, the
> > > > preprocessor will remove code block A;
> > > >
> > > > If we convert the code to:
> > > >
> > > > if (IS_ENABLED(CONFIG_KEXEC_CORE)) {
> > > >       code block A;
> > > > }
> > > >
> > > > Even if KEXEC_CORE is disabled, code block A is still compiled.
> > >
> > > This is what I am worried about. Before, if CONFIG_KEXEC_CORE is
> > > unset, those relevant codes are not compiled in. I can't see what
> > > benefit is brought in if compiled in the unneeded code block. Do I miss
> > > anything?
> > >
> > 
> > This is explained in Documentation/process/coding-style.rst "21)
> > Conditional Compilation".
> 
> Thanks for the pointer, Alex.
> 
> I read that part, while my confusion isn't gone. With the current code,
> CONFIG_KEXEC_CORE is set,
>   - reserve_crashkernel_low() and reserve_crashkernel() compiled in.

Although the code block will be compiled, but the code block will be
optimized out.

> CONFIG_KEXEC_CORE is unset,
>   - reserve_crashkernel_low() and reserve_crashkernel() compiled out. 
> 
> After this patch applied, does it have the same effect as the old code?

I compared the .o, and can confirm they acchieve the same effect.

> 
> arch/x86/kernel/setup.c:
> 
> before
> ======
> #ifdef CONFIG_KEXEC_CORE
> static int __init reserve_crashkernel_low(void)
> {
> 	......
> }
> static void __init reserve_crashkernel(void)
> {
> 	......
> }
> #else
> static void __init reserve_crashkernel(void)
> {
> }
> #endif
> 
> after
> =======
> static int __init reserve_crashkernel_low(void)
> {
> 	......
> }
> static void __init reserve_crashkernel(void)
> {
> 	......
> 	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
>                 return;
> 	......
> }
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
