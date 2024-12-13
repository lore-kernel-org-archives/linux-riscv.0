Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338B2E7717D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9PzKvSLjyrpl39nXZVteoYjb8bGRasaInOqjRrwFoM=; b=k9wg5aieMhYB5o
	M4iBGChmx0SPkQAnMo4j8TsxrXosEfHPNY8JjsTPzMyc1ZKoeJLfHetvKUPyqjgQRkcf0qBkRtCmc
	pIj/0iDqDoSzKDDkAQ2pcNlJhQComQdYiY9sjo2gXwg+pFj1xr8oU7Gkuy4sIV5d1L4zbtpX3ZKmd
	AfMHu+jfaqq51H5f/OBt2edXpg3QQS8cSUkh+xvuymId4L3mmjvrLkFUqpwJUJAQe3WNOd8bfnWI7
	0eqWRsNpySk4x3xAEO1T5DSTOORhfCtMt7LOCs8eqPGi6OBnkCH1sR8POA0/12MOFbsxr80dRpUcN
	3TpJCdrdCay50NFdBfmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM66z-00000003u84-1Szr;
	Fri, 13 Dec 2024 13:53:45 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM65Q-00000003tej-1y7s
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 13:52:10 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d3ecae02beso2319985a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Dec 2024 05:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734097926; x=1734702726; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFxRqoUDcxRTLhzcB0bq/QXLdWIm6pyY40R4SG8HtGg=;
        b=3IMIfZes0NuuGW/tW+mPaKz16g/yooNKlXv2jw/qg4jJNMNexbwGuagtZyNiwiKbJR
         nYCVxtC2788Qm2q2ez3ZZZFL9zQUQG4B4xS9GbSU9TCSejTEpeWrEQXQxNsEE+/a96tJ
         bgqdbBjtjhm4c60f+q4Gu6py/briJxQdu/JmmYn/ZyIubjD/pOuvVeAOUfTosqvKdg2/
         wkwgLOSStet0McoT8PbziUs/3dH1HPEFk/j4PPXtDCCQRzfdc3WwL4SdV6bo0iJR474x
         q5YU4pB/7eVm5gVZj5ytV8NW3M10Xe6elZREzu2/KKqvaUx7qQEQvN/kNimdxsUbrN+d
         hDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734097926; x=1734702726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFxRqoUDcxRTLhzcB0bq/QXLdWIm6pyY40R4SG8HtGg=;
        b=oVRDT9WM1d26ftiv5oIbUTk3xAEpXxZGyS3fNqh9kRQxBwpavg56a6Z5eTFvRkY345
         th8Zs9M6SDhVwiFT75JdgIj5rJ2w7GdlPyohaxRqdWN4I/OYplarNGIni6qJ8wuT6P+O
         zcXf+7n8UbsJkB5UKHaIOMyF7GOt5CYtaFN/D0mJdH7XLhw+ype8g0efVGrmzZ/BE0HP
         C0c4LFJAp/xesIxmRb9XwUpBdZL3RVdEQy3h3JT3smh+kZAwG+PxbOTi9ALJrL8mjA+a
         MWUYd9L7GW3njnCNAXNClfvQD9P6kf/hmng3LRtBMkrGYoqWBHtcfoilk7ffSK23uC68
         uHTg==
X-Forwarded-Encrypted: i=1; AJvYcCVRtv5SR86nhXwZRPFzj/VR9ZPKBDRloviJwcbaGdGJfsWxGJph00Y6umA1gx9V3L12OQgJv2wNQRqT5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw476TmkK7YauRuZNd5zx6pIuL5IgpjSmm+DUZj6pVKJ7zkuGQm
	hMr/44S4lkfOkUZq/GcpdfNCHtrpPVfcF0wpK9WtkoMPwcob4pxljTob/hME/Ox0iUYcPluPALH
	qGPVX9Huo15+cqaXDJwd+7CXGptBdqMa4F3ZRWSKUEwU97CH7
X-Gm-Gg: ASbGncsefcEVKlfXvzuxVjE1c5ViBOJzXlzft+5hAiqxKlyhwAJi1jvtO5684vmoThw
	9KU65H68Xn0RyTWjBVL6sYXWb7/y7l5ML
X-Google-Smtp-Source: AGHT+IHWrpVtcx/k1VJWXnEECzEmYBxI/vWGNlZpsxqk0hQ9aDH2QOA2X4nisy8++11duJ4WnH/4HhQyJaIOmtD6qKg=
X-Received: by 2002:a05:6402:528f:b0:5d2:7456:9812 with SMTP id
 4fb4d7f45d1cf-5d63c39fba0mr2316225a12.22.1734097926046; Fri, 13 Dec 2024
 05:52:06 -0800 (PST)
MIME-Version: 1.0
References: <20241213115704.353665-1-alexghiti@rivosinc.com> <87v7vn917f.ffs@tglx>
In-Reply-To: <87v7vn917f.ffs@tglx>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 13 Dec 2024 14:51:55 +0100
Message-ID: <CAHVXubiNMp9chdUdvYjiQC2LMhNMMaGEiLMWZ-4RSV54jakP3g@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: Fix PCI warning by enabling PCI_MSI_ARCH_FALLBACKS
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_055208_773196_706C05D4 
X-CRM114-Status: GOOD (  21.27  )
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
Cc: Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgVGhvbWFzLAoKT24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgMjoxMuKAr1BNIFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIEZyaSwgRGVjIDEzIDIwMjQg
YXQgMTI6NTcsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IFdoZW4gdGhlIGludGVycnVwdCBj
b250cm9sbGVyIGlzIG5vdCB1c2luZyB0aGUgSU1TSUMgYW5kIEFDUEkgaXMgZW5hYmxlZCwKPiA+
IHRoZSBmb2xsb3dpbmcgd2FybmluZyBhcHBlYXJzOgo+ID4KPiA+IFsgICAgMC44NjY0MDFdIFdB
Uk5JTkc6IENQVTogMSBQSUQ6IDEgYXQgZHJpdmVycy9wY2kvbXNpL21zaS5oOjEyMSBwY2lfbXNp
X3NldHVwX21zaV9pcnFzKzB4MmMvMHgzMgo+ID4gWyAgICAwLjg2NzA3MV0gTW9kdWxlcyBsaW5r
ZWQgaW46Cj4gPiBbICAgIDAuODY3Mzg5XSBDUFU6IDEgVUlEOiAwIFBJRDogMSBDb21tOiBzd2Fw
cGVyLzAgTm90IHRhaW50ZWQgNi4xMy4wLXJjMi0wMDAwMS1nNzk1NTgyY2U3ZTI0LWRpcnR5ICM0
NAo+ID4gWyAgICAwLjg2NzUzOF0gSGFyZHdhcmUgbmFtZTogUUVNVSBRRU1VIFZpcnR1YWwgTWFj
aGluZSwgQklPUwo+ID4gWyAgICAwLjg2NzY3Ml0gZXBjIDogcGNpX21zaV9zZXR1cF9tc2lfaXJx
cysweDJjLzB4MzIKPiA+IFsgICAgMC44Njc3MzhdICByYSA6IF9fcGNpX2VuYWJsZV9tc2l4X3Jh
bmdlKzB4MzBjLzB4NTk2Cj4KPiBSZW1vdmluZyBhIHRvbiBvZiBiYWRseSBmb3JtYXR0ZWQgc3Rh
Y2sgdHJhY2U6Cj4KPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9j
ZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI2JhY2t0cmFjZXMtaW4tY29tbWl0LW1lc3NhZ2Vz
CgpUaGFua3MgZm9yIHRoZSBwb2ludGVyLgoKPgo+ID4KPiA+IFNvIGVuYWJsZSBQQ0lfTVNJX0FS
Q0hfRkFMTEJBQ0tTIHRvIGdldCByaWQgb2YgdGhpcy4KPgo+IE5vLiBQQ0lfTVNJX0FSQ0hfRkFM
TEJBQ0tTIGlzIHJlYWxseSBvbmx5IG1lYW50IGZvciBhcmNoaXRlY3R1cmVzIHdoaWNoCj4gaW1w
bGVtZW50IHRoZSBsZWdhY3kgZmFsbGJhY2tzIGFuZCBub3QgdG8gcGFwZXIgb3ZlciB0aGUgdW5k
ZXJseWluZwo+IGxvZ2ljIGJ1ZyBpbiB0aGUgcGNpL21zaSBjb2RlLiBPZiBjb3Vyc2UgdGhlIGxv
b25nc29uIGZvbGtzIHJhbiBpbnRvIHRoZQo+IHNhbWUgcHJvYmxlbSB0d28geWVhcnMgYWdvIGFu
ZCB3ZW50IGZvciB0aGUgc2xvcHB5IGZpeCB3aXRob3V0IHRhbGtpbmcKPiB0byBhbnlvbmUuLi4K
Pgo+IFRoYW5rcyBmb3IgYnJpbmdpbmcgaXQgdXAgaW5zdGVhZCBvZiBzaWxlbnRseSBzbGFwcGlu
ZyBpdCBpbnRvIHRoZSBSSVNDVgo+IHRyZWUgIQo+Cj4gVGhlIHVuY29tcGlsZWQgcGF0Y2ggYmVs
b3cgc2hvdWxkIGZpeCB0aGlzIGZvciByZWFsLgoKSXQgZG9lcywgd2hlbiBhcHBsaWVkIHRoZSB3
YXJuaW5nIGRpc2FwcGVhcnMgKG9uIHJpc2N2IGF0IGxlYXN0KS4gWW91IGNhbiBhZGQ6CgpUZXN0
ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gIyByaXNjdgoK
VGhhbmtzIGZvciB5b3VyIHF1aWNrIGFuc3dlciEKCkFsZXgKCj4KPiBUaGFua3MsCj4KPiAgICAg
ICAgIHRnbHgKPiAtLS0KPiAtLS0gYS9hcmNoL2xvb25nYXJjaC9LY29uZmlnCj4gKysrIGIvYXJj
aC9sb29uZ2FyY2gvS2NvbmZpZwo+IEBAIC0xODUsNyArMTg1LDYgQEAgY29uZmlnIExPT05HQVJD
SAo+ICAgICAgICAgc2VsZWN0IFBDSV9ET01BSU5TX0dFTkVSSUMKPiAgICAgICAgIHNlbGVjdCBQ
Q0lfRUNBTSBpZiBBQ1BJCj4gICAgICAgICBzZWxlY3QgUENJX0xPT05HU09OCj4gLSAgICAgICBz
ZWxlY3QgUENJX01TSV9BUkNIX0ZBTExCQUNLUwo+ICAgICAgICAgc2VsZWN0IFBDSV9RVUlSS1MK
PiAgICAgICAgIHNlbGVjdCBQRVJGX1VTRV9WTUFMTE9DCj4gICAgICAgICBzZWxlY3QgUlRDX0xJ
Qgo+IC0tLSBhL2RyaXZlcnMvcGNpL21zaS9pcnFkb21haW4uYwo+ICsrKyBiL2RyaXZlcnMvcGNp
L21zaS9pcnFkb21haW4uYwo+IEBAIC0zNTAsOCArMzUwLDExIEBAIGJvb2wgcGNpX21zaV9kb21h
aW5fc3VwcG9ydHMoc3RydWN0IHBjaV8KPgo+ICAgICAgICAgZG9tYWluID0gZGV2X2dldF9tc2lf
ZG9tYWluKCZwZGV2LT5kZXYpOwo+Cj4gLSAgICAgICBpZiAoIWRvbWFpbiB8fCAhaXJxX2RvbWFp
bl9pc19oaWVyYXJjaHkoZG9tYWluKSkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIG1vZGUgPT0g
QUxMT1dfTEVHQUNZOwo+ICsgICAgICAgaWYgKCFkb21haW4gfHwgIWlycV9kb21haW5faXNfaGll
cmFyY2h5KGRvbWFpbikpIHsKPiArICAgICAgICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklH
X1BDSV9NU0lfQVJDSF9GQUxMQkFDS1MpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biBtb2RlID09IEFMTE9XX0xFR0FDWTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+
ICsgICAgICAgfQo+Cj4gICAgICAgICBpZiAoIWlycV9kb21haW5faXNfbXNpX3BhcmVudChkb21h
aW4pKSB7Cj4gICAgICAgICAgICAgICAgIC8qCj4gLS0tIGEvZHJpdmVycy9wY2kvbXNpL21zaS5j
Cj4gKysrIGIvZHJpdmVycy9wY2kvbXNpL21zaS5jCj4gQEAgLTQ0Miw2ICs0NDIsMTAgQEAgaW50
IF9fcGNpX2VuYWJsZV9tc2lfcmFuZ2Uoc3RydWN0IHBjaV9kZQo+ICAgICAgICAgaWYgKG52ZWMg
PiBtYXh2ZWMpCj4gICAgICAgICAgICAgICAgIG52ZWMgPSBtYXh2ZWM7Cj4KPiArICAgICAgIC8q
IFRlc3QgZm9yIHRoZSBhdmFpbGFiaWxpdHkgb2YgTVNJIHN1cHBvcnQgKi8KPiArICAgICAgIGlm
ICghcGNpX21zaV9kb21haW5fc3VwcG9ydHMoZGV2LCAwLCBBTExPV19MRUdBQ1kpKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gLUVOT1RTVVBQOwo+ICsKPiAgICAgICAgIHJjID0gcGNpX3NldHVw
X21zaV9jb250ZXh0KGRldik7Cj4gICAgICAgICBpZiAocmMpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiByYzsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
