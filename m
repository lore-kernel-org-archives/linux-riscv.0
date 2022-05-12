Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A486C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 08:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2y+/KbyM6vzR5LyLI7crzRYgMc5ZOFqNNI7MfqMh9b8=; b=ZmMdsHdQwaog/a
	8DhD6o4fjuRujGfS8MTQHt4YYPT/AwYf3zs3lnx5agkiruxl7s3g/RSHsxNnhKvTm94TN7OdekXbU
	ak3ZU3zoyi5/b1+0aRsxqxbk8n520sQyy6E3SXq3jzMJEXbftTz99qBrbk6G47jRWfCDbmO+J1BwS
	wWCjHU6qVWpxK+UX93Rdg4spJkC13RGJbmfdaep5IRRwJM4BXLtAY6HcqPPRGAOkpOblVm77atuIC
	qhofvfc3865VBOxU4Qo93B3NJO6EpCACGIjz5u7CmLejTv/SNm36ssYIIKhPJxqRN10scBSi/YRYG
	bgjRsYvGsFNSEjld9cRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np4Ba-00AzkE-EV; Thu, 12 May 2022 08:28:38 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np4BW-00Azac-7w
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 08:28:36 +0000
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KzPwx4cDmzGpj2;
 Thu, 12 May 2022 16:25:37 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 12 May
 2022 16:28:25 +0800
Date: Thu, 12 May 2022 16:28:20 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Nick Desaulniers <ndesaulniers@google.com>
CC: Changbin Du <changbin.du@huawei.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>,
 <hw.huiwang@huawei.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <codegen-riscv@discourse.llvm.org>, <llvmproject@discourse.llvm.org>,
 <craig.topper@sifive.com>, <asb@asbradbury.org>
Subject: Re: riscv: llvm-compiler: calling convention violation: temporary
 register $t2 is used to pass the ninth function parameter
Message-ID: <20220512082820.7t2rwwo3fffgwoxn@M910t>
References: <20220510065336.hlfjrc25ajed5zj4@M910t>
 <CAKwvOd=OnJ=ZhsbX+epzbhg3sWg9yOaR=zQ4jF_Deo=B8Nx9Og@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOd=OnJ=ZhsbX+epzbhg3sWg9yOaR=zQ4jF_Deo=B8Nx9Og@mail.gmail.com>
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_012834_499296_23B55755 
X-CRM114-Status: GOOD (  11.84  )
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

On Wed, May 11, 2022 at 11:39:07AM -0700, Nick Desaulniers wrote:
> On Mon, May 9, 2022 at 11:54 PM Changbin Du <changbin.du@huawei.com> wrote:
> >
[snip]
> > I also built a simple test function with 9 parameters by clang and same cflags,
> > but cannot reproduce it. Maybe it is conditional?
> >
> > Simple test code:
> > __attribute__ ((noinline))
> > void test_func(int *a, int *b, int *c, int *d, int *e, int *f, int *g, int *h, int *i)
> > {
> >         printf("__find_rr_leaf: %d\n", *i);
> > }
> >
> > int main(void)
> > {
> >         int a,b,c,d,e,f,g,h,i = 100;
> >
> >         test_func(&a,&b,&c,&d,&e,&f,&g,&h,&i);
> >         return 0;
> > }
> 
> Hmm...any chance you could come up with a more concise test case then
> using creduce [0] or cvise [1]?
> [0] https://embed.cs.utah.edu/creduce/
> [1] https://github.com/marxin/cvise
> 
>
okay, let me try to reduce the orignal source with creduce.

> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
