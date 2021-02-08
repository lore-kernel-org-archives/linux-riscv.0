Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726E5C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 21:14:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AAC264E56
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 21:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AAC264E56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PTrPlIdm8/dq04dHxnO9rJQip819zj30VvMbpyz8CdI=; b=CEjqRw0IIET6rwM16ps2ONkTz
	c2DyhjJQVAwon6wvbsVZH9umDvgiLXk9SvxOjy/f5xQcSds9Tym60ipOt4IHmqaN3wOLxMF+A2Rkg
	N+jxPVUDABqpifAMm86xThFIKO6lAHsrgd9qx9t9Ac417BZNowaSm+O8r1EybL0LbflpuCkvTVc0T
	Bvw9T0gpOEmTH8tTwpN547CuGRZd08WhRgZXQKP/1rqDfP8KpeRfLpr67pL3hYPo341GgP6m99n5q
	Iu1ZEOWeYbvGtqBWvrP7ijG+79FDZaYHJ1v49w4aNKzGvlGKzOf4ofpClG4U5g3llpTiZG5WdTmRK
	7Iy1zpWAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Dr2-0008PL-C6; Mon, 08 Feb 2021 21:13:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Dqw-0008NT-3e; Mon, 08 Feb 2021 21:13:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A15364E8F;
 Mon,  8 Feb 2021 21:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612818828;
 bh=Hsw7u4NisXSHdMbN0miFLrU3qob/BtZRKy5D0WtD4mQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DqkWj9UrgaNlN7tor4WlT/PbjHoDhVkTAWVyRtiehKqBsBIlg2zRzOAntGDW+86wx
 t9LmuXLRYqrHRZcBc7unC6XAhPNWrMcUUEvHAvwnkCUgMKqMFZnL9bm2GNE5aC4pUI
 g9uqZwzHwFkcQ+XmsVzR8yYGxPKdKhbTnQ7myE7Mj0cV6qw47j0NdId0MJHEqRslub
 /el3Boy5sSLWlkjK0Pm94QQLob4G/uLz4vRWnNapLgu2mZBiTSGLPUWdmMesgwLpz4
 8w43a6xpBzhX2L15Qekz5VMG+RTL22BH8Ov5Tcl9FLLVyaJGQwK59/7ht8rPcFYKmt
 XQ6gGB3oh8qzg==
Date: Mon, 8 Feb 2021 23:13:26 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v17 00/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210208211326.GV242749@kernel.org>
References: <20210208084920.2884-1-rppt@kernel.org>
 <4996348d-5710-d77d-bb14-d84e370b4a5c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4996348d-5710-d77d-bb14-d84e370b4a5c@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_161351_098726_2CB58CE7 
X-CRM114-Status: GOOD (  18.09  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Peter Zijlstra <peterz@infradead.org>,
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 08, 2021 at 10:27:18AM +0100, David Hildenbrand wrote:
> On 08.02.21 09:49, Mike Rapoport wrote:
> 
> Some questions (and request to document the answers) as we now allow to have
> unmovable allocations all over the place and I don't see a single comment
> regarding that in the cover letter:
> 
> 1. How will the issue of plenty of unmovable allocations for user space be
> tackled in the future?
> 
> 2. How has this issue been documented? E.g., interaction with ZONE_MOVABLE
> and CMA, alloc_conig_range()/alloc_contig_pages?.

Secretmem sets the mappings gfp mask to GFP_HIGHUSER, so it does not
allocate movable pages at the first place.
 
> 3. How are the plans to support migration in the future and which interface
> changes will be required? (Michal mentioned some good points to make this
> configurable via the interface, we should plan ahead and document)

The only interface change required is an addition of bit value for syscall
flags, I really think it can be documented with the addition of migration
or any other feature for that sake. 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
