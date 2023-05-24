Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7EEC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pljFgg9PriwC0Pw3jBVFUgKSQAwrxoU94NkDsTkC/0=; b=dodrfaoLVQv0gj
	U4BSCW4gZ227OXVb0kOXMrAShRdFV7mojV/n6/O7MHycwoql4A2adHTkDyvAgyM0nAE8CqDDAXqgg
	sxksuO3AirRWsltNHaFm0spiKvVPDEsk2cYcVKto+upLhu7FrNXH2yXH2rh8+GNtQueWIm/UkqGjD
	34u191e7bP155FLoJL6tzzLWuCudR/cQMzWTwwTlKBAAJYsti/QQ7vl1pnx/O9ny1zIQIM8rwnqk2
	lKG0O2eJ7pxDWevBh1FsYbXIl2HblrFGg+kqSrcGWh7gdOElX3QCn0k2of4pPI8Ymkkwo074RrWiK
	oHUHgRQXxQFz0CHJTW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1r9p-00Dypr-0J;
	Wed, 24 May 2023 16:16:13 +0000
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1r9l-00DypG-2D
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 16:16:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 34C4E6275;
	Wed, 24 May 2023 19:16:08 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by localhost (sinikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id DWWyND0Ki8HC; Wed, 24 May 2023 19:16:08 +0300 (EEST)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net [83.102.40.55])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 01392605C;
	Wed, 24 May 2023 19:16:07 +0300 (EEST)
Received: from basile.localnet (87-92-194-88.rev.dnainternet.fi [87.92.194.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by luumupuu2.dnainternet.net (Postfix) with ESMTPS id 228032C63;
	Wed, 24 May 2023 19:16:02 +0300 (EEST)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: palmer@dabbelt.com, linux-riscv@lists.infradead.org
Cc: andy.chiu@sifive.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v20 20/26] riscv: Add prctl controls for userspace vector
 management
Date: Wed, 24 May 2023 19:16:03 +0300
Message-ID: <3656227.v5FYL8H6MN@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20230524092530.7773-1-andy.chiu@sifive.com>
References: <mhng-52f8af07-f3fc-4674-94ea-abbe2108907a@palmer-ri-x1c9a>
 <20230524092530.7773-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_091609_879912_AA2FF60E 
X-CRM114-Status: UNSURE (   8.53  )
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

TGUga2Vza2l2aWlra29uYSAyNC4gdG91a29rdXV0YSAyMDIzLCAxMi4yNS4zMCBFRVNUIEFuZHkg
Q2hpdSBhIMOpY3JpdCA6Cj4gSG93IGFib3V0IGFkZGluZyB0aGUgZm9sbG93aW5nIDIgcGF0Y2hl
cyB0byBkZWFsIHdpdGggdGhlIHByb2JsZW0uCj4gSG93ZXZlciwgSSBhbSBjb25jZXJuZWQgaWYg
dGhpcyBtYWtlcyBFTEZfSFdDQVAgdG9vIGNvbXBsaWNhdGVkLiBlLmcuCj4gRnV0dXJlIGV4dGVu
c2lvbnMgbWF5IGFzIHdlbGwgd2FudCB0byBkbyBzb21ldGhpbmcgaGVyZSBhZnRlciB3ZSBjcmVh
dGUKPiBhbiBlbnRyeSBoZXJlLgoKRmluZSB3aXRoIG1lIGJ1dCBJIGZlZWwgdGhhdCB3ZSBhcmUg
bWlzc2luZyB0aGUgYmlnZ2VyIHBpY3R1cmUgaGVyZSwgYXMgdG8gCndoYXQgdGhlIHVzYWdlIHBh
dHRlcm4vZ3VpZGVsaW5lIGZvciB0aGUgcHJjdGwoKSBvbiB1c2Vyc3BhY2Ugc2lkZSBzaG91bGQg
YmU/CgpNYXliZSBpdCB3YXMgYWxyZWFkeSBkaXNjdXNzZWQsIGFuZCBJIGp1c3QgbWlzc2VkIGl0
LCBidXQgSSBjb3VsZG4ndCBmaW5kIGl0IGluIAp0aGUgZG9jdW1lbnRhdGlvbi4KCi0tIApSw6lt
aSBEZW5pcy1Db3VybW9udApodHRwOi8vd3d3LnJlbWxhYi5uZXQvCgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
