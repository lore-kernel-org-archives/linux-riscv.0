Return-Path: <SRS0=oEUG=23=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C8EC00523
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2020 03:00:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A7F120801
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2020 03:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YqqqgWeT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="LnGpe1iK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A7F120801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IObTHxdSrTA+4cLb5d5XPNdt7irAzNjJT7xEv05gP2U=; b=YqqqgWeThdDnzhf9aA4GE1kjG
	dK5hXeje5bDkpp3KRKMaP6S+/U1O7XfJupA4eduhmT6iCohoJSKQxEEnJdCVqWD4289BPTTkAMq1b
	5g16UfyEOgFEcpTSkpMq6RcZlvwlysh55hHG1vA2s3/R3fK5XgD/+v8iae30hOEYVAa+mSMEtlgvY
	zgph+3LxW1+kUYOUuHY0A0M1F454nzsC6f8VqgwlejXffuoGkAuDYMtHh+XQ+8S3gC4c0Hjn2I3a6
	AQW8AetnVOvAONeD5CYgrycPxvZjyU3hL1+LjB7yhc5Bdi56BNAGmDjPbR2m2hWxICxoFu9J8leK/
	ToXkHc09g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioIdT-0005QK-D9; Mon, 06 Jan 2020 03:00:55 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioIdG-00058o-Vz
 for linux-riscv@lists.infradead.org; Mon, 06 Jan 2020 03:00:44 +0000
Received: by mail-wr1-x443.google.com with SMTP id j42so48096996wrj.12
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jan 2020 19:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IObTHxdSrTA+4cLb5d5XPNdt7irAzNjJT7xEv05gP2U=;
 b=LnGpe1iKssm4K/tw4IaseYnzPu1obNeWgBStdi3fyjqrOwhDsmG++a+dykUHhdYihU
 i+GaQuNbafyCm5T395xfJ9txQmqWd/nT+d3cLKza7wjhP8HL30ulU8teKkLqRGG6k1O5
 LEHSkt0zzGx3h09dQKoc7bcz5AotP0dRi0fhwA4VcqSG2mkHKCV/z7Z1hfmwKxlnA3Eb
 /8EuTfEsmGNxdKJx6aZvyBGA8oPzi3wWrmRrqJcdjDdlGdxwIYC5lUbUDGMG+stbPqAn
 /FcKYATNIps5xBq84LLZLv5baHL5wQTOG1wIOYiODet0TP3rCqkMcLPGmcCuopuWdFGJ
 aocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IObTHxdSrTA+4cLb5d5XPNdt7irAzNjJT7xEv05gP2U=;
 b=jJ6Io5VU1jHvoP1PNmU4q6pIvMy2/5VF/eSveBjuX0zcq8aZtGI7nTrQ+3WJrnzOQv
 nC5uv/BGIJIj9TquANPQ1ZzvgKk/nyWEMRdgS0JTjkAbubEgNVJiQNfvk1dG6K77Nm1O
 QsEWwG9PFzQeFBZtm/U8rEnZp483nxpyzVyzw4IfCeDN8hOrSsfQpZjyR4jlq0GdSjn4
 ebIisQrPHQL5jv8JaVeR1c3n9DrMgEJbnxQrAh5aJQx4sdo+9FxZjjalSO6tT4dadXPC
 H156pXJK4v2g4LINXso6Imj8oao85RcAj/gE5xlygQUrnoQEz4wFiKuJBhdtd0zj1Cly
 3nmw==
X-Gm-Message-State: APjAAAUxh46vV5yBeSk6Y6o1sseTGiePJnndnSoc4NGB9tQtp/AaYT9e
 WYlmtJAc/cW6WBTnbmWlQuojG5ukLOwY+CI8OVTgig==
X-Google-Smtp-Source: APXvYqwKkrzknw/83vnmM3PEodvoeLd8EHhzBeNAPpBu/M+mPCRybjaV4kVYmIXB2Q9S7tjmgF8MkKKLUPUbNNn+RnU=
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr97661644wrn.251.1578279639876; 
 Sun, 05 Jan 2020 19:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20200105025215.2522-1-guoren@kernel.org>
 <20200105025215.2522-2-guoren@kernel.org>
 <20200106024515.GA1021@andestech.com>
In-Reply-To: <20200106024515.GA1021@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Jan 2020 08:30:29 +0530
Message-ID: <CAAhSdy2N1v20g-WGo99Utrvhj4NXZeFP-is1jqCs9DE_Zs2VKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Add vector ISA support
To: Alan Kao <alankao@andestech.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_190043_068338_B5039AEC 
X-CRM114-Status: GOOD (  12.70  )
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
Cc: linux-arch@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 Vincent Chen <vincent.chen@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 guoren@kernel.org, Guo Ren <ren_guo@c-sky.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Bin Meng <bmeng.cn@gmail.com>,
 Greentime Hu <greentime.hu@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 6, 2020 at 8:15 AM Alan Kao <alankao@andestech.com> wrote:
>
> Hi Guo,
>
> On Sun, Jan 05, 2020 at 10:52:15AM +0800, guoren@kernel.org wrote:
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > The implementation follow the RISC-V "V" Vector Extension draft v0.8 with
> > 128bit-vlen and it's based on linux-5.5-rc4.
> >
>
> According to https://lkml.org/lkml/2019/11/22/2169, in which Paul has stated
> that "we plan to only accept patches for new modules or extensions that have
> been frozen or ratified by the RISC-V Foundation."
>
> Is v0.8 ratified enough for now?

As-per the patch acceptance policy, we cannot merge it now (just like KVM
patches) but we can always review and get the patches in final shape
by the time spec is frozen or ratified.

I think we should continue with the patch review and get this series in
good shape.

In fact, having this patches early on LKML is very helpful for people working
on RISC-V vector extension implementation in HW. On this line, this a good
contribution coming at the right time.

Regards,
Anup

