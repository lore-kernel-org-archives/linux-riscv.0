Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893FBC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jul 2022 01:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkVqiQTn1AyvHDdpPcwah3y0LeiuaqJzS7ix+RbOwWM=; b=oHPHaDtTZVumsW
	Ea8+gRYFTUd76JAJwMZcxOIRcGRY82izFYsN42Um65CHfix8cRe2CNazXXpZOLd92lqOLioSXpvkO
	oYIqkRI0u0EK+zoCBK/so38nh5lm3PHpE+5MAbytGGflCuMcTinAuEa5aUXvHL1vAqj0+zRZ052Nx
	Zf6lYlvntdSYXxhp9uhO/HGdes8XSNMM0tRck8R1IdZRwUqZD6WnNrgzFrvq8HY03uTv4j4y9pWAd
	p0Z7kv7EuBWCvxqPfeNl6VjTIgH6ITQA8i90Q0qHE3XqSXgGodhwj6WXCn3nB6pHhNGyH6XC4mmno
	EVyGSIgldtkmQTA4ZzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9yqj-006eC5-Hn; Sat, 09 Jul 2022 01:01:33 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9yqh-006eAD-JS
	for linux-riscv@lists.infradead.org; Sat, 09 Jul 2022 01:01:33 +0000
Date: Sat, 9 Jul 2022 09:01:10 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Alan Maguire <alan.maguire@oracle.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Subject: Re: [PATCH] RISC-V/bpf: Enable bpf_probe_read{, str}()
Message-ID: <YsjTVvyqdVGy1uYZ@ofant>
References: <20220703130924.57240-1-dlan@gentoo.org>
 <YsKAZUJRo5cjtZ3n@infradead.org>
 <CAEf4BzbCswMd6KU7f9SEU6xHBBPu_rTL5f+KE0OkYj63e-h-bA@mail.gmail.com>
 <712c8fac-6784-2acd-66ca-d1fd393aef23@fb.com>
 <YsUzX2IeNb/u9VmN@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YsUzX2IeNb/u9VmN@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_180131_673784_4E1532BC 
X-CRM114-Status: GOOD (  21.04  )
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

Hi Christoph, YongHong

On 00:01 Wed 06 Jul     , Christoph Hellwig wrote:
> On Tue, Jul 05, 2022 at 11:41:30PM -0700, Yonghong Song wrote:
> > 
> > 
> > On 7/5/22 10:00 PM, Andrii Nakryiko wrote:
> > > On Sun, Jul 3, 2022 at 10:53 PM Christoph Hellwig <hch@infradead.org> wrote:
> > > > 
> > > > On Sun, Jul 03, 2022 at 09:09:24PM +0800, Yixun Lan wrote:
> > > > > Enable this option to fix a bcc error in RISC-V platform
> > > > > 
> > > > > And, the error shows as follows:
> > > > 
> > > > These should not be enabled on new platforms.  Use the proper helpers
> > > > to probe kernel vs user pointers instead.
> > > 
> > > riscv existed as of [0], so I'd argue it is a proper bug fix, as
> > > corresponding select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE should
> > > have been added back then.
> > > 
> > > But I also agree that BCC tools should be updated to use proper
> > > bpf_probe_read_{kernel,user}[_str()] helpers, please contribute such
> > > fixes to BCC tools and BCC itself as well. Cc'ed Alan as his ksnoop in
> > > libbpf-tools seems to be using bpf_probe_read() as well and needs to
> > > be fixed.
> > 
> > Yixun, the bcc change looks like below:
> 
> No, this is broken.  bcc needs to stop using bpf_probe_read entirely
> for user addresses and unconditionally use bpf_probe_read_user first
> and only fall back to bpf_probe_read if not supported.
I agree with Christoph, there is something in the bcc tools that
need to adjust in order to use new bpf_probe_read_{kernel,user}

Please check the ongoing discussion [0] in the bcc tools if you're
interested in, advice and comments are welcome

[0] https://github.com/iovisor/bcc/pull/4085#issuecomment-1179446738

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
