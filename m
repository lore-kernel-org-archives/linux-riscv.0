Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A93DC54EBD
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 15:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8pfhWpX7dlZYG5Hyyi01zWj5gvKRz08b7Mr1FlizYFs=; b=ZpLyMCZxDe25m3
	rsKDdow6GMFKZ4s/JIe3aLDBrCEASQKjKTHCj0NSV8qfVqmjMm7k92dpWsZlQxsjS7M+Rr4tW1dHP
	d573uY81efXJGPp0G25Dasuz+4OJS5heUyqYAx+/1+ohtftfJChkVWnEw5b6G5YAc03pzQt2xrFYN
	jDiO67epWnFI8QZIcKYmnvWIPnuUDHnfj+cjRtKH1tah7QC7ru+ubYc/LIQBKmFycygDDARvyls4C
	x7x8C1uP9WfHG+DYkA6loWdMYklplsjzws3CVt3c+VWsSCh9v/WEOnRXqTgr59KOv8YI9EGIfNPU/
	GYF/NyygMsYzfpQC9GzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGMJR-003GTc-8U; Fri, 13 Jan 2023 15:49:49 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGMJN-003GRB-Kv
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 15:49:47 +0000
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Ntm7d6XlCz1s88x;
	Fri, 13 Jan 2023 16:49:33 +0100 (CET)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
	by mail.m-online.net (Postfix) with ESMTP id 4Ntm7d5GYfz1qqlR;
	Fri, 13 Jan 2023 16:49:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new, port 10024)
	with ESMTP id r243CuGzOFnD; Fri, 13 Jan 2023 16:49:31 +0100 (CET)
X-Auth-Info: 2BX/Bb7F44Mx5eZxELRkHAFq5wR3YQgE04gMWo440+/Tq6gxxvGmJwQW5R0GrOjK
Received: from igel.home (aftr-62-216-205-42.dynamic.mnet-online.de [62.216.205.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 13 Jan 2023 16:49:31 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 0810A2C14C7; Fri, 13 Jan 2023 16:49:31 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  linux-riscv@lists.infradead.org,  =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: Add "Code:" to RISC-V splats
References: <20230113144552.138081-1-bjorn@kernel.org>
	<20230113144552.138081-2-bjorn@kernel.org>
X-Yow: Go on, EMOTE!  I was RAISED on thought balloons!!
Date: Fri, 13 Jan 2023 16:49:30 +0100
In-Reply-To: <20230113144552.138081-2-bjorn@kernel.org> (=?utf-8?Q?=22Bj?=
 =?utf-8?Q?=C3=B6rn_T=C3=B6pel=22's?=
	message of "Fri, 13 Jan 2023 15:45:51 +0100")
Message-ID: <87h6wutoxh.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_074945_871441_BF0506A6 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

T24gSmFuIDEzIDIwMjMsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cgo+IEZyb206IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPgo+IEFkZCAiQ29kZToiIG91dHB1dCB0byBSSVNDLVYg
c3BsYXRzLiBNaW1pYyB4ODYtNjQncyBieXRlLWZvci1ieXRlCj4gZHVtcHMuCgpSSVNDLVYgaW5z
bnMgYXJlIG9yZ2FuaXNlZCBpbiAxNi1iaXQgcGFyY2VscywgaXQgcHJvYmFibHkgbWFrZSBzZW5z
ZSB0bwpwcmVzZW50IHRoZW0gdGhhdCB3YXkuCgotLSAKQW5kcmVhcyBTY2h3YWIsIHNjaHdhYkBs
aW51eC1tNjhrLm9yZwpHUEcgS2V5IGZpbmdlcnByaW50ID0gNzU3OCBFQjQ3IEQ0RTUgNEQ2OSAy
NTEwICAyNTUyIERGNzMgRTc4MCBBOURBIEFFQzEKIkFuZCBub3cgZm9yIHNvbWV0aGluZyBjb21w
bGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
