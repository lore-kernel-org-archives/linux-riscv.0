Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD129C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxKfL4d9dHKP4oCpzr4V5FlNGNoXGG8Vsgnh/eZemQk=; b=K/xe+AxmnjdB7r
	9l+YIpYNnaI8Obr+GddQfkDb+OxSXm0PGyAoCkBaCr+wtd5I3G8riUYlq3cyWxDNALCqLO6bFzwqP
	TYVpghCu/+Y11EZ6E9ot5+wVvOiGrAaEXYiXVYLsUF7/06p6BdXkELSDeeyaY/RcTvhbKCHhYNbGB
	bQdnOAMpt2UOTCKShnWWLVVxNHb/FZoIgo59U569tMS6scOd0Qjrca2Iq5/g8ZPcHxLoqxxHh3xvQ
	PD2kbvAENSDs+kl+yeZt4jyTpZUj2FwA2WHF6PUKtj5icb+P2Pmll3d67O3zsvzcQ50AaYnNy90dp
	YqiKcH1v3lU7sqFbmoFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZAqh-00000001bVU-0dtw;
	Wed, 31 Jul 2024 15:02:43 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZAqd-00000001bUo-3va9
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 15:02:41 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fc587361b6so41730225ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 08:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722438158; x=1723042958; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3pEcVDWIeBBKJY5rYo4nIp1+5IBnyuWvRwhKMSQzHM=;
        b=F25FmMNswPQkcfsvwWhkH9dnmyCy9XKxeUu5hAVaPpc8l8jbd5Fk9kcUw8Z2jgbAr1
         mLT7vnD0U4wHAHGbFuVpXg53ZtdE2rmejoe5UH96iDLFzDYnXEW2C4mblVJLT1/6V0aS
         WcRtcRvXgGRyQyao1zNkz2wHdQNvp6HUgbs13DTU8EOJO4S0UCAw77fGSTQog5N239IB
         N3P0EUxfqQfJinGEObsFfUgAsAzHDaStU+i2NFaXAz66yf2vBasWguobzAGJ1e/sJ6MD
         PMih5x+97SXBl/yDAbUaQ0YFIwSotkhkmFSvIJIVdIAL3SW7F0x29Ke30m9zq2Xt4qzw
         Q4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722438158; x=1723042958;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3pEcVDWIeBBKJY5rYo4nIp1+5IBnyuWvRwhKMSQzHM=;
        b=dwIv7ineJhw1d20e7kHOvKLiNuZPPK/ZD4yUBiKbm+MFbs/7cwcPQ7C6Ttix5dsUol
         rcW8x8JHdPou92r2eRv97+I+DjnF3Ct5P8t6CJRUBQwgNj/4SU4neIRqvNK6p+wyMG9R
         gF7LHJkw1IhfJIbVI5RbazVzxqkn1QD2MWTnJ1juHg6atIuUa00zVpmeCGYvYSYMHyYZ
         CedJkEf6Pk6jK7TTcxS3NjASH4SJ+neFi4a1BlcbHvVRLajcO0kV8CD10Y2GXpX5aXEw
         HSJvmSB7+BymXOHYPpmevBh/8GkziQbMJV7IVRPB74xSRxniM/x2k3+0Z0sfIod6FZZn
         p9JA==
X-Forwarded-Encrypted: i=1; AJvYcCWkNtZVgAGLem4PMPC2SroaPRZVCAJMI14VAm7KztgOVut2CqBj1jePD6YjE/QTEG4kRcEtDo9hN6AIXlZht3Frh3+ebuttXmFFxVAVG4E2
X-Gm-Message-State: AOJu0YwMTip9bNgyxB/96+6ska24TL3DkX9tk2q092ITJgtRQslDH6t8
	UEW2+hDbJxfY2nfLP3hVTujEei2hTvy03k8qkObnBcLJn4npfSde
X-Google-Smtp-Source: AGHT+IFDe+Gop8MQmy/8qvQgta8yZDYKCAntFqVNAuMmp6Sw0Ob7fNHgNCvkehwyfC09R83AyyEuCQ==
X-Received: by 2002:a17:902:c947:b0:1fd:a644:e466 with SMTP id d9443c01a7336-1ff0485ba7cmr146711915ad.39.1722438158295;
        Wed, 31 Jul 2024 08:02:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c8582dsm121843175ad.6.2024.07.31.08.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:02:37 -0700 (PDT)
Date: Wed, 31 Jul 2024 08:02:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Jinyu Tang <tangjinyu@tinylab.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	chunzhi.lin@sophgo.com, haijiao.liu@sophgo.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 2/4] drivers: hwmon: sophgo: Add SG2042 external
 hardware monitor support
Message-ID: <75f6f910-43ff-4d98-b39f-b4b0629a56a1@roeck-us.net>
References: <IA1PR20MB49538C09E94D90F07B7B2562BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953DE89C56AB3F328954131BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB2822D0C770667CFE484EBC95FEB12@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB49534944E268A0A71AA3D5D1BBB12@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB49534944E268A0A71AA3D5D1BBB12@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_080240_026160_90E6C275 
X-CRM114-Status: GOOD (  36.73  )
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

T24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMDM6MTc6NTdQTSArMDgwMCwgSW5vY2hpIEFtYW90byB3
cm90ZToKPiBPbiBXZWQsIEp1bCAzMSwgMjAyNCBhdCAwMjoxMzoyMFBNIEdNVCwgQ2hlbiBXYW5n
IHdyb3RlOgo+ID4gCj4gPiBPbiAyMDI0LzcvMzAgMTU6NTAsIElub2NoaSBBbWFvdG8gd3JvdGU6
Cj4gPiBbLi4uLi4uXQo+ID4gPiArI2RlZmluZSBSRUdfQ1JJVElDQUxfQUNUSU9OUwkJCTB4NjUK
PiA+IFRoZSBuYW1lICJSRUdfQ1JJVElDQUxfQUNUSU9OUyIgaXMgYW1iaWd1b3VzLiBJIGhhdmUg
Y29uZmlybWVkIHdpdGggc29waGdvCj4gPiBlbmdpbmVlcnMgdGhhdCB0aGUgY29tcGxldGUgcHJv
Y2VzcyBpczogd2hlbiB0aGUgbWVhc3VyZWQgdGVtcGVyYXR1cmUKPiA+IGV4Y2VlZHMgdGhlIHRl
bXBlcmF0dXJlIHNldCBieSBSRUdfQ1JJVElDQUxfVEVNUCwgdGhlIHByb2Nlc3NvciBpcyBwb3dl
cmVkCj4gPiBvZmYgYW5kIHNodXQgZG93biwgYW5kIHRoZW4gYWZ0ZXIgdGhlIHRlbXBlcmF0dXJl
IHJldHVybnMgdG8gdGhlIHRlbXBlcmF0dXJlCj4gPiBzZXQgYnkgUkVHX1JFUE9XRVJfVEVNUCwg
aXQgaXMgZGVjaWRlZCB3aGV0aGVyIHRvIHBvd2VyIG9uIGFnYWluIG9yIHJlbWFpbgo+ID4gaW4g
dGhlIHNodXRkb3duIHN0YXRlIGJhc2VkIG9uIHRoZSBhY3Rpb24gc2V0IGJ5IFJFR19DUklUSUNB
TF9BQ1RJT05TLAo+ID4gd2hldGhlciBpdCBpcyByZWJvb3Qgb3IgcG93ZXJvZmYuCj4gPiAKPiA+
IFNvIGJhc2VkIG9uIHRoZSBhYm92ZSBkZXNjcmlwdGlvbiwgSSB0aGluayBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8KPiA+IGNhbGzCoCJSRUdfQ1JJVElDQUxfQUNUSU9OUyIgYXMgIlJFR19SRVBPV0VS
X0FDVElPTlMiLiAiUkVHX0NSSVRJQ0FMX0FDVElPTlMiCj4gPiBnaXZlcyBwZW9wbGUgdGhlIGZp
cnN0IGltcHJlc3Npb24gdGhhdCBpdCBpcyB1c2VkIHRvIHNldCBhY3Rpb25zIHJlbGF0ZWQgdG8K
PiA+IFJFR19DUklUSUNBTF9URU1QLgo+ID4gCj4gPiBJdCBpcyBhbHNvIHJlY29tbWVuZGVkIHRv
IGFkZCB0aGUgYWJvdmUgZGVzY3JpcHRpb24gb2YgdGVtcGVyYXR1cmUgY29udHJvbAo+ID4gYW5k
IGFjdGlvbiBzZXR0aW5ncyBpbiB0aGUgY29kZS4gQ3VycmVudGx5LCBzb3BoZ28gZG9lcyBub3Qg
aGF2ZSBhIGNsZWFyCj4gPiBkb2N1bWVudCBkZXNjcmlwdGlvbiBmb3IgdGhpcyBwYXJ0LCBhbmQg
YWRkaW5nIGl0IHdpbGwgaGVscCB1cyB1bmRlcnN0YW5kCj4gPiBpdHMgZnVuY3Rpb25zLgo+ID4g
Cj4gPiBBZGRpbmcgc29waGdvIGVuZ2luZWVycyBDaHVuemhpIGFuZCBIYWlqaWFvLCBGWUkuCj4g
PiAKPiA+ID4gKyNkZWZpbmUgUkVHX0NSSVRJQ0FMX1RFTVAJCQkweDY2Cj4gPiA+ICsjZGVmaW5l
IFJFR19SRVBPV0VSX1RFTVAJCQkweDY3Cj4gPiA+ICsKPiA+ID4gKyNkZWZpbmUgQ1JJVElDQUxf
QUNUSU9OX1JFQk9PVAkJCTEKPiA+ID4gKyNkZWZpbmUgQ1JJVElDQUxfQUNUSU9OX1BPV0VST0ZG
CQkyCj4gPiAKPiA+IEFzIEkgc2FpZCB1cG9uLCBhY3Rpb25zIGFyZSBub3QgcmVsYXRlZCB0byBj
cml0aWNhbCwgYnV0IGlzIGZvciByZXN0b3JpbmcKPiA+IGZyb20gY3JpdGljYWwsIHN1Z2dlc3Qg
dG8gZ2l2ZSBhIGJldHRlciBuYW1lLgo+ID4gCj4gPiBbLi4uLi4uXQo+ID4gCj4gPiA+ICtzdGF0
aWMgc3NpemVfdCBjcml0aWNhbF9hY3Rpb25fc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiBb
Li4uLi4uXQo+ID4gPiArc3RhdGljIHNzaXplX3QgY3JpdGljYWxfYWN0aW9uX3N0b3JlKHN0cnVj
dCBkZXZpY2UgKmRldiwKPiA+IAo+ID4gWy4uLi4uLl0KPiA+IAo+ID4gVGhlIHNhbWUgcmVhc29u
IGFzIHVwb24sICJjcml0aWNhbF9hY3Rpb25feHh4IiBpcyBtaXNsZWFkaW5nLgo+ID4gCj4gPiBb
Li4uLi4uXQo+ID4gCj4gCj4gVGhhbmtzIGZvciBleHBsYW5hdGlvbiwgSSBqdXN0IGdldCB0aGUg
bmFtZSBmcm9tIHRoZSBkcml2ZXIgb2YgU0cyMDQyLgo+IFRoaXMgaXMgb3V0IG9mIG15IGtub3ds
ZWRnZS4KPiAKPiA+ID4gK3N0YXRpYyBpbnQgc2cyMDQyX21jdV9yZWFkX3RlbXAoc3RydWN0IGRl
dmljZSAqZGV2LAo+ID4gPiArCQkJCXUzMiBhdHRyLCBpbnQgY2hhbm5lbCwKPiA+ID4gKwkJCQls
b25nICp2YWwpCj4gPiA+ICt7Cj4gPiA+ICsJc3RydWN0IHNnMjA0Ml9tY3VfZGF0YSAqbWN1ID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gPiA+ICsJaW50IHRtcDsKPiA+ID4gKwl1OCByZWc7Cj4g
PiA+ICsKPiA+ID4gKwlzd2l0Y2ggKGF0dHIpIHsKPiA+ID4gKwljYXNlIGh3bW9uX3RlbXBfaW5w
dXQ6Cj4gPiA+ICsJCXJlZyA9IGNoYW5uZWwgPyBSRUdfQk9BUkRfVEVNUCA6IFJFR19TT0NfVEVN
UDsKPiA+ID4gKwkJYnJlYWs7Cj4gPiA+ICsJY2FzZSBod21vbl90ZW1wX2NyaXQ6Cj4gPiA+ICsJ
CXJlZyA9IFJFR19DUklUSUNBTF9URU1QOwo+ID4gPiArCQlicmVhazsKPiA+ID4gKwljYXNlIGh3
bW9uX3RlbXBfY3JpdF9oeXN0Ogo+ID4gPiArCQlyZWcgPSBSRUdfUkVQT1dFUl9URU1QOwo+ID4g
PiArCQlicmVhazsKPiA+ID4gKwlkZWZhdWx0Ogo+ID4gPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7
Cj4gPiA+ICsJfQo+ID4gPiArCj4gPiA+ICsJdG1wID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRh
KG1jdS0+Y2xpZW50LCByZWcpOwo+ID4gPiArCWlmICh0bXAgPCAwKQo+ID4gPiArCQlyZXR1cm4g
dG1wOwo+ID4gPiArCSp2YWwgPSB0bXAgKiAxMDAwOwo+ID4gPiArCj4gPiA+ICsJcmV0dXJuIDA7
Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbnQgc2cyMDQyX21jdV9yZWFkKHN0cnVj
dCBkZXZpY2UgKmRldiwKPiA+ID4gKwkJCSAgIGVudW0gaHdtb25fc2Vuc29yX3R5cGVzIHR5cGUs
Cj4gPiA+ICsJCQkgICB1MzIgYXR0ciwgaW50IGNoYW5uZWwsIGxvbmcgKnZhbCkKPiA+ID4gK3sK
PiA+ID4gKwlyZXR1cm4gc2cyMDQyX21jdV9yZWFkX3RlbXAoZGV2LCBhdHRyLCBjaGFubmVsLCB2
YWwpOwo+ID4gPiArfQo+ID4gQ2FuIHdlIG1lcmdlIHNnMjA0Ml9tY3VfcmVhZCBhbmQgc2cyMDQy
X21jdV9yZWFkX3RlbXDvvJ8KPiAKPiBZZXMsIGl0IGNhbiBiZSBtZXJnZWQuIGJ1dCBJIHRoaW5r
IHVzaW5nIHRoaXMgbmVzdGVkIGZ1bmN0aW9uIAo+IGlzIG1vcmUgY2xlYXIuIEFuZCBnY2MgY2Fu
IGF1dG8gaW5saW5lIHRoaXMgZnVuY3Rpb24gc28gd2UKPiBnb3Qgbm8gcGVyZm9ybWFuY2UgcGVu
YWx0eS4KPiAKCkZXSVcsIEkgdGhpbmsgdGhhdCBpcyBwb2ludGxlc3MuIFRlIG9ubHkgZGlmZmVy
ZW5jZSBpcyB1bnVzZWQKcGFyYW1ldGVycy4KCj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbnQgc2cy
MDQyX21jdV93cml0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiA+ICsJCQkgICAgZW51bSBod21v
bl9zZW5zb3JfdHlwZXMgdHlwZSwKPiA+ID4gKwkJCSAgICB1MzIgYXR0ciwgaW50IGNoYW5uZWws
IGxvbmcgdmFsKQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCBzZzIwNDJfbWN1X2RhdGEgKm1jdSA9
IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4gPiArCWludCB0ZW1wID0gdmFsIC8gMTAwMDsKPiA+
ID4gKwlpbnQgaHlzdF90ZW1wLCBjcml0X3RlbXA7Cj4gPiA+ICsJaW50IHJldDsKPiA+ID4gKwl1
OCByZWc7Cj4gPiA+ICsKPiA+ID4gKwlpZiAodGVtcCA+IE1DVV9QT1dFUl9NQVgpCj4gPiA+ICsJ
CXRlbXAgPSBNQ1VfUE9XRVJfTUFYOwoKTm8gbG93ZXIgbGltaXQgPyAtMTAwMDAwMCBpcyBvayA/
Cgo+ID4gPiArCj4gPiA+ICsJbXV0ZXhfbG9jaygmbWN1LT5tdXRleCk7Cj4gPiA+ICsKPiA+ID4g
Kwlzd2l0Y2ggKGF0dHIpIHsKPiA+ID4gKwljYXNlIGh3bW9uX3RlbXBfY3JpdDoKPiA+ID4gKwkJ
aHlzdF90ZW1wID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKG1jdS0+Y2xpZW50LAo+ID4gPiAr
CQkJCQkJICAgICBSRUdfUkVQT1dFUl9URU1QKTsKPiA+ID4gKwkJaWYgKGh5c3RfdGVtcCA8IDAp
IHsKPiA+ID4gKwkJCXJldCA9IC1FTk9ERVY7Cj4gPiA+ICsJCQlnb3RvIGZhaWxlZDsKCkRvIG5v
dCBvdmVyd3JpdGUgZXJyb3IgY29kZXMuCgo+ID4gPiArCQl9Cj4gPiA+ICsKPiA+ID4gKwkJY3Jp
dF90ZW1wID0gdGVtcDsKPiA+ID4gKwkJcmVnID0gUkVHX0NSSVRJQ0FMX1RFTVA7Cj4gPiA+ICsJ
CWJyZWFrOwo+ID4gPiArCWNhc2UgaHdtb25fdGVtcF9jcml0X2h5c3Q6Cj4gPiA+ICsJCWNyaXRf
dGVtcCA9IGkyY19zbWJ1c19yZWFkX2J5dGVfZGF0YShtY3UtPmNsaWVudCwKPiA+ID4gKwkJCQkJ
CSAgICAgUkVHX0NSSVRJQ0FMX1RFTVApOwo+ID4gPiArCQlpZiAoY3JpdF90ZW1wIDwgMCkgewo+
ID4gPiArCQkJcmV0ID0gLUVOT0RFVjsKPiA+ID4gKwkJCWdvdG8gZmFpbGVkOwoKRG8gbm90IG92
ZXJ3cml0ZSBlcnJvciBjb2Rlcy4KCj4gPiA+ICsJCX0KPiA+ID4gKwo+ID4gPiArCQloeXN0X3Rl
bXAgPSB0ZW1wOwo+ID4gPiArCQlyZWcgPSBSRUdfUkVQT1dFUl9URU1QOwo+ID4gPiArCQlicmVh
azsKPiA+ID4gKwlkZWZhdWx0Ogo+ID4gPiArCQltdXRleF91bmxvY2soJm1jdS0+bXV0ZXgpOwo+
ID4gPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7CgpUaGlzIGlzIGluY29uc2lzdGVudC4KCj4gPiA+
ICsJfQo+ID4gPiArCj4gPiBJdCBpcyByZWNvbW1lbmRlZCB0byBhZGQgc29tZSBjb21tZW50cyB0
byBleHBsYWluIHdoeSB3ZSBuZWVkIHRvIGVuc3VyZSB0aGF0Cj4gPiBjcml0X3RlbXAgaXMgZ3Jl
YXRlciB0aGFuIG9yIGVxdWFsIHRvIGh5c3RfdGVtcC4gVGhpcyBpcyBlbnRpcmVseSBiZWNhdXNl
Cj4gPiB0aGUgY3VycmVudCBNQ1UgZG9lcyBub3QgbGltaXQgdGhlIGlucHV0LCB3aGljaCBtYXkg
Y2F1c2UgdXNlciB0byBzZXQKPiA+IGluY29ycmVjdCBjcml0X3RlbXAgYW5kIGh5c3RfdGVtcC4K
PiAKPiBZZWFoLCB0aGlzIGlzIGdvb2QgaWRlYS4KPiAKPiA+ID4gKwlpZiAoY3JpdF90ZW1wIDwg
aHlzdF90ZW1wKSB7Cj4gPiA+ICsJCXJldCA9IC1FSU5WQUw7Cj4gPiA+ICsJCWdvdG8gZmFpbGVk
Owo+ID4gPiArCX0KPiA+ID4gKwo+ID4gPiArCXJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2Rh
dGEobWN1LT5jbGllbnQsIHJlZywgdGVtcCk7Cj4gPiA+ICsKPiA+ID4gK2ZhaWxlZDoKPiA+ID4g
KwltdXRleF91bmxvY2soJm1jdS0+bXV0ZXgpOwo+ID4gPiArCXJldHVybiByZXQ7Cj4gPiA+ICt9
Cj4gPiA+ICsKPiA+IFsuLi4uLi5dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
