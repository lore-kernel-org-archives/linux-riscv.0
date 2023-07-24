Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FF4C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 17:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDuBChDJSkMaHtdkKw/EbzxnuJG6/anOmOPAiatUR9Y=; b=wCG+Ab/IzaDKHK
	PbFz1n3KyYwgJnXLvfSmXcSTl2bo7OSmtQipkQJQDR6Alx6cqYRLJ5t1hRs5yCv2EA4CP0JJUQq50
	bKbsFgRb7j/SgMdd3ko/A82b1j2guQ2bMKoXZT92W4jKSI2Ek3La5XE/v8abjValY8GBNmJtQkpqJ
	4NJg7enRbJtvYYdLllRUj0sTqj7YkFeAc3aIDSfnRcX7ueWYs/YT1pHzZSrHUNNXe9Tnaa4YDliQK
	n0AsJSaQTW16C/p8yDRfg0Y/z/2rCOoOboT1crRyjoo41AYBjWgs/X/XEkLLflSiqUdFIfjn9IrZv
	dbKC5VZ7FFb343NPLMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyyR-004xra-2m;
	Mon, 24 Jul 2023 17:03:55 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyyO-004xqz-2d
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 17:03:54 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-63d0228d32bso6766706d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690218230; x=1690823030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xTLp2+UW4g8FQgI9ZvYWnrpGeRvJJke/XOVP6Sg9EM=;
        b=gpGa803vBPmy3xYMimjz1WlnY7Ku62fvsR+af6BsD1aCsvvEdyNUhyEFAzJrRyMsJY
         xMOhN+GJss1b06bmFi8lbDVFE/+xx+KeC+coqXZ/v+nDkzoagfdirlZLzUbn0sZsb482
         Wtb0medJMSp8LsR7EyZUfCFH+eKjec+v2Iht6GL6RsBfppemdvxF2Ecu/GPespcXdVdt
         pKYCwJkArxhyu4vW3phBL4djFwcWk9zlaOKNfV0mHhXWN+x/FkqM2kjj3f2ZnBLCiUIZ
         u2jk4X9JG2YI2aBp9N0vZLTYmKvMSq2UaZv6gaFYG2raxMYBAiy1x8jno8l+/Jje17Z8
         kBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690218230; x=1690823030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xTLp2+UW4g8FQgI9ZvYWnrpGeRvJJke/XOVP6Sg9EM=;
        b=kkhX255GQ9ooPSxSvR9D/D2e8BZp+O4/QyALyHehPWYVt91WjN6o/a9H8+llj3QBsK
         BWmRKtGxVygE99QxdtOdSHLm82JPGBh1mr/INCE4TamQwGnbuGv9TJLld9lwZDe7A1a7
         gQyIOpSl1eQZOHu3x7mnoyyfZhU5onAyPgBBOFUrNUKVsA6r8bCwuL5P1kuH1kClGyqe
         BUGrsTJNzAcJ8IJD+M2W8CdzzN/dP+YmoJATMROHi5S245FtapqL1FPC7ULJAy1Wtk4G
         eqskZwOu1I+E9Bs45EStGm/o94ANZ+9VnSgBoIbVb9FLdNe+Rv1frHVviSBhTp0q6reg
         E+xg==
X-Gm-Message-State: ABy/qLZuEcE+DrPkkp0o7xDsIV+/n29Ex58tVDZkNY7hy9/fLAf+Crn0
	0MzOCnh3o8RrxofMQE29CTQXAmU5xpf2UFHUr1Ht4g==
X-Google-Smtp-Source: APBJJlEnO5lejCzbyCaztVTOmKeDnXswtgvMcSvSSH9+fMOwbn/xmDGfc9PRT8MCPp3isU5yXTN/OJi7P19hPG7CgVs=
X-Received: by 2002:a0c:df0a:0:b0:635:e680:99b with SMTP id
 g10-20020a0cdf0a000000b00635e680099bmr364128qvl.36.1690218230579; Mon, 24 Jul
 2023 10:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221124094845.1907443-1-debug@rivosinc.com> <CAJF2gTT_-_Q2hQWWbt=CiUV4a3xq4Cw3s9A308KfTx0i55WSuw@mail.gmail.com>
In-Reply-To: <CAJF2gTT_-_Q2hQWWbt=CiUV4a3xq4Cw3s9A308KfTx0i55WSuw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 24 Jul 2023 10:03:14 -0700
Message-ID: <CABCJKufYj6E8WagP5GyB3M_=WfA4H0d=MMxX6+DQg0F8qjNTcQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: VMAP_STACK overflow detection thread-safe
To: Guo Ren <guoren@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>, palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_100352_856992_66D6B269 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgODoxMOKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDI0LCAyMDIyIGF0IDU6NDjigK9QTSBEZWVwYWsg
R3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiArLm1hY3JvIGFzbV9wZXJfY3B1
IGRzdCBzeW0gdG1wCj4gPiArICAgICAgIFJFR19MIFx0bXAsIFRBU0tfVElfQ1BVX05VTSh0cCkK
PiA+ICsgICAgICAgc2xsaSAgXHRtcCwgXHRtcCwgUEVSX0NQVV9PRkZTRVRfU0hJRlQKPiA+ICsg
ICAgICAgbGEgICAgXGRzdCwgX19wZXJfY3B1X29mZnNldAo+ID4gKyAgICAgICBhZGQgICBcZHN0
LCBcZHN0LCBcdG1wCj4gPiArICAgICAgIFJFR19MIFx0bXAsIDAoXGRzdCkKPiA+ICsgICAgICAg
bGEgICAgXGRzdCwgXHN5bQo+ID4gKyAgICAgICBhZGQgICBcZHN0LCBcZHN0LCBcdG1wCj4gPiAr
LmVuZG0KPiBJdCdzIGEgdHJpY2t5IGltcGxlbWVudGF0aW9uLCBhbmQgd2UgY2FuJ3QgbWFpbnRh
aW4gaXQgaGVyZSBiZWNhdXNlIGl0Cj4gZGVwZW5kcyBvbiBwZXJjcHUgZGVzaWduLgoKSSBjYW4g
Y2VydGFpbmx5IHVuZGVyc3RhbmQgdGhpcyBjb25jZXJuLCBidXQgQUZBSUNUIHRoaXMgcGFydCBv
ZiB0aGUKcGVyY3B1IGNvZGUgaGFzbid0IGNoYW5nZWQgaW4gfjE0IHllYXJzLCBzbyBhZGRpbmcg
YW4gYXNzZW1ibHkgbWFjcm8KZm9yIHRoZSBjb21wdXRhdGlvbiBzaG91bGRuJ3QgYmUgYSBodWdl
IG1haW50ZW5hbmNlIGJ1cmRlbi4gYXJtNjQgYWxzbwpwZXJmb3JtcyBhIHNpbWlsYXIgY29tcHV0
YXRpb24gaW4gYXNzZW1ibHkgKHN0YXJ0aW5nIHdpdGggY29tbWl0CjNkOGMxYTAxM2Q3OCkgYW5k
IEkgZG9uJ3Qgc2VlIHRoZWlyIGltcGxlbWVudGF0aW9uIG5lZWRpbmcgY29uc3RhbnQKbWFpbnRl
bmFuY2Ugc2luY2UgdGhlbi4KClNhbWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
