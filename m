Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E61C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 05:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CYM9iFWVbTUKSiHb+3HBW2kkN0SbMyZnVk6FmzT9KI=; b=Lu7o1Tqt8w8r4I
	x/MG2aUylF0UpPCErZmZZjbveThldFrQwkquOU8XvirBnFiXoiR7ioTBf3WubUc62fgGa2ZzCUUEF
	SvdB7TUh0A/SNpU+XCEM16mIU5+DzXi7MufYZkXNeKBoD9z7/NE43HBsn0uj/Z0bmQeEj3Vg54ICd
	UX7DXn015iSUsNXBSaJ/VDcToyIWwbKj+lMHazO7rQz7udgs5q0ZKYYgeJW0ploCCMichCL76Jz3Z
	dkm+xQawjp8BRYga5RM/55OUuBkc2lwN2LNDKKg4dP9G/+XVb/OvBiGeK7EFrI+8ck90r58vYAcO3
	/dJn99auB8YclS/44mGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8x9x-005zOb-Sa; Wed, 06 Jul 2022 05:01:09 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8x9t-005zBC-Uw
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 05:01:08 +0000
Received: by mail-ej1-x629.google.com with SMTP id u12so24996605eja.8
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 22:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vawKJQXmsefWF4gLD71WEblECZZ9kLxHvZ5C6nvYmiI=;
        b=ckZuNTHyUmXtAw+lhiU29cOyNgXqttUGQcxP5edTEyjMqf4XGnyfIeLyhoZnEOLZN/
         nVd+U6OruliAuhAZe6R/u1mJzVgVIxYqrISwA/D3rNjpshP+4G2aQkdV7Lo13NpzSfXk
         Yl3WqOsmWUbkDok2a4WHD6OKStvrPAxeXS5R6jRysniwOh3AiLpbDAVPvBKFY5MaZHTp
         chSeZRUwAmrxLlU+bjOzHL+QX6y+0nbDDJh4ZXXG5fB6IL2V8A5wlAQd+Mkz/Uf5K7lz
         1vEL/gTcR9dO+BbQ+JYt4F/Yop8Ur763Q7YkhmJd51FJpoGG1zcNJdiXtZLfzwaoitmk
         5YPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vawKJQXmsefWF4gLD71WEblECZZ9kLxHvZ5C6nvYmiI=;
        b=zMP9ERkYkn9tt/xC6xxZ44bgKWwCTs+gXIM1i6Ef1xgSpAlutUvgzaY9ZXVSpYCOQF
         ahfn8QLNbR1isB/VtvKHC3lisGvKZSKyYK+JG0ku9e4wb6PNM7GwoQjHFsY/TndUGypj
         Z9rVmX6/+DJ16x/nqtVPTw6GRU45/qBzigufE7fsSll9ZHJyGS9gap8l9yToBOu9GnuA
         dbIG10PxyNFpScq9DaMIrsgWeAYC+TSN/sVsFvtU9X9rX2cKg3OMyiuCD405EcLgd4Uk
         tnKRm3MJtBeOq3rDN3d6E19HvUTb1JbutHiF+/9lOMb/bj9e01/+qAkJVzTYt0s6qaXX
         Py2Q==
X-Gm-Message-State: AJIora8W9DPcMpjVDyYc51TBRaIWTc7Esq0WkNZbjY0dMWAE3ircbPCn
	ui8Nx8zmqew+tiIjGJRuFAy8DAoQ+p3ZTF57Nj0=
X-Google-Smtp-Source: AGRyM1tnC7xEukUs2A0VoewEY2CoIfV7aCqGo0G38aLeVq+D6tBDe5KKFSQhFuBWTDBmF+DkqCrq7G46Mnc6e/XGRPo=
X-Received: by 2002:a17:906:6a11:b0:726:97b8:51e9 with SMTP id
 qw17-20020a1709066a1100b0072697b851e9mr38260616ejc.115.1657083653634; Tue, 05
 Jul 2022 22:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220703130924.57240-1-dlan@gentoo.org> <YsKAZUJRo5cjtZ3n@infradead.org>
In-Reply-To: <YsKAZUJRo5cjtZ3n@infradead.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 5 Jul 2022 22:00:42 -0700
Message-ID: <CAEf4BzbCswMd6KU7f9SEU6xHBBPu_rTL5f+KE0OkYj63e-h-bA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V/bpf: Enable bpf_probe_read{, str}()
To: Christoph Hellwig <hch@infradead.org>, Alan Maguire <alan.maguire@oracle.com>
Cc: Yixun Lan <dlan@gentoo.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_220106_071620_6FF0846D 
X-CRM114-Status: GOOD (  12.46  )
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

On Sun, Jul 3, 2022 at 10:53 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sun, Jul 03, 2022 at 09:09:24PM +0800, Yixun Lan wrote:
> > Enable this option to fix a bcc error in RISC-V platform
> >
> > And, the error shows as follows:
>
> These should not be enabled on new platforms.  Use the proper helpers
> to probe kernel vs user pointers instead.

riscv existed as of [0], so I'd argue it is a proper bug fix, as
corresponding select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE should
have been added back then.

But I also agree that BCC tools should be updated to use proper
bpf_probe_read_{kernel,user}[_str()] helpers, please contribute such
fixes to BCC tools and BCC itself as well. Cc'ed Alan as his ksnoop in
libbpf-tools seems to be using bpf_probe_read() as well and needs to
be fixed.

  [0] 0ebeea8ca8a4 ("bpf: Restrict bpf_probe_read{, str}() only to
archs where they work")

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
