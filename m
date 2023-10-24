Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E747C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 04:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtChXrBWwhiP7BlVDocO5JqkwaIQQOjI2PDmlZXc1so=; b=PNDSxDaXs1/38/
	bshrksVU8p1WRi/3oBr49lf+W1PMMGVj+xDMjLAQy31qVMiCcjt9AjVPRh1H6T1tS17LVhxEKyZcr
	o+Tg6PGJtseqQsRWs+FmsUrAed7IFIMGqPOwJNUHqSdKieXUERzS/WIPNMSF+aYpJe3GPtPkt8jFv
	BCcZ+aghU6iPcuDgMSFJyD9Rdl1i7sBLs5crxVIYRD4gg9e6hoK24cyfJ9tkGYpkgUqlJxTDfONRy
	Ig80MrUB5RGCgWW2hQ2pAtmcnSm6zZEojngd2xG5s9LIvsjs7ba8zqeLjR9zLlNTz89YT0NbIL5hQ
	rEQv2Q/OcFFFvnvtUDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv8l5-008mHW-2p;
	Tue, 24 Oct 2023 04:11:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv8l2-008mEM-2a
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 04:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698120662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=caernG/TBksc+n5E7N1NZ2+jzhSZWw1AOXk83LPtKCQ=;
	b=DxDd6aAX6buOOG5PBWOxVj1/naCsfbH3Thg+POdOlrMZq1NL9zGmJtkuCWz9b1PS84+TL9
	IBfHe/WLUinWa0mp4bRBwIN1xQlJKiMkZLDV5/P61Dy8nvogTA6fSDpVs8sFEXY7x6qo3W
	jUvL+YS2sbgj2OVjWOoX5rU/jJPg1fQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-x4-R9quaNDOSNfhk7mjDJQ-1; Tue, 24 Oct 2023 00:10:56 -0400
X-MC-Unique: x4-R9quaNDOSNfhk7mjDJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0393D185A790;
	Tue, 24 Oct 2023 04:10:55 +0000 (UTC)
Received: from localhost (unknown [10.72.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A05BD40C6F79;
	Tue, 24 Oct 2023 04:10:53 +0000 (UTC)
Date: Tue, 24 Oct 2023 12:10:51 +0800
From: Baoquan He <bhe@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vivek Goyal <vgoyal@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Eric DeVolder <eric.devolder@oracle.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>,
	Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH 2/2] kexec: select CRYPTO from KEXEC_FILE instead of
 depending on it
Message-ID: <ZTdDy8ScUPxJOBHs@MiWiFi-R3L-srv>
References: <20231023110308.1202042-1-arnd@kernel.org>
 <20231023110308.1202042-2-arnd@kernel.org>
 <ZTdALtO2rN4FaneC@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZTdALtO2rN4FaneC@MiWiFi-R3L-srv>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_211108_910519_82959229 
X-CRM114-Status: GOOD (  28.63  )
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

On 10/24/23 at 11:55am, Baoquan He wrote:
> On 10/23/23 at 01:01pm, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > All other users of crypto code use 'select' instead of 'depends on',
> > so do the same thing with KEXEC_FILE for consistency.
> > 
> > In practice this makes very little difference as kernels with kexec
> > support are very likely to also include some other feature that already
> > selects both crypto and crypto_sha256, but being consistent here helps
> > for usability as well as to avoid potential circular dependencies.
> > 
> > This reverts the dependency back to what it was originally before commit
> > 74ca317c26a3f ("kexec: create a new config option CONFIG_KEXEC_FILE for
> > new syscall"), which changed changed it with the comment "This should
>                        ~~~~~~~~~~~~~~ typo
> > be safer as "select" is not recursive", but that appears to have been
> > done in error, as "select" is indeed recursive, and there are no other
> > dependencies that prevent CRYPTO_SHA256 from being selected here.
> > 
> > Fixes: 74ca317c26a3f ("kexec: create a new config option CONFIG_KEXEC_FILE for new syscall")
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: linux-crypto@vger.kernel.org
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  kernel/Kconfig.kexec | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> LGTM,
> 
> Acked-by: Baoquan He <bhe@redhat.com>

Sorry, the patch 1/2 is not sent to me and kexec mailing list, so I
didn't get the intention of the entire patchset. I need hold the ack
until I read the patch 1. I have some concerns about patch 1 if I didn't
misunderstand it. Will come back later when patch 1 reviewing is
finished.

> 
> > 
> > diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> > index bfc636d64ff2b..51f719af10e79 100644
> > --- a/kernel/Kconfig.kexec
> > +++ b/kernel/Kconfig.kexec
> > @@ -36,7 +36,8 @@ config KEXEC
> >  config KEXEC_FILE
> >  	bool "Enable kexec file based system call"
> >  	depends on ARCH_SUPPORTS_KEXEC_FILE
> > -	depends on CRYPTO_SHA256=y || !ARCH_SUPPORTS_KEXEC_PURGATORY
> > +	select CRYPTO
> > +	select CRYPTO_SHA256
> >  	select KEXEC_CORE
> >  	help
> >  	  This is new version of kexec system call. This system call is
> > -- 
> > 2.39.2
> > 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
