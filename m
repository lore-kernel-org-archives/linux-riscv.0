Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7A8C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 17:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TvSivMzKMb8SMg6EYby6qXg1S3AyZU8Q6uZFQjgLdXk=; b=vpMLrDo8Fhjr+cZ3gnsJM9k9GN
	uy02s8ZKkX3y0h+czSAyoq3IIDOzAZl0ImR2gGSm5Ye8JsDlaGgsBbd4YnVUCRkoDKk1wilvKtE8X
	vvZEPius8RWmUwcIq9U5mxBy4FiCpUrt3Lpqhp0xUv5+onG+vG2lmjQQCbm/lekDt0DBdbv0K5Wws
	pooaU894daZEzDC+ACzK+CGFkCT5qUbJLl5xz2aFbBM3iYyFnM+rDjKIQTxISTSMGzbKRG0SBsyd3
	qGUh5vFMQVl2NmriuOePXIbI+bV10hm96ccNIgMe3WXCLrh1kKRyXyHgwwoQGTflC06Z6A50T2tnp
	RD6sKVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q43CP-00El6g-0a;
	Tue, 30 May 2023 17:31:57 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q43CM-00El4j-0q
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 17:31:55 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-53f2128ab1bso2602600a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 10:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685467912; x=1688059912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5dIo9ozu/tftAp1UmpoAUrczqs99lWKXi5qA1UpHNYE=;
        b=fcMt7E9oftWvnXylT0q0LSi2ovxYU6GROaZO/YpP+hWVROA5CGkN858ssUM/OEUsq+
         cy2yKP5XxthrBWOhhRWmnMfaInbcFln+rmGuOYxtdLasZqdrf9i2ZKdgt/TEdCrBBjG7
         ZT9ootqRsxe/NChBz/85WsRSsuU1KSVsGHKC2qIH/mmVq1mmccPpcHFqUeIQGRkih0S3
         aGvDJJEkz3g8ZQ99QNMUDAP/dYZioxFkRygbUSwiPYm9+GJu5Jyv2dh2A01JO3qxQH41
         6ykaek6RLxvtQMhW8/hOelD76pSAAtY75YP51exJDFZC+VMuMAXLJkFisg7dDXEPnO0i
         fv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467912; x=1688059912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dIo9ozu/tftAp1UmpoAUrczqs99lWKXi5qA1UpHNYE=;
        b=BAchybpvHSdQm2NQXNXoYcl7pSVT8p/Oiv8TgNdvPJEUibSHs9PSsq2mfJW8llGBU8
         u8DHkLeYiqZhxxlxRrfC50t0ocaayb1h6p7YXY3Hm7oxg2wLPFuClw2pZvwVhCnAEb8a
         vINDrP+AXTrJAPInyFcS0UsXERc/B4yyZr9xojBhJLc75E8wPA/AQpxPKqT4yIDHK8sP
         jyKPuqXZnqVOIRzGq1VlTBtcpX/Wxu+1BlQx0Ta2uSkMejlHNs5W8FPREZnSCpuaQu7b
         hpSRxYg4U0N563K+GS8vD4FA6K88w+ne8oNxt+bjYAkEWRW3BX+gY8wiiWRP6dF64XkP
         XPvw==
X-Gm-Message-State: AC+VfDwpxhD6AABZu0MOvcOOCkv0t1mCGr+fz0yrGOeiELHHZCOVwR5v
	ZfZkUFe51qw/TzJ+Qji0gbq+Yb1lSZs=
X-Google-Smtp-Source: ACHHUZ5mA8belaIiWlXNNvjxlntxz+3HEXuwwih113OoUIVv+U+qOnHhtSEzZI4lNu6RqPJOqokzHLfKYhE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:510:0:b0:52c:9996:c1f8 with SMTP id
 16-20020a630510000000b0052c9996c1f8mr555070pgf.10.1685467911952; Tue, 30 May
 2023 10:31:51 -0700 (PDT)
Date: Tue, 30 May 2023 10:31:50 -0700
In-Reply-To: <20230530170210.ujkv737uyjfvdoay@box.shutemov.name>
Mime-Version: 1.0
References: <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name> <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx> <87cz2ija1e.ffs@tglx> <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name>
 <87wn0pizbl.ffs@tglx> <20230530170210.ujkv737uyjfvdoay@box.shutemov.name>
Message-ID: <ZHYzBrLfT6DIKBw4@google.com>
Subject: Re: [patch] x86/smpboot: Disable parallel bootup if cc_vendor != NONE
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Brian Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, 
	Oleksandr Natalenko <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, 
	Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	linux-csky@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	linux-parisc@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>, 
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_103154_298188_731CB3B9 
X-CRM114-Status: GOOD (  26.49  )
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

On Tue, May 30, 2023, Kirill A. Shutemov wrote:
> On Tue, May 30, 2023 at 06:00:46PM +0200, Thomas Gleixner wrote:
> > On Tue, May 30 2023 at 15:29, Kirill A. Shutemov wrote:
> > > On Tue, May 30, 2023 at 02:09:17PM +0200, Thomas Gleixner wrote:
> > >> The decision to allow parallel bringup of secondary CPUs checks
> > >> CC_ATTR_GUEST_STATE_ENCRYPT to detect encrypted guests. Those cannot use
> > >> parallel bootup because accessing the local APIC is intercepted and raises
> > >> a #VC or #VE, which cannot be handled at that point.
> > >> 
> > >> The check works correctly, but only for AMD encrypted guests. TDX does not
> > >> set that flag.
> > >> 
> > >> Check for cc_vendor != CC_VENDOR_NONE instead. That might be overbroad, but
> > >> definitely works for both AMD and Intel.
> > >
> > > It boots fine with TDX, but I think it is wrong. cc_get_vendor() will
> > > report CC_VENDOR_AMD even on bare metal if SME is enabled. I don't think
> > > we want it.
> > 
> > Right. Did not think about that.
> > 
> > But the same way is CC_ATTR_GUEST_MEM_ENCRYPT overbroad for AMD. Only
> > SEV-ES traps RDMSR if I'm understandig that maze correctly.
> 
> I don't know difference between SEV flavours that well.
> 
> I see there's that on SEV-SNP access to x2APIC MSR range (MSR 0x800-0x8FF)
> is intercepted regardless if MSR_AMD64_SNP_ALT_INJ feature is present. But
> I'm not sure what the state on SEV or SEV-ES.

With SEV-ES, if the hypervisor intercepts an MSR access, the VM-Exit is instead
morphed to a #VC (except for EFER).  The guest needs to do an explicit VMGEXIT
(i.e. a hypercall) to explicitly request MSR emulation (this *can* be done in the
#VC handler, but the guest can also do VMGEXIT directly, e.g. in lieu of a RDMSR).

With regular SEV, VM-Exits aren't reflected into the guest.  Register state isn't
encrypted so the hypervisor can emulate MSR accesses (and other instructions)
without needing an explicit hypercall from the guest.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
