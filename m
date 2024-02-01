Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955A1C48286
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 20:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cf3MZR7cifUunyP3aCSD21RrsFMEPFdBfTbA6P3uvDg=; b=W9BRUqK2XdOf1m
	MYsuSjJ1Sj0CekJ9fkDIR/XWcrID0qOLy7EleeGKagSvlpq8ZPiDWZDeGobwAg4LsVdq8QW6Te/cQ
	ynuHT1FukzvJisU5c1UuaKw9qrpbrv24JbyMpRYEKdDpr4RRTX022TumNtjHbVvI4J0LK/4x1T+B5
	VKG/IAm5+bSm+vWulJl9S21cjYPcD01ka1EHKXXFPKhzp/49+2xd3NFtPxNb1eOdqhelhsEAxbCHT
	eIysV2/sKDIC3AAo+l2s0N4a+70ij4e7V9hW8vto1NpHXrqiM7mIQnSmJJ2le8ine/H4qpuPmdVld
	rcIUN2Ch+RNOC4FLgg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVdyY-00000009Jgb-2c7w;
	Thu, 01 Feb 2024 20:47:58 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVdyU-00000009Jg8-3Tdf
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 20:47:56 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-29041136f73so1027818a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 12:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706820470; x=1707425270; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V5OFv3V9vAEx3/vFkSC2MQ2MFNooXfm20T7y4yL4xMo=;
        b=tjtD5+Y327kv08OVNKH5dw+4RfJYM/Waad3ydvtAGD3hFHNbmqWevWH4QHAA37GS/P
         M5yzm5KOKFpFjHbpX+LgTxiecOrbbPtFr2q9Cj68OWqdkBZPVas6BAyyJHsWQOsXmGWz
         zFlj1eZrUInKLGP9JUTK/6nyb8CbvNDeX/3xDyDYkf1Z5aKP24BEiquSQOLXqwwFRa2n
         s1G5Fw/Lch1hSmIURViINlG1DOgrTM8qv1YRn7q7fiKWW+hWqvqaxgJJqAG8Fg5gp2UK
         N/EJoSkIWqOAUZWcSuRse7ysKSGH83yJUwTc4pvO4fBwEXB01+OMbm39INWLlH+FsJ+8
         18iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706820470; x=1707425270;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V5OFv3V9vAEx3/vFkSC2MQ2MFNooXfm20T7y4yL4xMo=;
        b=f1ee9dGcfCcizL964xeI44UTCJfyrSS0MLjP3WlWTZueyTYZ1TzPL2FWltB0UNrfyb
         d2j5cCdHJaOvn8M/m+PJv1lusUN1sBqofF21EB3Opphce8nPpbuvdamdvqh46DDjsQJ9
         scz31Q3O+ihFXSBcuTLWs3uvVr0P3oA7RlVthfBVkEhqF8vUYljAp9SvkbwQo+mhuM1Q
         5xatu/iMs0xu0FbV7xP4W5Yjnm1dl2rJ9Gal15WqMSwDHCXgphMvqyNfBH+6lleBIJYw
         UdhSim+nxma9vT/599cr1h/fwqhCTequRLHFkLottfFHO4s8TiRWQvF5ICteNPY99bE3
         B+LA==
X-Gm-Message-State: AOJu0YxjKUXP4lpOWK3i3buSdx8J51x6hg3FqHChWkhV4Ux2KHQJTATw
	kgaB25YEVh+frRapf/KO5x29VK41YCMaQpVyRX3TKONuVlI0gN3ozXEeHi97oeE=
X-Google-Smtp-Source: AGHT+IETKfl4OA1GZ8qBdST/c29q6Nx1vfHqTF5Ti6cPOho9knL2dpu/n3IyickJQBQ8qVAx/Vr2/g==
X-Received: by 2002:a17:90b:1196:b0:296:67b:eea0 with SMTP id gk22-20020a17090b119600b00296067beea0mr184787pjb.38.1706820470558;
        Thu, 01 Feb 2024 12:47:50 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVFaL7pxWSuq8dC99seakjEMZFyui3q7s2BZhpFYoVSG/AjHBCe7OrZeEqB+SGopkx/HRJZUO6JrSupiAZN+LE8933hIFcyrTRMMSDvke3byPI6NJIuvzL951EzpGtICSLBWWO+9ehHuSEIuby+VVHaY//1LgQmhoD0xXys1rSoqr3IshVuzLFDZKR6BG1rOQ9GphXo2F1ZV4LFhkbyNi0xUY2noEsUCDOIdgEZ4796EW3l7/QuVDP5wGnwMt7oqIY4RmVUmVKX/ll6vLnudNhTBfQPQT8Ltz3n
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id w14-20020a17090a780e00b002961a98c181sm1784666pjk.56.2024.02.01.12.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 12:47:50 -0800 (PST)
Date: Thu, 1 Feb 2024 12:47:48 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Charles Lohr <lohr85@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: Disable misaligned access probe when
 CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <ZbwDdLmO1l9WDLxF@ghost>
References: <20240131-disable_misaligned_probe_config-v1-0-98d155e9cda8@rivosinc.com>
 <20240131-disable_misaligned_probe_config-v1-2-98d155e9cda8@rivosinc.com>
 <48e6b009-c79c-4a2e-a532-e46c7b8b6fc8@rivosinc.com>
 <Zbvslcl7YTy38HNF@ghost>
 <CAGu26P85ZO1dY+qftMndKzwBpsA72x=KNWVyry=38uPhfuFweQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGu26P85ZO1dY+qftMndKzwBpsA72x=KNWVyry=38uPhfuFweQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_124755_113633_84BCDD40 
X-CRM114-Status: GOOD (  40.17  )
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

T24gVGh1LCBGZWIgMDEsIDIwMjQgYXQgMTE6NTc6MDRBTSAtMDgwMCwgQ2hhcmxlcyBMb2hyIHdy
b3RlOgo+IEkgYW0gYSBsaXR0bGUgY29uZnVzZWQgaGVyZSAtIEkgd2FzIHRlc3Rpbmcgd2l0aCA2
LjgtcmMxIGFuZCBpdCBkaWRuJ3QKPiBzZWVtIHRvIGhhdmUgdGhlIGJlaGF2aW9yIG9mIHBlcmZv
cm1pbmcgdGhlIHByb2JlIChUaGUgcHJvYmUga2lsbHMKPiBib290IHBlcmZvcm1hbmNlIGluIG15
IGFwcGxpY2F0aW9uIGFuZCBJJ3ZlIGhhZCB0byBwYXRjaCBvdXQgdGhlIHByb2JlCj4gaW4gbWlk
LTYueCBrZXJuZWxzKS4KPiAKPiBEaWQgc29tZXRoaW5nIGdldCByZXZlcnRlZCB0byBicmluZyBi
YWNrIHRoZSBwcm9iZSBldmVuIHdoZW4KPiBDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVE
X0FDQ0VTUz1ZIGJldHdlZW4gcmMxIGFuZCB0cnVuaz8gIE9yIGFtCj4gSSBtaXNyZW1lbWJlcmlu
Zy9hY2NpZGVudGFsbHkgcGF0Y2hlZD8KCkFmdGVyIHB1bGxpbmcgYSBjbGVhbiB2ZXJzaW9uIG9m
IDYuOC1yYzEgYW5kIHNldHRpbmcKQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NF
U1MgSSBzdGlsbCBzZWUgdGhlIHByb2JlIGhhcHBlbi4KQmVmb3JlIHNlbmRpbmcgdGhpcyBJIGxv
b2tlZCBmb3IgYSBwYXRjaCB0aGF0IGRpc2FibGVkIHRoZSBwcm9iZSBidXQgd2FzCnVuYWJsZSB0
byBmaW5kIG9uZSwgaWYgdGhlcmUgZXhpc3RzIGEgcGF0Y2ggY2FuIHlvdSBwb2ludCBtZSB0byBp
dD8KCi0gQ2hhcmxpZQoKPiAKPiBPbiBUaHUsIEZlYiAxLCAyMDI0IGF0IDExOjEw4oCvQU0gQ2hh
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1
LCBGZWIgMDEsIDIwMjQgYXQgMDI6NDM6NDNQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3Rl
Ogo+ID4gPgo+ID4gPgo+ID4gPiBPbiAwMS8wMi8yMDI0IDA3OjQwLCBDaGFybGllIEplbmtpbnMg
d3JvdGU6Cj4gPiA+ID4gV2hlbiBDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VT
UyBpcyBzZWxlY3RlZCwgdGhlIGNwdXMgY2FuIGJlCj4gPiA+ID4gc2V0IHRvIGhhdmUgZmFzdCBt
aXNhbGlnbmVkIGFjY2VzcyB3aXRob3V0IG5lZWRpbmcgdG8gcHJvYmUuCj4gPiA+ID4KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+
ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAg
fCA3ICsrKysrKysKPiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAg
IHwgNCArKysrCj4gPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICB8
IDQgKysrKwo+ID4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCA0
ICsrKysKPiA+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4gPiA+ID4K
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+ID4gPiA+IGluZGV4IGRmZGNj
YTIyOTE3NC4uN2Q4ZDY0NzgzZTM4IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jcHVmZWF0dXJlLmgKPiA+ID4gPiBAQCAtMTM3LDEwICsxMzcsMTcgQEAgc3RhdGljIF9fYWx3
YXlzX2lubGluZSBib29sIHJpc2N2X2NwdV9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KGludCBjcHUs
IGNvbnN0IHVuc2kKPiA+ID4gPiAgICAgcmV0dXJuIF9fcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFp
bGFibGUoaGFydF9pc2FbY3B1XS5pc2EsIGV4dCk7Cj4gPiA+ID4gIH0KPiA+ID4gPgo+ID4gPiA+
ICsjaWZuZGVmIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4gPiA+ID4g
IERFQ0xBUkVfU1RBVElDX0tFWV9GQUxTRShmYXN0X21pc2FsaWduZWRfYWNjZXNzX3NwZWVkX2tl
eSk7Cj4gPiA+ID4KPiA+ID4gPiAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIGhhc19mYXN0
X21pc2FsaWduZWRfYWNjZXNzZXModm9pZCkKPiA+ID4gPiAgewo+ID4gPiA+ICAgICByZXR1cm4g
c3RhdGljX2JyYW5jaF9saWtlbHkoJmZhc3RfbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfa2V5KTsK
PiA+ID4gPiAgfQo+ID4gPiA+ICsjZWxzZQo+ID4gPiA+ICtzdGF0aWMgX19hbHdheXNfaW5saW5l
IGJvb2wgaGFzX2Zhc3RfbWlzYWxpZ25lZF9hY2Nlc3Nlcyh2b2lkKQo+ID4gPiA+ICt7Cj4gPiA+
ID4gKyAgIHJldHVybiB0cnVlOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKyNlbmRpZgo+ID4gPiA+ICAj
ZW5kaWYKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiA+ID4gaW5kZXggODk5MjBmODRk
MGEzLi5kNzg3ODQ2YzBiNjggMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
Cj4gPiA+ID4gQEAgLTQzLDEwICs0MywxMiBAQCBzdGF0aWMgREVDTEFSRV9CSVRNQVAocmlzY3Zf
aXNhLCBSSVNDVl9JU0FfRVhUX01BWCkgX19yZWFkX21vc3RseTsKPiA+ID4gPiAgLyogUGVyLWNw
dSBJU0EgZXh0ZW5zaW9ucy4gKi8KPiA+ID4gPiAgc3RydWN0IHJpc2N2X2lzYWluZm8gaGFydF9p
c2FbTlJfQ1BVU107Cj4gPiA+ID4KPiA+ID4gPiArI2lmbmRlZiBDT05GSUdfSEFWRV9FRkZJQ0lF
TlRfVU5BTElHTkVEX0FDQ0VTUwo+ID4gPiA+ICAvKiBQZXJmb3JtYW5jZSBpbmZvcm1hdGlvbiAq
Lwo+ID4gPiA+ICBERUZJTkVfUEVSX0NQVShsb25nLCBtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCk7
Cj4gPiA+ID4KPiA+ID4gPiAgc3RhdGljIGNwdW1hc2tfdCBmYXN0X21pc2FsaWduZWRfYWNjZXNz
Owo+ID4gPiA+ICsjZW5kaWYKPiA+ID4gPgo+ID4gPiA+ICAvKioKPiA+ID4gPiAgICogcmlzY3Zf
aXNhX2V4dGVuc2lvbl9iYXNlKCkgLSBHZXQgYmFzZSBleHRlbnNpb24gd29yZAo+ID4gPiA+IEBA
IC03MDYsNiArNzA4LDcgQEAgdW5zaWduZWQgbG9uZyByaXNjdl9nZXRfZWxmX2h3Y2FwKHZvaWQp
Cj4gPiA+ID4gICAgIHJldHVybiBod2NhcDsKPiA+ID4gPiAgfQo+ID4gPiA+Cj4gPiA+ID4gKyNp
Zm5kZWYgQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MKPiA+ID4gPiAgc3Rh
dGljIGludCBjaGVja191bmFsaWduZWRfYWNjZXNzKHZvaWQgKnBhcmFtKQo+ID4gPiA+ICB7Cj4g
PiA+ID4gICAgIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4gPiA+ID4gQEAgLTk0Niw2
ICs5NDksNyBAQCBzdGF0aWMgaW50IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXModm9p
ZCkKPiA+ID4gPiAgfQo+ID4gPiA+Cj4gPiA+ID4gIGFyY2hfaW5pdGNhbGwoY2hlY2tfdW5hbGln
bmVkX2FjY2Vzc19hbGxfY3B1cyk7Cj4gPiA+ID4gKyNlbmRpZiAvKiBDT05GSUdfSEFWRV9FRkZJ
Q0lFTlRfVU5BTElHTkVEX0FDQ0VTUyAqLwo+ID4gPiA+Cj4gPiA+ID4gIHZvaWQgcmlzY3ZfdXNl
cl9pc2FfZW5hYmxlKHZvaWQpCj4gPiA+ID4gIHsKPiA+ID4KPiA+ID4gSGkgQ2hhcmxpZSwKPiA+
ID4KPiA+ID4gR2VuZXJhbGx5LCBoYXZpbmcgc28gbXVjaCBpZmRlZiBpbiB2YXJpb3VzIHBpZWNl
cyBvZiBjb2RlIGlzIHByb2JhYmx5Cj4gPiA+IG5vdCBhIGdvb2QgaWRlYS4KPiA+ID4KPiA+ID4g
QUZBSUNULCBpZiBDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyBpcyBlbmFi
bGVkLCB0aGUgd2hvbGUKPiA+ID4gbWlzYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgY2hlY2tpbmcgY291
bGQgYmUgb3B0LW91dC4gd2hpY2ggbWVhbnMgdGhhdAo+ID4gPiBwcm9iYWJseSBldmVyeXRoaW5n
IHJlbGF0ZWQgdG8gbWlzYWxpZ25lZCBhY2Nlc3NlcyBzaG91bGQgYmUgbW92ZWQgaW4KPiA+ID4g
aXQncyBvd24gZmlsZSBidWlsZCBpdCBvbmx5IGZvciBDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5B
TElHTkVEX0FDQ0VTUz1uCj4gPiA+IG9ubHkuCj4gPgo+ID4gSSB3aWxsIGxvb2sgaW50byBkb2lu
ZyBzb21ldGhpbmcgbW9yZSBjbGV2ZXIgaGVyZSEgSSBhZ3JlZSBpdCBpcyBub3QKPiA+IHZlcnkg
bmljZSB0byBoYXZlIHNvIG1hbnkgaWZkZWZzIHNjYXR0ZXJlZC4KPiA+Cj4gPiA+Cj4gPiA+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gPiA+ID4gaW5kZXggYTdjNTZiNDFlZmQyLi4zZjFhNmVk
ZmRiMDggMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUu
Ywo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiA+ID4gPiBA
QCAtMTQ5LDYgKzE0OSw3IEBAIHN0YXRpYyBib29sIGh3cHJvYmVfZXh0MF9oYXMoY29uc3Qgc3Ry
dWN0IGNwdW1hc2sgKmNwdXMsIHVuc2lnbmVkIGxvbmcgZXh0KQo+ID4gPiA+Cj4gPiA+ID4gIHN0
YXRpYyB1NjQgaHdwcm9iZV9taXNhbGlnbmVkKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVzKQo+
ID4gPiA+ICB7Cj4gPiA+ID4gKyNpZm5kZWYgQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05F
RF9BQ0NFU1MKPiA+ID4gPiAgICAgaW50IGNwdTsKPiA+ID4gPiAgICAgdTY0IHBlcmYgPSAtMVVM
TDsKPiA+ID4gPgo+ID4gPiA+IEBAIC0xNjgsNiArMTY5LDkgQEAgc3RhdGljIHU2NCBod3Byb2Jl
X21pc2FsaWduZWQoY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdXMpCj4gPiA+ID4gICAgICAgICAg
ICAgcmV0dXJuIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktOT1dOOwo+ID4gPiA+Cj4gPiA+
ID4gICAgIHJldHVybiBwZXJmOwo+ID4gPiA+ICsjZWxzZQo+ID4gPiA+ICsgICByZXR1cm4gUklT
Q1ZfSFdQUk9CRV9NSVNBTElHTkVEX0ZBU1Q7Cj4gPiA+ID4gKyNlbmRpZgo+ID4gPiA+ICB9Cj4g
PiA+ID4KPiA+ID4gPiAgc3RhdGljIHZvaWQgaHdwcm9iZV9vbmVfcGFpcihzdHJ1Y3QgcmlzY3Zf
aHdwcm9iZSAqcGFpciwKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZD4gaW5k
ZXggOGRlZDIyNWU4YzViLi5jMjRmNzlkNzY5ZjYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4gPiA+ID4gQEAgLTQxMyw3ICs0MTMsOSBAQCBpbnQg
aGFuZGxlX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ID4gPgo+ID4g
PiA+ICAgICBwZXJmX3N3X2V2ZW50KFBFUkZfQ09VTlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwg
cmVncywgYWRkcik7Cj4gPiA+ID4KPiA+ID4gPiArI2lmbmRlZiBDT05GSUdfSEFWRV9FRkZJQ0lF
TlRfVU5BTElHTkVEX0FDQ0VTUwo+ID4gPiA+ICAgICAqdGhpc19jcHVfcHRyKCZtaXNhbGlnbmVk
X2FjY2Vzc19zcGVlZCkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQ7Cj4gPiA+
ID4gKyNlbmRpZgo+ID4gPgo+ID4gPiBJIHRoaW5rIHRoYXQgcmF0aGVyIHVzaW5nIGlmZGVmZXJ5
IGluc2lkZSB0aGlzIGZpbGUgKHRyYXBzX21pc2FsaWduZWQuYykKPiA+ID4gIGl0IGNhbiBiZSB0
b3RhbGx5IG9wdC1vdXQgaW4gY2FzZSB3ZSBoYXZlCj4gPiA+IENPTkZJR19IQVZFX0VGRklDSUVO
VF9VTkFMSUdORURfQUNDRVNTIHNpbmNlIGl0IGltcGxpZXMgdGhhdCBtaXNhbGlnbmVkCj4gPiA+
IGFjY2Vzc2VzIGFyZSBub3QgZW11bGF0ZWQgKGF0IGxlYXN0IHRoYXQgaXMgbXkgdW5kZXJzdGFu
ZGluZykuCj4gPiA+Cj4gPgo+ID4gVGhhdCdzIGEgZ3JlYXQgaWRlYSwgSSBiZWxpZXZlIHRoYXQg
aXMgY29ycmVjdC4KPiA+Cj4gPiAtIENoYXJsaWUKPiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4KPiA+
ID4gQ2zDqW1lbnQKPiA+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ICAgICBpZiAoIXVuYWxpZ25l
ZF9lbmFibGVkKQo+ID4gPiA+ICAgICAgICAgICAgIHJldHVybiAtMTsKPiA+ID4gPiBAQCAtNTk2
LDYgKzU5OCw3IEBAIGludCBoYW5kbGVfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAq
cmVncykKPiA+ID4gPiAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gIH0KPiA+ID4gPgo+ID4gPiA+ICsj
aWZuZGVmIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4gPiA+ID4gIGJv
b2wgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChpbnQgY3B1KQo+ID4gPiA+ICB7Cj4g
PiA+ID4gICAgIGxvbmcgKm1hc19wdHIgPSBwZXJfY3B1X3B0cigmbWlzYWxpZ25lZF9hY2Nlc3Nf
c3BlZWQsIGNwdSk7Cj4gPiA+ID4gQEAgLTY0MCw2ICs2NDMsNyBAQCB2b2lkIHVuYWxpZ25lZF9l
bXVsYXRpb25fZmluaXNoKHZvaWQpCj4gPiA+ID4gICAgIH0KPiA+ID4gPiAgICAgdW5hbGlnbmVk
X2N0bCA9IHRydWU7Cj4gPiA+ID4gIH0KPiA+ID4gPiArI2VuZGlmCj4gPiA+ID4KPiA+ID4gPiAg
Ym9vbCB1bmFsaWduZWRfY3RsX2F2YWlsYWJsZSh2b2lkKQo+ID4gPiA+ICB7Cj4gPiA+ID4KPiA+
ID4KPiA+ID4KPiA+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
