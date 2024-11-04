Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0611D1BDE7
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 19:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sR0EPihkWHVqyQcjZI53GQPe6C17PcfgqCxfIbwzJpY=; b=j5JDD+6VyfdYin
	HT97fMHjKzz/3NpeYVznuLIa3p9Sc3Qto9eGBqAAtZc8DsXwYdPMhA/KiuUprjIO2/Tv27De+YyVK
	NeppN+Cbb3DVchfPFuajzdxH+qFwuvYtVEMlJTXug4IWzPn0SzGyD/LT/jJZDeynX5orE5bYHsGxr
	4NqpzxCZpaUIgfhl1JRc8d/IfiEGfCFKczgzgGizE56omJ9wv+MLU3o3x8zBBuLbkQpABHosZOuuy
	77UGfcfZppsigg0XgJdJOUkGWpt5iucSUTsHvDoRrH0rXk2Fbmum4LAknaf7A5uWH4zDCB+rM3rL2
	PyFKhDEYeXIbYQ47LTFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82x8-0000000Evvi-3Wrt;
	Mon, 04 Nov 2024 19:41:30 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82x6-0000000EvvH-1PvY
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 19:41:29 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 479A142C30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1730749286; bh=/IFed8QuxmGzZBbHkfBNbEfyJ1RoaIBovaPG1f0VPG8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n8PZ+lvdV9S8DRrV5uughGMOtaA9H3oWENpGvlYt/sC2JQoufU1tcxY54Ptc9v2tC
	 GZtZM7inLdMb3Yg6hJr21LWAY5u/TYR1V1M6N1BZY2JeX9pA5Rh22sWTTP11xVydlV
	 L7aqqZFthR/iVCvg+akLG1EMYJDr6AW0o1X4BsrOEOZkeVwA3GsWdm8ywJvgXzrxTr
	 8KUmLUeJrUFWIT5li55End9O/KFWWamMROt8jQEW913d5F3fFqJ4B0dhJS6qa0namB
	 gziO8YJDsdCDAuzVKp0LxwQQMp79ykXyEG6y1/rg0UiUVae33IF2xZ8VT1JDZUuraP
	 XHhzFLoqK0O/A==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 479A142C30;
	Mon,  4 Nov 2024 19:41:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dongliang Mu <dzm91@hust.edu.cn>, si.yanteng@linux.dev, Alex Shi
 <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] docs/zh_CN: add the translation of kbuild/llvm.rst
In-Reply-To: <20241023153235.1291567-1-dzm91@hust.edu.cn>
References: <20241023153235.1291567-1-dzm91@hust.edu.cn>
Date: Mon, 04 Nov 2024 12:41:25 -0700
Message-ID: <87wmhi7pne.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_114128_398037_ED7E614D 
X-CRM114-Status: UNSURE (   9.04  )
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

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Finish the translation of kbuild/llvm.rst and move llvm from TODO
> to the main body.
>
> Update to commit 145082ebfcf0 ("Documentation/llvm: turn make command
> for ccache into code block")
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>  .../translations/zh_CN/kbuild/index.rst       |   3 +-
>  .../translations/zh_CN/kbuild/llvm.rst        | 203 ++++++++++++++++++
>  2 files changed, 205 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/kbuild/llvm.rst

Applied, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
