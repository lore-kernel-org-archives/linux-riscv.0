Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89481C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 16:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdLRkBHSuCNsMkN1LW76Rsk16XOINOccsxZMOplgmJ0=; b=1e1CQ1WGvqGiGM
	BF/Vq5jN5qWnI6bstUGsPvItmrM7AAk9YRDq1TwMn+7Ig8Vu9pr/cmvbBFtIy14swWEjtA1Bg1VsV
	zxguRoNjlGrYJ1FBnca+/rIVaCpwOMkvO1uHCCrOsxpxinYhTeoffLpzZx7wPmuSkFL4Z8m6fUaty
	IaO2VHDSRzJeeDHxtq757lnlVd6HCuNltnZuPSVJK6+iJKbtLORgBERTP2jxuxN9avDd7n6xsRlGW
	sYWYBG2VXX2XHeq+sUVA3JdmidNcf8FUKu2DChdNFb3y1Hf0MmOWwSRG7NFbUUZMO30Mo/MC5WwQE
	wKohW1wH+udCJjJgnEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NKz-008sIV-3A;
	Wed, 29 Nov 2023 16:22:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NKw-008sI8-37
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 16:22:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40b5149a4efso1373185e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 08:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701274973; x=1701879773; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=roHW8B0kGVQi7v3u5rXDrRfq0dqjl02SvhNdMtM5u1Y=;
        b=QhnQF76mc4Cz1nigbGFE7T7oCDIbjT5ZEsi/Xtny45LiJvfDtW0NtKkSl5hrlrn8Hs
         HqQVun28m8xIT2K7FetUJXKmDyZ5QPizeFn+/WjHEEQpetDh9rPdse5MZmgpaEO6wRVG
         FyoEC7j62YlMRcblIktUdhkCU6ps2sLTmEWAu0t4tT+jr0ao1cl9b9OnVMz9i6gXbIFM
         oa8y9cLdfu5L87PZeNHc14v9wrakBWCcXO/nW7R8HvYyT4b0P1wFDq1j4hWrBuP+MwxN
         QacW7+357+oESh7WDLeEbkKKU2UVWyiljO/yxcdALkUdg7ErvBEXeI6zDlQdkt2kGMy0
         G01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701274973; x=1701879773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=roHW8B0kGVQi7v3u5rXDrRfq0dqjl02SvhNdMtM5u1Y=;
        b=WFs/jeh2oouyBdn+Oehx+Cfa0iBnoY0NrI39oXmZuxF4nWE4lRdRzJE0BnKrIv/e58
         dg+Mgg0eExt7rGCUwJDaFXSZFgJ/B0xZu7n/EiS2GHkPifrh9XGEqudwRyDus/l8Ui2L
         bnWQAh9rOkNWkSpHjzdt7Em37vpWF+01IbiZHEKIPjTlCq69hS6YQZRWv3lc3bG1/Da1
         NX6WTbNf2O0XWyjUuain3aPOZqQXt/QR+n1y/64SVcsbmEEjyfp96ypyTgTKn20SpvDv
         taiWP1mw8/q4efxqfFcu4//B55S6SIOql2Q+iEut+AEQwSgONJrEdmnku7hqurTRHa8O
         hXSA==
X-Gm-Message-State: AOJu0YySgMZO6t5YCpI1BXv8EzGhJJTRNXHjonxRAKUp0bRF1Z1XFV1R
	aGdYybUR+09p/QvQleED8znztg==
X-Google-Smtp-Source: AGHT+IHTXDyYM7XpEJ2XOUVTrvwcppAZpJsj+SvZ6k6SHb/GzwKbtcTUwskr31NgpgLj4swFKUUmDA==
X-Received: by 2002:a05:600c:2219:b0:40b:4889:667e with SMTP id z25-20020a05600c221900b0040b4889667emr5939341wml.4.1701274972623;
        Wed, 29 Nov 2023 08:22:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:11a9:3d89:528b:b336? ([2a01:e0a:999:a3a0:11a9:3d89:528b:b336])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c4f8a00b004053e9276easm2717649wmq.32.2023.11.29.08.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 08:22:52 -0800 (PST)
Message-ID: <9a54fbb3-c4cc-4f94-8df5-38b40f3f91f2@rivosinc.com>
Date: Wed, 29 Nov 2023 17:22:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: Implement archrandom when Zkr is available
Content-Language: en-US
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Samuel Ortiz <sameo@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20231129160325.1119803-1-cleger@rivosinc.com>
 <2feb3ff4-3d26-41f7-83f5-6440393d6e43@codethink.co.uk>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <2feb3ff4-3d26-41f7-83f5-6440393d6e43@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_082255_009130_A23F77CD 
X-CRM114-Status: GOOD (  19.56  )
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

CgpPbiAyOS8xMS8yMDIzIDE3OjE1LCBCZW4gRG9va3Mgd3JvdGU6Cj4gT24gMjkvMTEvMjAyMyAx
NjowMywgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBGcm9tOiBTYW11ZWwgT3J0aXogPHNhbWVv
QHJpdm9zaW5jLmNvbT4KPj4KPj4gRnJvbTogU2FtdWVsIE9ydGl6IDxzYW1lb0ByaXZvc2luYy5j
b20+Cj4+Cj4+IFRoZSBaa3IgZXh0ZW5zaW9uIGlzIHJhdGlmaWVkIGFuZCBwcm92aWRlcyAxNiBi
aXRzIG9mIGVudHJvcHkgc2VlZCB3aGVuCj4+IHJlYWRpbmcgdGhlIFNFRUQgQ1NSLgo+Pgo+PiBX
ZSBjYW4gaW1wbGVtZW50IGFyY2hfZ2V0X3JhbmRvbV9zZWVkX2xvbmdzKCkgYnkgZG9pbmcgbXVs
dGlwbGUgY3NycncgdG8KPj4gdGhhdCBDU1IgYW5kIGZpbGxpbmcgYW4gdW5zaWduZWQgbG9uZyB3
aXRoIHZhbGlkIGVudHJvcHkgYml0cy4KPj4KPj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29u
b3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBPcnRpeiA8
c2FtZW9Acml2b3NpbmMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNs
ZWdlckByaXZvc2luYy5jb20+Cj4+Cj4+IC0tLQo+Pgo+PiBUaGlzIHNlcmllcyBkZXBlbmRzIG9u
ICJyaXNjdjogcmVwb3J0IG1vcmUgSVNBIGV4dGVuc2lvbnMgdGhyb3VnaAo+PiBod3Byb2JlIiBz
ZXJpZXMgWzFdLgo+Pgo+PiBMaW5rOgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjMxMTE0MTQxMjU2LjEyNjc0OS0xLWNsZWdlckByaXZvc2luYy5jb20vIFsxXQo+PiAtLS0KPj4g
wqAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hcmNocmFuZG9tLmggfCA2OSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+PiDCoCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5owqDCoMKg
wqDCoMKgwqAgfMKgIDkgKysrKwo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMo
KykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXJjaHJh
bmRvbS5oCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FyY2hyYW5k
b20uaAo+PiBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXJjaHJhbmRvbS5oCj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzk1ODM3Y2NiNTgzCj4+IC0tLSAv
ZGV2L251bGwKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hcmNocmFuZG9tLmgKPj4g
QEAgLTAsMCArMSw2OSBAQAo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAg
Ki8KPj4gKy8qCj4+ICsgKiBLZXJuZWwgaW50ZXJmYWNlIGZvciB0aGUgUklTQ1YgYXJjaF9yYW5k
b21fKiBmdW5jdGlvbnMKPj4gKyAqCj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjMgYnkgUml2b3Mg
SW5jLgo+PiArICoKPj4gKyAqLwo+PiArCj4+ICsjaWZuZGVmIEFTTV9SSVNDVl9BUkNIUkFORE9N
X0gKPj4gKyNkZWZpbmUgQVNNX1JJU0NWX0FSQ0hSQU5ET01fSAo+PiArCj4+ICsjaW5jbHVkZSA8
YXNtL2Nzci5oPgo+PiArCj4+ICsjZGVmaW5lIFNFRURfUkVUUllfTE9PUFMgMTAwCj4+ICsKPj4g
K3N0YXRpYyBpbmxpbmUgYm9vbCBfX211c3RfY2hlY2sgY3NyX3NlZWRfbG9uZyh1bnNpZ25lZCBs
b25nICp2KQo+PiArewo+PiArwqDCoMKgIHVuc2lnbmVkIGludCByZXRyeSA9IFNFRURfUkVUUllf
TE9PUFMsIHZhbGlkX3NlZWRzID0gMDsKPj4gK8KgwqDCoCBjb25zdCBpbnQgbmVlZGVkX3NlZWRz
ID0gc2l6ZW9mKGxvbmcpIC8gc2l6ZW9mKHUxNik7Cj4+ICvCoMKgwqAgdTE2ICplbnRyb3B5ID0g
KHUxNiAqKXY7Cj4+ICsKPj4gK8KgwqDCoCBkbyB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAvKgo+PiAr
wqDCoMKgwqDCoMKgwqDCoCAqIFRoZSBTRUVEIENTUiBtdXN0IGJlIGFjY2Vzc2VkIHdpdGggYSBy
ZWFkLXdyaXRlIGluc3RydWN0aW9uLgo+PiArwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiArwqDCoMKg
wqDCoMKgwqAgdW5zaWduZWQgbG9uZyBjc3Jfc2VlZCA9IGNzcl9zd2FwKENTUl9TRUVELCAwKTsK
Pj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgc3dpdGNoIChjc3Jfc2VlZCAmIFNFRURfT1BTVF9NQVNL
KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIFNFRURfT1BTVF9FUzE2Ogo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBlbnRyb3B5W3ZhbGlkX3NlZWRzKytdID0gY3NyX3NlZWQgJiBTRUVEX0VO
VFJPUFlfTUFTSzsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHZhbGlkX3NlZWRzID09
IG5lZWRlZF9zZWVkcykKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
dHJ1ZTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICsKPj4gK8KgwqDCoMKg
wqDCoMKgIGNhc2UgU0VFRF9PUFNUX0RFQUQ6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBy
X2Vycl9vbmNlKCJhcmNocmFuZG9tOiBVbnJlY292ZXJhYmxlIGVycm9yXG4iKTsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBj
YXNlIFNFRURfT1BTVF9CSVNUOgo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBTRUVEX09QU1RfV0FJ
VDoKPj4gK8KgwqDCoMKgwqDCoMKgIGRlZmF1bHQ6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbnRpbnVlOwo+IAo+IGlzIGl0IHdvcnRoIGFkZGluZyBhIGNwdV9yZWxheCgpIGhlcmU/CgpZ
ZWFoLCB0aGF0IGNsZWFybHkgbWFrZXMgc2Vuc2UgIQoKPiAKPj4gK8KgwqDCoMKgwqDCoMKgIH0K
Pj4gK8KgwqDCoCB9IHdoaWxlICgtLXJldHJ5KTsKPj4gKwo+PiArwqDCoMKgIHJldHVybiBmYWxz
ZTsKPj4gK30KPj4gKwo+PiArc3RhdGljIGlubGluZSBzaXplX3QgX19tdXN0X2NoZWNrIGFyY2hf
Z2V0X3JhbmRvbV9sb25ncyh1bnNpZ25lZCBsb25nCj4+ICp2LCBzaXplX3QgbWF4X2xvbmdzKQo+
PiArewo+PiArwqDCoMKgIHJldHVybiAwOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW5saW5lIHNp
emVfdCBfX211c3RfY2hlY2sgYXJjaF9nZXRfcmFuZG9tX3NlZWRfbG9uZ3ModW5zaWduZWQKPj4g
bG9uZyAqdiwgc2l6ZV90IG1heF9sb25ncykKPj4gK3sKPj4gK8KgwqDCoCBpZiAoIW1heF9sb25n
cykKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiArCj4+ICvCoMKgwqAgLyoKPj4gK8Kg
wqDCoMKgICogSWYgWmtyIGlzIHN1cHBvcnRlZCBhbmQgY3NyX3NlZWRfbG9uZyBzdWNjZWVkcywg
d2UgcmV0dXJuIG9uZQo+PiBsb25nCj4+ICvCoMKgwqDCoCAqIHdvcnRoIG9mIGVudHJvcHkuCj4+
ICvCoMKgwqDCoCAqLwo+PiArwqDCoMKgIGlmIChyaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2VseShS
SVNDVl9JU0FfRVhUX1pLUikgJiYKPj4gY3NyX3NlZWRfbG9uZyh2KSkKPj4gK8KgwqDCoMKgwqDC
oMKgIHJldHVybiAxOwo+IAo+IEknbSBhc3N1bWluZyB0aGUgY29kZSB3aWxsIHJldHJ5IGlmIG1h
eF9sb25ncyA+IDEgPwoKWWVzIHRoZSBjYWxsZXIgd2lsbCBjYWxsIGl0IHVudGlsIGdhdGhlcmlu
ZyBlbm91Z2ggZGF0YSAoc2VlCmRyaXZlcnMvY2hhci9yYW5kb20uYykuCgpUaGFua3MsCgpDbMOp
bWVudAoKPiAKPiAKPiAKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArI2VuZGlm
IC8qIEFTTV9SSVNDVl9BUkNIUkFORE9NX0ggKi8KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY3NyLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4+IGluZGV4
IDMwNmExOWE1NTA5Yy4uNTEwMDE0MDUxZjVkIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2Nzci5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPj4g
QEAgLTQxMSw2ICs0MTEsMTUgQEAKPj4gwqAgI2RlZmluZSBDU1JfVlRZUEXCoMKgwqDCoMKgwqDC
oCAweGMyMQo+PiDCoCAjZGVmaW5lIENTUl9WTEVOQsKgwqDCoMKgwqDCoMKgIDB4YzIyCj4+IMKg
ICsvKiBTY2FsYXIgQ3J5cHRvIEV4dGVuc2lvbiAtIEVudHJvcHkgKi8KPj4gKyNkZWZpbmUgQ1NS
X1NFRUTCoMKgwqDCoMKgwqDCoCAweDAxNQo+PiArI2RlZmluZSBTRUVEX09QU1RfTUFTS8KgwqDC
oMKgwqDCoMKgIF9BQygweEMwMDAwMDAwLCBVTCkKPj4gKyNkZWZpbmUgU0VFRF9PUFNUX0JJU1TC
oMKgwqDCoMKgwqDCoCBfQUMoMHgwMDAwMDAwMCwgVUwpCj4+ICsjZGVmaW5lIFNFRURfT1BTVF9X
QUlUwqDCoMKgwqDCoMKgwqAgX0FDKDB4NDAwMDAwMDAsIFVMKQo+PiArI2RlZmluZSBTRUVEX09Q
U1RfRVMxNsKgwqDCoMKgwqDCoMKgIF9BQygweDgwMDAwMDAwLCBVTCkKPj4gKyNkZWZpbmUgU0VF
RF9PUFNUX0RFQUTCoMKgwqDCoMKgwqDCoCBfQUMoMHhDMDAwMDAwMCwgVUwpCj4+ICsjZGVmaW5l
IFNFRURfRU5UUk9QWV9NQVNLwqDCoMKgIF9BQygweEZGRkYsIFVMKQo+PiArCj4+IMKgICNpZmRl
ZiBDT05GSUdfUklTQ1ZfTV9NT0RFCj4+IMKgICMgZGVmaW5lIENTUl9TVEFUVVPCoMKgwqAgQ1NS
X01TVEFUVVMKPj4gwqAgIyBkZWZpbmUgQ1NSX0lFwqDCoMKgwqDCoMKgwqAgQ1NSX01JRQo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
