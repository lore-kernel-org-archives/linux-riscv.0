Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D81ECF58F2
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 08:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMKC8b6R1nClsMHuGqhzcDD9B2WAQHsHMwiD9+Jt1sE=; b=JgzXLL7JnTMp1g
	4zkz24acw+jBg09+XhoMV9h7Yn4OKO2DO/S55f4SXVZi9+XP4v1LFiFrN8A/qBfFgAqDZTcg58WFe
	6rc4+5mbAWoUTGCpyyoT4UnnFO1CmfzJ5t2lUdtNlmViGA1JDQ/bDQDbt0uDGZ35IjTGR+fEyfoAS
	cB6g1FJGY2yb2R7jWxqvknsq0uA0Zz4OLp+GYGRBYThKH1lpAGdW6c/bRAD4/o0s19g5K38BeK3hU
	YCFRtEPyYuMfzOy7G64I40hlczihy7UOC8OrOXN8ILHdzMQ2H0ANuAQRhYQuC/stZxDnH8FJgJB8z
	45axcjZZ+Mys5gms74ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZKE-0000000BpHG-04I0;
	Fri, 20 Sep 2024 08:49:14 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srZ6S-0000000Bmry-0plV
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 08:35:02 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3a0b5973fe0so7573015ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2024 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1726821298; x=1727426098; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMiWTjaHnHS0JzzbhnLCVrfpCgiv+dcBe7V+IIK3140=;
        b=tA7YAzmz/OGEf8i4DsCHopjEfuPJfzvrmlWCLo1QEENq3ip+yX/V9Qq8WiTF2u9OTF
         NnfAou2UuilggvW3z6AEWRJNpJQ3VTNS134YI9B841iI7lBDhH+t/rnP0e3BEVy+nOEz
         QKZzH0IhKNEqTUIHaNmvClhz9zONo765Qf5/VLZH9Q2rkVxHMq+u73ofBcaeBeuw7qoP
         B5a4kXzs3TdD+amH5HTEpUyKqFp019vZQt3Wterx1bQjMNghwDIViPHMw61jzBiE42ii
         3XgmFyHzWa3WLT5lwmL0l6BFxPShQJL2Q8MC3MURCIPnZs/yauSUH6ZmJjM36GFycnu4
         Rxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726821298; x=1727426098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMiWTjaHnHS0JzzbhnLCVrfpCgiv+dcBe7V+IIK3140=;
        b=Kbb91G895Vkt8cGC2l4MR+HeOurpntNY+9czm9Pt5TUjvVdU9fXfhLRfcBkkuVZVdV
         /To6bhej3ITJyhXJmoSjAZEs1X3HV7YvTv3YEH0z7RtDXQ0kUsFgrk4dAdhnrPbNELyW
         vyJTMiKYu/TQEUwnY1oKGRg/ojH9Q25CfOY5STg3eO1SV+eKrOgFAc8NLUMeMLyS6Pbc
         RwyQQQGnPPabY9HMHQ8jfk7/JDAvNgma4uxU+Mu4tGFiWwzNrWhXu9H5pXDUdS8gRZ3f
         i+cN0+Uw/hi8fq1Cw4RABlm/gwXnBjXPst0k3l7ap1e0AOBytnFBRf9jI9EYk2dowN8S
         2QqA==
X-Forwarded-Encrypted: i=1; AJvYcCUFkY9mhGqdOIgWNEy2zw82eLEIzkHnU5y4r0WgU8w1MCKOnON1JiiBGrn+ckU9JIBMQ1qAcGsaHgLrHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvfDlv3guqRffKddBYpjD0aY1EBv8KcJoj0sjIabfMDexf8NEj
	7Ad6nNJwOJCfhrpTtY6tlNeuglYyl8OsraiZbDSxoea7xbFAHbw00ermEIeF8IvA867sCNkA8N9
	lZYQi8UV3zNcB/GPRa0y6JGN+JODqEfkclYj886qULx7DdTb2jgM=
X-Google-Smtp-Source: AGHT+IHq6B1rRJenopqNmyWR6VL8HDws3rxiWv+qj9OzdKYH3N6807kKyhX5RCCNU3zx9rqm2laOp98JD8OY2gJr63k=
X-Received: by 2002:a05:6e02:1aa3:b0:3a0:a21c:d2b2 with SMTP id
 e9e14a558f8ab-3a0c8ca7795mr25933665ab.11.1726821298213; Fri, 20 Sep 2024
 01:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy05BXUZu6BNUoDWoEVd_YiM0Dpqg=t5WYUX7+cacnO2Hg@mail.gmail.com>
 <mhng-1e3d83bb-a7f4-4fa7-8cfa-2550835026de@palmer-ri-x1c9>
In-Reply-To: <mhng-1e3d83bb-a7f4-4fa7-8cfa-2550835026de@palmer-ri-x1c9>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Sep 2024 14:04:47 +0530
Message-ID: <CAAhSdy08j_noBGi2CRf0oLBxFnmk983W24oQezmdg1pw6pFksQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] Add Svade and Svadu Extensions Support
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, yongxuan.wang@sifive.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_013500_436652_764D2066 
X-CRM114-Status: GOOD (  32.24  )
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

T24gRnJpLCBTZXAgMjAsIDIwMjQgYXQgMTo1M+KAr1BNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
cml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMjEgQXVnIDIwMjQgMDc6NDM6MjAgUERU
ICgtMDcwMCksIGFudXBAYnJhaW5mYXVsdC5vcmcgd3JvdGU6Cj4gPiBIaSBQYWxtZXIsCj4gPgo+
ID4gT24gRnJpLCBKdWwgMjYsIDIwMjQgYXQgMjoxOeKAr1BNIFlvbmctWHVhbiBXYW5nIDx5b25n
eHVhbi53YW5nQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gU3ZhZGUgYW5kIFN2YWR1IGV4
dGVuc2lvbnMgcmVwcmVzZW50IHR3byBzY2hlbWVzIGZvciBtYW5hZ2luZyB0aGUgUFRFIEEvRAo+
ID4+IGJpdC4gV2hlbiB0aGUgUFRFIEEvRCBiaXRzIG5lZWQgdG8gYmUgc2V0LCBTdmFkZSBleHRl
bnNpb24gaW50ZGljYXRlcyB0aGF0Cj4gPj4gYSByZWxhdGVkIHBhZ2UgZmF1bHQgd2lsbCBiZSBy
YWlzZWQuIEluIGNvbnRyYXN0LCB0aGUgU3ZhZHUgZXh0ZW5zaW9uCj4gPj4gc3VwcG9ydHMgaGFy
ZHdhcmUgdXBkYXRpbmcgb2YgUFRFIEEvRCBiaXRzLiBUaGlzIHNlcmllcyBlbmFibGVzIFN2YWRl
IGFuZAo+ID4+IFN2YWR1IGV4dGVuc2lvbnMgZm9yIGJvdGggaG9zdCBhbmQgZ3Vlc3QgT1MuCj4g
Pj4KPiA+PiBSZWdyYWRpbmcgdGhlIG1haWxpbmcgdGhyZWFkWzFdLCB3ZSBoYXZlIDQgcG9zc2li
bGUgY29tYmluYXRpb25zIG9mCj4gPj4gdGhlc2UgZXh0ZW5zaW9ucyBpbiB0aGUgZGV2aWNlIHRy
ZWUsIHRoZSBkZWZhdWx0IGhhcmR3YXJlIGJlaGF2aW9yIGZvcgo+ID4+IHRoZXNlIHBvc3NpYmls
aXRpZXMgYXJlOgo+ID4+IDEpIE5laXRoZXIgU3ZhZGUgbm9yIFN2YWR1IHByZXNlbnQgaW4gRFQg
PT4gSXQgaXMgdGVjaG5pY2FsbHkKPiA+PiAgICB1bmtub3duIHdoZXRoZXIgdGhlIHBsYXRmb3Jt
IHVzZXMgU3ZhZGUgb3IgU3ZhZHUuIFN1cGVydmlzb3IKPiA+PiAgICBzb2Z0d2FyZSBzaG91bGQg
YmUgcHJlcGFyZWQgdG8gaGFuZGxlIGVpdGhlciBoYXJkd2FyZSB1cGRhdGluZwo+ID4+ICAgIG9m
IHRoZSBQVEUgQS9EIGJpdHMgb3IgcGFnZSBmYXVsdHMgd2hlbiB0aGV5IG5lZWQgdXBkYXRlZC4K
PiA+PiAyKSBPbmx5IFN2YWRlIHByZXNlbnQgaW4gRFQgPT4gU3VwZXJ2aXNvciBtdXN0IGFzc3Vt
ZSBTdmFkZSB0byBiZQo+ID4+ICAgIGFsd2F5cyBlbmFibGVkLgo+ID4+IDMpIE9ubHkgU3ZhZHUg
cHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIG11c3QgYXNzdW1lIFN2YWR1IHRvIGJlCj4gPj4g
ICAgYWx3YXlzIGVuYWJsZWQuCj4gPj4gNCkgQm90aCBTdmFkZSBhbmQgU3ZhZHUgcHJlc2VudCBp
biBEVCA9PiBTdXBlcnZpc29yIG11c3QgYXNzdW1lCj4gPj4gICAgU3ZhZHUgdHVybmVkLW9mZiBh
dCBib290IHRpbWUuIFRvIHVzZSBTdmFkdSwgc3VwZXJ2aXNvciBtdXN0Cj4gPj4gICAgZXhwbGlj
aXRseSBlbmFibGUgaXQgdXNpbmcgdGhlIFNCSSBGV0ZUIGV4dGVuc2lvbi4KPiA+Pgo+ID4+IFRo
ZSBTdmFkZSBleHRlbnNpb24gaXMgbWFuZGF0b3J5IGFuZCB0aGUgU3ZhZHUgZXh0ZW5zaW9uIGlz
IG9wdGlvbmFsIGluCj4gPj4gUlZBMjMgcHJvZmlsZS4gUGxhdGZvcm1zIHdhbnQgdG8gdGFrZSB0
aGUgYWR2YW50YWdlIG9mIFN2YWR1IGNhbiBjaG9vc2UKPiA+PiAzLiBUaG9zZSBhcmUgYXdhcmUg
b2YgdGhlIHByb2ZpbGUgY2FuIGNob29zZSA0LCBhbmQgTGludXggd29uJ3QgZ2V0IHRoZQo+ID4+
IGJlbmVmaXQgb2Ygc3ZhZHUgdW50aWwgdGhlIFNCSSBGV0ZUIGV4dGVuc2lvbiBpcyBhdmFpbGFi
bGUuCj4gPj4KPiA+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgta2VybmVsLzIw
MjQwNTI3LWU5ODQ1YzA2NjE5YmNhNWNkMjg1MDk4Y0BvcmVsL1QvI20yOTY0NGViODhlMjQxZWMy
ODJkZjRjY2Q1MTk5NTE0ZTkxM2IwNmVlCj4gPj4KPiA+PiAtLS0KPiA+PiB2ODoKPiA+PiAtIGZp
eCB0eXBvIGluIFBBVENIMSAoU2FtdWVsKQo+ID4+IC0gdXNlIHRoZSBuZXcgZXh0ZW5zaW9uIHZh
bGlkYXRpbmcgQVBJIGluIFBBVENIMSAoQ2zDqW1lbnQpCj4gPj4gLSB1cGRhdGUgdGhlIGR0Ymlu
ZGluZyBpbiBQQVRDSDIgKFNhbXVlbCwgQ29ub3IpCj4gPj4gLSBhZGQgUEFUQ0g0IHRvIGZpeCBj
b21waWxlIGVycm9yIGluIGdldC1yZWctbGlzdCB0ZXN0Lgo+ID4+Cj4gPj4gdjc6Cj4gPj4gLSBm
aXggYWxpZ25tZW50IGluIFBBVENIMQo+ID4+IC0gdXBkYXRlIHRoZSBkdGJpbmRpbmcgaW4gUEFU
Q0gyIChDb25vciwgSmVzc2ljYSkKPiA+Pgo+ID4+IHY2Ogo+ID4+IC0gcmVmbGVjdCB0aGUgcGxh
dGZvcm0ncyBiZWhhdmlvciBieSByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSgpIGFuZAo+
ID4+ICAgdXBkYXRlIHRoZSB0aGUgYXJjaF9oYXNfaHdfcHRlX3lvdW5nKCkgaW4gUEFUQ0gxIChD
b25vciwgQW5kcmV3KQo+ID4+IC0gdXBkYXRlIHRoZSBkdGJpbmRpbmcgaW4gUEFUQ0gyIChBbGV4
YW5kcmUsIEFuZHJldywgQW51cCwgQ29ub3IpCj4gPj4gLSB1cGRhdGUgdGhlIGhlbnZjZmcgY29u
ZGl0aW9uIGluIFBBVENIMyAoQW5kcmV3KQo+ID4+IC0gY2hlY2sgaWYgU3ZhZGUgaXMgYWxsb3dl
ZCB0byBkaXNhYmxlZCBiYXNlZCBvbiBhcmNoX2hhc19od19wdGVfeW91bmcoKQo+ID4+ICAgaW4g
UEFUQ0gzCj4gPj4KPiA+PiB2NToKPiA+PiAtIHJlbW92ZSBhbGwgQWNrZWQtYnkgYW5kIFJldmll
d2VkLWJ5IChDb25vciwgQW5kcmV3KQo+ID4+IC0gYWRkIFN2YWRlIHN1cHBvcnQKPiA+PiAtIHVw
ZGF0ZSB0aGUgYXJjaF9oYXNfaHdfcHRlX3lvdW5nKCkgaW4gUEFUQ0gxCj4gPj4gLSB1cGRhdGUg
dGhlIGR0YmluZGluZyBpbiBQQVRDSDIgKEFsZXhhbmRyZSwgQW5kcmV3KQo+ID4+IC0gY2hlY2sg
dGhlIGF2YWlsaWJpbGl0eSBvZiBTdmFkdSBmb3IgR3Vlc3QvVk0gYmFzZWQgb24KPiA+PiAgIGFy
Y2hfaGFzX2h3X3B0ZV95b3VuZygpIGluIFBBVENIMwo+ID4+Cj4gPj4gdjQ6Cj4gPj4gLSBmaXgg
MzJiaXQga2VybmVsIGJ1aWxkIGVycm9yIGluIFBBVENIMSAoQ29ub3IpCj4gPj4gLSB1cGRhdGUg
dGhlIHN0YXR1cyBvZiBTdmFkdSBleHRlbnNpb24gdG8gcmF0aWZpZWQgaW4gUEFUQ0gyCj4gPj4g
LSBhZGQgdGhlIFBBVENINCB0byBzdXBvcnJ0IFNCSV9GV0ZUX1BURV9BRF9IV19VUERBVElORyBm
b3IgZ3Vlc3QgT1MKPiA+PiAtIHVwZGF0ZSB0aGUgUEFUQ0gxIGFuZCBQQVRDSDMgdG8gaW50ZWdy
YXRlIHdpdGggRldGVCBleHRlbnNpb24KPiA+PiAtIHJlYmFzZSBQQVRDSDUgb24gdGhlIGxhc3Rl
c3QgZ2V0LXJlZy1saXN0IHRlc3QgKEFuZHJldykKPiA+Pgo+ID4+IHYzOgo+ID4+IC0gZml4IHRo
ZSBjb250cm9sIGJpdCBuYW1lIHRvIEFEVUUgaW4gUEFUQ0gxIGFuZCBQQVRDSDMKPiA+PiAtIHVw
ZGF0ZSBnZXQtcmVnLWxpc3QgaW4gUEFUQ0g0Cj4gPj4KPiA+PiB2MjoKPiA+PiAtIGFkZCBDby1k
ZXZlbG9wZWQtYnk6IGluIFBBVENIMQo+ID4+IC0gdXNlIHJpc2N2X2hhc19leHRlbnNpb25fdW5s
aWtlbHkoKSB0byBydW50aW1lIHBhdGNoIHRoZSBicmFuY2ggaW4gUEFUQ0gxCj4gPj4gLSB1cGRh
dGUgZHQtYmluZGluZwo+ID4+Cj4gPj4gWW9uZy1YdWFuIFdhbmcgKDUpOgo+ID4+ICAgUklTQy1W
OiBBZGQgU3ZhZGUgYW5kIFN2YWR1IEV4dGVuc2lvbnMgU3VwcG9ydAo+ID4+ICAgZHQtYmluZGlu
Z3M6IHJpc2N2OiBBZGQgU3ZhZGUgYW5kIFN2YWR1IEVudHJpZXMKPiA+PiAgIFJJU0MtVjogS1ZN
OiBBZGQgU3ZhZGUgYW5kIFN2YWR1IEV4dGVuc2lvbnMgU3VwcG9ydCBmb3IgR3Vlc3QvVk0KPiA+
PiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogRml4IGNvbXBpbGUgZXJyb3IKPiA+PiAgIEtWTTog
cmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFN2YWRlIGFuZCBTdmFkdSBFeHRlbnNpb24gdG8gZ2V0LXJl
Zy1saXN0Cj4gPj4gICAgIHRlc3QKPiA+Pgo+ID4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9leHRlbnNpb25zLnlhbWwgfCAyOCArKysrKysrKysrKysrKysrKysrCj4gPj4gIGFyY2gv
cmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiA+PiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ID4+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAgICAgICAgICAgfCAgMiArKwo+ID4+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAgICAgICAgICAgfCAxMyArKysr
KysrKy0KPiA+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAgICAg
IHwgIDIgKysKPiA+PiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAg
ICAgIHwgMTIgKysrKysrKysKPiA+PiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDQgKysrCj4gPj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMg
ICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysrKysKPiA+PiAgLi4uL3NlbGZ0ZXN0cy9rdm0v
cmlzY3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgMTYgKysrKysrKystLS0KPiA+PiAgMTAgZmls
ZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IC0t
Cj4gPj4gMi4xNy4xCj4gPj4KPiA+Pgo+ID4KPiA+IExldCBtZSBrbm93IGlmIHRoaXMgc2VyaWVz
IGNhbiBiZSB0YWtlbiB0aHJvdWdoIHRoZSBLVk0gUklTQy1WIHRyZWUuCj4gPiBJIGNhbiBwcm92
aWRlIHlvdSB3aXRoIGEgc2hhcmVkIHRhZyBhcyB3ZWxsLgo+Cj4gSSB0aGluayB0aGUgcGF0Y2h3
b3JrIGJvdCBnb3QgY29uZnVzZWQgYnkgcGF0Y2ggNCBnb2luZyB0byBmaXhlcz8gIEl0Cj4gc2F5
cyB0aGlzIHdhcyBtZXJnZWQuCj4KPiBBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBy
aXZvc2luYy5jb20+Cj4KPiBpZiB5b3Ugc3RpbGwgd2FudCB0byB0YWtlIGl0LCBvdGhlcndpc2Ug
anVzdCBMTUsgYW5kIEknbGwgcGljayBpdCB1cC4KPgoKSSBhbHJlYWR5IHNlbnQgS1ZNIFJJU0Mt
ViBQUiBmb3IgNi4xMiB3aGljaCBoYXMgYmVlbiBtZXJnZWQKYXMgd2VsbC4gUGxlYXNlIHRha2Ug
dGhpcyBzZXJpZXMgKGV4Y2VwdCBQQVRDSDQpIHRocm91Z2ggdGhlClJJU0MtViB0cmVlLgoKVGhh
bmtzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
