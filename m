Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69803C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 19:55:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBB7164FBB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 19:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBB7164FBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kh9kGW07dibMxMNa82VBAZROx/IrTi+scXpmpNVbi0M=; b=BiRXBecvUeCptP8/QivXued4Z
	4krBLF1GD6raMqJVCVQ+F/rCMcFkm3VoHNrO54+WvFM6oSgN5H3+LHdH3IXYv0OxaPO3WbporToQC
	XdiVgezR4N8ecMRLZqC8qAeXfhO5OK1vcoKiwyZuGv4//utsTilXmKGMWXYCSzEHKyCUAPZu/yp27
	pS2gZt+bpH94Hh/m92OCkQeWUtqgtDWokHKcpcKBmmvUnGh1/sgxwOa8wWWJQZMsdNYY5oT9fH0Rp
	NYLstI+F1hItBWJbAcRBXU98Sn38+k1M/87VG9fkD/LI8mmTJIBxCZ5iywCqzZx38S/+GB7XBOG5e
	Rw+rR1t8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK4vO-007dUk-T5; Wed, 10 Mar 2021 19:55:19 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK4vK-007dUF-Uc
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 19:55:16 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DwjV73mSDz1rxLc;
 Wed, 10 Mar 2021 20:55:11 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DwjV70ntJz1t6pv;
 Wed, 10 Mar 2021 20:55:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id p9Tj1_pKEKj4; Wed, 10 Mar 2021 20:55:10 +0100 (CET)
X-Auth-Info: m9ayv+O76G84j3AzcsOX0vzMJdRHnzApJZPy8u31ICEk+Rpgd5FTh2R3WpcFQzHT
Received: from igel.home (ppp-46-244-173-168.dynamic.mnet-online.de
 [46.244.173.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 10 Mar 2021 20:55:10 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id D7D0D2C3762; Wed, 10 Mar 2021 20:55:08 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: <Claudiu.Beznea@microchip.com>
Cc: <linux-riscv@lists.infradead.org>,  <ckeepax@opensource.cirrus.com>,
 <andrew@lunn.ch>,  <w@1wt.eu>,  <Nicolas.Ferre@microchip.com>,
 <daniel@0x0f.com>,  <alexandre.belloni@bootlin.com>,
 <pthombar@cadence.com>,  <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: macb broken on HiFive Unleashed
References: <87tupl30kl.fsf@igel.home>
 <04a7e801-9a55-c926-34ad-3a7665077a4e@microchip.com>
X-Yow: YOW!!  What should the entire human race DO??  Consume a fifth
 of CHIVAS REGAL, ski NUDE down MT. EVEREST, and have a wild SEX WEEKEND!
Date: Wed, 10 Mar 2021 20:55:08 +0100
In-Reply-To: <04a7e801-9a55-c926-34ad-3a7665077a4e@microchip.com> (Claudiu
 Beznea's message of "Tue, 9 Mar 2021 08:55:10 +0000")
Message-ID: <87y2euu6lf.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_195515_085166_0979198B 
X-CRM114-Status: GOOD (  12.17  )
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

T24gTcOkciAwOSAyMDIxLCBDbGF1ZGl1LkJlem5lYUBtaWNyb2NoaXAuY29tIHdyb3RlOgoKPiBJ
IGRvbid0IGhhdmUgYSBTaUZpdmUgSGlGaXZlIFVubGVhc2hlZCB0byBpbnZlc3RpZ2F0ZSB0aGlz
LiBDYW4geW91IGNoZWNrCj4gaWYgcmV2ZXJ0aW5nIGNvbW1pdHMgb24gbWFjYiBkcml2ZXIgYi93
IDUuMTAgYW5kIDUuMTEgc29sdmVzIHlvdXIgaXNzdWVzOgo+Cj4gZ2l0IGxvZyAtLW9uZWxpbmUg
djUuMTAuLnY1LjExIC0tIGRyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvCj4gMWQwZDU2MWFk
MWQ3IG5ldDogbWFjYjogQ29ycmVjdCB1c2FnZSBvZiBNQUNCX0NBUFNfQ0xLX0hXX0NIRyBmbGFn
Cj4gMWQ2MDhkMmUwZDUxIFJldmVydCAibWFjYjogc3VwcG9ydCB0aGUgdHdvIHR4IGRlc2NyaXB0
b3JzIG9uIGF0OTFybTkyMDAiCj4gNzAwZDU2NmU4MTcxIG5ldDogbWFjYjogYWRkIHN1cHBvcnQg
Zm9yIHNhbWE3ZzUgZW1hYyBpbnRlcmZhY2UKPiBlYzc3MWRlNjU0ZTQgbmV0OiBtYWNiOiBhZGQg
c3VwcG9ydCBmb3Igc2FtYTdnNSBnZW0gaW50ZXJmYWNlCj4gZjRkZTkzZjAzZWQ4IG5ldDogbWFj
YjogdW5wcmVwYXJlIGNsb2NrcyBpbiBjYXNlIG9mIGZhaWx1cmUKPiAzODQ5M2RhNGU2YTggbmV0
OiBtYWNiOiBhZGQgZnVuY3Rpb24gdG8gZGlzYWJsZSBhbGwgbWFjYiBjbG9ja3MKPiBkYWFmYTFk
MzNjYzkgbmV0OiBtYWNiOiBhZGQgY2FwYWJpbGl0eSB0byBub3Qgc2V0IHRoZSBjbG9jayByYXRl
Cj4gZWRhYzYzODYxZGI3IG5ldDogbWFjYjogYWRkIHVzZXJpbyBiaXRzIGFzIHBsYXRmb3JtIGNv
bmZpZ3VyYXRpb24KPiA5ZTZjYWQ1MzFjOWQgbmV0OiBtYWNiOiBGaXggcGFzc2luZyB6ZXJvIHRv
ICdQVFJfRVJSJwo+IDAwMTJlZWIzNzBmOCBuZXQ6IG1hY2I6IGZpeCBOVUxMIGRlcmVmZXJlbmNl
IGR1ZSB0byBubyBwY3NfY29uZmlnIG1ldGhvZAo+IGU0ZTE0M2UyNmNlOCBuZXQ6IG1hY2I6IGFk
ZCBzdXBwb3J0IGZvciBoaWdoIHNwZWVkIGludGVyZmFjZQoKVW5mb3J0dW5hdGVseSwgdGhhdCBk
aWRuJ3QgaGVscC4KCkFuZHJlYXMuCgotLSAKQW5kcmVhcyBTY2h3YWIsIHNjaHdhYkBsaW51eC1t
NjhrLm9yZwpHUEcgS2V5IGZpbmdlcnByaW50ID0gNzU3OCBFQjQ3IEQ0RTUgNEQ2OSAyNTEwICAy
NTUyIERGNzMgRTc4MCBBOURBIEFFQzEKIkFuZCBub3cgZm9yIHNvbWV0aGluZyBjb21wbGV0ZWx5
IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
