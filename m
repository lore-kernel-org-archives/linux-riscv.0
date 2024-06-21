Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B18C2BA1A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 07:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79s9F8fynHN/eOQpOgRRzottHWMdAdW0kx/9TUs68Ds=; b=LSaNWaEnZQjX2d
	Qvkl3nMSC1I3bsrsWXacsK+NP4KQG8FOiwd7XlLPyg9RNvt+N93PyXtaOWiEXugfsvz/FigpZQI/Z
	a1DfUfxCrHFKTtuJdrzp2MzxSFHZEZ2iDOFeYAJ3XXXdAxxlYMz8BfzXPG4KfbDqhjF5KqualcSnf
	WEcRP0NPbGBRccaDNZ9zDuywaBwD/su9PKILXujzBCis/G29nqxhhYVfHis7BEjF97rt642wCWVrR
	yYW/q4Zqh2u5cIKiCOgWmUAAVnMuw69iybkD2Fpi+z+I1LPOscQOut/Dfx1qMU0d9nUyUm2WHjUzK
	BKYMQ9KIiwJ31jjV8/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKYmq-000000089Tr-1AmM;
	Fri, 21 Jun 2024 07:34:20 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKYmo-000000089Sd-1bFL
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 07:34:19 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7eb7bf1357cso59435339f.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 00:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718955257; x=1719560057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YJB5WMsYvwJwIsrILucvgKQ+tYLfCsBglnam11pazM=;
        b=PmOVBqBjabY5THLaGChwWt/DrHTvsNt03Y4vrEVPtfXI64PDl2LgraJEFFdR7D40Y2
         +MdGg7UgyR0Yig/f++qKUJ53Axm1+EXq4d9c3b4iSe/Jqo8x7mkWl+qzYCQ+luodO1f+
         W9RGUnwwN0gCIoTlDWLj2zYDB72BLFOYLeIyMi2m1Ejl5jS44sMMPSPSipr2WSqLn3bs
         FQbuifCNiWe1T5QPx3U5PgI484H2CydUPN/hiIF0TpaBz4O6NTDPKkwxqTMSwKGC9to1
         erZaEadTb5A6yvCx4l4q2rjHvvRjFsq5VmwutwQRkV6t50P0OS8gvgYEdVmwJ9sY0ZBL
         8qhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718955257; x=1719560057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YJB5WMsYvwJwIsrILucvgKQ+tYLfCsBglnam11pazM=;
        b=WUNanjZp9lYysrMDtNTSb7oqiBbN6p6LR00pgpPs3Xd5Nb+vAohUruA26q2hGoPy6D
         J6PfqpJb+Oz0bc9WNvu/6KfiaQgLpGjfiMSbm7m+pK5Ua5tovXDU0ZIudOiAc4DfvAtM
         CnzYCj4LGbjH+Zr//Vz1Oq+xrrC5s0m6RxB2U21O3Sh8TUrDHDkAoWYnXoTrnhyzZmcl
         g/wk7XrbRN5yXGn7Sp5AzOMkrUaPKp3is09UIpWEH8hJjqgl2YEa6EUuQSz5F+uB5kXW
         FtgAHaYdOFLxiiGrfENpvPaPKyXe+FC6woRZTHaK4gvPLzJ2rgyhuib0FF4kCDyN+vji
         BzRw==
X-Forwarded-Encrypted: i=1; AJvYcCVazQFppcubKwfKutSF0zGWB87rIbmqIjLYKPnwYhnlv6zbUnKvzrJ/H0MaMlKwMD743laXU6V224T1Skkll/S/DbWVNuNtCYNhcvjbRq60
X-Gm-Message-State: AOJu0YzZsVJS9YIFlmFWyYU3SPGISasSAEWnBO3+tSjlkti+3uuAshZ2
	7/qxlfDj9vXEkm8mEMu3JIivEkJEwSeWKSfVT2YOEd6sGRjyWj4zWzFCV4x2YZl8qmMzbHK+ULG
	PUmItLY+qKX/dQIFWvsSJ6Jsc+f22uULrOcvgBA==
X-Google-Smtp-Source: AGHT+IH2z2ENNh/7avn9eIUE25VrvT6mYZ65u1+C3Qlt1wQc1RVUMHzbx3/IqLBD6fvxFHk4VEe0NCBvO94Vf6OBfD8=
X-Received: by 2002:a05:6602:2c86:b0:7eb:85f7:5f5 with SMTP id
 ca18e2360f4ac-7f13ee7bca3mr913038139f.14.1718955257262; Fri, 21 Jun 2024
 00:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240614142156.29420-1-zong.li@sifive.com> <20240614142156.29420-8-zong.li@sifive.com>
 <d003f916-28ca-451a-a2e1-e58c66fc3459@oracle.com>
In-Reply-To: <d003f916-28ca-451a-a2e1-e58c66fc3459@oracle.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 21 Jun 2024 15:34:06 +0800
Message-ID: <CANXhq0q8P+n52PhOc5Uu+oTBSY9bukMPXz=n909TcoXooXS8PA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 07/10] iommu/riscv: support nested iommu for
 creating domains owned by userspace
To: Joao Martins <joao.m.martins@oracle.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgg@ziepe.ca, kevin.tian@intel.com, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_003418_440591_9CE7AEE8 
X-CRM114-Status: GOOD (  11.55  )
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

T24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgMTI6MzTigK9BTSBKb2FvIE1hcnRpbnMgPGpvYW8ubS5t
YXJ0aW5zQG9yYWNsZS5jb20+IHdyb3RlOgo+Cj4gT24gMTQvMDYvMjAyNCAxNToyMSwgWm9uZyBM
aSB3cm90ZToKPiA+ICtzdGF0aWMgc3RydWN0IGlvbW11X2RvbWFpbiAqCj4gPiArcmlzY3ZfaW9t
bXVfZG9tYWluX2FsbG9jX3VzZXIoc3RydWN0IGRldmljZSAqZGV2LCB1MzIgZmxhZ3MsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGlvbW11X2RvbWFpbiAqcGFyZW50LAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBpb21tdV91c2VyX2Rh
dGEgKnVzZXJfZGF0YSkKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21h
aW47Cj4gPiArICAgICBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZG9tYWluICpyaXNjdl9kb21haW47Cj4g
PiArCj4gPiArICAgICAvKiBBbGxvY2F0ZSBzdGFnZS0xIGRvbWFpbiBpZiBpdCBoYXMgc3RhZ2Ut
MiBwYXJlbnQgZG9tYWluICovCj4gPiArICAgICBpZiAocGFyZW50KQo+ID4gKyAgICAgICAgICAg
ICByZXR1cm4gcmlzY3ZfaW9tbXVfZG9tYWluX2FsbG9jX25lc3RlZChkZXYsIHBhcmVudCwgdXNl
cl9kYXRhKTsKPiA+ICsKPiA+ICsgICAgIGlmIChmbGFncyAmIH4oKElPTU1VX0hXUFRfQUxMT0Nf
TkVTVF9QQVJFTlQgfCBJT01NVV9IV1BUX0FMTE9DX0RJUlRZX1RSQUNLSU5HKSkpCj4gPiArICAg
ICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FT1BOT1RTVVBQKTsKPiA+ICsKPgo+IElPTU1VX0hX
UFRfQUxMT0NfRElSVFlfVFJBQ0tJTkcgZmxhZyBjaGVjayBzaG91bGQgYmUgZHJvcHBlZCBpZiBp
dCdzIG5vdAo+IHN1cHBvcnRlZCBpbiBjb2RlICh3aGljaCBsb29rcyB0byBiZSB0aGUgY2FzZSBp
biB5b3VyIHNlcmllcykgZS5nLgoKVGhhbmtzIGZvciB5b3VyIHRpcHMsIEkgd2lsbCByZW1vdmUg
aXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KCj4KPiAgICAgICAgIGlmIChmbGFncyAmIH4oKElPTU1V
X0hXUFRfQUxMT0NfTkVTVF9QQVJFTlQpKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9Q
VFIoLUVPUE5PVFNVUFApOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
