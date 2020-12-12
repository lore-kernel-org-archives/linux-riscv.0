Return-Path: <SRS0=YGwO=FQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8299C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Dec 2020 14:00:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F486224DE
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Dec 2020 14:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F486224DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NVd95bIQSgNnL9DMUFF+pTgUCUEp94l+OnPcJ79Xf9c=; b=AKKJ4BVPhB8NH4aQ/aM51Ed8d
	/MtBTxRUw8BsgIBn5Ox1ha8nm7wC/SwnFViur4EAOj+q5MsXOrqEz/j3WxJ8VYffS5ZsbrjKN4wu8
	pHOPWkV4ND2JFzciuJJqZ9zepKa/zDYvg3JtEy7saEK60N3HfSeUVgiOAFlOIdPEKjftMGgRFrHu6
	8uA5/TSQucHnMS76IMd+6HOf/fg3l0SjVKDofvge8zhNVruVJHwxMsCefOchAejd2+j4epUklPUza
	PXmE/mVzufd2z7aF8W7eSRiFANPoMJmd1CEQTT5l2mV0y1ZMcl/m+d58R86lIGwzJp+c0GFJRShXQ
	HtR+49TMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ko5RR-0004v9-Qg; Sat, 12 Dec 2020 14:00:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ko5RN-0004sK-HI; Sat, 12 Dec 2020 14:00:06 +0000
Date: Sat, 12 Dec 2020 15:59:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607781598;
 bh=W+S3uDjo9SUaklycr1VwLEkb3P+e5VKfy1opxSFjfP4=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=flXIgTj5QPdmF322uyfveGkWCvdiCUBTDqJEmaQAdBMU+9OnpTfe38HJDNJgc0lH8
 G3M3nYjTvl4Jk0YTIcL5XhPPhChBAc7qxqYwpPq+/oyL9pin060A7R+FLePp8EI92r
 GwnqdckCsl6axBY1CL4fx8yH/moiz2Z+oLa3jsxNsEo1pT2EOLhqIregvSKc55N4Zj
 WuUAHrJAd8PgEDWlSYMQSNKmu4qJ1V3ZA+z2Yx8VyWB6hblUmlV0BHoIXeUaszFyMu
 HjV36aGN0+weJj3fLUwesb3uBHEoXTzG37NgAFnxayD4MEFDMvTjDeUmf4Kr35XObN
 Un6GIU6DTV1SA==
From: Mike Rapoport <rppt@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v14 10/10] secretmem: test: add basic selftest for
 memfd_secret(2)
Message-ID: <20201212135940.GD8946@kernel.org>
References: <20201203062949.5484-1-rppt@kernel.org>
 <20201203062949.5484-11-rppt@kernel.org>
 <248f928b-1383-48ea-8584-ec10146e60c9@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <248f928b-1383-48ea-8584-ec10146e60c9@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201212_090005_821305_E1F8C5DE 
X-CRM114-Status: GOOD (  17.83  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
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

Hi John,

On Fri, Dec 11, 2020 at 10:16:23PM -0800, John Hubbard wrote:
> On 12/2/20 10:29 PM, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> ...
> > +#include "../kselftest.h"
> > +
> > +#define fail(fmt, ...) ksft_test_result_fail(fmt, ##__VA_ARGS__)
> > +#define pass(fmt, ...) ksft_test_result_pass(fmt, ##__VA_ARGS__)
> > +#define skip(fmt, ...) ksft_test_result_skip(fmt, ##__VA_ARGS__)
> > +
> > +#ifdef __NR_memfd_secret
> > +
> > +#include <linux/secretmem.h>
> 
> Hi Mike,
> 
> Say, when I tried this out from today's linux-next, I had to delete the
> above line. In other words, the following was required in order to build:
> 
> diff --git a/tools/testing/selftests/vm/memfd_secret.c b/tools/testing/selftests/vm/memfd_secret.c
> index 79578dfd13e6..c878c2b841fc 100644
> --- a/tools/testing/selftests/vm/memfd_secret.c
> +++ b/tools/testing/selftests/vm/memfd_secret.c
> @@ -29,8 +29,6 @@
> 
>  #ifdef __NR_memfd_secret
> 
> -#include <linux/secretmem.h>
> -
>  #define PATTERN        0x55
> 
>  static const int prot = PROT_READ | PROT_WRITE;
> 
> 
> ...and that makes sense to me, because:
> 
> a) secretmem.h is not in the uapi, which this selftests/vm build system
>    expects (it runs "make headers_install" for us, which is *not* going
>    to pick up items in the kernel include dirs), and
> 
> b) There is nothing in secretmem.h that this test uses, anyway! Just these:
> 
> bool vma_is_secretmem(struct vm_area_struct *vma);
> bool page_is_secretmem(struct page *page);
> bool secretmem_active(void);
> 
> 
> ...or am I just Doing It Wrong? :)

You are perfectly right, I had a stale header in uapi from the prevoius
versions, the include in the test remained from then.

@Andrew, can you please add the hunk above as a fixup?

> thanks,
> -- 
> John Hubbard
> NVIDIA

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
