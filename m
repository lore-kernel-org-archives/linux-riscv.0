Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0A5D132A3
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUETsC/bQ/JoalokiOihF0j7xo0PmIs/ID9w6vTGmpY=; b=c/HuE6Lm3AaMgc
	MJEwMBFCIQ7uG64di6WXNEjoUlxza1D14UiOCfrDchv5CZS/Y7Nt4PrGc15VFR+Eyfgov9Yrzwn/9
	ZUNQgRsYiQ8Ol5Edd3ScnS8FS3OYGD6Zy5KFT4qHQLCQQnsxxuvtv5vPhmvbLIElnwrUY3513gP6F
	Wg9j7Enn7+SbQqJxc4+9C7fMvo/Xi44Y9BuA4EJT6F7JEZ1ELmhLrSkTScGu1n9T/mWIpia06Mbos
	he9+0ZqG1W6G+AiNKy99NkwmiOT7/PoNbv3gwO/t9FMP1AWlX3ptRvapJXzeX1OZXthW2jCovUp8r
	eBSaXwpK3pj9XYgDDU3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7t9L-0000000D7Jd-0fT1;
	Mon, 04 Nov 2024 09:13:27 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7t5N-0000000D65H-00ab
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 09:09:23 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5cecbddb574so1750214a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 01:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730711359; x=1731316159; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=055q6HVRLMtsIiCxhqKFgJlzoVTgwNt+2YbIpiGOuNo=;
        b=JY+O3HUh531Vb8/875iT3Ybazwgl1vmhyyjfwJdIuKsjxKABfNvh+EK3Y2roG/RQCN
         CVH1jboekKPAb4zPAXRwvEBtRwhvHZDM8sOXRadBSUaT44vo2K0oJMZ++pTXi9SMhDOv
         OAvjXKWcTqsx6Q6q/A7H2g/tTY2zDeAEQeXX5RlaehBZ1Kmq526eTfYKguZRV9qWxOq6
         pGPkCixRiBNY56n12XfnW610qJY2oDlYHhHw60sd3sTcyKToFjMcdwXYQ4jmplMdZpnj
         IMwvuZKIXtOuZQh5OhfMPnuzrbk/0iti65g8yUpDUbsxia+et0hJtbaCv/XuUinsKY8S
         6Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730711359; x=1731316159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=055q6HVRLMtsIiCxhqKFgJlzoVTgwNt+2YbIpiGOuNo=;
        b=gIUOEBQS5y+EIg1FSZbA19latqefJBl8s0Ruk1TvUQCzm7YNDt1e+pOiGik1XIhb+u
         RkYBpafonurNvZjWBGsWVcsg/W2qvJS7qw/fVqyY1UP4hSdjztK/NC+adY1bSY267ref
         wQbsNXw8kkdViSMpPXqdUn7Xx2EClWvi/2KglYbtIqC3qz2IcS/6u6PzeQFofo/yywWY
         WK6H5vzWlqpoCDpIHUBJyC7PlPKiDlizv1pBBoO6ANUMIs+y1hjZ8qBoraiGtiu8PIxo
         eeij9+3qLjkctZBpt6zQxsVEJ8PA76/ruPz/qw8nEVbLgHrXT5KMLX/FkJHIOpb4G6+5
         9HaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9GHyk6ZmPrIlAX96NXozrRv/fV23+I/dYvyGmH1IvUEIZqKFsbduzSklrtBWh33Mc2/lUwG7zZ5gGBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOX0AM4MY0SXw3/rbV9CSRf9wAG3kmxjq8POkQtqBObBEcvSmp
	Ixwb9VotfKx7/lzEnwtrJyJtWy9AYULun5z89z3/0WIvTvKtyte0gojuS2+xniAM1pYCbBG141A
	qShoKC+OhEXarmnagQhIv/xiJPRBc3rvU3AQLBA==
X-Google-Smtp-Source: AGHT+IG7T23Pew0G4bjyo8FIV5YjqVKWXQFF//1S8lbRwvUhNbZuSM2H8qF/oqLViu8AJNrr6QEfuupKRznSgIqZeV4=
X-Received: by 2002:a05:6402:51ca:b0:5ce:d397:9f5 with SMTP id
 4fb4d7f45d1cf-5ced3970cbemr2889559a12.24.1730711358703; Mon, 04 Nov 2024
 01:09:18 -0800 (PST)
MIME-Version: 1.0
References: <20241103145153.105097-14-alexghiti@rivosinc.com> <202411041609.gxjI2dsw-lkp@intel.com>
In-Reply-To: <202411041609.gxjI2dsw-lkp@intel.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 4 Nov 2024 10:09:07 +0100
Message-ID: <CAHVXubj8EXCXNPuJ+hqrHwyujjz3GDcqqMjQ4ZFC5VbmZurV3w@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] riscv: Add qspinlock support
To: kernel test robot <lkp@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, oe-kbuild-all@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_010921_340959_954D18E5 
X-CRM114-Status: GOOD (  18.70  )
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

T24gTW9uLCBOb3YgNCwgMjAyNCBhdCAxMDowNeKAr0FNIGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPiB3cm90ZToKPgo+IEhpIEFsZXhhbmRyZSwKPgo+IGtlcm5lbCB0ZXN0IHJvYm90
IG5vdGljZWQgdGhlIGZvbGxvd2luZyBidWlsZCB3YXJuaW5nczoKPgo+IFthdXRvIGJ1aWxkIHRl
c3QgV0FSTklORyBvbiBhcm5kLWFzbS1nZW5lcmljL21hc3Rlcl0KPiBbYWxzbyBidWlsZCB0ZXN0
IFdBUk5JTkcgb24gcm9iaC9mb3ItbmV4dCB0aXAvbG9ja2luZy9jb3JlIGxpbnVzL21hc3RlciB2
Ni4xMi1yYzZdCj4gW2Nhbm5vdCBhcHBseSB0byBuZXh0LTIwMjQxMTAxXQo+IFtJZiB5b3VyIHBh
dGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBraW5kbHkgZHJvcCB1cyBhIG5v
dGUuCj4gQW5kIHdoZW4gc3VibWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFz
ZScgYXMgZG9jdW1lbnRlZCBpbgo+IGh0dHBzOi8vZ2l0LXNjbS5jb20vZG9jcy9naXQtZm9ybWF0
LXBhdGNoI19iYXNlX3RyZWVfaW5mb3JtYXRpb25dCj4KPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHVi
LmNvbS9pbnRlbC1sYWItbGtwL2xpbnV4L2NvbW1pdHMvQWxleGFuZHJlLUdoaXRpL3Jpc2N2LU1v
dmUtY3B1ZmVhdHVyZS1oLW1hY3Jvcy1pbnRvLXRoZWlyLW93bi1oZWFkZXIvMjAyNDExMDMtMjMw
NjE0Cj4gYmFzZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9hcm5kL2FzbS1nZW5lcmljLmdpdCBtYXN0ZXIKPiBwYXRjaCBsaW5rOiAgICBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMTAzMTQ1MTUzLjEwNTA5Ny0xNC1hbGV4Z2hpdGklNDBy
aXZvc2luYy5jb20KPiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0ggdjYgMTMvMTNdIHJpc2N2OiBBZGQg
cXNwaW5sb2NrIHN1cHBvcnQKPiBjb21waWxlcjogY2xhbmcgdmVyc2lvbiAxOS4xLjMgKGh0dHBz
Oi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdCBhYjUxZWNjZjg4ZjUzMjFlN2M2MDU5MWM1
NTQ2YjI1NGI2YWZhYjk5KQo+Cj4gSWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBw
YXRjaC9jb21taXQgKGkuZS4gbm90IGp1c3QgYSBuZXcgdmVyc2lvbiBvZgo+IHRoZSBzYW1lIHBh
dGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MKPiB8IFJlcG9ydGVkLWJ5OiBr
ZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiB8IENsb3NlczogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI0MTEwNDE2MDkuZ3hqSTJkc3ctbGtwQGludGVs
LmNvbS8KPgo+IGluY2x1ZGVjaGVjayB3YXJuaW5nczogKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+
KQo+ID4+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3BpbmxvY2suaDogYXNtL3RpY2tldF9zcGlu
bG9jay5oIGlzIGluY2x1ZGVkIG1vcmUgdGhhbiBvbmNlLgo+ID4+IGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc3BpbmxvY2suaDogYXNtL3FzcGlubG9jay5oIGlzIGluY2x1ZGVkIG1vcmUgdGhhbiBv
bmNlLgoKWWVzIGJ1dCB0aGF0J3MgaW4gYSAjaWZkZWYvI2VsaWYjZWxzZSBjbGF1c2Ugc28gbm90
aGluZyB0byBkbyBoZXJlIQoKPgo+IHZpbSArMTAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zcGlu
bG9jay5oCj4KPiAgICAgIDgKPiAgICAgIDkgICNkZWZpbmUgX19ub19hcmNoX3NwaW5sb2NrX3Jl
ZGVmaW5lCj4gICA+IDEwICAjaW5jbHVkZSA8YXNtL3RpY2tldF9zcGlubG9jay5oPgo+ICAgICAx
MSAgI2luY2x1ZGUgPGFzbS9xc3BpbmxvY2suaD4KPiAgICAgMTIgICNpbmNsdWRlIDxhc20vanVt
cF9sYWJlbC5oPgo+ICAgICAxMwo+ICAgICAxNCAgLyoKPiAgICAgMTUgICAqIFRPRE86IFVzZSBh
biBhbHRlcm5hdGl2ZSBpbnN0ZWFkIG9mIGEgc3RhdGljIGtleSB3aGVuIHdlIGFyZSBhYmxlIHRv
IHBhcnNlCj4gICAgIDE2ICAgKiB0aGUgZXh0ZW5zaW9ucyBzdHJpbmcgZWFybGllciBpbiB0aGUg
Ym9vdCBwcm9jZXNzLgo+ICAgICAxNyAgICovCj4gICAgIDE4ICBERUNMQVJFX1NUQVRJQ19LRVlf
VFJVRShxc3BpbmxvY2tfa2V5KTsKPiAgICAgMTkKPiAgICAgMjAgICNkZWZpbmUgU1BJTkxPQ0tf
QkFTRV9ERUNMQVJFKG9wLCB0eXBlLCB0eXBlX2xvY2spICAgICAgICAgICAgICAgICAgICAgIFwK
PiAgICAgMjEgIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdHlwZSBhcmNoX3NwaW5fIyNvcCh0eXBl
X2xvY2sgbG9jaykgICAgICAgICAgICAgIFwKPiAgICAgMjIgIHsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAg
ICAgMjMgICAgICAgICAgaWYgKHN0YXRpY19icmFuY2hfdW5saWtlbHkoJnFzcGlubG9ja19rZXkp
KSAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgMjQgICAgICAgICAgICAgICAgICByZXR1cm4g
cXVldWVkX3NwaW5fIyNvcChsb2NrKTsgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAg
MjUgICAgICAgICAgcmV0dXJuIHRpY2tldF9zcGluXyMjb3AobG9jayk7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiAgICAgMjYgIH0KPiAgICAgMjcKPiAgICAgMjggIFNQSU5M
T0NLX0JBU0VfREVDTEFSRShsb2NrLCB2b2lkLCBhcmNoX3NwaW5sb2NrX3QgKikKPiAgICAgMjkg
IFNQSU5MT0NLX0JBU0VfREVDTEFSRSh1bmxvY2ssIHZvaWQsIGFyY2hfc3BpbmxvY2tfdCAqKQo+
ICAgICAzMCAgU1BJTkxPQ0tfQkFTRV9ERUNMQVJFKGlzX2xvY2tlZCwgaW50LCBhcmNoX3NwaW5s
b2NrX3QgKikKPiAgICAgMzEgIFNQSU5MT0NLX0JBU0VfREVDTEFSRShpc19jb250ZW5kZWQsIGlu
dCwgYXJjaF9zcGlubG9ja190ICopCj4gICAgIDMyICBTUElOTE9DS19CQVNFX0RFQ0xBUkUodHJ5
bG9jaywgYm9vbCwgYXJjaF9zcGlubG9ja190ICopCj4gICAgIDMzICBTUElOTE9DS19CQVNFX0RF
Q0xBUkUodmFsdWVfdW5sb2NrZWQsIGludCwgYXJjaF9zcGlubG9ja190KQo+ICAgICAzNAo+ICAg
ICAzNSAgI2VsaWYgZGVmaW5lZChDT05GSUdfUklTQ1ZfUVVFVUVEX1NQSU5MT0NLUykKPiAgICAg
MzYKPiAgICAgMzcgICNpbmNsdWRlIDxhc20vcXNwaW5sb2NrLmg+Cj4gICAgIDM4Cj4gICAgIDM5
ICAjZWxzZQo+ICAgICA0MAo+ICAgPiA0MSAgI2luY2x1ZGUgPGFzbS90aWNrZXRfc3BpbmxvY2su
aD4KPiAgICAgNDIKPgo+IC0tCj4gMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZQo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMvd2lraQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
