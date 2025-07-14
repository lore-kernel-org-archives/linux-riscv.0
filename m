Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67458C83F1B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 08:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzJ97FxPQ7nPt/NHNEVZIQM6s/0Yfr88Rypd++NfL1w=; b=YTWEhZVyPjqWe9
	UXsISBx3ccqb2+ht+kfJ7+ZC0Q3dJRlcW74OhcbOaLFaMTmutLtYd37ieFjQthTjxo2cJsZ+Yjjp7
	DT3885WigMiHnCp/c0mB1g5UxfGmP2PlfkAM6jhiG4Ic6Iv0788tl99CY6cuoLRF0LqHRRZTFsT/n
	uu5ewFUO7pbN1ErjhAXeGTqU8AGntp46ny95k4ZI/TcxzF2zrLku0UXebX9+m93CsRo3U6Fkj9n8P
	xzFrQzFXRPhOVMiSY31BLnrNsc1kdfflLYOVjds2VzGKsYwMXj3tYTDKH6cg/qWoqA6wMZ9pSuZUI
	EgLPSEWNdIPpS9izZa/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubERv-00000001cns-01qR;
	Mon, 14 Jul 2025 08:22:11 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEAV-00000001Ynd-3jKc
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 08:04:13 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3df4bdadca5so15675895ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 01:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752480251; x=1753085051; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZgIQGeH6iTe1iCoPtim6lSFnAFbmo2QUEBDo1A3JBQ=;
        b=aVRj/84Dm6LM4LrQJ3ah54jsFvMnm6oIWBHWZOD7sitHMWIlWM3BGET7+vt/WAfGj0
         LCTozfU2UXJZN1xZTknnQpTnWzCkPoK9W9/RlpjDZxj5O/IRk/HlutoaHC89tUC20tOi
         eao5cIjK3yCsnsv5lFlwvH2C1qzY+0CRgrusdLzm1pBfqwqihT0jogQRpLXAh0SeDBZi
         a9D/Q0pwlt5pB2NG3ijzfu2VCrWegERDJ0caWGUGsjn+JmocmFqg/j7+7tGwfwlUFcBX
         MM/SqZHI5XleuAK0c9PAZl3gpi70cZE/uP742NsMq+nMERrXMcCn9sMRdZzqhdnFuSje
         uEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752480251; x=1753085051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZgIQGeH6iTe1iCoPtim6lSFnAFbmo2QUEBDo1A3JBQ=;
        b=SZCsboU0CbdEFzFnAIByafPo0gDHmTJB6mh+5bkaI6iOTO29rd1l4K0ENxg92jvLjI
         75kQN+yvgb2tj2YpsayLSPkC/K7L0fsbab0Ui8orKuHWglBEk5k4rzWqoJa1k4//IWHf
         AW0FBYelh3bnPHyMJ/7aYW3j5mJzAy3lj+Jc/s9dG66kIGBWJZiDVaVaw7Mj48aGkSge
         Um/NTDhdiKx1y4eTSbmA1xjHlgU+rGEWcaKCAKtPp3b0kJRHSyEXk6685+FaxGSlYfLJ
         aFThDVWAj1fhBF11jo7OeCEdtxarKLdjqXB6Ws76VSLznDr8sbGTayGhnwj5wqBL2P6V
         nOpA==
X-Forwarded-Encrypted: i=1; AJvYcCUTcQwQJyO93GGv3dzGK1Nb5CvsoV2ISSoquIrXt7+QHk9y8UBMxWpLYPhSmLUaDc+6cCxM+8GcaH+miQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxid3gHTA2NVOKVRqZxfGv1J3QShcEgVrPRAY8ZVyWAQ6LZ2LFa
	iQfvCDPY8G5mRev5euJLWtkYsHQHRqCXV8aTWMLif3VznvJUaY81uFr3Z2wgEYE/scXGmdrUDv4
	FPh8bpCvTmYOpmxImdcSaFLJomgspxnTAyKTekRQsiQ==
X-Gm-Gg: ASbGncsP+u6NnCTlpKvp5lvCfDmBlcSoxNSqKoFUIEoJZ9uGVHarFzbxl6FoqkkCUki
	oR0lx7tsTGQ3sLrE8trxcw5/RDNEeNzvS5ieUiouOTO9RzoUKSJi027u81H2/dJnsiH51u3nVoq
	MPO88J79jqOolRgjbh6SyGfGvMXaoSR5vTYsa9qlT+9wS4VG8+fAPQKRRVkUBPlhseMDlqF4nZV
	FS9RYIAoud50GxwigU=
X-Google-Smtp-Source: AGHT+IFRHVQzoAt1qKkfWgKOuTxoczx2KhtXwBF+kniHBzyY3kBO8gLSgMJy+LXX+IM1zlPXQQUK731W+/4cNca4pWM=
X-Received: by 2002:a05:6e02:304a:b0:3df:4046:93a9 with SMTP id
 e9e14a558f8ab-3e25325550bmr122893985ab.5.1752480250607; Mon, 14 Jul 2025
 01:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250711101537.16308-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250711101537.16308-1-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Jul 2025 13:33:59 +0530
X-Gm-Features: Ac12FXxof_i54yoTN6sBpKdXuMFJfg4CBnTxqLczo_oXcUYHd6dY56mBe6MespY
Message-ID: <CAAhSdy0OumSXbJEEafE6q-LPu2PTdN9Tzx_aoapy=RJD214uBw@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Delegate illegal instruction fault to VS mode
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: rkrcmar@ventanamicro.com, cleger@rivosinc.com, atish.patra@linux.dev, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_010412_168250_21E652BC 
X-CRM114-Status: GOOD (  15.91  )
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

T24gRnJpLCBKdWwgMTEsIDIwMjUgYXQgMzo0NeKAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IERlbGVnYXRlIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQg
dG8gVlMgbW9kZSBpbiBkZWZhdWx0IHRvIGF2b2lkIHN1Y2gKCnMvaW4gZGVmYXVsdC9ieSBkZWZh
dWx0LwoKPiBleGNlcHRpb25zIGJlaW5nIHRyYXBwZWQgdG8gSFMgYW5kIHJlZGlyZWN0ZWQgYmFj
ayB0byBWUy4KPgo+IFRoZSBkZWxlZ2F0aW9uIG9mIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQg
aXMgcGFydGljdWxhcmx5IGltcG9ydGFudAo+IHRvIGd1ZXN0IGFwcGxpY2F0aW9ucyB0aGF0IHVz
ZSB2ZWN0b3IgaW5zdHJ1Y3Rpb25zIGZyZXF1ZW50bHkuIEluIHN1Y2gKPiBjYXNlcywgYW4gaWxs
ZWdhbCBpbnN0cnVjdGlvbiBmYXVsdCB3aWxsIGJlIHJhaXNlZCB3aGVuIGd1ZXN0IHVzZXIgdGhy
ZWFkCj4gdXNlcyB2ZWN0b3IgaW5zdHJ1Y3Rpb24gdGhlIGZpcnN0IHRpbWUgYW5kIHRoZW4gZ3Vl
c3Qga2VybmVsIHdpbGwgZW5hYmxlCj4gdXNlciB0aHJlYWQgdG8gZXhlY3V0ZSBmb2xsb3dpbmcg
dmVjdG9yIGluc3RydWN0aW9ucy4KPgo+IFRoZSBmdyBwbXUgZXZlbnQgY291bnRlciByZW1haW5z
IHVuZGVsZXRlZCBzbyB0aGF0IGd1ZXN0IGNhbiBzdGlsbCBxdWVyeQo+IGlsbGVnYWwgaW5zdHJ1
Y3Rpb24gZXZlbnRzIHZpYSBzYmkgY2FsbC4gR3Vlc3Qgd2lsbCBvbmx5IHNlZSB6ZXJvIGNvdW50
Cj4gb24gaWxsZWdhbCBpbnN0cnVjdGlvbiBmYXVsdHMgYW5kIGtub3cgJ2Zpcm13YXJlJyBoYXMg
ZGVsZWdhdGVkIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVk
YW5jZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8IDEg
Kwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYyAgICAgICAgfCA1IC0tLS0tCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1faG9zdC5oCj4gaW5kZXggODVjZmViYzMyZTRjZi4uM2Y2YjkyNzBmMzY2YSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiBAQCAtNDQsNiArNDQsNyBAQAo+ICAjZGVm
aW5lIEtWTV9SRVFfU1RFQUxfVVBEQVRFICAgICAgICAgICBLVk1fQVJDSF9SRVEoNikKPgo+ICAj
ZGVmaW5lIEtWTV9IRURFTEVHX0RFRkFVTFQgICAgICAgICAgICAoQklUKEVYQ19JTlNUX01JU0FM
SUdORUQpIHwgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklU
KEVYQ19JTlNUX0lMTEVHQUwpICAgICB8IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEJJVChFWENfQlJFQUtQT0lOVCkgICAgICB8IFwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVChFWENfU1lTQ0FMTCkgICAgICAgICB8IFwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVChFWENfSU5TVF9Q
QUdFX0ZBVUxUKSB8IFwKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+IGluZGV4IDZlMGMxODQxMjc5NTYuLmNkOGZh
NjhmMzY0MmMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPiArKysg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+IEBAIC0xOTMsMTEgKzE5Myw2IEBAIGludCBr
dm1fcmlzY3ZfdmNwdV9leGl0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4g
KnJ1biwKPiAgICAgICAgIHJldCA9IC1FRkFVTFQ7Cj4gICAgICAgICBydW4tPmV4aXRfcmVhc29u
ID0gS1ZNX0VYSVRfVU5LTk9XTjsKPiAgICAgICAgIHN3aXRjaCAodHJhcC0+c2NhdXNlKSB7Cj4g
LSAgICAgICBjYXNlIEVYQ19JTlNUX0lMTEVHQUw6Cj4gLSAgICAgICAgICAgICAgIGt2bV9yaXNj
dl92Y3B1X3BtdV9pbmNyX2Z3KHZjcHUsIFNCSV9QTVVfRldfSUxMRUdBTF9JTlNOKTsKPiAtICAg
ICAgICAgICAgICAgdmNwdS0+c3RhdC5pbnN0cl9pbGxlZ2FsX2V4aXRzKys7Cj4gLSAgICAgICAg
ICAgICAgIHJldCA9IHZjcHVfcmVkaXJlY3QodmNwdSwgdHJhcCk7Cj4gLSAgICAgICAgICAgICAg
IGJyZWFrOwoKTGV0cyBrZWVwIHRoZSBpbGxlZ2FsIGluc3RydWN0aW9uIHRyYXAgaGFuZGxpbmcg
c28gdGhhdCBpZiBTQkkgaW1wbGVtZW50YXRpb24KZm9yd2FyZHMgVlMtbW9kZSBpbGxlZ2FsIGlu
c3RydWN0aW9uIHRyYXAgdG8gSFMtbW9kZSBpZ25vcmluZyBoZWRlbGVnCmR1ZSB0byB1bmtub3du
IHJlYXNvbnMgdGhlbiB3ZSBzdGlsbCBmb3J3YXJkIHRoaXMgdHJhcCB0byBHdWVzdCBvdGhlcndp
c2UKc3VjaCBhbiBpbGxlZ2FsIGluc3RydWN0aW9uIHRyYXAgd2lsbCBjYXVzZSBleGl0IHRvIHVz
ZXItc3BhY2UgYW5kIGV2ZW50dWFsbHkKa2lsbCB0aGUgR3Vlc3QuCgo+ICAgICAgICAgY2FzZSBF
WENfTE9BRF9NSVNBTElHTkVEOgo+ICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNwdV9wbXVf
aW5jcl9mdyh2Y3B1LCBTQklfUE1VX0ZXX01JU0FMSUdORURfTE9BRCk7Cj4gICAgICAgICAgICAg
ICAgIHZjcHUtPnN0YXQubG9hZF9taXNhbGlnbmVkX2V4aXRzKys7Cj4gLS0KPiAyLjIwLjEKPgoK
UmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
