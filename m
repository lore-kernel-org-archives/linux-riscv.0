Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D52BC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jun 2022 04:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ba6f+p8oVmKx7mvdoJBY7/1ZhnX5ZVpqPntgm3JyZrY=; b=RRmSoBoSOYaqWN
	rCZcMoZJLPGMXKgTpVMAGULCvfvx8WKEnZHo1zInnvuq1keHsoOkTJMSikq2J6+VN7+N8LM616Rdn
	lSnRQ0/p1F17V0RdSVoDpFhzLtxxANcfGdVFNUQOIEO/negyBdiQ4jSCFnZ8gBoTM+qGKWzcB/VNl
	kRbSl4XM444ZIhCMkMQSK1XYHVSsa5SkIaOHoNi+bMC7tCv1wnS57h6+yN5mq5kBGSjzP9q8ki8q/
	7ZnQkLCzn+mxAueOhTCJMj9MWtECpximY3ljDGe/UpOeJHhab9ffchRu1/o5Fer9W/nc9oX+VsVS8
	DZ+q6+H5iFO1Ugyu1gSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwycZ-005k1a-CJ; Fri, 03 Jun 2022 04:09:11 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwycV-005k0j-4U
	for linux-riscv@lists.infradead.org; Fri, 03 Jun 2022 04:09:09 +0000
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LDqBR6ZxPzKmHw;
	Fri,  3 Jun 2022 12:08:47 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 3 Jun
 2022 12:08:59 +0800
Date: Fri, 3 Jun 2022 12:08:52 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: Changbin Du <changbin.du@huawei.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <changbin.du@gmail.com>, Nick Desaulniers
	<ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Hui Wang
	<hw.huiwang@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: riscv: alternatives: move length validation inside the subsection
Message-ID: <20220603040852.uduno354yrdyexs3@M910t>
References: <20220602112734.it2bzlqaismotjof@M910t>
 <YpjMdVjLzoIoSGz9@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YpjMdVjLzoIoSGz9@dev-arch.thelio-3990X>
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_210907_565201_082C59B3 
X-CRM114-Status: GOOD (  14.28  )
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

On Thu, Jun 02, 2022 at 07:43:01AM -0700, Nathan Chancellor wrote:
> On Thu, Jun 02, 2022 at 07:27:34PM +0800, Changbin Du wrote:
> > Apply the same fix from commit 966a0acce2fc ("arm64/alternatives: move
> > length validation inside the subsection") to riscv.  Due to the one-pass
> > design of LLVM's integrated assembler, it can not compute the length of
> > instructions if the .org directive is outside of the subsection that these
> > instructions are in.
> > 
> > Here is the build error reported by llvm:
> > 
> > In file included from ./arch/riscv/include/asm/pgtable.h:108:
> > ./arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time absolute expression
> >         ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
> >         ^
> > ./arch/riscv/include/asm/errata_list.h:41:5: note: expanded from macro 'ALT_FLUSH_TLB_PAGE'
> > asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,        \
> >     ^
> > ./arch/riscv/include/asm/alternative-macros.h:187:2: note: expanded from macro 'ALTERNATIVE'
> >         _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
> >         ^
> > ./arch/riscv/include/asm/alternative-macros.h:113:2: note: expanded from macro '_ALTERNATIVE_CFG'
> >         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
> >         ^
> > ./arch/riscv/include/asm/alternative-macros.h:110:2: note: expanded from macro '__ALTERNATIVE_CFG'
> >         ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
> >         ^
> > ./arch/riscv/include/asm/alternative-macros.h:98:3: note: expanded from macro 'ALT_NEW_CONTENT'
> >         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
> >          ^
> > <inline asm>:25:6: note: instantiated into assembly here
> > .org    . - (887b - 886b) + (889b - 888b)
> >         ^
> > 
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> 
> Thanks for the patch! I already sent an equivalent change two weeks ago
> as https://lore.kernel.org/20220516214520.3252074-1-nathan@kernel.org/,
> which I think is slightly better because it handles the __ASSEMBLY__
> version of the macro as well.
> 
Agreed. Thank you, and please ignore this one.

> Cheers,
> Nathan
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
