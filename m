Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7789CEEA849
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 01:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLpAl5V8rS5Ef6oMFelNz7HBs6lSXO9NOJ8bFJaL7bo=; b=oGRHlR3iL2WCFc
	wd7+UC9AuWmMT1EuyGV2QJntc1llF8ZQvvq5nEmXgRHPMtOgw2Aoa+MLeH6tr9mQ73hEbqzchwK2/
	fJNJPkvfCdRvAp63YQhXWTM5AzbFAaiEfCTqmFGBSYlOxnWHUEsp+2dU1kQ0WftandBHBFHrAQr9R
	L90aSsj4NxD0zGXY/Hv+tg7n+QS7+blCfANa6MSx1p4G3EVTUZoSFJa2NJ89Mg+bpb77Lpg67sMQj
	J9kmdS8mrizNkxKwB2BPHUBpnr4+OpGZh+iKEo4lfgRZwzqXmuaHvsyM0FaSLHmZwiKvnrUlMD5lg
	77RFMki4XBhCT0ZGTP6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhnU-00000002oba-25R8;
	Fri, 13 Feb 2026 01:16:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhnR-00000002obE-48km
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 01:16:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48372efa020so553615e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Feb 2026 17:16:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770945395; cv=none;
        d=google.com; s=arc-20240605;
        b=O4WFEHJUYmTdA5E1oW1HYh/Mzq76J1yAAEMGdSyRZExLo0t8ilMuihxfMufZcmiXUp
         sg/+STUHJc3yHcnCwrGkjkNt/tZnmEFHMl/wsPtWRNQkawhRnK/1oMFZIP9KvwsTBION
         c3tnRvK9wUgYLKMn8Lfb5+DxrkCxe+y8uwaDIyKElm7ZyTrcZFsEjxW2Ss0+6lhMGT73
         sCob1Z2sH/7Clcr0NzILi58/ieHTxy+rVZAQWc66+s2rVz+fFU3fYHsVh8LyrjWoD2Cv
         Fgm9j9WkmtXxQHgUVYEiwrGrnW196gO1L9kumUEyx6OZTrBKDIn2QhDyD7s1/JsuH7Sk
         kiiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GvQd2pA1XOjNYx3FkR2n+eO55P4cOXkXkPN2LHTpOrk=;
        fh=tMe7GWYpI5LIt9UjOurrvh19eGUUTZEnEnvfnP+jV3k=;
        b=HVHrelMJGr9iTYN+YEcRLb4NvehasPgeGtSW/Sy7iv5xzUfqwr2CdoEdUUm0jSm4H7
         KjwAGxVQb+uooF+MVWqJdIjPPtN7rodIPLST3Mp+UYz40HqKJFrkrTMPsXvEZzpDSfes
         AhoQVG87RKOmbjYFBq/+qfYMliDxA53jjIKaU2vc0BMcfdRT5psucwkvDv4TQQ22kXF8
         cyk6UOINMQDifpb7n34RTx4qeK+C+tpB0aRTWsCrTfrowudsTiV2V2SZe6FRuGAOWaea
         w4Wonf/whIHtUBLfOrOjNbe0R01AJGeXdE+VnYLd0QwCyB44SeW8RigX9Cgxz+v+IJf1
         3MUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770945395; x=1771550195; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvQd2pA1XOjNYx3FkR2n+eO55P4cOXkXkPN2LHTpOrk=;
        b=Vd1UAZe5jz82hi9eHHoMMMeiFl7aRqX7I4CZJ1UMq6wWjmN0UeBxdU3DfeJQmpFccC
         kp+pvkPDTaLw7Togzwp66LusF8VIdsZHX6QsPlJg+7txXPBgHkASwUDx1goWolI/3VDT
         yRmiZJEpfDgOsZhxNtoHVY3W3JJn7kMEJkEzqlxvAPwNW4vBr2vt3HLsLBy7/KJEJAP/
         kMvQaDLM4nsmC3f1X0Yt0NktsPTOjh9371UReQydtkIEsdB6u/S1e+josCwaeK8s1Qni
         cY+e9Cuhk5ESnwxPwq7YAIQUxgkW9fcuXhbtuapYhbzPqjNj9PsydWqf+brFzQS25Ul6
         JJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770945395; x=1771550195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GvQd2pA1XOjNYx3FkR2n+eO55P4cOXkXkPN2LHTpOrk=;
        b=kt8Zz+Z4qXz9tMrNVxYM8NtGXdjf5P1kQliJSzjqcuNUKwvk4Q2fAzfZwlfCb0kSTS
         hbsUzPkxnPBtYrGXRRPM46MkMMLTUyG/twJ46nlvoScSv2yDvHWAtiA6GZEGmQSuDDUV
         P+YJF/p7r9/xvHkeH1lp54csedxSleABSAaADJe+GAFJhCrleVRxFYIGVy5acZmuEUfy
         eio0jpyELQBjC3jb39piLIsFf+3lW3cUajm6kBQ6r8sctUl6VG705+kGWucoPxKC6ZSE
         G6kpUUfkKC/kGMRL9pE/FLG3Cf5tqjnULntxpDTL3X7JxQKZhlHuDO7okmqm0eSDueyY
         tGBg==
X-Forwarded-Encrypted: i=1; AJvYcCXYyIJ2R/TtNhaqMwJnbEJFxeOpOdYkYfu14zbOKO3m+vVEm9FKX1+LPJwyqfbswoABHBWMHttf/qhOxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWzXOogqyndTx9M0xjzm3/m4aiVNfd1NUmn84OGcQJoImACMsP
	kxztdR3Q1PKa5ulBeZxNtMEXQLVTkEIPkP2Yn7UUUdkbgvZtDDdq+0gPfQm348vuipWhpmzVIPx
	Dsw7U6NrV9dp0HvatnS0w599vRCOlyUc=
X-Gm-Gg: AZuq6aIjtv40RVYQ9ThxbWlSQ1yk7mf+O/WFq+EPkk8RfookC/uuswGhT735TqY38Qi
	GT0jzXtyTrPiCsbJ+dRSVgCTfmNd+XONsNPo4dxA2qYXioaHsZ+SY84lHv2fdTdzQ2//OTga9KH
	rQxfQB4sruG1f3X81Z/9kX/wcvhhUNTWJByRYCXalTRwsttbVriUonnEJaC0p1y5kB7tDjNADwy
	atIYkmixryOnDD2jEfLWedWzYjcmp+gEAo2Zm/cTl/XZCjHBW9vvYDm9sSMG/psl6h7vS9hz9Ti
	hqi2WeBO8/14t+/GFg==
X-Received: by 2002:a05:6000:25c4:b0:436:42fb:154c with SMTP id
 ffacd0b85a97d-4379796067bmr430653f8f.61.1770945394981; Thu, 12 Feb 2026
 17:16:34 -0800 (PST)
MIME-Version: 1.0
References: <aYVvieviDNvoTRNq@adminpc-PowerEdge-R7525> <dc0bc3b6-c470-01d8-0785-bb5a88e13182@kernel.org>
In-Reply-To: <dc0bc3b6-c470-01d8-0785-bb5a88e13182@kernel.org>
From: Austin Kim <austindh.kim@gmail.com>
Date: Fri, 13 Feb 2026 10:16:22 +0900
X-Gm-Features: AZwV_QiEPJLNjXT-c7xgGF1u2I2ogkXDx0KSia8dsan23LDoyQ7Yutmwav2FDHY
Message-ID: <CADLLry4qacvO=BU4yLG+XwDVUSsHZK9K9dEOf34gt23RFXo0WQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: kdump: return early for invalid 'crashkernel=0' input
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_171638_047148_8D9165A1 
X-CRM114-Status: GOOD (  18.43  )
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

SGVsbG8gUGF1bCwKCjIwMjbrhYQgMuyblCAxM+ydvCAo6riIKSBBTSA5OjQ3LCBQYXVsIFdhbG1z
bGV5IDxwandAa2VybmVsLm9yZz7ri5jsnbQg7J6R7ISxOgo+Cj4gSGksCj4KPiBPbiBGcmksIDYg
RmViIDIwMjYsIEF1c3RpbiBLaW0gd3JvdGU6Cj4KPiA+IEZyb206IEF1c3RpbiBLaW0gPGF1c3Rp
bi5raW1AbGdlLmNvbT4KPiA+Cj4gPiBBbiBpbnZhbGlkICdjcmFzaGtlcm5lbD0wJyBjYW4gYmUg
c3BlY2lmaWVkIHdoZW4gcnVubmluZyBrZHVtcC4KPiA+IEJ5IGFkZGluZyBhIGNoZWNrIGZvciAn
Y3Jhc2hrZXJuZWw9MCcsIGl0IGNhbiByZXR1cm4gZWFybHkgd2hlbiBkZXRlY3RpbmcKPiA+IHRo
aXMgaW52YWxpZCBpbnB1dC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBdXN0aW4gS2ltIDxhdXN0
aW4ua2ltQGxnZS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDMgKyst
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5p
dC5jCj4gPiBpbmRleCA4MTFlMDM3ODYuLmU2MWZlYzQ0NSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3YvbW0vaW5pdC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gQEAgLTE0
MDksNyArMTQwOSw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBhcmNoX3Jlc2VydmVfY3Jhc2hrZXJu
ZWwodm9pZCkKPiA+ICAgICAgIHJldCA9IHBhcnNlX2NyYXNoa2VybmVsKGJvb3RfY29tbWFuZF9s
aW5lLCBtZW1ibG9ja19waHlzX21lbV9zaXplKCksCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmY3Jhc2hfc2l6ZSwgJmNyYXNoX2Jhc2UsCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmbG93X3NpemUsIE5VTEwsICZoaWdoKTsKPiA+IC0gICAgIGlmIChyZXQpCj4g
PiArICAgICAvKiBpbnZhbGlkIHZhbHVlIHNwZWNpZmllZCBvciAnY3Jhc2hrZXJuZWw9MCcgKi8K
PiA+ICsgICAgIGlmIChyZXQgfHwgIWNyYXNoX3NpemUpCj4gPiAgICAgICAgICAgICAgIHJldHVy
bjsKPiA+Cj4gPiAgICAgICByZXNlcnZlX2NyYXNoa2VybmVsX2dlbmVyaWMoY3Jhc2hfc2l6ZSwg
Y3Jhc2hfYmFzZSwgbG93X3NpemUsIGhpZ2gpOwo+Cj4gU2hvdWxkIHRoaXMgZml4IHRoZSBjb21t
b24gY29kZSBpbiBrZXJuZWwvY3Jhc2hfcmVzZXJ2ZS5jIHRvIHJldHVybiBhbgo+IGVycm9yIGNv
ZGUgd2hlbiBjcmFzaGtlcm5lbD0wIHNvIGl0IGJlbmVmaXRzIG90aGVyIGFyY2hpdGVjdHVyZXM/
CgpUaGFua3MgZm9yIGFub3RoZXIgYmV0dGVyIGlkZWEuCgpJIHdpbGwgZmluZCBvdXQgdGhlIHdh
eSB0byBhZGQgZXhjZXB0aW9uIGhhbmRsaW5nIGZvciB0aGUgImNyYXNoa2VybmVsPTAiIGNhc2UK
aW4gdGhlIGdlbmVyaWMgQVBJcyBiZWxvdy4KCmtlcm5lbC9jcmFzaF9yZXNlcnZlLmMKc3RhdGlj
IGludCBfX2luaXQgX19wYXJzZV9jcmFzaGtlcm5lbCguLi4pCnN0YXRpYyBfX2luaXQgY2hhciAq
Z2V0X2xhc3RfY3Jhc2hrZXJuZWwoLi4uKQoKQXMgeW91IHNhaWQsIGl0IHdvdWxkIGJlIGJldHRl
ciBpZiBvdGhlciBhcmNoaXRlY3R1cmVzIHdpbGwgYmVuZWZpdApmcm9tIHRoaXMgY2hhbmdlLgoK
QlIsCkF1c3RpbiBLaW0KCj4KPgo+IC0gUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
