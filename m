Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9BFC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kbmVuaV62w4qjah8VwOsVdvt87Aji20ha8d9NqiQio=; b=zP0/FXzkWrRpUY
	NO6N+FfNlN/rput9xr3VNqpc9VvrYlCEFr2GcFfLY+EiCFXig5dBkDoyoJrStm18noRtCBpuWHGor
	lX33Xuz8rgBT4c+YhtpkDLXcHJ+8rKfa6NPluIQt+AwZaXo8Bn7fa8J4VYNQRqso5Se0DOzf+Phbb
	R+dmDA+n8WcREXnSFZUgcfVVeJzQwYOhcCC7gHYzLbw849Om8ddilFVETxJuj/QMtsHJgK0TK8wOA
	79xR9915/Osvpm0uoEbwEogf2GYitH//l60YpMQGXN/EECQKq+BxmQstNOfU3JIgWVj37oHWbWrRt
	+7fjfKpv6Qm0DUE6a1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aVQ-00000001Yw0-1rWe;
	Wed, 22 May 2024 01:11:00 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aVM-00000001YqM-0BWr
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:10:58 +0000
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 3D4EC72C8F5;
	Wed, 22 May 2024 04:10:31 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
	by imap.altlinux.org (Postfix) with ESMTPSA id 2249B36D0168;
	Wed, 22 May 2024 04:10:31 +0300 (MSK)
Date: Wed, 22 May 2024 04:10:31 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Edward Liaw <edliaw@google.com>, Mark Brown <broonie@kernel.org>
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
	Kees Cook <keescook@chromium.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@android.com,
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH v5 02/68] kselftest: Desecalate reporting of missing
 _GNU_SOURCE
Message-ID: <20240522011031.nps5dejrgk5b442y@altlinux.org>
References: <20240522005913.3540131-1-edliaw@google.com>
 <20240522005913.3540131-3-edliaw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240522005913.3540131-3-edliaw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_181056_972577_979E9EA3 
X-CRM114-Status: GOOD (  19.00  )
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

On Wed, May 22, 2024 at 12:56:48AM +0000, Edward Liaw wrote:
> From: Mark Brown <broonie@kernel.org>
> 
> Commit daef47b89efd0b7 ("selftests: Compile kselftest headers with
> -D_GNU_SOURCE") adds a static_assert() which means that things which
> would be warnings about undeclared functions get escalated into build
> failures.  While we do actually want _GNU_SOURCE to be defined for users
> of kselftest_harness we haven't actually done that yet and this is
> causing widespread build breaks which were previously warnings about
> uses of asprintf() without prototypes, including causing other test
> programs in the same directory to fail to build.
> 
> Since the build failures that are introduced cause additional issues due
> to make stopping builds early replace the static_assert() with a
> missing without making the error more severe than it already was.  This
> will be moot once the issue is fixed properly but reduces the disruption
> while that happens.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> ---
>  tools/testing/selftests/kselftest_harness.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index b634969cbb6f..8e53686b71cb 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -51,7 +51,7 @@
>  #define __KSELFTEST_HARNESS_H
>  
>  #ifndef _GNU_SOURCE
> -#define _GNU_SOURCE
> +#warning kselftest harness requires _GNU_SOURCE to be defined

Maybe this should be `#error` if it really requires?

Thanks,

>  #endif
>  #include <asm/types.h>
>  #include <ctype.h>
> -- 
> 2.45.1.288.g0e0cd299f1-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
