Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D07C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Lo89dWO8VFg7IAqDmq3zu7ehTiBy2gGjJQrbtfnrkU=; b=aowocUw4aeuExV
	W0YlRKCKqw5sTXTX4soqkLlXlruD0RWiHO4qsmcjR5JH4QzzekO7ZsnKzuAyJThYIWplcISQn9fYF
	c5UGt9ynpvLZrqIst+eNt7a4zq2ezrGWfKIa94an9GCVz18QeALpMNk4VKS6JSgpkoqlCESbZRW3J
	G4ntTFm6UDVCeJzKZfgOHINpnb5T7BIdoDzefRStJmAofYUCYa23Vq2jvcWptKkWphQMdq81GAwoq
	wVXaHgVlDuChyKvTZ88ypaUkF1RXM/qdSoghbUo9XZttWSVLlq11cKpYqPB7L5b6gWfqy6XVq1Sco
	kFO+GThYMACFHWt+0mfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpm1-00B5T9-2l;
	Mon, 22 Jan 2024 08:35:17 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRplx-00B5Rl-0b
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:35:17 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-204fdd685fdso2279764fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 00:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705912451; x=1706517251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkwnvGLbqFItCCRb578zOlJjANzoAer2/ivLxkfy9/8=;
        b=EGsmXiUnp+TizjvqgbRCRvLzjRiYQU9f80PqEInkvw4Dl9/7r8ZYcgNVWpYbelB3Mc
         ALB3y5AY8+9QzP/fLCB0ituTaoBLXH39/Co6Cwa/kj0BBOqBbBgsBTtw0PYkaF0Wpmj8
         Oud3m+7NmR8W4GT9DuuZOOfSm3Go1S5g4BQwjy8BGOmdRmMgRuIJVV6lTAcO7PYPaXBh
         LDhRxoi1xlwkOJyCwLIocznLLMIjfami2I/HQmmSzZpcCcMzQ5xCGAFlPpIBKn7sii7H
         uAi5yuySzQy74XHqdAR8lkfTwugi8+WXo0QDF2bJzfgz4wABcbWBIvQ1jIyxS2Zk4ZJi
         NKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705912451; x=1706517251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkwnvGLbqFItCCRb578zOlJjANzoAer2/ivLxkfy9/8=;
        b=LsEjg1FpGj8raBCQ8K4XYRMdBpOrP6eDIf7hgXKY5WKTRBHfQ3NVmgdltJT8Avr9Bl
         AlK417nDC0UdpveUT+yf2zofMVfyRD2R1ijOiyU3gK3GL1oNp3YcB+GL1SdmiqB1GW0u
         nQKuZILz5R44q2ulReVbXO8Z7kodOkFXRstizl04yL4J1s7Q0SsTfMEqrXSnbGhjy2ST
         /MqNuy3pJWqCRkbBBZE/Gg5jyKUqn/IJqVK34MHuzDmA0TUT0+V1LKPuQDpa9GXUzh96
         s2fCgndkh3ujXPf8vu/M7Cbg4hQVTbGG5pQA3dIsdTZ0gKJr19X98Gl0FbNv8OHmwaox
         X7GA==
X-Gm-Message-State: AOJu0YzVlBJqzTyzjH1Csy5JOGddjao7c9nJ/B3B8LorfVK47EcOxMci
	qIJvyqCNfTvlhUOicouc+Xs7rmb4c51/x9RtoATTYeoe71oIazRkY8FeyCrdS9jVqHNFrFKIdnL
	x01KdpRqQgNN5aqq+HU3wL7TgmOM=
X-Google-Smtp-Source: AGHT+IG0io7o6XQcMrNeVFyA5PaNM0P8uNlw0Diun23kc9f7dbCBaju58RK0zmyPDtcdlrZAzZ5TzBTnGyXVyuK2x30=
X-Received: by 2002:a05:6871:549:b0:210:d1b9:dda2 with SMTP id
 t9-20020a056871054900b00210d1b9dda2mr4790038oal.3.1705912450867; Mon, 22 Jan
 2024 00:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20240122080631.2880-1-qiujingbao.dlmu@gmail.com> <20240122081722868bdda5@mail.local>
In-Reply-To: <20240122081722868bdda5@mail.local>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Mon, 22 Jan 2024 16:34:00 +0800
Message-ID: <CAJRtX8QU8iHY1oQJ1uDN3YOmCeN7SH+vPC8nD29WS5+2DT1oKQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	chao.wei@sophgo.com, unicorn_wang@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dlan@gentoo.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_003513_223939_AC663B48 
X-CRM114-Status: GOOD (  20.75  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgNDoxN+KAr1BNIEFsZXhhbmRyZSBCZWxsb25pCjxhbGV4
YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMi8wMS8yMDI0IDE2OjA2
OjMwKzA4MDAsIEppbmdiYW8gUWl1IHdyb3RlOgo+ID4gSW1wbGVtZW50IHRoZSBSVEMgZHJpdmVy
IGZvciBDVjE4MDAsIHdoaWNoIGFibGUgdG8gcHJvdmlkZSB0aW1lIGFsYXJtCj4gPiBhbmQgY2Fs
aWJyYXRlIGZ1bmN0aW9uYWxpdHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmluZ2JhbyBRaXUg
PHFpdWppbmdiYW8uZGxtdUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+Cj4gPiBEZXBlbmRzIG9uIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9JQTFQUjIwTUI0OTUzQzc3NEQ0MUVERjFFQURCNkVD
MThCQjZEMkBJQTFQUjIwTUI0OTUzLm5hbXByZDIwLnByb2Qub3V0bG9vay5jb20vCj4KPiBXaGF0
IGlzIHRoZSBkZXBlbmRlbmN5Pwo+CgpUaGFuayB5b3UsIHRoaXMgZHJpdmVyIHJlcXVpcmVzIHN1
cHBvcnQgZnJvbSB0aGUgQ0xLIGRyaXZlci4KSSB3aWxsIGFkZCBhbiBleHBsYW5hdGlvbiBpbiB0
aGUgbmV4dCB2ZXJzaW9uLgoKPgo+IEFsc28sIHBsZWFzZSBmaXggdGhlIGNoZWNrcGF0Y2gucGwg
LS1zdHJpY3Qgd2FybmluZ3MKCkkgd2lsbCB1c2UgdGhlIC0tIHN0cmljdCBvcHRpb24gZm9yIHRl
c3RpbmcuCgo+Cj4gPiArLyoqCj4gPiArICogY3YxODAwX3J0Y18zMmtfY29hcnNlX3ZhbF9jYWxp
YigpIC0gVXNpbmcgYW4gZXh0ZXJuYWwKPiA+ICsgKiBjbG9jayB0byBjb2Fyc2UgY2FsaWJyYXRl
IHRoZSBjcnlzdGFsIG9zY2lsbGF0b3IKPiA+ICsgKiBAaW5mbzogdGhlIGRldmljZSBvZiBjYWxp
YnJhdGVkCj4gPiArICoKPiA+ICsgKiBAcmV0dXJuIDAgb24gc3VjY2Vzcywgb3IgLTEgb24gZmFp
bAo+ID4gKyAqCj4gPiArICogVGhpcyBSVEMgaGFzIGFuIGluZGVwZW5kZW50IDMyS0h6IG9zY2ls
bGF0b3IuIEhvd2V2ZXIsCj4gPiArICogdGhlIGFjY3VyYWN5IG9mIHRoaXMgb3NjaWxsYXRvciBp
cyBlYXNpbHkgYWZmZWN0ZWQgYnkKPiA+ICsgKiBleHRlcm5hbCBlbnZpcm9ubWVudGFsIGludGVy
ZmVyZW5jZSxyZXN1bHRpbmcgaW4gbG93ZXIKPiA+ICsgKiBhY2N1cmFjeSB0aGFuIHRoZSBpbnRl
cm5hbCBvc2NpbGxhdG9yLlRoZXJlZm9yZSwgYSAyNU0KPiA+ICsgKiBjcnlzdGFsIG9zY2lsbGF0
b3IgaXMgdXNlZCBhcyBhIHJlZmVyZW5jZSBzb3VyY2UgdG8KPiA+ICsgKiBjYWxpYnJhdGUgdGhl
IFJUQyBhbmQgaW1wcm92ZSBpdHMgYWNjdXJhY3kuQ2FsaWJyYXRpb24KPiA+ICsgKiBpcyBjb21w
bGV0ZWQgdGhyb3VnaCB0d28gc3RlcHMsIG5hbWVseSByb3VnaCBjYWxpYnJhdGlvbgo+ID4gKyAq
IGFuZCBmaW5lIGNhbGlicmF0aW9uLgo+ID4gKyAqLwo+ID4gK3N0YXRpYyBpbnQgY3YxODAwX3J0
Y18zMmtfY29hcnNlX3ZhbF9jYWxpYihzdHJ1Y3QgY3YxODAwX3J0Y19wcml2ICppbmZvKQo+Cj4g
VGhpcyBpcyBzdGlsbCBub3Qgd29ya2luZyBhcyB3ZWxsIGFzIHlvdSB0aGluayBpdCBpcy4gWW91
IHNob3VsZAo+IEltcGxlbWVudCB0aGUgb2Zmc2V0IGNhbGxiYWNrcyBpbnN0ZWFkLgo+CkknbSBz
b3JyeSwgSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIG9mZnNldCBjYWxsYmFja3MuCkRvIHlvdSBt
ZWFuIHRoYXQgdGhpcyBmdW5jdGlvbiBuZWVkcyB0byBiZSBleGVjdXRlZCBwZXJpb2RpY2FsbHku
CgpCZXN0IHJlZ2FyZHMsCkppbmdiYW8gUWl1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
