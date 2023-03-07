Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0F2C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phIty/yFT6f/SAQSahB16I9dH4a5A9jQPTy/7XNph5g=; b=4tw3YoIYrz2UtS
	FOKWzFXHzo4TCrJpHmlgoWwUyOqHjn6ysO8xNHzVZwgZL5PBSAa2EW4vlluO0zgrOtLekqAMqVen4
	dWkJh0Hutwqpf0hfZel8M8UD4WnEe7RRVdBRNOkT8ZFI7hJMBzERzc7Rse3kVLgQ8dePNDGWp69MO
	kyyj92BJfPLABpAD9bO8LXoKL25z/+m2ZrXZOd6puFdzukmhSFdmRItmGcc7npzv+1357oTImqqz4
	GrijiOgKuvWzfIvfFV/s+hvolm+9DDXulaYJN0QGSotk+IVOEi60r3J1vwyF1Kwd+omzWDk4P3qQM
	VFBBHUqXsOnTmRv+qACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXdh-000UmH-GQ; Tue, 07 Mar 2023 13:46:01 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXUj-000RFQ-EF
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 13:36:47 +0000
Received: by mail-wr1-x42b.google.com with SMTP id g3so12142147wri.6
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 05:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678196202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psTRywtzl68njLyoyMeFGZqYTnFyd3ofmQ3diHYsd3k=;
        b=dZNhqcjc+Tyw7rHD240aQ69pbdZ7dN1ncj4vPHqRrgjYBOen6TwvDeBWaSH5Igte7X
         7C/RYeDGxzzhpm8yfFsLR6gfLaVN+W6Q586eFpjRNWVHXHPcbOyeRmr6/9CJtjfyA7gb
         blGDXSBcWZmaSfemM7JL8lVRkOncrTP4mMca73KdFqvxQ/+NgtuoyBbb3ekzZhEUb0sB
         yxXDHoKwn4H2IQqNNWd72/mAghCto8ubanep2HgZFn3Qh9t3LO85lzAWyE9ANBxhzH+t
         SRz907v0NM1lmUZ9y6ZGhVF05ij0iSlwSE+eYYjObIQyJOb+OkigEjOM974VBBMKRq4O
         ADOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psTRywtzl68njLyoyMeFGZqYTnFyd3ofmQ3diHYsd3k=;
        b=fTiYaVL/n2a/c2oV5tuKpcJWsH+cofuImjipap35fLGHYuLHM/rxaip++ZaM+XHTfV
         2MCYO8vLcukBSDD6YxXNaBTKthyw56pVRMrvjpS2DYje9wFRqZrHlFA7xyGyOfPb4OQ8
         VskSWVCqCIQB16NkOBCvhkKO5MztA19QCaPdu5LZkClSiiz+/nhLf75zdXj5keur7T00
         QMB5WiFZkk5ctZHHcb8BOhk6G5HC0pKG39ecB6vVWSgDodPpSX47+nXUDd4zIaP2I+HB
         fflaZ6uTMbX7pqRgiD5QCRLJwcDhZvv2VV87Z+sGEwdQO9otd4jKWMZlPVxN/O8EeeVE
         melA==
X-Gm-Message-State: AO0yUKUpIFTS9XQjNv4ojol35p4olFPwn5SGEqCckDJmjSYbQBK9AGs+
	ncBATaVABw1uyUybHSe6VrU/NpmsCxiHapU5l6ydMw==
X-Google-Smtp-Source: AK7set/BsN6tbDw8kZ/LkJFYQlT9RdjOo7dvo8ti9Techq1p7qOOko8EcxaT1uAy5MUHI2bAqFOUDwH2UlDF1pkJZpw=
X-Received: by 2002:a5d:534e:0:b0:2c9:e34e:7d2 with SMTP id
 t14-20020a5d534e000000b002c9e34e07d2mr2655948wrv.11.1678196202706; Tue, 07
 Mar 2023 05:36:42 -0800 (PST)
MIME-Version: 1.0
References: <20230301082552.274331-1-alexghiti@rivosinc.com>
 <CAK9=C2XAOKbyrbOnDP1GzW1VyO-f-V-oEVcp+PhGHeHKFh4C6A@mail.gmail.com>
 <CAHVXubj9sCEuANsVe0N7YRMg8OPx_eALZfy0vERKU9P6QUDM0Q@mail.gmail.com> <CAK9=C2XDkgZuaxO1fOWCxyCsGgiD=B_O4DmuAPwEhC65Mck9eA@mail.gmail.com>
In-Reply-To: <CAK9=C2XDkgZuaxO1fOWCxyCsGgiD=B_O4DmuAPwEhC65Mck9eA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 7 Mar 2023 14:36:31 +0100
Message-ID: <CAHVXubg6dgr9dM1-mR+xh6D+5cmistWmo2dJQaZavcWGcCshag@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_053645_750868_99D9ADCA 
X-CRM114-Status: GOOD (  24.87  )
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

T24gVHVlLCBNYXIgNywgMjAyMyBhdCAyOjE54oCvUE0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gSGkgQWxleCwKPgo+IE9uIFR1ZSwgTWFyIDcsIDIwMjMg
YXQgMTI6MjLigK9BTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdy
b3RlOgo+ID4KPiA+IEhpIEFudXAsCj4gPgo+ID4gT24gTW9uLCBNYXIgNiwgMjAyMyBhdCA1OjMz
4oCvUE0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBPbiBXZWQsIE1hciAxLCAyMDIzIGF0IDE6NTbigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFs
ZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBwYXRjaHNl
dCBpbnRlbmRzIHRvIGltcHJvdmUgdGxiIHV0aWxpemF0aW9uIGJ5IHVzaW5nIGh1Z2VwYWdlcyBm
b3IKPiA+ID4gPiB0aGUgbGluZWFyIG1hcHBpbmcuCj4gPiA+ID4KPiA+ID4gPiBiYXNlLWNvbW1p
dC10YWc6IHY2LjItcmM3Cj4gPiA+ID4KPiA+ID4gPiB2NjoKPiA+ID4gPiAtIHF1aWV0IExMVk0g
d2FybmluZyBieSBjYXN0aW5nIHBoeXNfcmFtX2Jhc2UgaW50byBhbiB1bnNpZ25lZCBsb25nCj4g
PiA+ID4KPiA+ID4gPiB2NToKPiA+ID4gPiAtIEZpeCBub21tdSBidWlsZHMgYnkgZ2V0dGluZyBy
aWQgb2YgcmlzY3ZfcGZuX2Jhc2UgaW4gcGF0Y2ggMSwgdGhhbmtzCj4gPiA+ID4gICBDb25vcgo+
ID4gPiA+IC0gQWRkIFJCIGZyb20gQW5kcmV3Cj4gPiA+ID4KPiA+ID4gPiB2NDoKPiA+ID4gPiAt
IFJlYmFzZSBvbiB0b3Agb2YgdjYuMi1yYzMsIGFzIG5vdGVkIGJ5IENvbm9yCj4gPiA+ID4gLSBB
ZGQgQWNrZWQtYnkgUm9iCj4gPiA+ID4KPiA+ID4gPiB2MzoKPiA+ID4gPiAtIENoYW5nZSB0aGUg
Y29tbWVudCBhYm91dCBpbml0cmRfc3RhcnQgVkEgY29udmVyc2lvbiBzbyB0aGF0IGl0IGZpdHMK
PiA+ID4gPiAgIEFSTTY0IGFuZCBSSVNDVjY0IChhbmQgb3RoZXJzIGluIHRoZSBmdXR1cmUgaWYg
bmVlZGVkKSwgYXMgc3VnZ2VzdGVkCj4gPiA+ID4gICBieSBSb2IKPiA+ID4gPgo+ID4gPiA+IHYy
Ogo+ID4gPiA+IC0gQWRkIGEgY29tbWVudCBvbiB3aHkgUklTQ1Y2NCBkb2VzIG5vdCBuZWVkIHRv
IHNldCBpbml0cmRfc3RhcnQvZW5kIHRoYXQKPiA+ID4gPiAgIGVhcmx5IGluIHRoZSBib290IHBy
b2Nlc3MsIGFzIGFza2VkIGJ5IFJvYgo+ID4gPiA+Cj4gPiA+ID4gQWxleGFuZHJlIEdoaXRpICgy
KToKPiA+ID4gPiAgIHJpc2N2OiBHZXQgcmlkIG9mIHJpc2N2X3Bmbl9iYXNlIHZhcmlhYmxlCj4g
PiA+ID4gICByaXNjdjogVXNlIFBVRC9QNEQvUEdEIHBhZ2VzIGZvciB0aGUgbGluZWFyIG1hcHBp
bmcKPiA+ID4KPiA+ID4gSSB0cmllZCB0aGlzIHNlcmllcyBidXQgaXQgaXMgZ2V0dGluZyBzdHVj
ayBhZnRlciByZWFjaGluZyB1c2VyIHNwYWNlLgo+ID4gPgo+ID4gPiBEb2VzIHRoaXMgc2VyaWVz
IHJlcXVpcmUgc29tZSBvdGhlciBkZXBlbmRlbnQgcGF0Y2hlcyA/Cj4gPgo+ID4gTm8gaXQgc2hv
dWxkIG5vdC4gTGV0IG1lIHRha2UgYSBsb29rOiB3aGF0J3MgeW91ciBjb25maWcgYW5kIHRoZSBi
YXNlIGNvbW1pdD8KPgo+IFBsZWFzZSB0cnkgdGhlIGFsZXhnaGl0aV90ZXN0IGJyYW5jaCBhdDoK
PiBodHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9saW51eC5naXQKPgo+IENvbXBpbGUgdGhlIGtl
cm5lbCB3aXRoIGRlZmNvbmZpZyBhbmQgbGF1bmNoIFFFTVUgYXMgZm9sbG93czoKPiBxZW11LXN5
c3RlbS1yaXNjdjY0IC1NIHZpcnQgLW0gMUcgLW5vZ3JhcGhpYyAtYmlvcwo+IG9wZW5zYmkvYnVp
bGQvcGxhdGZvcm0vZ2VuZXJpYy9maXJtd2FyZS9md19qdW1wLmJpbiAta2VybmVsCj4gLi9idWls
ZC1yaXNjdjY0L2FyY2gvcmlzY3YvYm9vdC9JbWFnZSAtYXBwZW5kICJyb290PS9kZXYvcmFtIHJ3
Cj4gY29uc29sZT10dHlTMCBlYXJseWNvbiIgLWluaXRyZCAuL3Jvb3Rmc19yaXNjdjY0LmltZwo+
Cj4gSW4gdGhlIGFib3ZlIGNvbW1hbmQsIHJvb3Rmc19yaXNjdjY0LmltZyBpcyBhIGJ1c3lib3gg
YmFzZWQgcm9vdGZzLgoKT2sgSSBjYW4gcmVwcm9kdWNlIHRoZSBwcm9ibGVtLiBJJ2xsIGRlYnVn
IHRoYXQgYSBiaXQgZnVydGhlciBidXQKaW5jcmVhc2luZyBtZW1vcnkgYWxsb3dzIGJvb3Rpbmcg
dG8gdXNlcnNwYWNlLgoKPgo+IFJlZ2FyZHMsCj4gQW51cAo+Cj4gPgo+ID4gPgo+ID4gPiBSZWdh
cmRzLAo+ID4gPiBBbnVwCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wYWdlLmggfCAxOSArKysrKysrKysrKysrKysrKy0tCj4gPiA+ID4gIGFyY2gvcmlzY3Yv
bW0vaW5pdC5jICAgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+ID4g
PiA+ICBhcmNoL3Jpc2N2L21tL3BoeXNhZGRyLmMgICAgICB8IDE2ICsrKysrKysrKysrKysrKysK
PiA+ID4gPiAgZHJpdmVycy9vZi9mZHQuYyAgICAgICAgICAgICAgfCAxMSArKysrKystLS0tLQo+
ID4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygt
KQo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+ID4gPiAyLjM3LjIKPiA+ID4gPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
