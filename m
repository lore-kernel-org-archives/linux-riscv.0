Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEC5C25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wx8MyA/vMKbgxYaskMH20N/wksyX+Y8Kwb3BtUMRFw8=; b=JHxaODEK8wIKYB
	TYzInj+Gl5JFZsG/Ruu2A6v1q72QhfJeTeJOIgnttrq3ktQDYu+yZWp0Y4rMQwpkRGkRYqpaLSLyp
	KbTEKj+6usvD6iE4M/1B4VMpAiH0FNu1Ay33MfCNElEFEEjewjzjlXetOQ3xf1ucPSSmnjOS6XB+t
	rSuP5G2+xtWWhsdr8NUqq70q1aU+yWhi4tPDXOFcG5+JkqDOQvHu1N2m+SqTnvCwjLGnJk2R88U9l
	cH5IgYR/lxdkc0kKQPQolsL24ktVdHkhCRFvtZVfvgkHwmMhgQ4lcS0oQLJOtboeMETbjruDgR0Ks
	9HwgdphO0Un4TSrR2EMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ysd-000000087JH-1vSR;
	Fri, 17 May 2024 14:48:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ysZ-000000087IF-3drq
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:48:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC3D361D26;
	Fri, 17 May 2024 14:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C99DC2BD10;
	Fri, 17 May 2024 14:48:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QNIiwpei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1715957290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0cBkPJS4a5BxMhrLDaw8NzLtBZZCj9gi/zQctsonxVI=;
	b=QNIiwpeic5qa/l6WvUy8VnPkDhwOw2O5t+Zqc3jVrwko+I6pojUkkvxst2Jk4OyqKLfd3J
	wK3xBSDhEAAJSz2SFq6ZkSt6Q5XXRnLGDdX/Nfp8hnhqgf1R4vLiNcFi+jHwY6DQZ+aShR
	9DLIWT0iMqYDchSnSp1S9+BJggdRqMU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8ba86458 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 17 May 2024 14:48:09 +0000 (UTC)
Date: Fri, 17 May 2024 16:48:02 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@android.com, linux-security-module@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org, wireguard@lists.zx2c4.com
Subject: Re: [PATCH v4 65/66] selftests/wireguard: Drop define _GNU_SOURCE
Message-ID: <ZkduIlhF2XswiAJr@zx2c4.com>
References: <20240510000842.410729-1-edliaw@google.com>
 <20240510000842.410729-66-edliaw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510000842.410729-66-edliaw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_074816_116518_E6B2AADE 
X-CRM114-Status: GOOD (  14.09  )
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

On Fri, May 10, 2024 at 12:07:22AM +0000, Edward Liaw wrote:
> _GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
> redefinition warnings.
> 
> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
>  tools/testing/selftests/wireguard/qemu/init.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/wireguard/qemu/init.c b/tools/testing/selftests/wireguard/qemu/init.c
> index 3e49924dd77e..08113f3c6189 100644
> --- a/tools/testing/selftests/wireguard/qemu/init.c
> +++ b/tools/testing/selftests/wireguard/qemu/init.c
> @@ -2,8 +2,6 @@
>  /*
>   * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
>   */
> -
> -#define _GNU_SOURCE
>  #include <unistd.h>
>  #include <errno.h>
>  #include <string.h>
> -- 

But this file doesn't use lib.mk.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
