Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2D0C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 09:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gyTcy34A2rekZ8ET0uK8Os+vxg0Pra0pm6eKiJAuNA=; b=T6H+dEvaCOBcb9
	aqoktu6kSBY3t5pp0rbF9qQIC1tcq90FlaJeYP0brXHfx+0JbiUulAsfMgVm5ElQglAx6jz7N7iNi
	2KRpTRzchofjzFXZfE64eE8goTJAWnMN4X/ayL6x8rjemHG/WgJXqluG/1eZ7HGKX9LDIjT6LEv5O
	xW3/i08kSqlFvPVF+g1kPQ0LO4o193rybtKbxTUQ7DRePzW3mXcIDzfcCZvqZ/p3Nd/ZoziUA4075
	QHAEIW9o2eojQuDMQlaUi7ofUQe5UORUY76BmjHts+ezIPAHEkCwkH5+wjHaO3KxvPj7On/LsWqD1
	kdVMrODXh22w3f9DCF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ3LK-006miT-Qs; Mon, 22 Aug 2022 09:03:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ37s-006eZM-9o
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 08:49:41 +0000
Received: by mail-pl1-x631.google.com with SMTP id x23so9305836pll.7
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 01:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=iCDhhI8vpKAF6ccQbhIqtzhgqF2l3okiXUrZiiXnnm0=;
        b=W9Bhg7iSBNOgvnU4J2cCOmqNHfLa6kD+gS/Usqk3AknhHc4v+WiAGy+JIEpPk93F0v
         ZshHrlelmZNNgf8KNqLcb2tdv1RVNyQ8n2r9V1LafUXbS29Nfdmtx3Bk4T2UYNjQbWdQ
         IROe8E7Zl0eewBHK1sXgs9MmGbJECKFYcUSw81vfilrCvGg+ZbUA4gOLuTUO6Q7BEYJe
         MN+Wo90tD7jV4sH/X4vyuwR3x5Dph7r+EdaKdioVD6yx07RcnroQp+rGacCErIWwFtuE
         QhTbdQdv1J//jmz2eZQHWOI5vKSy3TwcG8mOESrZt1vrbVa3t25yUqVLuSQfBzvMQnt4
         I0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=iCDhhI8vpKAF6ccQbhIqtzhgqF2l3okiXUrZiiXnnm0=;
        b=7RAvykWMeJMJEDpt1nBMAM7puoFlLZkhkkbJa/+K6U8kZsJHOepchaa/AkxgB6uPUn
         vsC+/WUc0riMLksoYdZ6iIyWuJwvTYRdJym1K5ZJhM98JHawEWI32VY8Ynj4qVIk2nLQ
         AA475V21pWlNRbOp8H1yvqKthYBYl7rkP58TTpFppHA6VpEXxr+ptl0suCdKZ2CJ04q3
         /zEJp8kSaKSiC73kr1QdUJxM71N+u7HP/KLIISRFv3aH2WmfqJEB5xO/5sfk/83T4c+r
         KzxjC8GBltWjPyrTRDhOjrKmxwPn5AOkDtcyfrgQY6FrFBOVbgwf6498yBrk4tRiKeUX
         soFQ==
X-Gm-Message-State: ACgBeo0pGAF4mayqQypXYhrRdZPQsAQPRXouTALvNGsg4DuSQJDE5YMV
	I/5KIrqZzmAOcSYdM7ZRr3g=
X-Google-Smtp-Source: AA6agR6cvVQaqLj53v88y85bXAGnA2dBM9QOcc34rNSyJrlGP9xIQiKAtSUBCGRWwgaBCUY9lmf8Ow==
X-Received: by 2002:a17:903:2602:b0:172:ba94:1590 with SMTP id jd2-20020a170903260200b00172ba941590mr17217787plb.146.1661158177309;
        Mon, 22 Aug 2022 01:49:37 -0700 (PDT)
Received: from fedora ([103.230.148.185])
        by smtp.gmail.com with ESMTPSA id c2-20020a634e02000000b00401a9bc0f33sm6874136pgb.85.2022.08.22.01.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 01:49:36 -0700 (PDT)
Date: Mon, 22 Aug 2022 14:19:28 +0530
From: Gautam Menghani <gautammenghani201@gmail.com>
To: keescook@chromium.org, shuah@kernel.org, brauner@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	guoren@kernel.org
Cc: luto@amacapital.net, wad@chromium.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftests/seccomp: Check CAP_SYS_ADMIN capability in the
 test mode_filter_without_nnp
Message-ID: <YwNDGAVrik3DvWZf@fedora>
References: <20220731092529.28760-1-gautammenghani201@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220731092529.28760-1-gautammenghani201@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_014940_401084_1FD65422 
X-CRM114-Status: GOOD (  19.93  )
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

On Sun, Jul 31, 2022 at 02:55:29PM +0530, Gautam Menghani wrote:
> In the "mode_filter_without_nnp" test in seccomp_bpf, there is currently
> a TODO which asks to check the capability CAP_SYS_ADMIN instead of euid.
> This patch adds support to check if the calling process has the flag 
> CAP_SYS_ADMIN, and also if this flag has CAP_EFFECTIVE set.
> 
> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 136df5b76319..16b0edc520ef 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -392,6 +392,8 @@ TEST(mode_filter_without_nnp)
>  		.filter = filter,
>  	};
>  	long ret;
> +	cap_t cap = cap_get_proc();
> +	cap_flag_value_t is_cap_sys_admin = 0;
>  
>  	ret = prctl(PR_GET_NO_NEW_PRIVS, 0, NULL, 0, 0);
>  	ASSERT_LE(0, ret) {
> @@ -400,8 +402,8 @@ TEST(mode_filter_without_nnp)
>  	errno = 0;
>  	ret = prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &prog, 0, 0);
>  	/* Succeeds with CAP_SYS_ADMIN, fails without */
> -	/* TODO(wad) check caps not euid */
> -	if (geteuid()) {
> +	cap_get_flag(cap, CAP_SYS_ADMIN, CAP_EFFECTIVE, &is_cap_sys_admin);
> +	if (!is_cap_sys_admin) {
>  		EXPECT_EQ(-1, ret);
>  		EXPECT_EQ(EACCES, errno);
>  	} else {
> -- 
> 2.34.1
> 

Hi,

Please review the above patch and let me know if any changes are required.

Thanks,
Gautam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
