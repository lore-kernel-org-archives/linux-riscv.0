Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5B0C001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 08:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkYl1gMQ/tgmHTu2OeoW1Pw1SH4YiweaWaiI6E0N814=; b=hsa30HVM1Knm7l
	/2p17w/cSVvh7nG7oYV7cZ+wg4HAe0n9GlTGRB0fjqk2CZee4fhes3rnCzo3kKBnUon4mWCCvFmNg
	9VTW4W6ZxtlI4VabDgEkmLh0PkIKYXZfjF0X2D4rEyStsjNledJyL3QAB1oaIZKxnACxS3Rke7plR
	rXoLDa654HNJw0sIm2w/Mu6lJehMxgTwTeNZOEGRVPFl+E9UvH9LkRzp3oirYMBF0wFPkULcvshZF
	0krlrdUFBzb9D47QZvH9q6yESwDEkzp8DKRYguK+aQz27zlBqZ+xg2w6cHIKh/YNiXM3ZMOrDt4Vw
	FR3Jy1g8iW6zGEyvdLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSh5-00GSvY-1f;
	Mon, 14 Aug 2023 08:12:55 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSh2-00GSsj-1s
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 08:12:53 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6459a5919cdso11119156d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692000764; x=1692605564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfpF5kDm63EBt5ohGs7vmL86MuVrwlglo2VI7V8Vaeo=;
        b=Rb1hz4RUcSRxa/c30bH0h1m8uWZUyIHQfpuvPoYg7v/f842qrxHfk9hTUbS9AG2pIa
         e0Z05bnMPdtrkVWwaaUtwMoJP+hNL6nrIVj1te0KsomEkfdYBW2xjYbQrGTnq2E7W2nF
         tTj0vV1uSbKSBMbeb5EXy7K8xakggtgTYxqGU6Q0TWb+T6Q2SeKOMvXCvDxx3Ylyn96B
         89gSCsX5NCQixbDkl5gsa5q5XKBYZfstrrSdPEomZ2JqUkJ0t5qAzHkKt0uOWRdWpQMq
         kAHQqKiov7V++3IkB++9gxGf95f5A5tNVeVWhCj4QglkdYaCMnMaNVXeHAXsoCgP79ZI
         1YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692000764; x=1692605564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfpF5kDm63EBt5ohGs7vmL86MuVrwlglo2VI7V8Vaeo=;
        b=gwZjY2WLWoGnwcjopuLusDQMX77xD7OC3USG4lFEQo0L7z98IObbGP3MF+ss940lO4
         oUf+nF9QjJh0ceAYAJwpAKo6gkYuYWs3tjbxhFCpcEIftQmLYo1jW9aGMu7DH6ESW95i
         Ec4MQZWvs7kvF0ixlTHKgvEWcAuICQGkBmUgUM7ZinfD2+b6YOEWYhOgVfMavxxEZJya
         QsAhU2vDF41GBnVXygCSOQK9rn8c7Wpva1hL6ZrSdJ+84ytXssQFtq0+d7szsWG/Rxy5
         rH/dBmm0Q31tvHLLEddjyBO2TPKT0I/iW3YW0SFzS9GqSiCDpuqYj8PzdB+wRE9qk4AH
         tBPQ==
X-Gm-Message-State: AOJu0Yx4KQAzEUPunChRciUNdVw1s1UCTMB+sGpfOFgm7s1aqGlv0TGV
	Ee07NcoSkmOl/HHqoKm/hMdc2kuGIB+YWfXUPOfbLtDvtwzxij16kyCVyg==
X-Google-Smtp-Source: AGHT+IFEDDJKw6ZhwBUIBGO4ImSwSFqPJO6+AilymT5ZB0LA6prep/8KRuxI+PIzicRe0EosSX2MBaZZlXfEqu6iNzI=
X-Received: by 2002:a0c:b2cf:0:b0:641:2c51:7726 with SMTP id
 d15-20020a0cb2cf000000b006412c517726mr8622313qvf.37.1692000764598; Mon, 14
 Aug 2023 01:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230809135042.2443350-1-nick.hu@sifive.com> <2023081143-flannels-verbally-9d0f@gregkh>
 <CAKddAkA9TZs2vVCzBWtfgo3gYJsrMMmsDMtA22iEMM3ok9TgPA@mail.gmail.com> <2023081432-level-prelaw-3794@gregkh>
In-Reply-To: <2023081432-level-prelaw-3794@gregkh>
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 14 Aug 2023 16:12:33 +0800
Message-ID: <CAKddAkDdr9ymDkyYJBznkPcePmfLN5MpRMYYYArZx+2FoAiX1A@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Add Sifive uart suspend and resume
To: Greg KH <gregkh@linuxfoundation.org>
Cc: zong.li@sifive.com, jirislaby@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_011252_698062_F7F04CE4 
X-CRM114-Status: GOOD (  21.41  )
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

SGkgR3JlZwoKT24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgMjowMuKAr1BNIEdyZWcgS0ggPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDE0LCAyMDIzIGF0
IDAxOjU1OjU4UE0gKzA4MDAsIE5pY2sgSHUgd3JvdGU6Cj4gPiBIaSBHcmVnCj4gPgo+ID4gT24g
U2F0LCBBdWcgMTIsIDIwMjMgYXQgMzoxMeKAr0FNIEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBBdWcgMDksIDIwMjMgYXQgMDk6
NTA6NDFQTSArMDgwMCwgTmljayBIdSB3cm90ZToKPiA+ID4gPiBBZGQgU2lmaXZlIHVhcnQgc3Vz
cGVuZCBhbmQgcmVzdW1lIGZ1bmN0aW9ucyBmb3Igc3lzdGVtIHN1c3BlbmQuCj4gPiA+ID4KPiA+
ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiA+IC0gQ2hhbmdlIFNpZ25lZC1vZmYtYnk6IEJlbiBE
b29rcyB0byBSZXZpZXdlZC1ieTogQmVuIERvb2tzCj4gPiA+ID4gLSBSZW1vdmUgdGhlIHVubmVj
ZXNzYXJ5IGNoZWNrCj4gPiA+ID4KPiA+ID4gPiBOaWNrIEh1ICgxKToKPiA+ID4gPiAgIHNlcmlh
bDogc2lmaXZlOiBBZGQgc3VzcGVuZCBhbmQgcmVzdW1lIG9wZXJhdGlvbnMKPiA+ID4gPgo+ID4g
PiA+ICBkcml2ZXJzL3R0eS9zZXJpYWwvc2lmaXZlLmMgfCAxOCArKysrKysrKysrKysrKysrKysK
PiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+
IC0tCj4gPiA+ID4gMi4zNC4xCj4gPiA+ID4KPiA+ID4KPiA+ID4gRG9lcyBub3QgYXBwbHkgdG8g
bXkgdHJlZSA6KAo+ID4gSXMgdGhlcmUgYW55IHJlYXNvbiB0aGF0IGl0IGRvZXNuJ3QgYXBwbHkg
dG8geW91ciB0cmVlPwo+ID4gV2hpY2ggdHJlZSBzaG91bGQgSSBnbz8KPgo+IFdoaWNoIHRyZWUg
ZGlkIHlvdSBtYWtlIGl0IGFnYWluc3Q/ICBJdCBkb2Vzbid0IGFwcGx5IGR1ZSB0byBjb25mbGlj
dHMuCj4gUGVyaGFwcyBlaXRoZXIgcmVnZW5lcmF0ZSBpdCBhZ2FpbnN0IHRoZSB0dHktbmV4dCBi
cmFuY2ggb2YgdGhlIHR0eS5naXQKPiB0cmVlLCBvciBsaW51eC1uZXh0Pwo+Cj4gdGhhbmtzLAo+
Cj4gZ3JlZyBrLWgKSSdtIHVzaW5nIHRoZSBtYWlubGluZSBsaW51eCBrZXJuZWwuClRoYW5rcyBm
b3IgdGhlIGluZm9ybWF0aW9uLgpJIGNhbiByZXByb2R1Y2UgaXQgaW4gdHR5LW5leHQgYnJhbmNo
IG9mIHRoZSB0dHkuZ2l0IQpJJ2xsIGZpeCBpdCBpbiB2My4KClJlZ2FyZHMsCk5pY2sKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
