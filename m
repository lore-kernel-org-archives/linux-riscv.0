Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA17C2A06C
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 13:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVXZCbzeeI9Z5C6Mwkz+QvUqrmvLCmlg/+us+7xiFpE=; b=ESW1s20hPndjvn
	DkHngmsFXNIZBJOB3Ta1GG3qisQsp0HphOP3i0PSOhpK1IJXVfg76BXDEsazc0jGn9nWuB4nyYcFR
	6sYw0z9mkywT5hoQ9s4AxDaJrmyD7gBJUAKXsUQlv2587btnIFlj9hpazPsml7nU3Wpg9gU9N6NFr
	1qPnZd6ncnl56Ffo4RObEFz1qsV6NAADeGVI3Tb+fMdKdGZgGJr6rI+xQgNAPfCYZqeKABvt6W1PG
	/8bxp9/oRsm1SFb7HZISs31b2uel1D/4ShLdUvSsWhURP4KIX2f5yIvPctr6FNdKAoeB5Yra12VfH
	cdPJR6Sbps/SU9WggACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcNs6-0000000AFGw-1tcE;
	Sun, 04 Jan 2026 13:10:14 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcNs4-0000000AFGC-0o5J
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 13:10:13 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-657509d761dso7280230eaf.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Jan 2026 05:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767532211; x=1768137011; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTI7TMS20QjRHAXZJ9bbtMAI7NpsUCUKEERUcBbxFDM=;
        b=0O0ch2kLiK4wIXF0pnTThfzVClSe+IB9w9OIdVwqht5tKuVEQSH4b34Rw8d9dNW6rr
         O8GnAr0+ERTxAo7Bct/wGmopb9jV7oqu/NzvDUS8PGjgCu6xNNB4eXcfNmEfEr3+kS4k
         vntaVx2iuEk237BqpNR/xxy2Oihif5NktdldBGY07uX0lkJq09rVW62ELDwLSr5n6Mcx
         EEIj/LExhCw/1vzJc9vY+tqfK+4vA9KLF1ge5UDT2WUNxpKj/Vi48x+Gdfibk2AZVDZR
         Td45DNazR23XhdKBk7623Ib3hKJE43F4y+2B5GgGcs42obwoZslTfr4SrxcG+z5vjRYr
         K0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767532211; x=1768137011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LTI7TMS20QjRHAXZJ9bbtMAI7NpsUCUKEERUcBbxFDM=;
        b=FHMzKak21lKoX2HrCqIloOjIO89ulppmPWiZOqc9DXbfzs7KvCoFSuCUn+xp1550Q7
         pZgO6JLmTzsGsYNaSzDZTC01Uvrl9nZ1kYTmhbaAGsUH1iUF4iOvi5iyP226tHSkg2LH
         IROQePZ3usP5yKAhr/2THBGvpRr8innLzmJP3DOqJ3QGzCoeIR0KYGhl3jTk4nfupH3Y
         VN+TCpQyr8ZIN2sta8susneAVhXMQ4cVVL9lk04Lgge7mzDHcA1MLZm4hfRGUZ0QsqJn
         Qs5KZubbYvWMulZ7XQGc0fbRdWseB8dXrmPKA97DtBNJAfPRAeGequHNTp6z1yVm1Kxh
         BkLA==
X-Forwarded-Encrypted: i=1; AJvYcCUINslGQC7/CkuGL0u3kmWnOQ0L/tSmK02At9L1kkxsrhgc6rLO1/GU1F8hmq4bUnCic4PnjP264YMzYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNkT9TBCKtkrQ5KA3Wg0qp9KcFZ0bVakeUFRYrF9yfZ3wzCYs9
	hNRbGvBcuz0e+OnwN8jA898DfTtHxn6uWNfHUqBXu8VCUEl2pjZRLcdipwcmQbNhX0vhJ/Srjcz
	Wb3gOM62p9Bd6kr7j25j552pt13pN6idp9aY/nqb1Tw==
X-Gm-Gg: AY/fxX5SeroUEmJPTGU8mlf5VckPtPnFNLQs2Q6gmxP92mKU8PMdjvPDHJtA6pj3nEm
	X2RRf4f+S868BjA8FaU8Rt0n5opH0WLuFd2l0NyLwSquY/WVNIQgv9M1b8PG5OFTJOEuuOAQGAw
	eXGtpKwWEg6N08bDK2n9Bw0DUTDTpDobEfdr79tHwTlGDFKTOI/WID36x2pMa1orb54TZSxZx6v
	K8ZR12+5de2K1uwMhB6IHGsfPeAx9vUnmEpuqhsBLrPNQ2OcVhLEV/ykBlso4bXM+zUkmtnTHdH
	XMQZL8mW4LfTB2LbRoy6A7uWMoZSM45uAnfM3HvDHJ0/CVIJcj+pv7/HEw==
X-Google-Smtp-Source: AGHT+IE3xDi6i40mJyQzdIdSqb0qTJtsVm5MzXMVUO8Fr9GrH5N6OhzSxOH6UG8kwIyyXxEmLzYaQhs3RjFu22Jg0rU=
X-Received: by 2002:a05:6820:c004:b0:659:9a49:8f9c with SMTP id
 006d021491bc7-65d0ea4762emr13042068eaf.21.1767532210832; Sun, 04 Jan 2026
 05:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20260103152400.552-1-naohiko.shimizu@gmail.com> <20260103152400.552-2-naohiko.shimizu@gmail.com>
In-Reply-To: <20260103152400.552-2-naohiko.shimizu@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 4 Jan 2026 18:39:59 +0530
X-Gm-Features: AQt7F2pSg9HuUMgDzNHCV2MnkSXVSFXAakgKYkF8cMM6-UVu47ouVvHzBZEBtZE
Message-ID: <CAAhSdy1soLCbDW43otanoiXRSpx25eVSORXjaWk-oDKC7Bejsw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
To: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	atish.patra@linux.dev, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_051012_288129_80B308C2 
X-CRM114-Status: GOOD (  18.01  )
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

T24gU2F0LCBKYW4gMywgMjAyNiBhdCA4OjU04oCvUE0gTmFvaGlrbyBTaGltaXp1CjxuYW9oaWtv
LnNoaW1penVAZ21haWwuY29tPiB3cm90ZToKPgo+IFNpZ25lZC1vZmYtYnk6IE5hb2hpa28gU2hp
bWl6dSA8bmFvaGlrby5zaGltaXp1QGdtYWlsLmNvbT4KPgo+IHJpc2N2OiBmaXggdGltZXIgcmVn
aXN0ZXIgdXBkYXRlIGhhemFyZCBvbiBSVjMyCgpEcm9wIHRoaXMgbGluZSBzaW5jZSBpdCBsb29r
IHNpbWlsYXIgdG8gcGF0Y2ggc3ViamVjdC4KCj4KPiBPbiBSVjMyLCB1cGRhdGluZyB0aGUgNjQt
Yml0IHN0aW1lY21wIChvciB2c3RpbWVjbXApIENTUiByZXF1aXJlcyB0d28KPiBzZXBhcmF0ZSAz
Mi1iaXQgd3JpdGVzLiBBIHJhY2UgY29uZGl0aW9uIGV4aXN0cyBpZiB0aGUgdGltZXIgdHJpZ2dl
cnMKPiBkdXJpbmcgdGhlc2UgdHdvIHdyaXRlcy4KPgo+IFRoZSBSSVNDLVYgUHJpdmlsZWdlZCBT
cGVjaWZpY2F0aW9uIChlLmcuLCBTZWN0aW9uIDMuMi4xIGZvciBtdGltZWNtcCkKPiByZWNvbW1l
bmRzIGEgc3BlY2lmaWMgMy1zdGVwIHNlcXVlbmNlIHRvIGF2b2lkIHNwdXJpb3VzIGludGVycnVw
dHMKPiB3aGVuIHVwZGF0aW5nIDY0LWJpdCBjb21wYXJpc29uIHJlZ2lzdGVycyBvbiAzMi1iaXQg
c3lzdGVtczoKPgo+IDEuIFNldCB0aGUgbG93LW9yZGVyIGJpdHMgKHN0aW1lY21wKSB0byBhbGwg
b25lcyAoVUxPTkdfTUFYKS4KPiAyLiBTZXQgdGhlIGhpZ2gtb3JkZXIgYml0cyAoc3RpbWVjbXBo
KSB0byB0aGUgZGVzaXJlZCB2YWx1ZS4KPiAzLiBTZXQgdGhlIGxvdy1vcmRlciBiaXRzIChzdGlt
ZWNtcCkgdG8gdGhlIGRlc2lyZWQgdmFsdWUuCj4KPiBDdXJyZW50IGltcGxlbWVudGF0aW9uIHdy
aXRlcyB0aGUgTFNCIGZpcnN0IHdpdGhvdXQgZW5zdXJpbmcgYSBmdXR1cmUKPiB2YWx1ZSwgd2hp
Y2ggbWF5IGxlYWQgdG8gYSB0cmFuc2llbnQgc3RhdGUgd2hlcmUgdGhlIDY0LWJpdCBjb21wYXJp
c29uCj4gaXMgaW5jb3JyZWN0bHkgZXZhbHVhdGVkIGFzICJleHBpcmVkIiBieSB0aGUgaGFyZHdh
cmUuIFRoaXMgcmVzdWx0cyBpbgo+IHNwdXJpb3VzIHRpbWVyIGludGVycnVwdHMuCj4KPiBUaGlz
IHBhdGNoIGFkb3B0cyB0aGUgc3BlYy1yZWNvbW1lbmRlZCAzLXN0ZXAgc2VxdWVuY2UgdG8gZW5z
dXJlIHRoZQo+IGludGVybWVkaWF0ZSA2NC1iaXQgc3RhdGUgaXMgbmV2ZXIgc21hbGxlciB0aGFu
IHRoZSBjdXJyZW50IHRpbWUuCgpOZWVkIFNpZ25lZC1vZmYtYnkgYW5kIEZpeGVzIHRhZyBvdmVy
IGhlcmUgaW4gYWxsIHRocmVlIHBhdGNoZXMuCgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBkcml2
ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
bG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNj
di5jCj4gaW5kZXggNGQ3Y2YzMzg4MjRhLi5jZmM0ZDgzYzQyYzAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJj
ZS90aW1lci1yaXNjdi5jCj4gQEAgLTUwLDggKzUwLDkgQEAgc3RhdGljIGludCByaXNjdl9jbG9j
a19uZXh0X2V2ZW50KHVuc2lnbmVkIGxvbmcgZGVsdGEsCj4KPiAgICAgICAgIGlmIChzdGF0aWNf
YnJhbmNoX2xpa2VseSgmcmlzY3Zfc3N0Y19hdmFpbGFibGUpKSB7Cj4gICNpZiBkZWZpbmVkKENP
TkZJR18zMkJJVCkKPiAtICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUCwgbmV4
dF90dmFsICYgMHhGRkZGRkZGRik7Cj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJ
TUVDTVAsIFVMT05HX01BWCk7Cj4gICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVD
TVBILCBuZXh0X3R2YWwgPj4gMzIpOwo+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NU
SU1FQ01QLCBuZXh0X3R2YWwgJiAweEZGRkZGRkZGKTsKPiAgI2Vsc2UKPiAgICAgICAgICAgICAg
ICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUCwgbmV4dF90dmFsKTsKPiAgI2VuZGlmCj4gLS0KPiAy
LjM5LjUKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
