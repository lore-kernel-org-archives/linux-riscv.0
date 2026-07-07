Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0937C43602
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZsl9RKboWUZPdrMpQ1nvTLaZmgosMm48F222I5iYd0=; b=TaSy8kJOHiZatQ
	juyiaWWaymUQs7UQwoX2uICFMW3p1Dia8AUWEZFfOdasUoACj59TpBfiQdx4P0lU0DcsSVG9TX51q
	jnp+mA5Ayrk0QYWWcJoyAp+q5Mo89rAumngC71n/mSFIyydDy1YSFapV6ZAH1ED/jZq4tGWAGn5bs
	QuVdhDjMzZeTu8dVrIFDmJ1eFn09ySd3CFK3kVAG3RelG/UYzeB2a6oajBKnktlYIzeCLZXgVfh7V
	qRAxPemc9Z12nDu00bOmwoK4o423XwjusUwFqlIV+5qp3gVsw3d0+Ms8JUqvT4ku5MQ1TOAhIHA4m
	F1XeBWPdxnQJ+F4pZJBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh13f-0000000ERuz-35N0;
	Tue, 07 Jul 2026 08:21:35 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh13d-0000000ERuJ-0AYX
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 08:21:34 +0000
Received: from [192.168.1.7] (unknown [120.238.231.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 0FE01408C2;
	Tue,  7 Jul 2026 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783412491;
	bh=aNNNIkpjkV4G09smVjhidBNe4nWgPtemlA8/+5cHQAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=aqC1KGd59OZwMJhjRE4DbAjRibf92EX59xnmALodD0cDdk8EFLYrkdf1Ygq58ewIs
	 GHVNCpxu8RCPQKgCoyx8CWBH4JxD/3mZUHssW+2DY1lQH+scILaUbMOEDRw1Mfh37i
	 Kxsc/U4pfFbocok68CzExkeib+qEDi9daZE/pGka5AOF4pdCq87mHZo+xPtyYkRnRs
	 5msOqP62nRO2Ce5J/RQzy3FrAAlYT2v9ie8IjhQPBEbxrusYuc6n9bfxhXFpk6RUnZ
	 IBi9Y1xV7SxEXk20nS/uD9C12qXrS9Ut/RsWhQhQkJmRaL8gA1mHoAmNDu8ps9VnWS
	 HAoUdTXbNtSqn5gGeBGZpPcZT3Ibrjd6FjqUWJwxDpbUf2WSFPFYIxMdIMoDNubsVm
	 RyfXysjq2G/TO7e1YFAIeSiYn0l7wSwwOVTyanJ2ZmqFm20ZdmAwtW2zkuLBOery4k
	 GYY8wx5ji7aNG/EdclB9KCm4dfp0GJlt2yClH9SMvfhFcFPxP5XOLPRBnUp3g8fWiQ
	 Fb3q+mQmhSDK33OAHEBPqEHcmpULMV+3S3Vn5d1h8irBTxx3u890x6VyPAy36WKvcB
	 Uqji0EFcWQbYzA/RlXmYW5IEnBJFwV2pPJrHu0BDZX5r1lWJdsuOGgsosMrou7an7s
	 b2IQJQkEmsnbDgrb75L7VOHU=
Message-ID: <881386ac-5a70-4141-9de3-cb9ef7a7bab2@canonical.com>
Date: Tue, 7 Jul 2026 16:21:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: NACK: [PATCH] selftests/rseq: Fix a buliding error for riscv arch
To: mathieu.desnoyers@efficios.com, peterz@infradead.org, shuah@kernel.org,
 paulmck@kernel.org, boqun@kernel.org, zhouquan@iscas.ac.cn,
 ajones@ventanamicro.com, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: stable@vger.kernel.org
References: <20260707081720.36510-1-hui.wang@canonical.com>
Content-Language: en-US
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <20260707081720.36510-1-hui.wang@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_012133_240399_F95210E2 
X-CRM114-Status: GOOD (  15.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

There is a typo in the subject, will send a v2 to fix it.

On 7/7/26 16:17, Hui Wang wrote:
> RISC-V rseq selftests include asm/fence.h from tools/arch/riscv,
> but the rseq Makefile only adds tools/include in the CFLAGS, this
> results in the building failure both for native and cross build:
>
>      In file included from rseq.h:131,
>                       from rseq.c:37:
>      rseq-riscv.h:11:10: fatal error: asm/fence.h: No such file or directory
>
> To fix it, add the matching tools/arch/$(ARCH)/include path in the
> CFLAGS and derive ARCH from SUBARCH for standalone native builds where
> ARCH is not set.
>
> Fixes: c92786e179e0 ("KVM: riscv: selftests: Use the existing RISCV_FENCE macro in `rseq-riscv.h`")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>   tools/testing/selftests/rseq/Makefile | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
> index 50d69e22ee7a..aba6317f6cb8 100644
> --- a/tools/testing/selftests/rseq/Makefile
> +++ b/tools/testing/selftests/rseq/Makefile
> @@ -5,9 +5,13 @@ CLANG_FLAGS += -no-integrated-as
>   endif
>   
>   top_srcdir = ../../../..
> +include $(top_srcdir)/scripts/subarch.include
> +ARCH ?= $(SUBARCH)
> +LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
>   
>   CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) -L$(OUTPUT) -Wl,-rpath=./ \
> -	  $(CLANG_FLAGS) -I$(top_srcdir)/tools/include
> +	  $(CLANG_FLAGS) -I$(top_srcdir)/tools/include \
> +	  -I$(LINUX_TOOL_ARCH_INCLUDE)
>   LDLIBS += -lpthread -ldl
>   
>   # Own dependencies because we only want to build against 1st prerequisite, but

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
