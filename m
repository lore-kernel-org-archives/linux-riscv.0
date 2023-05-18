Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE18BC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 02:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OP4s+5nLBGMwFp4clrZYwD2DPgm4lBRIK1crpfAuc0=; b=kfY4s4TCa8aQ6f
	v1GyFG24sJHrSMG1zqZ6hIyIfhCGZwwnVoNr24bmL6phgMPnsZe4p4qw2wKwYeoMddbpIkH2gPBoF
	i5duyDvWB/NYQ6pkzkrnWCz/UmGq2YD2TWHPsKQ5+msi9iuBVNSQWzLbsIhJL9sZP2Q2alxbW8XMR
	nSHr7LqXRACq4z+ir5BOsVlGOeFZ6RLw7mcPTPASoDiDVeNxK/+kQ7o1dAWKVGc8kKHDBcVQ/HwlG
	HtKh1xk36fhYk5C2SjtDdW0spkr+32rTsxYyf0VT3QF36KfcMbjbtljXXd326EN5EufznypS9B/ZZ
	d9O/V5Y/sD/9VkaLpvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzTZl-00BiPk-0d;
	Thu, 18 May 2023 02:41:09 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzTZh-00BiOA-21
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 02:41:07 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-510b7b6ef59so2738196a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 19:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684377662; x=1686969662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvuS+HgRZ1bspmBU6wiV8HHPPWVgSTK6mbF2J7r8elM=;
        b=OV2HjeTQRvOE28w3kuWvGeQTEcCRAnrKBo+JgGMQE0BdhKK7ThtnlCmTbUC4ExRGmz
         9hL2vMs9+tf4uP+9rteZ2zqamZn4fA+0NU4ZEjEDxE0ILBapwSDAH/iqgg+CjX4oXxkO
         ZcYl6q+UkXAHuvxgAqws/9POw+br1cIQIwOrDdZnhGm7S4Az7fxWg1SnQ1SkAoqfhBhi
         vZOrJix0+FPDsuq4R9iMn/OjsZiztgdSDcFDYfHfHIEWXBXN/YrEwDeLpq6oxy9SIGx8
         WP+RZFVRFLU0aBOloRjUG1P3JP3hQi35QGNjY6ql5X8kGn7jcWJafTp6DB235heOD2hq
         C6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684377662; x=1686969662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvuS+HgRZ1bspmBU6wiV8HHPPWVgSTK6mbF2J7r8elM=;
        b=NaVWuUeDEjUI8naaYVlZ5eTRArh97Mg9pYseIvHuXigH3+CZpYC8xMPt8ojd77jctF
         ojdTQleb9nvmcP5+uo5rHInL2fJmA8fjJ2ZyRkCs9kAmzDHLAicVP5Iam/QCmiaJcqou
         hEweX3LkdBPtTWp9uFjsTLmlnhPlq+BOssQwZLehKcx6Gn4GVEp2aaETyZnOYMkuLFfp
         /H9mkjjKB0YifiekMCX2IWt5u24aQtATKlLH4f581FAod88ZsqULyKKZ6AGH7jY0ct+B
         2+6dlX4Ugzb6SjZzeojaVhjAl1UCY+lFTcJDp6sOqMl4r5AQA8FlSOkZPK6mU74obdNX
         3B+Q==
X-Gm-Message-State: AC+VfDwmQ0AFNZUMxzhoTpgq2X5NNr3pezTj2+rYCNDQHoErJXz/5Fnm
	nKVP6JueQmY+ORSR3HwqXcBBN+Nd/qzwTkGUq9U=
X-Google-Smtp-Source: ACHHUZ74N3y/birfKsUf7wOYJMDB/xrv32vrcZZh8zmds+Zi++oTNcW+fxRnXwEJOzpqehXkuoPfOCUAP0kwf7p4xWQ=
X-Received: by 2002:a50:ef04:0:b0:510:47a3:e775 with SMTP id
 m4-20020a50ef04000000b0051047a3e775mr3731713eds.41.1684377661551; Wed, 17 May
 2023 19:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230517034510.15639-1-zegao@tencent.com> <20230517034510.15639-2-zegao@tencent.com>
 <20230517205947.c1710ed175519b59f56e09b1@kernel.org>
In-Reply-To: <20230517205947.c1710ed175519b59f56e09b1@kernel.org>
From: Ze Gao <zegao2021@gmail.com>
Date: Thu, 18 May 2023 10:40:49 +0800
Message-ID: <CAD8CoPCBKyADGuUAaR6E-aO4wyy1LnCaBhuxoKz3nrTvPdHLYA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] rethook: use preempt_{disable, enable}_notrace in rethook_trampoline_handler
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Ze Gao <zegao@tencent.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_194105_689908_61A695E9 
X-CRM114-Status: GOOD (  21.42  )
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

R3JlYXQsIHRoYW5rcyEKClJlZ2FyZHMsClplCgpPbiBXZWQsIE1heSAxNywgMjAyMyBhdCA3OjU5
4oCvUE0gTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBI
aSBaZSBHYW8sCj4KPiBPbiBXZWQsIDE3IE1heSAyMDIzIDExOjQ1OjA2ICswODAwCj4gWmUgR2Fv
IDx6ZWdhbzIwMjFAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gVGhpcyBwYXRjaCByZXBsYWNlcyBw
cmVlbXB0X3tkaXNhYmxlLCBlbmFibGV9IHdpdGggaXRzIGNvcnJlc3BvbmRpbmcKPiA+IG5vdHJh
Y2UgdmVyc2lvbiBpbiByZXRob29rX3RyYW1wb2xpbmVfaGFuZGxlciBzbyBubyB3b3JyaWVzIGFi
b3V0IHN0YWNrCj4gPiByZWN1cnNpb24gb3Igb3ZlcmZsb3cgaW50cm9kdWNlZCBieSBwcmVlbXB0
X2NvdW50X3thZGQsIHN1Yn0gdW5kZXIKPiA+IGZwcm9iZSArIHJldGhvb2sgY29udGV4dC4KPiA+
Cj4gPiBGaXhlczogNTRlY2JlNmYxZWQ1ICgicmV0aG9vazogQWRkIGEgZ2VuZXJpYyByZXR1cm4g
aG9vayIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBaZSBHYW8gPHplZ2FvQHRlbmNlbnQuY29tPgo+ID4g
QWNrZWQtYnk6IE1hc2FtaSBIaXJhbWF0c3UgKEdvb2dsZSkgPG1oaXJhbWF0QGtlcm5lbC5vcmc+
Cj4gPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC10cmFjZS1rZXJuZWwvMjAyMzA1MTYwNzE4MzAuODE5MC0yLXplZ2Fv
QHRlbmNlbnQuY29tCj4KPiBOb3RlIHRoYXQgeW91IGRvbid0IG5lZWQgdG8gYWRkIExpbmsgdGFn
IG9mIHRoZSBwcmV2aW91cyB2ZXJzaW9uIGZvciBlYWNoIHBhdGNoLgo+IEknbGwgYWRkIGl0IHdo
ZW4gSSBwaWNrIGl0IDopCj4KPiBUaGFuayB5b3UsCj4KPiA+IC0tLQo+ID4gIGtlcm5lbC90cmFj
ZS9yZXRob29rLmMgfCA0ICsrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9rZXJuZWwvdHJhY2UvcmV0aG9v
ay5jIGIva2VybmVsL3RyYWNlL3JldGhvb2suYwo+ID4gaW5kZXggMzJjM2RmZGI0ZDZhLi42MGY2
Y2IyYjQ4NmIgMTAwNjQ0Cj4gPiAtLS0gYS9rZXJuZWwvdHJhY2UvcmV0aG9vay5jCj4gPiArKysg
Yi9rZXJuZWwvdHJhY2UvcmV0aG9vay5jCj4gPiBAQCAtMjg4LDcgKzI4OCw3IEBAIHVuc2lnbmVk
IGxvbmcgcmV0aG9va190cmFtcG9saW5lX2hhbmRsZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCj4g
PiAgICAgICAgKiBUaGVzZSBsb29wcyBtdXN0IGJlIHByb3RlY3RlZCBmcm9tIHJldGhvb2tfZnJl
ZV9yY3UoKSBiZWNhdXNlIHRob3NlCj4gPiAgICAgICAgKiBhcmUgYWNjZXNzaW5nICdyaG4tPnJl
dGhvb2snLgo+ID4gICAgICAgICovCj4gPiAtICAgICBwcmVlbXB0X2Rpc2FibGUoKTsKPiA+ICsg
ICAgIHByZWVtcHRfZGlzYWJsZV9ub3RyYWNlKCk7Cj4gPgo+ID4gICAgICAgLyoKPiA+ICAgICAg
ICAqIFJ1biB0aGUgaGFuZGxlciBvbiB0aGUgc2hhZG93IHN0YWNrLiBEbyBub3QgdW5saW5rIHRo
ZSBsaXN0IGhlcmUgYmVjYXVzZQo+ID4gQEAgLTMyMSw3ICszMjEsNyBAQCB1bnNpZ25lZCBsb25n
IHJldGhvb2tfdHJhbXBvbGluZV9oYW5kbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+ID4gICAg
ICAgICAgICAgICBmaXJzdCA9IGZpcnN0LT5uZXh0Owo+ID4gICAgICAgICAgICAgICByZXRob29r
X3JlY3ljbGUocmhuKTsKPiA+ICAgICAgIH0KPiA+IC0gICAgIHByZWVtcHRfZW5hYmxlKCk7Cj4g
PiArICAgICBwcmVlbXB0X2VuYWJsZV9ub3RyYWNlKCk7Cj4gPgo+ID4gICAgICAgcmV0dXJuIGNv
cnJlY3RfcmV0X2FkZHI7Cj4gPiAgfQo+ID4gLS0KPiA+IDIuNDAuMQo+ID4KPgo+Cj4gLS0KPiBN
YXNhbWkgSGlyYW1hdHN1IChHb29nbGUpIDxtaGlyYW1hdEBrZXJuZWwub3JnPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
