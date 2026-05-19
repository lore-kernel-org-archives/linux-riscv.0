Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A365FCD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 07:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2/6dmHVWneLovZBSz8YD6sUMWifV0XgU0MYf/uwAPY=; b=mlND6L5kbhUGuG
	WPezMqtcC4OVoOtz3dxUvQ6zbmjGZAjvEP8cf1NhcFzzSR5hPFjfR1lxvqaTWXiStrjYxXEpR7rxl
	09yOWMVctGXphuMU9RaJTI3YfdKZsK/sLUS/XcN5s8H8GTH6il/XzrQKuNi8nSED5mWxob9ek9m/a
	1JnEUDwyMojNI1yv6H56Ox9hQRt6HxnPf1xjT8N78YTr/CaPMNFAwNqd9IstNvnMDXjjj9JTxiBUp
	R/rbzy/yHEohY3sDlpugWHa8OtCvABbMxAv2nFlGOAGaSS3cDnYNO2uwUsTu5m4/Yhy5WslV5CzVI
	fOkBjSrnnBq7aGOGuqTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEVj-00000000R8G-01iD;
	Tue, 19 May 2026 07:05:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEVg-00000000R7D-2LpG
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 07:05:01 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-67f94c078e8so5669764a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 00:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779174298; cv=none;
        d=google.com; s=arc-20240605;
        b=JGquHui5iebWGmDl7M7lY2KO9gX57ek/nPlLjryRsvcRodkTB4u0nM55A8H9IeCzjo
         jgbmgWMG9o0IiK8KuWwp/nd2gzchJqCMrBN6T4fZcC0IHY0dsH+MgsSH42iPW/GkydEi
         bDtsVY9RiVdqMwCPkm93tNMGnNBj08JfZ/+rtDBqjPQuL39WwBWGYvjJZ+sjloonu4qo
         OgL7C5s5S/+9m2NEwsGYgrwoYaa2vDaqfYqbyctt/iFDQkmDA153O9tNkx/P9UqXQGT9
         szs0F5X0jnt903nuUxIVCdb/F3Zgy0bIjxvnTfp0pzAYjnzS9znyWNV82BqBRxowz6XL
         j7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S70kK6faPyOp5IrSpATfBcKYNb4qxuE6RTVyujaxt2o=;
        fh=bh35spTpJX/AKsBmtmVWhSLE4183F+7JOoIhg3wtYc8=;
        b=T049rxcD1mH8LMemjBzNnOZ99NWlSMwofX6BI50oLXyuLdRbPA7tBEl+eoH7rSoJ2P
         c5lI0O4HtERevx5oIb9bR03hEAyiljhAVzeoY/wjwTbioNjWZUH9mSjWmJGjM4yG/Uv9
         +LD1I+FjcBWQLLZyl3FCWNj/vv9oYJJ78tTD3Jw396JIgr1rvr1kp12JJIsEUIN6PAU9
         k7rTBNzAxk0fqaPGt/6DDyUntpT3QGqRorhQ2nEvEGEQrF31IqbNiyuvSFNJE3y7s0lK
         q3fJNPt9BayIwO9XTxxdeAlfKw3dJbjcYg1PvYd4xQ8EZx61d8iaDpfAvBltMwdhePH7
         VsOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779174298; x=1779779098; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S70kK6faPyOp5IrSpATfBcKYNb4qxuE6RTVyujaxt2o=;
        b=a+FehaGZ3Rfps4WyQGZJPwwNmGy/Ys290f92nguuA93q0YpKwwBt6YbqnhqIPZb5Du
         mhr1sKf9lSyrxAT29mssfl3qiSkrmNO/a8KJNvnxxydeGzRY26/PLzFpv0p/XMxSo5kk
         OaKt4spj71REATO5QaWERT6PwwOrbLw3dGKfJ2ezqZsI8MIxvfFmMbnFuMzjfziSYWwD
         qzdhysC7pxs8/dmyI0g/nabu9CSSAS/ByyhDevgoAEmvGUIFBz5GiIOXj5UpkiIYyanp
         /CkbNtmr7rWNhDs+o1apoD6Llujidn4WGqfToLHvdFHM0PArfgNdi5I4iS2L4qbRGyr6
         M5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174298; x=1779779098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S70kK6faPyOp5IrSpATfBcKYNb4qxuE6RTVyujaxt2o=;
        b=E0SlZjYyCjyBr9qcRvSs/dF0Vuat1IxeZOU7xIpCjySnY3MVUHTa67zXD+FkmOqa/w
         CiXciDt0j2E5hCBe+gomAGS985Mcvse6yQjwJdNGXppu9p9pdVVsltzx6/taQjN64oGR
         GLW8etyud8pNTyQWZoVeU6KYOQW/LjHYZAaA6eIvtvCIeUKnORET3pD3kUjOZuOBDnq4
         GDfzoc4lN984d7AdD+Z6pwCAQTonTC5OLcdD7HJK+XZyCh+lJ74Hetklk2AqsYKtJe64
         NmTRBmCF7ooY/Pb0l8+iv/LOV0RMOFsmLDvBRUiMtlj4tArbH3FFL/DC3nRde0j6zwPt
         xs9A==
X-Forwarded-Encrypted: i=1; AFNElJ+sWCJXXwXr5pibEA6W/q51BPSy3BROk5yu017Lf9Na7w70Ml6iFPDMCITuf1XwweFoKyD9Gx9MrzTHEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNvEPV4owJlPmO6OUOKVjTAWPb9tC8XJZ3wl1N91Zc/ODzMyEU
	w7ozu+quMCTVO8g1W7dKJbji8a3j6LYuvSUBohTvjDOtlcLdBPYQmtY8WxwLeYYSc2ye0AEdKxR
	6yvZfWAQCsLm1qdGaKZhlx2lrC8TnjJJqr9n6EAITJ6iEKrGj5qfVLI22vZ4A
X-Gm-Gg: Acq92OEwsJ9adJ0EF2NQj9T7NjUae4+C9oz+nOrA02WeIbOIZyoCJLA5H6vDWzJpveW
	QPatv8MpIwi2Qy4iYd90nywAd+ZsfgtyG3cGRq+fufPgkmvZgOxx3JnTNI18DXrLubxH0y0vk0I
	YxQNpaPbLDyj15lttIxtcTn4SbwNqDkMa7ZQvzxYIZbcv66oHwkEleTy5LCNHVpIMuu4YBDdfpx
	f6bLssJKM/aqzqBX52WfwYCvzmtAHeVcuR3RdD43KcRDjxcvc19FFwfbsr1agPFxCzb/8Io0ItL
	MbYjgBfB9w==
X-Received: by 2002:a17:907:c247:b0:bad:92f5:daea with SMTP id
 a640c23a62f3a-bd5177b3559mr1031818166b.14.1779174297595; Tue, 19 May 2026
 00:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260514075036.1432352-1-zong.li@sifive.com> <20260514095605.2c7d8761@pumpkin>
 <CANXhq0rY8wb-0x2whLGMSuWLujtZwrEsmpWh_PUhxoZ0gpA96w@mail.gmail.com>
 <20260515102411.4d3e868a@pumpkin> <CANXhq0p-YeNHGtQGHVvHSRvSaDtEvoY=KHc019iRBfQM7aV+ZA@mail.gmail.com>
 <20260515201613.243ea49b@pumpkin> <CANXhq0qOjCVOQfCe5QqNU+UksAzK3F4OLYAFSfsBrRP3zo9GUg@mail.gmail.com>
 <20260518105725.7afe7a4c@pumpkin>
In-Reply-To: <20260518105725.7afe7a4c@pumpkin>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 19 May 2026 15:04:47 +0800
X-Gm-Features: AVHnY4J4EbAvrPQ9Kv4_1VTWgFeeuxJdx2VX_qr_mZiWrNSEb_SEe2LUMUhaTos
Message-ID: <CANXhq0qRrBpZ+OzajtuMza4EtiUB+AWuxco+87OGP-ODqmrQSg@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: cif: reduce shadow stack size limit from 4GB to 2GB
To: David Laight <david.laight.linux@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	debug@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_000500_652507_D5FAB255 
X-CRM114-Status: GOOD (  52.13  )
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgNTo1N+KAr1BNIERhdmlkIExhaWdodAo8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDE4IE1heSAyMDI2IDExOjU0
OjMyICswODAwCj4gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPgo+ID4gT24g
U2F0LCBNYXkgMTYsIDIwMjYgYXQgMzoxNuKAr0FNIERhdmlkIExhaWdodAo+ID4gPGRhdmlkLmxh
aWdodC5saW51eEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIDE1IE1heSAy
MDI2IDIyOjI5OjA1ICswODAwCj4gPiA+IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+ID4gT24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgNToyNOKAr1BNIERhdmlk
IExhaWdodAo+ID4gPiA+IDxkYXZpZC5sYWlnaHQubGludXhAZ21haWwuY29tPiB3cm90ZToKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBPbiBGcmksIDE1IE1heSAyMDI2IDExOjQyOjQ1ICswODAwCj4gPiA+
ID4gPiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gT24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgNDo1NuKAr1BNIERhdmlkIExhaWdodAo+ID4g
PiA+ID4gLi4KPiA+ID4gPiA+ID4gPiBJIGFsc28gZG9uJ3QgdW5kZXJzdGFuZCB0aGUgcmF0aW9u
YWwgZm9yIGp1c3QgLzIgYW5kIHRoZSAyRyB1cHBlciBsaW1pdC4KPiA+ID4gPiA+ID4gPiBZb3Ug
bmVlZCA1MTIgbmVzdGVkIGZ1bmN0aW9uIGNhbGxzIHRvIGV2ZW4gdXNlIDRrLgo+ID4gPiA+ID4g
PiA+IFRoYXQgd291bGQgaGF2ZSB0byBiZSBxdWl0ZSBkZWVwIHJlY3Vyc2lvbi4KPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gRHVyaW5nIHRoZSBkaXNjdXNzaW9ucyBhYm91dCB0aGUgQVJNIEdDUyB2
MyBzZXJpZXMsIGNvbW11bml0eSBwb2ludGVkCj4gPiA+ID4gPiA+IG91dCB0aGF0IGEgNEcgc2hh
ZG93IHN0YWNrIG1pZ2h0IGJlIHRvbyBsYXJnZS4gVGhpcyBzaXplIGlzIGhhcmQgdG8KPiA+ID4g
PiA+ID4gc3VwcG9ydCBpbiBtZW1vcnktY29uc3RyYWluZWQgZW52aXJvbm1lbnRzIGxpa2UgQW5k
cm9pZC4gSG93ZXZlciwgdGhlCj4gPiA+ID4gPiA+IHNpemUgY2Fubm90IGJlIHRvbyBzbWFsbCBl
aXRoZXIsIG9yIHdlIG1pZ2h0IGZhY2Ugc3RhY2sgb3ZlcmZsb3cKPiA+ID4gPiA+ID4gaXNzdWVz
LiBBdCB0aGF0IHRpbWUsIGEgcGVyZmVjdCBzaXplIHdhcyBub3QgZGVjaWRlZC4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBJdCBpcyBvbmx5IFZBIG5vdCByZWFsIG1lbW9yeSBzbyBzaG91bGRuJ3QgbWFr
ZSBtdWNoIGRpZmZlcmVuY2UgdG8gbWVtb3J5Cj4gPiA+ID4gPiB1c2UgKGV4Y2VwdCBmb3Igbm9t
bXUgd2hlcmUgdGhlIGFjdHVhbCBtZW1vcnkgaGFzIHRvIGJlIGFsbG9jYXRlZCkuCj4gPiA+ID4g
Pgo+ID4gPiA+Cj4gPiA+ID4gWW91IHJhaXNlIGEgdmFsaWQgcG9pbnQgdGhhdCBzaGFkb3cgc3Rh
Y2tzIGFyZSBwcmltYXJpbHkgYSBWQQo+ID4gPiA+IGFsbG9jYXRpb24uIEhvd2V2ZXIsIGluIExp
bnV4LCB0aGUgbWVtb3J5IG92ZXJjb21taXQgbWVjaGFuaXNtIGNyZWF0ZXMKPiA+ID4gPiBhIHBy
YWN0aWNhbCBsaW5rIGJldHdlZW4gVkEgYWxsb2NhdGlvbiBhbmQgcGh5c2ljYWwgbWVtb3J5IGNh
cGFjaXR5Lgo+ID4gPiA+IEFzIEkgbWVudGlvbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZSwgbWVt
b3J5IGFsbG9jYXRpb24gd2lsbCBmYWlsIHdoZW4KPiA+ID4gPiB0aGUgb3ZlcmNvbW1pdCBtb2Rl
IGlzIHNldCB0byBPVkVSQ09NTUlUX0dVRVNTIG9yIE9WRVJDT01NSVRfTkVWRVIuCj4gPiA+ID4K
PiA+ID4gPiBJbiBfX3ZtX2Vub3VnaF9tZW1vcnk6Cj4gPiA+ID4gICAgICAgICBpZiAocGFnZXMg
PiB0b3RhbHJhbV9wYWdlcygpICsgdG90YWxfc3dhcF9wYWdlcykKPiA+ID4gPiAgICAgICAgICAg
ICAgICAgZ290byBlcnJvcjsKPiA+ID4gPgo+ID4gPiA+IE1hbnkgcGFnZSByZXF1ZXN0cyBmb3Ig
VkEgd2lsbCBmYWlsIGlmIHRoZSByZXF1ZXN0ZWQgc2l6ZSBleGNlZWRzIHRoZQo+ID4gPiA+IHN5
c3RlbSdzIHRvdGFsIFJBTSBwbHVzIFN3YXAuIE9uIG1lbW9yeS1jb25zdHJhaW5lZCBzeXN0ZW1z
LAo+ID4gPiA+IGFsbG9jYXRpbmcgYSBtYXNzaXZlIDRHQiBzaGFkb3cgc3RhY2sgcGVyIHRocmVh
ZCB3b3VsZCBpbW1lZGlhdGVseQo+ID4gPiA+IHRyaWdnZXIgdGhpcyBlcnJvci4KPiA+ID4KPiA+
ID4gQnV0IHJlZHVjaW5nIHRoZSBzaXplIGJ5IGhhbGYgbWFrZXMgbGl0dGxlIGRpZmZlcmVuY2Uu
Cj4gPiA+IFlvdSdkIG5lZWQgYSBtdWNoIGJpZ2dlciByZWR1Y3Rpb24gdG8gbWFrZSBhbnkgcmVh
bCBkaWZmZXJlbmNlLgo+ID4gPgo+ID4KPiA+IEkgYWdyZWUgd2l0aCB5b3UgdGhhdCBhIHNtYWxs
ZXIgc2l6ZSB3b3VsZCBjb3ZlciBtb3JlIGNhc2VzLiBJIGFtIHZlcnkKPiA+IG9wZW4gdG8geW91
ciBpZGVhcyByZWdhcmRpbmcgdGhlIHNpemUuIFdvdWxkIHlvdSBwcmVmZXIgdG8gdXNlIDFHQiBv
cgo+ID4gNTEyTUIgYXMgdGhlIGRlZmF1bHQgaW5zdGVhZD8KPiA+IEFzIEkgbWVudGlvbmVkIGlu
IG15IHByZXZpb3VzIGVtYWlscywgdXNpbmcgMkdCIHNlZW1zIHRvIGJlIGEgc2FmZQo+ID4gc3Rh
cnRpbmcgcG9pbnQuIFRoaXMgaXMgYmVjYXVzZSBpdCBpcyBhbHJlYWR5IGFjY2VwdGVkIGJ5IHRo
ZQo+ID4gY29tbXVuaXR5IGFuZCB0aGUgQW5kcm9pZCBzeXN0ZW0gKGluIEdDUyBpbXBsZW1lbnRh
dGlvbikuCj4gPiBBZGRpdGlvbmFsbHksIGFsdGhvdWdoIHRoZSBDRkkgZmVhdHVyZSBkb2Vzbid0
IHN1cHBvcnQgMzItYml0IHN5c3RlbXMKPiA+IHlldCwgbm9ybWFsIDMyLWJpdCBzeXN0ZW1zIGNh
biBvbmx5IHN1cHBvcnQgdXAgdG8gNEdCIG9mIHBoeXNpY2FsCj4gPiBtZW1vcnkuIElmIHRoZSBk
ZWZhdWx0IHNoYWRvdyBzdGFjayBzaXplIGlzIDRHQiwgaXQgd291bGQgYmUgYWxtb3N0Cj4gPiBp
bXBvc3NpYmxlIHRvIHJ1biBvbiBhIDMyLWJpdCBzeXN0ZW0uIFVzaW5nIGF0IGxlYXN0IDJHQiBj
YW4gaGVscAo+ID4gYXZvaWQgdGhpcyBpc3N1ZSBpbiB0aGUgZnV0dXJlLiBJZiB5b3UgZG9uJ3Qg
aGF2ZSBhIHByZWZlcnJlZCBkZWZhdWx0Cj4gPiB2YWx1ZSwgbWF5YmUgd2UgY291bGQgc3RhcnQg
d2l0aCAyRz8KPgo+IEkndmUgbm8gcmVhbCBpZGVhIC0gbm90ZSB0aGF0IHRoZSBybGltaXQgdmFs
dWUgc2hvdWxkIGJlIHNtYWxsIGZvciAzMmJpdAo+IChvciBhdCBsZWFzdCB0aGUgYWN0dWFsIHN0
YWNrIGlzIHNtYWxsIHJlZ2FyZGxlc3Mgb2YgdGhlIHJsaW1pdCB2YWx1ZSkuCj4gVGhlIDJHIGlz
IGp1c3QgYW4gdXBwZXIgYm91bmQgLSBwcm9iYWJseSBtYXRjaGluZyB0aGUgNEcgdXBwZXIgYm91
bmQKPiBmb3IgdGhlIDY0Yml0IHN0YWNrIGl0c2VsZi4KPgo+IERvbid0IGZvY3VzIG9uIHRoZSAy
RyBsaW1pdCwgYnV0IG9uIHRoZSBybGltaXQoU1RBQ0spLzIgKG9yIHJhdGhlciB0aGUgc2l6ZQo+
IG9mIHRoZSBub3JtYWwgc3RhY2spLgo+IE9uIG15IHN5c3RlbXMgdGhlIGRlZmF1bHQgc29mdCBs
aW1pdCBpcyA4TSwgYSA0TSBzaGFkb3cgc3RhY2sgc3VwcG9ydHMgNTEyawo+IG5lc3RlZCBmdW5j
dGlvbiBjYWxscyAoNjRiaXQpIC0gbm9uZSBvZiB3aGljaCBjYW4gaGF2ZSBhbnkgbG9jYWwgZGF0
YS4KPiBJbiByZWFsaXR5IHByb2dyYW1zIHRoYXQgdXNlIGEgbG90IG9mIHN0YWNrIGFsbG9jYXRl
IGxhcmdlIGJ1ZmZlcnMgb24gc3RhY2ssCj4gdGhleSBkb24ndCBoYXZlIHNpbGx5IGRlcHRocyBv
ZiByZWN1cnNpdmUgZnVuY3Rpb25zIHdpdGggbm8gbG9jYWwgZGF0YS4KPgo+IEkndmUganVzdCBs
b29rZWQgYXQgdm1saW51eC5vIC0gd2hpY2ggd29uJ3QgYmUgcmVwcmVzZW50YXRpdmUgb2YgdXNl
cnNwYWNlIQo+IFdoaWxlIHRoZXJlIGFyZSBhIGxvdCBvZiBmdW5jdGlvbnMgd2l0aCBzbWFsbCBz
dGFjayBmcmFtZSAoc3ViICQweDEwLCVyc3ApCj4gdGhleSB0ZW5kIHRvIGhhdmUgc2F2ZWQgYSBm
ZXcgcmVnaXN0ZXJzIGluIHN0YWNrIGZpcnN0Lgo+IFRoZSBtYWpvcml0eSB3aWxsIGhhdmUgYSBz
dGFjayBkZWx0YSBvZiBvdmVyIDY0IGJ5dGVzLgo+IFRoYXQgY29ycmVzcG9uZHMgdG8gcmxpbWl0
KFNUQUNLKS84IGFuZCBldmVuIHRoYXQgaXMgY29uc2VydmF0aXZlLgo+Cj4gSSdkIHN1c3BlY3Qg
dGhhdCBjb3VsZCBzYWZlbHkgaGFsdmUgdGhhdCBhZ2Fpbi4KClRoYW5rIHlvdSBmb3IgdGhlIGRl
dGFpbGVkIGFuYWx5c2lzIGFuZCB0aGUgZW1waXJpY2FsIGRhdGEuCgpXaXRoIFJMSU1JVF9TVEFD
Sy84LCB0aGUgY29ycmVzcG9uZGluZyB1cHBlciBsaW1pdCBjb3VsZCBiZSBTWl81MTJNLAp3aGlj
aCBhbHNvIGJldHRlciBhY2NvbW1vZGF0ZXMgbWVtb3J5LWNvbnN0cmFpbmVkIHBsYXRmb3Jtcy4g
VGhpcwp3b3VsZCBwcm92aWRlOgotIDEyOEsgY2FsbCBkZXB0aCBvbiB0eXBpY2FsIHN5c3RlbXMg
KDhNQiBybGltaXQpCi0gNzUlIG1lbW9yeSBzYXZpbmdzIGluIG11bHRpLXRocmVhZGVkIGVudmly
b25tZW50cwotIE1vcmUgcmVhc29uYWJsZSBmb3IgbWVtb3J5LWNvbnN0cmFpbmVkIHN5c3RlbXMK
CldoaWxlIEkgYXBwcmVjaWF0ZSB5b3VyIHN1Z2dlc3Rpb24gdGhhdCBSTElNSVRfU1RBQ0svMTYg
bWlnaHQgYWxzbyBiZQpzdWZmaWNpZW50LCBsZXQncyB0cnkgdGhlIFJMSU1JVF9TVEFDSy84IGFw
cHJvYWNoIGZpcnN0LiBUaGlzIGdpdmVzIHVzCmEgZ29vZCBiYWxhbmNlIGJldHdlZW4gbWVtb3J5
IGVmZmljaWVuY3kgYW5kIHNhZmV0eSBtYXJnaW4sIGFuZCB3ZSBjYW4KYWx3YXlzIHJldmlzaXQg
aWYgcmVhbC13b3JsZCB1c2FnZSBkYXRhIHN1Z2dlc3RzIHdlIGNhbiBnbyBzbWFsbGVyLgpJJ2xs
IHVwZGF0ZSB0aGUgcGF0Y2ggdG8gdXNlIFJMSU1JVF9TVEFDSy84IHdpdGggU1pfNTEyTSBjYXAu
CgpUaGFuayB5b3UgYWdhaW4gZm9yIHRoZSB0aG9yb3VnaCBhbmFseXNpcyEKCj4KPiBBY3R1YWxs
eSB3b3VsZCBpdCBiZSBwb3NzaWJsZSB0byBpbml0aWFsbHkganVzdCBhbGxvY2F0ZSBvbmUgcGFn
ZT8KPiBJZiB5b3UgZ2V0IGFuIG92ZXJmbG93IGZhdWx0IG9uIHRoZSBzaGFkb3cgc3RhY2sgSSB0
aGluayB5b3UgY2FuCj4gc2FmZWx5IHJlYWxsb2NhdGUgaXQgYXQgYW4gZW50aXJlbHkgZGlmZmVy
ZW50IHVzZXIgdmlydHVhbCBhZGRyZXNzLgo+IFRoYXQgd291bGQgcmVtb3ZlIGFsbCB0aGUgcHJv
YmxlbXMgb3ZlciBjb21taXR0aW5nIGEgbG90IG9mIHN3YXAuCj4gTW9zdCB0aHJlYWRzIHdpbGwg
bmV2ZXIgZG8gdGhlIDUxMiBuZXN0ZWQgY2FsbHMgbmVlZGVkIHRvIGJsb3cgdGhlIHN0YWNrLgo+
Cj4gLS0gRGF2aWQKPgo+ID4KPiA+Cj4gPiA+IC0tIERhdmlkCj4gPiA+Cj4gPiA+ID4KPiA+ID4g
PiA+IEJ1dCAzMmJpdCBwcm9ncmFtcyB3aXRoIGxvdHMgb2YgdGhyZWFkcyBjYW4gcnVuIG91dCBv
ZiBWQS4KPiA+ID4gPiA+IEluY3JlYXNpbmcgdGhlIHN0YWNrIFZBIHNpemUgYnkgNTAlIG1pZ2h0
IGV2ZW4gZ2l2ZSBwcm9ibGVtcyBmb3IgNjRiaXQKPiA+ID4gPiA+IHByb2dyYW1zIC0gaWYgdGhl
eSBhcmUgYWxyZWFkeSByZWR1Y2luZyB0aGUgdGhyZWFkIHN0YWNrIHNpemUgYXZvaWQKPiA+ID4g
PiA+IHJ1bm5pbmcgb3V0IG9mIFZBLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkndmUgbm90IGNoZWNr
ZWQsIGJ1dCBwdGhyZWFkX2F0dHJfc2V0c3RhY2tzaXplKCkgc2V0cyBhIGxpbWl0IGZvciB0aGUK
PiA+ID4gPiA+IHRocmVhZCBzdGFjayBzaXplICh3aGljaCB3b3VsZCBvdGhlcndpc2UgZGVmYXVs
dCBzbyBybGltaXQoU1RBQ0spKS4KPiA+ID4gPiA+IEkgZG9uJ3QgYmVsaWV2ZSBpdCBzaG91bGQg
dXBkYXRlIHRoZSBybGltaXQgdmFsdWUgaXRzZWxmLgo+ID4gPiA+ID4gSW4gd2hpY2ggY2FzZSB5
b3UgYXJlIHVzaW5nIHRoZSB3cm9uZyBzaXplLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEJ1dCBmb3Ig
YSB0aHJlYWQgd2l0aCBhIHZlcnkgcmVkdWNlZCBzdGFjayAoc2F5IDEyOGspIHlvdSBwcm9iYWJs
eSBvbmx5Cj4gPiA+ID4gPiBuZWVkIDEgcGFnZSBvZiBzaGFkb3cgc3RhY2ssIGFueSBtb3JlIGNv
dWxkIGVhc2lseSBsZWFkIHRvIHJ1bm5pbmcgb3V0Cj4gPiA+ID4gPiBvZiBWQS4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiAtLSBEYXZpZAo+ID4gPiA+Cj4gPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
