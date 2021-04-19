Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59C0C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 10:15:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AEA261008
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 10:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AEA261008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gYit81q4RbLwD5RBYs4zO0pcOX6LXlfVC75Vmz5sf6U=; b=YzlWvKCzuNImbGkYvMui6zSFj
	vxEuZkwn62DQkl6+G8PP1yoPj24qVKwItPM9uu5Ak5wpUTy7Yz4MMAHm3trvDxUa95kBEyb8ikrtk
	xKzeiSmpga0w3FaHyryKSI6oUepgQ69XX3wQUFl+CHjra936XuFq53tEIS25uATCqho0jrRbj7HzS
	TBPUSginMlSVUTHEAGy9UY4zx7Iahl2kBLCzh+SeDSHpdtgWkwWUsaRfRgzHAisaEjMBze72WuLOx
	2Y+G2QatmfWhT1+fWUdjzANR2Qc7IKO1yHOvy9YOJL4Fukol3aX3EgQy7iP5Axz4v/3obEO2iRMSJ
	7j1+xX9ZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYQvf-009eiB-Ou; Mon, 19 Apr 2021 10:14:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQvU-009ehU-1U; Mon, 19 Apr 2021 10:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=2Mc++Vuxb9yUA5WBvPjJ3Ry2LkVE5Kuk4L6dDZm8pqU=; b=b3C2QPoPtPZ9EE+V2NsQSvpnga
 LPiq9cTWXGa2VBkgtWPFvmvkYHsDh+QSeN4l5M/RhOlVBu/nLrvFA06IokeoVAuDAKx/oTjd2BAOp
 YmNhO6WLYFRb2e0OhUreSKXNlW2a+LEW5ClokkYMPYyXFMPvFE8GN6eYZqKFSdDVxEMTqbZkzZb1r
 FDqk1W/aN1EqAcKY4787ppbBTDG7cFQdII9bnTnLaqg7+7Gnkt9s25nky6VfXMuHjpxQOdNc+pUu/
 5/+pmFJSD0Cjg6ueP5tIujcZQLDirFZH3PN6X+A7eXpMUR8DK06k5QZfTgvU5hdzd/Ffgm++rg19Y
 uI8kYcQw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQvP-00BGfQ-AS; Mon, 19 Apr 2021 10:14:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E554261157;
 Mon, 19 Apr 2021 10:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618827278;
 bh=5M87hSd1tRHqwQ2MYCWGR3C48wQgQUhK50aj8D9UnJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=evAt2Kl5D6T9Cd0vvsQr+HGnZL0bjqZw0RQERf99o/a8ARSQONHlK5WsXoqQNk5HA
 UuhF/Rrt5Zhrq6yRbbpHUSqFJnrvW93kg/buM/tDCb4j7nNpeebnLT19q5XvGHG0e1
 49YiudzNJhVJYWtrWp69yUsf7ZicdxeuaJvb2o26MproyIrJfelmI05dnFpYTA1S+3
 KPevq2k+QCdmg92H0H+J4u9YW1dfsBAUkpesDwdo/uZea8b1mg9JI4Syb8VXhzzjqw
 IZ0ev45rLME8l/aMAEZNl8hE0npfiMbGut76Y1J7ozBko7t6Q5l7vUjPndFu66yHeo
 n/6L17YFihFDg==
Date: Mon, 19 Apr 2021 13:14:19 +0300
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
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
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
Message-ID: <YH1X+0CMH/2yppHK@kernel.org>
References: <20210419084218.7466-1-rppt@kernel.org>
 <3b30ac54-8a92-5f54-28f0-f110a40700c7@redhat.com>
 <YH1PE4oWeicpJT9g@kernel.org>
 <f4d0c4bf-423b-e227-444b-f1ea722dc43f@redhat.com>
 <56d8b80c-ce2c-ed86-0eda-253768d8d463@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56d8b80c-ce2c-ed86-0eda-253768d8d463@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_031439_449127_5F8ABE51 
X-CRM114-Status: GOOD (  40.57  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 19, 2021 at 11:40:56AM +0200, David Hildenbrand wrote:
> On 19.04.21 11:38, David Hildenbrand wrote:
> > On 19.04.21 11:36, Mike Rapoport wrote:
> > > On Mon, Apr 19, 2021 at 11:15:02AM +0200, David Hildenbrand wrote:
> > > > On 19.04.21 10:42, Mike Rapoport wrote:
> > > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > > =

> > > > > Kernel test robot reported -4.2% regression of will-it-scale.per_=
thread_ops
> > > > > due to commit "mm: introduce memfd_secret system call to create "=
secret"
> > > > > memory areas".
> > > > > =

> > > > > The perf profile of the test indicated that the regression is cau=
sed by
> > > > > page_is_secretmem() called from gup_pte_range() (inlined by gup_p=
gd_range):
> > > > > =

> > > > >     27.76  +2.5  30.23       perf-profile.children.cycles-pp.gup_=
pgd_range
> > > > >      0.00  +3.2   3.19 =B1 2%  perf-profile.children.cycles-pp.pa=
ge_mapping
> > > > >      0.00  +3.7   3.66 =B1 2%  perf-profile.children.cycles-pp.pa=
ge_is_secretmem
> > > > > =

> > > > > Further analysis showed that the slow down happens because neither
> > > > > page_is_secretmem() nor page_mapping() are not inline and moreove=
r,
> > > > > multiple page flags checks in page_mapping() involve calling
> > > > > compound_head() several times for the same page.
> > > > > =

> > > > > Make page_is_secretmem() inline and replace page_mapping() with p=
age flag
> > > > > checks that do not imply page-to-head conversion.
> > > > > =

> > > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > > > > ---
> > > > > =

> > > > > @Andrew,
> > > > > The patch is vs v5.12-rc7-mmots-2021-04-15-16-28, I'd appreciate =
if it would
> > > > > be added as a fixup to the memfd_secret series.
> > > > > =

> > > > >     include/linux/secretmem.h | 26 +++++++++++++++++++++++++-
> > > > >     mm/secretmem.c            | 12 +-----------
> > > > >     2 files changed, 26 insertions(+), 12 deletions(-)
> > > > > =

> > > > > diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
> > > > > index 907a6734059c..b842b38cbeb1 100644
> > > > > --- a/include/linux/secretmem.h
> > > > > +++ b/include/linux/secretmem.h
> > > > > @@ -4,8 +4,32 @@
> > > > >     #ifdef CONFIG_SECRETMEM
> > > > > +extern const struct address_space_operations secretmem_aops;
> > > > > +
> > > > > +static inline bool page_is_secretmem(struct page *page)
> > > > > +{
> > > > > +	struct address_space *mapping;
> > > > > +
> > > > > +	/*
> > > > > +	 * Using page_mapping() is quite slow because of the actual call
> > > > > +	 * instruction and repeated compound_head(page) inside the
> > > > > +	 * page_mapping() function.
> > > > > +	 * We know that secretmem pages are not compound and LRU so we =
can
> > > > > +	 * save a couple of cycles here.
> > > > > +	 */
> > > > > +	if (PageCompound(page) || !PageLRU(page))
> > > > > +		return false;
> > > > =

> > > > I'd assume secretmem pages are rare in basically every setup out th=
ere. So
> > > > maybe throwing in a couple of likely()/unlikely() might make sense.
> > > =

> > > I'd say we could do unlikely(page_is_secretmem()) at call sites. Here=
 I can
> > > hardly estimate which pages are going to be checked.
> > > > > +
> > > > > +	mapping =3D (struct address_space *)
> > > > > +		((unsigned long)page->mapping & ~PAGE_MAPPING_FLAGS);
> > > > > +
> > > > =

> > > > Not sure if open-coding page_mapping is really a good idea here -- =
or even
> > > > necessary after the fast path above is in place. Anyhow, just my 2 =
cents.
> > > =

> > > Well, most if the -4.2% of the performance regression kbuild reported=
 were
> > > due to repeated compount_head(page) in page_mapping(). So the whole p=
oint
> > > of this patch is to avoid calling page_mapping().
> > =

> > I would have thought the fast path "(PageCompound(page) ||
> > !PageLRU(page))" would already avoid calling page_mapping() in many cas=
es.
> =

> (and I do wonder if a generic page_mapping() optimization would make sense
> instead)

Not sure. Replacing page_mapping() with page_file_mapping() at the
call sites at fs/ and mm/ increased the defconfig image by nearly 2k
and page_file_mapping() is way simpler than page_mapping()

add/remove: 1/0 grow/shrink: 35/0 up/down: 1960/0 (1960)
Function                                     old     new   delta
shrink_page_list                            3414    3670    +256
__set_page_dirty_nobuffers                   242     349    +107
check_move_unevictable_pages                 904     987     +83
move_to_new_page                             591     671     +80
shrink_active_list                           912     970     +58
move_pages_to_lru                            911     965     +54
migrate_pages                               2500    2554     +54
shmem_swapin_page                           1145    1197     +52
shmem_undo_range                            1669    1719     +50
__test_set_page_writeback                    620     670     +50
__set_page_dirty_buffers                     187     237     +50
__pagevec_lru_add                            757     807     +50
__munlock_pagevec                           1155    1205     +50
__dump_page                                 1101    1151     +50
__cancel_dirty_page                          182     232     +50
__remove_mapping                             461     510     +49
rmap_walk_file                               402     449     +47
isolate_movable_page                         240     287     +47
test_clear_page_writeback                    668     714     +46
page_cache_pipe_buf_try_steal                171     217     +46
page_endio                                   246     290     +44
page_file_mapping                              -      43     +43
__isolate_lru_page_prepare                   254     297     +43
hugetlb_page_mapping_lock_write               39      81     +42
iomap_set_page_dirty                         110     151     +41
clear_page_dirty_for_io                      324     364     +40
wait_on_page_writeback_killable              118     157     +39
wait_on_page_writeback                       105     144     +39
set_page_dirty                               159     198     +39
putback_movable_page                          32      71     +39
page_mkclean                                 172     211     +39
mark_buffer_dirty                            176     215     +39
invalidate_inode_page                        122     161     +39
delete_from_page_cache                       139     178     +39
PageMovable                                   49      86     +37
isolate_migratepages_block                  2843    2872     +29
Total: Before=3D17068648, After=3D17070608, chg +0.01%
 =

> Willy can most probably give the best advise here :)

I think that's what folios are for :)

-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
