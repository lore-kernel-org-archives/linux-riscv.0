Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5B2C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 20:08:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94F6A64E9C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 20:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94F6A64E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hvOn7Gco4Uy9K3mXvrhO0PY54RoEk+c/2Y6w7SJ1Re0=; b=IcH/HSWGd4IzuT8HRY0XpTHgG
	q98y7BBkeWSR3wD7fY7pBXYvdDgvt8AVUvYnYSlO+BYHTNMBCYcuWin5m4AnnrrNCcbSL2yKn3d9Q
	+qQsVlJC5PgKzXqk7GhfUXwd4iY0LUI494ZVyAbGxj4GdJu3UKEUlYQsjK318ISWUGD+TJBknDnk2
	QSFFMaHegtBSKT3ZOaGcDh7SzyNJgu0IOng+VumxGnyvCbkNLdX16QiUusJXlT+M1crDzAUZUuXYp
	cunaSZtfRqQeRGTON98Z+nDy1ibR24ORvq86rX6mjTna7kt4omLDbUxtwvDZJKiYHphv1ozhjG7LN
	Pr6s9kVTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9ZJP-0002Tz-RQ; Tue, 09 Feb 2021 20:08:39 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9ZJL-0002SQ-6H; Tue, 09 Feb 2021 20:08:36 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1612901312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=utBmzEHnMldk+xybu3FUHQ/4GijdaViYwt5S9/fMX5g=;
 b=TjFv3w1m/0Glle7o/mpLcPWsTy958OLjFP0MF4y2grgkrogeIq5dCnnfB5BszcW5ggUnqY
 LL4MV1a1lL2B5WOEu6FaOYZ3DET/TzX9b1n3q4/VP0Y/08QiHTyolRop/Pd6AqhLXBScSy
 PBnAIDa+ir2IADhVPtKtqxwjkXo403U=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC40AADF0;
 Tue,  9 Feb 2021 20:08:32 +0000 (UTC)
Date: Tue, 9 Feb 2021 21:08:31 +0100
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v17 00/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <YCLrv86O0ZoKhfN0@dhcp22.suse.cz>
References: <20210208211326.GV242749@kernel.org>
 <1F6A73CF-158A-4261-AA6C-1F5C77F4F326@redhat.com>
 <YCJO8zLq8YkXGy8B@dhcp22.suse.cz>
 <662b5871-b461-0896-697f-5e903c23d7b9@redhat.com>
 <YCJbmR11ikrWKaU8@dhcp22.suse.cz>
 <c1e5e7b6-3360-ddc4-2ff5-0e79515ee23a@redhat.com>
 <YCKNMqu8/g0OofqU@dhcp22.suse.cz>
 <8cbfe2c3-cfc6-72e0-bab1-852f80e20684@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cbfe2c3-cfc6-72e0-bab1-852f80e20684@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_150835_538961_DC44755F 
X-CRM114-Status: GOOD (  22.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue 09-02-21 17:17:22, David Hildenbrand wrote:
> On 09.02.21 14:25, Michal Hocko wrote:
> > On Tue 09-02-21 11:23:35, David Hildenbrand wrote:
> > [...]
> > > I am constantly trying to fight for making more stuff MOVABLE instead of
> > > going into the other direction (e.g., because it's easier to implement,
> > > which feels like the wrong direction).
> > > 
> > > Maybe I am the only person that really cares about ZONE_MOVABLE these days
> > > :) I can't stop such new stuff from popping up, so at least I want it to be
> > > documented.
> > 
> > MOVABLE zone is certainly an important thing to keep working. And there
> > is still quite a lot of work on the way. But as I've said this is more
> > of a outlier than a norm. On the other hand movable zone is kinda hard
> > requirement for a lot of application and it is to be expected that
> > many features will be less than 100% compatible.  Some usecases even
> > impossible. That's why I am arguing that we should have a central
> > document where the movable zone is documented with all the potential
> > problems we have encountered over time and explicitly state which
> > features are fully/partially incompatible.
> > 
> 
> I'll send a mail during the next weeks to gather current restrictions to
> document them (and include my brain dump). We might see more excessive use
> of ZONE_MOVABLE in the future and as history told us, of CMA as well. We
> really should start documenting/caring.

Excellent! Thanks a lot. I will do my best to help reviewing that.

> @Mike, it would be sufficient for me if one of your patches at least mention
> the situation in the description like
> 
> "Please note that secretmem currently behaves much more like long-term GUP
> instead of mlocked memory; secretmem is unmovable memory directly
> consumed/controlled by user space. secretmem cannot be placed onto
> ZONE_MOVABLE/CMA.

Sounds good to me.

-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
