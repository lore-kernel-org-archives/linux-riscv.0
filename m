Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16F4C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yq8Q7lHsDFKRNn97eQmbE0RFCqX41VWXVgUtsQnxAc8=; b=VCZWtUllERmiJQ
	uK1oeI76hPjVcD+WaojutQDEnoP25kSrAGcwNV2mKAtAyqtLXDwkdIFhi3XU5K+MezRxbs+Jbl8V7
	kHLgcUlDgkhBJm/Ruqbnuo3PlMcMrjlAonz5e763HdjIOnKAITGpkjyQMjdiEocY5Wfd/WvK0k9LB
	ew3/A5ziLsgi6ylD6KYj91tf0npc7YGdVwC7D/vOWYZQ2DhU8ntJOlSivgEgfgflHlqMn46CS6GZR
	8QCyQCny5UOp3AUzHto3oldeq9WRs5gZ0boDJMPQqEDqS1zNO/+VjnPhYH1fPfiLfg+VA9sqAGKz1
	FxvcGdLXjUG3jenuJDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscG-00000004NcM-3KRn;
	Tue, 24 Jun 2025 01:38:28 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnID-00000003t6b-45sK
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 19:57:27 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3da73df6c4eso42852105ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 12:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750708643; x=1751313443; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qhCtv/W1YilWrYjCUxSunc8+8p4TVEIkoBhp1MF2Z8o=;
        b=C8+8TrklBPTJbSHtsdMkOXSxsXAInpNSZCr6CC9oPEftXlneOgkMyktm1x6/pPkTES
         FuXbXUGj0lhpMbiAkCJVZ+WcJTJiRGNUVd6lfU0stPSgvE2JHhckuOwavE9BkongjZel
         7jkZG9wNHxXZoala248PnB7w+ALx3p/iLp1EhuUEmDX9ybflNVkfWszbac3UG/+wEpcH
         AWH53klNba/YlWnk1zN3umW0G3AUXmMjRcq99tnop/EEMJWANJmIdYAYQlj7npDOXg3o
         nnmEglOZzYnB13oHQj2Hp+KltINdLC1FGfgqAnA1FFnVVUbtTAaeEDikboD0WVQjZfPu
         A1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750708643; x=1751313443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhCtv/W1YilWrYjCUxSunc8+8p4TVEIkoBhp1MF2Z8o=;
        b=l3WIVZd1Ess3P6IXkfEMDYYHkx0QtnLpWcjvBBEOv3Z4Z/mWD8MEDLRo+XDjho3mcD
         0+Dkp4KmZ3iiWP03RQfGlGpT18srxft2kCzQQY/SEqqe5x5fHWXamCaxJy5JDiRBc3A5
         7RSxkgsRvEOC2JkUViptAgb0xCpT1bDZqmcRgl0qaI60mJA98cpaaXQhCWh5pvgj3hf0
         pGu+AMYXL3MXQm6TSDOBG/bAilCzjtwixcKf3fGWuHoNCW6YasY3QvLFhywelFbgNTSi
         usGpX9xClQXmPKWYL9aG4ZSBI+IEW72PIj5L7e/cjkePgBr5yJvrkGqxbBKgmZQdcG+x
         Tz4w==
X-Forwarded-Encrypted: i=1; AJvYcCX2HK9fkaOLFZaVqNu8T+8qe15TJP3f3uwCp28dTX5djP+EBgKpdLAjyqq/dKrwBU78/0i73742guapRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyS4v6G4js0E+KRlY5lyqr3t8h2LT4epXCfAMb8fVlsUhvDlLwq
	f9ppY7SpNNGhYakIxs7pfM7AlHFOHbEwbRpvh9t1JqGo11sI/NWonYz8zdAa7B2pEMs=
X-Gm-Gg: ASbGncvEetymiSYZ/Wi75PZ/mBnkFT66VOpPBKymMwbYMG+sInzlDPZeZn2CV5IhrhL
	c5g9bOiCC2RUYEM0Z5bXz/0RYlsv18GLlUtYngc/GG16LqaoQ7nF75ELVsoG7khZvwv4a1iO20s
	IAnQDr7tl+vfEdjuwA58L3+T+VIcdwBIU6SyV3RRLaCwJALbxrJ0ojB3/mxBdqjA8EEl+s9sFKi
	joGvc+9YMA43/Hn0J8zSMqek6L1YSUYa0ZhLRVlosTgsxif/r7fRs+PMLGfbJF1uJ71p6NHzEDL
	OZAg1460XuObwJ6M6Lr6tXRIDHYLJ7qLhLuD18KYIe5NOSXIhWhjXBHCYlKHtZUFHyr9uZE6gKw
	Wmm1oZnPGyLpLslAcyhPB28SoAw==
X-Google-Smtp-Source: AGHT+IEjrZfqFnrATrpmzrnCBPEt3gJFXHl6kwuKElD8eQ70QsQ57w3LAu8TuunEO8GEQ3e+/ulOLg==
X-Received: by 2002:a05:6e02:3c03:b0:3dd:b808:be68 with SMTP id e9e14a558f8ab-3de38cbfe51mr160467165ab.16.1750708642553;
        Mon, 23 Jun 2025 12:57:22 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de37768c8esm30846015ab.68.2025.06.23.12.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 12:57:22 -0700 (PDT)
Message-ID: <2f66c3ae-bd55-4835-86a1-1f9daa391e09@riscstar.com>
Date: Mon, 23 Jun 2025 14:57:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] rtc: spacemit: support the SpacemiT P1 RTC
To: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, lee@kernel.org,
 alexandre.belloni@bootlin.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, wangruikang@iscas.ac.cn, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 troymitchell988@gmail.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250622032941.3768912-1-elder@riscstar.com>
 <20250622032941.3768912-5-elder@riscstar.com>
 <d35922c4-fbd0-4d13-9bcd-2688b48c0045@o2.pl>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <d35922c4-fbd0-4d13-9bcd-2688b48c0045@o2.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_125726_262381_29001BF6 
X-CRM114-Status: GOOD (  34.47  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNi8yMy8yNSAxOjU0IFBNLCBNYXRldXN6IEpvxYRjenlrIHdyb3RlOgo+IFcgZG5pdSAyMi4w
Ni4yMDI1IG/CoDA1OjI5LCBBbGV4IEVsZGVyIHBpc3plOgo+PiBBZGQgc3VwcG9ydCBmb3IgdGhl
IFJUQyBmb3VuZCBpbiB0aGUgU3BhY2VtaVQgUDEgUE1JQy7CoCBJbml0aWFsbHkKPj4gb25seSBz
ZXR0aW5nIGFuZCByZWFkaW5nIHRoZSB0aW1lIGFyZSBzdXBwb3J0ZWQuCj4+Cj4+IFRoZSBQTUlD
IGlzIGltcGxlbWVudGVkIGFzIGEgbXVsdGktZnVuY3Rpb24gZGV2aWNlLsKgIFRoaXMgUlRDIGlz
Cj4+IHByb2JlZCBiYXNlZCBvbiB0aGlzIGRyaXZlciBiZWluZyBuYW1lZCBpbiBhIE1GRCBjZWxs
IGluIHRoZSBzaW1wbGUKPj4gTUZEIEkyQyBkcml2ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFs
ZXggRWxkZXIgPGVsZGVyQHJpc2NzdGFyLmNvbT4KPj4gLS0tCj4+IHYzOiAtIEFkZGVkIHRoaXMg
ZHJpdmVyIHRvIHRoZSBzZXJpZXMsIGluIHJlc3BvbnNlIHRvIExlZSBKb25lcyBzYXlpbmcKPj4g
wqDCoMKgwqDCoMKgIG1vcmUgdGhhbiBvbmUgTUZEIHN1Yi1kZXZpY2Ugd2FzIHJlcXVpcmVkIHRv
IGJlIGFjY2VwdGFibGUKPiBbc25pcF0KPj4gK3N0YXRpYyBpbnQgcDFfcnRjX3JlYWRfdGltZShz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBydGNfdGltZSAqdCkKPj4gK3sKPj4gK8KgwqDCoCBz
dHJ1Y3QgcDFfcnRjICpwMSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+PiArwqDCoMKgIHU4IHRp
bWVbdHVfY291bnRdOwo+PiArwqDCoMKgIGludCByZXQ7Cj4+ICsKPj4gK8KgwqDCoCByZXQgPSBy
ZWdtYXBfYnVsa19yZWFkKHAxLT5yZWdtYXAsIFJUQ19DT1VOVF9CQVNFLCAmdGltZSwgCj4+IHNp
emVvZih0aW1lKSk7Cj4+ICvCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biByZXQ7Cj4gCj4gSGVsbG8sCj4gCj4gQXJlIHlvdSBzdXJlIHRoYXQgeW91IHJlYWQgdGhlIHRp
bWUgcGFydHMgY29uc2lzdGVudGx5IGhlcmU/IEkgbWVhbjoKPiBpcyB0aGVyZSBhIHJpc2sgdGhh
dCB0aGUgY2xvY2sgaXMgdXBkYXRpbmcgYmVsb3cgeW91IC0gc28gdGhhdCBmb3IKPiBleGFtcGxl
IGR1cmluZyB0aGUgdHJhbnNpdGlvbgoKVGhlIGRvY3VtZW50YXRpb24gc2F5cyB0aGlzOgoKICAg
SWYgbmVlZCB0byByZWFkIHRoZSBjYWxlbmRhciB2YWx1ZSBjdXJyZW50bHkgcmVjb3JkZWQgaW5z
aWRlCiAgIHRoZSBQTUlDLCBuZWVkIHRvIHJlYWQgUlRDX0NPVU5UX1MgZmlyc3QuIEF0IHRoZSBz
YW1lIHRpbWUsCiAgIHRoaXMgb3BlcmF0aW9uIHdpbGwgbGF0Y2ggYWxsIGN1cnJlbnQgY2FsZW5k
YXIgdmFsdWVzIHRvIHRoZQogICByZWdpc3RlcnMgUlRDX0NPVU5UX1MgfiBSVENfQ09VTlRfWS4K
ClRoZSBSVENfQ09VTlRfUyByZWdpc3RlciBpcyB0aGUgZmlyc3Qgb25lIHJlYWQgaW4gdGhlIEky
QwpidWxrIHJlcXVlc3QuICBTbyBJIGNvbmNsdWRlZCB0aGF0IHRoZSByZXF1ZXN0IHdvdWxkIHJl
Y29yZAphIGNvbnNpc3RlbnQgdGltZXN0YW1wIGluIGFsbCA2IHJlZ2lzdGVycy4KClRoYXQgc2Fp
ZCwgdGhlIGRvd25zdHJlYW0gY29kZSBkaWQgYSBsb29wIGFzIHlvdSBkZXNjcmliZS4gIEkKd2ls
bCBhc2sgdGhlIHZlbmRvciBhYm91dCB0aGlzLgoKClJlbGF0ZWQ6ICBJIGRpc2FibGVkIHRoZSBS
VEMgd2hpbGUgdXBkYXRpbmcgKHdoaWNoIGlzIHdoYXQgdGhlCmRvd25zdHJlYW0gY29kZSBkaWQp
LiAgQnV0IGJhc2VkIG9uIHdoYXQgdGhlIGRvY3VtZW50YXRpb24gc2F5cwpJIHNob3VsZG4ndCBu
ZWVkIHRvIGRvIHRoYXQgZWl0aGVyLgoKICAgSWYgbmVlZCB0byByZXNldCB0aGUgY3VycmVudCBj
YWxlbmRhciB2YWx1ZSwgbmVlZCB0bwogICBjb25maWd1cmUgZWFjaCBjYWxlbmRhciB2YWx1ZSAo
UlRDX0NPVU5UX1MgfiBSVENfQ09VTlRfWSkKICAgaW4gb3JkZXIuIEFmdGVyIGZpbmFsbHkgd3Jp
dGluZyB0aGUgcmVnaXN0ZXIgUlRDX0NPVU5UX1ksCiAgIFBNSUMgd2lsbCB1cGRhdGUgdGhlIGNh
bGVuZGFyIHZhbHVlIGNvbmZpZ3VyZWQgYnkgdGhlCiAgIGN1cnJlbnQgdXNlciB0byB0aGUgaW50
ZXJuYWwgdGltZXIgb2YgdGhlIFJUQyBtb2R1bGUsIGFuZAogICBzbyBvbi4KCkhlcmUgdG9vLCB0
aGUgbGFzdCByZWdpc3RlciB3cml0dGVuIGluIHRoZSBidWxrIHJlcXVlc3QgaXMKUlRDX0NPVU5U
X1ksIHNvIGFnYWluIEkgdGhpbmsgYSBjb25zaXN0ZW50IHZhbHVlIHN0b3JlZCBpbgp0aGUgNiBy
ZWdpc3RlcnMgd2lsbCBiZSB1cGRhdGVkIGF0IG9uY2UuCgpFaXRoZXIgd2F5LCBJJ2xsIG1ha2Ug
YW4gaW5xdWlyeSBhYm91dCBib3RoIG9mIHRoZXNlLiAgSSdsbApleHBsYWluIHdoYXQgSSBsZWFy
bmVkIGluIHRoZSBuZXh0IHZlcnNpb24gb2YgdGhpcyBzZXJpZXMsCmFuZCB3aWxsIHVwZGF0ZSB0
aGUgY29kZSBhY2NvcmRpbmdseS4KCj4gMTI6NTk6NTkgLT4gMTM6MDA6MDAKPiAKPiB5b3UgYXJl
IGdvaW5nIHRvIHJlYWQgMTI6MDA6MDAgb3IgMTI6NTk6MDA/Cj4gCj4gSWYgc28sIHlvdSBjb3Vs
ZCBmb3IgZXhhbXBsZSByZWFkIHRoZSB0aW1lIGluIGEgbG9vcCB1bnRpbCB5b3UgZ2V0Cj4gdHdv
IHNhbWUgcmVhZG91dHMuCj4gCj4+ICsKPj4gK8KgwqDCoCB0LT50bV9zZWMgPSB0aW1lW3R1X3Nl
Y29uZF0gJiBHRU5NQVNLKDUsIDApOwo+PiArwqDCoMKgIHQtPnRtX21pbiA9IHRpbWVbdHVfbWlu
dXRlXSAmIEdFTk1BU0soNSwgMCk7Cj4+ICvCoMKgwqAgdC0+dG1faG91ciA9IHRpbWVbdHVfaG91
cl0gJiBHRU5NQVNLKDQsIDApOwo+PiArwqDCoMKgIHQtPnRtX21kYXkgPSAodGltZVt0dV9kYXld
ICYgR0VOTUFTSyg0LCAwKSkgKyAxOwo+PiArwqDCoMKgIHQtPnRtX21vbiA9IHRpbWVbdHVfbW9u
dGhdICYgR0VOTUFTSygzLCAwKTsKPj4gK8KgwqDCoCB0LT50bV95ZWFyID0gKHRpbWVbdHVfeWVh
cl0gJiBHRU5NQVNLKDUsIDApKSArIDEwMDsKPiAKPiBJcyBpdCBuZWNlc3NhcnkgdG8gdXNlIHRo
ZSBiaXRtYXNrcyBoZXJlPyBBcmUgdGhlIGhpZ2hlciBiaXRzIHVuZGVmaW5lZAo+IGluIGhhcmR3
YXJlPyBJZiBzbywgaXMgaXQgbmVjZXNzYXJ5IHRvIG1hc2sgdGhlbSB3aGlsZSB3cml0aW5nIHRo
ZSB0aW1lCj4gaW4gcDFfcnRjX3NldF90aW1lKCk/CgpJdCBpcyBwcm9iYWJseSBub3QgbmVjZXNz
YXJ5IHRvIGRvIHRoZSBiaXRtYXNrLiAgQnV0IHRoZSB1cHBlcgpiaXRzIGFyZSBtYXJrZWQgInJl
c2VydmVkIiBhbmQgc28gSSB0aGUgY29ycmVjdCB0aGluZyB0byBkbyBpcwp0byBleHBsaWNpdGx5
IGlnbm9yZSB0aGVtIChieSBtYXNraW5nIHRoZW0gb2ZmKS4gIElzIHRoZXJlIGEKcmVhc29uIHlv
dSdkIHJhdGhlciB0aGV5IG5vdCBiZSBtYXNrZWQ/CgpUaGVyZSBzaG91bGQgYmUgbm8gbmVlZCB0
byBtYXNrIHRoZW0gaW4gdGhlIHNldF90aW1lKCkgZnVuY3Rpb24uClRoZSBjb3JlIGNvZGUgdmVy
aWZpZXMgYWxsIHZhbHVlcyBhcmUgaW4gcmFuZ2UgYmVmb3JlIGl0IGNhbGxzCnJ0Y19jbGFzc19v
cHMtPnNldF90aW1lKCkuICBTbyB0aGUgdXBwZXIgYml0cyBzaG91bGQgYWxsIGJlIHplcm8KYnkg
dGhlIHRpbWUgcDFfcnRjX3NldF90aW1lKCkgaXMgY2FsbGVkLgoKPj4gK8KgwqDCoCAvKiB0bV93
ZGF5LCB0bV95ZGF5LCBhbmQgdG1faXNkc3QgYXJlbid0IHVzZWQgKi8KPj4gKwo+PiArwqDCoMKg
IHJldHVybiAwOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IHAxX3J0Y19zZXRfdGltZShzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBydGNfdGltZSAqdCkKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1
Y3QgcDFfcnRjICpwMSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+PiArwqDCoMKgIHU4IHRpbWVb
dHVfY291bnRdOwo+PiArwqDCoMKgIGludCByZXQ7Cj4+ICsKPj4gK8KgwqDCoCB0aW1lW3R1X3Nl
Y29uZF0gPSB0LT50bV9zZWM7Cj4+ICvCoMKgwqAgdGltZVt0dV9taW51dGVdID0gdC0+dG1fbWlu
Owo+PiArwqDCoMKgIHRpbWVbdHVfaG91cl0gPSB0LT50bV9ob3VyOwo+PiArwqDCoMKgIHRpbWVb
dHVfZGF5XSA9IHQtPnRtX21kYXkgLSAxOwo+PiArwqDCoMKgIHRpbWVbdHVfbW9udGhdID0gdC0+
dG1fbW9uOwo+PiArwqDCoMKgIHRpbWVbdHVfeWVhcl0gPSB0LT50bV95ZWFyIC0gMTAwOwo+PiAr
Cj4+ICvCoMKgwqAgLyogRGlzYWJsZSB0aGUgUlRDIHRvIHVwZGF0ZTsgcmUtZW5hYmxlIGFnYWlu
IHdoZW4gZG9uZSAqLwo+PiArwqDCoMKgIHJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhwMS0+cmVn
bWFwLCBSVENfQ1RSTCwgUlRDX0VOLCAwKTsKPj4gK8KgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gKwo+PiArwqDCoMKgIHJldCA9IHJlZ21hcF9idWxrX3dy
aXRlKHAxLT5yZWdtYXAsIFJUQ19DT1VOVF9CQVNFLCB0aW1lLCAKPj4gc2l6ZW9mKHRpbWUpKTsK
Pj4gKwo+PiArwqDCoMKgICh2b2lkKXJlZ21hcF91cGRhdGVfYml0cyhwMS0+cmVnbWFwLCBSVENf
Q1RSTCwgUlRDX0VOLCBSVENfRU4pOwoKPiBQZXJoYXBzIHlvdSBzaG91bGRuJ3QgaWdub3JlIGFu
eSBlcnJvcnMgaGVyZSAtIGZhaWxpbmcgdG8gcmVzdGFydAo+IHRoZSBjbG9jayBzaG91bGQgbWFr
ZSBwMV9ydGNfc2V0X3RpbWUoKSByZXR1cm4gYW4gZXJyb3IgY29kZS4KCkkgaW50ZW50aW9uYWxs
eSByZXR1cm4gYW55IGVycm9yIGZyb20gdGhlIGJ1bGsgd3JpdGUgY2FsbC4KCkJ1dCB5b3UncmUg
cmlnaHQ6ICBpZiB0aGF0IGRvZXNuJ3QgaGF2ZSBhbiBlcnJvciBhbmQgcmUtZW5hYmxpbmcKdGhl
IFJUQyBkb2VzLCB0aGF0IGVycm9yIHNob3VsZCBiZSByZXR1cm5lZC4KCkknbSBob3BpbmcgdGhl
cmUncyBubyBuZWVkIHRvIGRpc2FibGUgdGhlIGNsb2NrIGFmdGVyIGFsbCwKYW5kIHRoYXQgd2ls
bCBzaW1wbGlmeSB0aGluZ3MgaGVyZS4gIEJ1dCBlaXRoZXIgd2F5LCBJJ2xsCnRha2UgeW91ciBz
dWdnZXN0aW9uIChidXQgc3RpbGwgcmV0dXJuIHRoZSBmaXJzdCBlcnJvciBpZgptb3JlIHRoYW4g
b25lIG9jY3VycykuCgpUaGFua3MgYSBsb3QgZm9yIHRoZSByZXZpZXcuCgoJCQkJCS1BbGV4Cgo+
PiArCj4+ICvCoMKgwqAgcmV0dXJuIHJldDsKPj4gK30KPj4gKwo+IAo+IEdyZWV0aW5ncywKPiAK
PiBNYXRldXN6Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
