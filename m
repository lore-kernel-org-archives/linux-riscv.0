Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFABC2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 15:54:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57ED920786
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 15:54:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G57KkY09";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="g0hC3Kle"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57ED920786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mOAcDxbx3yjAHXmbAvxvhte9bWp3kvGPtAc1z5dsxok=; b=G57KkY09B+2XIs7/d1nzqqrn3
	tXDl6I4ja2Q55qhkvJWigVhOqPhEx+Yk5lZyj4rDqYVO/QBUjsVW42K4ItQshBsNYtSz5YHWClH1c
	78Bzaijnn/acRVUWF9FX2jrNi6cbSr/lV9xF3q5yvCq0wETHKuz9kccttGSJAXMCf4m+NIrGRhJcI
	qkL1XjIO096k72gcgu+zX2GpjQpEkJhKK/D6LTaFtRbrMvxgYlfjVp/kY1k4Z4MrGe2AF7VWDeJZ1
	BSaCET+77rtknwpkrNyOHkeFVo93UL/i47zo0yWy7rzV0tP8YkAj1sFfixIqjL/HzovK+h+QVyKNA
	bO19JDDSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZycz-0002PG-Te; Tue, 03 Nov 2020 15:53:45 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZycx-0002Oc-2q
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 15:53:44 +0000
Received: by mail-io1-xd42.google.com with SMTP id j12so4299444iow.0
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 07:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RxcYyzlJIfpoDTn99uiNJjsovgmxNJ9qxu2EQoMxwrY=;
 b=g0hC3KleoRHQytZk6VuAQlbJB2qT9ozOC+QpKD7zRStkeeHl2DgPNDDOI5LkwGbv9B
 vfN+GCcQFPzSiLWBVzNKdXMEO+jrCW46wWbOm6teamEMLvuhls6YWV7ot+CbS/L3pUrW
 PDYOPMp8yOG/Eb67EoH1ES/yj+Uw29TTff9Jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RxcYyzlJIfpoDTn99uiNJjsovgmxNJ9qxu2EQoMxwrY=;
 b=pF7UpWx1WSVv9jxxJsay0xRxohwBwQBdPbjF0ej5/geudx+ZTInI7bj1TCoX+eSIt7
 f2ocGLPJTkmxAMmNNvyIsN54Rzl0r+wcFkvyvPayXVAapgHMi73/94QlTMEgcl4vycDz
 SEo/Cu+5nuE/HFOplIfeaR5GjGVhFE3gqlDTyxARRPryq8dTytZXTOSBRNS8364bBuz/
 uaFhImJfKQKUCuGDb2EmmaxmdqPfwwE9NmweT2dr4Olahev++jr3aA7PzXYDCzGsPIjU
 pss7cEL5xia6gjBNyjvb9aaP4ENU1qmUhg41xt+Qs0735gmBxymVBELIDY+1sQaa8sWk
 qVOA==
X-Gm-Message-State: AOAM530PdIN8B+hFCnhrsLkIFUSE3H03rJiH9rNPgGJLYPMdwYbUd7Ud
 Fv2bOpv/xTAMxh+WpKUi7TaqDPdwcFcG8UN5tvkc
X-Google-Smtp-Source: ABdhPJzjU76v5q1EzRTuxo2bz1gyuUH4tZkTPdyeiViNq/Jz00zBfZwSeu7W7zPvGL7uWKe0IJwuYUiKafKPJwXG80c=
X-Received: by 2002:a05:6602:2d93:: with SMTP id
 k19mr14385677iow.51.1604418820931; 
 Tue, 03 Nov 2020 07:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20201102040357.118400-1-wangkefeng.wang@huawei.com>
 <20201102040357.118400-2-wangkefeng.wang@huawei.com>
In-Reply-To: <20201102040357.118400-2-wangkefeng.wang@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 Nov 2020 07:53:29 -0800
Message-ID: <CAOnJCUJAOtdyhxWxThVuQD920VbfE-tpYyiE3+yhbhEO-0V6gQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: cleaning up boot dir
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_105343_270144_E53F396A 
X-CRM114-Status: GOOD (  14.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Nov 1, 2020 at 7:58 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Let's remove all files under riscv boot dir by using archclean rule.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/Makefile      | 3 +++
>  arch/riscv/boot/Makefile | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0d9ecb959962..8c29e553ef7f 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -101,3 +101,6 @@ Image.%: Image
>
>  zinstall install:
>         $(Q)$(MAKE) $(build)=$(boot) $@
> +
> +archclean:
> +       $(Q)$(MAKE) $(clean)=$(boot)
> diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
> index c59fca695f9d..666f08662170 100644
> --- a/arch/riscv/boot/Makefile
> +++ b/arch/riscv/boot/Makefile
> @@ -18,7 +18,8 @@ KCOV_INSTRUMENT := n
>
>  OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
>
> -targets := Image loader
> +targets := Image Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo \
> +          loader loader.o loader.lds loader.bin
>

Image.* should be sufficient to clean all compressed images.

>  $(obj)/Image: vmlinux FORCE
>         $(call if_changed,objcopy)
> --
> 2.26.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Otherwise,

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
