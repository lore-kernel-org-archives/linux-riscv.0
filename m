Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577CCC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 23:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vyI9xI3Y+deQWZwky91rnGgv54pP9jxqOaLzgQBJ3Qk=; b=wtTCBVynr0yP+o
	UB2+SJ5iNgBiz9uxlMWyp2ewzOFfL+os5U01kXvyhWZvwNCBXg1z8jH0fLIzTtI6+d7bBcN6rLnx0
	EnMEG/bwc68LKrj7bQuVESmOhvLA7T0qTfnHpImRqj77yDAsx7U0IjLEqPI/l4Wr7la5mLl+jQuZE
	x3I3/F1Wf5/B3Z0fX0nr8Nuko++tGEGQYj3M990OtJog1wspdX5staiUANKIIYhMEJrCSw9HY5bXR
	CMUznqldEcSLEf5Lbb+C834Fg1dUgemZ4+Naqaak4vq7fT5Y45OCS1H5emYvfMuAD4reHuNNJLRhD
	hNcud2ooZcfedv8ilOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFkXt-00DCOY-KQ; Wed, 11 Jan 2023 23:30:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFkXp-00DCMg-Rm; Wed, 11 Jan 2023 23:30:11 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pFkXe-00019a-Nt; Thu, 12 Jan 2023 00:29:58 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v3 05/13] riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA extensions
Date: Thu, 12 Jan 2023 00:29:57 +0100
Message-ID: <2398293.3Lj2Plt8kZ@diego>
In-Reply-To: <20230111171027.2392-6-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org> <20230111171027.2392-6-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_153009_950070_35505872 
X-CRM114-Status: GOOD (  15.17  )
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

Hi Jisheng.

Am Mittwoch, 11. Januar 2023, 18:10:19 CET schrieb Jisheng Zhang:
> riscv_cpufeature_patch_func() currently only scans a limited set of
> cpufeatures, explicitly defined with macros. Extend it to probe for all
> ISA extensions.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/include/asm/errata_list.h |  9 ++--
>  arch/riscv/kernel/cpufeature.c       | 63 ++++------------------------
>  2 files changed, 11 insertions(+), 61 deletions(-)

hmmm ... I do see a somewhat big caveat for this.
and would like to take back my Reviewed-by for now


With this change we would limit the patchable cpufeatures to actual
riscv extensions. But cpufeatures can also be soft features like
how performant the core handles unaligned accesses.

See Palmer's series [0].


Also this essentially codifies that each ALTERNATIVE can only ever
be attached to exactly one extension.

But contrary to vendor-errata, it is very likely that we will need
combinations of different extensions for some alternatives in the future.

In my optimization quest, I found that it's actually pretty neat to
convert the errata-id for cpufeatures to a bitfield [1], because then it's
possible to just combine extensions into said bitfield [2]:

	ALTERNATIVE_2("nop",
		      "j strcmp_zbb_unaligned", 0, CPUFEATURE_ZBB | CPUFEATURE_FAST_UNALIGNED, 0, CONFIG_RISCV_ISA_ZBB,
		      "j variant_zbb", 0, CPUFEATURE_ZBB, CPUFEATURE_FAST_UNALIGNED, CONFIG_RISCV_ISA_ZBB)

[the additional field there models a "not" component]

So I really feel this would limit us quite a bit.


Heiko



[0] https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=riscv-hwprobe-v1&id=510c491cb9d87dcbdc91c63558dc704968723240
[1] https://github.com/mmind/linux-riscv/commit/f57a896122ee7e666692079320fc35829434cf96
[2] https://github.com/mmind/linux-riscv/commit/8cef615dab0c00ad68af2651ee5b93d06be17f27#diff-194cb8a86f9fb9b03683295f21c8f46b456a9f94737f01726ddbcbb9e3aace2cR12



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
