Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAE0C19F4F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 08:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbYyzra37pvs0V74vQ4Ufi4qBMAOzBm9mF+3lF9maiU=; b=pUlWxvOBbA0jZw
	5jSZ8kdgbqhm/nJTfQln5lp2UWrHlFKrjSUnFRPY9GRr2LVzAksVQ7n5JigmbqM5E4VBXigAfRNsv
	SWK21WLLsTITdMixwxLl4mwcru9UXkQEdGuo5XTIwm4q4fx1scpgWSlI6ugCdUQm/NcQaF69MeusY
	hZwbGg1Njzs/5PAZwr9yufuALB6YOLIJhMM7uwzOaMtnx20mf6cCpuPanNM5OgMi9tE4bYMpOMxuM
	X2qLy/9B5ZZqmsUYpQ8mAIX9kwLh6azx4IoLxlhkooNC7R0GdrKpMCwXWzAMvNhUJ7lDmCC9ONzLk
	iMuulJ7zCt2pB1ZMO+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1icA-00000005Z2f-1UwJ;
	Tue, 30 Apr 2024 08:13:26 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ic7-00000005Yzk-0s5r
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 08:13:25 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so5725099276.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 01:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714464801; x=1715069601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TtRmxvOsaI0j8vIb/52uFQJ4Na+dlsFyaOa4Vf0Bw8=;
        b=IZb/xCdBJbmmGeDYG68QEpO9S+3GbUcY1Avjfrx1Xwo9JWmp98AZMLM8nRxN6jqfBG
         glcDRR6KU6ykd8oRL2pSytuUxbXjH4jDb3+1mP3JJ61QRo5aOU0GPslaN0HWGNGOI42B
         ZSprMnlUCM0tGerLtapEgGKbdzZvKcjztm+mllCsw47WjK/uVdrhomHtJfV5k4/EUWkF
         ub8EX03DCnvqo1iuFE15xNo90aMqIz/QkQk8P21UScHlfjKSvJWYOjqzHauPjr8TSVsL
         JPmRkGC6ME9tLLLfx9yol0+F3LNgVQ8eUfFK2MvG7SqTHljNJyye6NXI91Xk1Oua6/7R
         29fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714464801; x=1715069601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TtRmxvOsaI0j8vIb/52uFQJ4Na+dlsFyaOa4Vf0Bw8=;
        b=PEzGXdQTO3RZeTtzsn+z09EOHBmNToGpWkJnE4lV1C8SPpPCxdEJLdLFYaT4rH8OtY
         tH3V1tmPkceC+SIsS3Y2uHWkN8eHAzOhwBobYXWJJi7ngUOKgIUoHXFVZZtDtQM4AxCn
         TOsDJZZ503a1XbQf3saWjSFOaHXXyDlCzNgtIxt2lu+mYJDQR48mEkTAkfexcalB+7M8
         AVMFY2YLyWGJ2V5Rrpau/vp4ZNeYIK9hiu6VhYi2zuqENSTA+H9Ln4Lc3k6qsyx4qx6F
         3bEB5AyqTP9Sg4xwmirPgkiyhG2G5SrF1fpYxZvk38uMoHWCMiEWzq6FHWBUl0M3XQLQ
         Kurw==
X-Forwarded-Encrypted: i=1; AJvYcCUD2PrXji6vJGmMZg5blYRxlBOJBWNc1P3eNrMPWarjIejvWHff3Qhzl+1EsbkfoIshMOeysiN5W3HlYMsgWmt+yaoyWvihX5ejOpXGjQCa
X-Gm-Message-State: AOJu0Yy1rFcNmKgrXK7hlhwEtNSwN400SrvZZyFhRPtzsZP6vjYhRLnX
	S0Fhjt4b4sZIhk9CDx7PpbFJvOZNJemDqDgvobhBrKufbPYf1mXVqmfM0co/rtU7sZIRuyhaVHN
	/TEK9YEswyrjbaFu7ed8w0QRy/oWc2R1lUJkTtA==
X-Google-Smtp-Source: AGHT+IFjQ4jcj+SFmGdgdYQVyeYWI84FI6MAtglUVUVYv0AmAjAKKjhMzdBf/Fl4uG4yVHAB5V7kQLamY+zMgVqWZJI=
X-Received: by 2002:a05:6902:1b12:b0:dcc:2f09:4742 with SMTP id
 eh18-20020a0569021b1200b00dcc2f094742mr2145150ybb.51.1714464800928; Tue, 30
 Apr 2024 01:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240226065113.1690534-1-nick.hu@sifive.com> <CAPDyKFph3WsZMmALnzBQKE4S_80Ji5h386Wi0vHda37QUsjMtg@mail.gmail.com>
 <CAKddAkDcdaXKzpcKN=LCCx9S4Trv+joLX2s=nyhzaRtM5HorqA@mail.gmail.com> <CAKddAkC6N=Cfo0z+F8herKTuJzCyt_MA0vWNbLCr6CbQnj0y8g@mail.gmail.com>
In-Reply-To: <CAKddAkC6N=Cfo0z+F8herKTuJzCyt_MA0vWNbLCr6CbQnj0y8g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Apr 2024 10:12:43 +0200
Message-ID: <CAPDyKFr_M0NDH0gaunBpybnALOFfz4LpX4_JW2GCUxjwGzdZsg@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Add cluster_pm_enter()/exit()
To: Nick Hu <nick.hu@sifive.com>
Cc: palmer@dabbelt.com, anup@brainfault.org, rafael@kernel.org, 
	daniel.lezcano@linaro.org, paul.walmsley@sifive.com, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_011323_291171_089D9BAC 
X-CRM114-Status: GOOD (  31.83  )
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

T24gTW9uLCAyOSBBcHIgMjAyNCBhdCAxODoyNiwgTmljayBIdSA8bmljay5odUBzaWZpdmUuY29t
PiB3cm90ZToKPgo+IE9uIFR1ZSwgQXByIDMwLCAyMDI0IGF0IDEyOjIy4oCvQU0gTmljayBIdSA8
bmljay5odUBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBVbGYKPiA+Cj4gPiBPbiBNb24s
IEFwciAyOSwgMjAyNCBhdCAxMDozMuKAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5h
cm8ub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCAyNiBGZWIgMjAyNCBhdCAwNzo1MSwg
TmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFdoZW4g
dGhlIGNwdXMgaW4gdGhlIHNhbWUgY2x1c3RlciBhcmUgYWxsIGluIHRoZSBpZGxlIHN0YXRlLCB0
aGUga2VybmVsCj4gPiA+ID4gbWlnaHQgcHV0IHRoZSBjbHVzdGVyIGludG8gYSBkZWVwZXIgbG93
IHBvd2VyIHN0YXRlLiBDYWxsIHRoZQo+ID4gPiA+IGNsdXN0ZXJfcG1fZW50ZXIoKSBiZWZvcmUg
ZW50ZXJpbmcgdGhlIGxvdyBwb3dlciBzdGF0ZSBhbmQgY2FsbCB0aGUKPiA+ID4gPiBjbHVzdGVy
X3BtX2V4aXQoKSBhZnRlciB0aGUgY2x1c3RlciB3b2tlbiB1cC4KPiA+ID4gPgo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiA+ID4KPiA+ID4gSSB3
YXMgbm90IGNjZWQgdGhpcyBwYXRjaCwgYnV0IG5vdGljZWQgdGhhdCB0aGlzIHBhdGNoIGdvdCBx
dWV1ZWQgdXAKPiA+ID4gcmVjZW50bHkuIFNvcnJ5IGZvciBub3Qgbm90aWNpbmcgZWFybGllci4K
PiA+ID4KPiA+ID4gSWYgbm90IHRvbyBsYXRlLCBjYW4geW91IHBsZWFzZSBkcm9wL3JldmVydCBp
dD8gV2Ugc2hvdWxkIHJlYWxseSBtb3ZlCj4gPiA+IGF3YXkgZnJvbSB0aGUgQ1BVIGNsdXN0ZXIg
bm90aWZpZXJzLiBTZWUgbW9yZSBpbmZvcm1hdGlvbiBiZWxvdy4KPiA+ID4KPiA+ID4gPiAtLS0K
PiA+ID4gPiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgfCAyNCArKysrKysr
KysrKysrKysrKysrKysrLS0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
cHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgYi9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNj
di1zYmkuYwo+ID4gPiA+IGluZGV4IGU4MDk0ZmM5MjQ5MS4uMjk4ZGM3NmEwMGNmIDEwMDY0NAo+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gPiA+ID4g
KysrIGIvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiA+ID4gPiBAQCAtMzk0
LDYgKzM5NCw3IEBAIHN0YXRpYyBpbnQgc2JpX2NwdWlkbGVfcGRfcG93ZXJfb2ZmKHN0cnVjdCBn
ZW5lcmljX3BtX2RvbWFpbiAqcGQpCj4gPiA+ID4gIHsKPiA+ID4gPiAgICAgICAgIHN0cnVjdCBn
ZW5wZF9wb3dlcl9zdGF0ZSAqc3RhdGUgPSAmcGQtPnN0YXRlc1twZC0+c3RhdGVfaWR4XTsKPiA+
ID4gPiAgICAgICAgIHUzMiAqcGRfc3RhdGU7Cj4gPiA+ID4gKyAgICAgICBpbnQgcmV0Owo+ID4g
PiA+Cj4gPiA+ID4gICAgICAgICBpZiAoIXN0YXRlLT5kYXRhKQo+ID4gPiA+ICAgICAgICAgICAg
ICAgICByZXR1cm4gMDsKPiA+ID4gPiBAQCAtNDAxLDYgKzQwMiwxMCBAQCBzdGF0aWMgaW50IHNi
aV9jcHVpZGxlX3BkX3Bvd2VyX29mZihzdHJ1Y3QgZ2VuZXJpY19wbV9kb21haW4gKnBkKQo+ID4g
PiA+ICAgICAgICAgaWYgKCFzYmlfY3B1aWRsZV9wZF9hbGxvd19kb21haW5fc3RhdGUpCj4gPiA+
ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4gPiA+ID4KPiA+ID4gPiArICAgICAg
IHJldCA9IGNwdV9jbHVzdGVyX3BtX2VudGVyKCk7Cj4gPiA+ID4gKyAgICAgICBpZiAocmV0KQo+
ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPgo+ID4gPiBSYXRoZXIgdGhh
biB1c2luZyB0aGUgQ1BVIGNsdXN0ZXIgbm90aWZpZXJzLCBjb25zdW1lcnMgb2YgdGhlIGdlbnBk
Cj4gPiA+IGNhbiByZWdpc3RlciB0aGVtc2VsdmVzIHRvIHJlY2VpdmUgZ2VucGQgb24vb2ZmIG5v
dGlmaWVycy4KPiA+ID4KPiA+ID4gSW4gb3RoZXIgd29yZHMsIG5vbmUgb2YgdGhpcyBzaG91bGQg
YmUgbmVlZGVkLCByaWdodD8KPiA+ID4KPiA+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIQo+ID4g
TWF5YmUgSSBtaXNzIHNvbWV0aGluZywgSSdtIHdvbmRlcmluZyBhYm91dCBhIGNhc2UgbGlrZSBi
ZWxvdzoKPiA+IElmIHdlIGhhdmUgYSBzaGFyZWQgTDIgY2FjaGUgY29udHJvbGxlciBpbnNpZGUg
dGhlIGNwdSBjbHVzdGVyIHBvd2VyCj4gPiBkb21haW4gYW5kIHdlIGFkZCB0aGlzIGNvbnRyb2xs
ZXIgdG8gYmUgYSBjb25zdW1lciBvZiB0aGUgcG93ZXIKPiA+IGRvbWFpbiwgU2hvdWxkbid0IHRo
ZSBnZW5wZCBpbnZva2UgdGhlIGRvbWFpbiBpZGxlIG9ubHkgYWZ0ZXIgdGhlCj4gPiBzaGFyZWQg
TDIgY2FjaGUgY29udHJvbGxlciBpcyBzdXNwZW5kZWQ/Cj4gPiBJcyB0aGVyZSBhIHdheSB0aGF0
IHdlIGNhbiBwdXQgdGhlIEwyIGNhY2hlIGRvd24gd2hpbGUgYWxsIGNwdXMgaW4gdGhlCj4gPiBz
YW1lIGNsdXN0ZXIgYXJlIGlkbGU/Cj4gPiA+IFsuLi5dCj4gU29ycnksIEkgbWFkZSBzb21lIG1p
c3Rha2UgaW4gbXkgc2Vjb25kIHF1ZXN0aW9uLgo+IFVwZGF0ZSB0aGUgcXVlc3Rpb24gaGVyZToK
PiBJcyB0aGVyZSBhIHdheSB0aGF0IHdlIGNhbiBzYXZlIHRoZSBMMiBjYWNoZSBzdGF0ZXMgd2hp
bGUgYWxsIGNwdXMgaW4gdGhlCj4gc2FtZSBjbHVzdGVyIGFyZSBpZGxlIGFuZCB0aGUgY2x1c3Rl
ciBjb3VsZCBiZSBwb3dlcmVkIGRvd24/CgpJZiB0aGUgTDIgY2FjaGUgaXMgYSBjb25zdW1lciBv
ZiB0aGUgY2x1c3RlciwgdGhlIGNvbnN1bWVyIGRyaXZlciBmb3IKdGhlIEwyIGNhY2hlIHNob3Vs
ZCByZWdpc3RlciBmb3IgZ2VucGQgb24vb2ZmIG5vdGlmaWVycy4KClRoZSBkZXZpY2UgcmVwcmVz
ZW50aW5nIHRoZSBMMiBjYWNoZSBuZWVkcyB0byBiZSBlbmFibGVkIGZvciBydW50aW1lClBNLCB0
byBiZSB0YWtlbiBpbnRvIGFjY291bnQgY29ycmVjdGx5IGJ5IHRoZSBjbHVzdGVyIGdlbnBkLiBJ
biB0aGlzCmNhc2UsIHRoZSBkZXZpY2Ugc2hvdWxkIG1vc3QgbGlrZWx5IHJlbWFpbiBydW50aW1l
IHN1c3BlbmRlZCwgYnV0Cmluc3RlYWQgcmVseSBvbiB0aGUgZ2VucGQgb24vb2ZmIG5vdGlmaWVy
cyB0byB1bmRlcnN0YW5kIHdoZW4Kc2F2ZS9yZXN0b3JlIG9mIHRoZSBjYWNoZSBzdGF0ZXMgc2hv
dWxkIGJlIGRvbmUuCgpLaW5kIHJlZ2FyZHMKVWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
