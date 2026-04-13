Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B7DE64007
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 06:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=15P//p1Ux9/x00MjOmuLHFHI343EKJQ5kdsBSskiA3k=; b=W2eDLxbOX3Z6w625E2U8YgwPxk
	Pe0/w10C2HnnhXU0FZkjKAyomHbqoPPn3eU72oJEzYLqofUHh4PU3rmLj83/lqw7qeO829vblppAl
	1YPMZ4sonliOAeY8FZdTJwSbWGLW8BZCB1bvsrpoOL9as7sJKsVds7vt8Ugzly4Y1+2Ggnxxe3JiK
	fCz+wNnNF04dKUdU2r16m8TrUy2qM+zcK+wnrwShYhRfiNsPFr03LNbbd7XVqw8d5BNNaqcu34Y9f
	O3H8pa9nXUDC2Rg0+9ddrs5TIUSZeO8/Q+KB6fMwmOD8schVEOkUPl0/Vq3DrdJWU34ka7g2tp248
	KqybwcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAcm-0000000F3oh-1QTY;
	Mon, 13 Apr 2026 06:18:20 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAcj-0000000F3nL-0YNV
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 06:18:19 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 90107EC0227;
	Mon, 13 Apr 2026 02:18:13 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 02:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776061093;
	 x=1776147493; bh=1JbLBiViInaPoZEqWHr6KF0nrLtgKFZ06ed/mYm+y+E=; b=
	UyCwc8ZnSYq/1n0XDeHjn/iH/9V7TFv90I8BrWRAzfh2mGFKofkWs97pzitqvEpw
	Ro/MU/YYSTNmMw0naw8hLcGOZSJGL6xZlSBpJfbUJjenz9LeSaCp+kGGDnYQwrL3
	HpnGZZ6L7MTJc1UoD36wjsjtSqPoibn1UZQ9tjB36lgwqkKG9hhOjmgKS1qan81/
	d4HGQFCMTrynHjctIjDfqMBFAqHSIASSSJ+MK58e4XHwWFCTHAsBJzJ0mOEuIV4B
	QjCUgcG+GpzlxTwlTKKEUrxvXA3/0fe7T5ncWwzb4BeS+IHE9wroJTehl9LITuae
	qHF6hlUYUy2OEY6bFa295Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776061093; x=
	1776147493; bh=1JbLBiViInaPoZEqWHr6KF0nrLtgKFZ06ed/mYm+y+E=; b=K
	oXWxZ3BGscu4eL4gGU8sqPv3jy29uDPamh5WAH3CIcjoZ7P6Xv7m+3DHjWvLAvnR
	4WZp0PEtr9rZ6wjBgzqYE6dyg1aKUb/wmbLQm+NUU3L0vjUdMCJtKVbv98dZXeYG
	Mmfn8TyFhlTyNPUzp6saOdqRIxdq1qaMhI0NMgeDs27hdSJI1P6eOfq5R4YDRe8F
	hlqx8h+T8jyCJQGFQcASzFzS8/IObxfUAADYPLppw3efmFVb8+AwcjMQ1p3n5QUN
	AorcRYKfDR173mdGvP8BcPMpXWMA3JLaOnta2cffyvstIRUcGA30QlJKmgYdqUSk
	DfHvx93T7qnTNbElKkUCQ==
X-ME-Sender: <xms:o4rcaZYlu7XDLy2tYo7KpZa-Zx_GWmvgPjA13_7p6nQWGs_QfBMrwQ>
    <xme:o4rcabOYShrHE8pVCy3zDUKaa73mJnARc-Kb-f9jss_kMzarc_2m0ziq8M56PCcTP
    onZCylkw8mh4IZNH2PlzamuhHmK6Pkp5r_tb5mUTOzoTd1zDyN8iOc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefjeegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprg
    hlvgigsehghhhithhirdhfrhdprhgtphhtthhopehinhhotghhihgrmhgrsehgmhgrihhl
    rdgtohhmpdhrtghpthhtoheprhgrsggvnhgurgdrtghnsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtoheprghlvghkshgrrdhprghunhhovhhitgeshhhtvggtghhrohhuphdrtghomhdp
    rhgtphhtthhopegujhhorhgujhgvrdhtohguohhrohhvihgtsehhthgvtghgrhhouhhprd
    gtohhmpdhrtghpthhtohepghgrohhhrghnsehishgtrghsrdgrtgdrtghnpdhrtghpthht
    ohepghhuohhrvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpjhifsehkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:o4rcadvBo7DsoZ9p3_HCcfblIYi1VIIvURKft5mkK7-8CL73WjgFmQ>
    <xmx:o4rcaX3j4ldSl1DsgEyj_apBL572VMgn23ZTVZkXwE_VVKvIev_ouw>
    <xmx:o4rcaaDp7_wz-9VkY7Nx2Luuwoyz6gnmpmGfe9eC4WoECo99Pu5-Bw>
    <xmx:o4rcacfvgmHfChfW-NMwlKI-we3O66XPnsr-ftUv0ZUe4RZOATywDA>
    <xmx:pYrcaTvmoH9fKKuJP1g1L6ZcHX9ZzBiDPaDabyiuFAHum2LnWF2ePDrI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C538D700065; Mon, 13 Apr 2026 02:18:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ab9VcpOYxc8o
Date: Mon, 13 Apr 2026 08:17:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: guoren <guoren@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Leonardo Bras" <leobras@redhat.com>, djordje.todorovic@htecgroup.com,
 aleksa.paunovic@htecgroup.com, "Han Gao" <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>, "Han Gao" <gaohan@iscas.ac.cn>,
 "Yao Zi" <me@ziyao.cc>, "Chen Wang" <unicorn_wang@outlook.com>,
 "Inochi Amaoto" <inochiama@gmail.com>,
 "Xiaoguang Xing" <xiaoguang.xing@sophgo.com>,
 "Paul Walmsley" <pjw@kernel.org>
Message-Id: <535f3eaa-ff93-4de4-86c7-8a6e46bcca63@app.fastmail.com>
In-Reply-To: <20260412143116.1445893-1-guoren@kernel.org>
References: <20260412143116.1445893-1-guoren@kernel.org>
Subject: Re: [PATCH V4] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_231817_765208_01314087 
X-CRM114-Status: UNSURE (   9.98  )
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

On Sun, Apr 12, 2026, at 16:31, guoren@kernel.org wrote:
>  arch/riscv/Kconfig.errata                    | 17 ++++++++++
>  arch/riscv/errata/thead/errata.c             | 20 ++++++++++++
>  arch/riscv/include/asm/errata_list_vendors.h |  3 +-
>  arch/riscv/include/asm/rwonce.h              | 34 ++++++++++++++++++++
>  include/asm-generic/rwonce.h                 |  2 ++

For asm-generic:

Acked-by: Arnd Bergmann <arnd@arndb.de>

> +static bool errata_probe_write_once(unsigned int stage,
> +				    unsigned long arch_id, unsigned long impid)
> +{
> +	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_WRITE_ONCE))
> +		return false;
> +
> +	/* target-c9xx cores report arch_id and impid as 0 */
> +	if (arch_id != 0 || impid != 0)
> +		return false;
> +
> +	if (stage == RISCV_ALTERNATIVES_BOOT ||
> +	    stage == RISCV_ALTERNATIVES_MODULE)
> +		return true;

Question: Are the affected cores the only ones that report
arch_id==impid==0? If there are other known implementations
that get the extra barrier but don't need it here, that
should probably be mentioned in the Kconfig text and
the code comment.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
