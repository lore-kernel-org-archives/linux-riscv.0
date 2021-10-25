Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82C9C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 01:00:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7949560EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 01:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7949560EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KopUQ3qanmgiWD8BBdHrP+Xec3WoaS2jGsgOt+7dC6k=; b=wqVuGswk4Xk623HHagbJkhRw5P
	RcS94jtfBY/BS76zXrXepejl4ZfIKPpBvt2PFOhgL/njge0U2DI/Iy4H1H/xiVXdW6Cgplc6HYLit
	Pnwe1xB7Dy1osDiU2rvrrZQT15LXhLVXZZ4OYgrONYrbanvMVhhSXUV9SgEWPv3WVgrlH2Xyp2suI
	NL8MQitgrgYOAkJ3IQDBzWX/O+QQQXP4RBfSmKEbrArNiRe7GpyDoGhaOwwvf9P+IvInJj4IetzNN
	qFw4/nhtnZwxLfP680G5XzLkxWrraRcykIHDU21FyPUjqwrySJv9mPHSSYNIBmdzKDmXQjoYWMn8i
	1ioRnRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meoLp-00EquM-MR; Mon, 25 Oct 2021 01:00:33 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meoLm-00EqtN-IZ
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 01:00:32 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 19P10IPO011050
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 04:00:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1635123612; x=1637715612;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XtAEwQrbUN1uwXWUYNCihcDeraLw6hJkJMDHwdBjgI0=;
 b=BCsuHO4bwRTp/6cww4IdJEe8KQPnWkY+Xw4wow8V3Vt3n3gOT/OH29TSSO2oGSlD
 liuKCKg/MKSq3nX1HXFg7su9tQg4KCWzzSx/MciSnUHALwTYe2uRN7NzAEK5TOAM
 qrnpHxZ7OD53Xzw9s1LXaSxpv77Jgsh3av1i8G7RqYtV0r7snqvu99R3k+8e5+ob
 zjwYeizB9nXS3fVTUncsFi/HLO63tTbtvw2LWOLuzQS9p3EkejPCq1ft4E3AEmYR
 OT3yzLn/14GeRjPT+6D8Y9BmYWwftuCrq/yLp6uZTnP9VH1UodbQrAM3K+7Bp5xl
 P203uvRH9I6EdOgJKv7MMA==;
X-AuditID: 8b5b014d-ba8f670000005d46-1f-6176019c5f81
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 A2.49.23878.C9106716; Mon, 25 Oct 2021 04:00:12 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Mon, 25 Oct 2021 04:00:12 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: mick@ics.forth.gr, alexandre.ghiti@canonical.com, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Don't use va_pa_offset on kdump
Organization: FORTH
In-Reply-To: <mhng-b28fa0cb-24ee-40d1-9f02-619605a4cc9a@palmerdabbelt-glaptop>
References: <mhng-b28fa0cb-24ee-40d1-9f02-619605a4cc9a@palmerdabbelt-glaptop>
Message-ID: <d4d0d13c9fda686575f1040cd16b516f@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDLMWRmVeSWpSXmKPExsXSHT1dWXcOY1miwdw2c4t1iy6wWmz9PYvd
 4vKuOWwW2z63sFk0vzvHbvHycg+zRdssfgd2j1kNvWweb16+ZPE43PGF3ePhpktMHpuX1Htc
 ar7O7vF5k1wAexSXTUpqTmZZapG+XQJXxrrGfYwFRwQq1vwVb2D8ytPFyMkhIWAisXH5XaYu
 Ri4OIYGjjBKv1ixhg0iYSsze28kIYvMKCEqcnPmEBcRmFrCQmHplPyOELS/RvHU2M4jNIqAq
 sfX7TLA4m4CmxPxLB8HqRQTUJQ68vsMMsoBZ4ASjxJSDH8AWCAtYS3T8eswOYvMLCEt8unuR
 FcTmFPCT6JizGKxGSMBX4uDB5+wQR7hIfGxpY4I4TkXiw+8HQHEODlEge/NcpQmMgrOQnDoL
 yamzkJy6gJF5FaNAYpmxXmZysV5aflFJhl560SZGcAQw+u5gvL35rd4hRiYOxkOMEhzMSiK8
 Np9KEoV4UxIrq1KL8uOLSnNSiw8xSnOwKInz8upNiBcSSE8sSc1OTS1ILYLJMnFwSjUwhauK
 vnnZcHT6dPtAL8ZjO5xedvxh2qs84/7DZb+/Ne1NCr7Rmjvp+SKdFXvmn/x4RnPq9mUGbJ/P
 2/dxpcbxnz2d5CF1afeL6Vw/LoYZXFisqlu7okXmuF1hjdet087FkqULpRgWuTzbqP3W3Z7B
 3tNxRleG8hYHDjMXnsU7rt3vfCourlO8w+Kp6LGFJznj3/7Nq/midElipZDbhDmzLlqVzNe5
 K6mxSerNzQUpaecv5z88lj9fmefMI7nI673XPvGzJuQLMn212fGpbef/SVM1Q1xu85aLbr7i
 d2//A0+VxP0tOvn57Qsf7r/lFuHbYdq71b+96F558JmYmb/WpkyS68w83FLRXq/77tDmN0os
 xRmJhlrMRcWJAGSMRAzvAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_180031_007657_C1211881 
X-CRM114-Status: GOOD (  22.02  )
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

zqPPhM65z4IgMjAyMS0xMC0yMyAyMzoxNCwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIFNhdCwgMDkgT2N0IDIwMjEgMDY6MTg6NDggUERUICgtMDcwMCksIG1pY2tAaWNzLmZvcnRo
LmdyIHdyb3RlOgo+PiDOo8+EzrnPgiAyMDIxLTEwLTA2IDE0OjEzLCBBbGV4YW5kcmUgR2hpdGkg
zq3Os8+BzrHPiM61Ogo+Pj4+ICsKPj4+PiArICAgICAgIC8qIFRoaXMgd2lsbCB0cmlnZ2VyIGEg
anVtcCB0byBDU1JfU1RWRUMgYW55d2F5ICovCj4+Pj4gICAgICAgICBqYWxyICAgIHplcm8sIGEy
LCAwCj4+PiAKPj4+IFRoZSBsYXN0IGp1bXAgdG8gYTIgY2FuIGJlIHJlbW92ZWQgc2luY2UgdGhl
IGZhdWx0IHdpbGwgYmUgdHJpZ2dlcmVkCj4+PiBiZWZvcmUgZXZlbiByZWFjaGluZyB0aGlzIGlu
c3RydWN0aW9uLgo+Pj4gCj4+IAo+PiBKdXN0IHN3aXRjaGluZyBTQVRQIHRvIHplcm8gZG9lc24n
dCBnZW5lcmF0ZSBhIHRyYXAgdW5sZXNzIG1zdGF0dXMuVFZNCj4+IGlzIHNldCAoZm9yIHZpc3Vh
bGl6YXRpb24gcHVycG9zZXMpLiBUaGUgaGFydCB3aWxsIHRyeSBhbmQgZXhlY3V0ZSB0aGUKPj4g
bmV4dCBpbnN0cnVjdGlvbiBidXQgaXQncyBub3QgY2xlYXIgaW4gdGhlIHNwZWMgd2hhdCBoYXBw
ZW5zIGluIGNhc2UgCj4+IHRoZQo+PiBjb2RlIGlzIGNhY2hlZCwgSSBkb24ndCB3YW50IHRvIHJl
bHkgc29sZWx5IG9uIFNUVkVDLiBJIHByZWZlciBoYXZpbmcKPj4gdGhpcyBpbnN0cnVjdGlvbiB0
aGVyZSwgbm90ZSB0aGF0IHNvbWUgZWFybGllciBRRU1VIHZlcnNpb25zIGFsc28gaGFkCj4+IHRo
aXMgYmVoYXZpb3IgKHRoZSBvcmlnaW5hbCBrZHVtcCBwYXRjaCBkaWRuJ3Qgc2V0IFNUVkVDIGFu
ZCBpdCB3b3JrZWQKPj4gZmluZSBhZnRlciBzZXR0aW5nIFNBVFAgdG8gemVybykuCj4gCj4gSUlS
QyB0aGlzIGNhbWUgZG93biB0byBzb21lIHZlcnkgc3BlY2lmaWMgd29yZGluZyBpbiB0aGUgc3Bl
Yy4KPiBTb21ldGhpbmcgYWxvbmcgdGhlIGxpbmVzIG9mIHRoZSAwIGluIFNBVFAgbWVhbmluZyAi
bm8gdHJhbnNsYXRpb24iLAo+IFNGRU5DRS5WTUEgb3JkZXJpbmcgdHJhbnNsYXRpb25zLCBhbmQg
dGhlIGdlbmVyYWwgImlmIHRoZSBzcGVjIGRvZXNuJ3QKPiBtZW50aW9uIGl0IHRoZW4gaXQgaGFz
IHRvIHdvcmsiIGxvZ2ljLiAgSSB0aG91Z2h0IEkgb3BlbmVkIGEgc3BlYwo+IGlzc3VlIGFib3V0
IHRoaXMgZm9yIGNsYXJpZmljYXRpb24sIGJ1dCBJIGNhbid0IGZpbmQgaXQuCj4gCgpJIGd1ZXNz
IHlvdSBtZWFuIHRoaXMgb25lOgpodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtaXNhLW1h
bnVhbC9pc3N1ZXMvNTM4CgpJIGNvdWxkbid0IGZpbmQgYW55dGhpbmcgdGhvdWdoIHJlZ2FyZGlu
ZyBjYWNoZWQgY29kZSwgaXQncyBub3QgdGhhdCAKdGhlcmUncyBnb2luZyB0byBiZSBhIGxvYWQg
YWZ0ZXIgc2V0dGluZyBzYXRwIHRvIDAgaWYgdGhlIGNvZGUgaGFzIGJlZW4gCmNhY2hlZCwgc28g
ZXZlbiBpZiB0aGUgdHJhbnNsYXRpb24gaXMgY2FjaGVkIHdlIGRvbid0IGhhdmUgYSBndWFyYW50
ZWUgCnRoYXQgdGhlIG5leHQgaW5zdHJ1Y3Rpb24gd2lsbCByZXN1bHQgYSB0cmFwLgoKPiBUaGF0
IHNhaWQsIEknbSBwZXJmZWN0bHkgZmluZSB0YWtpbmcgdGhlIHNhZmUgYXBwcm9hY2ggaGVyZSBh
cyBpdCdzCj4gbm90IGxpa2UgdGhlIHBlcmZvcm1hbmNlIG1hdHRlcnMgaGVyZS4gIFdhcnJhbnRz
IGEgY29tbWVudCwgdGhvdWdoLgo+IAoKQUNLCgo+IAo+IEkgZG9uJ3QgaGF2ZSBhIHYyIGluIG15
IGluYm94LCBkaWQgSSBtaXNzIHNvbWV0aGluZz8gIEFsc28sIGlmIGl0J3MKPiBqdXN0IHRoZSB0
YWdzIHRoZW4gaXQncyBnZW5lcmFsbHkgbm90IG5lY2Vzc2FyeSB0byByZS1zZW5kIHNvbWV0aGlu
Zy4KPiBUaGUgY29tbWVudCBkb2VzLCB0aG91Z2guCj4gCj4gTE1LIGlmIHlvdSB3YW50IG1lIHRv
IGRlYWwgd2l0aCB0aGlzLCBvciBpZiB0aGVyZSdzIGdvaW5nIHRvIGJlIGEgdjIuCj4gCj4gVGhh
bmtzIQoKSSdsbCBzZW5kIGEgdjIgd2l0aCB0aGUgdGFncyBhbmQgdGhlIGNvbW1lbnQuCgpSZWdh
cmRzLApOaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
