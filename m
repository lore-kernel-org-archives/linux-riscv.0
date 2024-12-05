Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FDAE7716E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 21:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3kMK07qRCDbzH5doKEQTUyej5iLmpcfEuKt3nSTxFY=; b=cANbLTa8zFBi//
	t1giiApoXB1AoF7GNC/rYyKjDIY2WBrBLWLF5MlsI2WLWlLhDUFXE9gciP7CuKoe+fCEN8VyUS7L+
	tfnDpRd11Gze/jmkvdR0VkcZzLWMYtgdGKw5QYazy3Ge0Nqtd7oOoawJRjaRtbKBenmag+LKC+T80
	bykwU005qxZweb6f0CZqnUpLkLijcMXjx/RFDU6ZUhBrbj1G3evVhksJ30le0q7mUoxRTV7rjJnpv
	eUnbsEPwvCVaupikiGdK+MHODgDHXOzqt73HO5wCsk/O5KTrkFZ53CcSrUm9sy0ABN67fz5VSIAb+
	A/bRoScT+bCH6Nu5y5LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJJS9-0000000HPFr-0JZ6;
	Thu, 05 Dec 2024 21:32:05 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJJS7-0000000HPFO-1JhP
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 21:32:04 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7242f559a9fso1536526b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 13:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733434322; x=1734039122; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wyx22zMgi4pWu73aFiLkcTSA7gkzSkXHytTqPFsaqZE=;
        b=DpePk7+JAP9aJTpK302TB5K1kY926xBesMuGdBpsR9+0zaI0LdoOLyr49l3dG038iz
         rxg67t4yw21GRC+JvacOvBBukUSZqc9AunLoqkmbKVqTp7NENu/wqLH0Eg3sOODrDTKV
         EZU86NywKHRkUzD45/Cw3xZ57cNDGu+oIpcuo2IoQCs1SdCXANGmtMZHOVLm1l4b5wh7
         q2Fox7wjlVVy2Zi7pB0DbMJwTytTaLrPAQaKtY31icf7kqSD9VNaULF7SGukDjb94Kqe
         YUgF12aJY9pfRWL13EBE/z5TZzAsXSpkxDvtNXYZALhhu4HWy9kGXgI5mSIJQ1c7KP04
         F5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733434322; x=1734039122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyx22zMgi4pWu73aFiLkcTSA7gkzSkXHytTqPFsaqZE=;
        b=qVCVgJs7mI9JxLlsZnoKz8Okc9EJDlp139QHgV9ldlhe5hRhsdC5mzqgyjSQGEjj4O
         J1asHLwFaPIDTn/3A2yUFsH35CEMiMpGLSRsFhBpGNkrfrltxQL1UK+dgolZrIXSVlrv
         7oezd3aUYzcXUPoqricFFYPwKYX8B9VqaBULaAh7I/Tk8Y9MfJnVy72ep0LwR0NFcRhk
         CYg59C7I7gjVxvB/WmE6c7y0ZWD78N76c4U+xFS3BcJ6R3STLDXgI3rz6E6NLqbsiwdy
         cNRcoCvmm7iXTmMveWnRrbP19/N7V5ftfimPA1/855qVNCDfbH7Jc8kJ6snRxbkQPgDp
         k0qg==
X-Forwarded-Encrypted: i=1; AJvYcCUDUGFtR0GmOUIyWusyxNXjd0qkLGxTA/pYGW1sUtNfCUwkUYU5cUjFKj4NO4t5L0xkPUle1rhfW5Q9Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/3qoKnsoMBmk6qJYpt7oDPAeKNf4H6QmaHVXEYuPkPr8V5EMe
	Yk8mKj3Ho5Bh36/DKJ/Lp9vi05YfFk5OIBqNttW3SzGTIHVQ+ikhQJdmrSLF8627acrsoaFoBtC
	S
X-Gm-Gg: ASbGncv1e0AuzIzNp92/R0TWZmO/m2/xm1+QPnNkFRsqfvGJFxDkIFJQHcn9xmzoan/
	IHyfA4Q8dfffwFBOpWXGPvPxmaCpWLCp71in8ytgUsP9Qrk2HmmVD+n76hE1jjTW24EakxEcmdu
	8vGUa/BJ/uqsCtRSq/2UgmECJGKqiqpMetcW3bM1HbyEEfADnwAA5zY27Fc5R1dMNglEADmFnkZ
	VxZiFPyn3O2VhXIShjvPdn/9OY+RpAw9/PS0OLAN0tI
X-Google-Smtp-Source: AGHT+IHXX0tWb0QGvBkyLN2duDz1ll0UJfDq+pVWxKWimKIoFpd8ZHB4PzaAYuNDHeontmn7LQfb/w==
X-Received: by 2002:a05:6a00:2e1f:b0:725:2b93:3583 with SMTP id d2e1a72fcca58-725b8185650mr906857b3a.21.1733434322450;
        Thu, 05 Dec 2024 13:32:02 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:643d:2bb:e7d1:adbd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd201fa60bsm895397a12.48.2024.12.05.13.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 13:32:01 -0800 (PST)
Date: Thu, 5 Dec 2024 13:31:59 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v2] riscv: selftests: Fix warnings pointer masking test
Message-ID: <Z1Ibz-j8LUad571l@ghost>
References: <20241204-fix_warnings_pointer_masking_tests-v2-1-1bf0c5095f58@rivosinc.com>
 <697a402b-0305-489d-bf4e-aa5e7fa4b2aa@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <697a402b-0305-489d-bf4e-aa5e7fa4b2aa@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_133203_357255_4501FACD 
X-CRM114-Status: GOOD (  22.83  )
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

T24gVGh1LCBEZWMgMDUsIDIwMjQgYXQgMDk6MTE6NDZBTSArMDEwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IEhpIENoYXJsaWUsCj4gCj4gT24gMDUvMTIvMjAyNCAwMzo1NywgQ2hhcmxpZSBK
ZW5raW5zIHdyb3RlOgo+ID4gV2hlbiBjb21waWxpbmcgdGhlIHBvaW50ZXIgbWFza2luZyB0ZXN0
cyB3aXRoIC1XYWxsIHRoaXMgd2FybmluZwo+ID4gaXMgcHJlc2VudDoKPiA+IAo+ID4gcG9pbnRl
cl9tYXNraW5nLmM6IEluIGZ1bmN0aW9uIOKAmHRlc3RfdGFnZ2VkX2FkZHJfYWJpX3N5c2N0bOKA
mToKPiA+IHBvaW50ZXJfbWFza2luZy5jOjIwMzo5OiB3YXJuaW5nOiBpZ25vcmluZyByZXR1cm4g
dmFsdWUgb2Yg4oCYcHdyaXRl4oCZCj4gPiBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSDigJh3YXJu
X3VudXNlZF9yZXN1bHTigJkgWy1XdW51c2VkLXJlc3VsdF0KPiA+ICAgIDIwMyB8ICAgICAgICAg
cHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOyB8Cj4gPiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+IHBvaW50ZXJfbWFza2luZy5jOjIwODo5OiB3YXJuaW5nOgo+ID4gaWdub3JpbmcgcmV0
dXJuIHZhbHVlIG9mIOKAmHB3cml0ZeKAmSBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZQo+ID4g4oCY
d2Fybl91bnVzZWRfcmVzdWx04oCZIFstV3VudXNlZC1yZXN1bHRdCj4gPiAgICAyMDggfCAgICAg
ICAgIHB3cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsKPiA+IAo+ID4gSSBjYW1lIGFjcm9zcyB0aGlz
IG9uIHJpc2N2NjQtbGludXgtZ251LWdjYyAoVWJ1bnR1Cj4gPiAxMS40LjAtMXVidW50dTF+MjIu
MDQpLgo+ID4gCj4gPiBGaXggdGhpcyBieSBjaGVja2luZyB0aGF0IHRoZSBudW1iZXIgb2YgYnl0
ZXMgd3JpdHRlbiBlcXVhbCB0aGUgZXhwZWN0ZWQKPiA+IG51bWJlciBvZiBieXRlcyB3cml0dGVu
Lgo+ID4gCj4gPiBGaXhlczogNzQ3MGI1YWZkMTUwICgicmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGEg
cG9pbnRlciBtYXNraW5nIHRlc3QiKQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5z
IDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+IC0g
SSBoYWQgcmV0ICE9IDIgZm9yIHRlc3RpbmcsIEkgY2hhbmdlZCBpdCB0byBiZSByZXQgIT0gMS4K
PiA+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIwNC1maXhf
d2FybmluZ3NfcG9pbnRlcl9tYXNraW5nX3Rlc3RzLXYxLTEtZWExZTk2NjVjZTdhQHJpdm9zaW5j
LmNvbQo+ID4gLS0tCj4gPiAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2lu
dGVyX21hc2tpbmcuYyB8IDE5ICsrKysrKysrKysrKysrKy0tLS0KPiA+ICAgMSBmaWxlIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMKPiA+IGlu
ZGV4IGRlZTQxYjdlZTNlMy4uMjI5ZDg1Y2NmZjUwIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFza2luZy5jCj4gPiArKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMKPiA+IEBAIC0x
ODksNiArMTg5LDcgQEAgc3RhdGljIHZvaWQgdGVzdF90YWdnZWRfYWRkcl9hYmlfc3lzY3RsKHZv
aWQpCj4gPiAgIHsKPiA+ICAgCWNoYXIgdmFsdWU7Cj4gPiAgIAlpbnQgZmQ7Cj4gPiArCWludCBy
ZXQ7Cj4gPiAgIAlrc2Z0X3ByaW50X21zZygiVGVzdGluZyB0YWdnZWQgYWRkcmVzcyBBQkkgc3lz
Y3RsXG4iKTsKPiA+IEBAIC0yMDAsMTQgKzIwMSwyNCBAQCBzdGF0aWMgdm9pZCB0ZXN0X3RhZ2dl
ZF9hZGRyX2FiaV9zeXNjdGwodm9pZCkKPiA+ICAgCX0KPiA+ICAgCXZhbHVlID0gJzEnOwo+ID4g
LQlwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Cj4gPiArCXJldCA9IHB3cml0ZShmZCwgJnZhbHVl
LCAxLCAwKTsKPiA+ICsJaWYgKHJldCAhPSAxKSB7Cj4gPiArCQlrc2Z0X3Rlc3RfcmVzdWx0X2Zh
aWwoIldyaXRlIHRvIC9wcm9jL3N5cy9hYmkvdGFnZ2VkX2FkZHJfZGlzYWJsZWQgZmFpbGVkLlxu
Iik7Cj4gPiArCQlyZXR1cm47Cj4gPiArCX0KPiA+ICsKPiA+ICAgCWtzZnRfdGVzdF9yZXN1bHQo
c2V0X3RhZ2dlZF9hZGRyX2N0cmwobWluX3BtbGVuLCB0cnVlKSA9PSAtRUlOVkFMLAo+ID4gICAJ
CQkgInN5c2N0bCBkaXNhYmxlZFxuIik7Cj4gPiAgIAl2YWx1ZSA9ICcwJzsKPiA+IC0JcHdyaXRl
KGZkLCAmdmFsdWUsIDEsIDApOwo+ID4gLQlrc2Z0X3Rlc3RfcmVzdWx0KHNldF90YWdnZWRfYWRk
cl9jdHJsKG1pbl9wbWxlbiwgdHJ1ZSkgPT0gMCwKPiA+IC0JCQkgInN5c2N0bCBlbmFibGVkXG4i
KTsKPiA+ICsJcmV0ID0gcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+ID4gKwlpZiAocmV0ICE9
IDEpIHsKPiA+ICsJCWtzZnRfdGVzdF9yZXN1bHRfZmFpbCgiV3JpdGUgdG8gL3Byb2Mvc3lzL2Fi
aS90YWdnZWRfYWRkcl9kaXNhYmxlZCBmYWlsZWQuXG4iKTsKPiA+ICsJCXJldHVybjsKPiA+ICsJ
fQo+ID4gKwo+ID4gKwlrc2Z0X3Rlc3RfcmVzdWx0KHNldF90YWdnZWRfYWRkcl9jdHJsKG1pbl9w
bWxlbiwgdHJ1ZSkgPT0gLUVJTlZBTCwKPiA+ICsJCQkgInN5c2N0bCBkaXNhYmxlZFxuIik7Cj4g
Cj4gV2h5IGRpZCB5b3UgY2hhbmdlIHRoZSB0ZXN0IGZyb20gMCB0byAtRUlOVkFMIGhlcmU/CgpU
aGFuayB5b3UgZm9yIHBvaW50aW5nIHRoYXQgb3V0LCBjb3B5LXBhc3RlIGlzc3VlLCBJIHdpbGwg
cmV2ZXJ0IHRoYXQgY2hhbmdlIQoKLSBDaGFybGllCgo+IAo+IFRoYW5rcywKPiAKPiBBbGV4Cj4g
Cj4gCj4gPiAgIAlzZXRfdGFnZ2VkX2FkZHJfY3RybCgwLCBmYWxzZSk7Cj4gPiAKPiA+IC0tLQo+
ID4gYmFzZS1jb21taXQ6IDQwMzg0Yzg0MGVhMTk0NGQ3YzVhMzkyZTg5NzVlZDA4OGVjZjBiMzcK
PiA+IGNoYW5nZS1pZDogMjAyNDEyMDQtZml4X3dhcm5pbmdzX3BvaW50ZXJfbWFza2luZ190ZXN0
cy0zODYwZTRmMzU0MjkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
