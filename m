Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481ADEB64DB
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RiQ2JGdb0gd933UNnzdR+H2JcgzQ8URLo+csgz6nyO8=; b=A0NaTJQ5jLgFfq
	I6bNsJOCh4vd6XWCRduruIkryZbbzO0aKhmvOF8k4IR1JZImHptc/KVKYNBwZWPHAGQ/BvaMm3V/W
	hXhVE3GZIIxh5Q1/1fikLpnJy9JO3sJVHdqV/MPHFH6/B87+rXq+jzjpFgQ4Mii8mC3xjtVWiLDpj
	Li4XQP92ekW8C35b/ij13Jz+hJGPfz4yTke4p5PS0ga7/QwjEkrF1CFDH6B+lvKgN2DX7GLUukwa1
	T06wnbe7gFQ10zNvrt3Gya81IKMjBeQfF0maifRQmRITGWYDsYAWmsvTMj5tneea1SkU0VyhWKt6c
	50+wC9xsWnfmpPB6LMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBckb-00BahK-3D;
	Tue, 20 Jun 2023 14:54:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBckX-00BafP-2T
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 14:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687272868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M+loKwD1RCVu8eKK2gw8N4KlZrUem/NzN5IicUf+C0A=;
	b=cUjO6PzUxaMog/Cm8GmDa4APCuoSNaB/lsxSVSSwHsl8oXYFxcZxKbpFT8OpLFG9YK0qko
	QB70MD5JkIpRcN13ZWQ/k3YhQpfRMS1VhZGRClx8I5M6ZXw2HRbzaRNpe5t3nYIfEEimlb
	BprvqvMosjFfguz3LlSvdlY+OmyEqC8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-D3RWXn6VP66cMPoLNqUYZw-1; Tue, 20 Jun 2023 10:54:24 -0400
X-MC-Unique: D3RWXn6VP66cMPoLNqUYZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3491F8B31E1;
	Tue, 20 Jun 2023 14:49:56 +0000 (UTC)
Received: from localhost (ovpn-12-166.pek2.redhat.com [10.72.12.166])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5B4014682F7;
	Tue, 20 Jun 2023 14:49:54 +0000 (UTC)
Date: Tue, 20 Jun 2023 22:49:50 +0800
From: Baoquan He <bhe@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, geert@linux-m68k.org,
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
	deller@gmx.de, ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, kernel@xen0n.name, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, hpa@zytor.com,
	keescook@chromium.org, paulmck@kernel.org, peterz@infradead.org,
	frederic@kernel.org, akpm@linux-foundation.org, ardb@kernel.org,
	samitolvanen@google.com, juerg.haefliger@canonical.com,
	arnd@arndb.de, rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org,
	sebastian.reichel@collabora.com, rppt@kernel.org,
	kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com,
	ziy@nvidia.com, masahiroy@kernel.org, ndesaulniers@google.com,
	mhiramat@kernel.org, ojeda@kernel.org, thunder.leizhen@huawei.com,
	xin3.li@intel.com, tj@kernel.org, gregkh@linuxfoundation.org,
	tsi@tuyoix.net, hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v2 02/13] x86/kexec: refactor for kernel/Kconfig.kexec
Message-ID: <ZJG8jtNUWXxmnfao@MiWiFi-R3L-srv>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
 <20230619145801.1064716-3-eric.devolder@oracle.com>
 <ZJFhlsFN6DxnWsQE@MiWiFi-R3L-srv>
 <ac065d02-61a4-3b1f-241d-443ede70d3f2@oracle.com>
MIME-Version: 1.0
In-Reply-To: <ac065d02-61a4-3b1f-241d-443ede70d3f2@oracle.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_075429_912692_03F62433 
X-CRM114-Status: GOOD (  25.74  )
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

On 06/20/23 at 07:56am, Eric DeVolder wrote:
> 
> 
> On 6/20/23 03:21, Baoquan He wrote:
> > Hi Eric,
> > 
> > On 06/19/23 at 10:57am, Eric DeVolder wrote:
> > ......
> > > +config ARCH_SUPPORTS_KEXEC
> > > +	def_bool y
> > > -config ARCH_HAS_KEXEC_PURGATORY
> > > -	def_bool KEXEC_FILE
> > > +config ARCH_SUPPORTS_KEXEC_FILE
> > > +	def_bool X86_64 && CRYPTO && CRYPTO_SHA256
> > ......
> > > +config ARCH_SELECTS_KEXEC_FILE
> > > +	def_bool y
> > >   	depends on KEXEC_FILE
> > > -	help
> > 
> > I am a little confused about this ARCH_SELECTS_XX adding. Wondering what
> > limits us defining the ARCH_SUPPORTS_KEXEC_FILE like below? I have limited
> > knowledge about Kconfig, please correct me if I am wrong. Thanks in
> > advance.
> > 
> >   +config ARCH_SUPPORTS_KEXEC_FILE
> >   +	def_bool y
> >    	depends on KEXEC_FILE
> >    	depends on X86_64 && CRYPTO && CRYPTO_SHA256
> > 
> 
> For the ARCH_SUPPORTS_ options, I chose to list the dependencies on the
> def_bool line to show that it took all those conditions to result in True.
> However, as you point out, using a def_bool y and then listing them as 'depends on' works as well.
> Probably would have resulted in fewer changes to the Kconfig file.
> Either way is ok (the 'depends on KEXEC_FILE' is erroneous in your example).

Got it, thanks. To me, one option with explicit dependencies looks clearer
and straightforward. I need check and investigage why two options are needed,
whether two options are unavoidable. Not sure if other people would get
the same feeling or not. Honestly, it's my first time to see the usage of
XXX_SELECTS_XXX, it took me a while to dig into.

> 
> > > -
> > > -	  This option makes the kexec_file_load() syscall check for a valid
> > > -	  signature of the kernel image.  The image can still be loaded without
> > > -	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
> > > -	  there's a signature that we can check, then it must be valid.
> > > -
> > > -	  In addition to this option, you need to enable signature
> > > -	  verification for the corresponding kernel image type being
> > > -	  loaded in order for this to work.
> > > -
> > 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
