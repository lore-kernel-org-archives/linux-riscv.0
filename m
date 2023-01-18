Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD55C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 12:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHrRni0DRNOdF/SUcm2/DPCA1EH7y/tegMmM+f1MKGQ=; b=v2I1oHuyiHZX9a
	micxUmlnnhoZ2Ypl68cOtH4cLN5Hz9bHLZa4LA+4JKHwAroNdgvq6C5DG52jJPLurBFUWhQLU9r1W
	IvU2kiNMPq+2h//RZxF+ZrMyRqw7t3Nv6JoH2GJfHsH9ectVVJKNlAaSnXm6nkpQwKEbQgPo7oVJ8
	a5FjZkSofjMdg8b+I8PaUxy3tJTaDF9dKi1GVyIBXy3HWHsq2hsDNf+cjuza63ur8DvzIgb+kLhQW
	j/bOVcH21nulWex5pOrJ+5LKK1GZfwwUsjwFWaEEdB6l2SoN0ptiINI7EHqBRa1ES8RINzOal+g52
	pdKoLE/WG6dujNvnk7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7EO-000gjx-SH; Wed, 18 Jan 2023 12:07:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7EE-000ghS-6o; Wed, 18 Jan 2023 12:07:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 432FF1477;
	Wed, 18 Jan 2023 04:08:18 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF9A33F71A;
	Wed, 18 Jan 2023 04:07:33 -0800 (PST)
Date: Wed, 18 Jan 2023 12:07:31 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org, Pierre Gondois <pierre.gondois@arm.com>
Cc: Len Brown <lenb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-acpi@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Will Deacon <will@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/6] arch_topology: Build cacheinfo from primary CPU
Message-ID: <20230118120731.jgsq4l7htwizlsp5@bogus>
References: <20230104183033.755668-1-pierre.gondois@arm.com>
 <167404285593.885445.6219705651301997538.b4-ty@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <167404285593.885445.6219705651301997538.b4-ty@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_040742_311101_8723085B 
X-CRM114-Status: GOOD (  14.24  )
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

On Wed, Jan 18, 2023 at 11:55:59AM +0000, Sudeep Holla wrote:
> On Wed, 4 Jan 2023 19:30:23 +0100, Pierre Gondois wrote:
> > v2:
> >  - Applied renaming/formatting comments from v1.
> >  - Check CACHE_TYPE_VALID flag in pppt.c.
> > v3:
> >  - Applied Sudeep's suggestions (for patch 5/5):
> >    - Renaming allocate_cache_info() -> fecth_cache_info()
> >    - Updated error message
> >    - Extract an inline allocate_cache_info() function
> >  - Re-run checkpatch with --strict option
> > v4:
> >  - Remove RISC-V's implementation of init_cache_level() as not
> >    necessary.
> >  - Add patch: 'cacheinfo: Check 'cache-unified' property to count
> >    cache leaves' to increase the number of leaves at a cache level
> >    when no cache-size property is found.
> >  - In cacheinfo: Use RISC-V's init_cache_level() [...],
> >    make 'levels', 'leaves' and 'level' unsigned int to match
> >    of_property_read_u32()'s parameters signedness.
> > 
> > [...]
> 
> Applied to sudeep.holla/linux (for-next/cacheinfo), thanks!
> 

I pushed the changes and then noticed some build warning report by
kbuild posted only to you and one list(missing this list). Please post the
fix if required on top of my for-next/cacheinfo so that it can be added
on the top. Sorry for missing that.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
