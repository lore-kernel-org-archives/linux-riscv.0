Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081FAC636C9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 01:49:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0FD4613D0
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 01:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0FD4613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gtasx15fPZSTBDRRHy2Q6mDyJdg1Z3e1omZXCJfsFNg=; b=RrRuUU5s/FpsrM
	GNkpo69/xgnYRxn0pMKMNQauNF845UkvMKzpjvi0eBdKZYnpSSruhOezuyM1rcFhoLPUG0zrcgngc
	3bGbpIs1mNi86OVrIgGDEUzftGgh0fMA7wU7DgEQ1OL2nAQyMESKLAA98tNXWjBGeLGwXdDyB7Wf1
	HeihjJBt7XQZ1xjRDkbjvzQ7aU97T+E7UwmAdaEo4aRdbea9+MxCDoLWz0EMNDTASDpijc62d+ck1
	1l1fWiCxnQl0HbG/gssG3EgegxqtUy7MBKQZAHIXoVG0myIlNqiEm6jV+ulfsqsoW2yZeQlYNaLgP
	HAQAg9b4pEr+7aaP1XnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4CyY-002rMK-Qd; Fri, 16 Jul 2021 01:49:14 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4CyV-002rLa-6e
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 01:49:12 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 141so11852417ljj.2
 for <linux-riscv@lists.infradead.org>; Thu, 15 Jul 2021 18:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ooSnDnaRR1y2Zt84zTUnLEoZAoDuRHyWJmkvYjQARyY=;
 b=IjXqonnTm4PDZn+/7269i0JJN00zVfCYtT+x/4bKk5lHWl6H5aMSAElprq580/8juE
 1xAU6nQEqlEJ4zLpw30X+OIdNxFDMU/QssAqZS17eJVhNhUChK+M5eqjkFhiuEx56Qit
 8WuWx6fCJkCEYULYt0U3ZeSvaIVn3r/6PBinfskma7puk1fJiUqoxDPsYk1PDNAXjqAy
 OXSLWnRJ9+8fzTJ1f+bIlfG+rZuHpwAi46638Tq+lOTFjaAyu0e6cuS/A/BwFiUMFDT+
 gfK81TdTELwrCZuNwvh6UruV2CK0dI0zkp2qQ1pm5ZAf9hTC8JAbj6sxLAMt4CLDAyKv
 od9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ooSnDnaRR1y2Zt84zTUnLEoZAoDuRHyWJmkvYjQARyY=;
 b=ETtp5AleriugtvTTB1+/ewAtf2508V1GbuaqAhZ5tazioM5/tSdldWwOVlrHCqywQJ
 FupRbgBBS846G1FE5Ugqc8F7SKF4SJ57jcEdgLsJ/8g0YsdJ3/7byagZeBXVtLOGPj+C
 U7Wjp3Pl6ozGwAUSwiEZwtcYGIttjmGGfDFdBNATp74l4esWnBKLsa+rTlzB0cgZ9gz7
 jjzhn9QuWqpIxyBPsJVFucblCWOuXHppi7+sf9FufEE8kYum79+wV553dCOeRSIu7NOY
 zfbkkizHkamRbWIUnt0W4TvP80Zz1JMHkXkdMJUJaGcrd36Mmqw4lZLSckKSBb7V5aAL
 Kp1g==
X-Gm-Message-State: AOAM5328Ye4StTMGdlqq629Q/1/U1woO9qziN4/bttN+LvGiQQL9l5CZ
 3FuiHYJgN/KZtldP5423/Q6PlMCn2hu/TSS16/s=
X-Google-Smtp-Source: ABdhPJxi3dW8s9VnSn6wSkvqXocXr6SGUM/bv49mLVpSdhOBoP9wU1TO0PiTIvxstkaRLHqVWXlHEwgRD2k/i8mNXVw=
X-Received: by 2002:a2e:a887:: with SMTP id m7mr2877598ljq.236.1626400148732; 
 Thu, 15 Jul 2021 18:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <royujjal@gmail.com> <20210712173723.1597-1-royujjal@gmail.com>
 <60ee2dc76ac1c_196e22088d@john-XPS-13-9370.notmuch>
In-Reply-To: <60ee2dc76ac1c_196e22088d@john-XPS-13-9370.notmuch>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 15 Jul 2021 18:48:57 -0700
Message-ID: <CAADnVQJ=DoRDcVkaXmY3EmNdLoO7gq1mkJOn5G=00wKH8qUtZQ@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-nxt] Documentation/bpf: Add heading and example for
 extensions in filter.rst
To: John Fastabend <john.fastabend@gmail.com>
Cc: "Roy, UjjaL" <royujjal@gmail.com>, Song Liu <song@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Networking <netdev@vger.kernel.org>,
 BPF <bpf@vger.kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_184911_302303_C16DF3E5 
X-CRM114-Status: GOOD (  12.35  )
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

On Tue, Jul 13, 2021 at 5:20 PM John Fastabend <john.fastabend@gmail.com> wrote:
>
> Roy, UjjaL wrote:
> > [1] https://www.kernel.org/doc/html/latest/bpf/
> >
> > Add new heading for extensions to make it more readable. Also, add one
> > more example of filtering interface index for better understanding.
> >
> > Signed-off-by: Roy, UjjaL <royujjal@gmail.com>
> > Acked-by: Song Liu <songliubraving@fb.com>
>
> Looks OK to me. I thought the original was readable without the header, but
> if it helps someone seems easy enough to do.
>
> Acked-by: John Fastabend <john.fastabend@gmail.com>

I cannot figure out how to apply this patch, because I see:
Applying: Documentation/bpf: Add heading and example for extensions in
filter.rst
fatal: empty ident name (for <>) not allowed

Any idea?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
