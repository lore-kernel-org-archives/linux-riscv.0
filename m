Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AABFEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGwPPHGa1+LbftIARiBSZJYHCKdGfLa/SyrCqlXdb4E=; b=f6Xn/0PEUeagsI
	8mS1+G8gf1jvX/Qx/BVADeupQLwVAjBddBHGsNz4j8ju8wLroYesPWQF75crIY1KrPCCT75PSB61d
	kH3k8LG4zpeXwg2bQW/eVrRsJtQMP6i3kXLvlYfr+VY67dozy+bdGYobuE5Uv+er2qK09sZQIRA5+
	NGOW9++W7uxsTKAqjgS6K/CgKVRvvnlOFaLJtGIHPm/n6tn6PgBSf6ec/702jZGMipkGSdQDUPQg4
	E4wFI1cm2DR4XjypME+AVkC6LPvSvYYF4VKjJpSnh/aTpWIy71YJFKkjR0ZBEMAgCcO3YpZe/qyAL
	YsHgV3aXIO/ik0i6R3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9qto-00FcEM-2f;
	Thu, 15 Jun 2023 17:36:44 +0000
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9qtl-00FcCw-0v
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 17:36:43 +0000
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 96DD21534E;
	Thu, 15 Jun 2023 20:36:34 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id ESnzdHrHHkba; Thu, 15 Jun 2023 20:36:34 +0300 (EEST)
Received: from oliivipuu2.dnainternet.net (oliivipuu2.dnainternet.net [83.102.40.53])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 5256815321;
	Thu, 15 Jun 2023 20:36:34 +0300 (EEST)
Received: from basile.localnet (87-92-194-88.rev.dnainternet.fi [87.92.194.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by oliivipuu2.dnainternet.net (Postfix) with ESMTPS id 0CA9B97;
	Thu, 15 Jun 2023 20:36:31 +0300 (EEST)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
Date: Thu, 15 Jun 2023 20:36:31 +0300
Message-ID: <2357195.3bzvq7fpCv@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20230614163534.18668-1-palmer@rivosinc.com>
References: <20230614163534.18668-1-palmer@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_103641_499046_4238FB8D 
X-CRM114-Status: UNSURE (   8.12  )
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

TGUga2Vza2l2aWlra29uYSAxNC4ga2Vzw6RrdXV0YSAyMDIzLCAxOS4zNS4zNCBFRVNUIFBhbG1l
ciBEYWJiZWx0IGEgw6ljcml0IDoKPiBUaGUgViByZWdpc3RlcnMgYXJlIGNsb2JiZXJlZCBieSBz
dGFuZGFyZCBBQkkgZnVuY3Rpb25zLCBzbyB1c2Vyc3BhY2UKPiBwcm9iYWJseSBkb2Vzbid0IGhh
dmUgYW55dGhpbmcgdXNlZnVsIGluIHRoZW0gYnkgdGhlIHRpbWUgd2UgZ2V0IHRvIHRoZQo+IGtl
cm5lbC4KCkluZGVlZCwgZm9yIHlvdXIgdHlwaWNhbCBzeXN0ZW0gY2FsbCwgd3JhcHBlZCBieSB0
d28gb3IgbW9yZSBsYXllcnMgb2YgCmZ1bmN0aW9uIGNhbGxzIGluc2lkZSBsaWJjLCB1c2Vyc3Bh
Y2Ugd2lsbCB0cmVhdCB0aGUgcmVnaXN0ZXJzIGFzIGNsb2JiZXJlZCAKYW55aG93LgoKQnV0IEFG
QUlVLCBvdGhlciBhcmNoaXRlY3R1cmVzIGRvbid0IGdyYXR1aXRpb3VzbHkgY2xvYmJlciBTSU1E
IG9yIHZlY3RvciAKcmVnaXN0ZXJzLCBldmVuIHRob3NlIHRoYXQgYXJlIGNhbGxlZS1jbG9iYmVy
ZWQgYnkgdGhlaXIgcmVzcGVjdGl2ZSBmdW5jdGlvbiAKY2FsbGluZyBjb252ZW50aW9uLCBvciBk
byB0aGV5PyBGV0lXLCBBcm0gaXMgZ29pbmcgdGhlIG9wcG9zaXRlIGRpcmVjdGlvbiB3aXRoIAp0
aGVpciBoaWdoZXIgcHJpdmlsZWdlIGNhbGxzIChuZXdlciB2ZXJzaW9ucyBvZiBTTUNDQyBkZWZp
bmUgaG93IHRvIHByZXNlcnZlIApTVkUgdmVjdG9ycykuCgpUaGUga2VybmVsIGNhbm5vdCBzaW1w
bHkgY2xvYmJlciByZWdpc3RlcnMsIGFzIHRoYXQgd291bGQgbGlrZWx5IGNhdXNlIGRhdGEgCmxl
YWthZ2UgZnJvbSBrZXJuZWwgdG8gdXNlciBtb2RlLiBTbyBpdCBpcyB1bmNsZWFyIHdoYXQgdGhl
IGJlbmVmaXRzIHdvdWxkIGJlIApoZXJlLiBBbmQgSSBmZWFyIHRoYXQgdGhlcmUgd2lsbCBiZSBs
ZXNzIGNvbnZlbnRpb25hbCB1c2UgY2FzZXMgd2hlbmNlIGl0IAptYWtlcyBzZW5zZSB0byBwcmVz
ZXJ2ZSByZWdpc3RlcnMgb24gc3lzdGVtIGNhbGxzLgoKRm9yIGV4YW1wbGUgYW4gaW5saW5lIG9y
IGNvbXBpbGVyIGludHJpbnNpYyBpbXBsZW1lbnRhdGlvbiBvZiBDKysyMC9DMlggCmF0b21pYy13
YWl0L2F0b21pYy1ub3RpZnksIHdoaWNoIHdvdWxkIHByZXN1bWFibHkgaW52b2tlIHRoZSBmdXRl
eCgpIHN5c2NhbGwgCm9uIExpbnV4LCBtYXliZT8/CgotLSAK6Zu357Gz4oCn5b635bC8LeW6k+Ww
lOiSmQpodHRwOi8vd3d3LnJlbWxhYi5uZXQvCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
