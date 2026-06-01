Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB1DCD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 04:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CgxY43YPXPBTrtf1K+0ttW/BI/T+nsW+tZXCXFveEY4=; b=eM6ZJg3BKyX5Jl
	A+XVKV3wuS4uLPOi0bES4gGiaDI2mYJ87f87vG/kzQsW+V4oz8T1SUJ+wDyO6Chft/2k6XcFDilPN
	AVgCbszEJqcPS1M12DCyzbZPqH9Ph12XXQ6nmP8nQ9QvKjvj3k2ejyWb4/1o3etB7MwVtV83KrWKl
	8n4GDaih/z3JXbldSEaa7fonGx1HzdYRGANN6thoqdw4NDqclfNfzkc9KAWuDtgGmoqZMC2AG8qAF
	AKoYJM78903bXiQeDkKYr7NoWOD1urUtV4F8TTlCANHIxJAaWMwZgyBS6CTpqo9DX53SBpzr7FwWi
	klfoFtPsreyM6mjATbiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTufx-0000000A8IV-3X71;
	Mon, 01 Jun 2026 04:54:57 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTufv-0000000A8Hi-0Oak
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 04:54:56 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-43b7987a9d1so6454502fac.1
        for <linux-riscv@lists.infradead.org>; Sun, 31 May 2026 21:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780289694; cv=none;
        d=google.com; s=arc-20240605;
        b=huIs+3QlHvppQoYeMbE+a+/04cFaVSDlJ4E8nHG+MrWVO+ySqLEPoY9A/8vZ5kNulY
         J39BY5A/r4YypL8kYQnrShWEgS+r5cfXfWOeQrTVnBo2Mt0zEe7c5RTAZSSld58bRo0f
         cMaGLRfnyDeT2nV5yYM3YKuilOnifFa8atlxHYOfXFdhDBgWXw0EHG3f0vMfAc7B/KuH
         pvq/dvRULJVuXxCznswm4yJp/GXlZnr39REt0lWyrMa/kqkHrGK+8tkIHbXquQgKLBFo
         D4zF0HaeysyoQDuB6iH6TNiFpqFbf2fdva2Lk51zPzBrOXqNC9k5CCjYDH5AIlVOUxzO
         9WKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m8WkJ7GreGQcFtxECvVXSjHYEmfBxLt7EkdnmdGvJ1Q=;
        fh=ANFuxlCpj1MR/pYZ1DNiy4DJ7/oYckRodgpTO1v3Cr0=;
        b=gA52dAUJN17ViVHlUaxjVHzVA8Qyr3owRxM3IS7s9O3NAHiKzUKutKKM15gsaKhbVZ
         r0/LBdsSUYy9gXQEiqrsrONk1VKh4n+dNYZvKbjlGTPnFkf3C+Fas/YYidEIe9o0a1FK
         F6LEVALKxLR4G71/WoJk6AVI2uw530JJ1GZ8aXqQg1ihUg/w828l7X/GFEBnCtsXhhQm
         JThCdy6UyCdWw5yVLQm4kLSaNlDbT2KOM+qrlkjqkxolsmP/tUV9hpgVEinwgbijrelc
         0d6cd3784dg1Rhi8c55ZIs8WnZNtPMOznXaRSWCce61bXcsh2bP31wpJrjDOZjSxBWZV
         ScHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780289694; x=1780894494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8WkJ7GreGQcFtxECvVXSjHYEmfBxLt7EkdnmdGvJ1Q=;
        b=zHwsvTLdC1JPFK+iPrCgtLIY1h7LhbDjf5SwxOhprBDiEarlSHS6pUYXXbvs3s93W9
         5MEi4uaUZOxbQAapQoDMROHupxRqoCX2xg1KUiebEEoBGjgbggBmLH+v5YVM4O5UEJS5
         8KSUphMc50UyAD1DJbRy+m1uwwyyzYqW5A0VbnRbSLXgIQygLxLo3BK1vi1kYK/sx2p6
         TBF0DjCbgVLat0rUkBYr3HpGuZiECAx8w+BJni97UMVdhSq/vn/mM6QYIqtuckVJYCC6
         QTM1ezYNtpRbPXwGtsLjEom4vp8Wkhk5mVmlr9vwYRTbECn62ODk3aRuwBY6jO41qNot
         u2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780289694; x=1780894494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m8WkJ7GreGQcFtxECvVXSjHYEmfBxLt7EkdnmdGvJ1Q=;
        b=Ecl4bQlKaEKMWE2LgK0WNskAtMcDQ1TQuQ7w3xBehrHB2sebH5JPv6c4wJjkQpWFx5
         hfFYd4nt13H6Pkio1nWl0T81smCCfJBEyUcJ2Nnqgi0vJVGPCTeSdEN0w2WG8/SiF2JQ
         DgrLSlzPZEbnytw1EgSglYar3UgOyOMEBVmMS0O7hWDDXsHhWwvwUI76HOLNr8W6jqFF
         ic+PhERNf9WMAFL9gZ9v9vOxrvANZ2zGZnP2OT4hPC2klhmMkOIDkpPd4IN0jNirVKp6
         1VyALLQMTx7mHDYeLYorSt7jOE/VOd1FMIFL/3LKu1kXHBed6MKUqZQuc7SSMxztComu
         MwDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vSX2QfI/cslhcXaEQ7ZPPosnl/+3XGGP/6QWn6VRRi/ncy3zdoNUf4o+sxkin36xdUQ/gANgf6lBw5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuP8S4ta57kCHOK9/QbMdFkK+wzZiIg/DlFfYuyLd9BgG0xevr
	rdchyQ6DwXFeH/rW5BtKUoYba+Uq3DUbrbGiJ7P6AuViUYdw2FwyJ5oO+TawPpYB2GCjg+aRqls
	rVzsGVkfiQFQBZzCa8K5mcYwZ7evRwvxPeZKed3LAWQ==
X-Gm-Gg: Acq92OF/eRQ8C1LzRKBxTKNsBXOEhso3+z1zZfLCDUjjV/M38HXJtMERagWz335aQSW
	zqAQr0X+46qoNWj/ndPSBAmzIxN3L/WJbe+2V56UeQlARqRo/7fgekas3qtIwHHVo8DneJ/a1fY
	5UfT2vMH52PAniP5EDIVn8b93gFSegijRQf2x9IfSiK4/aFDKe8ftp5eKYOmRFdBDlTGXVkyyHh
	wyWuknAcsoLHx2grYn6JFpOdyaQj/qmdgsLHmL/am5Yd+QWsGA+9WA7ane2+j26bUAdc3asMT9r
	CJCZnKavA5dIlZwzU6UPpox1xY7a5qIIRihILmeHgA6b9vlE5tj8WFAnjtth8JT/q90eqziSl7k
	cx0g9SRas+rrSkgb+Kn2ntOST4cEEgYwxUeUCnw==
X-Received: by 2002:a05:6820:308c:b0:69d:f8c2:387 with SMTP id
 006d021491bc7-69e102bc05cmr4846144eaf.17.1780289693742; Sun, 31 May 2026
 21:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260416091805.56250-1-cuitao@kylinos.cn>
In-Reply-To: <20260416091805.56250-1-cuitao@kylinos.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Jun 2026 10:24:41 +0530
X-Gm-Features: AVHnY4KcQMZz8DLJlvcNE2Bfe9v0l8NEJ4PnGoX_sb1Xpx3LC-P2ExWNiDGt8rs
Message-ID: <CAAhSdy0yBvLumqsO1gn_yjPmjLzNSPdyTRJY7eBSoCFvaPg4hg@mail.gmail.com>
Subject: Re: [PATCH] riscv: kvm: mmu: fix unlocked gstage unmap in kvm_unmap_gfn_range
To: cuitao <cuitao@kylinos.cn>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm-riscv@lists.infradead.org, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_215455_449655_10D5DEDD 
X-CRM114-Status: GOOD (  16.28  )
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

T24gVGh1LCBBcHIgMTYsIDIwMjYgYXQgMjo0OeKAr1BNIGN1aXRhbyA8Y3VpdGFvQGt5bGlub3Mu
Y24+IHdyb3RlOgo+Cj4gV2hlbiBzcGluX3RyeWxvY2sgZmFpbHMgaW4ga3ZtX3VubWFwX2dmbl9y
YW5nZSgpLCB0aGUgY29kZSBzdGlsbAo+IHByb2NlZWRzIHRvIGNhbGwga3ZtX3Jpc2N2X2dzdGFn
ZV91bm1hcF9yYW5nZSgpIHdpdGhvdXQgaG9sZGluZwo+IGt2bS0+bW11X2xvY2ssIHdoaWNoIHJh
Y2VzIHdpdGggY29uY3VycmVudCBwYWdlIHRhYmxlIG1vZGlmaWNhdGlvbnMuCj4KPiBTa2lwIHRo
ZSB1bm1hcCBhbmQgcmV0dXJuIGZhbHNlIG9uIHRyeWxvY2sgZmFpbHVyZSBzbyB0aGUgTU1VIG5v
dGlmaWVyCj4gd2lsbCBmbHVzaCBhbmQgcmV0cnksIG1hdGNoaW5nIHRoZSBwYXR0ZXJuIHVzZWQg
Ynkgb3RoZXIgYXJjaGl0ZWN0dXJlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IGN1aXRhbyA8Y3VpdGFv
QGt5bGlub3MuY24+CgpXZSB3aWxsIGJlIHVzaW5nIG1tdV9sb2NrIGFzIHJ3bG9jay4KKFJlZmVy
LCBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qva3ZtLXJpc2N2L3BhdGNoLzIw
MjYwNTE3MTUzNDI3Ljk0ODg5LTMtdGp5dGltaUAxNjMuY29tLykKClJlZ2FyZHMsCkFudXAKCj4g
LS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jIHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCAwODhkMzNiYTkw
ZWQuLmQzN2NjNzE3ZmRhZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gQEAgLTI0NSw3ICsyNDUsNiBAQCBpbnQga3ZtX2Fy
Y2hfcHJlcGFyZV9tZW1vcnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwKPiAgYm9vbCBrdm1fdW5t
YXBfZ2ZuX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9nZm5fcmFuZ2UgKnJhbmdl
KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX2dzdGFnZSBnc3RhZ2U7Cj4gLSAgICAgICBib29s
IG1tdV9sb2NrZWQ7Cj4KPiAgICAgICAgIGlmICgha3ZtLT5hcmNoLnBnZCkKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIGZhbHNlOwo+IEBAIC0yNTQsMTIgKzI1MywxMyBAQCBib29sIGt2bV91bm1h
cF9nZm5fcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSAqcmFuZ2Up
Cj4gICAgICAgICBnc3RhZ2UuZmxhZ3MgPSAwOwo+ICAgICAgICAgZ3N0YWdlLnZtaWQgPSBSRUFE
X09OQ0Uoa3ZtLT5hcmNoLnZtaWQudm1pZCk7Cj4gICAgICAgICBnc3RhZ2UucGdkID0ga3ZtLT5h
cmNoLnBnZDsKPiAtICAgICAgIG1tdV9sb2NrZWQgPSBzcGluX3RyeWxvY2soJmt2bS0+bW11X2xv
Y2spOwo+ICsgICAgICAgaWYgKCFzcGluX3RyeWxvY2soJmt2bS0+bW11X2xvY2spKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV91
bm1hcF9yYW5nZSgmZ3N0YWdlLCByYW5nZS0+c3RhcnQgPDwgUEFHRV9TSElGVCwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHJhbmdlLT5lbmQgLSByYW5nZS0+c3RhcnQp
IDw8IFBBR0VfU0hJRlQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJh
bmdlLT5tYXlfYmxvY2spOwo+IC0gICAgICAgaWYgKG1tdV9sb2NrZWQpCj4gLSAgICAgICAgICAg
ICAgIHNwaW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiArICAgICAgIHNwaW5fdW5sb2NrKCZr
dm0tPm1tdV9sb2NrKTsKPiAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgfQo+Cj4gLS0KPiAyLjQz
LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
