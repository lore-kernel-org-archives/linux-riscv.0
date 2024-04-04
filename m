Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F632CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 20:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+60wiKEVFc52+daO6k2s8UhSYlthlK5hzjaL92q9JKM=; b=VR29fZLN8AbqQEKxtDvVLLU/L7
	sqNuyGVhY/CyFg+PwnESyRHwoN6XtI7UDLoeCVrrLWqNyOKxW2DKxJP9gZr8pNs+l50/ks1bpLUWn
	rchBOI6ouTIEN5KGrsQx+oEzKWSizg5gLRhAMlOFRdyh9wBfFl5tMyNMwBQrLCUEbdDEu1ccj435U
	oHlVf6eMtR46Y4AAQLaSgQEtjN8ajGvpT3W+vgimaOQI7egH06UYl5q/vHUzQlOM+PJyjM8+DwsCu
	BAzRmItc6y6ttNjpO0CrzhVcnsB7DEH9z10Dt7jJgAbsv5bPkbE7ztuamhzlovRL3NFUMvSN8MtEy
	437arOvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsTSg-00000004ASe-3NQM;
	Thu, 04 Apr 2024 20:13:26 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsTSd-00000004AR3-0Inb
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 20:13:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e2178b2cf2so13025425ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 13:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1712261596; x=1712866396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUAL9RLsULnbJgPVDzb+qmxwNae1uJap47Wq1rbrKPw=;
        b=BFb4un5OGac49Cy9bwWru12eafZgVIrVXrWCyjUx8PKeyzNX9UHCdJWyqWpHAB8RYd
         nJqHAtzC2J/6RAVWK7KIbwLt2yeC0qR/oAsHNyxW4eJAFJ//HY45OVEqgeLqSlu5ySM2
         YJ0aM3imRMxGh9uXStaVqvg03caAVBQs+AD9PC5w7CFfdEFE4HF/cQEtvs9pmwlpXHgg
         hc1D43oJIEDQ8H5Ys1vLmgQZvnEdN9QY8IWYHoTIghysjecBuLOxntWTiP6GCuz76ZS0
         JrTyoHPRiuhzkdoz6dlpHzpRsE0o6RLMgXPCVOy3JVdX91U2m7wttUwBZCwO7WpbK/TL
         2Vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712261596; x=1712866396;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUAL9RLsULnbJgPVDzb+qmxwNae1uJap47Wq1rbrKPw=;
        b=MMs0p559SIAtXh/X1dhhjBQvuCgiyRXh7ky4nb5yOEl+aAfiSX5pPOvjGg8hH2BYTv
         hY/G3EOkLnPa3lgJV8F457euf4OGoWIrkbPKq3XIqG66Jo3TIwI4TPkyHKOTBR4Q5nJa
         OJiXiY8+e0HL/g4d7CQYsM0N+1ib+zOaigMGXWO+edfGZyGh2B2pQzUmhIDpXuVcTqBf
         CwXQL9iGZn92DNNCjByifW7tHG7HOw4RV6fjqnr2TSTw/hfOJTaYub15iUOGUz862LoR
         UqL8w/IYgTCdzpWvDvuqx0xIX1wAIhGnYVZsVULDLjc/sL0nQZpWraWDSkozpk5KPRtR
         KdSg==
X-Forwarded-Encrypted: i=1; AJvYcCXxpVtv7xcWadRvhjlXaeDkGBeVYpnaV6I3enVnf7KuYQL7qkjaR34aA1oxxU+OSIE8x2Sl7wdjQ5s7Nmbq5GmXIE2eiDMac2+PXljX2ME5
X-Gm-Message-State: AOJu0Yz7hfm7MpB/3cBFhS5N5I5mbt9Yh3KpaJkqheU4m7m3N6FVxC05
	244oQFbYqZ54mOrn59Q+BpLD8Zbwpl0tiqLFLYewVflJsN2SpwQLaK/BMTdAna2Lp5scg3ci5av
	Y
X-Google-Smtp-Source: AGHT+IGgwVSfPRNKtx9Jf4OL/W8qOt/gsfmr5K1tuYOatYpNyhpDKyZ2oO0seu2QZI/uO8RorGBWHQ==
X-Received: by 2002:a17:902:c155:b0:1e2:5e77:4cd with SMTP id 21-20020a170902c15500b001e25e7704cdmr3199719plj.7.1712261595505;
        Thu, 04 Apr 2024 13:13:15 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id b3-20020a170903228300b001e2c2d694cdsm20633plh.31.2024.04.04.13.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 13:13:15 -0700 (PDT)
Date: Thu, 04 Apr 2024 13:13:15 -0700 (PDT)
X-Google-Original-Date: Thu, 04 Apr 2024 13:13:13 PDT (-0700)
Subject: Re: [External] [PATCH] riscv: process: Fix kernel gp leakage
In-Reply-To: <7312eb06-c9dd-4a0e-98bc-ea4e8ace7b10@ghiti.fr>
CC: sorear@fastmail.com, cuiyunhui@bytedance.com, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-c2329625-3c61-4c53-86c6-5989b03505f5@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_131323_239297_AD937F0E 
X-CRM114-Status: GOOD (  36.95  )
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

T24gVHVlLCAwMiBBcHIgMjAyNCAwMjoyMToxNSBQRFQgKC0wNzAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBIaSBTdGVmYW4sCj4KPiBPbiAyNy8wMy8yMDI0IDE3OjUzLCBTdGVmYW4gTydSZWFy
IHdyb3RlOgo+PiBPbiBXZWQsIE1hciAyNywgMjAyNCwgYXQgNDo0MyBBTSwgeXVuaHVpIGN1aSB3
cm90ZToKPj4+IEhpIFN0ZWZhbiwKPj4+Cj4+PiBPbiBXZWQsIE1hciAyNywgMjAyNCBhdCAyOjE0
4oCvUE0gU3RlZmFuIE8nUmVhciA8c29yZWFyQGZhc3RtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4gY2hp
bGRyZWdzIHJlcHJlc2VudHMgdGhlIHJlZ2lzdGVycyB3aGljaCBhcmUgYWN0aXZlIGZvciB0aGUg
bmV3IHRocmVhZAo+Pj4+IGluIHVzZXIgY29udGV4dC4gRm9yIGEga2VybmVsIHRocmVhZCwgY2hp
bGRyZWdzLT5ncCBpcyBuZXZlciB1c2VkIHNpbmNlCj4+Pj4gdGhlIGtlcm5lbCBncCBpcyBub3Qg
dG91Y2hlZCBieSBzd2l0Y2hfdG8uIEZvciBhIHVzZXIgbW9kZSBoZWxwZXIsIHRoZQo+Pj4+IGdw
IHZhbHVlIGNhbiBiZSBvYnNlcnZlZCBpbiB1c2VyIHNwYWNlIGFmdGVyIGV4ZWN2ZSBvciBwb3Nz
aWJseSBieSBvdGhlcgo+Pj4+IG1lYW5zLgo+Pj4+Cj4+Pj4gRml4ZXM6IDdkYjkxZTU3YTBhYyAo
IlJJU0MtVjogVGFzayBpbXBsZW1lbnRhdGlvbiIpCj4+Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFu
IE8nUmVhciA8c29yZWFyQGZhc3RtYWlsLmNvbT4KPj4+PiAtLS0KPj4+PiAgIGFyY2gvcmlzY3Yv
a2VybmVsL3Byb2Nlc3MuYyB8IDMgLS0tCj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlv
bnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKPj4+PiBpbmRleCA5MjkyMmRiZDViNWMuLjUx
MDQyZjQ4ZGExNyAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMK
Pj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKPj4+PiBAQCAtMjcsOCArMjcs
NiBAQAo+Pj4+ICAgI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4KPj4+PiAgICNpbmNsdWRlIDxhc20v
Y3B1ZmVhdHVyZS5oPgo+Pj4+Cj4+Pj4gLXJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgZ3BfaW5fZ2xv
YmFsIF9fYXNtX18oImdwIik7Cj4+Pj4gLQo+Pj4+ICAgI2lmIGRlZmluZWQoQ09ORklHX1NUQUNL
UFJPVEVDVE9SKSAmJiAhZGVmaW5lZChDT05GSUdfU1RBQ0tQUk9URUNUT1JfUEVSX1RBU0spCj4+
Pj4gICAjaW5jbHVkZSA8bGludXgvc3RhY2twcm90ZWN0b3IuaD4KPj4+PiAgIHVuc2lnbmVkIGxv
bmcgX19zdGFja19jaGtfZ3VhcmQgX19yZWFkX21vc3RseTsKPj4+PiBAQCAtMjA3LDcgKzIwNSw2
IEBAIGludCBjb3B5X3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAsIGNvbnN0IHN0cnVjdCBr
ZXJuZWxfY2xvbmVfYXJncyAqYXJncykKPj4+PiAgICAgICAgICBpZiAodW5saWtlbHkoYXJncy0+
Zm4pKSB7Cj4+Pj4gICAgICAgICAgICAgICAgICAvKiBLZXJuZWwgdGhyZWFkICovCj4+Pj4gICAg
ICAgICAgICAgICAgICBtZW1zZXQoY2hpbGRyZWdzLCAwLCBzaXplb2Yoc3RydWN0IHB0X3JlZ3Mp
KTsKPj4+PiAtICAgICAgICAgICAgICAgY2hpbGRyZWdzLT5ncCA9IGdwX2luX2dsb2JhbDsKPj4+
PiAgICAgICAgICAgICAgICAgIC8qIFN1cGVydmlzb3IvTWFjaGluZSwgaXJxcyBvbjogKi8KPj4+
PiAgICAgICAgICAgICAgICAgIGNoaWxkcmVncy0+c3RhdHVzID0gU1JfUFAgfCBTUl9QSUU7Cj4+
Pj4KPj4+PiAtLQo+Pj4+IDIuNDAuMQo+Pj4+Cj4+Pj4KPj4+IENhbiB5b3UgaGVscCBleHByZXNz
IGluIG1vcmUgZGV0YWlsIHdoYXQgdGhlIHByb2JsZW0gd2FzIGJlZm9yZSBmaXhpbmcgaXQ/Cj4+
IEl0J3MgYSBLQVNMUiBieXBhc3MsIHNpbmNlIGdwX2luX2dsb2JhbCBpcyB0aGUgYWRkcmVzcyBv
ZiB0aGUga2VybmVsIHN5bWJvbAo+PiBfX2dsb2JhbF9wb2ludGVyJC4KPj4KPj4gVGhlIC8qIEtl
cm5lbCB0aHJlYWQgKi8gY29tbWVudCBpcyBzb21ld2hhdCBpbmFjY3VyYXRlIGluIHRoYXQgaXQg
aXMgYWxzbyB1c2VkCj4+IGZvciB1c2VyX21vZGVfaGVscGVyIHRocmVhZHMsIHdoaWNoIGV4ZWMg
YSB1c2VyIHByb2Nlc3MsIGUuZy4gL3NiaW4vaW5pdCBvcgo+PiB3aGVuIC9wcm9jL3N5cy9rZXJu
ZWwvY29yZV9wYXR0ZXJuIGlzIGEgcGlwZS4gU3VjaCB0aHJlYWRzIGRvIG5vdCBoYXZlCj4+IFBG
X0tUSFJFQUQgc2V0IGFuZCBhcmUgdmFsaWQgdGFyZ2V0cyBmb3IgcHRyYWNlIGV0Yy4gZXZlbiBi
ZWZvcmUgdGhleSBleGVjLgo+Pgo+PiBjaGlsZHJlZ3MgaXMgdGhlICp1c2VyKiBjb250ZXh0IGR1
cmluZyBzeXNjYWxsIGV4ZWN1dGlvbiBhbmQgaXQgaXMgb2JzZXJ2YWJsZQo+PiBmcm9tIHVzZXJz
cGFjZSBpbiBhdCBsZWFzdCBmaXZlIHdheXM6Cj4+Cj4+IDEuIGtlcm5lbF9leGVjdmUgZG9lcyBu
b3QgY3VycmVudGx5IGNsZWFyIGludGVnZXIgcmVnaXN0ZXJzLCBzbyB0aGUgc3RhcnRpbmcKPj4g
ICAgIHJlZ2lzdGVyIHN0YXRlIGZvciBQSUQgMSBhbmQgb3RoZXIgdXNlciBwcm9jZXNzZXMgc3Rh
cnRlZCBieSB0aGUga2VybmVsIGhhcwo+PiAgICAgc3AgPSB1c2VyIHN0YWNrLCBncCA9IGtlcm5l
bCBfX2dsb2JhbF9wb2ludGVyJCwgYWxsIG90aGVyIGludGVnZXIgcmVnaXN0ZXJzCj4+ICAgICB6
ZXJvZWQgYnkgdGhlIG1lbXNldCBpbiB0aGUgcGF0Y2ggY29tbWVudC4KPgo+Cj4gU28gYXMgScKg
IGRpZCBub3QgdGhpcyBrbm93IHRoaXMgcGF0aCByZWFsbHkgd2VsbCwgSSBwbGF5ZWQgYSBiaXQg
YW5kIEkKPiBjYW4gY29uZmlybSB0aGF0IHVzZXJtb2RlIHByb2Nlc3NlcyByZWFjaCB1c2Vyc3Bh
Y2Ugd2l0aCB0aGUgZ3AgPSBrZXJuZWw6Cj4KPiBUaHJlYWQgMSBoaXQgQnJlYWtwb2ludCAxMiwg
MHgwMDAwN2ZmZjgyNDg3ZmM0IGluID8/ICgpCj4gMTogeC9pICRwYwo+ID0+IDB4N2ZmZjgyNDg3
ZmM0OsKgwqDCoCBtdsKgwqDCoCBhMCxzcAo+IDM6IC94ICRncCA9IDB4ZmZmZmZmZmY4MTdmZWU1
MAo+Cj4KPj4KPj4gICAgIFRoaXMgaXMgYSBidWcgaW4gaXRzIG93biByaWdodCwgYnV0IEknbSB1
bndpbGxpbmcgdG8gYmV0IHRoYXQgaXQgaXMgdGhlIG9ubHkKPj4gICAgIHdheSB0byBleHBsb2l0
IHRoZSBpc3N1ZSBhZGRyZXNzZWQgYnkgdGhpcyBwYXRjaC4KPj4KPj4gMi4gcHRyYWNlKFBUUkFD
RV9HRVRSRUdTRVQpOiB5b3UgY2FuIFBUUkFDRV9BVFRBQ0ggdG8gYSB1c2VyX21vZGVfaGVscGVy
IHRocmVhZAo+PiAgICAgYmVmb3JlIGl0IGV4ZWNzLCBidXQgcHRyYWNlIHJlcXVpcmVzIFNJR1NU
T1AgdG8gYmUgZGVsaXZlcmVkIHdoaWNoIGNhbiBvbmx5Cj4+ICAgICBoYXBwZW4gYXQgdXNlci9r
ZXJuZWwgYm91bmRhcmllcy4KPj4KPj4gMy4gL3Byb2MvKi90YXNrLyovc3lzY2FsbDogdGhpcyBp
cyBwZXJmZWN0bHkgaGFwcHkgdG8gcmVhZCBwdF9yZWdzIGZvcgo+PiAgICAgdXNlcl9tb2RlX2hl
bHBlcnMgYmVmb3JlIHRoZSBleGVjIGNvbXBsZXRlcywgYnV0IGdwIGlzIG5vdCBvbmUgb2YgdGhl
Cj4+ICAgICByZWdpc3RlcnMgaXQgcmV0dXJucy4KPj4KPj4gNC4gUEVSRl9TQU1QTEVfUkVHU19V
U0VSOiBMT0NLRE9XTl9QRVJGIG5vcm1hbGx5IHByZXZlbnRzIGFjY2VzcyB0byBrZXJuZWwKPj4g
ICAgIGFkZHJlc3NlcyB2aWEgUEVSRl9TQU1QTEVfUkVHU19JTlRSLCBidXQgZHVlIHRvIHRoaXMg
YnVnIGtlcm5lbCBhZGRyZXNzZXMKPj4gICAgIGFyZSBhbHNvIGV4cG9zZWQgdmlhIFBFUkZfU0FN
UExFX1JFR1NfVVNFUiB3aGljaCBpcyBwZXJtaXR0ZWQgdW5kZXIKPj4gICAgIExPQ0tET1dOX1BF
UkYuIEkgaGF2ZSBub3QgYXR0ZW1wdGVkIHRvIHdyaXRlIGV4cGxvaXQgY29kZS4KPj4KPj4gNS4g
TXVjaCBvZiB0aGUgdHJhY2luZyBpbmZyYXN0cnVjdHVyZSBhbGxvd3MgYWNjZXNzIHRvIHVzZXIg
cmVnaXN0ZXJzLiBJIGhhdmUKPj4gICAgIG5vdCBhdHRlbXB0ZWQgdG8gZGV0ZXJtaW5lIHdoaWNo
IGZvcm1zIG9mIHRyYWNpbmcgYWxsb3cgYWNjZXNzIHRvIHVzZXIKPj4gICAgIHJlZ2lzdGVycyB3
aXRob3V0IGFscmVhZHkgYWxsb3dpbmcgYWNjZXNzIHRvIGtlcm5lbCByZWdpc3RlcnMuCj4+Cj4+
IERvZXMgdGhpcyBoZWxwPyBIb3cgbXVjaCBvZiB0aGlzIHNob3VsZCBiZSBpbiB0aGUgY29tbWl0
IG1lc3NhZ2U/Cj4KPgo+IEknZCBwdXQgdGhlbSBhbGwsIGJ1dCB1cCB0byB5b3UsIGF0IGxlYXN0
IHRoZSBmaXJzdCB1c2VjYXNlIHRoYXQgSSB3YXMKPiBhYmxlIHRvIHJlcHJvZHVjZSBzaG91bGQg
YmUgYWRkZWQgdG8gdGhlIGNvbW1pdCBsb2cuCgpJIGp1c3QgcGFzdGVkIGl0IGFsbCBpbiB0aGUg
Y29tbWl0LCBpdCBzZWVtcyBnZW5lcmFsbHkgdXNlZnVsIGZvciBwZW9wbGUgCnJ1bm5pbmcgaW50
byB0aGUgY29tbWl0LiAgV2l0aCB0aGUgTGluayB0YWdzIG1heWJlIGl0J3MgbGVzcyBpbXBvcnRh
bnQgCnRoZXNlIGRheXMsIGJ1dCBJIGFsd2F5cyBqdXN0IGVyciBvbiB0aGUgc2lkZSBvZiBwdXR0
aW5nIG1vcmUgc3R1ZmYgaW4gCnRoZSBjb21taXQgbWVzc2FnZXMuCgo+IFlvdSBjYW4gYWRkOgo+
Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4K
Pgo+IEFuZCB0aGlzIHNob3VsZCBnbyB0byAtZml4ZXMuCgpJdCdzIHF1ZXVlZCB1cCBmb3IgdGhl
IHRlc3Rlci4KCj4gVGhhbmtzLAo+Cj4gQWxleAo+Cj4KPj4KPj4gLXMKPj4KPj4+IFRoYW5rcywK
Pj4+IFl1bmh1aQo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
