Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160F4C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 03:51:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E6060FEB
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 03:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E6060FEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yvQWCaMWkm3lBoQZ9Spfcx8Fmj5Y802qhEtdrDThnwY=; b=Xqpve8R+oMvS/F3dOGot0D98g
	azqpZZTSQ7JA5RyXqYXSWbU/w95OkWC0cCsqb/3ReSKTP6/6SpYMJAONyscVxAhfSi6yWu9tibGjg
	Ixh/ZNNY6zxHIm4TgYkRKs/Iiwx15AINuWFEIbxk1xvNn07JvEcqyvh6PoSgl/u5HZzkDjekcUtx1
	YOPKEaEwDqaKFnXGIYZRChbWhIW00hkOYLhBH7R0Ux9Jqe8yRb5EG9rP5I52/6aS13kMgtTKFQs6h
	FqbZZzKH4CZjo+yFX/VMrlp/YZa3kF/h98CUGTH+GOKONQr76u1n8QdTxGna1YT7zNKeufEmD+alD
	/cDGLoOYQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljDEi-002dqh-PJ; Wed, 19 May 2021 03:51:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljDEX-002dnp-Vq; Wed, 19 May 2021 03:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZCV/btGW8S5gQj0tGRxO8WwgX9egavSwWcChLJYNIJE=; b=0md54zoE/NrFTBAFkfZ65tfr/q
 +akdRFexaCv05nLF2Pq82RoMMohvbS39jeS8yYMwYnM6c+JKAQ4ksOLgwT0xjcPR4jQahCzZrG5Zr
 TLHdYsfFMcbYfSPvMCoO6ps/s+ODc/J5S989sYtwhrPGU5FkUjWdcyF3klwGrLOHbIjIrUmHjpCVE
 WRlKXqqcaS+m7B0kqGwu3smCbvsp3moSF1C8El1yNceDcErXooHtMRtDIapw5br/SjszleWRMUTwe
 OFMaQtSdqtp9Bg0qzaPLhmkSiZwRlXBN1G5ObntV8jt8TmlxTH45F7A6bqBmbG4fVrc4lZ/3qGXfF
 p4nr+SxA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljDEV-00F6Ql-FT; Wed, 19 May 2021 03:50:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A22160698;
 Wed, 19 May 2021 03:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621396255;
 bh=OHqMi61ZqX4ySIrfnisk/+K7U7qM/mCXhP8jYMj1P84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YYAE07pQhQM8o7Wp7sXA/L3u7rt0s5M+ViFahOF7b94Od8vLSvNm59LWBWGahD5Td
 //07qQooCrEAvIEElW9/DslmDL8J4D2K38vvD2y4ZIFnrbiE6mYEZP+qyMTJRbPQm4
 ng7WKl+CsCMDiF9ZTD5yz79TwuhQ2Bmem6NORzx5sZia3oO9BeRuVTw7r2+9JG4Bn1
 Y5+OK1WrxaIkzC5MuMQxoLI7XHdiQBfR4r9qxVwgO96jZTvNivIbQyXbGEcZ1Bo5sU
 2a/tc6+FwBn7EtnfaddaIUUJMDcK0N4p6TdNf2HQST//b3D2Bl+XNTSL1haulJxm4I
 yH1MAff7bIYkg==
Date: Wed, 19 May 2021 06:50:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 James Bottomley <jejb@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v20 4/7] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <YKSLDYqwmANLcQJt@kernel.org>
References: <20210518072034.31572-1-rppt@kernel.org>
 <20210518072034.31572-5-rppt@kernel.org>
 <20210518174422.399ad118a051fe4c5b11d7ba@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518174422.399ad118a051fe4c5b11d7ba@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_205055_576758_7FD30357 
X-CRM114-Status: GOOD (  18.47  )
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

On Tue, May 18, 2021 at 05:44:22PM -0700, Andrew Morton wrote:
> On Tue, 18 May 2021 10:20:31 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Introduce "memfd_secret" system call with the ability to create memory
> > areas visible only in the context of the owning process and not mapped not
> > only to other processes but in the kernel page tables as well.
> > 
> > ...
> >
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -901,4 +901,9 @@ config KMAP_LOCAL
> >  # struct io_mapping based helper.  Selected by drivers that need them
> >  config IO_MAPPING
> >  	bool
> > +
> > +config SECRETMEM
> > +	def_bool ARCH_HAS_SET_DIRECT_MAP && !EMBEDDED
> > +	select STRICT_DEVMEM
> > +
> >  endmenu
> 
> WARNING: unmet direct dependencies detected for STRICT_DEVMEM
>   Depends on [n]: MMU [=y] && DEVMEM [=n] && (ARCH_HAS_DEVMEM_IS_ALLOWED [=y] || GENERIC_LIB_DEVMEM_IS_ALLOWED [=n])
>   Selected by [y]:
>   - SECRETMEM [=y]
> 
> so I went back to the v19 version, with

Ouch, sorry, I forgot to remove that hunk, v19 is the correct version.
 
> --- a/mm/Kconfig~mm-introduce-memfd_secret-system-call-to-create-secret-memory-areas-fix
> +++ a/mm/Kconfig
> @@ -907,6 +907,5 @@ config IO_MAPPING
>  
>  config SECRETMEM
>  	def_bool ARCH_HAS_SET_DIRECT_MAP && !EMBEDDED
> -	select STRICT_DEVMEM
>  
>  endmenu
> _
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
