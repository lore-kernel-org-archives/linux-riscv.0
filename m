Return-Path: <SRS0=ZUll=KM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E20C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 17 May 2021 07:24:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1878611C2
	for <linux-riscv@archiver.kernel.org>; Mon, 17 May 2021 07:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1878611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WM2Mpd8i5JZy23ygsT0e31F4vkgdQ1N1HcGDM2/ExG0=; b=oJQN+1+2fSgoF9+sxrM1ycV8I
	UvfMRj4V3ODOxUimh//UFIhQDzOCx40RAc6OYNvpIt9Zku8BiOl+6xyuGpD770E2fwS7w6rHnfeXZ
	8pHxzcGysENpc8S9sY/elpGQO/9wD8Jri+oXiicbPnc8PAqkb1sOMQB7NaLG/Q7GqyXkI+8rkY4yG
	wvoaQlXpTQSZwt7m0qJ9SQ9iP+YwPqnP/4HGIv9dWD73TkwBhycDWKkU/Po8mYrKJMwfrl46oOGhJ
	ORw7AO88oWiuVnO17slzv9tvqybyqLqckpOvx5dnkoCHoZyO5Srk8fMocfksYJu3+Mquj8XOM0JuW
	S0w98XtrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liXc2-00E1VE-Cx; Mon, 17 May 2021 07:24:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liXb9-00E1Ql-Cx; Mon, 17 May 2021 07:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=O+5KtUmgvMdOm4+q9KIVRTH86xpscPAofEJpR+pS0JI=; b=VhYjFNrz6MdnxZJHgdNhJcHH5r
 x63o2pdTQXwd4BqAqpBvdHYqV2DSYDub6pu/bjehyHV76PYmMDm9pOKqaxwAHj3B7sld3ohoQmtCt
 PHf0gxYrZ3weBMLZAUVzDg23hqcuAcpkf+f3BZ7IPMUplVN0TPd4fKPrgD4Tm0lMnDdGVxg/OyHq3
 KGUBberEOGE2JuAg5TBC1mJNJVIths3tWR/zaNa1oHsi5siPjIuKu4jxGnZVfJt2QSU35QcqLVAbD
 GR0S3irmLVbkmEKQ9G9t6U8j3OF0UE/9hwD+uA3PTutsdeA/VTu5elUIMADrfT3lBy/pv0sebGtv0
 4N5ZArfA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liXb6-00DXdg-Jc; Mon, 17 May 2021 07:23:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E2C3611BF;
 Mon, 17 May 2021 07:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621236207;
 bh=amReGMStusi8xn7FAECc6Whc3fPD7LuG3b6+xADdY7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tdRnG7f8obysw+K28IshiY9r+18IQ1tTvDIIZzARqpPv8mn+ML38PW74E0CX/ofM1
 lH6pTkkY5oaht2o74BmWs/L5cRTvCHKxgeuP4jlFuWVFCF97iHrjOxSm63DzM1+DLM
 1Lt2mIb6RklOXBbNwT8EFBOEFDI0quAKtHVOhSk40zR+fT+bXp9P4dQI/i7dt6KsqW
 i1EeofYd4+AfTy3Bm/k+ha4JFLM3skrOayJ1PRDU9e6OwKoW/gcpiHeHcQCbsChuuw
 eqw8dBOD6kfdNYVMzKFpdKGTDDpXVdsVBQ+yiaI5bgEAr6nOfPYGv21bcodQb5kVaQ
 lUziwbXpWVN1w==
Date: Mon, 17 May 2021 10:23:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Ingo Molnar <mingo@redhat.com>,
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
Subject: Re: [PATCH v19 5/8] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <YKIZ3Zfai00A2O15@kernel.org>
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-6-rppt@kernel.org>
 <ea1ddcfa-f52d-9a7d-cb7b-8502b38a90da@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea1ddcfa-f52d-9a7d-cb7b-8502b38a90da@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_002328_706236_48DB8013 
X-CRM114-Status: GOOD (  24.73  )
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

On Fri, May 14, 2021 at 10:50:55AM +0200, David Hildenbrand wrote:
> On 13.05.21 20:47, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Removing of the pages from the direct map may cause its fragmentation
> > on architectures that use large pages to map the physical memory
> > which affects the system performance. However, the original Kconfig
> > text for CONFIG_DIRECT_GBPAGES said that gigabyte pages in the direct
> > map "... can improve the kernel's performance a tiny bit ..." (commit
> > 00d1c5e05736 ("x86: add gbpages switches")) and the recent report [1]
> > showed that "... although 1G mappings are a good default choice,
> > there is no compelling evidence that it must be the only choice".
> > Hence, it is sufficient to have secretmem disabled by default with
> > the ability of a system administrator to enable it at boot time.
> 
> Maybe add a link to the Intel performance evaluation.
 
" ... the recent report [1]" and the link below.
 
> > Pages in the secretmem regions are unevictable and unmovable to
> > avoid accidental exposure of the sensitive data via swap or during
> > page migration.
 
...

> > A page that was a part of the secret memory area is cleared when it
> > is freed to ensure the data is not exposed to the next user of that
> > page.
> 
> You could skip that with init_on_free (and eventually also with
> init_on_alloc) set to avoid double clearing.

Right, but for now I'd prefer to keep this explicit in the secretmem
implementation. We may add the check for init_on_free/init_on_alloc later
on.


> > [1]
> > https://lore.kernel.org/linux-mm/213b4567-46ce-f116-9cdf-bbd0c884eb3c@linux.intel.com/
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
