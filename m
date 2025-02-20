Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5366C021B2
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+br7T6/VntO7nHBR4WpVP2529+YN5EbbpjTGX3rz0eE=; b=ReyPsAdKuNIx+/
	oMccl+b4p/Hu1T6b0GZIR5k+k766/OY8dFict3mm0WECKCQM/gXpuMwmsI7LIY0nUg1+kqDq2MSct
	iY+0SRs1HwBRdXjpn3PkK/DXEEpKLE+5EU2rqfolpYoQO2S7tF6Y+caMlKoc3sGlsGim82JbXOTMa
	Au3kF9eN2DIZWfH1KY+cu/z/FOZeHcEOy8lgZYwCnhoQxGMy7BJg8Oikn57YpphA3JFuTRtwWq8St
	QikyVEcKd4JLXX+rg+hLVvvpY9UM3vRWCvgu9RjNuBy0s6bP4AAn9WH9Y4WnWJPlkuQiRiW6NriUV
	CxQtOVRLFJ6LgXEoUCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Rw-00000000jIk-3cE9;
	Thu, 20 Feb 2025 12:14:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Rt-00000000jGe-00KY
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 12:14:39 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38f3ac22948so436262f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 04:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740053675; x=1740658475; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hGUCY7fitgab0ytTT0Om1EzRQzqjeCpPDOFA2YcYuWg=;
        b=XZITDZdtb/koBlCcrch9UwedmXwIKgBDaL2Bt9UxUvxFUwWHatvafKTEh32ccLGk7g
         Mt5DYtfVIeC+rQtB93WvpLTPqwVOfqcOAHXfCBy9p6F++xtUaG8dDryTlu7C+J1/C1BU
         tnQyLyE250/7fF++B7dsSjyDN9jMqE7xbdtNCQ0g+TE7QhTtZnWYfJUZPR2B+yejkbPj
         pauKVNd9lFrv1RS0ySuOLJjH+JWKiSJ/bWCFcNZzoWSIt1c0E7ByLyi4zR92ae9+37GV
         dkUdruyrXqAUThIvafVEg0GVWZl7055HX6HF8yL5718OMfDhM6yesGAWhHZsxROB6M/R
         tKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740053675; x=1740658475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hGUCY7fitgab0ytTT0Om1EzRQzqjeCpPDOFA2YcYuWg=;
        b=A+l3UoqekiZg3qV/xbIskaEVPrkKyrftmK/nVf69d4VytAc31dB7ANIrMyzPSsjhd7
         nQK118PPc3jeD/tzsJQp2nE+Yqd2PkushcASUbvJeTw2QINjhNKqDHQG2Nl54nGm9xAO
         Eh1jVm4ee9BknGp7S3dIuvNXeik5TBgkdsh21LBleVssWfEnbwscD9WwviHpk1e255MZ
         yJHfgdDeVqsf6ybVJXfL6Iarhaerm1fVNBPMBezL86fifNkxb0+JVY4JZ5y1E7C1JCvd
         N/yR1gBfV4Ik8ksEys62f//s7dtlgMs+QJBURLFsRuYhx7QKFdHhY+DVFeEqhYTQ40w7
         PvaA==
X-Forwarded-Encrypted: i=1; AJvYcCWLYFzZwt2a3Pdev2aYYwXLMlZlyUHwdc0UC+fghE3Xhbi8lgJhj3ITyXQHeZSVaP8RHMAXXiFrGU7sCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcQDMo+VDP8SPBaW+X8YzqN7MRvEAZ/Qf3CVg2vsNcrCxZCEi/
	CBM25joa2QHeucGeurWZrkd087stkdiClQTpFyc67cpf62Myw86qM2T8PnRXk6A=
X-Gm-Gg: ASbGnctlspb2PoTRygrUKYG3mD3gNEakSgLINd2ZsdmB27PVl6ZqWxfi40opeK5XvSS
	SeiwDxZymekgJvsRrOv4p+k0PfUn6E9EJGh6FJ3TV3cen4jFYOxKWnnkICloEbtzb2iF2xLaGnF
	zIC5ikb3ZYDprES53Ncdt2H7wMNexc75scTfEda+7B/K5kjjZ+/TRyXVFC4PM8llzU3bdVbjRjX
	sy13Iv6Q9iIE10bAl34azE9fUKU+i+yUkjhuJE18xdsI9/y94Ef8/d3jpF1lkS/S4hVBnOFgha3
	x3Y=
X-Google-Smtp-Source: AGHT+IEmpbegrxw5t/KNdPkGK27oe1/PS+rd7I9A+5GvQsjNYkwQPD+h7mTbFOVdsQ9qj72tvmQ1qQ==
X-Received: by 2002:a05:6000:188c:b0:38d:d7a4:d447 with SMTP id ffacd0b85a97d-38f33f52ee9mr22748723f8f.34.1740053675184;
        Thu, 20 Feb 2025 04:14:35 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439ac276ef7sm4896085e9.40.2025.02.20.04.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:14:34 -0800 (PST)
Date: Thu, 20 Feb 2025 13:14:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: xiangwencheng <xiangwencheng@lanxincomputing.com>, anup@brainfault.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] riscv: KVM: Remove unnecessary vcpu kick
Message-ID: <20250220-1581569f8559049399549cae@orel>
References: <20250219015426.1939-1-xiangwencheng@lanxincomputing.com>
 <D7WALEFMK28X.13HQ0UL1S3NM5@ventanamicro.com>
 <38cc241c40a8ef2775e304d366bcd07df733ecf0.f7f1d4c7.545f.42a8.90f5.c5d09b1d32ec@feishu.cn>
 <20250220-f9c4c4b3792a66999ea5b385@orel>
 <38cc241c40a8ef2775e304d366bcd07df733ecf0.818d94fe.c229.4f42.a074.e64851f0591b@feishu.cn>
 <D7X576NHG512.2HBBO3JLIA1JH@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D7X576NHG512.2HBBO3JLIA1JH@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_041437_038969_3FDC499C 
X-CRM114-Status: GOOD (  20.92  )
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

T24gVGh1LCBGZWIgMjAsIDIwMjUgYXQgMDk6NTA6MDZBTSArMDEwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjUtMDItMjBUMTY6MTc6MzMrMDg6MDAsIHhpYW5nd2VuY2hlbmcgPHhpYW5n
d2VuY2hlbmdAbGFueGluY29tcHV0aW5nLmNvbT46Cj4gPj4gRnJvbTogIkFuZHJldyBKb25lcyI8
YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPj4gT24gVGh1LCBGZWIgMjAsIDIwMjUgYXQgMDM6
MTI6NThQTSArMDgwMCwgeGlhbmd3ZW5jaGVuZyB3cm90ZToKPiA+PiA+IEluIGt2bV9hcmNoX3Zj
cHVfYmxvY2tpbmcgaXQgd2lsbCBlbmFibGUgZ3Vlc3QgZXh0ZXJuYWwgaW50ZXJydXB0LCB3aGlj
aAo+ID4KPiA+PiA+IG1lYW5zIHdpcnRpbmcgdG8gVlNfRklMRSB3aWxsIGNhdXNlIGFuIGludGVy
cnVwdC4gQW5kIHRoZSBpbnRlcnJ1cHQgaGFuZGxlcgo+ID4KPiA+PiA+IGhnZWlfaW50ZXJydXB0
IHdoaWNoIGlzIHNldHRlZCBpbiBhaWFfaGdlaV9pbml0IHdpbGwgZmluYWxseSBjYWxsIGt2bV92
Y3B1X2tpY2sKPiA+Cj4gPj4gPiB0byB3YWtlIHVwIHZDUFUuCj4gCj4gKENvbmZpZ3VyZSB5b3Vy
IG1haWwgY2xpZW50LCBzbyBpdCBkb2Vzbid0IGFkZCBhIG5ld2xpbmUgYmV0d2VlbiBlYWNoCj4g
IHF1b3RlZCBsaW5lIHdoZW4gcmVwbHlpbmcuKQo+IAo+ID4+ID4gU28gSSBzdGlsbCB0aGluayBp
cyBub3QgbmVjZXNzYXJ5IHRvIGNhbGwgYW5vdGhlciBrdm1fdmNwdV9raWNrIGFmdGVyIHdyaXRp
bmcgdG8KPiA+PiA+IFZTX0ZJTEUuCj4gCj4gU28gdGhlIGtpY2sgd2Fzbid0IHRoZXJlIHRvIG1h
c2sgc29tZSBvdGhlciBidWcsIHRoYW5rcy4KPiAKPiA+PiBSaWdodCwgd2UgZG9uJ3QgbmVlZCBh
bnl0aGluZyBzaW5jZSBoZ2VpX2ludGVycnVwdCgpIGtpY2tzIGZvciB1cywgYnV0IGlmCj4gPj4g
d2UgZG8KPiA+PsKgCj4gPj4gQEAgLTk3Myw4ICs5NzMsOCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVf
YWlhX2ltc2ljX2luamVjdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gPj4gwqAgwqAgwqAgwqAg
cmVhZF9sb2NrX2lycXNhdmUoJmltc2ljLT52c2ZpbGVfbG9jaywgZmxhZ3MpOwo+ID4+wqAKPiA+
PiDCoCDCoCDCoCDCoCBpZiAoaW1zaWMtPnZzZmlsZV9jcHUgPj0gMCkgewo+ID4+ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAga3ZtX3ZjcHVfd2FrZV91cCh2Y3B1KTsKPiA+PiDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB3cml0ZWwoaWlkLCBpbXNpYy0+dnNmaWxlX3ZhICsgSU1TSUNfTU1JT19TRVRJ
UE5VTV9MRSk7Cj4gPj4gLSDCoCDCoCDCoCDCoCDCoCDCoCDCoCBrdm1fdmNwdV9raWNrKHZjcHUp
Owo+ID4+IMKgIMKgIMKgIMKgIH0gZWxzZSB7Cj4gPj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
ZWl4ID0gJmltc2ljLT5zd2ZpbGUtPmVpeFtpaWQgLyBCSVRTX1BFUl9UWVBFKHU2NCldOwo+ID4+
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNldF9iaXQoaWlkICYgKEJJVFNfUEVSX1RZUEUodTY0
KSAtIDEpLCBlaXgtPmVpcCk7Cj4gPj7CoAo+ID4+IHRoZW4gd2Ugc2hvdWxkIGJlIGFibGUgdG8g
YXZvaWQgdGFraW5nIGEgaG9zdCBpbnRlcnJ1cHQuCj4gCj4gVGhlIHdha2V1cCBpcyBhc3luY2hy
b25vdXMsIGFuZCB0aGlzIHdvdWxkIHByYWN0aWNhbGx5IG5ldmVyIGF2b2lkIHRoZQo+IGhvc3Qg
aW50ZXJydXB0LCBidXQgd2UnZCBkbyBleHRyYSBwb2ludGxlc3Mgd29yay4uLgo+IEkgdGhpbmsg
aXQncyBtdWNoIGJldHRlciBqdXN0IHdpdGggdGhlIHdyaXRlLiAgKFRoZSB3YWtldXAgd291bGQg
YWdhaW4KPiBtYWtlIEtWTSBsb29rIGxpa2UgaXQgaGFzIGEgYnVnIGVsc2V3aGVyZS4pCgpBaCB5
ZXMsIHRoZSB3YWtldXAgaXMgYXN5bmNocm9ub3VzLiBKdXN0IGRyb3BwaW5nIHRoZSBraWNrIGlz
IHRoZSByaWdodAp3YXkgdG8gZ28gdGhlbi4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
