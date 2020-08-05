Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEABC433E5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 19:49:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B8732250E
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 19:49:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HZGOFQjC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="1pykeJF3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B8732250E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=YD8GT+pdpWjSjB7DxwkC4fKdsnixsh6tnDT+h0D4+t4=; b=HZGOFQjC139SDOkxfxf9UbI1P
	FImDo3XX5MDh7boJ3sJPt9tE/0fQly4npMMk/RCXuRpuvyNT0XqChIoEJeTbKTY2g8X9ocTNpneqS
	LadBzB3e0zuY77peh0MJhKdlhdL9tiUwHgtxAQt7bq4QwwTo/FKZqb+kPPErvm9v2RjbalJP0Lo5n
	EHoEuDSJXqiG8lmnxlpD/i/ALfdFqBpknMc4OzTs4FqiaFTveqf4V5/cg0CGwkGKxTM1+wUtUghrb
	qW8aoA4X11Lp0TfmpdgFBvPQhq48I2pl4EDqixqyfwVXHL6qaxoLG2UX3hKXblj6rM7lqt6s0MFKn
	IBBYWesFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3PPF-0001Z4-OA; Wed, 05 Aug 2020 19:48:57 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3PPC-0001Y0-B6
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 19:48:55 +0000
Received: by mail-pf1-x444.google.com with SMTP id u185so23451745pfu.1
 for <linux-riscv@lists.infradead.org>; Wed, 05 Aug 2020 12:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=L17CWK1m3SliQ1EsOYU/bGzhjK9+vwZDDuk1FmFiO2U=;
 b=1pykeJF3J6nCADZe+oNtNIXQbcs+6ezxghmqOsh5fLU98/DwcNnv6LNoX+V1+UugAi
 jbyJ8S2TBOozl6G1DzMZCxynY3o6i+DGfRl/10ug/Rn+wOeWxyon8mc4qCiNfAcSOlaX
 Q1HDUu/1/pzCfyrajnzKkwAgyJeEag+JYZyhXLp5kmPoCJVhcp06Lw+lUiLi3NvQWbh4
 DG7P2QZ5iwlFIXFcJf3lYuWJzqqkVt3SAFOCFWWRU+dvO/DS/jWqvpCT48AGYfs2XRGS
 II4pH/3/UBYQglTe1cGiwkxrDjQCtBpGnFjwHqTV0iO7m94pOe11X7M/NWYeGUYJjqyr
 FznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=L17CWK1m3SliQ1EsOYU/bGzhjK9+vwZDDuk1FmFiO2U=;
 b=kzN3RZw3AYLI7gZ1rvFZZPRNLr2M4Q21ATFKDKZOOhwP4HMjZ7iUHROQfCT4Rl+23v
 6jURzj/VeGJjwUC/cN+k+121eON9obtTwsOo5YQ4WxjTE552z4CFxdADcDquOKaNQDzk
 NP4GydiXq7hkRAEXNNhNfK7d6P/o7bKPVUdaxyvxKCRynFni3o+Tcg4pgPbBGQ6Fr0F3
 obWKtoa+232ekod4kRhz+l0smDy88fr+yM+b0apBqXXLEtmy7Qd7sLkr9OMLVLETz5VL
 Rg/c2fACezeNSVLMZkN+E4HkkNtwLIFaq5qW5NAZf1TxUTuicopFP5s8ETcw1ZuMwMVr
 TPDg==
X-Gm-Message-State: AOAM532sjF0DnvXsl2LNov7EtGgkU9vmASkCQ+q1FTFmMUAlC/B7JlaA
 Pmq+BjD/KOmxHRCXk/+Z+Oer4Q==
X-Google-Smtp-Source: ABdhPJwLhRMrPJuYQBuTk34kbj1gU4nZ+/dxUu//j3YIMASMw5+RvnfEU2fU01veDmWaS+MvgWUtCQ==
X-Received: by 2002:a63:e00c:: with SMTP id e12mr4364217pgh.413.1596656931925; 
 Wed, 05 Aug 2020 12:48:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z189sm4627140pfb.178.2020.08.05.12.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 12:48:51 -0700 (PDT)
Date: Wed, 05 Aug 2020 12:48:51 -0700 (PDT)
X-Google-Original-Date: Wed, 05 Aug 2020 12:48:49 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: ptrace: Use the correct API for `fcsr' access
In-Reply-To: <alpine.LFD.2.21.2008051117180.24175@redsun52.ssa.fujisawa.hgst.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: macro@wdc.com
Message-ID: <mhng-6e42b0e6-1f3b-41a3-a023-4145fb4d8980@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_154854_550457_93370DDC 
X-CRM114-Status: GOOD (  24.59  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 viro@zeniv.linux.org.uk, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 05 Aug 2020 03:25:11 PDT (-0700), macro@wdc.com wrote:
> On Wed, 5 Aug 2020, Al Viro wrote:
>
>> > I'm not sure I understand what you're saying, but given that branch replaces
>> > all of this I guess it's best to just do nothing on our end here?
>>
>> It doesn't replace ->put() (for now); it _does_ replace ->get() and AFAICS the
>> replacement is much saner:
>>
>> static int riscv_fpr_get(struct task_struct *target,
>>                          const struct user_regset *regset,
>>                          struct membuf to)
>> {
>> 	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
>>
>> 	membuf_write(&to, fstate, offsetof(struct __riscv_d_ext_state, fcsr));
>> 	membuf_store(&to, fstate->fcsr);
>> 	return membuf_zero(&to, 4);     // explicitly pad
>> }
>
>  I'm glad to see the old interface go, it was cumbersome.
>
>> user_regset_copyout() calling conventions are atrocious and so are those of
>> regset ->get().  The best thing to do with both is to take them out of their
>> misery and be done with that.  Do you see any problems with riscv gdbserver
>> on current linux-next?  If not, I'd rather see that "API" simply go away...
>> If there are problems, I would very much prefer fixes on top of what's done
>> in that branch.
>
>  I can push linux-next through regression-testing with RISC-V gdbserver
> and/or native GDB if that would help.  This is also used with core dumps,
> but honestly I don't know what state RISC-V support is in in the BFD/GDB's
> core dump interpreter, as people tend to forget about the core dump
> feature nowadays.

IIRC Andrew does GDB test suite runs sometimes natively on Linux as part of
general GDB maintiance and we don't see major issues, but I'm pretty checked
out of GDB development these days so he would know better than I do.  It's
always great to have someone test stuff, though -- and I doubt he's testing
linux-next.  It's been on my TODO list for a long time now to put together
tip-of-tree testing for the various projects but I've never gotten around to
doing it.

Oddly enough, despite not really using GDB I have used it for core dumps -- I
was writing a tool to convert commit logs to coredumps with the GDB reverse
debugging annotations, but I never got around to finishing it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
