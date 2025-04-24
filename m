Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED50C369D7
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 12:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfrBALJESL7XvfTSkv+AflVzCZGaUTpal6jIa7r27wQ=; b=u91kVzZmTmjrmU
	rynSzTu9BJkWzT06Tv8RMFdgE/9KLajkXdAvGAr72XPwHZtBhyVKh7NQb3IJGHjWWrtNzgvizPqXz
	sH3rDdHri/m9XocV7EP8NmwU64ugmbiE4GYZrpLjWpb4GJaAKiJTldCOSzQEzQ3pM+XyA6nF/FG7d
	fgGbccBGbYXZ2pqBg9ivZOKQJZnBiTlY8ThAF9Oc/CngFHNldIr5xI9fq3PZSgwkRxC37o2Wpb7Ji
	njoPYwYHS5VlPGoG0I1IGt9UvcR7ugNCfe8dRTVFHk2qSxZiNSODKTdLBdtpMLKfljhDVNyu0xURV
	0c1VI2AOAGPlqLIRjndQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7w0d-0000000E55f-1rrA;
	Thu, 24 Apr 2025 12:48:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uDy-0000000DlUn-2myG
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eqhLDRtyKX6rzGIClke4n/FgG558kgab7Vgy/UBFI1M=; b=S1EwHT4iExOqtlrFbZ8YoVzLqX
	KO+aWSUZ1sePWM995tTWyGu+TCqhqCkj4O6b5JAQg+TDx5RizcvIiSq4MKS5edsrkutQMIWfFtAZw
	ISfus9rY88yoflqLAO0K6hi4pWTnC5agflQ5mcN2Iaz/spuUksYGiHSOdofvRv/a311/hUjjgo2Fm
	g82/qE4aqSdtcxsSmZFshSC8VzIyeN0VBrYuVVVepw2Pd8zm/AJLJvBLIQ/ZYNtiYicYPn3z5G39c
	ksXgEpTgGMXGd1akg7gKndVgnR+aQB04a49iziCRJPziNrPheNv5o4GbL7NBS+AqF3NDNNo+YiCQH
	nkXD/f6Q==;
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7uDv-0000000Bkwe-2Ips
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 10:54:33 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C079A3F86E
	for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745492066;
	bh=eqhLDRtyKX6rzGIClke4n/FgG558kgab7Vgy/UBFI1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=lA3x2beTn42Vnn+iR3L1TULXNkMsiwpYXfGmiudKzP6aDXxeRCt6wmGhYG0JCJXeS
	 jOInwyJqhfadcWJcPy3G5L2vCp7v60EF/XJP/8sRpatVDTKXw0BuGs//NIPWuf+tMP
	 G4YgOJq8hvvxzce492P0B2sqnhwUf4/nl6r4eUOaMk/GNc3l8SYQ5qr+RyIvDYKAgY
	 CMn6R1WYeSHr6wDNIw3F8es/NaedWMMQaZdSIyIyU28oEY1CEYSDsNR8fedT2FtE2s
	 2fKbdl5Eagcl5keIn2OYxYvCSxceQkWxMe5nzoxR+cRg/VatjBbYLqJO1RmwavZEZ+
	 3RK5N9sZaOMTA==
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-44059976a1fso3184315e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 03:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492065; x=1746096865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqhLDRtyKX6rzGIClke4n/FgG558kgab7Vgy/UBFI1M=;
        b=XRd8QPnnv1s4s/adQ2gvWk7J+IfMx/g7wDkB6JDyFJpas+QdYXiBO6XFZy2T525BWu
         aFaMkjcFmOeslLuaWaZjI1t80mh+0sp/+fXfLMrcFlmS7+97l5Vhk4IW6KSb4xEB22CX
         /IivNuSXuNWdRTrMsJ0Di4GHBuvYdbanIsnCNAp+5QJmEIUuH/vOdCYSY+RIeFvX8P/r
         rx2LQP1SaRi9VjlOd1WoM5MZAt6q45pjBmVKv8ZKlhvfbT6VvBwZyD3ur9gWPSHMZtH8
         UGI6cLt9Zz+6w9XUOr6I1+gehisJozT7hHIInr8nQ46SZEbNAp1RYMHbrbkwb8Z5b/ll
         lFmw==
X-Forwarded-Encrypted: i=1; AJvYcCVTl6OGzzYr5u534DrvqxfAMyFt2drr8sx0JWReEzJOlK1C2vy2tWgxTFfPLSE0kavEaW+Z+1gHNE/rHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsuaPKHn5ifi8VZx+2dTvbyPyr4T7O173bz7qG4SZkam1qTToM
	bp3YDLXsKYRG2kU4jPszwPkeEtw2BcDwxSbagcxnG0wfbmzbj5IH522y13hvu2yNoQS4LkEU72l
	mrcX1qmvfyO+zRN4B/05BaVu6sMcpmGbWKUHD7u1XZoHiWtzoJx8UGnS8CvtWAJornq0szvIDGc
	A5eguqjg==
X-Gm-Gg: ASbGncvwTlx4dOpnBcAtKWtb1JUObju8Jr+nke2agGuiaM3ZmkXP9toSwLG55RPQyme
	xtFCThOlqf0brYtoTLCs5lqpRkMhaS2xybYSsJrRy3LmI9Cu5f6UQJW1PnkBchg8YdB2nkjRg1g
	/VsHV5hT9qIH3S+/efrsfvDbgwNYmC/5YUo6FhGl46dKJ5mrbxSNpnhiXe4o0ZjBscl+LfBd7c0
	b5hCA4DNJYUWu5LbfnoBZaP3hGrNvLV27ACD/dqVT8E6QBDaLusfJURf3KDDBRZNlqoozjYT391
	GzHzNuGGcvQjJS/yA+r2gNso45L93cwr6j3gEvWCY8rCCTb9idBv4NO1N2z+rR4E9o6Pzq96hfu
	eVDVaCXWJ
X-Received: by 2002:a05:600c:3496:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-4409bd18487mr19911175e9.14.1745492065498;
        Thu, 24 Apr 2025 03:54:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGhodf+3zok9UaV7dC/Fxdnv/pJDOhCCuu5J3ufSCE4NmAhnsJ7ezbZaDbEWPpw7N/az28sg==
X-Received: by 2002:a05:600c:3496:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-4409bd18487mr19910865e9.14.1745492065099;
        Thu, 24 Apr 2025 03:54:25 -0700 (PDT)
Received: from [192.168.103.102] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a152csm16418575e9.12.2025.04.24.03.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 03:54:24 -0700 (PDT)
Message-ID: <25ac53a3-3f3c-4509-ab28-46adbf4f15e6@canonical.com>
Date: Thu, 24 Apr 2025 12:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: E Shattow <e@freeshell.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Maud Spierings <maud_spierings@hotmail.com>,
 Hal Feng <hal.feng@linux.starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
 <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
 <62D89163A60680E7+f0f5a4d4-42f1-454d-9dfe-cf53e2aca4ac@linux.starfivetech.com>
 <cba21857-7eb2-4f10-a1bd-6743ce63dfa6@freeshell.de>
 <ZQ2PR01MB1307ECDF175D20547AC69287E6F1A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <8b0f7b4f-e58a-45ae-931f-2b2853918ab4@freeshell.de>
 <AM7P189MB10099481BDC2CADF476EB755E3CC2@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
 <92745e6b-7c10-4b16-836b-66a1e2ecf1c4@freeshell.de>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <92745e6b-7c10-4b16-836b-66a1e2ecf1c4@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_115431_726664_77413356 
X-CRM114-Status: GOOD (  30.21  )
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

T24gMjQuMDQuMjUgMDc6MTUsIEUgU2hhdHRvdyB3cm90ZToKPiAKPiAKPiBPbiAyLzI4LzI1IDAx
OjU0LCBNYXVkIFNwaWVyaW5ncyB3cm90ZToKPj4KPj4gT24gMi8yOC8yNSA4OjUzIEFNLCBFIFNo
YXR0b3cgd3JvdGU6Cj4+Pgo+Pj4gT24gMi82LzI1IDE5OjAxLCBIYWwgRmVuZyB3cm90ZToKPj4+
Pj4gT24gMDYuMDIuMjUgMTk6MTcsIEUgU2hhdHRvdyB3cm90ZToKPj4+Pj4gT24gMi81LzI1IDE4
OjU5LCBIYWwgRmVuZyB3cm90ZToKPj4+Pj4+IE9uIDIvNS8yMDI1IDY6MDEgUE0sIEhlaW5yaWNo
IFNjaHVjaGFyZHQgd3JvdGU6Cj4+Pj4+Pj4gT24gMi81LzI1IDA4OjU3LCBIYWwgRmVuZyB3cm90
ZToKPj4+Pj4+Pj4gT24gMi8zLzIwMjUgOTozNyBBTSwgRSBTaGF0dG93IHdyb3RlOgo+Pj4+Pj4+
Pj4gQWRkIGJvb3RwaC1wcmUtcmFtIGhpbnRpbmcgdG8gamg3MTEwLWNvbW1vbi5kdHNpOgo+Pj4+
Pj4+Pj4gIMKgwqDCoCAtIGkyYzVfcGlucyBhbmQgaTJjLXBpbnMgc3Vibm9kZSBmb3IgY29ubmVj
dGlvbiB0byBlZXByb20KPj4+Pj4+Pj4+ICDCoMKgwqAgLSBlZXByb20gbm9kZQo+Pj4+Pj4+Pj4g
IMKgwqDCoCAtIHFzcGkgZmxhc2ggY29uZmlndXJhdGlvbiBzdWJub2RlCj4+Pj4+Pj4+PiAgwqDC
oMKgIC0gbWVtb3J5IG5vZGUKPj4+Pj4+Pj4+ICDCoMKgwqAgLSB1YXJ0MCBmb3Igc2VyaWFsIGNv
bnNvbGUKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiAgwqDCoMKgIFdpdGggdGhpcyB0aGUgVS1Cb290IFNQ
TCBzZWNvbmRhcnkgcHJvZ3JhbSBsb2FkZXIgbWF5IGRyb3Agc3VjaAo+Pj4+Pj4+Pj4gIMKgwqDC
oCBvdmVycmlkZXMgd2hlbiB1c2luZyBkdC1yZWJhc2luZyB3aXRoIEpINzExMCBPRl9VUFNUUkVB
TSBib2FyZAo+Pj4+PiB0YXJnZXRzLgo+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRSBTaGF0dG93
IDxlQGZyZWVzaGVsbC5kZT4KPj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4gIMKgwqAgYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kgfCA2ICsrKysrKwo+Pj4+Pj4+
Pj4gIMKgwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1jb21t
b24uZHRzaQo+Pj4+Pj4+Pj4gYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1j
b21tb24uZHRzaQo+Pj4+Pj4+Pj4gaW5kZXggMzBjNWYzNDg3YzhiLi5jOWU3YWU1OWVlN2MgMTAw
NjQ0Cj4+Pj4+Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1j
b21tb24uZHRzaQo+Pj4+Pj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9q
aDcxMTAtY29tbW9uLmR0c2kKPj4+Pj4+Pj4+IEBAIC0yOCw2ICsyOCw3IEBAIGNob3NlbiB7Cj4+
Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgIG1lbW9yeUA0MDAwMDAwMCB7Cj4+Pj4+Pj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPj4+Pj4+Pj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4NDAwMDAwMDAgMHgxIDB4MD47Cj4+Pj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgYm9vdHBoLXByZS1yYW07Cj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgIH07
Cj4+Pj4+Pj4+PiAgwqDCoCDCoMKgwqDCoMKgIGdwaW8tcmVzdGFydCB7Cj4+Pj4+Pj4+PiBAQCAt
MjQ3LDYgKzI0OCw3IEBAIGVtbWNfdmRkOiBhbGRvNCB7Cj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKg
IH07Cj4+Pj4+Pj4+PiAgwqDCoCDCoMKgwqDCoMKgIGVlcHJvbUA1MCB7Cj4+Pj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgYm9vdHBoLXByZS1yYW07Cj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29tcGF0aWJsZSA9ICJhdG1lbCwyNGMwNCI7Cj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVnID0gPDB4NTA+Owo+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhZ2Vz
aXplID0gPDE2PjsKPj4+Pj4+Pj4+IEBAIC0zMjMsNiArMzI1LDcgQEAgJnFzcGkgewo+Pj4+Pj4+
Pj4gIMKgwqDCoMKgwqDCoCBub3JfZmxhc2g6IGZsYXNoQDAgewo+Pj4+Pj4+Pj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7Cj4+Pj4+Pj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDA+Owo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJv
b3RwaC1wcmUtcmFtOwo+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNkbnMscmVhZC1k
ZWxheSA9IDwyPjsKPj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGktbWF4LWZyZXF1
ZW5jeSA9IDwxMDAwMDAwMDA+Owo+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNkbnMs
dHNoc2wtbnMgPSA8MT47Cj4+Pj4+Pj4+PiBAQCAtNDA1LDYgKzQwOCw3IEBAIEdQT0VOX1NZU19J
MkMyX0RBVEEsCj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgIH07Cj4+Pj4+Pj4+PiAgwqDCoCDCoMKg
wqDCoMKgIGkyYzVfcGluczogaTJjNS0wIHsKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBib290
cGgtcHJlLXJhbTsKPj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpMmMtcGlucyB7Cj4+
Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5tdXggPSA8R1BJT01VWCgx
OSwgR1BPVVRfTE9XLAo+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdQT0VOX1NZU19JMkM1X0NMSywgQEAgLTQxMyw2Cj4+
Pj4+Pj4+PiArNDE3LDcgQEAKPj4+Pj4+Pj4+IEdQSV9TWVNfSTJDNV9DTEspPiwKPj4+Pj4+Pj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBHUE9FTl9TWVNfSTJDNV9EQVRBLAo+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdQSV9TWVNfSTJDNV9EQVRBKT47Cj4+
Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaWFzLWRpc2FibGU7IC8qIGV4
dGVybmFsIHB1bGwtdXAgKi8KPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb3Rw
aC1wcmUtcmFtOwo+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5wdXQt
ZW5hYmxlOwo+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5wdXQtc2No
bWl0dC1lbmFibGU7Cj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+Pj4+Pj4+
IEBAIC02NDEsNiArNjQ2LDcgQEAgR1BPRU5fRElTQUJMRSwKPj4+Pj4+Pj4+ICDCoMKgIH07Cj4+
Pj4+Pj4+PiAgwqDCoCDCoCAmdWFydDAgewo+Pj4+Pj4+Pj4gK8KgwqDCoCBib290cGgtcHJlLXJh
bTsKPj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqAgY2xvY2stZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsK
Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4+Pj4+
Pj4+ICDCoMKgwqDCoMKgwqAgcGluY3RybC0wID0gPCZ1YXJ0MF9waW5zPjsKPj4+Pj4+Pj4gV2hh
dCBhYm91dCAmbW1jMCwgJm1tYzEsICZxc3BpLCAmc3lzZ3BpbywgJm1tYzBfcGlucywKPj4+Pj4g
Jm1tYzFfcGlucywgJmkyYzU/Cj4+Pj4+Pj4+IFdoeSBub3QgYWRkICJib290cGgtcHJlLXJhbTsi
IGZvciB0aGVtPwo+Pj4+Pj4+IFdvdWxkIHRoZXkgYmUgbmVlZGVkIGJlZm9yZSByZWxvY2F0aW9u
IG9mIFUtQm9vdCB0byBEUkFNPwo+Pj4+Pj4gWWVhaCwgdGhleSBhcmUgbmVlZGVkIGJ5IFNQTCBh
bmQgdGhleSBhcmUgc2V0IGluIFUtQm9vdAo+Pj4+Pj4gYXJjaC9yaXNjdi9kdHMvamg3MTEwLWNv
bW1vbi11LWJvb3QuZHRzaS4KPj4+Pj4+Cj4+Pj4+PiBCZXN0IHJlZ2FyZHMsCj4+Pj4+PiBIYWwK
Pj4+Pj4+Cj4+Pj4+IFdoZW4gSSB0ZXN0ZWQgb24gU3RhcjY0IHRoZXJlIHdhcyBub25lIG9mIHRo
b3NlIG5lZWRlZCB0byBib290LiBXZQo+Pj4+PiBjYW4gYWRkCj4+Pj4+IG1vcmUgYm9vdHBoLXBy
ZS1yYW0gYXMgbmVlZGVkIGJ1dCBJIHdhbnQgdG8ga25vdyBob3cgdG8gdGVzdCAoYmVjYXVzZSBJ
Cj4+Pj4+IGRpZCBub3Qgc2VlIGFueSBuZWVkIGZvciB0aGVzZSkuCj4+Pj4+Cj4+Pj4+IEhvdyBk
byB5b3UgdGVzdCB0aGF0IHRoZXNlIGFyZSBuZWVkZWQ/Cj4+Pj4gSW4gbXkgb3BpbmlvbiwgU1BM
IG5lZWQgdG8gcmVhZCBVLUJvb3QgZnJvbSBFTU1DIChtbWMwKSBvciBTRGNhcmQKPj4+PiAobW1j
MSkgb3IKPj4+PiBRU1BJIGZsYXNoIChxc3BpKS4gQWxzbyBpdCBuZWVkIHRvIGNob29zZSB0aGUg
Y29ycmVjdCBEVEIgYnkgcmVhZGluZwo+Pj4+IEVFUFJPTQo+Pj4+IG1vdW50ZWQgb24gaTJjNS4g
VG8gcnVuIG1tYyAvIGkyYyBkcml2ZXJzLCB0aGUgcGluIGNvbmZpZ3VyYXRpb25zCj4+Pj4gKHN5
c2dwaW8sIG1tYzAvMV9waW5zKQo+Pj4+IGFyZSBhbHNvIG5lZWRlZC4KPj4+Pgo+Pj4+IEJlc3Qg
cmVnYXJkcywKPj4+PiBIYWwKPj4+IEVNTUMgb3IgU0RjYXJkIGFyZSBub3QgcG9zc2libGUgdG8g
Ym9vdCAodmlhIEpINzExMCBib290IFJPTSwgZGlzdGluY3QKPj4+IGZyb20gUVNQSSBib290IG9m
IFUtQm9vdCBhbmQgbGF0ZXIgRU1NQyBvciBTRGNhcmQgY2FwYWJpbGl0eSkgaW4gdGhpcwo+Pj4g
d2F5IG9uIHNvbWUgb2YgdGhlIGJvYXJkcyB3aGVyZSB0cmFuc2lzdG9yIGxvZ2ljIHBhaXJzIEdQ
SU8wIGFuZCBHUElPMQo+Pj4gYm90aC1vZmYgb3IgYm90aC1vbi4gU0RjYXJkIGJvb3QgaXMgb2Zm
aWNpYWxseSByZWNvbW1lbmRlZCBhZ2FpbnN0IGFzCj4+PiAibm90IHN1cHBvcnRlZCIgYnkgdGhl
IFN0YXJGaXZlIHJlZmVyZW5jZSBkb2N1bWVudGF0aW9uLCBhbmQgSSBzdXBwb3NlCj4+PiB3aGF0
IHJlbWFpbnMgaXMgRU1NQyBib290IGFzIHZhbGlkIHRob3VnaCBJIGhhdmUgbm90IGhlYXJkIG9m
IGFueSB1c2Vycwo+Pj4gZm9yIHRoaXMuCj4+Cj4+Cj4+IEkgdGVuZCB0byB1c2UgU0RjYXJkIGJv
b3Qgb24gbXkgZGVlcGNvbXB1dGluZyBmbWwxM3YwMSBib2FyZCB0byB0ZXN0Cj4+Cj4+IGJlZm9y
ZSBJIGZsYXNoIHRoZSBmaXJtd2FyZSB0byBzcGkgZmxhc2guIEkndmUgbm90IGVuY291bnRlcmVk
IGlzc3Vlcy4gSQo+PiBoYXZlIG5vdCB0cmllZCBlTU1DIGJ1dCBJIGFzc3VtZSBpdCBpcyB0aGUg
c2FtZS4KPj4KPj4+IFdoYXQgaXMgdGhlIHRlc3QgcHJvY2VkdXJlIGZvciBFTU1DIGJvb3QsIGNh
biB5b3UgZXhwbGFpbiBhbmQgSSB3aWxsIHRyeQo+Pj4gaXQgb24gdGhlIFN0YXI2ND8KPj4KPj4K
Pj4gSSBiZWxpZXZlIHRoaXMgcGFnZSBjb250YWlucyBlbm91Z2ggaW5mbyB0byB1c2UgaXQ6Cj4+
Cj4+IGh0dHBzOi8vZG9jcy51LWJvb3Qub3JnL2VuL2xhdGVzdC9ib2FyZC9zdGFyZml2ZS92aXNp
b25maXZlMi5odG1sCj4+Cj4+PiAtRQo+IAo+IEkgZm9sbG93ZWQgdGhhdCBpbmZvIHRvIGdldCBK
SDcxMTAgWkJMIFNEIENhcmQgYm9vdCBtb2RlIHRvIGxvYWQgVS1Cb290Cj4gYnkgYWRkaW5nIG9u
bHkgYm9vdHBoLXByZS1yYW0gdG8gdGhlICZtbWMxIG5vZGUuIEhvd2V2ZXIsIG5vIHN1Y2Nlc3Mg
Zm9yCj4gVS1Cb290IHdpdGggSkg3MTEwIFpCTCBlTU1DIGJvb3QgbW9kZS4gSSBhZGRpdGlvbmFs
bHkgdHJpZWQgdGhlIGJ1aWxkIG9mCj4gVS1Cb290IGFzIHRoZSBTdGFyNjQgYXJyaXZlcyBmcm9t
IGZhY3RvcnksIGFuZCBVLUJvb3QgcmVsZWFzZSAyMDI1LjAxLAo+IGJvdGggd2hpY2ggYXJlIGFs
c28gd29ya2luZyBmb3IgSkg3MTEwIFpCTCBTRCBjYXJkIGJvb3QgbW9kZSBhbmQgbm90Cj4gSkg3
MTEwIFpCTCBlTU1DIGJvb3QgbW9kZS4gT2J2aW91cyB0byBtZSBpcyB0aGF0IHBhZ2UgZG9lcyBu
b3QgY29udGFpbgo+IGVub3VnaCBpbmZvIHRvIHRlc3QgZm9yIGVNTUMsIGFuZC9vciBJIGFtIGRv
aW5nIHRoaXMgd3JvbmcuCj4gCj4gV2hlbiBubyB2YWxpZCBlTU1DIGRldmljZSBpcyBwcmVzZW50
Ogo+IAo+IGR3bWNpX3M6IFJlc3BvbnNlIFRpbWVvdXQuCj4gQk9PVCBmYWlsLEVycm9yIGlzIDB4
ZmZmZmZmZmYKPiBkd21jaV9zOiBSZXNwb25zZSBUaW1lb3V0Lgo+IEJPT1QgZmFpbCxFcnJvciBp
cyAweGZmZmZmZmZmCj4gCj4gV2l0aCB0aGUgcHJlcGFyZWQgZU1NQyBzdG9yYWdlIGNvbm5lY3Rl
ZCB0aGVyZSBpcyBub3QgYW55IG91dHB1dC4KPiAKPiBXaGF0IGlzIHRoZSBwcmVwYXJhdGlvbiBh
bmQgdGVzdCBwcm9jZWR1cmUgZm9yIEpINzExMCBaQkwgZU1NQyBib290IG1vZGU/Cj4gCj4gLUUK
CkhlbGxvIEUsCgpJIGhhdmUgdGVzdGVkIG9uIHRoZSBTdGFyRml2ZSBWaXNpb25GaXZlIDIuCgpZ
b3UgY2FuIHdyaXRlIFUtQm9vdCBTUEwgdG8gc2VjdG9yIDAgb2YgdGhlIGVNTUMgYW5kIGl0IHdp
bGwgYmUgYm9vdGVkLiAKQnV0IHdpdGggb3VyIGNvZGUgaXQgd2lsbCBub3QgZmluZCBtYWluIFUt
Qm9vdC4gKFRoZXJlIHNlZW1zIHRvIGJlIGEgYnVnIAppbiBvdXIgU1BMIGNvZGUgYXMgaXQgZG9l
cyBub3QgZmFsbCBiYWNrIHRvIFktbW9kZW0uKQoKVG8gYWxsb3cgYWRkaW5nIGEgR1BUIHRhYmxl
IHRoZSB2ZW5kb3IgaW1hZ2UgdGhlcmVmb3JlIHVzZXMgdGhlIApmYWxsLWJhY2sgdG8gdGhlIGJh
Y2t1cCBTUEwgYXMgZm9sbG93cy4KCldpdGggdS1ib290LXNwbC5iaW4ubm9ybWFsLm91dCBzdGFy
dGluZyBhdCBzZWN0b3IgNDA5NiAoYnl0ZSAweDIwMDAwMCkgCmFkZCB0aGUgZm9sbG93aW5nIGJ5
dGVzIHRvIHRoZSBHUFQgdGFibGU6CgpQb3NpdGlvbiAweDAwMDA6IDQwIDAyIDAwIDAwICAwMCAw
MCAyMCAwMApQb3NpdGlvbiAweDAyOTA6IDQwIDAyIDAwIDAwICAwMCAwMCAyMCAwMAoKVGhlIHZh
bHVlIDB4MDAwMDAyNDAgaXMgdGhlIG9mZnNldCB0byB0aGUgU1BMIGhlYWRlci4KVGhlIHZhbHVl
IDB4MDAyMDAwMDAgaXMgdGhlIHBvc2l0aW9uIG9mIHRoZSBiYWNrdXAgU1BMLgoKTGlrZXdpc2Ug
d2l0aCB1LWJvb3Qtc3BsLmJpbi5ub3JtYWwub3V0IGF0IHNlY3RvciAyMDQ4IChieXRlIDB4MTAw
MDAwKSB1c2U6CgpQb3NpdGlvbiAweDAwMDA6IDQwIDAyIDAwIDAwICAwMCAwMCAxMCAwMApQb3Np
dGlvbiAweDAyOTA6IDQwIDAyIDAwIDAwICAwMCAwMCAxMCAwMAoKQmVzdCByZWdhcmRzCgpIZWlu
cmljaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
