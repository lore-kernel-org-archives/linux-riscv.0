Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC0FC3ABBF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 11:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Liom7wjwzHWYgL0bhCMx6G+DS/rvFnmMjY4HPqA4pmo=; b=IkthTU3ndQFoOQ
	CRyVfbRANHiyI6BSH4Pv+5MWhZVJeNIPQxxX8wBGzAokqMT6lgFRpS0jIO0M9egFJT+8xzYtmHwfj
	8aT8LGWpghT8tHUI/CEvFZTuF6jWiFtsvMm6lNepwZIcDJsKQGCjfY5GattthYYCLryAiDxKgDzQj
	qOobtIY3Rdz5z2AyaPF3zznTGSDFJ2tqvlfSm/5Eq0BEG2nd0fKlH1THbNylSP8eB5KojRDNpHJjh
	srbF2zHhhsCxGChCtffFMb8Vq17NFc2TJ/n8OgHbi2xZOiwvsGUq8niA6WdKZgCIvmA6tN9S5oYLe
	HRRiad60/aL7hWIg8efQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdC2-0000000FGN6-1QeB;
	Wed, 07 May 2025 11:44:06 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdBz-0000000FGLw-3x3J
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 11:44:05 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3d8020ba858so38943515ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 May 2025 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746618243; x=1747223043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVz2E+K/uMAryK5WXZfBalhzFkygNbdnQ6nqZ/JT97Y=;
        b=xFR+kqwyyROyXHmEGXLHIGMiKSDbOlgvYYMwUrLKDAueIiX33qPZGhTaGBB/XgyL5E
         3o4P78HT5WsnOWU95Vp8YaGVbPjm6B37qhRgkgpjGnJJBmgkdSbYUA1Rps4BR7bQdjCn
         DIZ03qMARN0KmREGVwVBJ74zYsecIl+yyCc/FJQorPfEqEqCB5hCZXAdNRNzytlVdoqA
         3kPCVnEVdQPOpYLsL59RL71uyhv+Te/xr5gF7sNc9YxHGymc9uWFI5HwRErEo4QSK+TX
         aZeoOWcI2wnT6TtpPnRGOYmrzlQPdVut2LcEDdl32scQ0lOtcpO1PCuoetkcW4YwoS4+
         n1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746618243; x=1747223043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVz2E+K/uMAryK5WXZfBalhzFkygNbdnQ6nqZ/JT97Y=;
        b=QbpuqzP8ihb+la1iB/+h/Rnl25sJMJJ3WGZnr23/JVXxjsPK9jo/ZRxPBGMtfpG2gd
         WQhQ9v3AE/UUDa6a3jG8D5Dc2+4FX3cgfFObGxBKymqU0Hk/W+tmSZqdYnm+3mfddjIO
         thcFccwrfbHRR2Xggtkd66U9e0JSPevueHnyt6WmhxWaD0PkEPMDbCzqlLZMLr+D+GW+
         2YIvo0LzhMzWPXapbbpgU7Hj1G8+PISKyRs5KAum1NyNeFcAcXKvg+tnyvaFqRdmlMjD
         MuQxKUoe9hTM3WdXFD68DTKmtXAOaMqLo1pH44dXXdj03gnuTmXFDpJ+7Hu+3HFihaan
         8llQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOLjzjEl9SgDiW9CesaYJtWr2hvMhMwYD9EUh/E2WXuI/ulvafRrnWIvbSiy3ddmAgWgdi+zmNimPDuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLEj+jXeP5HRMq/6lQfyB8aYirk/b48oYi/rO+Mni74Vrg3r2W
	sD5YXeYa+4ljcOQyDKObyIrVIIA6ZK0AnYxbXu9EWE8vnfCE+16PS2nZL9ZL3LB5vQydG2f3qH8
	8TelseiG1e5k2DC14cXjmgKwWsKSLbXk6hm79bQ==
X-Gm-Gg: ASbGncvD+JRRWa1T7GmnsAbdGXI0gZoFV3VgHUjFSUeAAnlZQE5UW45ZZMZ3OqDJTHe
	+J5oseSWz3lSStG6FMfO/hZwW5oZwokXJ/szC1IbsUNuD35pvlwA2bNYzxi5RhfUUWFnrj5HYBO
	W0wdME7YAFUMExMfRfxxocwQlYeDwze15fRA==
X-Google-Smtp-Source: AGHT+IEqTEU3gW24Jmigd2cIa8Pl0Ves+lUOw1f5tu/7B6fJK/PzbflFbxkax13tPvkDxDTPwZvRy4srBUyjnSLHpH0=
X-Received: by 2002:a05:6e02:1529:b0:3d8:21ae:d9c with SMTP id
 e9e14a558f8ab-3da738e9934mr32539925ab.5.1746618242847; Wed, 07 May 2025
 04:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com> <20250403112522.1566629-4-rkrcmar@ventanamicro.com>
In-Reply-To: <20250403112522.1566629-4-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 May 2025 17:13:51 +0530
X-Gm-Features: ATxdqUETEm-yQn1qrwlBDD0f3dy7uLqyAaalj3uycXV7-PAmSrqpx552FKWRajk
Message-ID: <CAAhSdy0XBTW1FUuUwSBanspDwpHMRbBL-8oSiRR1R=5SgF1+hw@mail.gmail.com>
Subject: Re: [PATCH 1/5] KVM: RISC-V: refactor vector state reset
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_044404_175863_8A51B901 
X-CRM114-Status: GOOD (  19.06  )
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

T24gVGh1LCBBcHIgMywgMjAyNSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gRG8gbm90IGRlcGVuZCBvbiB0aGUgcmVzZXQg
c3RydWN0dXJlcy4KPgo+IHZlY3Rvci5kYXRhcCBpcyBhIGtlcm5lbCBtZW1vcnkgcG9pbnRlciB0
aGF0IG5lZWRzIHRvIGJlIHByZXNlcnZlZCBhcyBpdAo+IGlzIG5vdCBhIHBhcnQgb2YgdGhlIGd1
ZXN0IHZlY3RvciBkYXRhLgo+Cj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3Jj
bWFyQHZlbnRhbmFtaWNyby5jb20+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4xNgoK
VGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3Zl
Y3Rvci5oIHwgIDYgKystLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICAg
ICAgICAgfCAgNSArKysrLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jICAgICAgICAg
ICAgIHwgMTMgKysrKysrKy0tLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX3ZjcHVfdmVjdG9yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3Zl
Y3Rvci5oCj4gaW5kZXggMjdmNWJjY2RkOGIwLi41N2E3OThhNGNiMGQgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV92ZWN0b3IuaAo+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfdmVjdG9yLmgKPiBAQCAtMzMsOCArMzMsNyBAQCB2b2lk
IGt2bV9yaXNjdl92Y3B1X2d1ZXN0X3ZlY3Rvcl9yZXN0b3JlKHN0cnVjdCBrdm1fY3B1X2NvbnRl
eHQgKmNudHgsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nICppc2EpOwo+ICB2b2lkIGt2bV9yaXNjdl92Y3B1X2hvc3RfdmVjdG9yX3NhdmUo
c3RydWN0IGt2bV9jcHVfY29udGV4dCAqY250eCk7Cj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfaG9z
dF92ZWN0b3JfcmVzdG9yZShzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpjbnR4KTsKPiAtaW50IGt2
bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9jcHVf
Y29udGV4dCAqY250eCk7Cj4gK2ludCBrdm1fcmlzY3ZfdmNwdV9hbGxvY192ZWN0b3JfY29udGV4
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICB2b2lkIGt2bV9yaXNjdl92Y3B1X2ZyZWVfdmVj
dG9yX2NvbnRleHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiAgI2Vsc2UKPgo+IEBAIC02Miw4
ICs2MSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fcmlzY3ZfdmNwdV9ob3N0X3ZlY3Rvcl9y
ZXN0b3JlKHN0cnVjdCBrdm1fY3B1X2NvbnRleHQgKmNuCj4gIHsKPiAgfQo+Cj4gLXN0YXRpYyBp
bmxpbmUgaW50IGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpjbnR4KQo+ICtzdGF0aWMgaW5saW5l
IGludCBrdm1fcmlzY3ZfdmNwdV9hbGxvY192ZWN0b3JfY29udGV4dChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCj4gIHsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDYwZDY4NGM3
NmM1OC4uMmZiNzUyODhlY2ZlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC01Nyw2ICs1Nyw3IEBAIHN0YXRpYyB2
b2lkIGt2bV9yaXNjdl9yZXNldF92Y3B1KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAg
IHN0cnVjdCBrdm1fdmNwdV9jc3IgKnJlc2V0X2NzciA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X3Jlc2V0
X2NzcjsKPiAgICAgICAgIHN0cnVjdCBrdm1fY3B1X2NvbnRleHQgKmNudHggPSAmdmNwdS0+YXJj
aC5ndWVzdF9jb250ZXh0Owo+ICAgICAgICAgc3RydWN0IGt2bV9jcHVfY29udGV4dCAqcmVzZXRf
Y250eCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X3Jlc2V0X2NvbnRleHQ7Cj4gKyAgICAgICB2b2lkICp2
ZWN0b3JfZGF0YXAgPSBjbnR4LT52ZWN0b3IuZGF0YXA7Cj4gICAgICAgICBib29sIGxvYWRlZDsK
Pgo+ICAgICAgICAgLyoqCj4gQEAgLTc5LDYgKzgwLDggQEAgc3RhdGljIHZvaWQga3ZtX3Jpc2N2
X3Jlc2V0X3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+Cj4gICAgICAgICBrdm1fcmlzY3Zf
dmNwdV9mcF9yZXNldCh2Y3B1KTsKPgo+ICsgICAgICAgLyogUmVzdG9yZSBkYXRhcCBhcyBpdCdz
IG5vdCBhIHBhcnQgb2YgdGhlIGd1ZXN0IGNvbnRleHQuICovCj4gKyAgICAgICBjbnR4LT52ZWN0
b3IuZGF0YXAgPSB2ZWN0b3JfZGF0YXA7Cj4gICAgICAgICBrdm1fcmlzY3ZfdmNwdV92ZWN0b3Jf
cmVzZXQodmNwdSk7Cj4KPiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3RpbWVyX3Jlc2V0KHZjcHUp
Owo+IEBAIC0xNDMsNyArMTQ2LDcgQEAgaW50IGt2bV9hcmNoX3ZjcHVfY3JlYXRlKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIGNudHgtPmhzdGF0dXMgfD0gSFNUQVRVU19TUFY7Cj4g
ICAgICAgICBzcGluX3VubG9jaygmdmNwdS0+YXJjaC5yZXNldF9jbnR4X2xvY2spOwo+Cj4gLSAg
ICAgICBpZiAoa3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQodmNwdSwgY250eCkp
Cj4gKyAgICAgICBpZiAoa3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQodmNwdSkp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Cj4gICAgICAgICAvKiBCeSBkZWZh
dWx0LCBtYWtlIENZLCBUTSwgYW5kIElSIGNvdW50ZXJzIGFjY2Vzc2libGUgaW4gVlUgbW9kZSAq
Lwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV92ZWN0b3IuYwo+IGluZGV4IGQ5MmQxMzQ4MDQ1Yy4uYTVmODhjYjcxN2YzIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMKPiArKysgYi9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3ZlY3Rvci5jCj4gQEAgLTIyLDYgKzIyLDkgQEAgdm9pZCBrdm1fcmlzY3Zf
dmNwdV92ZWN0b3JfcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgc3RydWN0
IGt2bV9jcHVfY29udGV4dCAqY250eCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQ7Cj4KPiAg
ICAgICAgIGNudHgtPnNzdGF0dXMgJj0gflNSX1ZTOwo+ICsKPiArICAgICAgIGNudHgtPnZlY3Rv
ci52bGVuYiA9IHJpc2N2X3ZfdnNpemUgLyAzMjsKPiArCj4gICAgICAgICBpZiAocmlzY3ZfaXNh
X2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhLCB2KSkgewo+ICAgICAgICAgICAgICAgICBjbnR4LT5z
c3RhdHVzIHw9IFNSX1ZTX0lOSVRJQUw7Cj4gICAgICAgICAgICAgICAgIFdBUk5fT04oIWNudHgt
PnZlY3Rvci5kYXRhcCk7Cj4gQEAgLTcwLDEzICs3MywxMSBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1
X2hvc3RfdmVjdG9yX3Jlc3RvcmUoc3RydWN0IGt2bV9jcHVfY29udGV4dCAqY250eCkKPiAgICAg
ICAgICAgICAgICAgX19rdm1fcmlzY3ZfdmVjdG9yX3Jlc3RvcmUoY250eCk7Cj4gIH0KPgo+IC1p
bnQga3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3Zt
X2NwdV9jb250ZXh0ICpjbnR4KQo+ICtpbnQga3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2Nv
bnRleHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gLSAgICAgICBjbnR4LT52ZWN0b3Iu
ZGF0YXAgPSBrbWFsbG9jKHJpc2N2X3ZfdnNpemUsIEdGUF9LRVJORUwpOwo+IC0gICAgICAgaWYg
KCFjbnR4LT52ZWN0b3IuZGF0YXApCj4gKyAgICAgICB2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQu
dmVjdG9yLmRhdGFwID0ga3phbGxvYyhyaXNjdl92X3ZzaXplLCBHRlBfS0VSTkVMKTsKPiArICAg
ICAgIGlmICghdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gLSAgICAgICBjbnR4LT52ZWN0b3IudmxlbmIgPSBy
aXNjdl92X3ZzaXplIC8gMzI7Cj4KPiAgICAgICAgIHZjcHUtPmFyY2guaG9zdF9jb250ZXh0LnZl
Y3Rvci5kYXRhcCA9IGt6YWxsb2MocmlzY3Zfdl92c2l6ZSwgR0ZQX0tFUk5FTCk7Cj4gICAgICAg
ICBpZiAoIXZjcHUtPmFyY2guaG9zdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkKPiBAQCAtODcsNyAr
ODgsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAo+Cj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfZnJlZV92ZWN0b3JfY29udGV4
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHsKPiAtICAgICAgIGtmcmVlKHZjcHUtPmFyY2gu
Z3Vlc3RfcmVzZXRfY29udGV4dC52ZWN0b3IuZGF0YXApOwo+ICsgICAgICAga2ZyZWUodmNwdS0+
YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCk7Cj4gICAgICAgICBrZnJlZSh2Y3B1LT5h
cmNoLmhvc3RfY29udGV4dC52ZWN0b3IuZGF0YXApOwo+ICB9Cj4gICNlbmRpZgo+IC0tCj4gMi40
OC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
