Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965D2C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 03:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GlQqirlT9E9GwLvvV9nVYh3f5LFJKIRoZKpC+ge6+LQ=; b=IhcocgiWUpZiiK
	7AYN+jVVuwYZZfDnOVQ5qR6+Za4N8HaH4gn5KOnjUei+4zW008wAvDGHcF4uanZHh/FS6akRgVI4N
	GyuGo+WNZ/J9Q2wCMyfaWQ1rx3qIbazQUxx8/ft+Kwq98R3rdnjPQO3imxuOJKX9GJG0TF+svWx7a
	Tg3M32D41vcK6d7jUx4TRlF1yGZG9QpCl0Kt7003lNtj2pvomk43d+mydhsMFc4Y81Vpc4BhgOht8
	XKkbAHdrPWtk7Hslc3pDiThiv8j0/IMNSY3uzHIkO2Hg+gSxOadulTqkJ8wRa8CkWAzxh9NjQzl99
	t0GMNOmURKeaQdnaqsNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAkYw-00FloL-Lt; Mon, 11 Jul 2022 03:58:22 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAkYr-00Flmi-Tu; Mon, 11 Jul 2022 03:58:17 +0000
Date: Sun, 10 Jul 2022 20:58:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Christoph Hellwig <hch@infradead.org>, Yonghong Song <yhs@fb.com>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
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
Message-ID: <Ysuf2ZiZ5RSFnQOD@infradead.org>
References: <20220703130924.57240-1-dlan@gentoo.org>
 <YsKAZUJRo5cjtZ3n@infradead.org>
 <CAEf4BzbCswMd6KU7f9SEU6xHBBPu_rTL5f+KE0OkYj63e-h-bA@mail.gmail.com>
 <712c8fac-6784-2acd-66ca-d1fd393aef23@fb.com>
 <YsUzX2IeNb/u9VmN@infradead.org>
 <YsjTVvyqdVGy1uYZ@ofant>
 <YskfMTdnd+IyzCQ0@infradead.org>
 <YslAxaryvm/MfGbq@ofant>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YslAxaryvm/MfGbq@ofant>
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

On Sat, Jul 09, 2022 at 04:48:05PM +0800, Yixun Lan wrote:
> never mind, I think the logic is quite clear, we can do something in bcc:
> 
> 1) adopt new _{kernel,user} interface whenever possible, this will
> work fine for all arch with new kernel versions
> 
> 2) for old kernel versions which lack the _{kernel,user} support,
> fall back to old bpf_probe_read(), but take care of the Archs which
> have overlaping address space - like s390, and just error out for it

Yes, that is the right thing to do.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
