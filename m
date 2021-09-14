Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D348CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 15:43:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3F3D6112D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 15:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3F3D6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tB3/pxR9IBkwCSWb3cpDDtEyRhJI7ktATjd7iXQYG/Y=; b=UreIYbxxxTH9fp
	ci7VK9lCMJRxuDPBApZopYgLeQH00CfqYpZQGLULBH8dKU5WyAqtCnjpQr2jc9aZPHTT650OcHBb9
	LGxd4JGUUsyH42K0fFXQdFHQmp59ae9zCEspgHcVwFPIRfxHHE7gPSaT1z22YfoByfhdOLgGM7Cjz
	GyEIH2PfSJv/t2oQp/+6Ygxl0pYMIOK+r3eUjFgaLh6Hrf2HOPBP6bqpC81V472+s6ojVQ7R+BIY1
	5g2lEtoMH+Qe3MIvHL8haAPSsiyDVMJXJgcBDjtRa8ypQPssmRCisYkymDlQqArmadziTNsQeT/aL
	7d95/WCFZ7dkpZh78wTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQAad-006Faf-Pk; Tue, 14 Sep 2021 15:43:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQAaN-006FUh-3i; Tue, 14 Sep 2021 15:43:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C4EF6112D;
 Tue, 14 Sep 2021 15:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631634182;
 bh=mvuoWRdgyktEZkP8N46MKfVzy+eYPbk3NccSIQmsP8g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ph5ZqVPKz60iK9jbnMMHsjXBaQdrXwsBRBP/oY5ViglsSMBFV5powNMaVQ4auKrPu
 QouXKtu79CVgLsg/mn5aflQKHJ9fUrSCeIu3pbr+WyLQjAKfPdgNS+Sjg2X/WlBO4G
 PcjQkfG1Fcg2nBfE13CR4dyTMAxKe2ztH6ZA1Dv8eLGebuSdXy+pyZabacWreW+GXI
 At43/HWkltAtpCwRjPg35I8OB3vlAy3GejIF+k5ffTYzztvv4KINQiZ/t7L16MrUma
 RwKnqC1ex9R/oO5e2xfgu0pxrFVnklawppeNa6CLjU+LWNeEKGusdGDH4O/mV075PP
 vt/m867HPNEgw==
Received: by mail-ot1-f46.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so19059349ott.10; 
 Tue, 14 Sep 2021 08:43:02 -0700 (PDT)
X-Gm-Message-State: AOAM533L42I3JpQlyyctNGy6qaPLaV7taRfa7Nnjjm49Y4exNXbAgYhK
 0UvL0gPz1wlhWmUU4SyL1jX31fD8Zgaq1mga1Bw=
X-Google-Smtp-Source: ABdhPJwx57mZePF/+fKNrTKtnKV+7kzFgjzys0SKRPzR4omYEyny9bMvp54Zq3YK48l3ZGnV9SP3mhoLYT9teXG8qeY=
X-Received: by 2002:a9d:200b:: with SMTP id n11mr15190375ota.30.1631634171520; 
 Tue, 14 Sep 2021 08:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-2-ardb@kernel.org>
 <CAHk-=whkCzP-wyZ08r9RDJRx9cbANVHy-jy=vJAGTkSbXm50iA@mail.gmail.com>
In-Reply-To: <CAHk-=whkCzP-wyZ08r9RDJRx9cbANVHy-jy=vJAGTkSbXm50iA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Sep 2021 17:42:40 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHK74XKWWs4C9zckOZsJP4cD+=B8gMx8QoohYVN61CJ-g@mail.gmail.com>
Message-ID: <CAMj1kXHK74XKWWs4C9zckOZsJP4cD+=B8gMx8QoohYVN61CJ-g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/8] arm64: add CPU field to struct thread_info
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Keith Packard <keithpac@amazon.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, 
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_084303_205386_2E222E17 
X-CRM114-Status: GOOD (  14.60  )
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

On Tue, 14 Sept 2021 at 17:41, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 14, 2021 at 5:10 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > The CPU field will be moved back into thread_info even when
> > THREAD_INFO_IN_TASK is enabled, so add it back to arm64's definition of
> > struct thread_info.
>
> The series looks sane to me, but it strikes me that it's inconsistent
> - here for arm64, you make it unconditional, but for the other
> architectures you end up putting it inside a #ifdef CONFIG_SMP.
>
> Was there some reason for this odd behavior?
>

Yes. CONFIG_SMP is a 'def_bool y' on arm64.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
