Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088BFC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:48:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCBCF20854
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HNqOljCO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGioGN2o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCBCF20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCU+BjNMyrPvIi9q/xmSZR0wxu6uyQbvqe6tTC/Lmn4=; b=HNqOljCOO/ff4D
	8t/LkMNg2MukaCKWOYihhGbnF3nj1w8jAaw/rxvQDsnQOr5dDnEeMZi8K6JuaToXpsfB+gBxnbHHc
	IXc76JLRsNAMdnKjwrACSMSrl+3JdJ9KLgf3ZFgQhREQ8s9FPQyNt4ioKk6XZT3nr7T7M9aCYV8+e
	8xwgBjA47FGNADrQADE9DD/2EH2PKxkdoEq642TVK1e3elp00+g7M+Z2dB5D4O1sdKzJ+z3aLfQxm
	dNi2bB7//NIpMq08F0lA/UWH5bzjK/GsYrf9gzJf5NvdDjLr4ou0ZV5MBgb/S9ETwJ3K6IFI85XbQ
	ZOkpSA5dSFshv1/uAyGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXN6-0007Iv-46; Sat, 10 Nov 2018 17:48:36 +0000
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXN4-0007IP-2G
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:48:35 +0000
Received: by mail-vk1-xa43.google.com with SMTP id d201so1139238vka.0
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 09:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q2D3v1rJFx0uTpqsJo7C/CqAiXaPIxK1s0aO044o7ZU=;
 b=MGioGN2okKb0wgfPqPdwkNS7rL8+FOEdI5wNbgaXIAZ4QG/C+N+kEpLd1I4wuiIxYF
 CPV9a3AKiJYzl0kIhB0o5ERFcAi0LslkvZIxZJTWjLX2JXqhZQWiR46v65Dm0eR9I/r0
 wSYFuS5ChAZcH1jbVDcoaGQ5dLoiH1gyoI3j9eeAEdyZh/L1eVxEKTbVSZfymmqnyync
 F/DheQZGNdVGV9X+qwoemdJFx0XopQOrblgLj5ypCFFt3PCsTgldZ4OmavyKwO1ngsss
 VDtjisM3JBYoKFH6ZJz6jDPAPnj8th55Pe+PFLp1XOO8ehm9I8IJl8wUfdEx9i07zvGQ
 SGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q2D3v1rJFx0uTpqsJo7C/CqAiXaPIxK1s0aO044o7ZU=;
 b=MVda6HOTlzk+ebZAwGoiv/FXLSnn2aXUzodPC0/Hu4dbFTneJtE2YJ1eU178QZ7iEC
 AlQEEjnPCNm66LxvhVLa/9WHIHv8zF87J7b3jwCdHu+w85oXgyD0rPb/fBo0t4mbKvgU
 6bnQO0FCH4qO13+uWlqVqd5DvWFaMIoDi8E+ysUtz56l02Ea4iyVcg2CtKR/LwkRk6xF
 zJFc+urhNbzBraXWkuAdLk5Ph+Ax4ENNBAMNVJV1Tgygvd2vtOUGobjtJwbB7jaDv0F/
 J+eDoVrl41mgCl/6Rxy6aDvfLDs8WKPVQQ1ujKXoJb4drfBhfbAhHNhAeSitl5y5bafb
 SY2Q==
X-Gm-Message-State: AGRZ1gJsFODrlx52vJRlHsITob8HXVwsOyzyo7tQoT0Tmu0DGUfhFMBP
 /YAih+oVhiJ1KFEc1iEPEkDiVNW1rzErlOL9Tv0=
X-Google-Smtp-Source: AJdET5fHuUwOIIl3SmAtkO5a0sssTvn6ieljvQm0ogpxzjArYx8fy+oRNTNq0MRnHI3VmMk/m3DJdq2iAy3L2fhovVs=
X-Received: by 2002:a1f:60c9:: with SMTP id u192mr5480234vkb.36.1541872101716; 
 Sat, 10 Nov 2018 09:48:21 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAEz=sokxTJk=0EnRnLeG6LkaZiW-Dr4nmz=2JDgZm893NM-adQ@mail.gmail.com>
 <CAPweEDzZGEi87o5bBPeU6c7qHCtCJNcOHL0Uz1uUOPQak56X_Q@mail.gmail.com>
In-Reply-To: <CAPweEDzZGEi87o5bBPeU6c7qHCtCJNcOHL0Uz1uUOPQak56X_Q@mail.gmail.com>
From: Samuel Falvo II <sam.falvo@gmail.com>
Date: Sat, 10 Nov 2018 09:51:01 -0800
Message-ID:
 <CAEz=songRyvbEgYfxKP0WyuAdZnKsqfrCk8CCxSsCGGHeUFixA@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_094834_107456_3EEBEF86 
X-CRM114-Status: UNSURE (   5.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 olof.johansson@gmail.com, alankao@andestech.com, "Chang,
 Abner" <abner.chang@hpe.com>, atish.patra@wdc.com,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 agraf@suse.de, zong@andestech.com, ron minnich <rminnich@gmail.com>,
 sw-dev@groups.riscv.org, paul.walmsley@sifive.com, mick@ics.forth.gr,
 Alistair.Francis@wdc.com, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110175101.JmkTq43C_MKMbTmJh6UE-ORtuiRL69FJ93qEgzzEEgc@z>

On Sat, Nov 10, 2018 at 9:43 AM Luke Kenneth Casson Leighton
<lkcl@lkcl.net> wrote:
>  it's also not an appropriate argument.  nobody sensible would port a
> POSIX pppd from userspace into boot-level firmware.  the argument also
> ignores the dozens of other advantageous potential use-cases.

Regrettably, if it's one thing we've all learned from PC clone
manufacturers and BIOS vendors, it's that they're not sensible.
They're not reasonable.  And they're anything but sane.

Servers designed for use in data centers are on the market right now
with adapters fully equipped with TCP/IP stacks in firmware *just* to
give a remote operator control over a computer's PS/2 or serial ports,
for instance.

You can bank that it'll happen with RISC-V as well.

-- 
Samuel A. Falvo II

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
