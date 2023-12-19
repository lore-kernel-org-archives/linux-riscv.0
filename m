Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3353C41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 14:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8j0cPhNljCHxDpp9RBJZCRh+dj44IZ2GzkxPXyBQ/Ck=; b=sn0NAKBvidpX3K
	EjK452Obf7exllpmtANjoL2cx3A5bx/fLhlgm7CWklbfnwTFMsLXFZ4JYDppKb8NRcpfz3BA3gsko
	9H2xy5yngXh4lTmqKQ2iR8XCoYkYZgDw200F6t2vOWvIONr8vft5BTJMFFKzjYBxZLSCiZsU3BU8R
	xhrhKdeJLXr1WjRi7zk/v6GZijpMBC3KNPgiHoZxTlUk/BkCQcrSStNeF04acW2+Qy+HouOpdfokX
	gOQMhI6kngFvxylODGHWYOibgHfSfMXfpFShZBotqg3/il8i3dGMMGFcEs+pOV4oIjK/aJVWdY+5b
	HSrbxcXTFbSBlVPPuuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFbJc-00EQ0x-2k;
	Tue, 19 Dec 2023 14:43:24 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFbJZ-00EPz4-1v
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 14:43:22 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50e2168ab09so5617660e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 06:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702996997; x=1703601797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/HxSqSrr7Cc6g9I9Py85ofZHhelqkEAw2n/h3/NW2Q=;
        b=QH78XzrBYUAlwIpqkincs77K8mGfknpphmNLmQPOR3qWWnzdtkWw0g0KpWt9k7ChPI
         YUHQ7vHzi9r1VS3YTC8KXGlvBlsaQFbh+ApoSunHBiwH3zWwuW82d/ERRXom3EOW+m/t
         var3PD6iFIfqdUV9JpI1CB9atEXJMvU3UvhN5saHp1USCPTb/TC5hHRlkTdayfiADyLy
         Jslv693uZtpov/UgXNtsiYc1KLwFauk0XOQKaWPfQWeRjbbGENbxYdSUsiTayLAXbytT
         dRmSQ20RrU6PAZt63rkvqsdgkoKpwwMiZchiNffGS66ADfInhzpnVKEKnHaGEE9/fwbZ
         tjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702996997; x=1703601797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/HxSqSrr7Cc6g9I9Py85ofZHhelqkEAw2n/h3/NW2Q=;
        b=Zx2SuTGRpb8gLFlUgH4cml2vQOl8AKWGMFoc10OmM2nd8j58dtYyr9vfK7ntqbtudM
         3GPEQmsM1vyS3e1zBDl9WbsQIE0nHcJaK+ZhHva7BxlcVll+vwP3Ls48S53QBBqEPRiK
         wIivxQI/8G/TegXGNoY+j4f9O0QPOp3ghplX3NN+zDHW2OEcjVwQm+jDlTLOYHt3JuiZ
         npearCCYG9iw3sga08wLr35dZkz/Vjelnk5h5DpK93XjfkLkyfQ6wCxhqJRVRW4bMlpH
         V1hVQDjzFZQP6Qx8qxrSdmPsASHPVFaiUcjycuZ/UPFLVEdCq3mFKzoiVPFPBaXBgQ9/
         Rg7Q==
X-Gm-Message-State: AOJu0Yzo0HcOdYYmhXt+tRnVU+1Du5GgSBLIlH2pVC4kDKLJ/Xe52k2w
	PLxk/FQsAiEsWHAGsBdKtszXsrs/AOmvxFM1rBX5bw==
X-Google-Smtp-Source: AGHT+IH8CN8t0Um129rFriUSkUJAqeeqk58I0DFd+02uZRFItmLpVBpTyAnZ8VqPAIRW7okUjCE1j4zqsdMDUYPipOc=
X-Received: by 2002:a05:6512:3b92:b0:50e:4b7e:37aa with SMTP id
 g18-20020a0565123b9200b0050e4b7e37aamr476993lfv.28.1702996997420; Tue, 19 Dec
 2023 06:43:17 -0800 (PST)
MIME-Version: 1.0
References: <20231214155721.1753-1-andy.chiu@sifive.com> <20231214155721.1753-6-andy.chiu@sifive.com>
 <ZXvxbbBWXqIy/05b@ghost> <20231215-583aa7503721723916a1819e@orel>
In-Reply-To: <20231215-583aa7503721723916a1819e@orel>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 19 Dec 2023 22:43:05 +0800
Message-ID: <CABgGipXM8=OM00K09vGbjgw+eOo8=02skk-BT0n6N7KYmHkfgw@mail.gmail.com>
Subject: Re: [v5, 5/6] riscv: lib: vectorize copy_to_user/copy_from_user
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	bjorn@kernel.org, ardb@kernel.org, arnd@arndb.de, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Han-Kuan Chen <hankuan.chen@sifive.com>, 
	Heiko Stuebner <heiko@sntech.de>, Aurelien Jarno <aurelien@aurel32.net>, Bo YU <tsu.yubo@gmail.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_064321_644521_F2A2D0BF 
X-CRM114-Status: GOOD (  28.16  )
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

T24gRnJpLCBEZWMgMTUsIDIwMjMgYXQgOTo1MuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMTA6MjU6
NDlQTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gT24gVGh1LCBEZWMgMTQsIDIw
MjMgYXQgMDM6NTc6MjBQTSArMDAwMCwgQW5keSBDaGl1IHdyb3RlOgo+IC4uLgo+ID4gPiAgU1lN
X0ZVTkNfU1RBUlQoX19hc21fY29weV90b191c2VyKQo+ID4gPiArI2lmZGVmIENPTkZJR19SSVND
Vl9JU0FfVgo+ID4gPiArICAgQUxURVJOQVRJVkUoImogZmFsbGJhY2tfc2NhbGFyX3VzZXJjb3B5
IiwgIm5vcCIsIDAsIFJJU0NWX0lTQV9FWFRfdiwgQ09ORklHX1JJU0NWX0lTQV9WKQo+ID4KPiA+
IGhhc192ZWN0b3IgdXNlcyByaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5LCBidXQgdGhpcyBp
cyB0aGUgZXF1aXZhbGVudAo+ID4gb2YgcmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtlbHkuIEl0IHNl
ZW1zIGxpa2UgdGhpcyBzaG91bGQgYmUgY29uc2lzdGVudAo+ID4gYWNyb3NzIGFsbCBjYWxsIHNp
dGVzLiBTaW5jZSBoYXNfdmVjdG9yIHVzZXMgdGhlIHVubGlrZWx5IHZlcnNpb24sIHRoaXMKPiA+
IHNob3VsZCBwcm9iYWJseSBiZSByZWFycmFuZ2VkIHNvIHRoYXQgdGhlIG5vcCBpcyBpbiB0aGUg
bm9uLXZlY3Rvcgo+ID4gdmVyc2lvbiBhbmQgdGhlIGp1bXAgaXMgZm9yIHRoZSB2ZWN0b3IgdmVy
c2lvbi4KPgo+IEkgdGhpbmsgSSBwcmVmZXIgaXQgdGhlIHdheSBpdCBpcywgd2hlcmUgdGhlIG9w
dGltaXplZCBwYXRoIGlzIGZ1bGx5Cj4gb3B0aW1pemVkIGFuZCB0aGUgZmFsbGJhY2sgcGF0aCBh
bHNvIHN1ZmZlcnMgdGhlIGp1bXAuIChJJ3ZlIGFsc28KPiB0YWtlbiB0aGF0IGFwcHJvYWNoIGZv
ciBjbGVhcl9wYWdlKCkpLiBBbHNvLCBhcyBleHRlbnNpb25zIGFyZSBhZG9wdGVkCj4gYnkgbW9y
ZSBhbiBtb3JlIHBsYXRmb3JtcywgYW5kIHdlIHN0YXJ0IHRvIGNvbnNpZGVyIHN3aXRjaGluZyB1
bmxpa2VseXMKPiB0byBsaWtlbHlzLCB0aGVuIGl0IHdvdWxkIGJlIGVhc3kgdG8gbWlzcyBzdHVm
ZiBsaWtlIHRoaXMuCj4KPiA+Cj4gPiBBIG5lYXQgb3B0aW1pemF0aW9uIHlvdSBjYW4gZG8gaGVy
ZSBpcyByZXBsYWNlIHRoZSAibm9wIiB3aXRoIHRoZQo+ID4gaW5zdHJ1Y3Rpb24gdGhhdCB3aWxs
IGJlIGV4ZWN1dGVkIGZpcnN0LiBXaXRoIGhvdyBpdCdzIHdyaXR0ZW4gcmlnaHQgbm93Cj4gPiB5
b3UgY291bGQgcmVwbGFjZSB0aGUgbm9wIHdpdGggdGhlIGxhIGluc3RydWN0aW9uLiBJdCdzIGp1
c3QgYSBub3Agc28KPiA+IHRoZSBwZXJmb3JtYW5jZSBkaWZmZXJlbmNlIGlzIHByb2JhYmx5IG5v
dCBnb2luZyB0byBiZSBub3RpY2FibGUgYnV0Cj4gPiBpdCdzIHRoZW9yZXRpY2FsbHkgYmV0dGVy
IHdpdGhvdXQgdGhlIG5vcC4gVGhlIGRvd25zaWRlIG9mIGRvaW5nIHRoaXMgaXMKPgo+IEkgdGhp
bmsgSSBwcmVmZXIgdGhlIG5vcCwgYmVjYXVzZSBpdCdzIGVhc2llciB0byByZWFkIGFuZCBtYWlu
dGFpbiB0aGUKPiBhc3NlbWJseSBmdW5jdGlvbiB3aGVuIHRoZSBBTFRFUk5BVElWRSBkb2Vzbid0
IGRvIGFueXRoaW5nIG90aGVyIHRoYW4KPiBjaG9vc2UgdGhlIGVudHJ5IHBvaW50LgoKR29vZCBw
b2ludC4gSSB3b3VsZCBwcmVmZXIgdGhpcyBhcHByb2FjaCBhcyB3ZWxsLiBMb2FkaW5nIGZyb20g
YQpzeW1ib2wgY2FuIHRha2UgMiBpbnN0cnVjdGlvbnMsIHNvIHdlIHdpbGwgaGF2ZSB0byBpbnNl
cnQgYSBub3AKcGFkZGluZyBmb3IgdGhlIGRlZmF1bHQgcGF0aC4gVGhvdWdoIHRoZSBub3Agd2ls
bCBuZXZlciBleGVjdXRlLCBpdAp3aWxsIG1ha2UgYXNzZW1ibHkgY29kZSBhIGJpdCBoYXJkZXIg
dG8gcmVhZC4gTWF5YmUgd2UgY291bGQgbGVhdmUgaXQKZm9yIGZ1dHVyZSBvcHRpbWl6YXRpb24u
Cgo+Cj4gPiB0aGF0IGl0IHNlZW1zIGxpa2UgYWx0ZXJuYXRpdmVzIGRvIG5vdCB3b3JrIHdpdGgg
bWFjcm9zIHNvIHlvdSBjb3VsZG4ndAo+ID4gcmVwbGFjZSB0aGUgbm9wIHdpdGggYSBSRUdfTCBp
bnN0cnVjdGlvbiwgdW5sZXNzIHRoZXJlIGlzIHNvbWUgdHJpY2sgdG8KPiA+IG1ha2UgaXQgd29y
ay4KPgo+IE9uZSBzaG91bGQgYmUgYWJsZSB0byB1c2UgUkVHX0wgaW4gYW4gYWx0ZXJuYXRpdmUg
c2luY2UgbWFjcm8gZXhwYW5zaW9uCj4gd2lsbCByZXN1bHQgaW4gdGhlIHN0cmluZyAibGQiIG9y
ICJsdyIsIHdoaWNoIGNhbiB0aGVuIGJlIGNvbmNhdGVuYXRlZAo+IHdpdGggaXRzIHBhcmFtZXRl
cnMsIGUuZy4KPgo+ICAgQUxURVJOQVRJVkUoUkVHX0wgIiBhMSwgMChhMikiLCAibm9wIiwgMCwg
MCwgMCkKPgo+IChCdXQgbm90ZSB0aGUgc3BhY2UgYmVmb3JlIHRoZSBhMS4gV2l0aG91dCBpdCwg
d2UnZCBnZXQgImxkYTEsIikKPgoKVW1tLCBwZXJoYXBzIEkgYW0gdXNpbmcgYW4gb2xkZXIgdG9v
bGNoYWluLiBpdCByZXBvcnRzOgoKYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TOjE3OiBFcnJvcjog
dG9vIG1hbnkgcG9zaXRpb25hbCBhcmd1bWVudHMKCm9uIGJpbnV0aWwgMi4zOAoKPiBUaGFua3Ms
Cj4gZHJldwoKVGhhbmtzLApBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
