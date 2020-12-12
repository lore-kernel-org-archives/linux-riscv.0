Return-Path: <SRS0=YGwO=FQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB203C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Dec 2020 06:16:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2721123333
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Dec 2020 06:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2721123333
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GYHgjEjqm0iRpCW/hjcxz+Bcwb+6wIb9BBEhnaN0J6k=; b=fh4Xkn+sVzTfsUaBMtDb3lXAQ
	7fueejSjq9L6VmiWCBczwRFS4zbRsiKwjcriu9q704CUtNypDbTjztHq1Iy9jixVDhGlX3oiwd/mk
	5V+fO0qi9gPyuYNSi+UgV2cYdNa99PcgKJW+JFeYOKE6GvGJ1ENVE+yvOpaNJn6PAFD82Q4XRpW5c
	PQ73v1dVCQ/MU8PlXtPzQmLjs/jvugIInvkS05ChruTn4XdN8LOpsrrPjtOSr6KU5Sw7HBLkt+H3y
	Orq9JjIsWWBSIUGXEUyoA4HhFNboDmANXipUSF23gOAVoaw/iNrMm9pW7kg98gZexCyb/1ZLlfggo
	onsrD9ZLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knyCv-0003fD-7z; Sat, 12 Dec 2020 06:16:41 +0000
Received: from hqnvemgate24.nvidia.com ([216.228.121.143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knyCp-0003dD-Ie; Sat, 12 Dec 2020 06:16:37 +0000
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fd4603d0000>; Fri, 11 Dec 2020 22:16:29 -0800
Received: from [10.2.58.108] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 12 Dec
 2020 06:16:23 +0000
Subject: Re: [PATCH v14 10/10] secretmem: test: add basic selftest for
 memfd_secret(2)
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20201203062949.5484-1-rppt@kernel.org>
 <20201203062949.5484-11-rppt@kernel.org>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <248f928b-1383-48ea-8584-ec10146e60c9@nvidia.com>
Date: Fri, 11 Dec 2020 22:16:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <20201203062949.5484-11-rppt@kernel.org>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1607753789; bh=ofgMBZd16EADbvAo0gykil1HQ3WXinWEQXFsF7eWzJ0=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=nHiMzIuFi9yGg9dtEXBRDsgSZmIDOiTwrsl4IkhMy6fFmjAA+d/AS9GK73/GrEl8c
 L2wFofk2X8mSJW/vLEAbgA9QPMoBNfjJd8BWsCI0rrp+bj6/xYZKQSgViVMLkLSYK1
 k66ZGlnQfrIIuas55l4diL4Iaoyoywisz15vCenxZUMAMyAtm2LyPLwxbz991YbWg8
 nRt0uF/HuZ34WhsfN3HMzjfJx7L8KMpuqwwkCn0Y66dd5OlXb+xyLmZkRBWZVKoHt4
 QQtiTloYRW+10TrH/r0jzw36mCIbK7syoQlFnk7px83Aq1dj4ALMG1TaKaeUNQMmQk
 OnZsyXYjTgO+g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201212_011635_760798_E3D93623 
X-CRM114-Status: GOOD (  14.17  )
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
 Peter
 Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Christopher
 Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Elena
 Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill
 A. Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org,
 Shakeel Butt <shakeelb@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/2/20 10:29 PM, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
...
> +#include "../kselftest.h"
> +
> +#define fail(fmt, ...) ksft_test_result_fail(fmt, ##__VA_ARGS__)
> +#define pass(fmt, ...) ksft_test_result_pass(fmt, ##__VA_ARGS__)
> +#define skip(fmt, ...) ksft_test_result_skip(fmt, ##__VA_ARGS__)
> +
> +#ifdef __NR_memfd_secret
> +
> +#include <linux/secretmem.h>

Hi Mike,

Say, when I tried this out from today's linux-next, I had to delete the
above line. In other words, the following was required in order to build:

diff --git a/tools/testing/selftests/vm/memfd_secret.c b/tools/testing/selftests/vm/memfd_secret.c
index 79578dfd13e6..c878c2b841fc 100644
--- a/tools/testing/selftests/vm/memfd_secret.c
+++ b/tools/testing/selftests/vm/memfd_secret.c
@@ -29,8 +29,6 @@

  #ifdef __NR_memfd_secret

-#include <linux/secretmem.h>
-
  #define PATTERN        0x55

  static const int prot = PROT_READ | PROT_WRITE;


...and that makes sense to me, because:

a) secretmem.h is not in the uapi, which this selftests/vm build system
    expects (it runs "make headers_install" for us, which is *not* going
    to pick up items in the kernel include dirs), and

b) There is nothing in secretmem.h that this test uses, anyway! Just these:

bool vma_is_secretmem(struct vm_area_struct *vma);
bool page_is_secretmem(struct page *page);
bool secretmem_active(void);


...or am I just Doing It Wrong? :)

thanks,
-- 
John Hubbard
NVIDIA

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
