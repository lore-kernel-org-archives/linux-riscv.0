Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23831C433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 10:25:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C33AC206B6
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 10:25:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jpa871Wr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="KLapxVHe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C33AC206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FwGKKuoz9jkqd1RGIb4bmGrxMqBcUp6RrFnsENhgNyU=; b=jpa871Wr7iYrljLKKFGza9lfi
	6y+dQCfrRBFs1GfQWPjZiA87zU8X3MHl60yA2CmC/CSt5ehHHsVq+W4b74C8mwnZ7QANNp9wfaaB/
	7Hmu41QuL1jM86/7NEeH3qAZUilHIxJ2JWhc/XZwJ1zIeysSIEswdZXep0NInNolbSElixDmewyXa
	IFgl/mF6AEZiD/JJ72aZj8XBAwdtUuTAAeaDpjDFkBUjQM17w1mMUOhVk0typuieG9xs4Zs8V0jdp
	cLSQ5HcOe+a1Vt55MIOmbWBO4Xk6qbHWhUj9O3JdvBG6Ej0jPnMoPtbTKTxVdnTOFEbQQFZUQqfa9
	GT2TZmjfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3Gc0-0007Yd-JA; Wed, 05 Aug 2020 10:25:32 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Gbx-0007Y1-NO
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 10:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1596623141; x=1628159141;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=h/0isfh8p8B1tbntU7DOOWsRw+KNgTWlrOkmU2ux2KQ=;
 b=KLapxVHeAxx104YiD2OtcBNE/bEGoelP2/p4BPurOKKvsHRO46bKt6kT
 es90Pap+GlGyctJjuMnWJVpj+Cjsy/6IEsKhnyxmQC7Z1+tNG3ohJBmye
 Y1jwH0P6uSDn9T1LPHlY41598Dv+o13WNtDnfaFENumJzw52r+3mBzCTf
 NjPxGWgS/PO5/HhcjDIahDPkwBwsS/UT0bkzxdO2oDIsyStVSTklCFnZ3
 2Bg1UBA6dv37oBtm/VD+hLUm3QMkUG6dSJaloOI88veeVIrTzdp0vnSs7
 uSBLh2npa01b9QBzSn/JrhVJLkDIV2u53iChJndSLh9gp0i3xX1lmburb Q==;
IronPort-SDR: EEl3o99dGlax11pD2ke/7gdaCbhSHRS3vwQBK9COgkRHdRgSJAPxDgl+HITujQrkAWUrKf1g8d
 /ylcAEWcs04ckbB6QTwAlcGRLRASceg6aJu30cHdyY7LhLooVafOsZh/ZitVw5AigwF92YqM+T
 Il+U6H8HW635Oilugiqct6lbvhup+6VrUkg+DXKZPYez6aFanol0zAEdPGDsbE8kvrsKpU3vZc
 RDVbjXPllFHUu8RyuyhpEz6O/RTpIMB+Lv5O30rvU5XuumHefepCwsqpKeMon1AZbuPdrBP7WP
 iUI=
X-IronPort-AV: E=Sophos;i="5.75,436,1589212800"; d="scan'208";a="247293885"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Aug 2020 18:25:21 +0800
IronPort-SDR: xgE5wYF1hDczM2stCK9R9eKyCdbs3jYasJkRN+4hGlXgDdR0g16GCMJtt5MvBUsK8LjwrefiSe
 oridMY/bi+Kg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 03:13:16 -0700
IronPort-SDR: VUewrqLbnzqHz+1znrMauq+iKaQ9F6wif5BzAqHWU2V2ZT7K1lVDvG0MTfXji6pud1QgJHJ3zk
 LoEnDGt9JhZA==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 03:25:15 -0700
Date: Wed, 5 Aug 2020 11:25:11 +0100 (BST)
From: "Maciej W. Rozycki" <macro@wdc.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 1/2] riscv: ptrace: Use the correct API for `fcsr' access
In-Reply-To: <20200805024807.GM1236603@ZenIV.linux.org.uk>
Message-ID: <alpine.LFD.2.21.2008051117180.24175@redsun52.ssa.fujisawa.hgst.com>
References: <20200805020745.GL1236603@ZenIV.linux.org.uk>
 <mhng-cd1ff2e9-7d34-4d56-8d79-b2d02a239290@palmerdabbelt-glaptop1>
 <20200805024807.GM1236603@ZenIV.linux.org.uk>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_062530_013699_C009F118 
X-CRM114-Status: GOOD (  18.50  )
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
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 5 Aug 2020, Al Viro wrote:

> > I'm not sure I understand what you're saying, but given that branch replaces
> > all of this I guess it's best to just do nothing on our end here?
> 
> It doesn't replace ->put() (for now); it _does_ replace ->get() and AFAICS the
> replacement is much saner:
> 
> static int riscv_fpr_get(struct task_struct *target,
>                          const struct user_regset *regset,
>                          struct membuf to)
> {
> 	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
> 
> 	membuf_write(&to, fstate, offsetof(struct __riscv_d_ext_state, fcsr));
> 	membuf_store(&to, fstate->fcsr);
> 	return membuf_zero(&to, 4);     // explicitly pad
> }

 I'm glad to see the old interface go, it was cumbersome.

> user_regset_copyout() calling conventions are atrocious and so are those of
> regset ->get().  The best thing to do with both is to take them out of their
> misery and be done with that.  Do you see any problems with riscv gdbserver
> on current linux-next?  If not, I'd rather see that "API" simply go away...
> If there are problems, I would very much prefer fixes on top of what's done
> in that branch.

 I can push linux-next through regression-testing with RISC-V gdbserver 
and/or native GDB if that would help.  This is also used with core dumps, 
but honestly I don't know what state RISC-V support is in in the BFD/GDB's 
core dump interpreter, as people tend to forget about the core dump 
feature nowadays.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
