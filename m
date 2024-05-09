Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D3FC25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BpicHnSgfCZLsVTMXOCstx+nqPNRgeS9zt8zu0X09s=; b=f3aL5vY+Ui2Xt/
	lGYm0A4SpsfdkxIyYnQsmhSxOHUD7VpXf/p8OvzdC0d9TKtWOl5pnT3wKT470vOnHcI8paeU85sBV
	0XLgenSxCkeaUMQnF7YV34osbxMQTVCJXPRdPgh2KuhY5NBQSknpW27cD6nY2wMQyAj+ctJ8CupYk
	hiqGOE0mEz7hM/7eA7oghQf1WL/ciQWISpK1nJuxn0s02FiXhIr37OgoyZj6NcLUaBkgBMwhrTRs6
	1+Uvnelezf3bRffiTfvBdIZCGczn68aV+1XByvrmVNLag11RtWU4wlYPZce9nAxhWOjBMGeaQ3rAm
	5/DZEqmy9HOu/kbHPNZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5AQN-00000002mbZ-2rGE;
	Thu, 09 May 2024 20:31:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5AQK-00000002mZ7-3bA3
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:31:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E1C061D52;
	Thu,  9 May 2024 20:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEF6C116B1;
	Thu,  9 May 2024 20:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715286683;
	bh=3hRwl2K12SkRKNM78wLsl/4te3kJ4BT9nZoF6sCbxbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fIhFWTXoUfrZEXYXnNpjyqAaUa4FKNKp1liB8UAZMze9KVv4hdAFmJylc4iA2ekx7
	 0fhwWAgIWjmCNyvHeQ0baHNbtDX7ycaHfa2SXUNVmD1OT3lznGSH7W9ZOMYVq8XzPS
	 XNdetjkAICbPLl6ZcBlFpBrF6uOo19eNlFEH04hmul98ViHyviLWxshHNPkuB4YW8R
	 j/XqzRH4eUz9DNnhN6j1c2zTJ4wOzQvR5+5d/39yVSA5AWK7LBuN0WnPSyQoM+Na7F
	 +byhIpw32XvdJTGUefGzhSRK/x2pK5XgOnr0McvVxwaDjfNk0mDdQZSj4xrD1fIuDV
	 XVepSil5D0/gg==
From: SeongJae Park <sj@kernel.org>
To: Edward Liaw <edliaw@google.com>
Cc: SeongJae Park <sj@kernel.org>,
	shuah@kernel.org,
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>,
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>,
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
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@android.com,
	linux-security-module@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	mathieu.desnoyers@efficios.com
Subject: Re: [PATCH v3 13/68] selftests/damon: Drop define _GNU_SOURCE
Date: Thu,  9 May 2024 13:31:13 -0700
Message-Id: <20240509203113.63537-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240509200022.253089-14-edliaw@google.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_133129_024300_721228B0 
X-CRM114-Status: GOOD (  16.11  )
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

Hi Edward,

On Thu,  9 May 2024 19:58:05 +0000 Edward Liaw <edliaw@google.com> wrote:

> _GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
> redefinition warnings.
> 
> Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")

I show Mathieu's comment on this[1].  I have no strong opinion on this, but if
you conclude to remove or change this line, please apply same change to this
patch.

[1] https://lore.kernel.org/638a7831-493c-4917-9b22-5aa663e9ee84@efficios.com

> Signed-off-by: Edward Liaw <edliaw@google.com>

I also added trivial comments that coming from my personal and humble
preferrence below.  Other than the above and the below comments,

Reviewed-by: SeongJae Park <sj@kernel.org>

> ---
>  tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c    | 3 ---
>  .../damon/debugfs_target_ids_read_before_terminate_race.c      | 2 --
>  2 files changed, 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c b/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c
> index 0cc2eef7d142..7a17a03d555c 100644
> --- a/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c
> +++ b/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c
> @@ -2,9 +2,6 @@
>  /*
>   * Author: SeongJae Park <sj@kernel.org>
>   */
> -
> -#define _GNU_SOURCE
> -
>  #include <fcntl.h>

I'd prefer having one empty line between the comment and includes.

>  #include <stdbool.h>
>  #include <stdint.h>
> diff --git a/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c b/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c
> index b06f52a8ce2d..4aeac55ac93e 100644
> --- a/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c
> +++ b/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c
> @@ -2,8 +2,6 @@
>  /*
>   * Author: SeongJae Park <sj@kernel.org>
>   */
> -#define _GNU_SOURCE
> -
>  #include <fcntl.h>

Ditto.

And I realize I also forgot adding one empty line before the above #define
line.  That's why I'm saying this is just a trivial comment :)

>  #include <stdbool.h>
>  #include <stdint.h>
> -- 
> 2.45.0.118.g7fe29c98d7-goog


Thanks,
SJ

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
