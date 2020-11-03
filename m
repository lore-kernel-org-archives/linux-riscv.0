Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512E6C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 15:40:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE79220756
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 15:40:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E1NSK8HF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="AeHdhA79"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE79220756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dpI7pzUuhP3T31uTZLjF2ud0jGo7wj2z84ZpmcgcASA=; b=E1NSK8HFvhr4HvwDauCCLE2H7
	qg2/81CiOAHcSMKo6+v3Zs2FMIxKkCCLd5WMJdAsXqm77VneepmiarVnMuVt3oWlaj4P5V36EWDlb
	KiXbzKanLiBKwk7JSTsqEh7cH0WraZCzKlli77G+t0MVXDLjKsG4d2z0k3Ya7QXcYaA84Xo0xGdvx
	h/h+2wDGcu8emlSZRGm28sG/PvarwIhOwQt6BAv/MhG+sfanAkskYO7eUIoS31lixDmJ9WgzaeKDJ
	laWODXnLKeW3LbbVW/UzudLAnwN5tBBUq8aYPpAIAKd3RqqTmvvXHI3+1w1Wf+v9eeg3CrqddxZNE
	LC7DbWLPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZyPZ-0000QN-UG; Tue, 03 Nov 2020 15:39:53 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZyKb-0003pM-FB
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 15:34:48 +0000
Received: by mail-io1-xd43.google.com with SMTP id s24so12046584ioj.13
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 07:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PDzuqRBY9TPcjvpJx5iw81HqGHirydGBuZGKMEGgwBk=;
 b=AeHdhA79oRvb9QmWVswkWOlIhdKws84nYnq7HwnB9lM7GbD4xpEtoFwsxe08vkuZ3c
 anBoa3S9IjrOevf9geKCXxAzSkZkH4SMskj9zVSdXqmZOyv7PVrPJMrjp/FlX3Ft4ggs
 MXN7jnSYk7OYE8oUEzqimBND6wJ+dPfTjUutE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PDzuqRBY9TPcjvpJx5iw81HqGHirydGBuZGKMEGgwBk=;
 b=Vo1+uLZznUoDCUyshH9XlyH5J3WkEAP5wxOZNODjDHF6MOpJy5CfQdbGbk2MpOhLDK
 33lAOFFNzL+W/fTOXPFhRk25oVjX6wdYDo4ybhODTxv+BYsrW6nf0uR1TeoKDTubyx69
 qxN5seBdE4ZhjB8nrhr6eblFQdWLh2uVfLYXkLzv93pLf0hZcgxXoYXgKSAJ7s4JMU2C
 NkQ+I6oKO9IhkNDPDdRAIg693nrkY9W7GPi+yGvPQsSrYuQiRMHzz82iVFNK7ebCJJ4S
 Q/iYv/mr21pKE63F6xFP0ayfd2+dbicqdxsPI1SFGcZw6qJv82zPL2RSXfB93S9bR6JA
 UpOg==
X-Gm-Message-State: AOAM5330G6UzWPe1WDbwoJ6uMLeiKEslYKxk7lKSgIU4A8RyP2Sx/+SP
 bDDHi1gxo/9j80DF2lNBz+Fj5kJC6fVNKmDAl8pRPAtStBgm
X-Google-Smtp-Source: ABdhPJxe5XdU0c0eSdTyo19EZHA939skTVNQrQFrhYiac1QlgzXALX90rvZJe1CefTYOLNeVjdmbQa1tc/9QRMnu+5M=
X-Received: by 2002:a02:9716:: with SMTP id x22mr2466303jai.114.1604417682600; 
 Tue, 03 Nov 2020 07:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20201102040357.118400-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20201102040357.118400-1-wangkefeng.wang@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 Nov 2020 07:34:31 -0800
Message-ID: <CAOnJCUKJVmUP9fJEYofVV4gKHDngfS_Yv6dLvZQOBR3ZoiEX8Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: Fix compressed Image formats build
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_103447_972646_1650A0EE 
X-CRM114-Status: GOOD (  13.69  )
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
> make[1]: *** No rule to make target `Image.lzma'.  Stop.
>
> When make ARCH=riscv Image.lzma, it won't work, let's fix it.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0289a97325d1..0d9ecb959962 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -96,5 +96,8 @@ $(BOOT_TARGETS): vmlinux
>         $(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
>         @$(kecho) '  Kernel: $(boot)/$@ is ready'
>
> +Image.%: Image
> +       $(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
> +
>  zinstall install:
>         $(Q)$(MAKE) $(build)=$(boot) $@
> --
> 2.26.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
