Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A7ECDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ReP20F3NBT86PNfLFnvK4F4hGBZq1+eqfilejvDy6Xk=; b=R3zZbb4lWSpMfP
	ubtjGk3Uy/dZ+F19D0K8MTsB3ZrNTe+aBOYyUiHy7Z+5Ktr/tdZjRce0uY3OpTdpXRx5RFglZsV8n
	1RseuhNS2x/WBVEzZtW4XtaMRHYBfDEBmuvWBvpokbyWFj/KiVMsFSLTFzpWxEgCvkY9+t+UgU7J6
	M9/YIx6kiuq0fs0koi9V3I95Du+cTUf3sLQqaRTfxwF9Awdn4wh1rG901lMBbzuXianfwnYKiABhV
	6JKYAiN+6yKb4kepS/RBUHlwmXUX4TWX4zYsMBDBPXsx3NGEM0O/I4LSRPU17nJfS3LceMDshkYVl
	RbfBufnsSHJvrLBT9ijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAKC-00FJAv-2V;
	Wed, 18 Oct 2023 17:27:16 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAK8-00FJ8t-1p
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:27:16 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so87135761fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650030; x=1698254830; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+Kj7LOopyrO9EbtedWl87IOzpgEdsrSg3mf/n9/RII=;
        b=sNePfSiO2VPcIYtMm3Sk1SLI9n81TGFrkiHwinOUk4butYtjGICuXWKYiQ0oKzLotS
         OmfhkNG6moI2viAW27CtTOaMp0yb0GI+aAKCMGdmzFhETlNjxI/orXMZdxBK7mvUPy9Z
         hBS4GFxL5Lxr5MuT2Z+Rt8FudZJ7lkkQ0990+ApOMVqrm43uFmD8SAnIFYFujkSK4C2p
         z8+NP/BHKDdkvzKESb4OWO1aI3TiE3Qw/ZS8C+mPuPCgBNpJF3vbEB41fo3tfsNWAiQg
         ye3uuyfoIPFPzkIx+pPOXNmuPUlxizQRzwzlB7lrukutPmzZhUlESZ6vh6HtwbhcUnht
         zm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650030; x=1698254830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+Kj7LOopyrO9EbtedWl87IOzpgEdsrSg3mf/n9/RII=;
        b=MHY6tYt4m/L5FXFGOPLQawPqyzyrww93vAgMD7dcsTF4v8fsrWUe4yg/AQf7P5qP2i
         eaoGcXJ3ryHGevzHF5PyjCh+U+/sfz6S5avn5QwY/JCtPKJHSePWjhwE06ag6pGWF25k
         EA3mTBDTHn25te4br+7q9w+eLTQsHumru5IoepDC8mm+DnPCBdB541sC1ThPinx7Ylmj
         o6XndJSlI5eUJ26vi0p2zWPzfvcPADIh2+OXkzoj3VH0+NZQR6E3uv5yO56fNUF3Kf9Q
         +KEIFqCeBaEMI170yiHgfzWwkZ/zOayHPuXsmdz0wLcIhS4ifnH0umWb0eNL//Ze5VPf
         G6Hg==
X-Gm-Message-State: AOJu0Yy3amhW/X0DCVoFTiEzAFzVFbck1UY5TV54ffDv2C9nfp4r4Nsl
	kzft1Y3YjJ1Ajo88Cp9jrRfep345JpxvKd4gA0x8BA==
X-Google-Smtp-Source: AGHT+IFZJhAw5mzgscPKCkGfLuEObjAjse1oj45qbH86RhgIjYIEdeLlJt2zA/fa9rmaEbB5fXJsbYZYUW7bovjuTmQ=
X-Received: by 2002:ac2:4a82:0:b0:506:9c0a:17d9 with SMTP id
 l2-20020ac24a82000000b005069c0a17d9mr4831537lfp.40.1697650030177; Wed, 18 Oct
 2023 10:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-6-cleger@rivosinc.com>
 <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com> <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
In-Reply-To: <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:26:34 -0700
Message-ID: <CALs-HstEBt-ntCcETa9YwS6On3nGyoEc2p7R-gaBLG9+aFJL5w@mail.gmail.com>
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jerry Shih <jerry.shih@sifive.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102712_605097_152F6FEC 
X-CRM114-Status: GOOD (  16.91  )
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

T24gV2VkLCBPY3QgMTgsIDIwMjMgYXQgNTo1M+KAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMTgvMTAvMjAyMyAwMzo0NSwgSmVycnkg
U2hpaCB3cm90ZToKPiA+IE9uIE9jdCAxNywgMjAyMywgYXQgMjE6MTQsIENsw6ltZW50IEzDqWdl
ciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPj4gQEAgLTIyMSw2ICsyNjEsMjIgQEAg
Y29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gPj4g
ICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6a3QsIFJJU0NWX0lTQV9FWFRfWktUKSwKPiA+PiAg
ICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHprc2VkLCBSSVNDVl9JU0FfRVhUX1pLU0VEKSwKPiA+
PiAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHprc2gsIFJJU0NWX0lTQV9FWFRfWktTSCksCj4g
Pj4gKyAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmJiLCBSSVNDVl9JU0FfRVhUX1pWQkIpLAo+
ID4+ICsgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoenZiYywgUklTQ1ZfSVNBX0VYVF9aVkJDKSwK
PiA+PiArICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a2IsIFJJU0NWX0lTQV9FWFRfWlZLQiks
Cj4gPgo+ID4gVGhlIGBadmtiYCBpcyB0aGUgc3Vic2V0IG9mIGBadmJiYFsxXS4gU28sIHRoZSBg
WnZrYmAgc2hvdWxkIGJlIGJ1bmRsZWQgd2l0aCBgWnZiYmAuCj4KPiBIaSBKZXJyeSwKPgo+IFRo
YW5rcyBmb3IgY2F0Y2hpbmcgdGhpcywgSSB0aGluayBzb21lIG90aGVyIGV4dGVuc2lvbnMgd2ls
bCBmYWxsIGluCj4gdGhpcyBjYXRlZ29yeSBhcyB3ZWxsIHRoZW4gKFp2a25oYS9admtuaGIpLiBJ
IHdpbGwgdmVyaWZ5IHRoYXQuCgpUaGUgYnVuZGxpbmcgbWVjaGFuaXNtIHdvcmtzIHdlbGwgd2hl
biBhbiBleHRlbnNpb24gaXMgYSBwdXJlIGxhc3NvCmFyb3VuZCBvdGhlciBleHRlbnNpb25zLiBX
ZSdkIGhhdmUgdG8gdHdlYWsgdGhhdCBjb2RlIGlmIHdlIHdhbnRlZCB0bwpzdXBwb3J0IGNhc2Vz
IGxpa2UgdGhpcywgd2hlcmUgdGhlIGV4dGVuc2lvbiBpcyBhIHN1cGVyc2V0IG9mIG90aGVycywK
YnV0IGFsc28gY29udGFpbnMgbG9vc2UgY2hhbmdlIG5vdCBwcmVzZW50IGFueXdoZXJlIGVsc2Ug
KGFuZAp0aGVyZWZvcmUgYWxzbyBuZWVkcyB0byBzdGFuZCBhcyBhIHNlcGFyYXRlIGJpdCkuCgpJ
TU8sIGRlY29tcG9zaW5nICJwdXJlIiBidW5kbGVzIG1ha2VzIHNlbnNlIHNpbmNlIG90aGVyd2lz
ZSB1c2VybW9kZQp3b3VsZCBoYXZlIHRvIHF1ZXJ5IG11bHRpcGxlIGRpc3RpbmN0IGJpdG1hcHMg
dGhhdCBtZWFudCB0aGUgc2FtZQp0aGluZyAoZWcgY2hlY2sgdGhlIFprIGJpdCwgb3IgbWF5YmUg
Y2hlY2sgdGhlIFprbi9aa3IvWmt0IGJpdHMsIG9yCm1heWJlIGNoZWNrIHRoZSBaYmtiL1pia2Mu
Li4gYml0cywgYW5kIHRoZXkncmUgYWxsIGVxdWl2YWxlbnQpLiBCdXQKd2hlbiBhbiBleHRlbnNp
b24gaXMgYSBzdXBlcnNldCB0aGF0IGFsc28gY29udGFpbnMgbG9vc2UgY2hhbmdlLCB0aGVyZQpy
ZWFsbHkgYXJlbid0IHR3byBlcXVpdmFsZW50IGJpdG1hc2tzLCBlYWNoIGJpdCBhZGRzIHNvbWV0
aGluZyBuZXcuCgpUaGVyZSdzIGFuIGFyZ3VtZW50IHRvIGJlIG1hZGUgZm9yIHN0aWxsIHR1cm5p
bmcgb24gdGhlIGNvbnRhaW5pbmcKZXh0ZW5zaW9ucyB0byBjb3ZlciBmb3Igc2lsbHkgSVNBIHN0
cmluZ3MgKGVnIElTQSBzdHJpbmdzIHRoYXQKYWR2ZXJ0aXNlIHRoZSBzdXBlcnNldCBidXQgZmFp
bCB0byBhZHZlcnRpc2UgdGhlIGNvbnRhaW5pbmcKZXh0ZW5zaW9ucykuIFdlIGNhbiBkZWNpZGUg
aWYgd2Ugd2FudCB0byB3b3JrIHRoYXQgaGFyZCB0byBjb3ZlcgpoeXBvdGhldGljYWwgYnJva2Vu
IElTQSBzdHJpbmdzIG5vdywgb3Igd2FpdCB1bnRpbCB0aGV5IHNob3cgdXAuClBlcnNvbmFsbHkg
SSB3b3VsZCB3YWl0IHVudGlsIHNvbWV0aGluZyBicm9rZW4gc2hvd3MgdXAuIEJ1dCBvdGhlcnMK
bWF5IGZlZWwgZGlmZmVyZW50bHkuCgotRXZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
