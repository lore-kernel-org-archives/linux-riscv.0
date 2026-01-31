Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63A2D79769
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPbD/YV+XC5Kr/bdDjh9LgzYIkqPhwdxNko7BLQXxmg=; b=wvyFoPXTdCvN6z
	GVGMyzbXAcfilslNsT41lVKBIu6e7upxdN0zmZrnD2RsL3rcj7DkfQblsvCHw+G6ZdU0SPQNS9l3T
	y9WyxqvQecbhzsV6ym5rsvp+jOoO2hkKBgEtlY/z1RVjnzWnNRqF9T/tWynJDbTjwfw7SrjTBg+yp
	YH/uZfISXFE0HAg81ULho+71g/3qpE+r3E+xUwGolsm/QtuZx3mmVR9qnBoPyWCquTji7HWeBs8nS
	xzTnXRNiziiBAFdCc13EdrI8wp662OIeT1nSBVEh8/yyit9UBPB5PXZ3l/5UONtSRUfPMSdE1x/y/
	lvgF3Asrk3hyZ6p4EVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmA37-00000002ZXA-0Dru;
	Sat, 31 Jan 2026 12:26:01 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmA34-00000002ZWl-1Ety
	for linux-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 12:25:59 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-790884840baso27616987b3.0
        for <linux-riscv@lists.infradead.org>; Sat, 31 Jan 2026 04:25:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769862356; cv=none;
        d=google.com; s=arc-20240605;
        b=HnIwRpapecDO3jeg299UMNV4ezRq0we4XBX+EP2Eiwvnk9ZoDpg3F0T3r/wGkwC0lO
         8jHSgH3xXmV+EoBIp1BTjbTKcK43mldE9LRL3npQK4XtCC16boHpVkoMO1GPXN/7vB6W
         8/xlpHMCu6B+Qx/vKZqR7HtCxCjQF07wH/FiBRH/p8Jy/vaIxWKhqmNrA4bKV1auGtfp
         R8276qkKznBDCeOhl1IZklxIDPqE0DEH5J+lUQo8J5L0wunkumAI5ZEfxt/NAAEpjfQS
         DBB9aBMOGexfYuAd1AePALNGly89bq76dy9+AgmkJsiPWSeNrvAFZAJnC5VxlBBOo5ua
         GnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h7Cbjeq7Awq/O7OYp4EoKC8ia2Rbiud6u+LNrpADDGA=;
        fh=KZ+9kFdzE+BgyrdUGY+neK5gBtSRnWgehCnD6o7ptGY=;
        b=jTUgxkNf2bJxwATTrWEmTFaTFKKco5ZWlju/qSslubyf7gQd8XL3sXueFQA3jtB/uA
         tC1HEShJEsFHjI4X7SADa/JNhmE1T9W6LqEoZLcERFEF4nA9JDkZZA4HmYXVk2165HH6
         LHuMR0jdKw9B2QtCrmVY+4PWXjnisURRCDXty3lQSE4pN6cph2GSZKzRT9f4KgnmLIiN
         qyCcc2/l4U2kKnHf7ji3aRkiMDZk2PeY61oJ3RcZvvisDRUOvQiUbqn1Huy9+if0qpUE
         LbxO2vgHdsLXMMbsKMVG1q7LfjimW1hmD2Tlx8AEontyqGOZdDPMt4GcEEOlANm7bmh5
         Sdhg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769862356; x=1770467156; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7Cbjeq7Awq/O7OYp4EoKC8ia2Rbiud6u+LNrpADDGA=;
        b=rjjhzHZ2uzr5bg0RKzK7Fp5zJBceG4K7z2LpZbutWdQBHEts/GsEsqXv6+YVW2g4nq
         KjGBmiGy8O7GWnuimKpwMZkdPrNGAJusu0abJQWCNH55NVlBfwViuCBCRGHcD3REznRU
         g1Iy2SWD3kiDaVhLyvoMSyl/Zxz22c8VgwYsm8IAqNfzQdMyLjQCTlEyNvhzqobkmsgD
         YrNMy5Ifm6hmvlIavBc2PcCIoDUbo3wQQOP2ZAPHlceGNVLdgN4nA4p1cPiGoPQcor7W
         LuCs+Ist6+YzBSf5tZzekFxXf+jZoZ8/sf7IxMFyuXwqodN9iwiiGKJ8JSgms6vf4buv
         WK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769862356; x=1770467156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h7Cbjeq7Awq/O7OYp4EoKC8ia2Rbiud6u+LNrpADDGA=;
        b=o/JPNQpBeie6KsAlN3DJea3nwxSnQxYE7J38nxmjTwoO1ovSR3QPZxF5okYiQjlyQs
         sBRIRGBl9+9PVcDKYmzte2x4C9i1GfWuryYRBN60qxbI/8I0f+o9aJSihfcqLD7kO10p
         q5JtGepPg95lFSDnpfFhVWuhw0Ug1tRLo4Kwuz3PtLLP1neP1UnE3vrPMNQR2GJlGPuS
         egFHC67SA+yRy1EyuRF5+947eLk847REeLtOAqaG37xturoj0/XlrdgMP6SivFfZ8nwb
         9hSK4igBB5HSqkkALQh+3NocwzCpisV9wT3bfGp1gxkuxx4rKMWkEwcAfMvtHjPVSuMw
         pWSA==
X-Forwarded-Encrypted: i=1; AJvYcCX3Tci1LL7P1fusLA4pL/1reMn+vvXL5xNY5Czrd+PMA0+XtCfad6pW89z/TX6Imzxid8W2B9lcrb019w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeSzEUNH4ePPmudQjoGNCG6jKNPR/X75UkH2Y8FOxEn/ZzXGkJ
	JJCFgNWae86eE+eEVEOzCvHfPwDdePqbQkonewj1Ecz57uNIl1C9NrmFl14xt1gyYWV8Ynf0LMH
	OyE8LRiDpOKj2QMaUW8NtvxSmWlw1iZDaZG6FB6/0cQ==
X-Gm-Gg: AZuq6aJqKmnCXukuJ2iZnzeEOcifOaHxitR2BbZ9MArHRuFKPgcq1Fq3nAeo0DqCzmA
	nGGsvGZRu6fv9jhoRNAH45hjstZ6KTCCSSBhnaEaO/RGcSYyyfqm1HZBBMlMb+RnVrG8u9QU3FR
	wltO1ntBJHCS5eoAn228VDLRL1MNuBjr4yNS8b0oZM8rxOjGmtI8YC0+doe2ZhbV84dT2HoMthz
	oVwWaUvaYQuZAtRcBHhTG186Z7V8VfSQVwMPBhUBcHh4E/nqkKS/zdV94TBqNRUBPDcFQ1j0pTW
	S+e0bZN6tzTVOL+HXF6vSBH45CobLowaegCPmQW4W55U
X-Received: by 2002:a05:690c:6:b0:794:b829:a972 with SMTP id
 00721157ae682-794b829b51emr9689697b3.54.1769862356527; Sat, 31 Jan 2026
 04:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-2-2c86b06694ba@riscstar.com> <20260129181604.GA1398997-robh@kernel.org>
In-Reply-To: <20260129181604.GA1398997-robh@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 31 Jan 2026 20:25:44 +0800
X-Gm-Features: AZwV_Qjm8BHNJs0GMJn5ivWOUQubalnC8bF3mZnT2zWfuDpse3TJU_08t2ThoRs
Message-ID: <CAH1PCMYmK=cenJAvhGdZuh68fwNu-c_JJFpyztZUXvcOTv0YSg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_042558_586378_41AEC1E0 
X-CRM114-Status: GOOD (  17.10  )
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

SGksIFJvYgoKT24gRnJpLCBKYW4gMzAsIDIwMjYgYXQgMjoxNuKAr0FNIFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBKYW4gMjQsIDIwMjYgYXQgMDg6MjA6
MTdBTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IEFkZCBzdXBwbHkgcHJvcGVydGllcyB0
aGF0IG1hdGNoIHRoZSBQMSBQTUlDJ3MgYWN0dWFsIGhhcmR3YXJlIHRvcG9sb2d5Cj4gPiB3aGVy
ZSBlYWNoIGJ1Y2sgY29udmVydGVyIGhhcyBpdHMgb3duIFZJTiBwaW4gYW5kIExETyBncm91cHMg
c2hhcmUKPiA+IGNvbW1vbiBpbnB1dCBwaW5zLiBTdXBwbHkgbmFtZXMgYXJlIGRlZmluZWQgYWNj
b3JkaW5nIHRvIHRoZSBwaW5vdXQKPiA+IG5hbWVzIGluIHRoZSBQMSBkYXRhc2hlZXQuCj4gPgo+
ID4gVGhpcyBhbGxvd3MgZGlmZmVyZW50IGJvYXJkcyB0byBkZXNjcmliZSB0aGVpciBhY3R1YWwg
cG93ZXIgdHJlZQo+ID4gY29ubmVjdGlvbnMgaW4gZGV2aWNldHJlZSByYXRoZXIgdGhhbiBoYXJk
Y29kaW5nIHN1cHBseSByZWxhdGlvbnNoaXBzCj4gPiBpbiB0aGUgZHJpdmVyLgo+Cj4gWW91IGFy
ZSBicmVha2luZyBib3RoIGZvcndhcmQgYW5kIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IGNoYW5n
aW5nIGJvdGgKPiB0aGUgZHRzIGFuZCB0aGUgZHJpdmVyLiBJZiB0aGF0IGlzIGZpbmUgdG8gZG8s
IHRoZW4gZXhwbGljaXRseSBzYXkgc28uCgpUaGUgYnJlYWthZ2UgaXMgYWNjZXB0YWJsZSwgc28g
ZmFyIGFzIGRpc2N1c3NlZCBhbmQgYWdyZWVkIHdpdGggWWl4dW4gTGFuCmFuZCBWaXZpYW4uIEkg
d2lsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIHN0YXRlIHRoaXMgZXhwbGljaXRseSBp
biB2My4KCj4KPiBBIHNlY29uZGFyeSBpc3N1ZSBpcyB0aGUgYmluZGluZyBhbmQgZHRzIGdvIHZp
YSBkaWZmZXIgdHJlZXMgYW5kIHdlIGVuZAo+IHVwIHdpdGggaW50ZXJtaXR0ZW50IHdhcm5pbmdz
LgoKSSB3aWxsIGFkZCAidmluLXN1cHBseSIgYmFjayB0byB0aGUgYmluZGluZyB3aXRoICJkZXBy
ZWNhdGVkOiB0cnVlIiBpbiB2My4KVGhpcyBzaG91bGQgc29sdmUgdGhlIGJpbmRpbmcgYW5kIGR0
cyB3YXJuaW5ncyBkdXJpbmcgdGhlIG1lcmdlIHdpbmRvdy4KClRoYW5rIHlvdSBmb3IgdGhlIHJl
dmlldy4KCkJlc3QgcmVnYXJkcywKR3VvZG9uZyBYdQoKCgo+Cj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPiAtLS0KPiA+IHYyOiBSZW1v
dmUgcHJvdmlkZXJzIGZyb20gdGhlIGR0cyBleGFtcGxlLgo+ID4gICAgIFBhc3MgdGhlICdtYWtl
IGR0X2JpbmRpbmdfY2hlY2snIHRlc3QuCj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZmQvc3BhY2VtaXQscDEueWFtbCAgICAgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysr
Ky0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
