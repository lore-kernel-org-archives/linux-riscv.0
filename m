Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE08BCF887B
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLuYGYMlAZCTC69IdyI6ljQWpkTHOQkAPTpQEWwG/O0=; b=Lk6o529vmygSKC
	DCm1dXt3BMlmExZHRPKUpBiCF+QKbd3jYlUfwBpsYPgJvnkl4m8z5I4m2HUqm2d/0ssz1bQRdJmnb
	RJ1SraV+2RAlCO6NdYoV3/P2EAfmDKZmHPAnZXGpC3pab7TvGP48fbClgYLji258GuTnOIoSFimYp
	w7q9sz7ZLKTL7t9b7s0nOfrp1RkDCei/XI4zndalkb0XC9V8nHDJmvEyi09xGNPWHlaTVHQkCMeGp
	El3OOkxg7rp1owIRkQsfj07wxOCi+sMoIVaJQGHXggV1LQy0RcHyn19MHtdI1T77biz8WEK9P/P/h
	EsA3rNcVnVa3aW+liJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sx2XL-0000000FFBg-46g9;
	Sat, 05 Oct 2024 11:01:23 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sx2XI-0000000FFAz-3Xdn
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 11:01:22 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-82aa8c36eefso174588139f.3
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1728126080; x=1728730880; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bREgugSagESVp9ALwvpjSU06NzrhpdO98bPNU3cl6FM=;
        b=pypf0CzHw8G2TeOm2q/OPc7AdF0Cqx/0oZkFE6Ql0KZcmQXspA6JwVBAkee8nHYKbZ
         3TD10AEUPa5GJWWjdpVm0kjUcu1EDIIgOyZweSoPLYBEeZbI+7gTLxjMaa5++YcXkPhH
         cm9NIQEAT+Hh/z6i0b1n314cUpqGGtqY27i4F2cTE0orbrPF1sZXJPTeBfVRNsDyMzPr
         yCNGnwdHfbkbnmn507dZcaE4smvuYfo78V50OlPxy61Qy0EyS0xC44MAEwDeceKK4D83
         EqnpwtypDsIWDUGAXK8C48w9M0+GKNVJjNCShLjfpFas/qKarcNtTO1sohpio4gTp1jr
         IzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728126080; x=1728730880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bREgugSagESVp9ALwvpjSU06NzrhpdO98bPNU3cl6FM=;
        b=CilxNbwM1pS0FIh3M/tDwFWOmERHIe91wj1Y492sB1ZJ1pmThoCBfzNVxZ4HIG+rwg
         1+CohzJK9+RNKc8lW9riPQxoB17W0IZV8EjLD++o4x8yX4p8ebxUAqX4bIFA2+i6nqkF
         0ekNTsGY6/5XlQdS1R88mKgCRU/qnaIHCZuwUkSVPuZjO9d53zL3Pt5dETo4baWy0ho7
         Sr6UpilYFSZxkmTJk4Myz9sAst3p66xxUVQ1uKHjFe/ZAUxJNqRYTa+x56ochTjFX6X5
         fj/vs6RDDdKuRmzYlL1eKozY7QR5KHQGYenSjN12y5JVylqT/9B/pN7HD3+jaMVOy+O5
         6EXw==
X-Forwarded-Encrypted: i=1; AJvYcCUFYEvL3PWtsqnRsW6ao0bEV2eH0FQhvuvth4E4e0VIlGMYosOMb5HG7o0bVJnk5yUv88/knwtDQrmMKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlx3sRNBGpy2SQz9IOox5E/invkLIaJBtrKkdqYwLr0GwrMsUr
	7ty7hl2zDvFI8RvkVxxcnBe2m3SxkCoYGFtX5PpEtKczT0zhuw5CxVVJ1s3ZyNG41Uk8DisjGan
	/juy2ShJj07HmUzr/7lwi1H2Pw8BnGW5jZ2tbZw==
X-Google-Smtp-Source: AGHT+IEHaB88aGwn9Zv7UXlV41DcjW2zCnzlTE+Pa5BQQ2v5u3y5Ca4EvtdkpG4NwHwh0bWWM7OzuV8hzj+pENEIUfI=
X-Received: by 2002:a92:c564:0:b0:3a0:92b1:ec4c with SMTP id
 e9e14a558f8ab-3a375bb7860mr47293525ab.23.1728126079657; Sat, 05 Oct 2024
 04:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy05BXUZu6BNUoDWoEVd_YiM0Dpqg=t5WYUX7+cacnO2Hg@mail.gmail.com>
 <mhng-1e3d83bb-a7f4-4fa7-8cfa-2550835026de@palmer-ri-x1c9>
In-Reply-To: <mhng-1e3d83bb-a7f4-4fa7-8cfa-2550835026de@palmer-ri-x1c9>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 5 Oct 2024 16:31:07 +0530
Message-ID: <CAAhSdy32s91ijfachfynzmQ1+weeBjLKaDLiCBT2gq-oTYSgDw@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] Add Svade and Svadu Extensions Support
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, yongxuan.wang@sifive.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_040121_176374_07864A07 
X-CRM114-Status: GOOD (  31.54  )
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

SGkgUGFsbWVyLAoKT24gRnJpLCBTZXAgMjAsIDIwMjQgYXQgMTo1M+KAr1BNIFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMjEgQXVnIDIwMjQg
MDc6NDM6MjAgUERUICgtMDcwMCksIGFudXBAYnJhaW5mYXVsdC5vcmcgd3JvdGU6Cj4gPiBIaSBQ
YWxtZXIsCj4gPgo+ID4gT24gRnJpLCBKdWwgMjYsIDIwMjQgYXQgMjoxOeKAr1BNIFlvbmctWHVh
biBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gU3ZhZGUg
YW5kIFN2YWR1IGV4dGVuc2lvbnMgcmVwcmVzZW50IHR3byBzY2hlbWVzIGZvciBtYW5hZ2luZyB0
aGUgUFRFIEEvRAo+ID4+IGJpdC4gV2hlbiB0aGUgUFRFIEEvRCBiaXRzIG5lZWQgdG8gYmUgc2V0
LCBTdmFkZSBleHRlbnNpb24gaW50ZGljYXRlcyB0aGF0Cj4gPj4gYSByZWxhdGVkIHBhZ2UgZmF1
bHQgd2lsbCBiZSByYWlzZWQuIEluIGNvbnRyYXN0LCB0aGUgU3ZhZHUgZXh0ZW5zaW9uCj4gPj4g
c3VwcG9ydHMgaGFyZHdhcmUgdXBkYXRpbmcgb2YgUFRFIEEvRCBiaXRzLiBUaGlzIHNlcmllcyBl
bmFibGVzIFN2YWRlIGFuZAo+ID4+IFN2YWR1IGV4dGVuc2lvbnMgZm9yIGJvdGggaG9zdCBhbmQg
Z3Vlc3QgT1MuCj4gPj4KPiA+PiBSZWdyYWRpbmcgdGhlIG1haWxpbmcgdGhyZWFkWzFdLCB3ZSBo
YXZlIDQgcG9zc2libGUgY29tYmluYXRpb25zIG9mCj4gPj4gdGhlc2UgZXh0ZW5zaW9ucyBpbiB0
aGUgZGV2aWNlIHRyZWUsIHRoZSBkZWZhdWx0IGhhcmR3YXJlIGJlaGF2aW9yIGZvcgo+ID4+IHRo
ZXNlIHBvc3NpYmlsaXRpZXMgYXJlOgo+ID4+IDEpIE5laXRoZXIgU3ZhZGUgbm9yIFN2YWR1IHBy
ZXNlbnQgaW4gRFQgPT4gSXQgaXMgdGVjaG5pY2FsbHkKPiA+PiAgICB1bmtub3duIHdoZXRoZXIg
dGhlIHBsYXRmb3JtIHVzZXMgU3ZhZGUgb3IgU3ZhZHUuIFN1cGVydmlzb3IKPiA+PiAgICBzb2Z0
d2FyZSBzaG91bGQgYmUgcHJlcGFyZWQgdG8gaGFuZGxlIGVpdGhlciBoYXJkd2FyZSB1cGRhdGlu
Zwo+ID4+ICAgIG9mIHRoZSBQVEUgQS9EIGJpdHMgb3IgcGFnZSBmYXVsdHMgd2hlbiB0aGV5IG5l
ZWQgdXBkYXRlZC4KPiA+PiAyKSBPbmx5IFN2YWRlIHByZXNlbnQgaW4gRFQgPT4gU3VwZXJ2aXNv
ciBtdXN0IGFzc3VtZSBTdmFkZSB0byBiZQo+ID4+ICAgIGFsd2F5cyBlbmFibGVkLgo+ID4+IDMp
IE9ubHkgU3ZhZHUgcHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIG11c3QgYXNzdW1lIFN2YWR1
IHRvIGJlCj4gPj4gICAgYWx3YXlzIGVuYWJsZWQuCj4gPj4gNCkgQm90aCBTdmFkZSBhbmQgU3Zh
ZHUgcHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIG11c3QgYXNzdW1lCj4gPj4gICAgU3ZhZHUg
dHVybmVkLW9mZiBhdCBib290IHRpbWUuIFRvIHVzZSBTdmFkdSwgc3VwZXJ2aXNvciBtdXN0Cj4g
Pj4gICAgZXhwbGljaXRseSBlbmFibGUgaXQgdXNpbmcgdGhlIFNCSSBGV0ZUIGV4dGVuc2lvbi4K
PiA+Pgo+ID4+IFRoZSBTdmFkZSBleHRlbnNpb24gaXMgbWFuZGF0b3J5IGFuZCB0aGUgU3ZhZHUg
ZXh0ZW5zaW9uIGlzIG9wdGlvbmFsIGluCj4gPj4gUlZBMjMgcHJvZmlsZS4gUGxhdGZvcm1zIHdh
bnQgdG8gdGFrZSB0aGUgYWR2YW50YWdlIG9mIFN2YWR1IGNhbiBjaG9vc2UKPiA+PiAzLiBUaG9z
ZSBhcmUgYXdhcmUgb2YgdGhlIHByb2ZpbGUgY2FuIGNob29zZSA0LCBhbmQgTGludXggd29uJ3Qg
Z2V0IHRoZQo+ID4+IGJlbmVmaXQgb2Ygc3ZhZHUgdW50aWwgdGhlIFNCSSBGV0ZUIGV4dGVuc2lv
biBpcyBhdmFpbGFibGUuCj4gPj4KPiA+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgta2VybmVsLzIwMjQwNTI3LWU5ODQ1YzA2NjE5YmNhNWNkMjg1MDk4Y0BvcmVsL1QvI20yOTY0
NGViODhlMjQxZWMyODJkZjRjY2Q1MTk5NTE0ZTkxM2IwNmVlCj4gPj4KPiA+PiAtLS0KPiA+PiB2
ODoKPiA+PiAtIGZpeCB0eXBvIGluIFBBVENIMSAoU2FtdWVsKQo+ID4+IC0gdXNlIHRoZSBuZXcg
ZXh0ZW5zaW9uIHZhbGlkYXRpbmcgQVBJIGluIFBBVENIMSAoQ2zDqW1lbnQpCj4gPj4gLSB1cGRh
dGUgdGhlIGR0YmluZGluZyBpbiBQQVRDSDIgKFNhbXVlbCwgQ29ub3IpCj4gPj4gLSBhZGQgUEFU
Q0g0IHRvIGZpeCBjb21waWxlIGVycm9yIGluIGdldC1yZWctbGlzdCB0ZXN0Lgo+ID4+Cj4gPj4g
djc6Cj4gPj4gLSBmaXggYWxpZ25tZW50IGluIFBBVENIMQo+ID4+IC0gdXBkYXRlIHRoZSBkdGJp
bmRpbmcgaW4gUEFUQ0gyIChDb25vciwgSmVzc2ljYSkKPiA+Pgo+ID4+IHY2Ogo+ID4+IC0gcmVm
bGVjdCB0aGUgcGxhdGZvcm0ncyBiZWhhdmlvciBieSByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWls
YWJsZSgpIGFuZAo+ID4+ICAgdXBkYXRlIHRoZSB0aGUgYXJjaF9oYXNfaHdfcHRlX3lvdW5nKCkg
aW4gUEFUQ0gxIChDb25vciwgQW5kcmV3KQo+ID4+IC0gdXBkYXRlIHRoZSBkdGJpbmRpbmcgaW4g
UEFUQ0gyIChBbGV4YW5kcmUsIEFuZHJldywgQW51cCwgQ29ub3IpCj4gPj4gLSB1cGRhdGUgdGhl
IGhlbnZjZmcgY29uZGl0aW9uIGluIFBBVENIMyAoQW5kcmV3KQo+ID4+IC0gY2hlY2sgaWYgU3Zh
ZGUgaXMgYWxsb3dlZCB0byBkaXNhYmxlZCBiYXNlZCBvbiBhcmNoX2hhc19od19wdGVfeW91bmco
KQo+ID4+ICAgaW4gUEFUQ0gzCj4gPj4KPiA+PiB2NToKPiA+PiAtIHJlbW92ZSBhbGwgQWNrZWQt
YnkgYW5kIFJldmlld2VkLWJ5IChDb25vciwgQW5kcmV3KQo+ID4+IC0gYWRkIFN2YWRlIHN1cHBv
cnQKPiA+PiAtIHVwZGF0ZSB0aGUgYXJjaF9oYXNfaHdfcHRlX3lvdW5nKCkgaW4gUEFUQ0gxCj4g
Pj4gLSB1cGRhdGUgdGhlIGR0YmluZGluZyBpbiBQQVRDSDIgKEFsZXhhbmRyZSwgQW5kcmV3KQo+
ID4+IC0gY2hlY2sgdGhlIGF2YWlsaWJpbGl0eSBvZiBTdmFkdSBmb3IgR3Vlc3QvVk0gYmFzZWQg
b24KPiA+PiAgIGFyY2hfaGFzX2h3X3B0ZV95b3VuZygpIGluIFBBVENIMwo+ID4+Cj4gPj4gdjQ6
Cj4gPj4gLSBmaXggMzJiaXQga2VybmVsIGJ1aWxkIGVycm9yIGluIFBBVENIMSAoQ29ub3IpCj4g
Pj4gLSB1cGRhdGUgdGhlIHN0YXR1cyBvZiBTdmFkdSBleHRlbnNpb24gdG8gcmF0aWZpZWQgaW4g
UEFUQ0gyCj4gPj4gLSBhZGQgdGhlIFBBVENINCB0byBzdXBvcnJ0IFNCSV9GV0ZUX1BURV9BRF9I
V19VUERBVElORyBmb3IgZ3Vlc3QgT1MKPiA+PiAtIHVwZGF0ZSB0aGUgUEFUQ0gxIGFuZCBQQVRD
SDMgdG8gaW50ZWdyYXRlIHdpdGggRldGVCBleHRlbnNpb24KPiA+PiAtIHJlYmFzZSBQQVRDSDUg
b24gdGhlIGxhc3Rlc3QgZ2V0LXJlZy1saXN0IHRlc3QgKEFuZHJldykKPiA+Pgo+ID4+IHYzOgo+
ID4+IC0gZml4IHRoZSBjb250cm9sIGJpdCBuYW1lIHRvIEFEVUUgaW4gUEFUQ0gxIGFuZCBQQVRD
SDMKPiA+PiAtIHVwZGF0ZSBnZXQtcmVnLWxpc3QgaW4gUEFUQ0g0Cj4gPj4KPiA+PiB2MjoKPiA+
PiAtIGFkZCBDby1kZXZlbG9wZWQtYnk6IGluIFBBVENIMQo+ID4+IC0gdXNlIHJpc2N2X2hhc19l
eHRlbnNpb25fdW5saWtlbHkoKSB0byBydW50aW1lIHBhdGNoIHRoZSBicmFuY2ggaW4gUEFUQ0gx
Cj4gPj4gLSB1cGRhdGUgZHQtYmluZGluZwo+ID4+Cj4gPj4gWW9uZy1YdWFuIFdhbmcgKDUpOgo+
ID4+ICAgUklTQy1WOiBBZGQgU3ZhZGUgYW5kIFN2YWR1IEV4dGVuc2lvbnMgU3VwcG9ydAo+ID4+
ICAgZHQtYmluZGluZ3M6IHJpc2N2OiBBZGQgU3ZhZGUgYW5kIFN2YWR1IEVudHJpZXMKPiA+PiAg
IFJJU0MtVjogS1ZNOiBBZGQgU3ZhZGUgYW5kIFN2YWR1IEV4dGVuc2lvbnMgU3VwcG9ydCBmb3Ig
R3Vlc3QvVk0KPiA+PiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogRml4IGNvbXBpbGUgZXJyb3IK
PiA+PiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFN2YWRlIGFuZCBTdmFkdSBFeHRlbnNp
b24gdG8gZ2V0LXJlZy1saXN0Cj4gPj4gICAgIHRlc3QKPiA+Pgo+ID4+ICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCAyOCArKysrKysrKysrKysrKysrKysr
Cj4gPj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKPiA+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAgICAgICAgICAgICAgICAgIHwg
IDEgKwo+ID4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAgICAgICAgICAg
fCAgMiArKwo+ID4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAgICAgICAg
ICAgfCAxMyArKysrKysrKy0KPiA+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5o
ICAgICAgICAgICAgIHwgIDIgKysKPiA+PiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
ICAgICAgICAgICAgICAgIHwgMTIgKysrKysrKysKPiA+PiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5j
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysrCj4gPj4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHVfb25lcmVnLmMgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysrKysKPiA+PiAgLi4uL3Nl
bGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgMTYgKysrKysrKystLS0K
PiA+PiAgMTAgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
PiA+Pgo+ID4+IC0tCj4gPj4gMi4xNy4xCj4gPj4KPiA+Pgo+ID4KPiA+IExldCBtZSBrbm93IGlm
IHRoaXMgc2VyaWVzIGNhbiBiZSB0YWtlbiB0aHJvdWdoIHRoZSBLVk0gUklTQy1WIHRyZWUuCj4g
PiBJIGNhbiBwcm92aWRlIHlvdSB3aXRoIGEgc2hhcmVkIHRhZyBhcyB3ZWxsLgo+Cj4gSSB0aGlu
ayB0aGUgcGF0Y2h3b3JrIGJvdCBnb3QgY29uZnVzZWQgYnkgcGF0Y2ggNCBnb2luZyB0byBmaXhl
cz8gIEl0Cj4gc2F5cyB0aGlzIHdhcyBtZXJnZWQuCj4KPiBBY2tlZC1ieTogUGFsbWVyIERhYmJl
bHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4KPiBpZiB5b3Ugc3RpbGwgd2FudCB0byB0YWtlIGl0
LCBvdGhlcndpc2UganVzdCBMTUsgYW5kIEknbGwgcGljayBpdCB1cC4KPgoKSSBoYXZlIHF1ZXVl
ZCB0aGlzIHNlcmllcyBmb3IgTGludXgtNi4xMwoKVGhhbmtzLApBbnVwCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
