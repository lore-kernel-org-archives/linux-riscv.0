Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C5BC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 17:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LnwnNulYldks/1tkKPQnVxJzFIA2zY35G3gN/p9dyxo=; b=RZ0+srkUdoEZJej3/FhYW2PMC/
	on5mdSq9b7QtUbV2PtBcYQtBemb0c0aINT9V6ds5npHcJZ5pprqsFM5VBvOh8cAO7yuOZX7cXCdxZ
	S8bsLFJxPOOiL2TOoMu4zorlJWa2IrUNPEKnTSGThls/xJw0dmsksx6S7rCKd9mt564WuMucF+Jvn
	AYa0tYz40+rIE2IfQ8G0khzNpl8gD9q5PURwmjQ9KEz7O4PkwOB3Sk7rEDXWDrjF9OTgmKjpOYp/u
	K0R0QZV5PpT+XyUDoy4EKdP25R9Ii+s1SjeTDLorTjfOw7WbZK+/4fDIzMPptimDv5bfYy7cMVrYv
	FnDshE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PN4-0000000DTQ2-2mXY;
	Fri, 26 Apr 2024 17:28:27 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PMy-0000000DTLF-423X
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 17:28:25 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6f0b9f943cbso2179145b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 10:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1714152494; x=1714757294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVaQO4aOOoD5HFv/yuXIkEx3ckF+ESud5GzmK3URHMk=;
        b=P8MsV1zO/Y/RiwNMEVUBhWhxWZvaY/UVkQ3dgxB9ZQFmMYsVXaopHmTmV4ug0SndLk
         an5W6G2awlhBgfSKzFOgeIbYvpC6Kl+absxEDFZI2SmHnjghHG44Cq8Vel+7LZDo4bDi
         6ok0v3bI3iNOB7HVJFw2KFWCv45ufA1r3MheRa27pZ00IBKSMatfaSS6szqppFJSv1KB
         XKcH/FPOfYgcoRlXZTiA39meO/SPR2Oldtt8wVHSnhgkiOH5FA9Rec1KAlUuJsP4Iccu
         nCKsrrlSrWbdOgmdrs8zTyBo2oAIFyBgHQDIIEHBM79TIWGYp87590r/gOIyq1Cu0o8H
         nr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714152494; x=1714757294;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVaQO4aOOoD5HFv/yuXIkEx3ckF+ESud5GzmK3URHMk=;
        b=uuNNCsvlaE+jKgai3Ga5g9IliHOctj/5W72ciSoDoigoKgXfENYOmWdwy7k91+Yr2J
         q1TuxQv9Kj3Bz+aZME4q/tqixUIx4UVPUKGcM1uDatL2bMWSzYPtAm0saBSTGErb4ba2
         1AO3lCI4Cf5zLN2gfgafjmRYWwt+jiba99MJPvNOK3FhYqN0qs9BOYYnCOd9seYaKn0A
         Vpzt0a8qjiYQFp6F8LUnQBEa8Dl5JBBjkhOSBQCXkoFoRhCEP0JkrY/QnvC9vDO5zcdL
         70oFTMdEyJzmlj+zGUMm0s8vr5yYHGjXMlSGkPFK03mTzRW7u42fjaIST4ClXUrmyplQ
         1Ocg==
X-Forwarded-Encrypted: i=1; AJvYcCUdpNT1Z6PnzLZzusNljBiE/zfLGhdXF7ggT4kHEk67E71YQKX0qjZZZYGWhdk4lY6rJp4xWFcg51x1RDRIhUIo6dlemQLMe5MY61N8Np12
X-Gm-Message-State: AOJu0Yx2wzXMlmZTWLBv0rbJIU5XKbRl5rkmPUBALtpQGuNF+cXGqfTL
	TiBvRTVV6hM/67J21K7ytL0OMwHjAgP/voc04MFbCEfux911tAReOCs4u6dMpoU=
X-Google-Smtp-Source: AGHT+IF5ZhmO7eX8nkSZYElD9vu5AkgvriEyIvfRabLVo+Eb+eHgs+Ia3e9odQQKRsC00z8QgP072g==
X-Received: by 2002:a05:6a20:43a9:b0:1aa:5b05:7926 with SMTP id i41-20020a056a2043a900b001aa5b057926mr4853573pzl.39.1714152493907;
        Fri, 26 Apr 2024 10:28:13 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id fm8-20020a056a002f8800b006ed059cdf02sm15099295pfb.116.2024.04.26.10.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 10:28:13 -0700 (PDT)
Date: Fri, 26 Apr 2024 10:28:13 -0700 (PDT)
X-Google-Original-Date: Fri, 26 Apr 2024 10:28:08 PDT (-0700)
Subject: Re: [PATCH 1/2] perf daemon: Fix the warning about time_t
In-Reply-To: <20240305120501.1785084-2-ben717@andestech.com>
CC: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
  Mark Rutland <mark.rutland@arm.com>, alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
  adrian.hunter@intel.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  dylan@andestech.com, tim609@andestech.com, ben717@andestech.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ben717@andestech.com
Message-ID: <mhng-8fa791ba-8c58-44c9-a4fd-f40ab808042b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_102821_139283_1F41E810 
X-CRM114-Status: GOOD (  18.20  )
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

On Tue, 05 Mar 2024 04:05:00 PST (-0800), ben717@andestech.com wrote:
> In the 32-bit platform, the size of time_t is still 64 bits. Thus, use
> PRIu64 to resolve the format problem.
>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  tools/perf/builtin-daemon.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tools/perf/builtin-daemon.c b/tools/perf/builtin-daemon.c
> index 83954af36753..0b6ffd51c475 100644
> --- a/tools/perf/builtin-daemon.c
> +++ b/tools/perf/builtin-daemon.c
> @@ -23,6 +23,7 @@
>  #include <sys/signalfd.h>
>  #include <sys/wait.h>
>  #include <poll.h>
> +#include <inttypes.h>
>  #include "builtin.h"
>  #include "perf.h"
>  #include "debug.h"
> @@ -688,7 +689,7 @@ static int cmd_session_list(struct daemon *daemon, union cmd *cmd, FILE *out)
>  			/* lock */
>  			csv_sep, daemon->base, "lock");
>
> -		fprintf(out, "%c%lu",
> +		fprintf(out, "%c%" PRIu64 "",
>  			/* session up time */
>  			csv_sep, (curr - daemon->start) / 60);
>
> @@ -700,7 +701,7 @@ static int cmd_session_list(struct daemon *daemon, union cmd *cmd, FILE *out)
>  				daemon->base, SESSION_OUTPUT);
>  			fprintf(out, "  lock:    %s/lock\n",
>  				daemon->base);
> -			fprintf(out, "  up:      %lu minutes\n",
> +			fprintf(out, "  up:      %" PRIu64 " minutes\n",
>  				(curr - daemon->start) / 60);
>  		}
>  	}
> @@ -727,7 +728,7 @@ static int cmd_session_list(struct daemon *daemon, union cmd *cmd, FILE *out)
>  				/* session ack */
>  				csv_sep, session->base, SESSION_ACK);
>
> -			fprintf(out, "%c%lu",
> +			fprintf(out, "%c%" PRIu64 "",
>  				/* session up time */
>  				csv_sep, (curr - session->start) / 60);
>
> @@ -745,7 +746,7 @@ static int cmd_session_list(struct daemon *daemon, union cmd *cmd, FILE *out)
>  				session->base, SESSION_CONTROL);
>  			fprintf(out, "  ack:     %s/%s\n",
>  				session->base, SESSION_ACK);
> -			fprintf(out, "  up:      %lu minutes\n",
> +			fprintf(out, "  up:      %" PRIu64 " minutes\n",
>  				(curr - session->start) / 60);
>  		}
>  	}

Sorry I missed this earlier, but IIUC this one is actually incorrect: on 
most 32-bit platforms time_t is 32 bits, it was later extended to 64 
bits.  RISC-V is special because the work to make time_t 64-bit had 
started when we submitted the port, so we just jumped straight to the 
legacy-free uABI (after some headaches).

So IIUC this would introduce a warning for some other targets.  Either 
way I shouldn't have picked it up as it's not a RISC-V patch (this is a 
generic perf file), so I'm going to drop it from fixes.

Sorry for the confusion!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
