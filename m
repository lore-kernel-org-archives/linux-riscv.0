Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4469E6F07A
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 09:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOE5z6Hgz+Rv33pferWHEWut0yPxxgEh3a6lWZ1O4F4=; b=Ad/cap/rHWl8+X
	B48iSlFAuSWeim4QO1X+/9uCyNZeVzYoF0wntaxKqG0BGmmhoIDOxddIBc/kIILnsXbh5qmg5rnp/
	YfwgW5El0WBhIQEkjUUpV/zu1f7xcArGiOdcQGpNCUMZyp4BViQm2RtC+HsVSzYPwxQOSqNOQ7M7B
	6X8RhzP5OCMtPMLRMEhfUyAA3nRqeBJ1KQfOHV2mT8jRVKLgnAqn4FJLI6Qjfz+okv1bGba9zbG38
	baZzHDJzVhq8/qZB5l0onUZHBXwwgDqeJ6OP5utLivvjcA69HbptZT3UYXiR9DWsEG0Bzqs06Wfba
	AIQUJWJ1T414qb591exw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyso-0000000EmZD-1g7A;
	Tue, 23 Dec 2025 09:40:46 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXysm-0000000EmYf-26t2
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 09:40:45 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-93f5b804d4aso1073434241.3
        for <linux-riscv@lists.infradead.org>; Tue, 23 Dec 2025 01:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766482843; x=1767087643; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5DQ/Hd0FueInSklnxg49suOinyeSeX9sLj0XHbFm3M=;
        b=iSwpLZgv77LeXuNP7CWPQkQ0CmguIrBijKrBJaq0LdWtcF0sqzuXXi5/H/QKt518zm
         chTV3jtq6Lzhv3S9VbtpdzFA5mQqTapSB27azOc8Fx3O/H7HRcS/r7FyKFmTIgToh0gL
         yPfMj8AJpS30LBvhoEwM6Lj2ngBAtuaJO0NLMLMBPmXb9/zpdnkMDMFcdajhW8f9soW7
         dkNwTtsqZUAHdgWiQdE7DxHh5mvqipqfzkko8hAgGp5oLW1ARBJvd+P1NZau3rfNRPiD
         u5QQmnUatIB8JNic6cjNuc0oghga060idwQUFV4zjTunto8Y5TspYESrrntpZ9XRWryr
         c5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766482843; x=1767087643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f5DQ/Hd0FueInSklnxg49suOinyeSeX9sLj0XHbFm3M=;
        b=bhSPKCXCQDw/ZMI8uKrMQ+v+gxXxiv/orm4Qfa69AvM5Sxrk5Y8swmHc4P0UeFxeKw
         sKFmDD3nuCFklqVUU2ZW/lfs2Lhh4Zc13bemduCVSU74jxb9tdLHQpcNuoyqXvF6o2Ax
         fF2DmjqQ4KdJCRMNXO7kblnxkxfvmI9UvKTLmLGaaIv8ezzTMmoPjY9pMHxyNz88JZvi
         AXZGaI6FPESn+TseYCSLsYnA6/OBLoBsO+xG/mdSiNUcOa7qWgYUQ8WF3seYdQJvxO2r
         RXnUh/WyV6l87BP8m/E3LNC9c1PORjGrm04QUlpVqf081RbAn3O5T2u4+uTvP1+QYMFt
         kerw==
X-Forwarded-Encrypted: i=1; AJvYcCW5Vc9VC/lqbkag7yq/L4O6kIQVSYJjufzGJwCuR3ptdGiv4kFO6vX6OJOkpOS9WFjISnJtlS11vkKJEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx26ocju6wo+De0QhNtGXyBWzPY8tpgDyAD9qAMgsLI+M1qNarC
	AghM5HzeZVgz7PbaFdfB1G8vdocNRZK4pjfQYaWkCybx3hGqCOxsM7H0kK4QNPgSmKdcYZiKUN5
	sMhlkQ1Ftq1uvvvRuVAZziNIqXfHdfe4=
X-Gm-Gg: AY/fxX63JVyd1YY2WV3ulCz3ryGO9Xm0tpVup2j4sJP+X+Nru82arZVuOVW37dUVmBt
	6PjNBzkMmLHgeKGzoUgo8kO7Q8apF2s2E3PaxiNDdwy3+XV4OgeTB4bVm4HNKaC7QO1cvjOaWk4
	3H9/qHJlwg+KA9ZVOaTj736yonSa9J0mVXXw1tQvIsZspGEpAC0BbeDq5L1zrKM6bic3E1hNoux
	ICrpQwLuGwhUXg/132ejRgTT9eGl2bcA799l312IkIwRAAx0VQOEByu8QC2TmnkzJFgtyJke6AM
	Bz3bOHVBiUBY9lZlWS0RBuLSSbA2
X-Google-Smtp-Source: AGHT+IHezjaq3BOJA0/IKlT+rUY4LDRLZgpfCi9YXlzB67YTN0ZhqyYz9++mFn6fkbdpRKvBfOwrvMA4yblTtcXrdoQ=
X-Received: by 2002:a05:6102:2c14:b0:5dd:b288:61af with SMTP id
 ada2fe7eead31-5eb1a420692mr3942878137.0.1766482842127; Tue, 23 Dec 2025
 01:40:42 -0800 (PST)
MIME-Version: 1.0
References: <20251220170501.3972438-1-gaohan@iscas.ac.cn> <ad17d046-158d-4019-b801-423896fcf5fc@app.fastmail.com>
In-Reply-To: <ad17d046-158d-4019-b801-423896fcf5fc@app.fastmail.com>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 23 Dec 2025 17:40:31 +0800
X-Gm-Features: AQt7F2pNnJvaR2fFMXaWCzuRSUjzCZVvvwJpoWcbcif2idpoK6d8gJIQk4KoPBE
Message-ID: <CAAT7Ki-ddgsyJ4MDfn6MXKEBjXN__PZxWJQ_W5WjCcuaJ-_6Uw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: intel: Introduce msi64 parameter to override
 64-bit MSI restriction
To: Arnd Bergmann <arnd@arndb.de>
Cc: Han Gao <gaohan@iscas.ac.cn>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Maxim Mikityanskiy <maxtram95@gmail.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, linux-sound@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_014044_579130_8256629A 
X-CRM114-Status: GOOD (  19.45  )
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

T24gVHVlLCBEZWMgMjMsIDIwMjUgYXQgMTowMeKAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4gT24gU2F0LCBEZWMgMjAsIDIwMjUsIGF0IDE4OjA1LCBIYW4gR2Fv
IHdyb3RlOgo+ID4gU29waGdvIFNHMjA0MiBNU0kgZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgMzIt
Yml0IE1TSS4KPiA+IEludHJvZHVjZSBhbiAnbXNpNjQnIGtlcm5lbCBwYXJhbWV0ZXIgdG8gYnlw
YXNzIE5PX01TSTY0IGZvciBBVEkvSERNSS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIYW4gR2Fv
IDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4gPiAtLS0KPiA+ICttb2R1bGVfcGFyYW0obXNpNjQsIGJv
b2wsIDA0NDQpOwo+ID4gK01PRFVMRV9QQVJNX0RFU0MobXNpNjQsICJGb3JjZSB1c2UgbXNpIDY0
Yml0LiIpOwo+Cj4gVGhpcyBkb2VzIG5vdCBzZWVtIGxpa2UgYW4gYXBwcm9wcmlhdGUgdXNlIGZv
ciBhIG1vZHVsZQo+IHBhcmFtZXRlci4gVGhlcmUgYXJlIHZlcnkgZmV3IHRoaW5ncyB3ZSB3YW50
IHRvIHVzZSB0aG9zZQo+IGZvciBpbiBuZXcgY29kZSwgYW5kIHdvcmtpbmcgYXJvdW5kIGhhcmR3
YXJlIGJ1Z3MgaXMKPiBjbGVhcmx5IG5vdCBvbmUuCj4KPiA+IEBAIC0xOTAzLDcgKzE5MDYsNyBA
QCBzdGF0aWMgaW50IGF6eF9maXJzdF9pbml0KHN0cnVjdCBhenggKmNoaXApCj4gPiAgICAgICAg
ICAgICAgIGNoaXAtPmd0c19wcmVzZW50ID0gdHJ1ZTsKPiA+ICAjZW5kaWYKPiA+Cj4gPiAtICAg
ICBpZiAoY2hpcC0+bXNpICYmIGNoaXAtPmRyaXZlcl9jYXBzICYgQVpYX0RDQVBTX05PX01TSTY0
KSB7Cj4gPiArICAgICBpZiAoY2hpcC0+bXNpICYmIGNoaXAtPmRyaXZlcl9jYXBzICYgQVpYX0RD
QVBTX05PX01TSTY0ICYmICFtc2k2NCkgewo+ID4gICAgICAgICAgICAgICBkZXZfZGJnKGNhcmQt
PmRldiwgIkRpc2FibGluZyA2NGJpdCBNU0lcbiIpOwo+ID4gICAgICAgICAgICAgICBwY2ktPm5v
XzY0Yml0X21zaSA9IHRydWU7Cj4gPiAgICAgICB9Cj4KPiBUaGUgYmVoYXZpb3IgaXMgYWxzbyB3
cm9uZzogaWYgdGhlIHN5c3RlbSBjYW4gdXNlIG5laXRoZXIgMzItYml0Cj4gTVNJIG5vciA2NC1i
aXQgTVNJLCB0aGlzIHdvdWxkIGFjY2lkZW50YWxseSB0cnkgdG8gdXNlIHRoZQo+IDY0LWJpdCB2
YXJpYW50IGFuZCB0aGVuIGNhdXNlIHJ1bnRpbWUgaXNzdWVzLgo+Cj4gSSB3b3VsZCBleHBlY3Qg
dGhlIG9ubHkgcG9zc2libGUgZmFsbGJhY2sgdG8gYmUgdXNpbmcgbGVnYWN5IEludFgKPiBpbnRl
cnJ1cHRzLCBvciByZXR1cm5pbmcgYSBwcm9iZSBmYWlsdXJlIGlmIHRoYXQgZG9lc24ndCB3b3Jr
CgpVbmZvcnR1bmF0ZWx5LCB0aGUgU0cyMDQyIGNoaXAgZG9lcyBub3QgaGF2ZSBhbiBhdmFpbGFi
bGUgbGVnYWN5IElOVHguCgpkYjc5YWZhMWU1NzkyNWJhOTZhYjE4NTE0YzBlYmU0MmEyOGUzOTNl
CjkxZWQ2ZmQyYzM4M2JiOGYwMmQ2NmU5OGI0YTRkMmY3MjA3MjQ5ZGMKCkFjY29yZGluZyB0byB0
aGVzZSB0d28gY29tbWl0cywgdGhlc2UgaXNzdWVzIHNlZW0gdG8gYmUgY2F1c2VkIGJ5IHBvd2Vy
cGMuCkNhbiB3ZSB1c2UgdGhlIENPTkZJR19QUEM2NCBtYWNybyB0byBkZXRlcm1pbmUgdGhpcz8K
Cj4gZWl0aGVyLgo+Cj4gICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
