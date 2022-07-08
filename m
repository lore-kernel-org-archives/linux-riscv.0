Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B17C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 22:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/he2SqgZ1iNnvFaKNJ0Q3mrYFDX3bx+IZJDOfXIv708=; b=eWIiD6wSCOd+X7
	J3bdtc/5cRVs5OVfNFdEi8imBOrZTKBrq/Q621IW6+J32Ecl/qQr5PLHWughz4ZJkf6io+Og+0S08
	DSwWlbctd/P0UaMZj824EVs9+F5VkuNVpiqph4nN9KlplmWyPHNn6HIlKxbrjnms9ldS/9xobBN2c
	oN2YxdyioQOwUsACEqAkjY4eClbyn+82WWAikg7eiwXzqdy+jPrkccQvCPgZk60d3Sma7m8sF0j6q
	/MY0PeMHuVkBlKQOyHaMwqG96ZIJcK5S0CJ+L6QCg4GSVifxyJxtMf/cCUI7apHvXZxMsqniNQHLi
	ESsy+FtMq0tydkEBtazQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9wVF-006CyM-20; Fri, 08 Jul 2022 22:31:13 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9wVC-006Cwx-6f
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 22:31:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id ez10so9750331ejc.13
        for <linux-riscv@lists.infradead.org>; Fri, 08 Jul 2022 15:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vtYNlUjFPBorTja/ZZdAiqkuVJixHxyN2XSNBOycbUI=;
        b=DM5Hj2oOBlL+l9CByJUKOaJ1vh4HJDKbEohe9/mUhrJgEyABIdmO+clfDNX8z4r0VE
         nO3YJTw4Dj43d+Ay0VD9VuWxZn3DTEQTUbM/kbJ4S7meIbQXRsDrq4PSBKwlvTLCj8f9
         tD8hIcQzA2JxTza2YBdsVregDQcn+tgrrmRuWeGW3NN7zkdUaRumuuPDsb2LiQ4IEpL2
         yOB9FFMy/0wpprM4LnpZ15p3wwuLPUGpmHLxXl+xf4tVLMXyDpm0lFf8gM4V5edxrtIH
         dT5HHV32Z9hMD4BpMZAoV+EXhfLeV/u5UTsBdsa2+Mhyg4FmR8s2R/IH4LJzCBGxetst
         aOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vtYNlUjFPBorTja/ZZdAiqkuVJixHxyN2XSNBOycbUI=;
        b=1LSdgiLTsozJVs/pIZD3YsiBYHSU4UxdLJEoEZm0oWSq2H3KaZi8PoA1eQm5n4HkM8
         XDy+bnrTmSTfsk8rti2B+i64y0t3X5qYYGKb4nJMNlcJe97KhOeT87toBR5KM+t/R2zi
         LOKvt+fXiqeigDuUaTK0T4TqgNq0nrnRlthVm9yX5NpaJCd16RCfSr7yJp3GWCkPKYkj
         i94bWrUK8jB5huDmhW76/D+GOXSNwkkrFMlKBnDRUANz1DOyZxHaAwZduENsHpYjPCPf
         Gm3PEQc9aoXxwkGFsd8sf8mLjmE9nBpbksFMs61xArtg7Gf7lOaOoL4B+7v3of/MXe43
         q/xA==
X-Gm-Message-State: AJIora+F3vIqcCjerP7mLKepjwLbfoWEXIG1GWu50+eaJS//q6a+NDMC
	NiRFpdt9pL0LLxZXTVLDfEuxNTsr+2pMbHjOATY=
X-Google-Smtp-Source: AGRyM1vFnuzeNUeQJq3npYMM5/i0JV31krsyjIvnTW8wNxdmDm4x2jiY80Prv2hmg2FGbtZg7UXyubeeDzGWGUamxDg=
X-Received: by 2002:a17:906:a3ca:b0:726:2bd2:87bc with SMTP id
 ca10-20020a170906a3ca00b007262bd287bcmr5799290ejb.226.1657319464980; Fri, 08
 Jul 2022 15:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220530092815.1112406-1-pulehui@huawei.com> <20220530092815.1112406-5-pulehui@huawei.com>
 <a31efed5-a436-49c9-4126-902303df9766@iogearbox.net> <CAEf4BzacrRNDDYFR_4GH40+wxff=hCiyxymig6N+NVrM537AAA@mail.gmail.com>
 <38a59b80-f64a-0913-73e4-29e4ee4149c5@huawei.com>
In-Reply-To: <38a59b80-f64a-0913-73e4-29e4ee4149c5@huawei.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 8 Jul 2022 15:30:53 -0700
Message-ID: <CAEf4BzaDQ+cPh8pLGqg-GSM+ryZz3vvDtUy=o2u19KM0CTrewg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 4/6] libbpf: Unify memory address casting
 operation style
To: Pu Lehui <pulehui@huawei.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, bpf <bpf@vger.kernel.org>, 
	linux-riscv@lists.infradead.org, Networking <netdev@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_153110_267040_D845226F 
X-CRM114-Status: GOOD (  24.68  )
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

On Thu, Jul 7, 2022 at 5:23 AM Pu Lehui <pulehui@huawei.com> wrote:
>
>
>
> On 2022/6/4 5:03, Andrii Nakryiko wrote:
> > On Mon, May 30, 2022 at 2:03 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
> >>
> >> On 5/30/22 11:28 AM, Pu Lehui wrote:
> >>> The members of bpf_prog_info, which are line_info, jited_line_info,
> >>> jited_ksyms and jited_func_lens, store u64 address pointed to the
> >>> corresponding memory regions. Memory addresses are conceptually
> >>> unsigned, (unsigned long) casting makes more sense, so let's make
> >>> a change for conceptual uniformity.
> >>>
> >>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> >>> ---
> >>>    tools/lib/bpf/bpf_prog_linfo.c | 9 +++++----
> >>>    1 file changed, 5 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/tools/lib/bpf/bpf_prog_linfo.c b/tools/lib/bpf/bpf_prog_linfo.c
> >>> index 5c503096ef43..7beb060d0671 100644
> >>> --- a/tools/lib/bpf/bpf_prog_linfo.c
> >>> +++ b/tools/lib/bpf/bpf_prog_linfo.c
> >>> @@ -127,7 +127,8 @@ struct bpf_prog_linfo *bpf_prog_linfo__new(const struct bpf_prog_info *info)
> >>>        prog_linfo->raw_linfo = malloc(data_sz);
> >>>        if (!prog_linfo->raw_linfo)
> >>>                goto err_free;
> >>> -     memcpy(prog_linfo->raw_linfo, (void *)(long)info->line_info, data_sz);
> >>> +     memcpy(prog_linfo->raw_linfo, (void *)(unsigned long)info->line_info,
> >>> +            data_sz);
> >>
> >> Took in patch 1-3, lgtm, thanks! My question around the cleanups in patch 4-6 ...
> >> there are various other such cases e.g. in libbpf, perhaps makes sense to clean all
> >> of them up at once and not just the 4 locations in here.
> >
> > if (void *)(long) pattern is wrong, then I guess the best replacement
> > should be (void *)(uintptr_t) ?
> >
>
> I also think that (void *)(uintptr_t) would be the best replacement. I
> applied the changes to kernel/bpf and samples/bpf, and it worked fine.
> But in selftests/bpf, the following similar error occur at compile time:
>
> progs/test_cls_redirect.c:504:11: error: cast to 'uint8_t *' (aka
> 'unsigned char *') from smaller integer type 'uintptr_t' (aka 'unsigned
> int') [-Werror,-Wint-to-pointer-cast]
>         .head = (uint8_t *)(uintptr_t)skb->data,

this is BPF-side code so using system's uintptr_t definition won't
work correctly here. Just do (unsigned long) instead?

>
> I take clang to compile with the front and back end separation, like
> samples/bpf, and it works. It seems that the all-in-one clang has
> problems handling the uintptr_t.
>
> >>
> >> Thanks,
> >> Daniel
> > .
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
