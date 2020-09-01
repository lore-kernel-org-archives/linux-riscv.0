Return-Path: <SRS0=nmAS=CK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB49CC433E6
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2020 21:09:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E4BC206FA
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2020 21:09:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LeAa8MYi";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mab-labs.com header.i=@mab-labs.com header.b="Il5YKo4Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E4BC206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mab-labs.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QjtdZiAlxSa1r9ZkkenV6Qu4fyklXHqB/DAk6Ya3XHo=; b=LeAa8MYi2nUGf5d4ZjE046W9D
	zjcKJJnLYaZL5ip6xDImP5ucBXsylWqkSk6hWjQP/S7wZHddAoEYQ5/zi9RZr+tQKn4WwBaGegpOH
	EGKl9EZO25PtTBDXHuPdDRevHpoLApiAt6p2nsMBm35gcddmOchAQcbYIrM2ZsIpkrcSCkvcgjeyc
	KkIUhurpAQ8WkoAegwLgLiW7hejzOQdehDiZfoK/NM6L22zRBO7wf5E5Cvr6Ii5S9Ne/dfyZG1ShY
	WGTucJantjLNtjDNFDMmj5w+270GFvXVVaLRrVgS2dGAF2Q/p7ErPWhMG3yZr+pTK+f6qM8fq1GWT
	+Ur8VXbNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDDWR-0003vz-K6; Tue, 01 Sep 2020 21:08:55 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDDWP-0003va-EO
 for linux-riscv@lists.infradead.org; Tue, 01 Sep 2020 21:08:54 +0000
Received: by mail-oi1-x241.google.com with SMTP id 2so2428907ois.8
 for <linux-riscv@lists.infradead.org>; Tue, 01 Sep 2020 14:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mab-labs.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dJmmSDPlM8cOB5cZH/35QVQ6cUMnNiYEigqfXGTuQUc=;
 b=Il5YKo4Zc9tlfXdhDwo+ebsxIc9Cyygbduzo42Ss2soM4AYpNuzkTyFguWH7UGaW5Y
 SWT/UFCA/g9oxBIJqUzZkuqkPdgHniokTBwYYPTdNxMh5GANoG8m2xP7qMPXmMtUzvyz
 F3dgyKtSeWBVYTSHUx/2Mq0Tpd0usE7gOF3FOioA9CynHJkLRYPUsnHCBIXpfcGQyYYM
 OvgxZHe+XH0ndXHmeKfnpTvWLt/pgYCetXH4Wnz2QfLoD5Kgl/nxurwZZZq3enOZD1bQ
 Mxs9h5/ffUNdF5TTN7djAMy01WbTSHkFZ1Dwvh12tAi6Eqd3CLBkCd7sDuKWKzLEJyyO
 1JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dJmmSDPlM8cOB5cZH/35QVQ6cUMnNiYEigqfXGTuQUc=;
 b=JkoLht/+zCHNwf/mdA2YWbrbGV896d8ykCnvUr/r8f8CcEKMoKQ/GejFy1eqngmDEV
 fY4fmoOgepV9twyFJ+W9RLUffX/fTPX7OdARBwRHaj/XUD1onG7lBhX9x5KuUWbEE6w1
 5zLdUcA70HRUq5tLLIwBR0/6iWFCg6ogwl/U4RBo0rT76DpVgezNA9Lk8Z1wKfRzqb/b
 QfTEB40qEQfGrFXygtk8U7SvVqwt+r+8u8uPhxST6VI7nLh2gZUatKx61DNHwLRNSXft
 2SkSL8mc7V64Xh5bszeDST3fVFvUBKKgn4jvIJjLvoPYbSe52S5yvmRQ/gu63WzRKK6Q
 dFIw==
X-Gm-Message-State: AOAM532h84hUPPgZmPEbuuJwwU0LnE4cv4PeS4N+ZUeK/cw9qZwWNL+x
 7vhiFNkVkAtd9O7jylKm5AWYsB1esSsdaCKLdTFf8Q==
X-Google-Smtp-Source: ABdhPJySCCOEKDMjlWxTeSV0ZoCQ+NjDs97kd9veiqVRGFOVuziRF9wfo2GeoRlNbSR7D9RAb62RRLku0zCed+qNvgE=
X-Received: by 2002:aca:ab08:: with SMTP id u8mr64614oie.74.1598994527688;
 Tue, 01 Sep 2020 14:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <CALkjhPrHDHRsFDh9n864xvK4DKU2GW68_TcA-Tz17udsOWjbFg@mail.gmail.com>
 <883c0f38-e002-ce16-d196-933a8b700776@gmail.com>
 <CALkjhPr-wXSROT_bB2DA4N1jJT9B64_g9Q9xOHvckmeZYWm5Ng@mail.gmail.com>
 <ac581b64-601a-9766-2a9e-21d877407780@gmail.com>
In-Reply-To: <ac581b64-601a-9766-2a9e-21d877407780@gmail.com>
From: Mohammed Billoo <mab@mab-labs.com>
Date: Tue, 1 Sep 2020 17:08:36 -0400
Message-ID: <CALkjhPodUMo0xHgGwwPq-75T_DcNJGe54OCWmE3VrqRWa2Fhhg@mail.gmail.com>
Subject: Re: RISC-V testing needs on HW?
To: Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_170853_548639_FBDBE129 
X-CRM114-Status: GOOD (  21.34  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I can access the memory regions without any issues. This is the output
of a program I slapped together:

BusyBox v1.32.0.git (2020-09-01 14:37:15 EDT) hush - the humble shell
Enter 'help' for a list of built-in commands.

/ # memory_access
Hello World
Successfully opened /dev/mem
0x80700000: 0x0
0x80700001: 0x0
0x80700002: 0x0
0x80700003: 0x0
0x80700004: 0x0
0x40700000: 0x0
0x40700001: 0x0
0x40700002: 0x0
0x40700003: 0x0
0x40700004: 0x0
0x50440000: 0xff

Looks like syscon is all 1s. Is there some documentation on the K210
that has the register definitions?

On Tue, Sep 1, 2020 at 10:16 AM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 9/1/20 10:14 AM, Mohammed Billoo wrote:
> > On Tue, Sep 1, 2020 at 6:42 AM Sean Anderson <seanga2@gmail.com> wrote:
> >> Can you test what happens when accessing ai ram (0x40600000-0x407FFFFF
> >> and 0x80600000-0x807FFFFF)? I have two boards where this appears to lock
> >> up the bus, but I have also heard it reported that accessing this area
> >> of ram works fine. If it works for you, can you please also report what
> >> your clock and reset settings are? Those should be controlled by the
> >> syscon device at 0x50440000.
> >>
> >> The ai ram takes up 2M, which is a lot of memory on a board with 8M
> >> total. It would be great to be able to use it when the KPU is not in
> >> use, but I have been unable to access it correctly. I have been testing
> >> mostly with U-Boot, but I experience the same problems when booting
> >> Linux.
> >>
> >> --Sean
> >
> > Sure, is this on the latest master or the 5.8 release?
>
>
> Doesn't matter to me.
>
> --Sean



-- 
Mohammed A Billoo
Founder
MAB Labs, LLC
www.mab-labs.com
201-338-2022

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
