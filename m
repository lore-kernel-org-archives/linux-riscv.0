Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F262C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 20:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JRWYLcC0PkWg1tl2h2xAwOQA9Ql0dvWxNDNn8TNPsgs=; b=sntbnx72ZQl8g7bRn45XyCe0Aa
	RuVJXZaMWmBSTElW849S4Pmqu1taEdryFswH2viiLjm0IIldb93m37lnqhe1SvDewk3xQiLpR3wE+
	+KNDMfEdF+5l1MiDKHPZRtKamcTDaHZlUylDbTXQA95Pb/Lb+Nk4KxYCgGhle/5UXDzd+qA7w4OzU
	8dkfuOgnSCC1rbrZC1jGy3ZJl8EEzr9qITDcuocT+wBBCzk1gNA+nVxIgxriWpusmEdwTNK0CPkGv
	kFmF/tMaAeAMPQT29NH01LxTJnLw+Rp00XsdWmTOgN9G5UFnDpAE4xH+i4vmjU+ni54UqKrSeooA4
	+8CURwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn4wF-0051cL-FN; Fri, 06 May 2022 20:52:35 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn4wC-0051at-Ij
 for linux-riscv@lists.infradead.org; Fri, 06 May 2022 20:52:33 +0000
Received: by mail-il1-x130.google.com with SMTP id i22so5552090ila.1
 for <linux-riscv@lists.infradead.org>; Fri, 06 May 2022 13:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding;
 bh=9xPGIlmt+FCGNXEvj1MOSv96z0C4C+W3xdxDnwzXgQk=;
 b=qd/RTGT4cvHjjNKKdU66WSlVV7H62ZBoSTXe8fsJd8Naqd+UjqYP0eyksu6UbAR3dH
 4vEoAmScldQv4EEts+780Eo/jhcy2WjAa9ZXIEH7TS3KkHAok4ss21kluk5AfPNeIfOH
 Wnl36b8JUOpGTSM9EAlL2ok3mH2DdVdJZhg3Y0odCDE4nSSKY/MuA++j19lDo4eFJkwO
 wYgXqJcpjONjJ0F4ASLDab7Yxb1k/O0pKZ0NtSHKYbAtXvtd2fho+S8SQn5zXtQEH5fR
 SUJmA64PQzelMWmflFPKn2pQ3G5C1w4g9eSXhvbBC9HVD4n/qmO1rhTyXUnJgRyIbURg
 XU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding;
 bh=9xPGIlmt+FCGNXEvj1MOSv96z0C4C+W3xdxDnwzXgQk=;
 b=NudoLlLot4Jzq2y/DQqmsJRmQOMCDtwzqhDPCFUX0qL9qu549+JjW12Il6e3pYNWXa
 T4kVQfSIhUHazcZoriuHv8fzqKxJ7OcyOElMq+Wjj3B+OQIQtnAVB8gUHcwM4Vd+/dpY
 rQ1g1zO3VTty2gJOwoNsRTSGkb1xvJu79iM7f1F57AevsIwM/I0HP1au965FGZp0hn8G
 1Wuyw1jhBSTSFJY8qbzVBKoYHMqJ3h2HXA2WkRhbjo24SNrhKoImMfv2TP1cU6Fq5uC6
 WH0C+0wuwM5FvTfY8o4i3NmQmygE0wLnoL476yXDCfWwHoyD58AO0iviTPAnLX/yi3Ev
 pGBQ==
X-Gm-Message-State: AOAM532ycLdTouA0yJrwN5zek+oXH6RpO4/nwL7jEel/CrXf2+hbA6Lp
 uvYaD75V6j6Ld9ddEiMzl0I=
X-Google-Smtp-Source: ABdhPJxUDZbbJgYJBeV6AACgxuY7K30lobb69PEkOZ6zGK4shihN0gM71h+yUJD5dNpVB+Fzgbk40w==
X-Received: by 2002:a05:6e02:20e1:b0:2cf:63de:22f7 with SMTP id
 q1-20020a056e0220e100b002cf63de22f7mr1927645ilv.24.1651870349197; 
 Fri, 06 May 2022 13:52:29 -0700 (PDT)
Received: from localhost ([172.243.153.43]) by smtp.gmail.com with ESMTPSA id
 z15-20020a6b5c0f000000b0065a47e16f53sm1580551ioh.37.2022.05.06.13.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 13:52:28 -0700 (PDT)
Date: Fri, 06 May 2022 13:52:19 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: Pu Lehui <pulehui@huawei.com>, bpf@vger.kernel.org, 
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pu Lehui <pulehui@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Message-ID: <62758a83b512a_18fd5208b5@john.notmuch>
In-Reply-To: <20220429014240.3434866-2-pulehui@huawei.com>
References: <20220429014240.3434866-1-pulehui@huawei.com>
 <20220429014240.3434866-2-pulehui@huawei.com>
Subject: RE: [PATCH bpf-next v2 1/2] bpf: Unify data extension operation of
 jited_ksyms and jited_linfo
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_135232_664975_80A6E9D8 
X-CRM114-Status: GOOD (  19.69  )
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

Pu Lehui wrote:
> We found that 32-bit environment can not print bpf line info due
> to data inconsistency between jited_ksyms[0] and jited_linfo[0].
> 
> For example:
> jited_kyms[0] = 0xb800067c, jited_linfo[0] = 0xffffffffb800067c
> 
> We know that both of them store bpf func address, but due to the
> different data extension operations when extended to u64, they may
> not be the same. We need to unify the data extension operations of
> them.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>  kernel/bpf/syscall.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index e9e3e49c0eb7..18137ea5190d 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -3871,13 +3871,16 @@ static int bpf_prog_get_info_by_fd(struct file *file,
>  		info.nr_jited_line_info = 0;
>  	if (info.nr_jited_line_info && ulen) {
>  		if (bpf_dump_raw_ok(file->f_cred)) {
> +			unsigned long jited_linfo_addr;
>  			__u64 __user *user_linfo;
>  			u32 i;
>  
>  			user_linfo = u64_to_user_ptr(info.jited_line_info);
>  			ulen = min_t(u32, info.nr_jited_line_info, ulen);
>  			for (i = 0; i < ulen; i++) {
> -				if (put_user((__u64)(long)prog->aux->jited_linfo[i],
> +				jited_linfo_addr = (unsigned long)
> +					prog->aux->jited_linfo[i];
> +				if (put_user((__u64) jited_linfo_addr,
>  					     &user_linfo[i]))

the logic is fine but i'm going to nitpick a bit this 4 lines is ugly
just make it slightly longer than 80chars or use a shoarter name? For
example,

			for (i = 0; i < ulen; i++) {
				unsigned long l;

				l = (unsigned long) prog->aux->jited_linfo[i];
				if (put_user((__u64) l, &user_linfo[i]))

is much nicer -- no reason to smash single assignment across multiple
lines. My $.02.

Thanks,
John

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
