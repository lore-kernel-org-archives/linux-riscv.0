Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B04C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 23:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LP8OupSEFkXoNDaI8ud9UfSs2a7kdCEqrtn6LZTFmmU=; b=4t9hQCv5ptHWwCDalZMofH8ZbA
	qx68Fk2xJJcmjja+d5N6NySDsYFv1ryjTwi1f4xUZXO9p8Rwzyii3/oap7kipuYQ5TRR4VnkOE3NX
	WAugGFA88TcU5tp5n74peaO7/5jzX4PuxSQSQHmpPEEz9xhuhQIZ29oWK+7B2sWbzRj92TRZIEWJN
	cImr4rXG725qbcKI7QWrSWUsRw/G0pKcZD2R019aCMG19DhGkDq+chAMtRqFK/gI7ZNoEcWZZk9hP
	JKev7M794CULOpPrE4IAFLF7+N+WhRN4oVrM1UIuQSKFR+j6nj+R4zvfG+mSXTvzQpJmW9ebOxudv
	qGVV/nrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj7Pb-00D9pA-Gz; Thu, 13 Oct 2022 23:14:47 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj7PY-00D9op-Ez
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 23:14:46 +0000
Received: by mail-pj1-x1031.google.com with SMTP id t10-20020a17090a4e4a00b0020af4bcae10so3207463pjl.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 16:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDioHqB5F7/3YSGar16SBKDgEWgxugbyxzqDdZ1E3b4=;
        b=plJ+qVTJNoeiddFoo73DNlK4n6xZGEVTT0Z/B5fl7jjMHlQRR3azlci2ooq3oMtyKj
         cOuAnj1euc6ssLeSmJLfC4aLH2kJ7xFlDCQWDcpsMnvelE9GLU/jWLesamvyTg0HEYED
         nkgHBbDOTBNSyieJMhTwJUjB6g3neUypn9OqRaHPfKkGwispiEWSYKJp7upcs0vQD+8Z
         3Iu6u0mV1TP6ujnkrjNVFkdJnwf5SUXiWGnQRpKWOPpEMJJdZ9SVSdoHKkL3isYMoX6O
         cyHaAGEY5gJFDGSITYGtUvF4Q/ddw2j3loHnRDGc8rhOfW/hwaf4kTlIlA6ZDc2XhRZA
         xLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDioHqB5F7/3YSGar16SBKDgEWgxugbyxzqDdZ1E3b4=;
        b=080HfA3UREMUiIuzBh/NWRBJHqcUBI7MPo+7eJcVpYFsI1mJQlYx7jFW5NZ99Qqts1
         dER3MBoORsYWAltlE33wMWgW2PKS3HcqmI6jxIXDEGXr9oK2OXdeuowydZLQef3hvzmM
         1EJ6HaX+7E7mru6EiWx/oY9gwQEHbUeD3SigMeUkO0znVJ/FszZthztL0JAIF4nqSJ8f
         FDBGRVXwoKQsHQ54avKllIhAouEEQjDLnn99YFx5bfZ35HE7GXR/1Al+Fx5Q1KJ4x56y
         yu7cw3yJ+VaGFfog551jY7IPZtlvSpq/6uX5TU/jZ4uQGkrErRcUPr7hucH9zphHUnqs
         LtaA==
X-Gm-Message-State: ACrzQf0Ju4nov77k+HrJKC6rftN7rqgeuRQzq2iPRsjcI5PJ0FpzlE3L
	46XvHVCD4LvkUQbTHkm4Ue8s6AQWFU7Zxg==
X-Google-Smtp-Source: AMsMyM510VnCTsRydCVWRBtV4cldUqNZuPquvw/JrWkDlOl2IlvRvTU8F7vSIetP1s0J28oAnLyOWA==
X-Received: by 2002:a17:903:240d:b0:183:9bab:9c3 with SMTP id e13-20020a170903240d00b001839bab09c3mr2153392plo.48.1665702879928;
        Thu, 13 Oct 2022 16:14:39 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id o2-20020a17090a55c200b0020d45a155d9sm3703115pjm.35.2022.10.13.16.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 16:14:39 -0700 (PDT)
Date: Thu, 13 Oct 2022 16:14:39 -0700 (PDT)
X-Google-Original-Date: Thu, 13 Oct 2022 16:13:52 PDT (-0700)
Subject: Re: RISC-V Patchwork
In-Reply-To: <20221011160744.2167025-1-conor@kernel.org>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-8133a216-9206-49bc-bff5-0cbedfb2ce28@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_161444_742336_7EF6DF02 
X-CRM114-Status: GOOD (  30.47  )
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

On Tue, 11 Oct 2022 09:07:45 PDT (-0700), Conor Dooley wrote:
> Hey,
>
> As one or two people have already noticed, we've resurrected the
> patchwork for the RISC-V list @
> https://patchwork.kernel.org/project/linux-riscv/list/
>
> The patchwork bot should let people know when their patches have been
> applied. Hopefully it'll help people track what the status of their
> patches are a little better and try to prevent stuff falling through
> the cracks in Palmer's inbox.
>
> As an FYI, the statuses that are intended to be used are:
> - New: No action has been taken yet
> - Under Review: The maintainer is waiting for review comments from others
> - Changes Requested: Either the maintainer or a reviewer requested
>   changes in the patch. The patch author is expected to submit a new
>   version
> - Superseded: There's a new version of the patch available
> - Not Applicable: The patch is not intended for the RISC-V tree
> - Accepted: The patch has been applied
> - Rejected: The patch has been rejected, with reasons stated in an
>   email
>
> I reset patchwork and marked all patches as archived so we would have a
> fresh start. If your patch has been archived & not applied by the end of
> this merge window, feel free to resend it.
>
> Thanks,
> Conor.
>
> @Palmer: hopefully I did the scissors thing correctly..

b4 doesn't like it, but my old scripts just picked up the whole thing as 
a patch.  I tossed the above bits, LMK if something went off the rails.

>
> -- >8 --
> From f886e8a9def4bd3f2fa8a0a4d7e92c94fe72ea72 Mon Sep 17 00:00:00 2001
> From: Conor Dooley <conor.dooley@microchip.com>
> Date: Tue, 11 Oct 2022 16:49:53 +0100
> Subject: [PATCH] MAINTAINERS: add RISC-V's patchwork
>
> The RISC-V patchwork instance on kernel.org has had some necromancy
> performed on it & will be used going forward. The statuses that are
> intended to be used are:
> - New: No action has been taken yet
> - Under Review: The maintainer is waiting for review comments from others
> - Changes Requested: Either the maintainer or a reviewer requested
>   changes in the patch. The patch author is expected to submit a new
>   version
> - Superseded: There's a new version of the patch available
> - Not Applicable: The patch is not intended for the RISC-V tree
> - Accepted: The patch has been applied
> - Rejected: The patch has been rejected, with reasons stated in an
>   email
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a5012ba6ff9..e2882dc703d8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17516,6 +17516,7 @@ M:	Palmer Dabbelt <palmer@dabbelt.com>
>  M:	Albert Ou <aou@eecs.berkeley.edu>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
> +Q:	https://patchwork.kernel.org/project/linux-riscv/list/
>  P:	Documentation/riscv/patch-acceptance.rst
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
>  F:	arch/riscv/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
