Return-Path: <SRS0=QYSg=PL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3134C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 05:29:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 751892070C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 05:29:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SHDyj8Tg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWAR6Q46"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 751892070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/tL/gupONJQlMcsZ1PFhCl9tw4sWXl/riU7KXbo7UU0=; b=SHDyj8Tgnm++aYWtO9H1R8tUA
	HfGtA5I4hkmGHRfdkRtY8bEUWMnmxGOKN/9Uap/iY1+/9OxH67k1MueuGyguB2NGwgC/7TjQj7BY2
	xgeTieflVsDt0L6KG4L9vQfQedZtYtMcp6au0cJgy/wBzLEv/bgIiXgdJLten98WMkerguJyA472Y
	46z1taOHj2q4/f8Z1Cdfmm9GMe05FU4U3oDMCBFK9NWM1SpFZMUBqVYPnie0mJN3h3lfhIhGI3kll
	ao7UK94J9rIb97QaLR2R/NObO/s4jrCXgHPxefigq7huHLxCrQyblx4PrzL5VSreDwguNxTsTSUo0
	hB35j4RMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gevZ5-000840-8t; Thu, 03 Jan 2019 05:29:07 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gevZ2-00083a-Os
 for linux-riscv@lists.infradead.org; Thu, 03 Jan 2019 05:29:06 +0000
Received: by mail-pf1-x444.google.com with SMTP id g62so16155238pfd.12
 for <linux-riscv@lists.infradead.org>; Wed, 02 Jan 2019 21:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sozTP1EJHmpZigf3uOcS0IWTm+/M6a3+0W1MY+dDY7U=;
 b=hWAR6Q46vTDYWegZLGOoQYf6GlqbPj1VLJmxluPK6Q+28WelGjIThSpxojqK/7rzTD
 TOAYigTTD700cU1clAyvdk4u3Zf9NtoQC6gjLPB33UJ9Jj5KhWUBcBlgTObOq1aM5dtQ
 vPc7G0lZAo9/8WysDauWtsE9ybo4R3gVsXTO2G8Gtv9a6ah8UoRCvfMbea+QoSsbx/8i
 bAsVNFZP3/B0UeM+KYG0y9uQWmmBK2XFcGXb8vpKp5ycEvXjgyzOFtA42mhh75CV/2sh
 QIz4ZghA4ez0w0p0/bMeQWWMBFKOVTj9tPU2KpHXbe/TYt4e9v47g+xHshenXkBPKX1W
 WdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sozTP1EJHmpZigf3uOcS0IWTm+/M6a3+0W1MY+dDY7U=;
 b=M9tfiI1h+JNrbtHrzuIPLrsnqRKxgNPOPlNWeqoxttc7+n8ZLqXmfvxVqGzO6xraKE
 RgT96uEZZv8BuA69IIcJxtArjo8zFjknMN6NA1Eyrd+FPaes5e8BBlPfAHay1KAO/7h4
 EunClydmzUe2hkV6WSOBpMkddGTwQpRuOefYgDUBpsNAXuq40q46PSo+VZoGSo5D42yi
 6D9Qufu2r0VdcJ1eNohpzlhpun1Ai6Rx2hrOhzH1a7OHlhnYiPW5UogwJcpcsqmVbOSc
 HfWhh61IvAYdq4frPZ1AnyvzqbQjFOjqjQ8ZwFMxTT4K46x3A1Uoj2jG4ZFHC4sqIPP0
 JsJA==
X-Gm-Message-State: AJcUukcRdkaPIAudkVe4Y7iJn5lpaMzPnByWFn10smW2uRx/QCK2HO3U
 8+WgPvhbSx20gikj6iXstmM=
X-Google-Smtp-Source: ALg8bN4aNLiBLpNpMED+Q1Pkk+wVMgDYtOgrsa/h6NLQ8/XrbxYZTRqrWERlvj5fC7wWkWgttQ3lng==
X-Received: by 2002:a63:c42:: with SMTP id 2mr15984873pgm.372.1546493343101;
 Wed, 02 Jan 2019 21:29:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 5sm98655781pfz.149.2019.01.02.21.29.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Jan 2019 21:29:01 -0800 (PST)
Subject: Re: [PATCH] RISC-V: Add CONFIG_PREEMPT=y to defconfig
To: Vincent Chen <deanbo422@gmail.com>
References: <20181226032350.GA27044@roeck-us.net>
 <mhng-856d9dbc-a4f1-47c3-a71c-d1f7ae82184b@palmer-si-x1c4>
 <CAJsyPhyA_u2Syoq1tN73qx=sgddb1KS9DY7Tn98jetoCU+R8ug@mail.gmail.com>
 <122457cb-bf56-0d47-3f30-2e2beecccd7f@roeck-us.net>
 <CAJsyPhyL-RQh3Z6Snb8ARdymJsK0yM7AXGSvwZOxjfBgenjo9g@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <195292a9-d800-1dde-182e-fd09ee04de8b@roeck-us.net>
Date: Wed, 2 Jan 2019 21:29:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJsyPhyL-RQh3Z6Snb8ARdymJsK0yM7AXGSvwZOxjfBgenjo9g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190102_212904_843397_6EC337F5 
X-CRM114-Status: GOOD (  20.38  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 aou@eecs.berkeley.edu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMS8yLzE5IDk6MjEgUE0sIFZpbmNlbnQgQ2hlbiB3cm90ZToKPiBHdWVudGVyIFJvZWNrIDxs
aW51eEByb2Vjay11cy5uZXQ+IOaWvCAyMDE55bm0MeaciDPml6Ug6YCx5ZubIOS4iuWNiDExOjUx
5a+r6YGT77yaCj4+Cj4+IE9uIDEvMi8xOSA2OjU5IFBNLCBWaW5jZW50IENoZW4gd3JvdGU6Cj4+
PiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHNpZml2ZS5jb20+IOaWvCAyMDE45bm0MTLmnIgyN+aX
pSDpgLHlm5sg5LiK5Y2IMToxOeWvq+mBk++8mgo+Pj4+Cj4+Pj4gT24gVHVlLCAyNSBEZWMgMjAx
OCAxOToyMzo1MCBQU1QgKC0wODAwKSwgbGludXhAcm9lY2stdXMubmV0IHdyb3RlOgo+Pj4+PiBP
biBXZWQsIERlYyAxOSwgMjAxOCBhdCAwOToyNToyMVBNIC0wODAwLCBHdWVudGVyIFJvZWNrIHdy
b3RlOgo+Pj4+Pj4gT24gV2VkLCBEZWMgMTksIDIwMTggYXQgMDU6NDU6MTFQTSAtMDgwMCwgR3Vl
bnRlciBSb2VjayB3cm90ZToKPj4+Pj4+PiBPbiBXZWQsIE5vdiAyMSwgMjAxOCBhdCAxMDo1ODow
NUFNIC0wODAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4+Pj4+Pj4gSSBkb24ndCByZW1lbWJl
ciB3aG8gc3VnZ2VzdGVkIHRoaXMsIGJ1dCBJIHdhcyB0YWxraW5nIHRvIHNvbWVvbmUgYXQKPj4+
Pj4+Pj4gUGx1bWJlcnMgYWJvdXQgYWxsIHRoZSBob3JyaWJsZSBidWdzIHdlJ3ZlIGhhZCBsdXJr
aW5nIGFyb3VuZCBpbiBvdXIKPj4+Pj4+Pj4gcG9ydCBkZXNwaXRlIGl0IHN0aWxsIGdldHRpbmcg
dG8gdXNlcnNwYWNlIGFuZCB0aGV5IHN1Z2dlc3RlZCB0aGF0IEkKPj4+Pj4+Pj4gZW5hYmxlIENP
TkZJR19QUkVFTVBUIGluIG91ciBkZWZjb25maWcgYXMgaXQnbGwgaGVscCBzaGFrZSBvdXQgbW9y
ZQo+Pj4+Pj4+PiBpc3N1ZXMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoaXMgcGF0Y2ggZW5hYmxlcyBD
T05GSUdfUFJFRU1QVCBpbiB0aGUgc2luZ2xlIFJJU0MtViBkZWZjb25maWcuICBJdAo+Pj4+Pj4+
PiBzdGlsbCBwYXNzZXMgbXkgdGVzdHMgKGllLCBib290aW5nIEZlZG9yYSBvbiBRRU1VKS4gIE1h
eWJlIEknbSB0b28KPj4+Pj4+Pj4gcGFyYW5vaWQsIGJ1dCBJIHN0aWxsIGRvbid0IHRydXN0IG91
ciBwb3J0IGVub3VnaCB0byBqdXN0IHB1bGwgdGhlCj4+Pj4+Pj4+IHRyaWdnZXIgb24gdGhpcyB3
aXRob3V0IGF0IGxlYXN0IGFjY3VtdWxhdGluZyBzb21lICJUZXN0ZWQtYnkicyBvbiBpdC4KPj4+
Pj4+Pj4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBzaWZp
dmUuY29tPgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBjYW4gb25seSBnaXZlIHlvdSBhCj4+Pj4+Pj4KPj4+
Pj4+PiBGYWlscy1taXNlcmFibHktZm9yOiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5u
ZXQ+Cj4+Pj4+Pj4KPj4+Pj4+PiBOb3QgdGhlIG5ldyBkZWZjb25maWcgaXRzZWxmLCBidXQgdGhl
IG5ldyBkZWZjb25maWcgcGx1cyBhIHZhcmlldHkgb2YKPj4+Pj4+PiBzZWxmdGVzdCBvcHRpb25z
LiBJIGRvbid0IGtub3cgd2hhdCBleGFjdGx5IGlzIGZhaWxpbmcsIGJ1dCBoZXJlIGlzCj4+Pj4+
Pj4gbXkgbGlzdCBvZiBlbmFibGVkIHNlbGZ0ZXN0cyBvbiB0b3Agb2YgZGVmY29uZmlnOgo+Pj4+
Pj4+Cj4+Pj4+Pj4gQ09ORklHX0NSWVBUT19NQU5BR0VSX0RJU0FCTEVfVEVTVFM9eQo+Pj4+Pj4+
IENPTkZJR19DUkMzMl9TRUxGVEVTVD15Cj4+Pj4+Pj4gQ09ORklHX0RFQlVHX0xPQ0tJTkdfQVBJ
X1NFTEZURVNUUz15Cj4+Pj4+Pj4gQ09ORklHX0RFQlVHX05NSV9TRUxGVEVTVD15Cj4+Pj4+Pj4g
Q09ORklHX0RFQlVHX1JPREFUQV9URVNUPXkKPj4+Pj4+PiBDT05GSUdfREVCVUdfVExCRkxVU0g9
eQo+Pj4+Pj4+IENPTkZJR19ETUFURVNUPXkKPj4+Pj4+PiBDT05GSUdfR0xPQl9TRUxGVEVTVD15
Cj4+Pj4+Pj4gQ09ORklHX09GX1VOSVRURVNUPXkKPj4+Pj4+PiBDT05GSUdfUENJX0VQRl9URVNU
PXkKPj4+Pj4+PiBDT05GSUdfUENJX0VORFBPSU5UX1RFU1Q9eQo+Pj4+Pj4+IENPTkZJR19QUk9W
RV9MT0NLSU5HPXkKPj4+Pj4+PiBDT05GSUdfUFJPVkVfUkNVPXkKPj4+Pj4+PiBDT05GSUdfUkNV
X0VRU19ERUJVRz15Cj4+Pj4+Pj4gQ09ORklHX1NUQVRJQ19LRVlTX1NFTEZURVNUPXkKPj4+Pj4+
PiBDT05GSUdfU1RSSU5HX1NFTEZURVNUPXkKPj4+Pj4+PiBDT05GSUdfVEVTVF9CSVRNQVA9eQo+
Pj4+Pj4+IENPTkZJR19URVNUX0ZJUk1XQVJFPXkKPj4+Pj4+PiBDT05GSUdfVEVTVF9TT1JUPXkK
Pj4+Pj4+PiBDT05GSUdfVEVTVF9TWVNDVEw9eQo+Pj4+Pj4+IENPTkZJR19URVNUX1VVSUQ9eQo+
Pj4+Pj4+IENPTkZJR19VU0JfVEVTVD15Cj4+Pj4+Pj4gQ09ORklHX1VTQl9FSFNFVF9URVNUX0ZJ
WFRVUkU9eQo+Pj4+Pj4+IENPTkZJR19VU0JfTElOS19MQVlFUl9URVNUPXkKPj4+Pj4+PiBDT05G
SUdfV1dfTVVURVhfU0VMRlRFU1Q9eQo+Pj4+Pj4+IENPTkZJR19UT1JUVVJFX1RFU1Q9eQo+Pj4+
Pj4+IENPTkZJR19MT0NLX1RPUlRVUkVfVEVTVD15Cj4+Pj4+Pj4gQ09ORklHX1JDVV9UT1JUVVJF
X1RFU1Q9eQo+Pj4+Pj4+IENPTkZJR19SQlRSRUVfVEVTVD15Cj4+Pj4+Pj4gQ09ORklHX0lOVEVS
VkFMX1RSRUVfVEVTVD15Cj4+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBVcGRhdGU6IGRlZmNvbmZpZytD
T05GSUdfTE9DS19UT1JUVVJFX1RFU1Q9eSBjYXVzZXMgdGhlIGhhbmcKPj4+Pj4+IGlmIENPTkZJ
R19QUkVFTVBUPXkuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBBbm90aGVyIHVwZGF0ZS4gQ09ORklHX1JD
VV9UT1JUVVJFX1RFU1Q9eSBvciBDT05GSUdfV1dfTVVURVhfU0VMRlRFU1Q9eQo+Pj4+PiBhbHNv
IHJlc3VsdCBpbiBoYW5ncywgb25seSBhIGJpdCBsYXRlci4gSSBoYXZlIG5vdyBkaXNhYmxlZCBh
bGwgdGhyZWUgdGVzdAo+Pj4+PiBvcHRpb25zIGluIG15IHJpc2N2IGJvb3QgdGVzdHMgaWYgQ09O
RklHX1BSRUVNUFQ9eS4gVGhlIGxhY2sgb2YgZXJyb3IKPj4+Pj4gcmVwb3J0cyBpbiB0aGUgZnV0
dXJlIGRvZXMgX25vdF8gbWVhbiB0aGF0IHRoZSBwcm9ibGVtIGhhcyBtYWdpY2FsbHkKPj4+Pj4g
ZGlzYXBwZWFyZWQuIEkganVzdCBmaW5kIGl0IHBvaW50bGVzcyB0byBrZWVwIHRlc3RpbmcgYSBr
bm93biBicm9rZW4KPj4+Pj4gY29uZmlndXJhdGlvbiwgZXZlbiBtb3JlIHNvIHNpbmNlIGRvaW5n
IHNvIHdvdWxkIGhpZGUgb3RoZXIgcG90ZW50aWFsCj4+Pj4+IHByb2JsZW1zLgo+Pj4+Cj4+Pj4g
VGhhbmtzLiAgSSBhZ3JlZSBpdCdzIHBvaW50bGVzcyB0byB0ZXN0IG1vcmUsIGFzIHRoZXJlIGFw
cGVhciB0byBiZSBsb3RzIG9mCj4+Pj4gYnVncyB0byBmaXggYWxyZWFkeSBhbmQgdGhpcyB3aWxs
IGp1c3QgbWFzayBvdGhlciBidWdzLgo+Pj4+Cj4+Pgo+Pj4gTGFzdCB3ZWVrLCBJIGVuY291bnRl
cmVkIHNvbWUgbG9ja2luZyBpc3N1ZXMgaW4gdGhlIGtlcm5lbCwgc28gSSB0cmllZAo+Pj4gdG8g
dGVzdCB0aGUKPj4+IGtlcm5lbCB3aXRoIHNvbWUgcmVsYXRpdmUgc2VsZnRlc3RzLiBTaW5jZSBJ
IGhhZCBhbHJlYWR5IHNldCBDT05GSUdfUFJFRU1QVD15LAo+Pj4gSSBlbmNvdW50ZXJlZCB0aGUg
c2FtZSByZXN1bHRzIGluIFJDVV9UT1JUVVJFX1RFU1QgYW5kCj4+PiBMT0NLX1RPUlRVUkVfVEVT
VC4gSSB0cmllZCB0byBkZWJ1ZyBpdCBhbmQgZm91bmQgdGhlIGhhbmcgd2FzIGR1ZSB0bwo+Pj4g
dGhlIGxhY2sgb2YgX1RJRl9ORUVEX1JFU0NIRUQgY2hlY2sgZm9yIGtlcm5lbCB0aHJlYWRzIGlu
IGVudHJ5LlMuIEkgd2lsbCBzZW5kIGEKPj4+IHBhdGNoIHRvIHNvbHZlIHRoaXMgcHJvYmxlbSBh
bmQgSSBob3BlIHlvdSBjYW4gZ2l2ZSBtZSBzb21lIGNvbW1lbnRzCj4+PiBpZiB5b3UgZmluZCBz
b21lCj4+PiBtaXN0YWtlcy4KPj4+Cj4+Cj4+IEknbGwgYmUgaGFwcHkgdG8gcnVuIGEgc2V0IG9m
IHRlc3RzIGlmIHlvdSBDYzogbWUgb24gdGhlIHBhdGNoLgo+Pgo+PiBHdWVudGVyCj4gCj4gU29y
cnksIEkgaGF2ZSBzZW50IHRoaXMgcGF0Y2ggYnV0IEkgZm9yZ2V0IHRvIGFkZCB5b3UgdG8gdGhl
IENjIGxpc3QuCj4gSSB3aWxsIHNlbmQgeW91IHRoaXMgcGF0Y2ggYWdhaW4gYW5kIHBsZWFzZSBo
ZWxwIG1lIHRvIHJ1biBhIHNldCBvZiB0ZXN0cy4KCk5vIG5lZWQgdG8gcmVzZW5kOyBJIHBpY2tl
ZCBpdCB1cCBmcm9tIHBhdGNod29yay4gUnVubmluZyBhIHRlc3Qgbm93LgoKR3VlbnRlcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
