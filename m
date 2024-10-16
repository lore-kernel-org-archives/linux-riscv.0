Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33499D2069A
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 05:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vq41xKiydU5OqD1ZFDkIirFTZVxRyfaS5nlJgNdvVgg=; b=r/OX0vmJBhIHhm
	kORrAfwcxv0yksY3C28Ay1Gm8mL2KZwaTnH/C/i5WvTnJ7G1yIAJGc0N9BgIwCOYM0Tjkum3NdHgq
	V6grl9FVsbzpCVvnz6KcalK5LM0Q9/C2zLIYNkShAwKh8bpIZpkt7Nw4+m5xY+G3RCd2SEYcWOHzq
	renSbWvYHT8RV8PX21rFWUZksmqmKyA5Bpw6r71GtozP1ocDfOW8mY8YYrISZV1p2T1t33JzmljdW
	a/coTNFUaia+PO5o40j7vPQ7obOPaCNAfja/SyloAoSdRsRNoRsEawc8ufE2PKNrXKq4k4reC8rXS
	EkYzUnYDeMTEQ/2U2GdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wYC-0000000AZBn-0eeY;
	Wed, 16 Oct 2024 05:26:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wY8-0000000AZBJ-0lz4
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 05:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729056377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rdIG8bdON8eg0upmdIZgzqWAZ14iwo7fh0+LLx9BfdA=;
	b=aj9/QCdsLMjhEBtGqGHxWegl68YpbfU5q6qgNDQu90qGYfyuTqoef0blNDsmbSV2Rsi6Fe
	stdRD20ImavG4LfFVgQKTOdK2Sq6JH+kKTvEHp/8KE9M35N3p6YHjlIGFUyy7eefCXqQWN
	xSNjhfYHmqpkDrkhHy7qdADc5P5Ao24=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-l_vnbI9jPKWiFRo7FxTthg-1; Wed, 16 Oct 2024 01:26:15 -0400
X-MC-Unique: l_vnbI9jPKWiFRo7FxTthg-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2889e4e9a62so2813273fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 22:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729056374; x=1729661174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdIG8bdON8eg0upmdIZgzqWAZ14iwo7fh0+LLx9BfdA=;
        b=dp9TMZTJ3ZjsmRBqKMPepg/4sL8GHBCSHOB5ELWmpa6J2NHKvrglvtdLbX6vScgZnE
         5YdGUTFwV2gIWi5NjW6UGlcnVi4aVQiABaaSM3AdqBiizqo1QhkS9Cx89BLlAtHzZNy/
         G8PJK1nG8Tx+9Ts7rQooqZUIIr+d9RBRD+wQ4EDcfveEPsaTPgInlBSPbZrRkla5sxLR
         swQmUYuz55zd/kcDxQAXDShhJcP3nRT7idN+hcsG2UP4FEAZwGzjmqRY4U9IIrrMmIwj
         I1g9pINzijTlgGO3IU6WbaJ2Ssgu1lZxGZqAD/UD2TBKUw/nG8N72Tv12+tw+vG1yqtt
         acNA==
X-Forwarded-Encrypted: i=1; AJvYcCXY2gMPmw3t5E0D9oeF/0xT1/rUrtiMuzBCOIpLYTRfaTPoSbnZao5qrObnWZE1zvuXoyRWRnjOqZzomA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMBZsWlQTykJ9TS/9x1NK5y/JMnSAu+5vveoAWZiUKHpvoFbxV
	Cll1l1uzW+YjxU+DpIdckV/M2QtEoI1PFc9QGK3HwEpTc7j1XWI1zboR+Iu7w9QaH+PIML2xzN4
	yMMfU4yF6HpUO7DnsoBwqmesfhbBaqpvVNjR2dpe0Hw6ok/avXaS1rrKOjSC+awZdinuUiGTVmA
	SM76dD0hn9mEd79H38M/TTLv6IPlWH3Ss0bIslim7F
X-Received: by 2002:a05:6870:3295:b0:277:eea4:a436 with SMTP id 586e51a60fabf-2886dce9923mr11714432fac.7.1729056374282;
        Tue, 15 Oct 2024 22:26:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHiwn4RE3PioCKXl96uz0dXLqcSvrhpM0cdTcTe9wx/x5I/zORO0z5prrIEan+L0+LNFhQwIPGrANg5wAyQEA=
X-Received: by 2002:a05:6870:3295:b0:277:eea4:a436 with SMTP id
 586e51a60fabf-2886dce9923mr11714422fac.7.1729056374017; Tue, 15 Oct 2024
 22:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241009072749.45006-1-alexghiti@rivosinc.com> <1CA19FB3-C1E3-4C2F-A4FB-05B69EC66D2F@jrtc27.com>
In-Reply-To: <1CA19FB3-C1E3-4C2F-A4FB-05B69EC66D2F@jrtc27.com>
From: Jason Montleon <jmontleo@redhat.com>
Date: Wed, 16 Oct 2024 01:26:02 -0400
Message-ID: <CAJD_bPLcKX+U1k60mgsB_==qrQE+jnLMXSotq3rMrH_o+FtOQQ@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Do not use fortify in early code
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_222620_323052_3B562CD8 
X-CRM114-Status: GOOD (  21.10  )
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

T24gVHVlLCBPY3QgMTUsIDIwMjQgYXQgNjowNeKAr1BNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdA
anJ0YzI3LmNvbT4gd3JvdGU6Cj4KPiBPbiA5IE9jdCAyMDI0LCBhdCAwODoyNywgQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBFYXJseSBjb2Rl
IGRlc2lnbmF0ZXMgdGhlIGNvZGUgZXhlY3V0ZWQgd2hlbiB0aGUgTU1VIGlzIG5vdCB5ZXQgZW5h
YmxlZCwKPiA+IGFuZCB0aGlzIGNvbWVzIHdpdGggc29tZSBsaW1pdGF0aW9ucyAoc2VlCj4gPiBE
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvYm9vdC5yc3QsIHNlY3Rpb24gIlByZS1NTVUgZXhlY3V0
aW9uIikuCj4gPgo+ID4gRk9SVElGWV9TT1VSQ0UgbXVzdCBiZSBkaXNhYmxlZCB0aGVuIHNpbmNl
IGl0IGNhbiB0cmlnZ2VyIGtlcm5lbCBwYW5pY3MKPiA+IGFzIHJlcG9ydGVkIGluIFsxXS4KPiA+
Cj4gPiBSZXBvcnRlZC1ieTogSmFzb24gTW9udGxlb24gPGptb250bGVvQHJlZGhhdC5jb20+Cj4g
PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBSkRfYlBKZXM0
UWhtWFk1ZjYzR0hWOUI5SEZrU0NvYVpqay1xQ1QyTkdTN1E5SE9EZ0BtYWlsLmdtYWlsLmNvbS8g
WzFdCj4gPiBGaXhlczogYTM1NzA3YzNkODUwICgicmlzY3Y6IGFkZCBtZW1vcnktdHlwZSBlcnJh
dGEgZm9yIFQtSGVhZCIpCj4gPiBGaXhlczogMjZlN2FhY2I4M2RmICgicmlzY3Y6IEFsbG93IHRv
IGRvd25ncmFkZSBwYWdpbmcgbW9kZSBmcm9tIHRoZSBjb21tYW5kIGxpbmUiKQo+ID4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPgo+IElzIHRoZSBwcm9ibGVtIGluIFsxXSBub3QganVz
dCB0aGF0IHRoZSBlYXJseSBib290IHBhdGggdXNlcyBtZW1jcHkgb24KPiB0aGUgcmVzdWx0IG9m
IEFMVF9PTERfUFRSLCB3aGljaCBpcyBhIHdpbGRseSBvdXQtb2YtYm91bmRzIHBvaW50ZXIgZnJv
bQo+IHRoZSBjb21waWxlcuKAmXMgcGVyc3BlY3RpdmU/IElmIHNvLCBpdCB3b3VsZCBzZWVtIGJl
dHRlciB0byB1c2UKPiB1bnNhZmVfbWVtY3B5IGZvciB0aGF0IG9uZSBjYWxsIHNpdGUgcmF0aGVy
IHRoYW4gdXNlIHRoZSBiaWcKPiBfX05PX0ZPUlRJRlkgaGFtbWVyLCBzdXJlbHk/Cj4KCkkgY2Fu
IGFkZCB0aGF0IHJlcGxhY2luZyBtZW1jcHkgd2l0aCB1bnNhZmVfbWVtY3B5IGRpZCBhbHNvIHdv
cmsgZm9yCm1lLiBPbmNlIGl0IHdhcyBuYXJyb3dlZCBkb3duLCB0aGlzIGlzIHdoYXQgSSBvcmln
aW5hbGx5IGRpZCBpbiBvcmRlcgp0byBib290LgoKSmFzb24KCj4gUHJlc3VtYWJseSB0aGUgbm9u
LWVhcmx5IHBhdGggaXMganVzdCBhcyBiYWQgdG8gdGhlIGNvbXBpbGVyLCBidXQgd29ya3MKPiBi
ZWNhdXNlIHBhdGNoX3RleHRfbm9zeW5jIGlzbuKAmXQgaW5zdHJ1bWVudGVkLCBzbyB0aGF0IHdv
dWxkIGp1c3QgYWxpZ24KPiB0aGUgdHdvLgo+Cj4gR2V0dGluZyB0aGUgaW1wbGVtZW50YXRpb24g
dG8gbm90IGJlIHNpbGVudCBvbiBmYWlsdXJlIGR1cmluZyBlYXJseQo+IGJvb3Qgd291bGQgYWxz
byBiZSBhIGdvb2QgaWRlYSwgYnV0IGl04oCZcyBzdXJlbHkgYmV0dGVyIHRvIGhhdmUKPiBGT1JU
SUZZX1NPVVJDRSBlbmFibGVkIHdpdGggbm8gb3V0cHV0IGZvciBwb3NpdGl2ZXMgdGhhbiBkaXNh
YmxlIHRoZQo+IGNoZWNraW5nIGluIHRoZSBmaXJzdCBwbGFjZSBhbmQgcmlzayB1bmNhdWdodCBj
b3JydXB0aW9uLgo+Cj4gSmVzcwo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
