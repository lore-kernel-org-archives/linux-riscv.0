Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F409E728D6
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 18:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=u3OOuB93P7JXFxCstlxWCMcnLhgSV1U84SnOu7bKOA8=; b=jIahlVet4aqCroOtOYwV+HYxkG
	VpqSl+h6PaSQ32FUVIImtq7+ShAtpk8QJuVK+SdluJlxqOM3dRQsvPrSfjjlDYA2v0sz+rDs3bF8L
	lMC6LA5ZDaqZp2syKHYKrK51B+lDEVGIjBU1qlAS9ipSSjq8S+mX3NwdMLoTZtGT5YZu/wRGDqPwU
	2rTTxkKGi0zIZKbL148YqwXvZsmfege+RuqTjzzVjIzSstvOpYUE92SXpCJPSpQf8Mx6R0swFkLeG
	zfv3daQ50arb72/c2HxknWaI0g2DvNpeIYrG9zOOucI247kbfQBAARjCDU7JLvUFxewmsAxCtldB0
	IfSZhIVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmIaA-008S9K-1J;
	Fri, 29 Sep 2023 18:51:22 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmIa7-008S8t-1y
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 18:51:21 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E06453F680
	for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 18:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1696013476;
	bh=i6pIYXxuKoLZ+wKC1n3MFhboCA1+8vK/nAjASg++5Yw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=XpvAKl9bU9kHinTteRePKWLbtgNg/EzGqi4FYpjFIzrFXbWVpHmXwDaGSzb73NqNW
	 SlL9qC0L52z6WyOJARBokOJl/j5FW5hW9Ud4oDHBf5VUtl7eUqXbx1MmILjzO3KVw0
	 6w0fserG2eJLgXw+bWBRJRz+tN23LHHr88rJ7hUGOK+h2N1MgRVxGZu/jik9+xpYLg
	 2VnsQ4aFTg8+XWnTFOjpulASIZ9+wDPVFlYLTLMqojuqycEPRL+6iIBHo2MeTa8sd7
	 XTCntxgBLN4us5uhcH00bDcnSFzaXpJelnZ9Jw4EjikRp4MURP9lhem67in7J/Ae2t
	 dZgcZP5o0ZyKg==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41961124b15so58534951cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 11:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696013474; x=1696618274;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i6pIYXxuKoLZ+wKC1n3MFhboCA1+8vK/nAjASg++5Yw=;
        b=R7kHiw4gp3VT4c3B8jwTJdVXFioCuDSqmnCu9Pc/hG5+3Y0ilqE0AYxDjjEDQlZ70F
         UK59N9fZ1L+2xI+MmSVBk6JMe/3eRqqX2HLSohHWPzqPPCQFt80Wxvz65hMPa5n+SnOm
         HL66Yand+YVycjFxKgdOUu3kFZpkvvxq5vhyjsi4iE/Bpi93QCYkUAKOTu6KpXuenacJ
         P+Ej6HW76zh3AHLfAFZM4wh1S/Zz9OjYWE2fNXfa91+g8h2VrfMx2/xVG2j3EQ88mkad
         e0uGfJl0QHyXaZ37jN8PT6QwypZMvl8nO1uj7clOBCUfwnvjc8e19PXj33LfzeIQMrfC
         Sv1A==
X-Gm-Message-State: AOJu0YyCgBhx9STRwCc+PwgxgveJPdhLKtqyRiLu2jJDHtHT0qoMhcYm
	vqdgnKCfyK0pRreqvrD+FzgtlEl9FTGV3CV/eY4q9Q4dwS+INhKQIMQ1Qg70g2UDrSEpQoMZUvs
	WvM9ObArFOA5/SDlXhgL5ClWFoj0rW0olJ+S23EYXx+TzbBZBIkuAC6CS1a5LqQ==
X-Received: by 2002:a05:622a:193:b0:417:971e:ab08 with SMTP id s19-20020a05622a019300b00417971eab08mr5281339qtw.57.1696013473885;
        Fri, 29 Sep 2023 11:51:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvKVEyJ5PLAcavdqqhKap9vmb55dkolv53ptgINfcTEGaJceTTjqdkxUQ13eAhgBISBQy+/B6F3dtn9PqEEPk=
X-Received: by 2002:a05:622a:193:b0:417:971e:ab08 with SMTP id
 s19-20020a05622a019300b00417971eab08mr5281325qtw.57.1696013473650; Fri, 29
 Sep 2023 11:51:13 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Sep 2023 11:51:13 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <97b0615e-a541-4856-ba70-be39bdcd8a8f@roeck-us.net>
References: <20230908133923.2675053-1-houtao@huaweicloud.com>
 <20230908133923.2675053-4-houtao@huaweicloud.com> <97b0615e-a541-4856-ba70-be39bdcd8a8f@roeck-us.net>
Mime-Version: 1.0
Date: Fri, 29 Sep 2023 11:51:13 -0700
Message-ID: <CAJM55Z_76dsTxVEfaxif5H7Rdg_AQmjuscNuB2tLbZoVsWdgEQ@mail.gmail.com>
Subject: Re: [PATCH bpf 3/4] bpf: Ensure unit_size is matched with slab cache
 object size
To: Guenter Roeck <linux@roeck-us.net>, Hou Tao <houtao@huaweicloud.com>
Cc: bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Song Liu <song@kernel.org>, Hao Luo <haoluo@google.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Daniel Borkmann <daniel@iogearbox.net>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	houtao1@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_115119_980055_2BFBB6D4 
X-CRM114-Status: GOOD (  13.89  )
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

Guenter Roeck wrote:
> Hi,
>
> On Fri, Sep 08, 2023 at 09:39:22PM +0800, Hou Tao wrote:
> > From: Hou Tao <houtao1@huawei.com>
> >
> > Add extra check in bpf_mem_alloc_init() to ensure the unit_size of
> > bpf_mem_cache is matched with the object_size of underlying slab cache.
> > If these two sizes are unmatched, print a warning once and return
> > -EINVAL in bpf_mem_alloc_init(), so the mismatch can be found early and
> > the potential issue can be prevented.
> >
> > Suggested-by: Alexei Starovoitov <ast@kernel.org>
> > Signed-off-by: Hou Tao <houtao1@huawei.com>
>
> With this patch in place, I see the following backtrace on riscv systems.
>
> [    2.953088] bpf_mem_cache[0]: unexpected object size 128, expect 96
> [    2.953481] WARNING: CPU: 0 PID: 1 at kernel/bpf/memalloc.c:507 bpf_mem_alloc_init+0x326/0x32e
> [    2.953645] Modules linked in:
> [    2.953736] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc2-00244-g27bbf45eae9c #1
> [    2.953790] Hardware name: riscv-virtio,qemu (DT)
> [    2.953855] epc : bpf_mem_alloc_init+0x326/0x32e
> [    2.953891]  ra : bpf_mem_alloc_init+0x326/0x32e
> [    2.953909] epc : ffffffff8016cbd2 ra : ffffffff8016cbd2 sp : ff2000000000bd20
> [    2.953920]  gp : ffffffff81c39298 tp : ff60000002e80040 t0 : 0000000000000000
> [    2.953930]  t1 : ffffffffbbbabbc3 t2 : 635f6d656d5f6670 s0 : ff2000000000bdc0
> [    2.953940]  s1 : ffffffff8121c7da a0 : 0000000000000037 a1 : ffffffff81a93048
> [    2.953949]  a2 : 0000000000000010 a3 : 0000000000000001 a4 : 0000000000000000
> [    2.953959]  a5 : 0000000000000000 a6 : ffffffff81c4fe08 a7 : 0000000000000000
> [    2.953968]  s2 : 000000000000000b s3 : 0000000000000000 s4 : 0000000000000000
> [    2.953977]  s5 : 0000000000000000 s6 : 0000000000000100 s7 : ff5ffffffffd3128
> [    2.953986]  s8 : ffffffff81c3d1f8 s9 : 0000000000000060 s10: 0000000000000000
> [    2.953996]  s11: 0000000000000060 t3 : 0000000065a61b33 t4 : 0000000000000009
> [    2.954005]  t5 : ffffffffde180000 t6 : ff2000000000bb08
> [    2.954014] status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003
> [    2.954047] [<ffffffff8016cbd2>] bpf_mem_alloc_init+0x326/0x32e
> [    2.954087] [<ffffffff80e11426>] bpf_global_ma_init+0x1c/0x30
> [    2.954097] [<ffffffff8000285e>] do_one_initcall+0x5c/0x238
> [    2.954105] [<ffffffff80e011ae>] kernel_init_freeable+0x29a/0x30e
> [    2.954115] [<ffffffff80c0312c>] kernel_init+0x1e/0x112
> [    2.954124] [<ffffffff80003d82>] ret_from_fork+0xa/0x1c
>
> Copying riscv maintainers and mailing list for feedback / comments.

If it makes a difference I also see this with 6.6-rc3 on my Nezha board
(Allwinner D1), but not on my VisionFive 2 (JH7110) running the same kernel.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
