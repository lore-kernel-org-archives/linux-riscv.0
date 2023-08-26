Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37E3C83F15
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Aug 2023 18:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rRW4E8THR6Zsb7M6yTaHamYk74tLOibWTd6Kt8wTNM=; b=gC/HkRPInNYasT
	1U2r21l513K04iP3loyTh+o2ttq1DXOO8X3pYNP5tJtT36J7kD7TL8gyFDv+wJNKmM9FshokUUX40
	fEMDwNgUc2lUgKyu4N7T90e0oP8qlgMhDob0RSMrU8hO69B3Jk8R3ySUWs/1f7E63o9/LPNykREdU
	d1ht0Br1IjPFf1tcOwVZ4pFrCZ9F6Aloj6rfs2yLnIDZUhqfMhBq7zlbpU8GAv3Zf0/yF8PSL+dqk
	4L1D70G/uTNVar94M7XG2dScL8hXhYWwxxuaKHFyyE1d2/O3AuhckzTIQqbu0zqqjq945TQ9R8Tc8
	009ihsgoxnvIhuVPt0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZy4b-0078CX-2w;
	Sat, 26 Aug 2023 18:31:49 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZy4Z-0078CE-13
	for linux-riscv@lists.infradead.org;
	Sat, 26 Aug 2023 18:31:48 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-991c786369cso246950966b.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Aug 2023 11:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693074705; x=1693679505;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+UJQr2hCnxXecSS9bbNuxh3r6VB0zAAGeKLbxHDvwWA=;
        b=ZY5x4YYYN9qpVOkqEpCIIfBo8tMBylGbu2z1Y05QhqEA3NApF64DwJLl82S0tTm2LT
         CKi167PjJYVP115gLmohDrJDVF3xM19nwPko0FDBWQVIXVo3wZUm0FMAhyp4t4qW9VLG
         u2I4IX9i5SG/odnmr5vFItV86o9D6MtP0sRRNm2py+J3Rmccu/CLbijC9Y7Pis4R51SX
         GeW8LMy5u2YTQ8rzsLAlVNnJFm0hQhQrHCmAJ5I6baKNjOpdizuAlCFWVR16Wlg4ugXQ
         TWFEqZ891YNe9423wNzEpLrPZ+5Fdb5QSqqPINakdEfToW3J2N6WHAezlJWBt4Dkm95p
         aCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693074705; x=1693679505;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+UJQr2hCnxXecSS9bbNuxh3r6VB0zAAGeKLbxHDvwWA=;
        b=Sy6VfjUX2IMtMLmKrja3z1iWZDzg7f3PDCqO70b9FgUDCBGr2e4jVLKz6mlfcTEnbS
         gG1CD9C6g/K/F6lo/8sJXn7DBhoNjCu37MrG4Is5FSzCqKjHWAHeU23CANs2NVjkABcG
         QwqiuiMwWHOU0HCc5TNXTNWAMvr9daj29MyKy3uayhfhseiLi/jKsp079Zuo8OKS5mCN
         fHTQEu/yIqm3DTrEcI4g6nGDe+e2dPRndU9La8XndhzCyATNRMSPp0TrL5DGgziqsTQi
         WQb9FIwNM6vPtPCzNGkZ9udUEe7hmG5blgtqj5gA90BbSU11Ny6cariZRk2TvaooSFZl
         2irg==
X-Gm-Message-State: AOJu0YxfYUZB9FXpQ4fXBNRCe2n2laitjCvahLO9nVj4xx3dESfwBQyt
	UMEM+QBgtaQHFOHNJXz5rEM=
X-Google-Smtp-Source: AGHT+IECbG3m5ZTwBp8m0310WyiPwYIcaK3SXszCxf7bpYqK78t1mfuk+rPCWQCD2WsFl8PK4JmYNA==
X-Received: by 2002:a17:906:2009:b0:99b:dd38:864d with SMTP id 9-20020a170906200900b0099bdd38864dmr15776429ejo.23.1693074704819;
        Sat, 26 Aug 2023 11:31:44 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id fj9-20020a1709069c8900b00992e265495csm2474479ejc.212.2023.08.26.11.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 11:31:44 -0700 (PDT)
Date: Sat, 26 Aug 2023 20:31:43 +0200
From: Nam Cao <namcaov@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
	bpf@vger.kernel.org, Hou Tao <houtao@huaweicloud.com>,
	yonghong.song@linux.dev,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: RISC-V uprobe bug (Was: Re: WARNING: CPU: 3 PID: 261 at
 kernel/bpf/memalloc.c:342)
Message-ID: <ZOpFD3W3RfiqOoWn@nam-dell>
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
 <87v8d19aun.fsf@all.your.base.are.belong.to.us>
 <ZOpAjkTtA4jYtuIa@nam-dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOpAjkTtA4jYtuIa@nam-dell>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_113147_385684_6E505AC2 
X-CRM114-Status: GOOD (  23.75  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Aug 26, 2023 at 08:12:30PM +0200, Nam Cao wrote:
> On Sat, Aug 26, 2023 at 03:44:48PM +0200, Bj=F6rn T=F6pel wrote:
> > Bj=F6rn T=F6pel <bjorn@kernel.org> writes:
> > =

> > > I'm chasing a workqueue hang on RISC-V/qemu (TCG), using the bpf
> > > selftests on bpf-next 9e3b47abeb8f.
> > >
> > > I'm able to reproduce the hang by multiple runs of:
> > >  | ./test_progs -a link_api -a linked_list
> > > I'm currently investigating that.
> > =

> > +Guo for uprobe
> > =

> > This was an interesting bug. The hang is an ebreak (RISC-V breakpoint),
> > that puts the kernel into an infinite loop.
> > =

> > To reproduce, simply run the BPF selftest:
> > ./test_progs -v -a link_api -a linked_list
> > =

> > First the link_api test is being run, which exercises the uprobe
> > functionality. The link_api test completes, and test_progs will still
> > have the uprobe active/enabled. Next the linked_list test triggered a
> > WARN_ON (which is implemented via ebreak as well).
> > =

> > Now, handle_break() is entered, and the uprobe_breakpoint_handler()
> > returns true exiting the handle_break(), which returns to the WARN
> > ebreak, and we have merry-go-round.
> > =

> > Lucky for the RISC-V folks, the BPF memory handler had a WARN that
> > surfaced the bug! ;-)
> =

> Thanks for the analysis.
> =

> I couldn't reproduce the problem, so I am just taking a guess here. The p=
roblem
> is bebcause uprobes didn't find a probe point at that ebreak instruction.=
 However,
> it also doesn't think a ebreak instruction is there, then it got confused=
 and just
> return back to the ebreak instruction, then everything repeats.
> =

> The reason why uprobes didn't think there is a ebreak instruction is beca=
use
> is_trap_insn() only returns true if it is a 32-bit ebreak, or 16-bit c.eb=
reak if
> C extension is available, not both. So a 32-bit ebreak is not correctly r=
ecognized
> as a trap instruction.

I feel like I wasn't very clear with this: I was talking about handle_swbp(=
) in
kernel/events/uprobes.c. In this function, the call to find_active_uprobe()=
 should
return false. Then uprobes check if the trap instruction is still there by
calling is_trap_insn(), who correctly says "no". So uprobes assume it is sa=
fe to
just comeback to that address. If is_trap_insn() correctly returns true, th=
en
uprobes would know that this is a ebreak, but not a probe, and handle thing=
 correctly.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
