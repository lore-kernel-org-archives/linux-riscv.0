Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49B9C25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 12:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdwHVfZoLTCt/vDvR3emh2/+/IRsrDzMuye8SL2O1e8=; b=g+vgi8uKMCJqDM
	17EFJHm2zUIR88QRLFgbwqk/Jrz52ryT3QMvq3QvNw9dr78E56WTX00pyhaSqatZazgw1l0o8UaRR
	XGuhF2TgypyUsmPIzx58QqOVbntIzhLZsArIlmW6SAcP0K/rk0Qfogak7jZfcmW0J0JEyJganOZlh
	qE/5VQT0TMNL0UCVsOiDA3UlcpqbRzHK8oY44aBp+///NNpbPX4HqzLRufTdIXvNvZ7r9Cc8xfUjW
	cBTP6K5NXcooPmuz3FLnZfBHkvg9Z1P2QKQykmvp7nu0zlWkfQsRzYgVCn9MB9BRKKJlm0RMxiFY0
	KkUqzGSsheoqc3duTAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9lM8-00000002xwy-0pSu;
	Wed, 22 May 2024 12:46:08 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9lM4-00000002xwO-3d4O
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 12:46:06 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2454154e53aso2842798fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 05:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1716381961; x=1716986761; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WijfuUs+156edccXDFhHVcWXKQ+B4/XZiPfwdG70AgA=;
        b=AbW7CcsVCYdt5olKZGI+HmZoUVVS6y/wJkApicr5XnqMHrPALaT1sH+y7yR01EyQiD
         N5PEaeBrl/7G5hjKrOJByJjQKi4OqKAVdG/6X8x87+6+rbBMnRKdcO6pEIHoZuI9JRXu
         wbtATK8pWW7A2T70NVFRCeC9zgIPRirTAvJGu9xPYmvVBv80QLOKShJQ3RNkFfG3OXFN
         DqA115du6WIkXs+hCJ0KIHy5qDeQBrtA+3RNuuzZ3gVWNe7Qy5JyHM83mm0gf/8oPyM2
         h5REFllbgd+YmLNK2OFwk21fdJTv/ntRuCkbhOwuCguMtIrJGneigY9rotGnUnYmL9M4
         1txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716381961; x=1716986761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WijfuUs+156edccXDFhHVcWXKQ+B4/XZiPfwdG70AgA=;
        b=s4JMGF4eFxBmk1oBmd4nrykskkBwyP3O9iMUZm8exE7QFjPXoJTSyaIUyGThRuGnoq
         FWHM1WpQhk5kwj5UnvivZa8MN5fy7P54ob0eMKVDvm0hOaqhPLBcZrrE+ji34KMg34DR
         fDmg/trJ/SNoam0m4+8jxtO6SWGv7q75xrGFXH1WLOZHm1F3gqFE4mo/5w0i+N+BHNfa
         DHgcg6zM3iiF3/HMVLS/09ClVnShcaUiEJ+IiUxqDAcbuooqizByyTVlUj/i1HZXf4E9
         Ky+QLHyd/dbyMTt+wpymDkZ7Ly8asTRkVFeX2T2Ea1fsYmbP/Vnu2YL7YceZLSomdnei
         oEQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiI06ZePY0NqA2nZYW6UDCikoyRMnSax5bc/iInaBXkkzaYtOlZEIjKLFm0ICArIUGA+R6deLT3qViI1lz46Rs29SNDTGQ1kDfJPr5DF97
X-Gm-Message-State: AOJu0Yyecv4nfbqBizlXnKVQkpu7dEi4M8NZ2rb22iVEIrpWf2wJjewS
	r1x3oCzLLYsUX8+c4f/zn2epv97VUfTcK6sEy2NdIAbsKL++ZF2ANk0u7emSdJI=
X-Google-Smtp-Source: AGHT+IETP3qReUQJuxRlhxnWJn7QpbV+LVqvRpkT9nppkVGnw4JfRUuMImdtGPF2qcpBugAZnHpoew==
X-Received: by 2002:a05:6870:d88e:b0:23d:a1d0:7334 with SMTP id 586e51a60fabf-24c68a33ae2mr2153288fac.17.1716381960558;
        Wed, 22 May 2024 05:46:00 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e074719d1sm151805451cf.35.2024.05.22.05.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 05:46:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s9lLy-00C914-Bg;
	Wed, 22 May 2024 09:45:58 -0300
Date: Wed, 22 May 2024 09:45:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
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
	Kevin Tian <kevin.tian@intel.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@android.com,
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
	John Hubbard <jhubbard@nvidia.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	iommu@lists.linux.dev
Subject: Re: [PATCH v5 23/68] selftests/iommu: Drop duplicate -D_GNU_SOURCE
Message-ID: <20240522124558.GC69273@ziepe.ca>
References: <20240522005913.3540131-1-edliaw@google.com>
 <20240522005913.3540131-24-edliaw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240522005913.3540131-24-edliaw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_054604_993761_C6897FB6 
X-CRM114-Status: UNSURE (   8.29  )
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

On Wed, May 22, 2024 at 12:57:09AM +0000, Edward Liaw wrote:
> -D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.
> 
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
>  tools/testing/selftests/iommu/Makefile | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
