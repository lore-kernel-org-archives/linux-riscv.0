Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B191C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jun 2022 21:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzZFvnIjeapqGfvmvkhNtg6pPX2YMCmZ+2NynHxVcCU=; b=RYWYyKYVYjcKTW
	yGG1PJ54P5YcD27uVwH6//Tj2Hi8XqDxKSyKXB54sZo5+ZI13gpkOAW1AaewhS5CJovWKjDDohpQi
	zPrLESEu7Jngc2KVD2yN7xf6mTeEXCLl6HSe2kd1ZAuYyBoQYJ5jlISEtP1hPwtXXZPyxlrskXUOk
	NO1ou2YlxQLsHy3S6+T/leDUCvPSJfkvRfdYafBGe6aiNJ4x6GHn31AprbZD/s75tosrihZoQIUsY
	7kyz3TEPD9BnDu44cFt06culwycAMD2qr2517gywm0qberhik01GrktRdIQ/13GrZ6G3ptKoIVAA0
	nWVmZFdWosHXCP/DkkJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEU3-008gFH-4d; Fri, 03 Jun 2022 21:05:27 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEU1-008gDL-9Q
	for linux-riscv@lists.infradead.org; Fri, 03 Jun 2022 21:05:26 +0000
Received: by mail-lf1-x12e.google.com with SMTP id h23so14446492lfe.4
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jun 2022 14:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rdCC350CRfTnlMVl9hZPunLr7i2db8KX60dDtm/jhb4=;
        b=dtlC/kgJuVZ3CpEdyshW/IR+2qIgLu09prKB5QevJec1hXcL9NpbvvzgNZ71mOaAiZ
         PftpokKOYCrGeork8uYNkaZozFeRadECDkdIa16Jn4C/UQtALgI6m446ReodOYVPs+Kk
         Kejoro6Tj3+9RBJ/zDzt6A1+Co7sMDJnAiH3pOJ5YsamY4dDsQYB5nte2cBU8u0S7/GB
         u4AYa+ZGfS/5XzGXrNdKIn0k1wBWzELkZRwu2sJ+63YdiywR+SyoxwBfilufmJboPU+o
         caid2AT5hUUlS8YLSUyMINY4lZO28FEotMfq4nVHXqBuFNUVmpLr3MWsHN55PMWHTMAV
         /M7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rdCC350CRfTnlMVl9hZPunLr7i2db8KX60dDtm/jhb4=;
        b=PZVKEr1LpL3ce6uinLbwnKEfU9FVZDxalpYJ/TkpawC7RhS+m48o+H9kBHPfQacsYV
         kxoQ6TBPcLldbJp8YeND9TiLSU+ejiDMO1fTjaR94ZkSspmNJzBhWPjd+ptgBgiXIK/5
         42SMWhQBp8q0horUH1EtoVrAOm2/pY+8+7/45S9EVRvMMJgMD2f3FUD/v/D7S7ljf0kH
         ILAYG4ucBzcZTBa8YecP/gZMbe/08EYROtRenGFCQlDJcmuzxMuZoLN2BfpCp6/J8wqj
         +3z2CVxLB+QWGH1aXCLNNDlzmasEXa0zXNuE7qlTir18GN3nC/F3Y5rBcQ8e0Xfxbp7K
         1ufg==
X-Gm-Message-State: AOAM5304AIuiaEg4ZqsHwCf6qNHU/wMvvw1UE6fCV+O9Sub+yg5Hw71t
	rbdkVx2L5gm7OJO1jUl9/luEHQPumZkxatUy6v8=
X-Google-Smtp-Source: ABdhPJxQRsoWD2DZFdgj6bMc6YwCRCjL0tBk07f4Tytq4xquHn/ejDy48a4Wxbt7fLch3VWacC+ZwogYEJcokg0BPXo=
X-Received: by 2002:a05:6512:2625:b0:478:5a51:7fe3 with SMTP id
 bt37-20020a056512262500b004785a517fe3mr7697698lfb.158.1654290320714; Fri, 03
 Jun 2022 14:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220530092815.1112406-1-pulehui@huawei.com> <20220530092815.1112406-7-pulehui@huawei.com>
In-Reply-To: <20220530092815.1112406-7-pulehui@huawei.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 3 Jun 2022 14:05:09 -0700
Message-ID: <CAEf4Bza4RT=KFhr9ev29967dyT0eF_+6ZRqK35beUvnA_NbcqQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 6/6] selftests/bpf: Remove the casting about
 jited_ksyms and jited_linfo
To: Pu Lehui <pulehui@huawei.com>
Cc: bpf <bpf@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	Networking <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140525_371386_FBF24516 
X-CRM114-Status: GOOD (  15.84  )
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

On Mon, May 30, 2022 at 1:58 AM Pu Lehui <pulehui@huawei.com> wrote:
>
> We have unified data extension operation of jited_ksyms and jited_linfo
> into zero extension, so there's no need to cast u64 memory address to
> long data type.
>
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>  tools/testing/selftests/bpf/prog_tests/btf.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/btf.c b/tools/testing/selftests/bpf/prog_tests/btf.c
> index e6612f2bd0cf..65bdc4aa0a63 100644
> --- a/tools/testing/selftests/bpf/prog_tests/btf.c
> +++ b/tools/testing/selftests/bpf/prog_tests/btf.c
> @@ -6599,8 +6599,8 @@ static int test_get_linfo(const struct prog_info_raw_test *test,
>         }
>
>         if (CHECK(jited_linfo[0] != jited_ksyms[0],
> -                 "jited_linfo[0]:%lx != jited_ksyms[0]:%lx",
> -                 (long)(jited_linfo[0]), (long)(jited_ksyms[0]))) {
> +                 "jited_linfo[0]:%llx != jited_ksyms[0]:%llx",
> +                 jited_linfo[0], jited_ksyms[0])) {

__u64 is not always printed with %lld, on some platforms it is
actually %ld, so to avoid compiler warnings we just cast them to long
long or unsigned long long (and then %lld or %llu is fine). So please
update this part here and below.

>                 err = -1;
>                 goto done;
>         }
> @@ -6618,16 +6618,16 @@ static int test_get_linfo(const struct prog_info_raw_test *test,
>                 }
>
>                 if (CHECK(jited_linfo[i] <= jited_linfo[i - 1],
> -                         "jited_linfo[%u]:%lx <= jited_linfo[%u]:%lx",
> -                         i, (long)jited_linfo[i],
> -                         i - 1, (long)(jited_linfo[i - 1]))) {
> +                         "jited_linfo[%u]:%llx <= jited_linfo[%u]:%llx",
> +                         i, jited_linfo[i],
> +                         i - 1, jited_linfo[i - 1])) {
>                         err = -1;
>                         goto done;
>                 }
>
>                 if (CHECK(jited_linfo[i] - cur_func_ksyms > cur_func_len,
> -                         "jited_linfo[%u]:%lx - %lx > %u",
> -                         i, (long)jited_linfo[i], (long)cur_func_ksyms,
> +                         "jited_linfo[%u]:%llx - %llx > %u",
> +                         i, jited_linfo[i], cur_func_ksyms,
>                           cur_func_len)) {
>                         err = -1;
>                         goto done;
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
