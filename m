Return-Path: <SRS0=vGTX=24=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E7DC33C99
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2020 10:24:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1640B208C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2020 10:24:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iPERgGuL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W97EYdAz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1640B208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/FJ6ST8pkDrcHZpucYQ0+Lv1MfR+E42jWdOkBgx1mI=; b=iPERgGuLyqWkRM
	31W/4FJ2aauxltOH5Om9w0A5kRBQZiiBgVgD+mskHAOH29z8osLLdcUqX+7cuVmISfECU5R1Q5z8K
	ilk/kmRUO0q82Ue6g1Bjos2mvkNC5mYbRb/Df6kMK5oAE8sI0hbVjkDkb0HobMDk4B3WZxjoINW28
	BUbJbncis5xcck+/Wv6Wqo6sNwKUvJ54njgKII56knP5r0gI42sHE1xYi0Q6ytMIMwrAU2SJqperJ
	3q7gjpJPB0VLwUrylhICpcWRZ3ZY26X3f1FwTKLEV+JKomKp5blsA/6fa3S5Xo3GC/3meUGhx31lY
	YICEKfKzeuKQWes3noSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iom2E-0006xZ-Pa; Tue, 07 Jan 2020 10:24:26 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iom2B-0006wg-UZ
 for linux-riscv@lists.infradead.org; Tue, 07 Jan 2020 10:24:25 +0000
Received: by mail-qk1-x744.google.com with SMTP id k6so42176310qki.5
 for <linux-riscv@lists.infradead.org>; Tue, 07 Jan 2020 02:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x/FJ6ST8pkDrcHZpucYQ0+Lv1MfR+E42jWdOkBgx1mI=;
 b=W97EYdAzT4wGqtQz+nEZlGtjbw82WKRpKzkSTWeomNngXkJlZ0LrcHRfyaGeiAZIHW
 rvQqZTlXYdzvxPdu9Q5+NrnulPy3kmaBbC2uFh/j3Cuxd4oRLMi7YY9C//4Xu749Q/ct
 x/Xe/qmgLkLWCE7G1Ub2gZwh4dA+h322tFNABvjbiALnpDJDu57PlQOQpLAOAyoWMLwC
 zsBxwvVmOUyr8JG8J6EbtEPZohnwSzLANzd9BzI57ROgoUv1E4mb+A3z01ciSUyYAYcM
 jSlBqOX4KE0Z9aHSGTMSW0EqfgAWxH5rdd8+7HUdJ9nSQ7naiX8Bw7GkPQjqHdu6f5co
 rriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x/FJ6ST8pkDrcHZpucYQ0+Lv1MfR+E42jWdOkBgx1mI=;
 b=kMtZz0AQ5Haa0C668t6ptB6zKFNkHtcVY4drZ2ZntRb0p+lC95BDfiYlUZFbG47eTC
 MtIOHrnMLwelv/KLIIpy//xLo6IFboy3HQbIVltJzwoy0YVpHn+cEGFjCEkza8w+uraX
 Uw3q984DF7PDeqrGn89JG3jtuKxjAnFo9UTGFatK2JdgW+dwLdAdoAM6hsNP3Zl+sbyD
 5HdJqEOgMYzA+pOOo+9FK4G5YXPZk5Sh/v9wJZM8emyZTxxdT2Tu3tdW5oRUn7NyYXct
 5PxaA9tszjBmcs7Ka5APHHw38Q/WzNt/gz2h5egvu638s9JsobWl5tB86iAt3MuUJ2OU
 pYJg==
X-Gm-Message-State: APjAAAVRo//hWhv8aawlQ4oJAV5A0mxcjyYHoM/eZ19fBMp+c0D65Qv+
 STHPTJJewiqImpK0hK7ril+PAusCc8QHEl70Ryw=
X-Google-Smtp-Source: APXvYqzDx+S0/3olC7XANuGvHUw4RJp7j1GA9/yRyv+B3EeVXv6gW65lJFGfrkkk5uU/pbXjmLKIBfxaiWk1FtUzW/E=
X-Received: by 2002:a05:620a:14a4:: with SMTP id
 x4mr86439378qkj.493.1578392662584; 
 Tue, 07 Jan 2020 02:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20191216091343.23260-1-bjorn.topel@gmail.com>
 <20191216091343.23260-7-bjorn.topel@gmail.com>
 <7ceab77a-92e7-6415-3045-3e16876d4ef8@iogearbox.net>
 <CAJ+HfNgmcjLniyG0oj7OE60=NASfskVzP_bgX_JXp+SLczmyOQ@mail.gmail.com>
 <alpine.DEB.2.21.9999.2001031730370.283180@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.2001031730370.283180@viisi.sifive.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Tue, 7 Jan 2020 11:24:11 +0100
Message-ID: <CAJ+HfNgrekRMM_XS1eK_Cn77BNEgs2gxEsTEvxDpKH9M4R7TJQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 6/9] riscv, bpf: provide RISC-V specific JIT
 image alloc/free
To: Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_022424_013959_6B8003D8 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Daniel Borkmann <daniel@iogearbox.net>,
 Netdev <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 bpf <bpf@vger.kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Paul,

Back from the holidays. Sorry about the delay!

On Sat, 4 Jan 2020 at 02:32, Paul Walmsley <paul.walmsley@sifive.com> wrote=
:
>
[...]
>
> Looks like Palmer's already reviewed it.  One additional request: could
> you update the VM layout debugging messages in arch/riscv/mm/init.c to
> include this new area?
>

Sure, I'll send that as a follow-up! Related; Other archs, e.g. arm64,
has moved away from dumping the VM layout (commit 071929dbdd86
("arm64: Stop printing the virtual memory layout")), and instead rely
on _PTDUMP. Going forward that probably applies to riscv as well!


Cheers,
Bj=C3=B6rn

