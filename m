Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD89EC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 22:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9P2FPFKLe/WG0bCdi08xOYGSITo18x/r4Kh/fuSd2Ss=; b=ZiGEAahTQ5OSaw
	2MWUJ57xaMnGNkn/PXKWi/IiEwEeFFAOyip9QUoEW5IduO48zDCHMNm/xH7F+OtjwL2Wze/xT6b/3
	RuIiZIJ1FY2DRzrfris4TiFTS81yoi/10yiTD3VMnUuw24ve98UAdqheYWd8JL7YBfWtiRSJ7nXn3
	TwqMgw9zO1tOQ0z47MerN08Q1b9xn/XGkYDWi3yLD97ekFyHU+ruySTU1EY03iUR8VJfQ+9nmxI4G
	G33d0XitPklp2t1j51osqCg36qdNc/UYa0f4e2hIqWPp+SkKWzNWWBdOdX4EqHcCIR1PGkbePccEU
	d6aVqgYaC7ltcqR/J1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMbTN-00000008YBr-0ic6;
	Wed, 26 Jun 2024 22:50:41 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMbTK-00000008YBQ-0v8p
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 22:50:39 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 50DEE45E2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1719442234; bh=2ZvlwGGbdDD9XRK+WhZh+8iY+TV6ABdXMrHDCASGyQc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DyD8Z7Zuu0Gie2z3t425/sBGFg/gJNXiyvc+IHv4H/lDuoqgwPHZPq+mAKIQynIQy
	 Ly6zpJG0uhLeLiP01wTqnf06Zp9+7mesdaZqnrCxC+4U3+flHhkEYDkj2NkhsidyiP
	 YHX6/hYCvdMWhMkZgyrnWhYe2PQOFxu+8nHhB+REYQM3WrsvS+1n82fB6KBXRx0lsS
	 ilK7r/Gp3jDnH/3hof1HQc9nZtuaOytdGdHX0qlTj838oFxlKRkcIkXsNZlyOjLoi5
	 Z/A2Y6ELQedMglsdycbWe5LejMCTJdcgxCi+l3IKBzN9pEqJodIAe+HD4XhAnAftxx
	 53w7FHy7Kobzw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 50DEE45E2B;
	Wed, 26 Jun 2024 22:50:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: SeongJae Park <sj@kernel.org>
Cc: SeongJae Park <sj@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alex
 Shi <alexs@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, Bill Wendling
 <morbo@google.com>, Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Hu Haowen
 <2023002089@link.tyut.edu.cn>, Justin Stitt <justinstitt@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Yanteng Si
 <siyanteng@loongson.cn>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
 workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] minor document fixups
In-Reply-To: <20240624185312.94537-1-sj@kernel.org>
References: <20240624185312.94537-1-sj@kernel.org>
Date: Wed, 26 Jun 2024 16:50:33 -0600
Message-ID: <87zfr7xqrq.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_155038_286663_88C0A6CB 
X-CRM114-Status: UNSURE (   9.14  )
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

SeongJae Park <sj@kernel.org> writes:

> This patch series is for minor document fixups.  First five patches
> clean up and remove 'Other material' section of process/index in favor
> of 'staging/' and better place for docs on the section.  A patch for
> adding DAMON maintainer-profile reference on maintainers' handbook
> follows.  And then the last patch adds 'hkml' as one of available email
> tools on email-clients document.
>
> SeongJae Park (7):
>   Docs/process/index: Remove unaligned-memory-access from 'Other
>     material'
>   Docs/process/index: Remove riscv/patch-acceptance from 'Other
>     material' section
>   Docs: Move magic-number from process to staging
>   Docs: Move clang-format from process/ to dev-tools/
>   Docs/process/index: Remove unsorted docs section
>   Docs/maintainer/maintainer-entry-profile: add DAMON maintainer profile
>   Docs/process/email-clients: Document HacKerMaiL
>
>  .clang-format                                         |  2 +-
>  Documentation/{process => dev-tools}/clang-format.rst |  0
>  Documentation/dev-tools/index.rst                     |  1 +
>  Documentation/maintainer/maintainer-entry-profile.rst |  1 +
>  Documentation/process/4.Coding.rst                    |  2 +-
>  Documentation/process/coding-style.rst                |  2 +-
>  Documentation/process/email-clients.rst               |  9 +++++++++
>  Documentation/process/index.rst                       | 11 -----------
>  Documentation/staging/index.rst                       |  1 +
>  Documentation/{process => staging}/magic-number.rst   |  0
>  .../translations/it_IT/process/clang-format.rst       |  2 +-
>  .../translations/it_IT/process/magic-number.rst       |  2 +-
>  .../translations/sp_SP/process/coding-style.rst       |  2 +-
>  .../translations/sp_SP/process/magic-number.rst       |  2 +-
>  Documentation/translations/zh_CN/process/4.Coding.rst |  2 +-
>  .../translations/zh_CN/process/coding-style.rst       |  2 +-
>  .../translations/zh_CN/process/magic-number.rst       |  2 +-
>  Documentation/translations/zh_TW/process/4.Coding.rst |  2 +-
>  .../translations/zh_TW/process/coding-style.rst       |  2 +-
>  .../translations/zh_TW/process/magic-number.rst       |  2 +-
>  20 files changed, 25 insertions(+), 24 deletions(-)
>  rename Documentation/{process => dev-tools}/clang-format.rst (100%)
>  rename Documentation/{process => staging}/magic-number.rst (100%)

Series applied, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
