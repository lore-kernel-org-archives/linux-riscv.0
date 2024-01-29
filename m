Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3DBC47DA9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmBWymBtZ2PUWE5mt7d6U42huf68K7o/BslNGVKJfNk=; b=ag9681l6DNfdMd
	n93tODnT+6o2jt3DzS9DWjnIdj05715EWkz8dKhn9zZh6oBPBOnwT/9MzNXu8LEI63/tVpfFi+U0e
	R9Gevxa7Pe/ltwR4kv2GBKbqlMVHcAW8b3K1HsT2tJnwnITnexWhXcPeC+Pyqm3J6LdZVlOnQg7qG
	6NbEDhcP0DTzRC71J4l7iWw1Z02FN6ztFy79JJPorEUaT1iIHBr2Ym9jmeMFxGSpq4PIOcw8l79hl
	7ydpsHe6YdFUUaFdFG1gY+zf3rMz8Q1TdeHjnzpQ4H5M5xzJ2Pc8aZC5FKtiJyaYboWRt8ap+5fdE
	4MRyKTTwoiBBuNuVsSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUN0Z-0000000BmDj-1JtE;
	Mon, 29 Jan 2024 08:28:47 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUN0W-0000000BmCW-3C4J
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 08:28:45 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a33735d22fcso198638766b.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 00:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706516922; x=1707121722; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hd11WU3DwyoDiQmIHC9dAoBbMr9OMPEBjtClwqo3z+E=;
        b=IIjpKuYq1hX3kx3IcvoPgMS//a8+M1nnBurZaboKTtCytIcEA5HVaonLDIP7hsgjBC
         45bJbLEDX3o9gzKLoQRnufXD1exWcKzW5KLLbpDNfwU2sWu4Nr37fgHSARnADPhrO+Ma
         ZLs1FR+e4iS8XzPj1szYfWZWHtNdGlTJc8eCRiinJmu10lL7ydtVDfA7Tnpar+eGgvYC
         jq7kCC/sVGD2Oe74aHRI2X6Ra63rRa+YV+SVV56a3O/gu980oy7Mt0fC8mRwTRf2Mefw
         84GXO6YEJ+QBKpMeAnz8WgTkPeLqoo3iBmjlP2WZM7Cm4bKh1abgloBFGBel0nCKcjeF
         c1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706516922; x=1707121722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hd11WU3DwyoDiQmIHC9dAoBbMr9OMPEBjtClwqo3z+E=;
        b=DeLMaOJ4gZl1m3z7Uc758fbE4QrhERs3uOyISbpjjULXOPUCGCbpLhWHq3ezZxPxNM
         Gtz5lBpdn9lESsY4Ym7ezlbu5upGUlF7zzwQI40esQvG6wprt+kQ1snUNLuJvycUWdds
         2XL5ETm6jW7yr3Hie47MbsRBO0YRAfZFckilJsCc0SFOFjkfL1w0/ugX9OM7/fETbm5r
         BAMDJMZ/O9mDLfGIgNvRcwqro0/WajFppJxilte3S0P4YhDEXviC2BHoi6RlhnQBRa2L
         770FEWMCLB4DR5/1P/0D1R6EpEjbQZd/eAhkWpuha9BZvE7ZbvWTMol9vsVlzi1AHikG
         +Z4g==
X-Gm-Message-State: AOJu0Ywj8kEerjrLuBRBgjOBzdY03/MmUk00aVW7yp8T+MvmyR3dNcg/
	yQuT15avRZd9BBjmza/eOJ+PIQ2WqvZuViQ1bKitS0pbrOq4DDsQZLuIPf6Y2fLm11alH7Yfqhs
	CUkICDhKlQIzwpWWXjRJ42OANh8HB5L2FN+1SbA==
X-Google-Smtp-Source: AGHT+IFacY4fVBAqo3eoUiC3SDYNIryPK6IalhO4mwElYxnAhkKVJG35uT7HJpRO66DjFSDiv+wfUR6R4GBsWpAbKMc=
X-Received: by 2002:a17:906:5fc6:b0:a35:edda:ca88 with SMTP id
 k6-20020a1709065fc600b00a35eddaca88mr192229ejv.66.1706516922072; Mon, 29 Jan
 2024 00:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20240128120405.25876-1-alexghiti@rivosinc.com> <CAEEQ3wmXvnqdvv39JZhkfUsoLbJr4B2WwdgWnGY=aHgE8A-+0g@mail.gmail.com>
In-Reply-To: <CAEEQ3wmXvnqdvv39JZhkfUsoLbJr4B2WwdgWnGY=aHgE8A-+0g@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 29 Jan 2024 09:28:31 +0100
Message-ID: <CAHVXubgjF9z6-0HpjPewaHsG-6ub1BC=E5sZaqVwcFXj=7R_pw@mail.gmail.com>
Subject: Re: [External] [PATCH -fixes] riscv: Flush the tlb when a page
 directory is freed
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Will Deacon <will@kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_002844_826692_2E83A433 
X-CRM114-Status: GOOD (  19.28  )
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

SGkgWXVuaHVpLAoKT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNDowN+KAr0FNIHl1bmh1aSBjdWkg
PGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEhpIEFsZXhhbmRyZSwKPgo+IE9u
IFN1biwgSmFuIDI4LCAyMDI0IGF0IDg6MDTigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0
aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IFRoZSByaXNjdiBwcml2aWxlZ2VkIHNwZWNp
ZmljYXRpb24gbWFuZGF0ZXMgdG8gZmx1c2ggdGhlIFRMQiB3aGVuZXZlciBhCj4gPiBwYWdlIGRp
cmVjdG9yeSBpcyBtb2RpZmllZCwgc28gYWRkIHRoYXQgdG8gdGxiX2ZsdXNoKCkuCj4gPgo+ID4g
Rml4ZXM6IGM1ZTliMmMyYWU4MiAoInJpc2N2OiBJbXByb3ZlIHRsYl9mbHVzaCgpIikKPiA+IFNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+
IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiLmggfCAyICstCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3RsYi5oCj4gPiBpbmRleCAxZWI1NjgyYjJhZjYuLjUwYjYzYjVjMTViZCAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdGxiLmgKPiA+IEBAIC0xNiw3ICsxNiw3IEBAIHN0YXRpYyB2b2lkIHRsYl9mbHVz
aChzdHJ1Y3QgbW11X2dhdGhlciAqdGxiKTsKPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQgdGxiX2Zs
dXNoKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIpCj4gPiAgewo+ID4gICNpZmRlZiBDT05GSUdfTU1V
Cj4gPiAtICAgICAgIGlmICh0bGItPmZ1bGxtbSB8fCB0bGItPm5lZWRfZmx1c2hfYWxsKQo+ID4g
KyAgICAgICBpZiAodGxiLT5mdWxsbW0gfHwgdGxiLT5uZWVkX2ZsdXNoX2FsbCB8fCB0bGItPmZy
ZWVkX3RhYmxlcykKPiA+ICAgICAgICAgICAgICAgICBmbHVzaF90bGJfbW0odGxiLT5tbSk7Cj4K
PiBXaHkgaXMgaXQgbmVjZXNzYXJ5IHRvIGZsdXNoIGFsbCBUTEIgZW50cmllcyBvZiB0aGUgcHJv
Y2Vzcz8KClRoYXQncyBxdWl0ZSBoZWF2eSBidXQgdGhhdCdzIHRoZSBvbmx5IHRvIGZsdXNoIGFu
eSAiaW50ZXJtZWRpYXRlIgpjYWNoZSB0aGF0IHdvdWxkIGNhY2hlIG5vbi1sZWFmIFBURXMsIHRo
ZSBzcGVjaWZpY2F0aW9uIG1lbnRpb25zIHRoaXM6CgoiSWYgc29mdHdhcmUgbW9kaWZpZXMgYSBu
b24tbGVhZiBQVEUsIGl0IHNob3VsZCBleGVjdXRlIFNGRU5DRS5WTUEKd2l0aCByczE9eDAuIElm
IGFueSBQVEUgYWxvbmcgdGhlIHRyYXZlcnNhbCBwYXRoIGhhZCBpdHMgRyBiaXQgc2V0LApyczIg
bXVzdCBiZSB4MDsgb3RoZXJ3aXNlLCByczIgc2hvdWxkIGJlIHNldCB0byB0aGUgQVNJRCBmb3Ig
d2hpY2ggdGhlCnRyYW5zbGF0aW9uIGlzIGJlaW5nIG1vZGlmaWVkLiIKClRoYXQgd2FzIHRoZSBi
ZWhhdmlvdXIgYmVmb3JlIGNvbW1pdCBjNWU5YjJjMmFlODIgKCJyaXNjdjogSW1wcm92ZQp0bGJf
Zmx1c2goKSIpLgoKPgo+IFRoYW5rcywKPiBZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
