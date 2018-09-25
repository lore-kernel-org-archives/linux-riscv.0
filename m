Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C38AECE560
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 02:21:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E04220842
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 02:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nUqdAoEr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5IIXnst"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E04220842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/ybkP9XoV00oBjTIbW8V233TlX+U/DEyydiiCL+YJk=; b=nUqdAoErgwybSD
	to1I+WvEYWYVynCQvGs77+ImegyqJZ+U00IjTZodYj810ZUN8/8LLVGVgQMO6fu9sHx4XTNTPp5kw
	BPHTnW/u6Tu8YHFCqif+M2uy/LayYArJRCf3O917Kdhl/YYwTUoiWTwfAI7kO92GcLV/lJNmz27gz
	xtjvrCIimMJKqpqh0S7fZnCTA3+mxpegKrMWfzzy4rHM6tJlhHg9Fk/5uW/cFitdLx61niuNHlhIV
	GobbRruEDl2EwB5jp98YMo42mZ/AsTSLNqUFp/glSAsPaEAT6Q34UPyH+7eOwjM1cGEf/EeCai+5F
	vtemXm/X1iXnf3FUqXGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4cyH-0002MD-Vq; Tue, 25 Sep 2018 02:21:05 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4cxs-0001Q7-6G
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 02:20:44 +0000
Received: by mail-io1-xd42.google.com with SMTP id e12-v6so19225149iok.12
 for <linux-riscv@lists.infradead.org>; Mon, 24 Sep 2018 19:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ats3+gpwbZ5gzRUR6x1QFognv12Bup3QDkm7l/izQDE=;
 b=C5IIXnstkqMWL8n+UDcgE4W3LDFlLPyAk/KqIBISFWhKu21RNf4M6NvLz+WKFS/IQN
 CPJyxh+MJb4q89RpvUzpuBrqxJAfogtnreGy4MdIOFpSKVK9ztL+ticn4ur2uLAKTS7+
 mAusmeCupu6j1aPbYN9Jd/R0WGwlE6j0tmIjyXdEy+5awukMfYXrrBEUfYVRF9Mwi+mH
 0OsOzooKqZtT2lVjzSEflctKifs4oSBjU2fdTWVRxPyYg5FTprhOr1PszooQyzwg8Vgu
 vT+6i/n4GhEPk6vjILSv65ua52FDxCaKvAsy8mfdk4/MIrqB7pVOmRlD1ZT3HZNALR8P
 HIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ats3+gpwbZ5gzRUR6x1QFognv12Bup3QDkm7l/izQDE=;
 b=PaMx6eYBjFpQxZoRPwPFz9B1r1yTg6wFMJRtue/qjGXx+XCj8tkW25u5wW2pWYB2Sf
 SOUFobfTXvda0TwJpHa7OeCQLx9/+TwANtAJsacRa+PBlnQZxH+vobAiRmzKCmwcleaO
 cvYmb1R6cWpvL3NgU3FhG6ENu5lsQ0PpIrZ7JuU4fT0cJ6FEzs3t3g1gIVnxOTzmZdUn
 FqokzPaUVxxox3jPC/ksEAk/S9AxZ9LQFWiKx8CrCztbalDDK80sVfQhEZruLPcw4A/l
 iaG0x6yMpGl2p0+vrUBPSPjUe0+nUQDopO68lhulrsliKgEIBFnGox5gBf0f1iZIabFB
 0eng==
X-Gm-Message-State: ABuFfoiyKLZMVdgQo4D7wLpBMIOGYN5iPkmqNUaRuQuzrh5l1naJV8p/
 9bSVWl+FrIr37RiwsGnB6OzaEh44mDJ1KZAzz+E=
X-Google-Smtp-Source: ACcGV63uiDRlTWF/ppOFgTC7sAfwDqSWYeKMvIiW+0GDiBjKQsOEK2AuI1pH9mxhLmRQSj6hueyJL8PPJqi4BUhEFLI=
X-Received: by 2002:a6b:9ace:: with SMTP id
 c197-v6mr1348095ioe.63.1537842006814; 
 Mon, 24 Sep 2018 19:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1537260207.git.zongbox@gmail.com>
 <2ccc6c0758624dbb22f6fe451a3e476a000108ef.1537260207.git.zongbox@gmail.com>
 <20180921070006.GC8401@infradead.org>
In-Reply-To: <20180921070006.GC8401@infradead.org>
From: Zong Li <zongbox@gmail.com>
Date: Tue, 25 Sep 2018 10:19:55 +0800
Message-ID:
 <CA+ZOyaiJv-NZWk3ec_3zhRTSn7G-NGgyaiPTXOmuWfTWD7KSJw@mail.gmail.com>
Subject: Re: [PATCH 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
To: hch@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180924_192040_232705_206AD636 
X-CRM114-Status: GOOD (  10.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: zong@andestech.com, aou@eecs.berkeley.edu, palmer@sifive.com,
 linux-kernel@vger.kernel.org, vincentc@andestech.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925021955.tHUxKizqQDtTDQ9-0iwdL4fRc_t49DtswwegLeHr0jY@z>

Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiDmlrwgMjAxOOW5tDnmnIgyMeaX
pSDpgLHkupQg5LiL5Y2IMzowMOWvq+mBk++8mgo+Cj4gT24gVHVlLCBTZXAgMTgsIDIwMTggYXQg
MDU6MTk6MTVQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToKPiA+IEFkZCB1bW9kZGkzIGFuZCB1ZGl2
bW9kZGk0IHN1cHBvcnQgZm9yIDMyLWJpdC4KPgo+IFRoaXMgcHJvYmFibHkgd2FudHMgYSBiZXR0
ZXIgZXhwbGFuYXRpb24gb2Ygd2h5IHlvdSBuZWVkIHRoZW0uCj4KPiA+IGluZGV4IDAwMDAwMDAu
LjY5ZjJkMzYKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2xpYi91ZGl2bW9kZGk0LmMKPiA+
IEBAIC0wLDAgKzEsMjkxIEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAKPgo+IFdobyB3cm90ZSB0aGlzIGNvZGUsIHdoZXJlIGRvZXMgaXQgY29tZSBmcm9tPwoKVGhl
IFJWMzIgbmVlZCB0aGUgdW1vZGRpMyB0byBkbyBtb2R1bG8gd2hlbiB0aGUgb3BlcmFuZHMgYXJl
IGxvbmcgbG9uZwp0eXBlLCBsaWtlIG90aGVyIGxpYnJhcmllcyBpbXBsZW1lbnRhdGlvbiBzdWNo
IGFzIHVjbXBkaTIsIGxzaHJkaTMgYW5kCnNvIG9uLiBJIGVuY291bnRlciB0aGUgdW5kZWZpbmVk
IHJlZmVyZW5jZSAndW1vZGRpMycgd2hlbiBJIHVzZSB0aGUgaW4KaG91c2UgZG1hIGRyaXZlciwg
YWx0aG91Z2ggaXQgaXMgaW4gaG91c2UgZHJpdmVyLCBidXQgSSB0aGluayB0aGF0CnVtb2RkaTMg
aXMgYSBjb21tb24gZnVuY3Rpb24gZm9yIFJWMzIuIFRoZSB1ZGl2bW9kZGk0IGFuZCB1bW9kZGkz
IGFyZQpjb3BpZXMgZnJvbSBsaWJnY2MgaW4gZ2NjLiBUaGVyZSBhcmUgb3RoZXIgZnVuY3Rpb25z
IHVzZSB0aGUKdWRpdm1vZGRpNCBpbiBsaWJnY2MsIHNvIEkgc2VwYXJhdGUgdGhlIHVtb2RkaTMg
YW5kIHVkaXZtb2RkaTQgZm9yCmZsZXhpYmxlIGV4dGVuc2lvbiBpbiB0aGUgZnV0dXJlLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
