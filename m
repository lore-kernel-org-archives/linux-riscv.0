Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697CFC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 07:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALWKEHnkpEfFVxzLe8pic6covIIPJKS+oFsL3lIGD5I=; b=jNc+UTFtjEVXAz
	46b4CMpvGDPlptDgmurYQyQ6hQvZgfwPXP2bafY11uAWB5tp1LAiKuaNuo/KjRrZWqhZ5HmQCJ3Rr
	gb6LTWhM4ch3s12+WqztRODFiFxC+S6Wn0+H0Knhni07F0WoH+9g1vVRPETpqPrAKdPaweh6s0RWX
	MVpVVuCRirQ9SmAyrdAlQYX0t3hUGlmnjvjZV6xsWrhmM9xKUI9NbZPdi0Creg8kzgbT1cgqZHSAm
	p0o/TsGyYnJopIvkEZrkb+sWQkrckKI56tGWUBwZsxcDASlnytdLvFLITE9l3RLeZs6JSbGBO2RiE
	EELfhgKhVpwqech8sybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8z2n-006uLf-VG; Wed, 06 Jul 2022 07:01:53 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8z2l-006uK0-Ir; Wed, 06 Jul 2022 07:01:51 +0000
Date: Wed, 6 Jul 2022 00:01:51 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yonghong Song <yhs@fb.com>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Alan Maguire <alan.maguire@oracle.com>, Yixun Lan <dlan@gentoo.org>,
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
Message-ID: <YsUzX2IeNb/u9VmN@infradead.org>
References: <20220703130924.57240-1-dlan@gentoo.org>
 <YsKAZUJRo5cjtZ3n@infradead.org>
 <CAEf4BzbCswMd6KU7f9SEU6xHBBPu_rTL5f+KE0OkYj63e-h-bA@mail.gmail.com>
 <712c8fac-6784-2acd-66ca-d1fd393aef23@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <712c8fac-6784-2acd-66ca-d1fd393aef23@fb.com>
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

On Tue, Jul 05, 2022 at 11:41:30PM -0700, Yonghong Song wrote:
> 
> 
> On 7/5/22 10:00 PM, Andrii Nakryiko wrote:
> > On Sun, Jul 3, 2022 at 10:53 PM Christoph Hellwig <hch@infradead.org> wrote:
> > > 
> > > On Sun, Jul 03, 2022 at 09:09:24PM +0800, Yixun Lan wrote:
> > > > Enable this option to fix a bcc error in RISC-V platform
> > > > 
> > > > And, the error shows as follows:
> > > 
> > > These should not be enabled on new platforms.  Use the proper helpers
> > > to probe kernel vs user pointers instead.
> > 
> > riscv existed as of [0], so I'd argue it is a proper bug fix, as
> > corresponding select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE should
> > have been added back then.
> > 
> > But I also agree that BCC tools should be updated to use proper
> > bpf_probe_read_{kernel,user}[_str()] helpers, please contribute such
> > fixes to BCC tools and BCC itself as well. Cc'ed Alan as his ksnoop in
> > libbpf-tools seems to be using bpf_probe_read() as well and needs to
> > be fixed.
> 
> Yixun, the bcc change looks like below:

No, this is broken.  bcc needs to stop using bpf_probe_read entirely
for user addresses and unconditionally use bpf_probe_read_user first
and only fall back to bpf_probe_read if not supported.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
