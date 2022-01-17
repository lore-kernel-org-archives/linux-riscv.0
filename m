Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E59EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JY6Svzmw/O8BLEWf2PuMX1qD5j9F9+UybtKob7rzL0=; b=r+nGbvT0uujlfH
	V6U510F+0MjRVqbIwYq0paQcfCFuv3QAU10cmddi+GiGKdq1Afr8Dy5GcHvIk2GcdseCABpLcMSoI
	mLonZ6Z+DgAxtDQ+XATV/LTIRp7s8TPTsPZAsGWwU5zrBEEdBGt4FVUY0imw44Xhm/WzIjFfrHkOW
	oFmZkzQcMuZBOGRX4r7wWJukrhDlDtgxOWTXQcnbmuS9F4ZXlTTUjObgfHfRnw9MrIIGXOdqjUslI
	4M1l51jhuAPJcbeiKF4NhhqdsE7NmgI8I+ZkclVd46QfIUrV4d6MG9ypUaZNvzwF+9Z7F51PSb2Lr
	zCjb4IgnN7fCISsihbFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9XEJ-00GAWa-Rm; Mon, 17 Jan 2022 18:59:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9XEG-00GAWA-SI
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 18:59:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so1780357wme.0
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 10:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=9C//aGFa7atevE9TjMbqK2z/dvojp4g7MOSHCXb+1oc=;
 b=ikh8vDfBeLAcAHOuGvTZwAoq+zoZdCimHZuBAWeaZvwVxRbEisoPgTYmlPesUcARe5
 wY+h/Q/oVs5n3Mbbx2psKhmB7kQ0j1NDKel9PVfA/76ublcXZnLBYNh1qTfjr1HlH90M
 fyHeTKiPW96L4c+CEHP1RJJNmCWFyb9+l/s2T7IsJxekzpDQ4DT8c9/SN1gLqTFguEVb
 9YKdLKpTPCHLvx0/dK0QO7qKybiuMpqdC2FVrOJX5fkHP0Db/E3lpZJHyxY43Bh2I3F8
 Y08lQY6qjKCxyXYDBcPIDble6AzK4G3IMBqTglZ6oJUL5ebWFgZ2QGJT9PvnqBLDP7Tc
 AOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=9C//aGFa7atevE9TjMbqK2z/dvojp4g7MOSHCXb+1oc=;
 b=caa6qe7sL121+4RWN9me1SDcvfC++wgEzIGwArW793IE5MMpKWDkyrDzTyTbBaxI0Y
 sWzMHBdMYJeWKf72tREosRO91jrfDgFf48+iKnI14QxTIkeS5cW5kQVhkPE5tYvMwAex
 smoWox33y41uocLhEMyEal0S8iAu4YZ7zoK4hl9FtQeb6A3tfTkFgSIQ7aZ48uJhMQOA
 ApoBG3Hu0/ms0HqZlL+puJMrQwcDD01p1yY/DNOYvqjadrU8i50pna9VkFv7qBtfYaZs
 7rY1a1eFRXfQZ0hCg2j8ugFQQaSJfjoLxFCQfUXH49n20TLO7to1yVqhVIV75VS5ANqx
 4SaQ==
X-Gm-Message-State: AOAM530FcxLbIays2VcGQhm71Z91xjvD/Cp0F7wckXyp4IIuUbfLzF9Y
 KsYd8/5rRxj6SUNneojq+neiAg==
X-Google-Smtp-Source: ABdhPJwX33cAC2hiWCwHJo50Hh1/9cXYGixWnltvnRKpynHX4MQxqyCZPK2I0KKy/bEj25HT7xO8AQ==
X-Received: by 2002:a05:600c:291:: with SMTP id
 17mr11264104wmk.123.1642445982934; 
 Mon, 17 Jan 2022 10:59:42 -0800 (PST)
Received: from smtpclient.apple (global-5-142.nat-2.net.cam.ac.uk.
 [131.111.5.142])
 by smtp.gmail.com with ESMTPSA id f5sm132412wmf.47.2022.01.17.10.59.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jan 2022 10:59:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH 1/1] RISC-V: Change signature header field to use `.ascii`
 instead of opcode
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220117173941.3798325-2-florian.wagner@nextsilicon.com>
Date: Mon, 17 Jan 2022 18:59:41 +0000
Cc: Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 yaron.dinkin@nextsilicon.com
Message-Id: <98743A89-2871-434C-B17A-70EFE1D188CC@jrtc27.com>
References: <20220117173941.3798325-1-florian.wagner@nextsilicon.com>
 <20220117173941.3798325-2-florian.wagner@nextsilicon.com>
To: Florian Wagner <florian.wagner@nextsilicon.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_105944_988200_340E33DC 
X-CRM114-Status: GOOD (  16.37  )
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

T24gMTcgSmFuIDIwMjIsIGF0IDE3OjM5LCBGbG9yaWFuIFdhZ25lciA8Zmxvcmlhbi53YWduZXJA
bmV4dHNpbGljb24uY29tPiB3cm90ZToKPiAKPiBUaGUgYE1aYCBpbiB0aGUgc2lnbmF0dXJlIGhl
YWRlciBmaWVsZCBpcyBub3cgZW5jb2RlZCB2aWEgYC5hc2NpaWAgdG8gbWFrZQo+IHRoZSBrZXJu
ZWwgY29tcGlsZSB3aXRob3V0IHRoZSBgY2AgZXh0ZW5zaW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEZsb3JpYW4gV2FnbmVyIDxmbG9yaWFuLndhZ25lckBuZXh0c2lsaWNvbi5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogWWFyb24gRGlua2luIDx5YXJvbi5kaW5raW5AbmV4dHNpbGljb24uY29tPgo+IC0t
LQo+IGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyB8IDIgKy0KPiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvaGVhZC5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4gaW5kZXggZjUyZjAxZWNi
ZWVhLi45MzFiNjM0NjRiOTAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5T
Cj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4gQEAgLTQ4LDcgKzQ4LDcgQEAgRU5U
UlkoX3N0YXJ0KQo+IAkvKgo+IAkgKiBUaGlzIGluc3RydWN0aW9uIGRlY29kZXMgdG8gIk1aIiBB
U0NJSSByZXF1aXJlZCBieSBVRUZJLgo+IAkgKi8KPiAtCWMubGkgczQsLTEzCj4gKwkuYXNjaWkg
Ik1aIgo+IAlqIF9zdGFydF9rZXJuZWwKCkNPTkZJR19FRkkgaGFzIHNlbGVjdCBSSVNDVl9JU0Ff
Qywgc28gdGhpcyBkb2VzbuKAmXQgc2VlbSB0byBhY2hpZXZlCmFueXRoaW5nPyBJZiB5b3UgdGhl
biByZW1vdmUgdGhhdCBzZWxlY3QsIHdlbGwsIHlvdSBnZXQgYW4gRUZJIGJpbmFyeQp0aGF0IHdv
cmtzLCBidXQgaWYgeW91IGp1bXAgdG8gaXQgZGlyZWN0bHkgYXMgYSBub24tRUZJIGJpbmFyeSB0
aGVuCnlvdeKAmWxsIHRyYXAgb24gYSBub24tUlZDIHN5c3RlbSBhcyB0aGF0IHdvbuKAmXQgYmUg
YSB2YWxpZCBpbnN0cnVjdGlvbi4KU28gSSB0aGluayB0aGlzIG5lZWRzIG1vcmUgZXhwbGFuYXRp
b24gYW5kIGRpc2N1c3Npb24uCgpKZXNzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
