Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FE8C61DD3
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 00:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVo4aUERipFggOdXRvZGSoTC2P59zV9kjw8/37Eel6o=; b=aGj7/9plejliY6
	u70KwYH7WUefI6ReS3X/ksyc8EeeIKlJCSb1rQr+HgJdNiGw66jFi7sp2eZMW2bWmJZPIshbtuo7d
	ejXG+SQdzX7OwsPSvKRKbxsG85vQ1YW53XgFIMKYUJk9urQLkTO9WIk/MkgT1zKTOsECXbCGNhk4v
	faYYgoQ9/PwsaWIL6mCh1aytovJZfUovPB3cGlHxhfQy1I+ILjzH8VJIP18qMXXEfTB3b1N4fCUfB
	aip1JdFzheG1eBW0gClrPLtKa88X2D6iq5J41SZUpBg6mktflrUcw07Jb2z7Skokmfbjpf+MVfPeH
	wgnM2fKU5EKaRG8kuH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1YfB-0000000DZKS-2qnp;
	Wed, 02 Sep 2026 00:17:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Yf9-0000000DZKM-3tKb
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 00:17:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 53F5F40F11;
	Wed,  2 Sep 2026 00:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FDF1F000E9;
	Wed,  2 Sep 2026 00:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788308231;
	bh=FFHPut+Xq2Ea+rkcvqGUhCh1a+lSyQIPTaGYORuhApw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=GjyQdgHCFzqoqFBuxCIfmvoSztUITn24xhAGXlt0hn9x0F8F8Cgxz1MstlQYzBE6t
	 IdM26bC9+5F94mw29ktD62FrJkV01KbmD9uhDbCNA2cVP85dP8eGpnQeiA08AVBXa4
	 Zxzfisb+rjN4naX4eL6GI6WUlohZ3rR/NFi8L1tmX0OnhJNn5Ewwo9FvV3neiELvvg
	 iEDYPD1vXK785RI/q8ZHY4jKsmXhnmfCWt61WNQ+dJ6byX6TtZJEcQjss8id0jAu6V
	 Tjexq5L5XsLR6LQz0r8MUJKjgPFhEuB6BrtEjhllSh33ZGvdkfRp097OHMAQCWlzIM
	 1J9zCr0exKdlA==
Date: Tue, 1 Sep 2026 18:17:08 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>
cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
    Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Update arch/riscv/patch-acceptance.rst
 translation
In-Reply-To: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
Message-ID: <6ffd979c-6d6d-e631-79eb-680ea3766c3c@kernel.org>
References: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
MIME-Version: 1.0
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

On Sat, 29 Aug 2026, Yukai Wu wrote:

> Update Documentation/arch/riscv/patch-acceptance.rst translation.
> 
> Update the translation through commit ed843ae947f8
> ("docs: move riscv under arch")
> 
> Signed-off-by: Yukai Wu <xiaoyewuz.Ruster@gmail.com>

Thanks, queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
