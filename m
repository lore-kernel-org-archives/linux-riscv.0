Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D777C433E5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 10:01:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6730221D7A
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 10:01:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xtMWsyeb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuNNLCWL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6730221D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jgILgxvL0ki5YCLY2QHQD2elei0rqm7Y4MFp7nRR6G8=; b=xtMWsyeboC5viUBJ45ZJ7H6Th
	JC+fhduTvxL4xGHDg81nvqUye5JdC2oTwuEXpKlf1Kw0PQwAL+JiMQ1QO9fTcMDWi67JeFrhhb0ry
	/NE2eL9X6G1UK4Tx9FEFDKuR6QNcc6iaLkmMUv0Ij51YoV1Qjyeq8sHiCv2hIWV2A7zGTRJ/g3NHS
	zMNJFvYS2+OfvfDM49M3zFNOJ7IZTiDVxMbk08mjAZLAZw9FPX4Q4N9S4X9qv9TOMSLjRxt+IgKGj
	sLfTgIMq7fMnhq3Ojy6qPzVsapWH0NfX+b6hvIHvK9G3F8Uj/v+fWAdnYJFzSSayoXp7SxkTvA4EJ
	ShD63altw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvHkC-0002MH-EC; Tue, 14 Jul 2020 10:01:00 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvHkA-0002LQ-3u
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 10:00:58 +0000
Received: by mail-qv1-xf43.google.com with SMTP id u8so7160874qvj.12
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 03:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E3aSxh26goEMg49y7nPlNJKfQGeq71gxBSg9jeZCq4s=;
 b=HuNNLCWLYQuwoiUYuikvRvHQFMLSJGTRZ+1NwNISEfuKNatfSh4aEAoPdXr5P0Oe3G
 3KSN8r6l9J4A7X77CYVjJkCwCATS4+XxbZqcLsY8f5bN0Pb0cZMqooAjJmXowx8IZsHt
 IsiFLxgsaA9JLbZw+JCAKs/9E7TWDwfyRGD4OxeASleLrDwGSaKs+kgQtNzOQ/ij7Fg5
 +z0IufLixFdSPl/foK3DZhhjVv9/nXMMXoaSzmaI/yDjybUHAiWqgGPP30r387Efa5OK
 ptGR0S6hO3FQ4yNm5td1hE0yEWa9/DkbeUwdnVAhZR3dM7a0ckntbBzfjboDitrY+4Mz
 GmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E3aSxh26goEMg49y7nPlNJKfQGeq71gxBSg9jeZCq4s=;
 b=DXarNiJXa6eNDCaU63yQ2Nk/DHCI7I5cBF3Q4iXMy6PI/zqPnO1VBnr2jiDgUc0U4a
 InvaV10jaQ+LWaRQZJCakHWJGF2E+rM3CDx4pqsMudhduUo0MKZkg6IMqWC4Zmfhlb6l
 WWsqWiff2HAPHHuQSsdQUHEdVS9dOgt3Zb7EgJuLXkwepGwnb8rQnLaM0/84ji+AKwAc
 y3XqPnzo2fQ2EVHDTMI3/XLnhj4gLoJxaC539jWd1rqjfficGcivPCzaCtZhDhoExOQt
 6m561F9HUhHXxdwLb/YxMk74OT227iTWsa0NIFMqjNCEbf7hNlEYAwKcZ8t5k45OM8g1
 ICMg==
X-Gm-Message-State: AOAM533KwCmFzKlxTeSNxJDG81Ldy/qqUpspTelv06+ZWg9pPk+qcRx8
 6kid8VPASw9g99mGKTZrfSOJAPxQlfxipxTsZqw=
X-Google-Smtp-Source: ABdhPJx030VurvM5wVZ6JelAjJu5L8sWH+Sxz5vv4ICdNnc2Tz1pP/PA+HAi5721r1d0jbkPiyBqtWvK7qOJ8Tfj684=
X-Received: by 2002:ad4:4cc3:: with SMTP id i3mr3597672qvz.114.1594720854753; 
 Tue, 14 Jul 2020 03:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200630062827.16589-1-penberg@gmail.com>
 <mhng-ca438661-49c2-4d6b-b8ab-c2f5eca9a806@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-ca438661-49c2-4d6b-b8ab-c2f5eca9a806@palmerdabbelt-glaptop1>
From: Pekka Enberg <penberg@gmail.com>
Date: Tue, 14 Jul 2020 13:00:38 +0300
Message-ID: <CAOJsxLH9BBRoWs=d4mG488EB0Ufx0i_9P7hzS6R9CZfENU1NzA@mail.gmail.com>
Subject: Re: [RESEND PATCH] riscv: Move nommu pgprot_* macros to pgtable.h
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_060058_191515_CB4BE0C3 
X-CRM114-Status: UNSURE (   7.74  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

On Tue, Jul 14, 2020 at 4:21 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> This seems fine, but I guess I don't understand why they don't have default
> values in the generic code for !MMU.  It kind of seems like it's an oversight
> due to nested #ifdefs.  Assuming that's the case, we can just juggle those
> around and then remove these from all the ports that define the now useless
> macros.
>
> LMK if you want to pursue that or if you want me to take it over.

Yeah, makes sense, I'll send patches to do that instead. Thanks!

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
