Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65473C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 23:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRkosnVna7d/Qbek46r82ku+2vfNc9EfN0gQg3G7qS8=; b=HLxv6U33Y8SNZ5
	nbDtRmbxDUAu+77yMu36NFtxIfmNrvTD4T1Sn1b+7Gtgof6LHPw1Qsipnq1ZucxrzaeKhVYqZ73eO
	bmv7S9No3SwTiL18du5KMaDUAhqAsAz9mZgLdErIrwbhKmCodSOsMuMR1RpyWwmpQPjNgKaje0VY0
	e9Kx0FwT6HqO41+fDjjSg/W+H7/g/8IZdAaIBGlhGMSvVRKCKtXVrIR8KidCJ2JoqVmmgPNtid8O4
	H+DgyykvkkVfzf1PAUq88HAuxWAIr61kSpn2W2sd+ixIpyImsgocKe3FvalohWqAIMeWx5nUFdxFY
	BfwCx58eJ8RXkLfE8MwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAKlU-007rIL-7U; Wed, 19 Jan 2022 23:53:20 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAKlQ-007rHB-Mh
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 23:53:18 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4JfMsJ5Bttz1s9Mk;
 Thu, 20 Jan 2022 00:53:08 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4JfMsJ4Hbyz1qqkB;
 Thu, 20 Jan 2022 00:53:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id dRGOlz5u8L7s; Thu, 20 Jan 2022 00:53:07 +0100 (CET)
X-Auth-Info: 9m4bgV9T2M+yZZxp4SgYjNeW8kikBjyhixaHbLns0GY06zMhMO/XYHIJRr/oHbKB
Received: from igel.home (ppp-46-244-165-91.dynamic.mnet-online.de
 [46.244.165.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 20 Jan 2022 00:53:07 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 1F9032C3AD3; Thu, 20 Jan 2022 00:53:07 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Changbin Du <changbin.du@gmail.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  linux-riscv
 <linux-riscv@lists.infradead.org>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: eliminate unreliable __builtin_frame_address(1)
References: <20220117154433.3124-1-changbin.du@gmail.com>
 <C2470F2D-9E45-49D7-A03B-E6A7BB4B9738@jrtc27.com>
 <87v8yg6lhf.fsf@igel.home>
 <AAAA7852-EBCA-47A3-B74E-A425023468C6@jrtc27.com>
 <8735lj78wu.fsf@igel.home>
 <8F8D535F-3637-4BC7-8853-B709EC5D14C9@jrtc27.com>
 <87y23b5t9g.fsf@igel.home>
 <BD64D67C-613B-495E-9FB7-2AFB6FA15308@jrtc27.com>
X-Yow: Now my EMOTIONAL RESOURCES are heavily committed to 23% of the
 SMELTING and REFINING industry of the state of NEVADA!!
Date: Thu, 20 Jan 2022 00:53:07 +0100
In-Reply-To: <BD64D67C-613B-495E-9FB7-2AFB6FA15308@jrtc27.com> (Jessica
 Clarke's message of "Wed, 19 Jan 2022 21:27:46 +0000")
Message-ID: <87tudz5llo.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_155316_919262_2C475753 
X-CRM114-Status: GOOD (  10.17  )
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

T24gSmFuIDE5IDIwMjIsIEplc3NpY2EgQ2xhcmtlIHdyb3RlOgoKPiBXaGF04oCZcyB5b3VyIHBv
aW50PwoKTExWTSBkb2Vzbid0IGhhdmUgdG8gZGVhbCB3aXRoIHRoZSBleHRyYSBjb21wbGV4aXR5
LgoKPiBkb2VzbuKAmXQgbWVhbiBvdGhlciB0b29sY2hhaW5zIHRoYXQgZG8gbmVlZCB0aGF0IHRv
IGJlIGNvcnJlY3Qgc2hvdWxkCj4ganVzdCBkbyBzb21ldGhpbmcgd3JvbmcuCgpfX2J1aWx0aW5f
ZnJhbWVfYWRkcmVzcyB3aXRoIGNvdW50ID4gMCBpcyBjb25zaWRlcmVkIGJhZC4gIE5vYm9keSBz
aG91bGQKdXNlIGl0LgoKWW91IGRvbid0IGhhdmUgdG8gYmUgYXJyb2dhbnQuCgotLSAKQW5kcmVh
cyBTY2h3YWIsIHNjaHdhYkBsaW51eC1tNjhrLm9yZwpHUEcgS2V5IGZpbmdlcnByaW50ID0gNzU3
OCBFQjQ3IEQ0RTUgNEQ2OSAyNTEwICAyNTUyIERGNzMgRTc4MCBBOURBIEFFQzEKIkFuZCBub3cg
Zm9yIHNvbWV0aGluZyBjb21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
