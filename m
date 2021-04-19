Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C57C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 11:57:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF3D66023E
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 11:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF3D66023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QQ+PwSmtbDH8S1G+MUdAXpgBd2umu734JP05KbWOmfs=; b=AOPyRv9FBwImoHK66DQrnmEWd
	XVUl4lWMPH12U5Ia3KEmHFctzlSlTCLx7A/splcZuC90LGYwc433lFpmWQ2IpdcqVTS7ei2XERd6O
	wUiXcWBakarUS7ndS+akdv9lqN+XIZUCcdJYKApIqNH1Xy0bjy5q6EZZpBaRd8Q4aMkb89BVhNIRL
	0eFKtTfwr1aT5o7WdxuYKy/s2Clci+yMvMk/Hp3PxTlSRGL2cNS2Cdd5qaCn2NYFhoe6xlZlXnxAl
	ZDt1CwBDJVO+z96jK3eqQpyT1qy93pUO2Iac7aGfM3XASk/7WktXrqAmgOvWaqTJ17HYCUoIcaFe1
	3A4uQczew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYSWG-009on2-Fj; Mon, 19 Apr 2021 11:56:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSW6-009omV-C2; Mon, 19 Apr 2021 11:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ak6SUsGcCKUXp0uexKVh4pg4bkWT7Aw75jnWGF55YFY=; b=mEFAPUvj9i1r/3w2jvqz1pixGv
 34bQnM/9xb7tzh2HAfyxqEQSuHKY2Ge5ov/90TtfRWIq68FFvDoYwDOWumKexWeOBw/Coo8RQsPkQ
 HnYtGqeZjjG3wDm2DZyaYIgrDieQ9F6cRglbtqrCafPHroFu0d4rkiupXR4dnEmYKvqaSzctyf8hV
 lsS45LFd25WSftYYiGIaOIupigYOZ9pvNSp2l+UbjkWB7pGFEXm/h6TCF7Nt1cetBiSTgBw3FhDYd
 Rm3bTyauncPANc342+crciGGKq28L3s3esxZihFEAKLNCHWQxPlMkHJNUukYoqn2kaqqEkJRgeOda
 silyOs3A==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSW3-00BKTK-Mk; Mon, 19 Apr 2021 11:56:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03A2761221;
 Mon, 19 Apr 2021 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618833395;
 bh=6A/ev0xWFu6QEr1qRdJmTLcg7g1Q5yOrYX9lSKkBwrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uxO9956IYPxD7CWbXB3fSSCXGQTBGoPbq8d0e6mudSqUOOR9D/a/frTDdxrhpXp3T
 u3HOTCCCGMxCE/5oFsDEE7CL7oJo0UiFyE8XATL/PtjV1UyIMF3EyMmtXChnpmANf3
 xvGP/jZELsbTCSFAeN0de19xcjENeBafkHrYYT3aIAMpwGMCplJXdJyijY7bDsnsxV
 /MOKSwyo2LLpN1+M7yhhDDA1uJNr6IoUGDX83ZilzKhM+0TcMHp8KZpuLjiLSDsEjb
 4PrIm8F9iUjdT44aR4dOTbKzDBo3Crs7XfVqwdx02xV+XZiDVN4SXOnKlpH/im2nqn
 6aIPJA3ZtmO0Q==
Date: Mon, 19 Apr 2021 14:56:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
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
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH] secretmem: optimize page_is_secretmem()
Message-ID: <YH1v4XVzfXC1dYND@kernel.org>
References: <20210419084218.7466-1-rppt@kernel.org>
 <20210419112302.GX2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419112302.GX2531743@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_045635_814423_28378031 
X-CRM114-Status: GOOD (  20.98  )
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

On Mon, Apr 19, 2021 at 12:23:02PM +0100, Matthew Wilcox wrote:
> On Mon, Apr 19, 2021 at 11:42:18AM +0300, Mike Rapoport wrote:
> > The perf profile of the test indicated that the regression is caused by
> > page_is_secretmem() called from gup_pte_range() (inlined by gup_pgd_range):
> 
> Uhh ... you're calling it in the wrong place!
> 
>                 VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
>                 page = pte_page(pte);
> 
>                 if (page_is_secretmem(page))
>                         goto pte_unmap;
> 
>                 head = try_grab_compound_head(page, 1, flags);
>                 if (!head)
>                         goto pte_unmap;
> 
> So you're calling page_is_secretmem() on a struct page without having
> a refcount on it.  That is definitely not allowed.  secretmem seems to
> be full of these kinds of races; I know this isn't the first one I've
> seen in it.  I don't think this patchset is ready for this merge window.

There were races in the older version that did caching of large pages and
those were fixed then, but this is anyway irrelevant because all that code
was dropped in the latest respins.

I don't think that the fix of the race in gup_pte_range is that significant
to wait 3 more months because of it.
 
> With that fixed, you'll have a head page that you can use for testing,
> which means you don't need to test PageCompound() (because you know the
> page isn't PageTail), you can just test PageHead().

I can't say I follow you here. page_is_secretmem() is intended to be a
generic test, so I don't see how it will get PageHead() if it is called
from other places.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
