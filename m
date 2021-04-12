Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66A8C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 14:58:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1113B6128C
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 14:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1113B6128C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ew2VIr54CAurV0DiMWt5dxfuXUiIrG/PpHpLyGsyATI=; b=To5HLZx0VkNLUAswZHye41xGO
	xPx5bKjUfBtC7ATvMkPeIGkml47jhgT6g+cV2eKkKr7SQLLSE8ze236SNLzJb8UfFsiQ877Vr0dJs
	cWLKWJbumqi6H/3F+XyZpuJwIKXR79TdBhhuv1c1TGIYFBhC5jjfEWNI7XipWTy8kkDbUzGzGKQ4e
	S5KqtHOkDqVI80H6Ld70wLysuYvY0HWlbOjiN9wGHPaCJTi8tzCVzti9iWMSm0F37xUUu31elINYf
	uMYwgzs/oMcyKTuub6vjBL07EJR3E/vIBsFuxBsgtWIttVbUlQMPM6EQoTdB2+SM/7/qXKvP7nSId
	TfoMxyF6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVy0m-0071AH-TR; Mon, 12 Apr 2021 14:58:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVy0k-0071A5-Jk
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 14:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=ra3N3u+U5ztogBzKBMUH4rZWREsKFCl5azzv5Bvz/Bw=; b=H35mDeVvxZuEJecshnayua8XEb
 n89Xd4IgsyGDwU6sz9Ic/3oQkt1iv5Hxjs61EAaw36qg8f5xz+rj0srznRTmoSSgUEVU/DTshUcvB
 hdekg/fm5fgFWkMGguvlsXpD/X7Csyd3cmMwXG4a+K9dwfpLaYbsA3XX6xsqoOPCNMYyCB7zlu3h8
 z8TZaGCEfVFaocxAktslDhKGUGO6jOvxqz8NyxUNCFk6YhUwEWkr/hj2eE3ytFSjreJ1AktNZ30mO
 v714gYLwvlPa+tfD81r8cRfcNm2+7S4E+MZYLd/YMRPV8uOcB5ZWUFcpSWOfsDW5AHC61wfTTr9a/
 f4260hTg==;
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVy0g-006KGI-VV
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 14:57:57 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FJsKr3CGSz1qtdF;
 Mon, 12 Apr 2021 16:57:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FJsKr2q9jz1r1Mh;
 Mon, 12 Apr 2021 16:57:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 3RedMkuWizDu; Mon, 12 Apr 2021 16:57:51 +0200 (CEST)
X-Auth-Info: SlZtratRNmyhn+YSmfELYp3FK1VgR1Br9Ff7xOUWUJMx7wCS9/gtQ/XBKPAE+gbI
Received: from igel.home (ppp-46-244-166-146.dynamic.mnet-online.de
 [46.244.166.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 12 Apr 2021 16:57:51 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id D78C02C365A; Mon, 12 Apr 2021 16:57:50 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Carlos Eduardo de Paula <me@carlosedp.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: Cross-building Kernel packages for linux-headers adds x86 binaries
References: <CADnnUqfOfDSb3yACo+WcEtLqWvfKw9p0PgCHV=gj94k0SyC6KA@mail.gmail.com>
X-Yow: It's the land of DONNY AND MARIE as promised in TV GUIDE!
Date: Mon, 12 Apr 2021 16:57:50 +0200
In-Reply-To: <CADnnUqfOfDSb3yACo+WcEtLqWvfKw9p0PgCHV=gj94k0SyC6KA@mail.gmail.com>
 (Carlos Eduardo de Paula's message of "Mon, 12 Apr 2021 11:11:14
 -0300")
Message-ID: <87r1jf4kk1.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_075755_183069_C968A328 
X-CRM114-Status: GOOD (  12.32  )
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

T24gQXByIDEyIDIwMjEsIENhcmxvcyBFZHVhcmRvIGRlIFBhdWxhIHdyb3RlOgoKPiBJJ3ZlIGJl
ZW4gY3Jvc3MtYnVpbGRpbmcgLmRlYiBLZXJuZWwgcGFja2FnZXMKCkxvb2tzIGxpa2UgeW91IHNo
b3VsZCBhc2sgdGhhdCB0aGUgZGViaWFuIGRldmVsb3BlcnMuCgo+IOKdryBmaWxlIHNjcmlwdHMv
YmFzaWMvZml4ZGVwCj4gc2NyaXB0cy9iYXNpYy9maXhkZXA6IEVMRiA2NC1iaXQgTFNCIHBpZSBl
eGVjdXRhYmxlLCB4ODYtNjQsIHZlcnNpb24gMQo+IChTWVNWKSwgZHluYW1pY2FsbHkgbGlua2Vk
LCBpbnRlcnByZXRlciAvbGliNjQvbGQtbGludXgteDg2LTY0LnNvLjIsCj4gQnVpbGRJRFtzaGEx
XT1mYzViOTNmYTA2OGJiMDJjYTZmYTFmMWUyZWViOTlmYTc0YTE5Yzg0LCBmb3IgR05VL0xpbnV4
Cj4gMy4yLjAsIG5vdCBzdHJpcHBlZAoKVGhhdCBmaWxlIG5lZWRzIHRvIGJlIGV4ZWN1dGVkIG9u
IHRoZSBidWlsZCBzeXN0ZW0sIHNvIGl0IGlzIGNvbXBpbGVkCndpdGggdGhlIGhvc3QgY29tcGls
ZXIuICBUaGUgYnVnIGFwcGVhcnMgdG8gYmUgdGhhdCBpdCBpcyBwYXJ0IG9mIHRoZQpwYWNrYWdl
IGluIHRoZSBmaXJzdCBwbGFjZS4KCkFuZHJlYXMuCgotLSAKQW5kcmVhcyBTY2h3YWIsIHNjaHdh
YkBsaW51eC1tNjhrLm9yZwpHUEcgS2V5IGZpbmdlcnByaW50ID0gNzU3OCBFQjQ3IEQ0RTUgNEQ2
OSAyNTEwICAyNTUyIERGNzMgRTc4MCBBOURBIEFFQzEKIkFuZCBub3cgZm9yIHNvbWV0aGluZyBj
b21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
