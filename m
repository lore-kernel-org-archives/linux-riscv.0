Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68389C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 06:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:To:From:Date:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=egGxMa1pGg4U/mkaOj/I/1JRVoxhWsG4QPs3dFRITxQ=; b=L9HrTLMOvfh0pGHF5errXOH2IA
	oJfK6ApeaNNiyoGTl2Hh290SgXVy9YfM5ARIHkTqEIvZNbRl23CH8zef24UrB54mQ1VDQfl75f8Cb
	AhuCc1wyIYX5uojKJIuHLFeR3TX13qXEQj/JU6ogKhXyIVrMXH/g7as5EOiCBZ2hKUEANVJamI41n
	nGtBkxtBJPBh53wSYUN4tBuZGPJcmyEIS52B0JLX0zw8kOqXR/6HuxAxbh48N8s8SEhycU2Y/TQ9/
	qmUNVqHrRZxPTSRF4OclJ4mxJNXZbLslbDUSoE+bUMz0/qjA1pYpdxiJDWYhjAPsGp16hhxF+YDVC
	Enn0gNQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoO7-00000000nKa-3OKX;
	Wed, 01 Jul 2026 06:25:35 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoO5-00000000nJD-2QAN
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 06:25:35 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 35EDA1380326;
	Wed,  1 Jul 2026 02:25:32 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 01 Jul 2026 02:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782887132;
	 x=1782894332; bh=b44fp/Xs200vmVmERTgFd09AZSIVEJbxoZ/zLTkjWAs=; b=
	ZAEo/ZNklCq7HmQEk3ZyRkEqqp0NAs1NuYnrrERijClIWx+s19L6FuvIXKdtFruy
	4V89DusI3RY+PWxVDApjhWzHTyjpdA2xSUWFPAsFdcFupvmlqwaUhmnKBG1Qj+A3
	aGgtYpFNkgAjsd/I4/5LLU/QklAxLdmIa7rQMcIiR6atyFIFZJTE5nOy6AMIH0RE
	lyvdf1uqqx8qwClvFZS3mWbrktvGFtDL2wj+5vdLJTyzu++JTDl0jY/qaQFuTovj
	gDaDaoC/5siXjVCoY0jI7GyPsU8yQM2K39vtKFpR3GQQ9wMuIymhBSRBRIY9A719
	BH0I0QP55BkqHPusExFKyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1782887132; x=1782894332; bh=b
	44fp/Xs200vmVmERTgFd09AZSIVEJbxoZ/zLTkjWAs=; b=KH4gK04VMYiP2pLwR
	0x9WgN+0wkRQBW+gE0J4ZyalbyvhKPaSGAr1c3UqG2YKkiW5B8ELH3HIr9CXBe3N
	UQjjBRP6whm1/bfbFFamkf4sAOD7pGrqQWvYJPBn3NSiserEHozBs2EjA5I3GFBI
	VEvaP+gNWAudrlx9py8bakkizoWWV+qi7NNPJIWMEBk7/6izbZ1iOUtQwcnCZIFB
	/aqQlRI74LOsotM8lwcmH1Yw0Tv8CSz9W6J+X1v+9uiliFFPg2VX5AFAPiuJMez6
	Vd8bxd1c+PO36W6Zj5kUkNluLwp8Z4iQh1ooHvEo1wZpOs0IwOtaj8czVZu2nQ3P
	dtpXg==
X-ME-Sender: <xms:2bJEajJRWO8kVZq70X044fUeLf0f76XltHggeVJX48t491vhArm9TQ>
    <xme:2bJEah9SNFNYnnAb1J_vkZotnw3X4i1g3o8fu7TssuHiXQo5W2VjJZRgP8swVnGlz
    X4CymXicSA7ZWVxw69O8AjpeWLmZVDRxDX1oNv7x3h18SxceiNAVCYW>
X-ME-Proxy-Cause: dmFkZTF1VoUsxJAijmmlORYiQyK9Goe4LUYUDFLRIryl+jqUeZtZW3yO5gJDbpHv3EB9xX
    0aLPbAIfQieGYioCKK3co9wXz8U+shxephSBq5+VUjtIdlQEq07P/ElJPcfp3rEbsUbCW0
    l7whtRe1Yr3PnTNdRTBIZQJ9PcaK+K3csO1DgQcA8BLFNtW7cyHVxo3P2rmNk7SW0lVEt2
    /RD362A2qa/XvfS2m7DMJyFC7DMueziHirYypDh/c0u2a+Kc3xajINpZ1UwB7QSvGTZlii
    DLQiMQRnSTgxvgcLUTQzuPJ9XiTQP+uKdmA5s/je+k6H6aL16kXT8Ijk8X2Rcg/HGr+zpz
    7z/ssG2wd3dId5yDIhYXpEsbZGkwAzg/SZ2S3SltFeOeO49dDXuOHe8OVHJKD39gonqLBy
    gd2qKEm93sQu8V2hKL8wI1iRJbtjdBfWO7F9O82etnW+ff4w0qCiuMHKqZ509jgwm0ezaO
    yq2/pUblQLEf8lwgpKPFSyILpZHZRKofIJQfR5QP9emF7ID+ha6kqUuJDgzwO39OCs14te
    lNXcHj/U0d7hEDTA+yLc6mK6Os+/wuLZLhWF/Qxfba4P9Hiz42uRyERz+mVNyvqJ7pYzaM
    0WVqv/7cFLaZAEqmqZTNoBwuzXvL8ZbM9Sz3uNVKGMexSSDT9buVIexiEfkw
X-ME-Proxy: <xmx:2bJEauRPKsD8riqousolZE0WI0zXAE_JCKfx1UY3IMK9PKky9lP7vw>
    <xmx:2bJEavhFfU4kCmHPJrS1vVPtAVbhvCWvwICQzm9xJwnom6erP6Z9Dg>
    <xmx:2bJEakYaAolbEk3jQRR1gnJNxKPYk9wJisr8ue5-6jmqz4Di0prDYA>
    <xmx:2bJEarJJliJWNzjwLDjDG-UZUmdP2JUvsmN5H-BMD1reGuBdz3PGLA>
    <xmx:3LJEamxytfe7H_axgE5obOZ_MbiIy8MkZAEWJzfhzKF5EIjf7S7IGDjZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5CAE8182007E; Wed,  1 Jul 2026 02:25:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AFAd_idRoH9R
Date: Wed, 01 Jul 2026 08:24:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Dennis Zhou" <dennis@kernel.org>, "Tejun Heo" <tj@kernel.org>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>,
 "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "Jiri Olsa" <jolsa@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, pulehui@huawei.com,
 puranjay@kernel.org, "Thomas Huth" <thuth@redhat.com>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Ben Dooks" <ben.dooks@codethink.co.uk>,
 =?UTF-8?Q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Zong Li" <zong.li@sifive.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Deepak Gupta" <debug@rivosinc.com>,
 seanwascoding@gmail.com, "Andy Chiu" <andybnac@gmail.com>,
 menglong8.dong@gmail.com, cyrilbur@tenstorrent.com,
 "Vivian Wang" <wangruikang@iscas.ac.cn>,
 "Atish Patra" <atishp@rivosinc.com>,
 "Anup Patel" <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, qingfang.deng@siflower.com.cn,
 Linux-Arch <linux-arch@vger.kernel.org>, llvm@lists.linux.dev
Message-Id: <ea525a80-1e6f-4304-a371-3ec17d91ee96@app.fastmail.com>
In-Reply-To: <7988df83f6341ea045ebd7294af2e8907dbd5ee7.1782877663.git.cuiyunhui@bytedance.com>
References: <cover.1782877663.git.cuiyunhui@bytedance.com>
 <7988df83f6341ea045ebd7294af2e8907dbd5ee7.1782877663.git.cuiyunhui@bytedance.com>
Subject: Re: [PATCH v5 1/3] riscv: io: avoid null-pointer arithmetic in PIO helpers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_232533_825310_D7EF1EAB 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 1, 2026, at 06:20, Yunhui Cui wrote:
> @@ -56,6 +56,8 @@
>  #define __io_pbw()	RISCV_FENCE(iow, o)
>  #define __io_paw()	RISCV_FENCE(o, io)
> 
> +#define PCI_IO_ADDR(addr)	((void __iomem *)((unsigned long)PCI_IOBASE 
> + (addr)))

This does not seem to have any purpose, is this just left over
from the previous version?

> 
> +#ifdef CONFIG_HAS_IOPORT
>  __io_reads_ins(ins,  u8, b, __io_pbr(), __io_par(addr))
>  __io_reads_ins(ins, u16, w, __io_pbr(), __io_par(addr))
>  __io_reads_ins(ins, u32, l, __io_pbr(), __io_par(addr))
> -#define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
> -#define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
> -#define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
> +#define insb(addr, buffer, count) __insb(PCI_IO_ADDR(addr), buffer, count)
> +#define insw(addr, buffer, count) __insw(PCI_IO_ADDR(addr), buffer, count)
> +#define insl(addr, buffer, count) __insl(PCI_IO_ADDR(addr), buffer, count)
> +#endif
 
As far as I can tell, just adding the #ifdef here should be sufficient.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
