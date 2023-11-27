Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ED8C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 12:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8VxxQavOiHo5IrcDccbTvfVf/95mcWkDsqP8vxajnI=; b=WgqgA8mIrB9i+1
	UbcDG2EAJHSIjFdARBCHbRduVde92OJlqx8fnZ3tA+efgm7I5f7BWHCKTRJqSgpxtGFvaR8S/Kw0C
	MzUSdiJCb9L9vb9r7FERBGD5MLCDpuN7wbcQ2X+uVb3q6ZqU8zE2Fy2fLumO281KAM9l3d0AZKSkU
	SZYjSw24/Nf9RXbiWplPkjglC5qOOu2qwU6Jj6WHmrYRgqXVkC1yBtL688cNRVtPY7d5MUPGBXkDO
	5vPAgFZVpFqpi/RgK9cdNl8NKVk8FMY4I/yNpFS+Olld1xFZ7drrTyPuEdSZMRCGL3Lbe5MpTf6fv
	ovBHdepSmJc8BL3AA0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bBe-002V5b-28;
	Mon, 27 Nov 2023 12:58:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bBb-002V4W-1T
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 12:58:04 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b2e763b83so5379205e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 04:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701089880; x=1701694680; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLrTr1cbGhjwm5HZ0GV+BmfoECIMxFKEN669d3URKW0=;
        b=kpakDmHXxWTAZp85E6bugFTxVnKIEJBLaTcRwvqIyaSbtng8/ThwuWqyW9q6qXXC1w
         WhMjuP76TMjvhc38mjZBAgaTvgXsKTr8x4L1vu+8NBiNg8VllhiPXxQjrFaxMJYADKaK
         Bmk7ztyHxuPYkoWZ/QupONEQioNgQ5XGLIR1e6r3mgx6x/XCZ6nlbFt/NGbySjqRTJnw
         b1Nkn1tPW71Y8IcwbeOPVi/pHRQZ/RpGtFEUpemtVZsitwkwslDcV7jtucoZs14lyEo7
         Ixm4dMRaZJ0IyVJ7ksTXzjtAPzypEcGXTDMuOjVciEB8c/cIyXNxyVQ5boHnURykK9gF
         8zrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089880; x=1701694680;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLrTr1cbGhjwm5HZ0GV+BmfoECIMxFKEN669d3URKW0=;
        b=GVmBpltiRPRtafLfEEQkIvv4IWtn5lQIlZSqrDPe/e+xY+oPrUoG92q/8Pdvw2++JR
         BjifUUloY0ZwgB+xkx4gE7URo9wBNAv2Yka7Fn7c6A8UjcfJBAlJlqq2kec4XGd5lLRQ
         ScKLZcsyLartC57l10x7HBUheuVqrrMsMX7LHijJGD68EBLvC6fOspVh0q7ePCFQ+506
         wNBFmH38xuLff6jlKBTS8RlQSaIDRGaL7A958msNyNr0yBjIrQqzRsC52Cf+r+933rD3
         erF2VFUIva/RZxl+v3a6jOp/w7fMWFkJu4Mfqm8V0KlDFyYdwP20YuWUUM/SyeGJWNAr
         sHiA==
X-Gm-Message-State: AOJu0Yw45FdKcBwRyvGnble34LdLByjD0Bj2A+NclnIgCtwSfn8NIOnA
	KWoNciOzBs1LS282KUDxl+24+3xupjhkxjl9ZlY=
X-Google-Smtp-Source: AGHT+IGuVtiV25r0CbMNM4DRWKPCnn9fsUeYezrnHcCtlNwkSjKhQ8ymsNrFcAeRR4C7auBUyea85w==
X-Received: by 2002:a05:600c:5024:b0:40a:771f:6a56 with SMTP id n36-20020a05600c502400b0040a771f6a56mr8042955wmr.4.1701089879839;
        Mon, 27 Nov 2023 04:57:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:c123:224a:77e5:3aba? ([2a01:e0a:999:a3a0:c123:224a:77e5:3aba])
        by smtp.gmail.com with ESMTPSA id t8-20020a5d42c8000000b00332fa6cc8acsm4818252wrr.87.2023.11.27.04.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 04:57:59 -0800 (PST)
Message-ID: <d156242a-f104-4925-9736-624a4ba8210d@rivosinc.com>
Date: Mon, 27 Nov 2023 13:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: fix incorrect use of __user pointer
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Christoph Hellwig <hch@infradead.org>, kernel test robot <lkp@intel.com>
References: <20231124113803.165431-1-cleger@rivosinc.com>
 <b4ee0ab3-9772-439c-bc9c-474f6f2862ba@codethink.co.uk>
 <300ba40f-4dce-44f1-8809-5a0abcb41aa4@rivosinc.com>
In-Reply-To: <300ba40f-4dce-44f1-8809-5a0abcb41aa4@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_045803_490772_CA5C4780 
X-CRM114-Status: GOOD (  13.61  )
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

CgpPbiAyNy8xMS8yMDIzIDEzOjQ2LCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gCj4gCj4+PiBA
QCAtMzY5LDE2ICszNjYsMTQgQEAgc3RhdGljIGlubGluZSBpbnQgZ2V0X2luc24oc3RydWN0IHB0
X3JlZ3MgKnJlZ3MsCj4+PiB1bG9uZyBlcGMsIHVsb25nICpyX2luc24pCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqcl9pbnNuID0gaW5zbjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAwOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+IC3CoMKgwqDCoMKg
wqDCoCBpbnNuX2FkZHIrKzsKPj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoX19yZWFkX2luc24ocmVn
cywgdG1wLCBpbnNuX2FkZHIpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGVwYyArPSBzaXplb2YodTE2
KTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoX19yZWFkX2luc24ocmVncywgdG1wLCBlcGMsIHUx
NikpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVGQVVMVDsKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCAqcl9pbnNuID0gKHRtcCA8PCAxNikgfCBpbnNuOwo+Pj4gwqAgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4gwqDCoMKgwqDCoCB9IGVsc2Ugewo+Pj4gLcKg
wqDCoMKgwqDCoMKgIHUzMiBfX3VzZXIgKmluc25fYWRkciA9ICh1MzIgX191c2VyICopZXBjOwo+
Pj4gLQo+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChfX3JlYWRfaW5zbihyZWdzLCBpbnNuLCBpbnNu
X2FkZHIpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChfX3JlYWRfaW5zbihyZWdzLCBpbnNuLCBl
cGMsIHUzMikpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVGQVVMVDsK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoKGluc24gJiBfX0lOU05fTEVOR1RIX01BU0spID09
IF9fSU5TTl9MRU5HVEhfMzIpIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICpyX2lu
c24gPSBpbnNuOwo+Pj4gQEAgLTQ5MSw3ICs0ODYsNyBAQCBpbnQgaGFuZGxlX21pc2FsaWduZWRf
bG9hZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4+IMKgIMKgwqDCoMKgwqAgdmFsLmRhdGFfdTY0
ID0gMDsKPj4+IMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IGxlbjsgaSsrKSB7Cj4+PiAtwqDC
oMKgwqDCoMKgwqAgaWYgKGxvYWRfdTgocmVncywgKHZvaWQgKikoYWRkciArIGkpLCAmdmFsLmRh
dGFfYnl0ZXNbaV0pKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChsb2FkX3U4KHJlZ3MsIGFkZHIg
KyBpLCAmdmFsLmRhdGFfYnl0ZXNbaV0pKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC0xOwo+Pj4gwqDCoMKgwqDCoCB9Cj4+PiDCoCBAQCAtNTg5LDcgKzU4NCw3IEBAIGlu
dCBoYW5kbGVfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+PiDCoCDCoMKgwqDCoMKgIGZvciAo
aSA9IDA7IGkgPCBsZW47IGkrKykgewo+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChzdG9yZV91OChy
ZWdzLCAodm9pZCAqKShhZGRyICsgaSksIHZhbC5kYXRhX2J5dGVzW2ldKSkKPj4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAoc3RvcmVfdTgocmVncywgYWRkciArIGksIHZhbC5kYXRhX2J5dGVzW2ldKSkK
Pj4+Cj4+Cj4+IFdvdWxkIGl0IG5vdCBiZSBlYXNpZXIgdG8gaGF2ZSBhIHN3aXRjaCBoZXJlIGZv
ciBtZW1jcHkgb3IgY29weV90b191c2VyPwo+IAo+IE1vc3QgcHJvYmFibHkgeWVzLiBJJ2xsIHVw
ZGF0ZSB0aGUgVjMgd2l0aCB0aGVzZSBtb2RpZmljYXRpb25zLiBXZSdsbAo+IGdldCByaWQgb2Yg
c3RvcmVfdTgoKS9sb2FkX3U4KCkgZW50aXJlbHkuCgpXaGlsZSBtZW1jcHkvY29weV9mcm9tX3Vz
ZXIgd2lsbCBiZSBzbG93ZXIgdGhhbiBEYXZpZCBMYWlnaHQgcHJvcG9zZWQKc29sdXRpb24gKHJl
YWQgdHdvIDQvOCBieXRlcyBsb25nIG9uY2UgYW5kIHNoaWZ0aW5nIHRoZSBjb250ZW50KSBpdCBp
cwptb3JlIG1haW50YWluYWJsZSBhbmQgdGhpcyBwYXRoIG9mIGNvZGUgd2lsbCBub3Qgc3VmZmVy
IGEgZmV3IGxvc3QgY3ljbGUKKGVtdWxhdGluZyBtaXNhbGlnbmVkIGFjY2VzcyBpcyBhbHJlYWR5
IGhvcnJpYmx5IHNsb3cuLi4pLgoKQlRXLCBuZWVkIHRvIGNoZWNrIGJ1dCBtYXliZSB3ZSBjYW4g
Z2V0IHJpZCBvZiBhbGwgdGhlIHNwZWNpZmljIE1fTU9ERQpjb2RlIGVudGlyZWx5IChfX3JlYWRf
aW5zbikgYWxzby4KCkNsw6ltZW50Cgo+IAo+IFRoYW5rcywKPiAKPiBDbMOpbWVudAo+IAo+Pgo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtMTsKPj4+IMKgwqDCoMKgwqAg
fQo+Pj4gwqAgCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
