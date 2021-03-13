Return-Path: <SRS0=xwO/=IL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128ECC433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Mar 2021 21:54:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A70064DE1
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Mar 2021 21:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A70064DE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8fSe3eg+aAmySv/7sfHJOACy6SoqHDZrB86IvAy+ttY=; b=Rf9JPwMi5S7SjexHmGTkXp5fd
	VEzal2UPGCjQGIe+IfewThk4vhlAqVT1UEyyEyyo8JMkQQocWOA56mo3XxfgyWvIbUExFd540w+PH
	NOKQH9x6eXiSWloNJ2cu7Fk0xkWmpRJTQGqSinP4k4nEaBD/2OcQ2V7IG30Bx5QnX83mxQ0zugNsl
	wlGg99wJbnHZ0hZlPef4Nl99LXCzl5VLgYusON1vsmgyGJ1LOuVMRe255PZdxum/2BRtHhTJZu64M
	pwbCShBNFlIsmmm4D5dIGjpclI+hohfmKeHbu0m6Xkm3gO+572jC/sZ1t9oN07HiHZIM4ZWmdBgbH
	/X/cqjNCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLCDF-00De4T-LU; Sat, 13 Mar 2021 21:54:21 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLCDA-00De46-Rz
 for linux-riscv@lists.infradead.org; Sat, 13 Mar 2021 21:54:19 +0000
Received: by mail-yb1-xb36.google.com with SMTP id x19so29285487ybe.0
 for <linux-riscv@lists.infradead.org>; Sat, 13 Mar 2021 13:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GhwxGEkw8ytL79APFDFDPPxm81DmFU7dhHEQAY8fvks=;
 b=J6v4X2zh9zr/+JhZYu1TO4VzEhA1YsHaSBACt0Sc0eVzhxQLmhXzcEky+Yq2okFras
 3kezJaiqHbGQ9+JnLOOV1yylpNyEBytWs2Wlu5ba8BPh4Jgb3wYLWSDfig/efUSxPVdP
 pY2XlJ+iSz8uErGCVXYSYIbiXjSpODZoh1ImEC8NDLxekhiFdLQEjSYKk82ufvWAfXtu
 GRwnP11EBBdkh+SfdeES9EbW2HsMpV9QULfYwIyLNFoocT7AtCOL7m/D2egI73JDOoAg
 h6xC+KK33ULwBTPvKfQf9fSSUN1pxESIUuI7ZrP6GciuxuNFcgcw/bu1RuX97/k17cWp
 AqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GhwxGEkw8ytL79APFDFDPPxm81DmFU7dhHEQAY8fvks=;
 b=hUPLAfQShkiB66JDDJRBQfVFCKx9rmNPONFg7/80964Cxtqb+ZNSKYMh94rQkl6a/8
 YbG5NzV/1Ibe0f1kzomCasmLBlfGeIv8/kF2U4QxoG+p8S9NhGoNMtAZzBLq8oEN/zoB
 e9XUkXUGEGSF+3QNzZ6jTOZQOuZJJhV0SR51rGR/hTEiS4ek3V9XOdmnexUnvoLwZyL+
 X4eKvQUpx1eU0kPRsOyPwwI0mw8YvqdqiAZlELcVLy0XDAruTHTxAyPnLYkAmaCo6kBz
 6Chi520osDwgMfT9GnZ/JB3HdWkp/Qsvq+bGWB8GoF+L1O48LVYxx7lx2iMu8N/5EIBm
 JXYg==
X-Gm-Message-State: AOAM533P765+Nx4kKwv2XcweA8FbjLMqzmoWG4rYCyACa2ftAG8UFd5M
 ywqDUdwIy28Qsk4gLmtcEQqwy3eikZmi8Dnv2to=
X-Google-Smtp-Source: ABdhPJz1plNkpafFFbtDcDfYgLN5d/wG6nGryBoO1b+5biUSDjCo7b2e1ZYH0okZE90OY9uUx6k/i9EhP2TNXun5m3A=
X-Received: by 2002:a25:ca88:: with SMTP id
 a130mr27494740ybg.414.1615672454155; 
 Sat, 13 Mar 2021 13:54:14 -0800 (PST)
MIME-Version: 1.0
References: <87tupl30kl.fsf@igel.home>
 <04a7e801-9a55-c926-34ad-3a7665077a4e@microchip.com>
 <87y2euu6lf.fsf@igel.home>
In-Reply-To: <87y2euu6lf.fsf@igel.home>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Sat, 13 Mar 2021 22:54:02 +0100
Message-ID: <CANBLGcyteTgQ2BgyesrTycpVqpPeYaiUCTEEp=KmPB0TPqK_LQ@mail.gmail.com>
Subject: Re: macb broken on HiFive Unleashed
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Claudiu.Beznea@microchip.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, ckeepax@opensource.cirrus.com, 
 andrew@lunn.ch, Willy Tarreau <w@1wt.eu>,
 Nicolas Ferre <Nicolas.Ferre@microchip.com>, daniel@0x0f.com, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, pthombar@cadence.com, 
 Network Development <netdev@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210313_215417_013586_E4FCE9DA 
X-CRM114-Status: GOOD (  13.60  )
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

SGkgQW5kcmVhcwoKT24gV2VkLCAxMCBNYXIgMjAyMSBhdCAyMDo1NSwgQW5kcmVhcyBTY2h3YWIg
PHNjaHdhYkBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gT24gTcOkciAwOSAyMDIxLCBDbGF1ZGl1
LkJlem5lYUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+ID4gSSBkb24ndCBoYXZlIGEgU2lGaXZlIEhp
Rml2ZSBVbmxlYXNoZWQgdG8gaW52ZXN0aWdhdGUgdGhpcy4gQ2FuIHlvdSBjaGVjawo+ID4gaWYg
cmV2ZXJ0aW5nIGNvbW1pdHMgb24gbWFjYiBkcml2ZXIgYi93IDUuMTAgYW5kIDUuMTEgc29sdmVz
IHlvdXIgaXNzdWVzOgo+ID4KPiA+IGdpdCBsb2cgLS1vbmVsaW5lIHY1LjEwLi52NS4xMSAtLSBk
cml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlLwo+ID4gMWQwZDU2MWFkMWQ3IG5ldDogbWFjYjog
Q29ycmVjdCB1c2FnZSBvZiBNQUNCX0NBUFNfQ0xLX0hXX0NIRyBmbGFnCj4gPiAxZDYwOGQyZTBk
NTEgUmV2ZXJ0ICJtYWNiOiBzdXBwb3J0IHRoZSB0d28gdHggZGVzY3JpcHRvcnMgb24gYXQ5MXJt
OTIwMCIKPiA+IDcwMGQ1NjZlODE3MSBuZXQ6IG1hY2I6IGFkZCBzdXBwb3J0IGZvciBzYW1hN2c1
IGVtYWMgaW50ZXJmYWNlCj4gPiBlYzc3MWRlNjU0ZTQgbmV0OiBtYWNiOiBhZGQgc3VwcG9ydCBm
b3Igc2FtYTdnNSBnZW0gaW50ZXJmYWNlCj4gPiBmNGRlOTNmMDNlZDggbmV0OiBtYWNiOiB1bnBy
ZXBhcmUgY2xvY2tzIGluIGNhc2Ugb2YgZmFpbHVyZQo+ID4gMzg0OTNkYTRlNmE4IG5ldDogbWFj
YjogYWRkIGZ1bmN0aW9uIHRvIGRpc2FibGUgYWxsIG1hY2IgY2xvY2tzCj4gPiBkYWFmYTFkMzNj
YzkgbmV0OiBtYWNiOiBhZGQgY2FwYWJpbGl0eSB0byBub3Qgc2V0IHRoZSBjbG9jayByYXRlCj4g
PiBlZGFjNjM4NjFkYjcgbmV0OiBtYWNiOiBhZGQgdXNlcmlvIGJpdHMgYXMgcGxhdGZvcm0gY29u
ZmlndXJhdGlvbgo+ID4gOWU2Y2FkNTMxYzlkIG5ldDogbWFjYjogRml4IHBhc3NpbmcgemVybyB0
byAnUFRSX0VSUicKPiA+IDAwMTJlZWIzNzBmOCBuZXQ6IG1hY2I6IGZpeCBOVUxMIGRlcmVmZXJl
bmNlIGR1ZSB0byBubyBwY3NfY29uZmlnIG1ldGhvZAo+ID4gZTRlMTQzZTI2Y2U4IG5ldDogbWFj
YjogYWRkIHN1cHBvcnQgZm9yIGhpZ2ggc3BlZWQgaW50ZXJmYWNlCj4KPiBVbmZvcnR1bmF0ZWx5
LCB0aGF0IGRpZG4ndCBoZWxwLgoKU29ycnksIGZvciBiZWluZyBsYXRlIHRvIHRlc3QgdGhpcywg
YnV0IEkganVzdCBjb21waWxlZCBhbmQgYm9vdGVkCjUuMTEuNiBhbmQgZXRoZXJuZXQgd29ya3Mg
anVzdCBmaW5lIGZvciBtZToKaHR0cHM6Ly9lc21pbC5kay9oZnUtNS4xMS42LnR4dAoKQXMgeW91
IGNhbiBzZWUgSSBoYXZlbid0IHVwZGF0ZWQgT3BlblNCSSBvciB1LWJvb3QgaW4gYSB3aGlsZSwg
ZG9uJ3QKa25vdyBpZiB0aGF0IG1ha2VzIGEgZGlmZmVyZW5jZS4gWW91IGNhbiBmZXRjaCB0aGUg
Y29uZmlnIGlzIHVzZWQKaGVyZToKaHR0cHM6Ly9lc21pbC5kay9oZnUtNS4xMS42LmNvbmZpZwoK
L0VtaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
