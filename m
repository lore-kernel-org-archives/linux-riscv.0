Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C304C369B2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWqaVUVMM1A+fEmVauV7keYUkjfXdzwHOS5RLC1pouw=; b=m1Kv9CRpTlPEHO
	8A0Te0QhUOsroiWNuXXiWi4RYBsICtCgpvf5QILlb5rOqS2rkO42ETNPqdebiVilkeNk5LqYASSH3
	tAONDhcBiHJulgYIRR92Bjtsz2PCDrNfPjuAoU6iAiWqcJvtKcYMWcNCzdkaB17mxLPX07kBW9lZV
	fB3gveUxvShSyJusBlU2HnvdMcBko3B6bmrdD/Q9HcY8+0zkBDOS8a+BoKc/QWGlMbJ3cLHvCqSsS
	wT3+DAWVnuzcIodJ5ih9RttTM96XizdxSJDmifJ41yseVNbFH6EKILRoFXjy52DhdiP04UxAzQavd
	0X1wn/KDCcdQ0kCPVOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Kxy-0000000CKyF-2fus;
	Thu, 17 Apr 2025 08:51:26 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Kpl-0000000CJ96-27TK
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 08:42:59 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e7040987879so541742276.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 01:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744879376; x=1745484176; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyDG2C1fOJ7sS+KyT/XBqXKFbi/J2aTw+uyXNBnFAdg=;
        b=eF1vdPf+IRHmyHIBSy9jLjE6Eon/mVHpTRFQRnGt5/PDJKWlwlkv8+99bdt2D1uTq/
         C/B3T1itDrsjRi2lUYKq+QqrN3l7qK53Xl0BLw2ig/icOSn6t5vnYc933swvma3Il82C
         E5Ke5X89xwfvJlnImscJKb538aA8vpOMmxX7AJ5QdnsOxywBvuLsyZYcrsal6C6/8K6w
         gPfXWp9YO7jr4p7ZnrrGp/U2uHCW/A9S8kPipyDtlt+rRxr4Hu2m01/AwxgPbwHsGj6N
         vZdd98qJ5ATJT0UjlpSQQG25u//ku17UqSVyvF3NFPXiVZIaLCChItRl7s9JDhonTURl
         I/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879376; x=1745484176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyDG2C1fOJ7sS+KyT/XBqXKFbi/J2aTw+uyXNBnFAdg=;
        b=k3b53DUk6GZSq1kYNCcFlHKAIA14PY+jbfZWvvT3CnW937tNMfta4EJh5wOgNHWzCK
         yg8d0ZAriQjBm/sNHTvTSnloW+5ciW+TkJBmvcYloSBSfnOHc7zFhCHZk8kEftY5nPUM
         UL3TNc9kRVps03/5QNukNqiKzJwcSbP08e/pvhGr2qGhdDt1Zrk1oHGUVmu3XK4TnchE
         6Cc75BdphqauU1f2oJoWfUralVoJzh7Ldzb5VslXjZksDApuJ0nhwYkYT6mSYTshTZIt
         ngtiQ3c4T9NsG666ol0tc9aJjhecYqgcXi2MfyV31ns+l28EhhE/JmNVD0SkhhjXWjvg
         1O5w==
X-Forwarded-Encrypted: i=1; AJvYcCWmVASToc7rmnsB2cSvumziGQdqKZQvVTtzi88XUkJXbO2e88ZO8LKa63Aglk1/+TBzcTKOru9f3BADsw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo5QTugkMa6SnNIhSij4+uDb0lHVlxvGmnI7u8Ihh7Grcmv3+x
	f1655bzme5flI6nSfvpz+a6LTFRhVD5dpt84naZROugjggySa8EFj7bMp11xWKvXLUBABsjpaMJ
	wMzklb4zq3FDDuRfMtCf+a2/xIlE=
X-Gm-Gg: ASbGncui6MYFR8/40PwdTfpzeXaYhbvJDHtceMS8cevB/Y15c6gfRSR1ihqia5MVGw2
	iktg7weW8zEgiJri2qBX72ASnPf8cgiWKQ56aW0dbozf8IRDvSWyO7G436A5KoZhoPsTKgqiIOC
	MQ4GyznorAH0MitL44yGRtjYomjZYgXFxaUjkhCw==
X-Google-Smtp-Source: AGHT+IEMDK/SY2xCkPcdfnpadxE5dUl1bSX3/cSEvi6KsT9DeYcFnhL4p/6HqW2SE4cLabXs0QINa9JISpmITtGKnHg=
X-Received: by 2002:a05:6902:2b8a:b0:e58:3209:bdb6 with SMTP id
 3f1490d57ef6-e7275967363mr6403514276.16.1744879376263; Thu, 17 Apr 2025
 01:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250417064940.68469-1-dqfext@gmail.com> <CAMj1kXFPAVXOtPoETKvHB49kjZUPYrsAqsJwdL7p5Cu4xk75Rg@mail.gmail.com>
 <CALW65jY=LnVBYoKPOQnSKgGSA0brKzmo0vqoRDcqF_=jofLAng@mail.gmail.com> <CAMj1kXH-u7hiKGQfgYHj_16V4ATN_aHmA_wkvMSyLh+E3+QaAA@mail.gmail.com>
In-Reply-To: <CAMj1kXH-u7hiKGQfgYHj_16V4ATN_aHmA_wkvMSyLh+E3+QaAA@mail.gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 17 Apr 2025 16:42:46 +0800
X-Gm-Features: ATxdqUGF5I5enMnn55N96efB0kMcC0Ath0bpVVj7yzS5lSH1IQrB6kbXGiv0Iic
Message-ID: <CALW65jZVYUZoka7Gbjcoh43qbkD7rGpw8gTZjjOYpZD-BhLyBQ@mail.gmail.com>
Subject: Re: [RFC PATCH] crypto: riscv: scalar accelerated GHASH
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-crypto@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Qingfang Deng <qingfang.deng@siflower.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_014257_541760_F798BC0C 
X-CRM114-Status: GOOD (  23.22  )
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

T24gVGh1LCBBcHIgMTcsIDIwMjUgYXQgMzo1OOKAr1BNIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBXaGF0IGlzIHRoZSB1c2UgY2FzZSBmb3IgdGhp
cz8gQUlVSSwgdGhlIHNjYWxhciBBRVMgaW5zdHJ1Y3Rpb25zIHdlcmUKPiA+ID4gbmV2ZXIgaW1w
bGVtZW50ZWQgYnkgYW55b25lLCBzbyBob3cgZG8geW91IGV4cGVjdCB0aGlzIHRvIGJlIHVzZWQg
aW4KPiA+ID4gcHJhY3RpY2U/Cj4gPgo+ID4gVGhlIHVzZSBjYXNlIF9pc18gQUVTLUdDTSwgYXMg
eW91IG1lbnRpb25lZC4gV2l0aG91dCB0aGlzLCBjb21wdXRpbmcKPiA+IEdIQVNIIGNhbiB0YWtl
IGEgY29uc2lkZXJhYmxlIGFtb3VudCBvZiBDUFUgdGltZSAobW9uaXRvcmVkIGJ5IHBlcmYpLgo+
ID4KPgo+IEkgc2VlLiBCdXQgZG8geW91IGhhdmUgYSBwYXJ0aWN1bGFyIGNvbmZpZ3VyYXRpb24g
aW4gbWluZD8gRG9lcyBpdAo+IGhhdmUgc2NhbGFyIEFFUyB0b28/IEkgbG9va2VkIGludG8gdGhh
dCBhIHdoaWxlIGFnbyBidXQgSSB3YXMgdG9sZAo+IHRoYXQgbm9ib2R5IGFjdHVhbGx5IGluY29y
cG9yYXRlcyB0aGF0LiBTbyB3aGF0IGFib3V0IHRoZXNlCj4gZXh0ZW5zaW9ucz8gQXJlIHRoZXkg
Y29tbW9ubHkgaW1wbGVtZW50ZWQ/CgpJdCdzIGFlcy1nZW5lcmljLmMgKExVVC1iYXNlZCkgd2l0
aCBhY2NlbGVyYXRlZCBHSEFTSC4KCj4KPiBbMF0gaHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FyZGIvbGludXguZ2l0L2xvZy8/aD1yaXNjdi1zY2Fs
YXItYWVzCj4KPiA+ID4gLi4uCj4gPiA+ID4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgX191aW50
MTI4X3QgZ2V0X3VuYWxpZ25lZF9iZTEyOChjb25zdCB1OCAqcCkKPiA+ID4gPiArewo+ID4gPiA+
ICsgICAgICAgX191aW50MTI4X3QgdmFsOwo+ID4gPiA+ICsjaWZkZWYgQ09ORklHX0hBVkVfRUZG
SUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MKPiA+ID4KPiA+ID4gQ09ORklHX0hBVkVfRUZGSUNJRU5U
X1VOQUxJR05FRF9BQ0NFU1MgbWVhbnMgdGhhdCBnZXRfdW5hbGlnbmVkX3h4eCgpCj4gPiA+IGhl
bHBlcnMgYXJlIGNoZWFwLiBDYXN0aW5nIGEgdm9pZCogdG8gYW4gYWxpZ25lZCB0eXBlIGlzIHN0
aWxsIFVCIGFzCj4gPiA+IHBlciB0aGUgQyBzdGFuZGFyZC4KPiA+Cj4gPiBUZWNobmljYWxseSBh
biB1bmFsaWduZWQgYWNjZXNzIGlzIFVCIGJ1dCB0aGlzIHBhdHRlcm4gaXMgd2lkZWx5IHVzZWQK
PiA+IGluIG5ldHdvcmtpbmcgY29kZS4KPiA+Cj4KPiBPZiBjb3Vyc2UuIEJ1dCB0aGF0IGlzIG5v
IHJlYXNvbiB0byBrZWVwIGRvaW5nIGl0Lgo+Cj4gPiA+Cj4gPiA+IFNvIGJldHRlciB0byBkcm9w
IHRoZSAjaWZkZWYgZW50aXJlbHksIGFuZCBqdXN0IHVzZSB0aGUKPiA+ID4gZ2V0X3VuYWxpZ25l
ZF9iZTY0KCkgaGVscGVycyBmb3IgYm90aCBjYXNlcy4KPiA+Cj4gPiBDdXJyZW50bHkgdGhvc2Ug
aGVscGVycyB3b24ndCBnZW5lcmF0ZSByZXY4IGluc3RydWN0aW9ucywgZXZlbiBpZgo+ID4gSEFW
RV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyBhbmQgUklTQ1ZfSVNBX1pCQiBpcyBzZXQsIHNv
IEkgaGF2ZSB0bwo+ID4gaW1wbGVtZW50IG15IG93biB2ZXJzaW9uIG9mIHRoaXMgdG8gcmVkdWNl
IHRoZSBudW1iZXIgb2YgaW5zdHJ1Y3Rpb25zLAo+ID4gYW5kIHRvIGFsaWduIHdpdGggdGhlIG9y
aWdpbmFsIE9wZW5TU0wgaW1wbGVtZW50YXRpb24uCj4gPgo+Cj4gU28gZml4IHRoZSBoZWxwZXJz
LgoKVGhlIGlzc3VlIGlzIHRoYXQgUklTQy1WIEdDQyBkb2VzbuKAmXQgZW1pdCBlZmZpY2llbnQg
dW5hbGlnbmVkIGxvYWRzIGJ5IGRlZmF1bHQ6Ci0gTm90IGFsbCBSSVNDLVYgQ1BVcyBzdXBwb3J0
IHVuYWxpZ25lZCBhY2Nlc3MgZWZmaWNpZW50bHksIHNvIEdDQwpmYWxscyBiYWNrIHRvIGNvbnNl
cnZhdGl2ZSBieXRlLXdpc2UgY29kZS4KLSBUaGVyZeKAmXMgbm8gY2xlYW4gd2F5IHRvIGZvcmNl
IHRoZSBvcHRpbWl6ZWQgcGF0aCAtIEdDQyBvbmx5IGVtaXRzCmZhc3QgdW5hbGlnbmVkIGxvYWRz
IGlmIHR1bmVkIGZvciBhIHNwZWNpZmljIENQVSAoZS5nLiwgLW10dW5lPXNpemUgb3IKLW10dW5l
PXRoZWFkLWM5MDYpLCB3aGljaCB0aGUga2VybmVsIGRvZXNuJ3QgdHlwaWNhbGx5IGRvLCBldmVu
IHdpdGgKSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUy4KCk1heWJlIHdlIHNob3VsZCBy
YWlzZSB0aGlzIHdpdGggdGhlIEdDQyBtYWludGFpbmVycy4gQW4gZXhwbGljaXQKb3B0aW9uIHRv
IGVuYWJsZSBvcHRpbWl6ZWQgdW5hbGlnbmVkIGFjY2VzcyBjb3VsZCBoZWxwLgoKQXMgZm9yIHJl
djgsIHRoZXJlJ3MgYSBwYXRjaCBwZW5kaW5nIHRvIGltcGxlbWVudCB0aGUgc3dhYiBtYWNyb3Mu
CgotLSBRaW5nZmFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
