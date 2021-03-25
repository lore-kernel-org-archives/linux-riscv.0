Return-Path: <SRS0=pLrx=IX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4107EC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 09:31:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 910F9619DC
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 09:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 910F9619DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q4xcnWk25WhUUNmkV57nMoLpLmghy7UpyjSCoL51OhA=; b=cn3DIO5fn7WU2Uy8Sy2hJnSOJ
	HyJMVUQAeDSqY2Y2WK2ifksHjwE2rcR3Owdzgha72FVIfj+fKJkWS6Dd0l/x/LuGivFjRyZpuIK90
	Tiqx+i+QJR6OCdyJmkYkEAbNayMrflRkkLOgUaXrHIaMcmxHtZcecUlsQ6ivfcLDEgTi3ePqlTqHZ
	3h9wCAsFGPf2guDSuDKcpZET9EIHWRCmluZRSXF1ZZY45idERuvK4p55MD9xkfK8PYFufxiv8Fo4c
	vcRp6eGJ7TSQSmJMSSp8dY4F7r1o+KKfc8JS4xanU2Y1q/BZIaL8Jn52PAdXgvxJYp5IvuBT4fzkM
	bwRWMxyaQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPMKu-0015xt-Eq; Thu, 25 Mar 2021 09:31:28 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPMBr-001438-Lp
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 09:22:13 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F5fkj66P8z1tqJX;
 Thu, 25 Mar 2021 10:22:05 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F5fkj546jz1qrxt;
 Thu, 25 Mar 2021 10:22:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id eAQlNd3avmLQ; Thu, 25 Mar 2021 10:22:04 +0100 (CET)
X-Auth-Info: fkWzb57UUyETy92DAG3nhUHu+EMyv1a6iUeWcZrZ7mcxGgnZ+5ev3xxE5CFwkQ3V
Received: from igel.home (ppp-46-244-184-22.dynamic.mnet-online.de
 [46.244.184.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 25 Mar 2021 10:22:04 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 042FD2C324E; Thu, 25 Mar 2021 10:22:03 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Zong Li <zong.li@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Stephen Boyd <sboyd@kernel.org>,  Pragnesh Patel
 <pragnesh.patel@openfive.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org,  linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
References: <20201209094916.17383-1-zong.li@sifive.com>
 <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home>
 <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
X-Yow: I'm in LOVE with DON KNOTTS!!
Date: Thu, 25 Mar 2021 10:22:03 +0100
In-Reply-To: <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
 (Zong Li's message of "Thu, 25 Mar 2021 11:21:35 +0800")
Message-ID: <87a6qrk2pw.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_092211_099993_A3EA463B 
X-CRM114-Status: GOOD (  10.15  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTcOkciAyNSAyMDIxLCBab25nIExpIHdyb3RlOgoKPiB0YWtlIGEgbG9vayBhdCB0aGlzIGFn
YWluLiBDb3VsZCB5b3UgYWxzbyBsZXQgbWUga25vdyB3aGljaCBib290bG9hZGVyCj4geW91IHVz
ZWQgKEZTQkwgb3IgVS1ib290LVNQTCk/IFRoYW5rcy4KClUtQm9vdCBTUEwKClBsZWFzZSB0cnkg
dGhpcyBpbWFnZToKCmh0dHA6Ly9kb3dubG9hZC5vcGVuc3VzZS5vcmcvcG9ydHMvcmlzY3YvdHVt
Ymxld2VlZC9pbWFnZXMvb3BlblNVU0UtVHVtYmxld2VlZC1SSVNDLVYtSmVPUy1oaWZpdmV1bmxl
YXNoZWQucmlzY3Y2NC5yYXcueHoKCkFuZHJlYXMuCgotLSAKQW5kcmVhcyBTY2h3YWIsIHNjaHdh
YkBsaW51eC1tNjhrLm9yZwpHUEcgS2V5IGZpbmdlcnByaW50ID0gNzU3OCBFQjQ3IEQ0RTUgNEQ2
OSAyNTEwICAyNTUyIERGNzMgRTc4MCBBOURBIEFFQzEKIkFuZCBub3cgZm9yIHNvbWV0aGluZyBj
b21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
