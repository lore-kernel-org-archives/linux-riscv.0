Return-Path: <SRS0=1Sxd=2A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FE0C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2019 07:03:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8ABD206D3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2019 07:03:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pSCif+GE";
	dkim=pass (1024-bit key) header.d=cs.washington.edu header.i=@cs.washington.edu header.b="NkuGcga7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8ABD206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cs.washington.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XOLR366ue9UbdwpGi75PQA5BDSgsShKRMR6syBVaCSI=; b=pSCif+GEONAgjZ9OdzdzUL/h8
	ehBGkPI7nqODWR8n4LddVpcYM/al7p6jNxarYBDrxjy3ccWo7/HxICsd42+Y2lZmaSxXto4jO7MxB
	NEibrNDmGUCe85MwJ4SOorLX99CMAdF9BPG4aeB3ks80RPDTo0buUqyRircOaNpkh5UxrRG38T/KJ
	FK3KRQS6Hux9XATkvktgYwGWyKFYzPZDylqScls/6F2U7fNBESILCaL/2TMjzAPt/Eof6f6vM4dtO
	7kXKOLGF/qkWU3AfnosphBGYUUcH66MmUwQqK2h/ZiAkhmOdgWlAYNiiqJT3C5KLd61wIQBePFtbx
	Ic33iqkiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieZYO-0000SO-SU; Tue, 10 Dec 2019 07:03:28 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieZYM-0000RT-Ew
 for linux-riscv@lists.infradead.org; Tue, 10 Dec 2019 07:03:27 +0000
Received: by mail-il1-x144.google.com with SMTP id p8so15151086iln.12
 for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2019 23:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cs.washington.edu; s=goo201206;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XOLR366ue9UbdwpGi75PQA5BDSgsShKRMR6syBVaCSI=;
 b=NkuGcga7SVDZTUMMo51w4HRsBnbf0R/URj6PpPGlU3pLyxh/0ttxIog576y1yzdvLn
 eoJ8kf6kXgiGbSaaWDuUGmWTjtsTjZKVSCJ8Q1SnoKKiwiN/5ZXbedZXayDFlSyae+Yy
 nAhd9fD3buTsungj4t2ef9PnPd818UbU+6cdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XOLR366ue9UbdwpGi75PQA5BDSgsShKRMR6syBVaCSI=;
 b=alLNE7toJ3Tpejg4qG34DmJMN/Not+1xkBq1VOsulfHbN/un9k5SuCiHsn5cmfWY0R
 hreZy+s4Ua3Ybch5FAjJtATChi+NfzWJgiUDmBZ/vQL4+5LcwS4RpjzMaMrncRctSNJg
 L/L9EzDAOj5hiLq3MYctj/Voj95zIyr4EvyiKQbe1INGnJMOQg1bIrXRyxuJtsVALcIK
 RUu9ZInkBGQfGQXEZH3PauXjpW2ecJ24qQg9sFOO9oSbl7zN4H/Z9gc5kZgyWDimwU/m
 gU0ecYf61rCdfn5DlOyC01Gg8iyv3Sca0Su8+bAWoI1vI/CaPy7e7/3GFCfrFbbBcOy6
 Vc5g==
X-Gm-Message-State: APjAAAVptiuiabQM4AO/HFlG3uNxAr8nq+qE9DH+TpMCBWIyO6tKvmzC
 16qxLx3gT6mt+dbBSgn30rZCXw8rEw0GgH3ey46w8rCLPl3h7A==
X-Google-Smtp-Source: APXvYqzgHM+DLDGODvA/sjBCZyZhAfvnRErBW0IceCs2/IQqhRh8rJvuSRMhu9qEW/u/DVJiNXoqYx8gBP7F7uuyY6I=
X-Received: by 2002:a92:86c5:: with SMTP id l66mr31157017ilh.280.1575961401998; 
 Mon, 09 Dec 2019 23:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20191209173136.29615-1-bjorn.topel@gmail.com>
 <20191209173136.29615-3-bjorn.topel@gmail.com>
 <CADasFoDOyJA0nDVCyA6EY78dHSSxxV+EXS=xUyLDW4_VhJvBkQ@mail.gmail.com>
 <2d5d1f2d-d4ab-2449-37c6-e5b319a778d6@iogearbox.net>
In-Reply-To: <2d5d1f2d-d4ab-2449-37c6-e5b319a778d6@iogearbox.net>
From: Luke Nelson <lukenels@cs.washington.edu>
Date: Mon, 9 Dec 2019 23:02:53 -0800
Message-ID: <CADasFoCZc7Lt=puc82x7PBSvuOG_dBwVgasYGJ4M3RFDG=qR3A@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/8] riscv, bpf: add support for far branching
To: Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_230326_498862_411C7D42 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-riscv@lists.infradead.org, bpf <bpf@vger.kernel.org>,
 Xi Wang <xi.wang@gmail.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 9, 2019 at 1:27 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> This is awesome work! Did you also check for other architectures aside
> from riscv and x86-32, e.g. x86-64 or arm64?

We haven't tried on x86-64 or arm64 yet, but we plan to in the
future and are looking at ways to minimize the effort required to
port verification to new architectures.

> It would be great if we could add such verification tool under tools/bpf/
> which would then take the in-tree JIT-code as-is for its analysis and
> potentially even trigger a run out of BPF selftests. Any thoughts whether
> such path would be feasible wrt serval?

Right now the verification requires manual translation of the JIT
implementation in C to Rosette for verification, which makes it
difficult to integrate into existing tests. Were currently working
on automating this process to be able to verify the C implementation
directly. If this works out, it'd be awesome to integrate into the
selftests in some way. Will keep you posted.

Thanks,

Luke

