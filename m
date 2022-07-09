Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40420C43334
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jul 2022 06:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NlTUPZqyprjCgRHUggv7eJEzeXWNAJtM3mUfxEjTn58=; b=KFT7KZxvMVIX5A
	W0q/EW/5kNelWbxlicjA+vW4ZB++clWh01cVJXfE0+hcbw2jeG/VHJUhRRO0AIKKuYHXDyO1uLtWk
	UZQ/EliZjI0DznEXya8a2FlesgOyElhHDmFyCzy7zBHCpkXXAJzsPo9+W/PrSQuq3ntEdVnNKI7r2
	ICubhbqDKyTK6vw83IODjFE+fyjUvBQTWovbkzBYTuCOPacD642I5N5Zv6eJLuB5LPu4+SDoghoWH
	jJ3RJkhrErn+jIluyiiNTpa9a5voQq6CZQfphohZ7II86eW/pWebIllFqTg9pAn9qKoY4JWepkCeZ
	CAnUKKC/KDeV69nYWfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA3tf-0078qv-Oc; Sat, 09 Jul 2022 06:24:55 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA3tZ-0078qA-S9; Sat, 09 Jul 2022 06:24:49 +0000
Date: Fri, 8 Jul 2022 23:24:49 -0700
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
Message-ID: <YskfMTdnd+IyzCQ0@infradead.org>
References: <20220703130924.57240-1-dlan@gentoo.org>
 <YsKAZUJRo5cjtZ3n@infradead.org>
 <CAEf4BzbCswMd6KU7f9SEU6xHBBPu_rTL5f+KE0OkYj63e-h-bA@mail.gmail.com>
 <712c8fac-6784-2acd-66ca-d1fd393aef23@fb.com>
 <YsUzX2IeNb/u9VmN@infradead.org>
 <YsjTVvyqdVGy1uYZ@ofant>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YsjTVvyqdVGy1uYZ@ofant>
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

On Sat, Jul 09, 2022 at 09:01:10AM +0800, Yixun Lan wrote:
> Please check the ongoing discussion [0] in the bcc tools if you're
> interested in, advice and comments are welcome
> 
> [0] https://github.com/iovisor/bcc/pull/4085#issuecomment-1179446738

I can't find a way to post there, as replying eems to require a login.
Is there a mailing list discussion somewhere that is broadly accessible?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
