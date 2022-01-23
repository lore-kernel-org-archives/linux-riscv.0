Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1336C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jan 2022 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uonvob9PTLBTs7p+quh7f+q0SyyxKzMyztYkU816d/Y=; b=q6aJ/JwgenS73g
	Ym44PJ0qrhRdU+3FUgTZrflmDianMU1IMTUG3xU6H2V6F0oj4En0KVIwyjmMUANqcYRgdseYpOSbQ
	NFLk1hYAmR37Mu60qAeocG7CXI6xYCmsJdQvYwv3VxzGCaLlLdslg6fUm8JnhYOoG/T34crmfGlhB
	PsuSsJDDIEZyz/t7tOMDo+wz+f21Cw3BWR5JYWzs+XovhZ6JnlZ0cJEZyv2ojboLyrX+zRDhysEuz
	EzQN2867VM4A8sd3a1QCO5ngj86j87vnEGdYuZPIGJ8l1xww6WW8mVcI7ymJGNz8SSpTUll1xLY25
	PHbAcm0mXz8iueHVGy3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBZ2v-000WKN-IM; Sun, 23 Jan 2022 09:20:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBZ2r-000WIZ-V9
 for linux-riscv@lists.infradead.org; Sun, 23 Jan 2022 09:20:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1311B80B4B;
 Sun, 23 Jan 2022 09:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B53C340E2;
 Sun, 23 Jan 2022 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642929618;
 bh=Dj6LQFC0Rt8FZEOhmYI8OL38h0K/bUpUPb0UB+tnZ04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ddr8J3QFItYLfJ90lbG74ECaXAThq37UnIESGdmin4cpD9hObbT2Cgnl6QXBZu0wZ
 7X8ny859qZekzDnAR+PZFii/Dc2plkluME3Iojpn1I8lXW+DD/X4UEmXSuVM/c6ipW
 fg9cjBd5mHlYdPMm5TgLfx3+CBC9gXnmg/W5WQFmWOUvSWqmjsjHn2lb8UTOo6wC5G
 5sbrvSdT0tW9/pXelP1ff15Vucl4z/A05TNtsTnwuLykCh6X6uqbx5U03GaRo3Fco0
 Ym4jHSzh6PdZDqQMGifzu/ucMrwGXPHo45QnR3yJgCHcMGc2+ExHNR6i7anFhFBObl
 Lq8VP3PWdxmWQ==
Date: Sun, 23 Jan 2022 17:12:40 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Tong Tiangen <tongtiangen@huawei.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 11/12] riscv: extable: add a dedicated uaccess handler
Message-ID: <Ye0cCI8aAC8rL1IE@xhacker>
References: <20211118192130.48b8f04c@xhacker> <20211118192651.605d0c80@xhacker>
 <CAN37VV6vfee+T18UkbDLe1ts87+Zvg25oQR1+VJD3e6SJFPPiA@mail.gmail.com>
 <YeqkIKUsdHH0ORxf@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YeqkIKUsdHH0ORxf@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_012022_171467_80675726 
X-CRM114-Status: GOOD (  15.24  )
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

On Fri, Jan 21, 2022 at 08:16:51PM +0800, Jisheng Zhang wrote:
> On Thu, Jan 20, 2022 at 11:45:34PM +0530, Mayuresh Chitale wrote:
> > Hello Jisheng,
> 
> Hi,
> 
> > 
> > Just wanted to inform you that this patch breaks the writev02 test
> > case in LTP and if it is reverted then the test passes. If we run the
> > test through strace then we see that the test hangs and following is
> > the last line printed by strace:
> > 
> > "writev(3, [{iov_base=0x7fff848a6000, iov_len=8192}, {iov_base=NULL,
> > iov_len=0}]"
> > 
> 
> Thanks for the bug report. I will try to fix it.

Hi Mayuresh,

I just sent out a fix for this bug. Per my test, the issue is fixed.
Could you please try?

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
