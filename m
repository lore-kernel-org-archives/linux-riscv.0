Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90163C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 19:24:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A1A420827
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 19:24:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ovDN0e9U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="knCd2kQF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A1A420827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=N5/l4A6WQ3tUruW017Z98vU7VQIeVXG37UDWwQbNevk=; b=ovDN0e9UuPlkNV+l3gQpIQzPY
	YWdVCvWswMYr8Otdsr2S1ZX3UPxhRU7k0R8oyOHXEzAQcqpO9gYGpaWeJFuykIqCQAIkp2DzOzGFE
	obNvm0LdB+uwCUfKqAMfaaCtjlLkEYNUuXXcLSt6UAjCaaUPLpRAsNfiAqCMKaLMWv2LhCj2phHZA
	mPgB4j8CE2I/JTd/t4trLLrbx8p7a0qlni9ZDTCpDuHqn8BokiJMoz5kO9K59VhPMSJBNWpOWzQA/
	SNaaDVx9N0vnmUvmVa+yjCJKM4SoE84i7CvaibagUjARUwtDCpXqDER3rCy+sPJZin6oANMqy/ZP+
	ZbrSZP79g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggwzb-0004wO-Q2; Tue, 08 Jan 2019 19:24:51 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggwzY-0004vq-Kf
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 19:24:50 +0000
Received: by mail-pg1-x544.google.com with SMTP id d72so2146358pga.9
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 11:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lqkV0kApo1CvV9ulBh0yxWAnca8+JWegJ2o32n4SucQ=;
 b=knCd2kQFvOSI9KPMwynw/4/cYd7WNurLJGE1a0KBsrRFVzqwj0DL/vOWdekHLdAs6M
 GEiinU9Es/sGRM5NIbFP04iFDvJ5hWuOy05aKxMMLdxyaLxBCwXhZmf32CkreTqf+tez
 2ql9N3mIaVbf1OkznUl2PZkggtpMjg5utO7GD4WpZVygfUpEqCxrWe99WqHJ4x6Hn0Er
 NGkobFwg92MX55qjMqqfnfUa5zyzronVFm13+/DbDqj7f65p1aJxvrsd0d8zjIgtrmXr
 uTcW5J/qpv+RoGvIAi2XQvkx/3UfdKWiqKgquCjGyEdV/WmgOSB/EaZGbUAFRz8CskKS
 IQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lqkV0kApo1CvV9ulBh0yxWAnca8+JWegJ2o32n4SucQ=;
 b=lTf3DIOkyDrs5E7rR1MBHAGqjiV/N9BkHCwzlbKOVQXwbd0tqO9pd7ns+P5cNJwmF1
 sCF8Vvi0OimNTEnYwPQWEI5UwNqOjA1dqGPxUAy6LsRICLeU+6Z/FIZXMwExF1qqXTv+
 DisotmWHEPuh0BnrWLX4TXLODMRLydJ3WpwFeXuJ/Y0AUpUcusItWXxcm0CEi2KmFp1e
 IV78O60pFEOiNZtR5Cwf7WLdTT3Qm3WnJuoW4V/YPYnoEHa/ckYhW7gp+tKOo/BvHhJm
 ZsUAdmtwKr7O5K/cOIcXLx7n6nc8dzL4z1ttIL+ceUKesZDKHnS8tSDFF48Tda+34aQB
 or6A==
X-Gm-Message-State: AJcUukcfXHsQZQFgRyZNapsia3Ahr01zPVHkxsTrtDZh+uzZffCZSo9M
 pLM6DK1pZ2XijkvRCFNDQ3OLXg==
X-Google-Smtp-Source: ALg8bN5Atpy7S+7Q0VdGG2GhLYjWAYigUZRpCLfNrSwcm4NUKicNDJXCLsOnMSYFQlkcXRP8CoVvVg==
X-Received: by 2002:aa7:868f:: with SMTP id d15mr2909887pfo.225.1546975483332; 
 Tue, 08 Jan 2019 11:24:43 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i5sm5983984pfg.34.2019.01.08.11.24.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Jan 2019 11:24:42 -0800 (PST)
Date: Tue, 08 Jan 2019 11:24:42 -0800 (PST)
X-Google-Original-Date: Tue, 08 Jan 2019 11:24:29 PST (-0800)
Subject: Re: [PATCH] RISC-V: Add CONFIG_PREEMPT=y to defconfig
In-Reply-To: <CAJsyPhyA_u2Syoq1tN73qx=sgddb1KS9DY7Tn98jetoCU+R8ug@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: deanbo422@gmail.com
Message-ID: <mhng-5d92eece-dfdc-4161-a594-c1f26712769d@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_112448_687318_DA319E76 
X-CRM114-Status: GOOD (  26.75  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, linux@roeck-us.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwMiBKYW4gMjAxOSAxODo1OToxMSBQU1QgKC0wODAwKSwgZGVhbmJvNDIyQGdtYWls
LmNvbSB3cm90ZToKPiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHNpZml2ZS5jb20+IOaWvCAyMDE4
5bm0MTLmnIgyN+aXpSDpgLHlm5sg5LiK5Y2IMToxOeWvq+mBk++8mgo+Pgo+PiBPbiBUdWUsIDI1
IERlYyAyMDE4IDE5OjIzOjUwIFBTVCAoLTA4MDApLCBsaW51eEByb2Vjay11cy5uZXQgd3JvdGU6
Cj4+ID4gT24gV2VkLCBEZWMgMTksIDIwMTggYXQgMDk6MjU6MjFQTSAtMDgwMCwgR3VlbnRlciBS
b2VjayB3cm90ZToKPj4gPj4gT24gV2VkLCBEZWMgMTksIDIwMTggYXQgMDU6NDU6MTFQTSAtMDgw
MCwgR3VlbnRlciBSb2VjayB3cm90ZToKPj4gPj4gPiBPbiBXZWQsIE5vdiAyMSwgMjAxOCBhdCAx
MDo1ODowNUFNIC0wODAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4gPj4gPiA+IEkgZG9uJ3Qg
cmVtZW1iZXIgd2hvIHN1Z2dlc3RlZCB0aGlzLCBidXQgSSB3YXMgdGFsa2luZyB0byBzb21lb25l
IGF0Cj4+ID4+ID4gPiBQbHVtYmVycyBhYm91dCBhbGwgdGhlIGhvcnJpYmxlIGJ1Z3Mgd2UndmUg
aGFkIGx1cmtpbmcgYXJvdW5kIGluIG91cgo+PiA+PiA+ID4gcG9ydCBkZXNwaXRlIGl0IHN0aWxs
IGdldHRpbmcgdG8gdXNlcnNwYWNlIGFuZCB0aGV5IHN1Z2dlc3RlZCB0aGF0IEkKPj4gPj4gPiA+
IGVuYWJsZSBDT05GSUdfUFJFRU1QVCBpbiBvdXIgZGVmY29uZmlnIGFzIGl0J2xsIGhlbHAgc2hh
a2Ugb3V0IG1vcmUKPj4gPj4gPiA+IGlzc3Vlcy4KPj4gPj4gPiA+Cj4+ID4+ID4gPiBUaGlzIHBh
dGNoIGVuYWJsZXMgQ09ORklHX1BSRUVNUFQgaW4gdGhlIHNpbmdsZSBSSVNDLVYgZGVmY29uZmln
LiAgSXQKPj4gPj4gPiA+IHN0aWxsIHBhc3NlcyBteSB0ZXN0cyAoaWUsIGJvb3RpbmcgRmVkb3Jh
IG9uIFFFTVUpLiAgTWF5YmUgSSdtIHRvbwo+PiA+PiA+ID4gcGFyYW5vaWQsIGJ1dCBJIHN0aWxs
IGRvbid0IHRydXN0IG91ciBwb3J0IGVub3VnaCB0byBqdXN0IHB1bGwgdGhlCj4+ID4+ID4gPiB0
cmlnZ2VyIG9uIHRoaXMgd2l0aG91dCBhdCBsZWFzdCBhY2N1bXVsYXRpbmcgc29tZSAiVGVzdGVk
LWJ5InMgb24gaXQuCj4+ID4+ID4gPgo+PiA+PiA+ID4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERh
YmJlbHQgPHBhbG1lckBzaWZpdmUuY29tPgo+PiA+PiA+Cj4+ID4+ID4gSSBjYW4gb25seSBnaXZl
IHlvdSBhCj4+ID4+ID4KPj4gPj4gPiBGYWlscy1taXNlcmFibHktZm9yOiBHdWVudGVyIFJvZWNr
IDxsaW51eEByb2Vjay11cy5uZXQ+Cj4+ID4+ID4KPj4gPj4gPiBOb3QgdGhlIG5ldyBkZWZjb25m
aWcgaXRzZWxmLCBidXQgdGhlIG5ldyBkZWZjb25maWcgcGx1cyBhIHZhcmlldHkgb2YKPj4gPj4g
PiBzZWxmdGVzdCBvcHRpb25zLiBJIGRvbid0IGtub3cgd2hhdCBleGFjdGx5IGlzIGZhaWxpbmcs
IGJ1dCBoZXJlIGlzCj4+ID4+ID4gbXkgbGlzdCBvZiBlbmFibGVkIHNlbGZ0ZXN0cyBvbiB0b3Ag
b2YgZGVmY29uZmlnOgo+PiA+PiA+Cj4+ID4+ID4gQ09ORklHX0NSWVBUT19NQU5BR0VSX0RJU0FC
TEVfVEVTVFM9eQo+PiA+PiA+IENPTkZJR19DUkMzMl9TRUxGVEVTVD15Cj4+ID4+ID4gQ09ORklH
X0RFQlVHX0xPQ0tJTkdfQVBJX1NFTEZURVNUUz15Cj4+ID4+ID4gQ09ORklHX0RFQlVHX05NSV9T
RUxGVEVTVD15Cj4+ID4+ID4gQ09ORklHX0RFQlVHX1JPREFUQV9URVNUPXkKPj4gPj4gPiBDT05G
SUdfREVCVUdfVExCRkxVU0g9eQo+PiA+PiA+IENPTkZJR19ETUFURVNUPXkKPj4gPj4gPiBDT05G
SUdfR0xPQl9TRUxGVEVTVD15Cj4+ID4+ID4gQ09ORklHX09GX1VOSVRURVNUPXkKPj4gPj4gPiBD
T05GSUdfUENJX0VQRl9URVNUPXkKPj4gPj4gPiBDT05GSUdfUENJX0VORFBPSU5UX1RFU1Q9eQo+
PiA+PiA+IENPTkZJR19QUk9WRV9MT0NLSU5HPXkKPj4gPj4gPiBDT05GSUdfUFJPVkVfUkNVPXkK
Pj4gPj4gPiBDT05GSUdfUkNVX0VRU19ERUJVRz15Cj4+ID4+ID4gQ09ORklHX1NUQVRJQ19LRVlT
X1NFTEZURVNUPXkKPj4gPj4gPiBDT05GSUdfU1RSSU5HX1NFTEZURVNUPXkKPj4gPj4gPiBDT05G
SUdfVEVTVF9CSVRNQVA9eQo+PiA+PiA+IENPTkZJR19URVNUX0ZJUk1XQVJFPXkKPj4gPj4gPiBD
T05GSUdfVEVTVF9TT1JUPXkKPj4gPj4gPiBDT05GSUdfVEVTVF9TWVNDVEw9eQo+PiA+PiA+IENP
TkZJR19URVNUX1VVSUQ9eQo+PiA+PiA+IENPTkZJR19VU0JfVEVTVD15Cj4+ID4+ID4gQ09ORklH
X1VTQl9FSFNFVF9URVNUX0ZJWFRVUkU9eQo+PiA+PiA+IENPTkZJR19VU0JfTElOS19MQVlFUl9U
RVNUPXkKPj4gPj4gPiBDT05GSUdfV1dfTVVURVhfU0VMRlRFU1Q9eQo+PiA+PiA+IENPTkZJR19U
T1JUVVJFX1RFU1Q9eQo+PiA+PiA+IENPTkZJR19MT0NLX1RPUlRVUkVfVEVTVD15Cj4+ID4+ID4g
Q09ORklHX1JDVV9UT1JUVVJFX1RFU1Q9eQo+PiA+PiA+IENPTkZJR19SQlRSRUVfVEVTVD15Cj4+
ID4+ID4gQ09ORklHX0lOVEVSVkFMX1RSRUVfVEVTVD15Cj4+ID4+ID4KPj4gPj4KPj4gPj4gVXBk
YXRlOiBkZWZjb25maWcrQ09ORklHX0xPQ0tfVE9SVFVSRV9URVNUPXkgY2F1c2VzIHRoZSBoYW5n
Cj4+ID4+IGlmIENPTkZJR19QUkVFTVBUPXkuCj4+ID4+Cj4+ID4KPj4gPiBBbm90aGVyIHVwZGF0
ZS4gQ09ORklHX1JDVV9UT1JUVVJFX1RFU1Q9eSBvciBDT05GSUdfV1dfTVVURVhfU0VMRlRFU1Q9
eQo+PiA+IGFsc28gcmVzdWx0IGluIGhhbmdzLCBvbmx5IGEgYml0IGxhdGVyLiBJIGhhdmUgbm93
IGRpc2FibGVkIGFsbCB0aHJlZSB0ZXN0Cj4+ID4gb3B0aW9ucyBpbiBteSByaXNjdiBib290IHRl
c3RzIGlmIENPTkZJR19QUkVFTVBUPXkuIFRoZSBsYWNrIG9mIGVycm9yCj4+ID4gcmVwb3J0cyBp
biB0aGUgZnV0dXJlIGRvZXMgX25vdF8gbWVhbiB0aGF0IHRoZSBwcm9ibGVtIGhhcyBtYWdpY2Fs
bHkKPj4gPiBkaXNhcHBlYXJlZC4gSSBqdXN0IGZpbmQgaXQgcG9pbnRsZXNzIHRvIGtlZXAgdGVz
dGluZyBhIGtub3duIGJyb2tlbgo+PiA+IGNvbmZpZ3VyYXRpb24sIGV2ZW4gbW9yZSBzbyBzaW5j
ZSBkb2luZyBzbyB3b3VsZCBoaWRlIG90aGVyIHBvdGVudGlhbAo+PiA+IHByb2JsZW1zLgo+Pgo+
PiBUaGFua3MuICBJIGFncmVlIGl0J3MgcG9pbnRsZXNzIHRvIHRlc3QgbW9yZSwgYXMgdGhlcmUg
YXBwZWFyIHRvIGJlIGxvdHMgb2YKPj4gYnVncyB0byBmaXggYWxyZWFkeSBhbmQgdGhpcyB3aWxs
IGp1c3QgbWFzayBvdGhlciBidWdzLgo+Pgo+Cj4gTGFzdCB3ZWVrLCBJIGVuY291bnRlcmVkIHNv
bWUgbG9ja2luZyBpc3N1ZXMgaW4gdGhlIGtlcm5lbCwgc28gSSB0cmllZAo+IHRvIHRlc3QgdGhl
Cj4ga2VybmVsIHdpdGggc29tZSByZWxhdGl2ZSBzZWxmdGVzdHMuIFNpbmNlIEkgaGFkIGFscmVh
ZHkgc2V0IENPTkZJR19QUkVFTVBUPXksCj4gSSBlbmNvdW50ZXJlZCB0aGUgc2FtZSByZXN1bHRz
IGluIFJDVV9UT1JUVVJFX1RFU1QgYW5kCj4gTE9DS19UT1JUVVJFX1RFU1QuIEkgdHJpZWQgdG8g
ZGVidWcgaXQgYW5kIGZvdW5kIHRoZSBoYW5nIHdhcyBkdWUgdG8KPiB0aGUgbGFjayBvZiBfVElG
X05FRURfUkVTQ0hFRCBjaGVjayBmb3Iga2VybmVsIHRocmVhZHMgaW4gZW50cnkuUy4gSSB3aWxs
IHNlbmQgYQo+IHBhdGNoIHRvIHNvbHZlIHRoaXMgcHJvYmxlbSBhbmQgSSBob3BlIHlvdSBjYW4g
Z2l2ZSBtZSBzb21lIGNvbW1lbnRzCj4gaWYgeW91IGZpbmQgc29tZQo+IG1pc3Rha2VzLgoKVGhh
bmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
