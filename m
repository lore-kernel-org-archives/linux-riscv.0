Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F39C77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+K9UVtY7/GrDO8xTa2S3sQIfpIQTVFuPiOw9SOuMYGw=; b=sGaI+fwPfQYYCJ
	BFDtwtQz4vFSe/wKQPE1fshiU96Z0HTHlXGz1d4qmRpFnEfOlB2Fhvzkqnw7pom7FFoKfAfHtEdJv
	a76xfaJXoEskH3Tj+if82enTKyAfABsVJx+Qu19aU4APuqs4yY40zC+TIRX4nkm55LMgo5wpvpOZ8
	qkRRpifga2OmWE/C11vvAWrr7OmiiRgBJ4f88MzuQ0DGtWysybaFlTQseaK9CoKXl8zdr8kTlYnlp
	VNw42IqE05e2ojFPupvxapXA3KWDtIyuE2Cl8aVs4O5XserPn0R4wDHQs+AW14k6jPRpnCAp5iLiT
	NZj3Osi0qimDeHjSwo5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q41mI-00EUt3-1p;
	Tue, 30 May 2023 16:00:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q41mE-00EUqh-07;
	Tue, 30 May 2023 16:00:51 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685462447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m93yS995VjAenJm1Tq30bXHcCehNtX8a6hAD3sks2W4=;
	b=AfBAWRGV89Mc653n/xLqy7vteib+6M5/l2mZj+wR8AGKO3PMoCQnprQPz2JjGFxvFh3npR
	75LwJDM0EE4g+P7BnJV6fDBo0D5A2wsMq2qcoO+Epgc1++GT/hm/IsyZQlfl88sd3wNdLj
	HacEZyX2iikiKMUlVpHMaBRfI2+ABpbUurQzM9ir/bGUnTaJbVHwLys+6ejBpuK/Ql2gfK
	8t5edlP2m1H7BWSDdUEp+QUPxhedXZYO6JcbMtV5DS0rwT2VI36zKlSE9ot+0iGtjPkQ+7
	L4moXOZFPonmdPVRaj68CTj/NyhRRfgqXsWZ04Esn64uoqL2rtpo8bp2DKqCyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685462447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m93yS995VjAenJm1Tq30bXHcCehNtX8a6hAD3sks2W4=;
	b=kHOcw6J0QHtLvp0yEL0d0xC3npNrA5vZH/XdZXuEI3If84/jq/yLIElk56Kjr2Nz9yF9mV
	nI3pJZIHdR0bsSDw==
To: "Kirill A. Shutemov" <kirill@shutemov.name>, Tom Lendacky
 <thomas.lendacky@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Sean Christopherson <seanjc@google.com>, Oleksandr Natalenko
 <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, Russell King
 <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch] x86/smpboot: Disable parallel bootup if cc_vendor != NONE
In-Reply-To: <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name>
References: <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
 <87y1lbl7r6.ffs@tglx> <87sfbhlwp9.ffs@tglx>
 <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name> <87bki3kkfi.ffs@tglx>
 <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name> <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx> <87cz2ija1e.ffs@tglx>
 <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name>
Date: Tue, 30 May 2023 18:00:46 +0200
Message-ID: <87wn0pizbl.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_090050_217773_D58AA995 
X-CRM114-Status: GOOD (  12.63  )
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

On Tue, May 30 2023 at 15:29, Kirill A. Shutemov wrote:
> On Tue, May 30, 2023 at 02:09:17PM +0200, Thomas Gleixner wrote:
>> The decision to allow parallel bringup of secondary CPUs checks
>> CC_ATTR_GUEST_STATE_ENCRYPT to detect encrypted guests. Those cannot use
>> parallel bootup because accessing the local APIC is intercepted and raises
>> a #VC or #VE, which cannot be handled at that point.
>> 
>> The check works correctly, but only for AMD encrypted guests. TDX does not
>> set that flag.
>> 
>> Check for cc_vendor != CC_VENDOR_NONE instead. That might be overbroad, but
>> definitely works for both AMD and Intel.
>
> It boots fine with TDX, but I think it is wrong. cc_get_vendor() will
> report CC_VENDOR_AMD even on bare metal if SME is enabled. I don't think
> we want it.

Right. Did not think about that.

But the same way is CC_ATTR_GUEST_MEM_ENCRYPT overbroad for AMD. Only
SEV-ES traps RDMSR if I'm understandig that maze correctly.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
