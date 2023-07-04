Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A09CEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8dXPIDOYikr95HCP+b2MfVKYTeJtoq0YNeNejG0Gzg=; b=Fou4mxAaNtRxBQ
	sbK/NiBPFGiE6e6D8s4aFpg3CK5PR2epfYAe/pLjs/8sy/8uCpevSWsA9fSMuV8T395bfrGQSChnf
	0K5hLcp8Mc9qVz/zmn5Emkd5oUfHlmu316JeSZ/Gn4qa8mx6py9X1ZNc22fXJqTlgdD4eE1JlkUHl
	P6bUNQtzRz7y2RgQlp1yF5+GqbhE2CY6R5STu8sxFS1CZslSbnqLHQbl9HCWM8h4XQ5y0aCIxAJaW
	zFeuq63MHWbD8XIVvJAdRacsMl9ogDBaKi4Kg2D6tGP7ByQiKoSR7lUOyS91ecFRLCqXXb69GK74k
	5iKyeoXeFN2z04wWXB+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGftt-00DNDs-0N;
	Tue, 04 Jul 2023 13:17:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGftq-00DNCy-0n
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 13:16:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3094910b150so6369193f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688476613; x=1691068613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTZLLHkFTBtSMOJnP8CLim0/TijHiGLdbtLujLrTJFk=;
        b=a8BjrrHYfZMyz6yrmzXkUQ8MdIVci4LJxe4cdhZUl/5LFBPZ5PEzheK1kIBrgpRGWg
         DepKSRrGwybfjUMLKtQ1DzLD4er/RC9rEEilDlaNE9uKSx+iqFITmKcrPtHXWVlTT6Pm
         96XI2v6C2G+crKr1K1YVSLYiB2CnYblHXYqinyVdfh53SCM8TzMjHxZpvgi+KHiHzKDq
         XrjTFmeV8qE3mcOIYZDJnxp+vZsPi5AoSSXosEdRDkQc6SrbOonIGn1sXNPQPFdGl5ET
         yyPNLSaezl7UTju75iKCyfC+8y1/Af+9r8i/C+B3qOjkebNRw3pHCaRAC2LetQKTWlW3
         FHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688476613; x=1691068613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTZLLHkFTBtSMOJnP8CLim0/TijHiGLdbtLujLrTJFk=;
        b=SZO2zOYaFtOhOyW0Rk7IpvZgxEvTbGte6okDKwoP1FCKS1UeHeNhND5xRDD1pz/GYt
         IuIKOx1aBLaoLfrttFwaJdJ12Di9EYjF6piE0+yuPETx70kbLctLV+orjhiSZhl+FtcK
         ujDO9bNt96n+jU8N2AFXMBbX4JBKBant2fimwy7+vXyFxtmIZYW0uuwDObOa+pJPoSca
         Z0mItk7rMlHSgN8AYNUH3LgY55STo5wIpxUvpYPySyI1izTXncdolLPmvMXCxs8mmmP5
         CKXzm2BI4J8cWc1fDSb21mTuAfYqfFvQGZxjr5OjOr73OxEXSPK3CZP1CnvjM9LUE8Fy
         myAg==
X-Gm-Message-State: ABy/qLbfnIAJwuz3gvIUloFxA+VqxMuAibSJIAV42JV1KSXTz3HUZfWs
	DVKWVuiLwLPoKJWbZFNCUbso8H4NHFg1YCnL3wodiX2R1iPeyEWpdA8=
X-Google-Smtp-Source: APBJJlH7VHDukA6SBACWsBQtjJa6BPWnsXvLmaA/dbhGPDLmaW4rqT8OV4z/YSjBBO/sGZmYtQEAQuxDu+EACIuBDyw=
X-Received: by 2002:a5d:670a:0:b0:313:eadf:b82d with SMTP id
 o10-20020a5d670a000000b00313eadfb82dmr9469272wru.69.1688476613446; Tue, 04
 Jul 2023 06:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230704121837.248976-1-alexghiti@rivosinc.com> <20230704-emblem-rubble-e4a3a87cb98e@wendy>
In-Reply-To: <20230704-emblem-rubble-e4a3a87cb98e@wendy>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 4 Jul 2023 15:16:42 +0200
Message-ID: <CAHVXubikF36Tc19vv9osVz3ZvEyKXk-+74YBpPAZQpSt+vFkQw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Start of DRAM should at least be aligned on PMD
 size for the direct mapping
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Song Shuai <suagrfillet@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_061658_284661_54EA7A14 
X-CRM114-Status: GOOD (  25.92  )
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

T24gVHVlLCBKdWwgNCwgMjAyMyBhdCAyOjI24oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBIZXkgQWxleCwKPgo+IE9uIFR1ZSwgSnVsIDA0
LCAyMDIzIGF0IDAyOjE4OjM3UE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IFNv
IHRoYXQgd2UgZG8gbm90IGVuZCB1cCBtYXBwaW5nIHRoZSB3aG9sZSBsaW5lYXIgbWFwcGluZyB1
c2luZyA0Swo+ID4gcGFnZXMsIHdoaWNoIGlzIHNsb3cgYXQgYm9vdCB0aW1lLCBhbmQgYWxzbyB2
ZXJ5IGxpa2VseSBhdCBydW50aW1lLgo+ID4KPiA+IFNvIG1ha2Ugc3VyZSB3ZSBhbGlnbiB0aGUg
c3RhcnQgb2YgRFJBTSBvbiBhIFBNRCBib3VuZGFyeS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4KPiBPYnZpb3VzbHkgY29y
cmVjdCBtZSBpZiBJIGFtIHdyb25nIGhlcmUsIGJ1dCB3YXMgdGhpcyBub3QgcmVwb3J0ZWQgYnkK
PiBTb25nIFNodWFpIGFzIGEgcmVncmVzc2lvbj8KPiBBY2NvcmRpbmdseSwgc2hvdWxkIHRoaXMg
bm90IGhhdmUgUmVwb3J0ZWQtYnksIENsb3Nlcy9MaW5rICYgRml4ZXMgdGFncz8KClN1cmUgd2Ug
c2hvdWxkIGFkZCB0aGUgcmVwb3J0ZWQgYnkgZnJvbSBTb25nIGFzIGhlIGRpZCB0aGUgcHJvcGVy
IHJlcG9ydCA6KQoKUmVwb3J0ZWQtYnk6IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNv
bT4KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDYyNTE0
MDkzMS4xMjY2MjE2LTEtc29uZ3NodWFpc2h1YWlAdGlueWxhYi5vcmcvCgpBbmQgeWVzIHNvcnJ5
LCBJIHRob3VnaHQgaXQgd2FzIHRoZXJlIGJlZm9yZSwgYnV0IGl0IHdhcyBhY3R1YWxseSB3aGVu
CkkgcmV0cmlldmVkIHRoZSBmaXJzdCAyTUIgdGhhdCB0aGUgcHJvYmxlbSBhcHBlYXJlZCwgc286
CgpGaXhlczogMzMzNTA2OGY4NzIxICgicmlzY3Y6IFVzZSBQVUQvUDREL1BHRCBwYWdlcyBmb3Ig
dGhlIGxpbmVhciBtYXBwaW5nIikKClRoYW5rcyEKCj4KPiBDaGVlcnMsCj4gQ29ub3IuCj4KPiA+
IC0tLQo+ID4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgNyArKysrKystCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBpbmRleCA0
ZmE0MjBmYWE3ODAuLjRhNDNlYzI3NWM2ZCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0v
aW5pdC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gQEAgLTIxNCw4ICsyMTQs
MTMgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9pZCkKPiA+ICAgICAgIG1l
bWJsb2NrX3Jlc2VydmUodm1saW51eF9zdGFydCwgdm1saW51eF9lbmQgLSB2bWxpbnV4X3N0YXJ0
KTsKPiA+Cj4gPiAgICAgICBwaHlzX3JhbV9lbmQgPSBtZW1ibG9ja19lbmRfb2ZfRFJBTSgpOwo+
ID4gKwo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIE1ha2Ugc3VyZSB3ZSBhbGlnbiB0aGUgc3Rh
cnQgb2YgdGhlIG1lbW9yeSBvbiBhIFBNRCBib3VuZGFyeSBzbyB0aGF0Cj4gPiArICAgICAgKiBh
dCB3b3JzdCwgd2UgbWFwIHRoZSBsaW5lYXIgbWFwcGluZyB3aXRoIFBNRCBtYXBwaW5ncy4KPiA+
ICsgICAgICAqLwo+ID4gICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19YSVBfS0VSTkVMKSkK
PiA+IC0gICAgICAgICAgICAgcGh5c19yYW1fYmFzZSA9IG1lbWJsb2NrX3N0YXJ0X29mX0RSQU0o
KTsKPiA+ICsgICAgICAgICAgICAgcGh5c19yYW1fYmFzZSA9IG1lbWJsb2NrX3N0YXJ0X29mX0RS
QU0oKSAmIFBNRF9NQVNLOwo+ID4KPiA+ICAgICAgIC8qCj4gPiAgICAgICAgKiBJbiA2NC1iaXQs
IGFueSB1c2Ugb2YgX192YS9fX3BhIGJlZm9yZSB0aGlzIHBvaW50IGlzIHdyb25nIGFzIHdlCj4g
PiAtLQo+ID4gMi4zOS4yCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
