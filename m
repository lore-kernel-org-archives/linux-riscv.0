Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA98EA3F1D
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Feb 2026 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gyd/YhLC6gO+6/n93JELyj6W78rqQiUadgwOAhx/KX0=; b=eFcv0PP8e9GWl0
	cjbN7PfZfvsDGxrt1mnc2zlUQ5pYy7N8X7unypsmp0HpWgzcN8UBp6WbDi5CVPlDxh30xKyIb0vwy
	JJB6ZmZBiFjXLEepUtQmjoClFZtkIKpVOJ10QaxDQw6Z5HRzNdXCIXXLCq9uxjjvKf0lP1Zp3O049
	ZW1bV9c2BFvnzFIcLoODdnEKhX6PlERkHL/Nu+A/cAmgaQ2nTf9rTo/1gsi2YstNQDSegVlC+APFf
	1v2XOTjeQdZzEYyv+jHOjUh6+hkkj7wkjimtLjRcWH7lITHa6Ho0Z/y+MKK4lx6XC/Iknlmha4B0U
	5PxDTu2PihIU2xtUVhGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiun-0000000GgHU-2iKr;
	Tue, 10 Feb 2026 08:16:09 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiuj-0000000GgGy-1iZy
	for linux-riscv@lists.infradead.org;
	Tue, 10 Feb 2026 08:16:08 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-79639c2d2b5so26543927b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Feb 2026 00:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770711363; cv=none;
        d=google.com; s=arc-20240605;
        b=ilEuw6uBKeeDvVZbNDmaftLRHM5sACKt1LWpuUI2tqQfDYm0F9CySEGvVDmbxkixHs
         zDnFGdWs1kVYrsEoqejt0ROpHZLPWICqDy7VvvPiD/26A3i5/ICme49Z8trdNdmTmlby
         3UuvN3x4O4kucPGJWzdUAL5iMQ2sUenRCb6imiZzPNSkEEw06BkSQy4o/q11J8gxSK8c
         E9u4Kc0zx5azZWzdn2MM+vN38LzqNRJS2PTyIfyVN82XpnNSs65oDP2UBeMgAHSSF5EI
         MtzkUA+P4eduivPq3LSKwGUYAqG0tMX4mi4ST+gS6sC84WbygpYFWs6v/+j2VyFMrAsT
         fqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hBw3dlH27S/Y11nY0zdbPmFm0VuUWO+N3Nbejj29p+w=;
        fh=np1r2bu8dVFHhCjYML8vKImPJVCV+1P9S35jSY3Es7U=;
        b=BUDEejr6JPt/hgPwy1bhJp8Lq2hZIA0OOGyrIPmgFkfcXKR7XB+emDDx78Fsfnw5dJ
         bKxPfF5R6KvWOrWETc7+fVk6PxTJbAfjJmE4uAmfRejmBUAQeyLKEzHC/N6izZYJAxix
         jDLXM9wqfsm4ythE2GQ8lvepCdg+2Rr+qPxf7uWEEqR3UtVxDbY6stW/Bu6eFZZ5Az1G
         +IefBSymRt7fTdCdVRuAiBzul+GDuUYoXQfRWK1hOFwNmM/ceaPh3QMkmNZHlR6lYGFC
         34QFDeiZXqhMDDYaG6qow8nJ0AhVxmdADaG/vzQFbU7HO3De9r656Jrr0nqbI09iZoqM
         oNJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770711363; x=1771316163; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBw3dlH27S/Y11nY0zdbPmFm0VuUWO+N3Nbejj29p+w=;
        b=QJwRhNj7yo3TkCrj3PdLRvyCRh+NL/6x0kmS6ID4cndI6LoTfGadKMdoEOqzOV6ZEV
         31bdm7erGPA5Hr9h44ECPSsSI+N0MmykoJfxnHfSSsJCQlzvdontOD5BqWEl6muFofHZ
         4FvtJl8+wGugVs+OBsnMO+dz6tBHw6K7kC6xEd4Rz2FYVEROUjD7FNcLiTGcIOxzRf/b
         InYyOqM8ByMC0mPWqZB5vbM8InJDKKpl0hwNTCcNv/4BrviDXyLg/2/a7Ko0Uj9X7BKb
         GSGbjLCCzlIH6Yt4UgMxX+gBBd92FrYz+K+q0lGI0HgYoIUZk/7/HXemhhha7WCE39r7
         RnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770711363; x=1771316163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hBw3dlH27S/Y11nY0zdbPmFm0VuUWO+N3Nbejj29p+w=;
        b=PnY2IRSwYCaxqCxz3eH03w1jiva8F+WTAVi4TeAqZPCot/urDk3n0RPXtQSP0iCLa3
         bp1tsmVynJNT4L2KcOpltGsD+sk01V9q+zqgTBFFEIkEzcIISuxVeZ2IOt1ruJBls54G
         8PQaDQGlSMGkeaGWg/pEoOz3cRdTg8DLRvM5WaGEsoU3oTSX6pwwED9TZLBW9SHEZVad
         6Yki1jRFAYXMvInCalmryiy7jG8apEK09/F5qCjEyw6rOGxjSTaJnqj4muslwy4ijl24
         ZyjAJ9oDYnnyP0QelD+JMwtrCVLhgV8vMJg2hdw1BRkBfoAoAxMmarfDZxpW4Ukuq8Dt
         LXpA==
X-Forwarded-Encrypted: i=1; AJvYcCVC61/6nk3GwNaKk4cPIZdxh+AAyZUXwEKQJEYzM+/LmFeRYEx2nl71TNmWUU5xGb8Il7Hc2CIbTMaZag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP4P++juxxj6kpbqmN58cxWZUVYQG/FYYUTUxBWhpzKjZYlgXi
	ACY5+sYv+KQNNZMu/UG/QXQKm44Vjab0/iyOi3fOhagA2mfzfHBt6g4jXnIMuj4RGyWHjSbcfxR
	jRQDolhCd3dwnGHKZ71Vy+EzRxICOudFISUi8KeSa/g==
X-Gm-Gg: AZuq6aIjsY1tzWAWv7g3ocG0AXCq/IUwcn3FAdfOokC0OCLPigsxTM2e5V8V+L41Hjx
	aG1sWpoCTcu6QWEwoUrdiiB1O1Z96iE3cWe1Y/6esB/LxrwLc6ZPnJ4zEhXWJX5jo6MZfcxyTl/
	TdTwNOvJNSOXjkvwj7T8x4pmyw6eg9EfB2cFMMNdSPoBEgc/LBd6v9V5XIQVzWyo76YpTn/GpEX
	9SZxjGo8pJ8l5uDumK2XuhBmLgVeq8YQPGZ4/x0jNYJUWiX8g5L9FwmcBAvK+xrXk10TtgtMOXn
	H8eyBxtSoykGqn5TD/WIGLG80kAQh5ikzLvM0mvhP3hsmBgkXyYXUg6Rmfo=
X-Received: by 2002:a05:690c:97:b0:796:45d4:9e36 with SMTP id
 00721157ae682-7965f0976d8mr10416957b3.50.1770711363674; Tue, 10 Feb 2026
 00:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
 <20260207-isa-ext-parse-export-v1-1-a64d3a8bc20a@riscstar.com> <rbhjt6qmraoxsdur74mhl2ugy7orr2mb237ynq2sxrraqkl5zm@yc6kim3ic6as>
In-Reply-To: <rbhjt6qmraoxsdur74mhl2ugy7orr2mb237ynq2sxrraqkl5zm@yc6kim3ic6as>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 10 Feb 2026 16:15:52 +0800
X-Gm-Features: AZwV_Qjs_6jcN4fqSLj1y_xvSggu0kenowvX1EwCCyq6tYC45rcscwWiMavPkL8
Message-ID: <CAH1PCMYMrJoYF4i9vFg1MBkMW+9H9p96RMxqdiQFNC3-KS=7YA@mail.gmail.com>
Subject: Re: [PATCH 1/8] riscv: cpufeature: Add parsing for B
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Conor Dooley <conor@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_001605_778875_23DE97DB 
X-CRM114-Status: GOOD (  18.60  )
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

SGkgRHJldywKCk9uIE1vbiwgRmViIDksIDIwMjYgYXQgMTI6NDPigK9BTSBBbmRyZXcgSm9uZXMK
PGFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgRmViIDA3
LCAyMDI2IGF0IDA2OjI3OjU1UE0gKzA4MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiBUaGUgQiBl
eHRlbnNpb24gY29tcHJpc2VzIHRoZSBaYmEsIFpiYiwgYW5kIFpicyBleHRlbnNpb25zLCBhcyBk
ZWZpbmVkCj4gPiBieSB2ZXJzaW9uIDIwMjQwNDExIG9mIHRoZSBSSVNDLVYgSW5zdHJ1Y3Rpb24g
U2V0IE1hbnVhbCBWb2x1bWUgSQo+ID4gVW5wcml2aWxlZ2VkIEFyY2hpdGVjdHVyZS4KPiA+Cj4g
PiBBZGQgQiBhcyBhIHN1cGVyc2V0IGV4dGVuc2lvbiBzbyB0aGF0IHdoZW4gImIiIGlzIGVuY291
bnRlcmVkIGluIHRoZSBJU0EKPiA+IHN0cmluZyBvciBkZXZpY2V0cmVlLCBpdHMgc3ViLWV4dGVu
c2lvbnMgYXJlIGF1dG9tYXRpY2FsbHkgZW5hYmxlZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBH
dW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFyLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaCB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgfCAxMCArKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspCj4gPgoKPgo+IEhpIEd1b2RvbmcgWHUsCj4KPiBBcyBwYXJ0IG9mIHRoZSAiaHdwcm9iZTog
SW50cm9kdWNlIHJ2YTIzdTY0IGJhc2UgYmVoYXZpb3IiIFJGQyBbMV0gSQoKVGhhbmtzIGZvciBw
b2ludGluZyBtZSB0byB5b3VyIGxpbmsuIEknbSBoYXBweSB0byBsb29rCmF0IHlvdXIgUkZDIHNl
cmllcy4gSSBsaWtlIHlvdXIgcGFydCBvZiBhZGRpbmcgcnZhMjN1NjQKYW5kIHJ2YTIzczY0LCBJ
J3ZlIGJlZW4gdGhpbmtpbmcgdGhlIHNhbWUsIGJ1dCB5b3UKb2ZmZXJlZCB0aGUgc29sdXRpb24h
Cgo+IHBvc3RlZCBhIHNpbWlsYXIgcGF0Y2ggd2hlcmUgSSBhbHNvIGFkZGVkIEIgdG8gaHdjYXAu
IENhbiB5b3UgdGFrZSBhCj4gbG9vayBhdCB0aGF0PwoKU3VyZSwgSSdsbCBjb21tZW50IGluIHlv
dXIgc2VyaWVzLgoKPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjAyMDYw
MDIzNDkuOTY3NDAtMS1hbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbS8KCldpdGggdGhlIHBh
dGNoZXMgaW4gWzFdLCBJIHdvdWxkIGRyb3AgdGhlIGR1cGxpY2F0ZWQKb25lcyBmcm9tIG15IHNl
cmllcyAoNSBvZiB0aGVtIGlmIEkgY291bnRlZCBjb3JyZWN0bHkpLAphbmQga2VlcCBvbmx5IHRo
ZSAzIHBhdGNoZXMgd2hpY2ggYWRkIFNIQSBhbmQgb3RoZXIKUyBleHRlbnNpb25zLgoKV291bGQg
eW91IHByZWZlciBJIHNlbmQgYSB2MiBiYXNlZCBvbiB5b3VyIHNlcmllcywgb3IKd291bGQgaXQg
YmUgZWFzaWVyIGZvciB5b3UgdG8gcGljayB0aGVtIHVwIGRpcmVjdGx5PwpFaXRoZXIgd2F5IHdv
cmtzIGZvciBtZS4KCkJlc3QgcmVnYXJkcywKR3VvZG9uZyBYdQoKPgo+IFRoYW5rcywKPiBkcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
