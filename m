Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67667C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jul 2022 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FOsj/zOuKDlU3a68IdsRggZUOvmHhFER4EjvG1lSY8=; b=nMhMuzL5X1EwEb
	H0Y3q57pk+mKOw2YhqBKCMCDKAQFdAlU93y4/BeHUxzR0+WkAYtB0mr7n4ezx8McgzgkNg/hguxS3
	mC3Qt3CSX7HW3ZZ1KEsCaop29GUqRWYqo9u7fhhJ/cBvUSs5/yquNsVofj6RRAU5OQ4CbXsIw3KcO
	q3juqPUix64NnVi9Qpoq73geD13u9ZICCix5LOWgwfp99VHd4FBuraYd/GfEfhl2svuIjew4zCwlh
	VH76EOqEo8Wxvpx4q0XQR6gPI8xY39EHCzfZ/bbxgW922BwTlVuUuMG1VoFPuqhiBZW1M7825ihJ0
	xuNhsEw/wBV0r7KwBIhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA68R-007OCd-Vv; Sat, 09 Jul 2022 08:48:20 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA68O-007OBs-Fg
	for linux-riscv@lists.infradead.org; Sat, 09 Jul 2022 08:48:19 +0000
Date: Sat, 9 Jul 2022 16:48:05 +0800
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
Message-ID: <YslAxaryvm/MfGbq@ofant>
References: <20220703130924.57240-1-dlan@gentoo.org>
 <YsKAZUJRo5cjtZ3n@infradead.org>
 <CAEf4BzbCswMd6KU7f9SEU6xHBBPu_rTL5f+KE0OkYj63e-h-bA@mail.gmail.com>
 <712c8fac-6784-2acd-66ca-d1fd393aef23@fb.com>
 <YsUzX2IeNb/u9VmN@infradead.org>
 <YsjTVvyqdVGy1uYZ@ofant>
 <YskfMTdnd+IyzCQ0@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YskfMTdnd+IyzCQ0@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220709_014817_324714_D15E0A39 
X-CRM114-Status: GOOD (  11.58  )
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

Hi Christoph:

On 23:24 Fri 08 Jul     , Christoph Hellwig wrote:
> On Sat, Jul 09, 2022 at 09:01:10AM +0800, Yixun Lan wrote:
> > Please check the ongoing discussion [0] in the bcc tools if you're
> > interested in, advice and comments are welcome
> > 
> > [0] https://github.com/iovisor/bcc/pull/4085#issuecomment-1179446738
> 
> I can't find a way to post there, as replying eems to require a login.
> Is there a mailing list discussion somewhere that is broadly accessible?

never mind, I think the logic is quite clear, we can do something in bcc:

1) adopt new _{kernel,user} interface whenever possible, this will
work fine for all arch with new kernel versions

2) for old kernel versions which lack the _{kernel,user} support,
fall back to old bpf_probe_read(), but take care of the Archs which
have overlaping address space - like s390, and just error out for it

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
