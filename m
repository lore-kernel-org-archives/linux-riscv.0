Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C12CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 07:00:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA09B611C0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 07:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA09B611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1Xu8tI39gYDJTM64tHMCerZo6j2d9rZjvSdxXdWDTo=; b=1nqC2dPgyKxWBY
	WR0b/yYMC/zFWbfJ4zydBCinMcp8kpxG4IxTBAz0NFjWRVhQH4ENKBmFB3zDno7FF7+dz/TM+Xg2p
	AN3HFPMvIDD4mXkf6taIdzGa2Iga1K2KL+E+NtBkuNdP9h7nnPxrA4yaMtDmGVBnIcV8wcFqM1cHo
	62pJgxkfzCwKC+LlYzUj7AIzd5Mjh1UdOTLvMmPb9aQJT/aXCXCs5qBWKCUxnYKcxYoVtBreZG46o
	MewzNsmunU1cHj82h0C6UWzKm006yeKH5BJPIW1Iy6Kixjg+5FGFfOdQiUqYe60LgHMUhasc27ezd
	Ekcx1kDcp14dnFgzjoRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV76M-005vzk-Dg; Tue, 28 Sep 2021 07:00:30 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV76J-005vyu-Kk
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 07:00:28 +0000
Received: by mail-qv1-xf32.google.com with SMTP id gs10so12775822qvb.13
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 00:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V0EGJN/P+LEExA8lxyMUxikBR1Id3NZT+DE5wAoythM=;
 b=hryktab/XlTDjnX/RTsksGopECHlU5gDiEZD481ZLXdYdRS70v2d/wnQP4Zn7kQiDe
 Ume9S3tWTnLJpGTxkUIMhUz/JBeTxurjJ/yyFswgE1Yp7w8RsfmbOT3CzgqoRakwTVpm
 u3hLZObKr+OmaYw8OqAvWsKe9VG0pBXx8uC3HET+/j5g3TaTnXk1V0b1fydku6uVSN08
 LRBrZyNU9Yeo2bse6NqgSCpmnetl+cwLVWv3huyJ/AojEvE75TyobMDYTadGMzG0QcZO
 0UeZx1sfWr+l1laXPoXy5VBMZVHl+dhLJEtatg5wMpifMHIdpZf7mJWGNRenyOgo9Kd/
 xaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V0EGJN/P+LEExA8lxyMUxikBR1Id3NZT+DE5wAoythM=;
 b=yAGlqlTX8hWjy8aUFTMYW51lb1BmyacBB/P2meena3OiRmfslXf44F/hhvY3ytO5ed
 4U/NPdtMxsl2CbpgZchiy2sb8joRdvHVfK8+bdod4c0n5Nrp82KK+BoGQ9HuN1XGVs34
 WGyoEdD4KfJri2PwML06lVXdvUwQdFDTzn6v5emIQytdUWj0+gPdZshjjpWHncGiNYK7
 rgwvm4pkEG+97B22+GSKTYK0465YF2hpEjmEusXYpZclr5DNlzPhC+mf0vHRFySbecXK
 61veouk+uB7uNzP3Vy7LpGoKvxV0gDpBpeLpP1l8QpgtV8fS6cyghmbVSP0e5LUNQdQs
 gzaA==
X-Gm-Message-State: AOAM53167YDVCI5KLlWf6/7M82VmLkMHOPO6KZ2D4+/CzfttR0Bi0rbE
 WNu0Kk2nHIL0GOJLHm703a9Y3dIcPjauzu+w1jAlnQ==
X-Google-Smtp-Source: ABdhPJxZhSy+lG5/Tv6o946/6YeaHkiCTMHaj6JpGttJV5xrX9Eu2pOL5tpLcLIkNFGlo1wM4UoPSfGw3mH7Z7BKxqI=
X-Received: by 2002:a05:6214:13a6:: with SMTP id
 h6mr3959597qvz.50.1632812423030; 
 Tue, 28 Sep 2021 00:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631121222.git.greentime.hu@sifive.com>
 <33c485ee595aff1e19a0e43074da59779f58d105.1631121222.git.greentime.hu@sifive.com>
 <YTmlwTlSX94tltyV@infradead.org>
In-Reply-To: <YTmlwTlSX94tltyV@infradead.org>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Tue, 28 Sep 2021 15:00:11 +0800
Message-ID: <CAHCEehK_zE9PqnxBJpupZ0P+Bx=8L6ydrMDjxfCD5FBbSi=sOw@mail.gmail.com>
Subject: Re: [RFC PATCH v8 15/21] riscv: Add vector extension XOR
 implementation
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_000027_708884_5260A389 
X-CRM114-Status: GOOD (  11.41  )
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

Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiDmlrwgMjAyMeW5tDnmnIg55pel
IOmAseWbmyDkuIvljYgyOjEy5a+r6YGT77yaCj4KPiBPbiBUaHUsIFNlcCAwOSwgMjAyMSBhdCAw
MTo0NToyN0FNICswODAwLCBHcmVlbnRpbWUgSHUgd3JvdGU6Cj4gPiArZXh0ZXJuIHZvaWQgeG9y
X3JlZ3NfMl8odW5zaWduZWQgbG9uZyBieXRlcywgdW5zaWduZWQgbG9uZyAqcDEsCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAqcDIpOwo+ID4gK2V4dGVybiB2b2lkIHhv
cl9yZWdzXzNfKHVuc2lnbmVkIGxvbmcgYnl0ZXMsIHVuc2lnbmVkIGxvbmcgKnAxLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKnAyLCB1bnNpZ25lZCBsb25nICpwMyk7
Cj4gPiArZXh0ZXJuIHZvaWQgeG9yX3JlZ3NfNF8odW5zaWduZWQgbG9uZyBieXRlcywgdW5zaWdu
ZWQgbG9uZyAqcDEsCj4gPiArICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAqcDIs
IHVuc2lnbmVkIGxvbmcgKnAzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgKnA0KTsKPiA+ICtleHRlcm4gdm9pZCB4b3JfcmVnc181Xyh1bnNpZ25lZCBsb25nIGJ5dGVz
LCB1bnNpZ25lZCBsb25nICpwMSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nICpwMiwgdW5zaWduZWQgbG9uZyAqcDMsIHVuc2lnbmVkIGxvbmcgKnA0LAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKnA1KTsKPgo+IFRoZXJlIGlzIG5vIG5lZWQg
Zm9yIGV4dGVybnMgb24gZnVuY3Rpb24gZGVjbGFyYXRpb25zIGV2ZXIuCj4KT2ssIEknbGwgcmVt
b3ZlIGl0LgoKPiA+ICtzdGF0aWMgdm9pZCB4b3JfcnZ2XzIodW5zaWduZWQgbG9uZyBieXRlcywg
dW5zaWduZWQgbG9uZyAqcDEsIHVuc2lnbmVkIGxvbmcgKnAyKQo+ID4gK3sKPiA+ICsgICAgIGtl
cm5lbF9ydnZfYmVnaW4oKTsKPiA+ICsgICAgIHhvcl9yZWdzXzJfKGJ5dGVzLCBwMSwgcDIpOwo+
ID4gKyAgICAga2VybmVsX3J2dl9lbmQoKTsKPiA+ICt9Cj4KPiBUaGlzIGxvb2tzIHN0cmFuZ2Uu
ICBXaHkgdGhlc2Ugd3JhcHBlcnM/CgpXZSBkb24ndCB1c2UgcnZ2IGluIGtlcm5lbCBzcGFjZSBn
ZW5lcmFsbHkuIElmIHdlIHdhbnQgdG8gdXNlIGl0LCB3ZQpuZWVkIHRvIHNhdmUgYWxsIHZlY3Rv
ciByZWdpc3RlcnMgZmlyc3QuCkp1c3QgbGlrZSBhcm02NC94ODYgaW1wbGVtZW50YXRpb24gaW4K
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS94b3IuaAphcmNoL3g4Ni9pbmNsdWRlL2FzbS94b3IuaAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
