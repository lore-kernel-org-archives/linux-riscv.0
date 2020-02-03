Return-Path: <SRS0=tMB7=3X=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3E1C33CAC
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2020 12:28:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5B0F2084E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2020 12:28:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rz2D5YGD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jB9d7cw/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5B0F2084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bps9/ugZnw/LOkhCjhjvZvxvS5kO2i7OXxXUPo/WJGE=; b=rz2D5YGDpKLVIE
	BOmuQ0F3mu2e3ZvKQO+tcxpIwFnkYo/MLzOY7vf6Q3gjEIKRStSq1PU9ErzWB9QvAdVplOdJBTjBj
	mG4yCMXQD3YKAfKxxxoDOfvQ8Ubx3iUrgmAZUgAVbSyvZUVvKX6trBPHogupK/HNPVZlkbSJeco0h
	bjumlLiXI/qvabXgQ7EJsLQYJG0Vy1ffxE6X2HcBf9803YhVJ5ncnZMYAE8uVJJKk76r81VQACzB7
	LdM+QjX7TU3sRjTrurQVkjhrQhW/DvUWj6yEUbJWiwIMhx34GXMUT8UNbn6RPJVNxUtDLKOA+ZLAW
	DzVyYzrpNRE3V+feDtdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyaqR-000787-Kt; Mon, 03 Feb 2020 12:28:51 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyaqO-00077f-CQ
 for linux-riscv@lists.infradead.org; Mon, 03 Feb 2020 12:28:49 +0000
Received: by mail-qk1-x743.google.com with SMTP id q15so13996672qki.2
 for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2020 04:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Bps9/ugZnw/LOkhCjhjvZvxvS5kO2i7OXxXUPo/WJGE=;
 b=jB9d7cw/PfiS8u8EbQs9pbNd5O2Hc7F0Au7RXWC+0X/zEoq8P5dW767fu/Sc/f/7Pg
 TiU8XRBuDYjCVjTZGWK5Swxp/mLNZj2/oaHXilAq2XR6lBRIOODl6O0rcsNhf0SQY8MI
 nz87gFswjm/HuWRFTDlNU5evHzM+3I19xI3EbPRaKCfgS3Jb3aYy00Hr8dLky8ttfHFg
 GXw5vY//jJdNKGf8EtGktjAegQM0PdkYkZgzkzTsVREXTq4NZzAGbrYvwjfmYWCmprYz
 I5pRwgT9sXGL9EBlBB4SXjWEM+Oenc+f/rLbVLh249ZtgwVBLieSDQ56YGIGAZ8OErYW
 bjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bps9/ugZnw/LOkhCjhjvZvxvS5kO2i7OXxXUPo/WJGE=;
 b=FVfvtwbDdvRAOo2LMw0o+tfzGrZUHjE6v19sMHoxxCExgXEFbjbbJWxpt01kMlTAre
 s9UZUi+yjFBuh6fymAk20C/6YPRBlBXpx9blvvH6BPcOL89zC78oQfYmjjVQXZHwGTIU
 0G4xZWzVakn9SC7tB1qGLI/34K/rInEcRJuSFGo5Yv4oGM/eQiLb5Y4c+s8gssSQNQFH
 CWwfqKwbzJMwHA067ilH4HoRaHcqSRK0VixBTPhRK2GYiCyI5WZ1lO7gmjvghW61XpWe
 HPE1HttMhsc3ERWTYCsA6wISk6n8PY1pwd/ZrDISQJRSx98cYRzzG/AJp3T01th0TvLy
 VmoA==
X-Gm-Message-State: APjAAAWJ9Lekxwgm7SsQFNLr5x8/m9zSTsrxWSu9/oe7CgKOtpWzO1vH
 niKMb34IVNXZ1TgoiiPvqfq6ceCn6XJ4BI/znBo=
X-Google-Smtp-Source: APXvYqzFTVokDAvj4jM1EbkUWGFzCx3Rgz95Htz+3sKmmtcmARXUP7r9f9Tq9n+1DpqFFfKtylDEQ3g+9C6ZwMhwMic=
X-Received: by 2002:a37:8046:: with SMTP id b67mr23085188qkd.218.1580732927145; 
 Mon, 03 Feb 2020 04:28:47 -0800 (PST)
MIME-Version: 1.0
References: <20191216091343.23260-1-bjorn.topel@gmail.com>
 <20191216091343.23260-7-bjorn.topel@gmail.com>
 <3f6d3495-efdf-e663-2a84-303fde947a1d@ghiti.fr>
In-Reply-To: <3f6d3495-efdf-e663-2a84-303fde947a1d@ghiti.fr>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Mon, 3 Feb 2020 13:28:35 +0100
Message-ID: <CAJ+HfNgOrx1D-tSxXsoZsMxZtHX-Ksdeg8bZFFPRPGChup4oFg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 6/9] riscv, bpf: provide RISC-V specific JIT
 image alloc/free
To: Alex Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_042848_422481_6065EB15 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, Netdev <netdev@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, vincent.chen@sifive.com,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 bpf <bpf@vger.kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 2 Feb 2020 at 14:37, Alex Ghiti <alex@ghiti.fr> wrote:
>
[...]
>
> I think it would be better to completely avoid this patch and the
> definition of this
> new zone by using the generic implementation if we had the patch
> discussed here
> regarding modules memory allocation (that in any case we need to fix
> modules loading):
>
> https://lore.kernel.org/linux-riscv/d868acf5-7242-93dc-0051-f97e64dc4387@=
ghiti.fr/T/#m2be30cb71dc9aa834a50d346961acee26158a238
>

This patch is already upstream. I agree that when the module
allocation fix is upstream, the BPF image allocation can be folded
into the module allocation. IOW, I wont send any page table dumper
patch for BPF memory.

But keep in mind that the RV BPF JIT relies on having the kernel text
within the 32b range (as does modules)


Cheers,
Bj=C3=B6rn

