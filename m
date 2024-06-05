Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9829DC25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 04:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKfr8imbmQHw3QVDlgx+oPVFrKQbPpCda2wd32rYapg=; b=G5+HOVyPWJ6O1q
	xLLyxi7DU5YcajhEu7OFCdMkf1Jp5v7wM+sQPL91yMMCrBrFLxTJehY6roAVpv5h1iZd6uPxr/fm0
	cUYsoW65iMkKXvyyI9kYAtQ+1u3XF77GnkKIaKGFPfJzz6t00yBvzdXf8s4h8MDpE+NkHGDxmoeKe
	obkF21etknhp2NrmYng7g5xDWTGfWzaIBZx0PaNwGtso2gvvrUV44Z9qG9K3A7nELXNSJQYmt/CMe
	FxsGYSDGpUOvgYuC3BkKhmzUjrhqrKVbZObAOk3kU9vudLp6CuAFRyNaXmfi50x1oghNXqcDKkt7T
	/djGMCgGD9++cURaH9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEicj-00000004dNi-45km;
	Wed, 05 Jun 2024 04:51:45 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEicg-00000004dNK-3Wkv
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 04:51:44 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7eb307de488so57275839f.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 21:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717563098; x=1718167898; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+9KIC2ZMxoi+KaQ4+bun3D6PF4buG3kzbZsU0iekQA=;
        b=aIgj5Ho+ErJPhE4aFBXKM2sQE8tyQqI15hdJJAIuer6tEieqznkFHo1xEGuLbbRvjL
         ZeTo1ClRdoTMfDivfhZ3Jys5WZdon98lhccAgxkpT3HiRND70jOvbQJehOM97uJ/tifq
         rFAJDXk/d5nyy+RW05C0Kw2wJzJDFUkilrsan+Pp68PR49sveZLx0dXmJbGBBr2tdlQk
         XAvzDhx54l21Fr2r0vK7+niRV4qR2SiPuTGdxFk9DU3EZ4iMIr/3sUeWdBQ96RHCczSj
         i2pSmFJ3GbAkucARyO9eiN2FXIoAK8s0eVxyJiTm/ch3nH158ES+mdbKc4j5Zg+0sOME
         PXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717563098; x=1718167898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+9KIC2ZMxoi+KaQ4+bun3D6PF4buG3kzbZsU0iekQA=;
        b=Z3f5zfa68e9Y0vUY8vAjO3dB1fMe6xvcTL/IyHWiJhoX6ClOMDuN8IbF2TLOfrf2Wl
         TPjDbxXC8aBXlo0dhqCvtv3KPp443wagZonbHvEj2ccB89gJiPfJvrLa4BGvJS/JWeTI
         tVOT6sj4L/FKxJrJmPrGFMHGfQ9LDyufmA9ZmPWCUK7mNEfG5unQE7ba6IcCDmnWVZPF
         2tOLSBK4tOeFRJ/zCNFia5Z7J9SLScjhDu5duItTT9bUDm/1FhotSf+kpb7g7ls84lBQ
         psH9VpZqtOd1t3fhh7j4Mq2ylR8WLTHguE2CPJX3dVD/OFjzVXe9RckF7eD5GYK6X2gl
         M9SQ==
X-Gm-Message-State: AOJu0YwJe8OZSxHtqPyNfq5Y4favwt9lgtBVJcKFsFR+tPbng8JEK6UV
	7kHQa/jTmN+TMRhnNOiCPFzEwbfyP8SGFtYVZ+pAa0HnYc+i9Lfxc/v3syLN+IUWG9j/KtNJ5cr
	zehX+NhDlZQo8k3A7h9vhUNqc/EeR8yHDZT3ogQ==
X-Google-Smtp-Source: AGHT+IHDdgM5M7Aerg3GufHIekxnMW6S0tnaUVXZfbMHW9u3OV196yASyKEW6+bqR469jIOGILXJOClrDiM+GwbYUwk=
X-Received: by 2002:a05:6602:3fc7:b0:7e1:85a5:36c0 with SMTP id
 ca18e2360f4ac-7eb3c8b52edmr187420039f.9.1717563097575; Tue, 04 Jun 2024
 21:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240531162327.2436962-1-jesse@rivosinc.com>
In-Reply-To: <20240531162327.2436962-1-jesse@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 5 Jun 2024 12:51:26 +0800
Message-ID: <CANXhq0pYNWvMxkkNPpYW4OrOXK19Rehdy3yO8u1sforyVjdTZg@mail.gmail.com>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_215142_936816_E6A9AEF4 
X-CRM114-Status: GOOD (  34.45  )
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

T24gU2F0LCBKdW4gMSwgMjAyNCBhdCAxMjoyM+KAr0FNIEplc3NlIFRhdWJlIDxqZXNzZUByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gRGVjdGVjdCB0aGUgWmtyIGV4dGVuc2lvbiBhbmQgdXNlIGl0
IHRvIHNlZWQgdGhlIGtlcm5lbCBiYXNlIGFkZHJlc3MuCj4KPiBEZXRlY3Rpb24gb2YgdGhlIGV4
dGVuc2lvbiBjYW4gbm90IGJlIGRvbmUgaW4gdGhlIHR5cGljYWwgZmFzaGlvbiwgYXMKPiB0aGlz
IGlzIHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgcHJvY2Vzcy4gSW5zdGVhZCwgYWRkIGEgdHJhcCBo
YW5kbGVyCj4gYW5kIHJ1biBpdCB0byBzZWUgaWYgdGhlIGV4dGVuc2lvbiBpcyBwcmVzZW50Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogSmVzc2UgVGF1YmUgPGplc3NlQHJpdm9zaW5jLmNvbT4KPiAtLS0K
PiAgYXJjaC9yaXNjdi9rZXJuZWwvcGkvTWFrZWZpbGUgICAgICAgICAgIHwgIDIgKy0KPiAgYXJj
aC9yaXNjdi9rZXJuZWwvcGkvYXJjaHJhbmRvbV9lYXJseS5jIHwgNzEgKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgfCAg
MyArKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3BpL2FyY2hyYW5kb21fZWFy
bHkuYwo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3BpL01ha2VmaWxlIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcGkvTWFrZWZpbGUKPiBpbmRleCA1MGJjNWVmN2RkMmYuLjkwMjVlYjUy
OTQ1YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9waS9NYWtlZmlsZQo+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3BpL01ha2VmaWxlCj4gQEAgLTMyLDUgKzMyLDUgQEAgJChvYmop
L3N0cmluZy5vOiAkKHNyY3RyZWUpL2xpYi9zdHJpbmcuYyBGT1JDRQo+ICAkKG9iaikvY3R5cGUu
bzogJChzcmN0cmVlKS9saWIvY3R5cGUuYyBGT1JDRQo+ICAgICAgICAgJChjYWxsIGlmX2NoYW5n
ZWRfcnVsZSxjY19vX2MpCj4KPiAtb2JqLXkgICAgICAgICAgOj0gY21kbGluZV9lYXJseS5waS5v
IGZkdF9lYXJseS5waS5vIHN0cmluZy5waS5vIGN0eXBlLnBpLm8gbGliLWZkdC5waS5vIGxpYi1m
ZHRfcm8ucGkubwo+ICtvYmoteSAgICAgICAgICA6PSBjbWRsaW5lX2Vhcmx5LnBpLm8gZmR0X2Vh
cmx5LnBpLm8gc3RyaW5nLnBpLm8gY3R5cGUucGkubyBsaWItZmR0LnBpLm8gbGliLWZkdF9yby5w
aS5vIGFyY2hyYW5kb21fZWFybHkucGkubwo+ICBleHRyYS15ICAgICAgICAgICAgICAgIDo9ICQo
cGF0c3Vic3QgJS5waS5vLCUubywkKG9iai15KSkKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvcGkvYXJjaHJhbmRvbV9lYXJseS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGkvYXJjaHJh
bmRvbV9lYXJseS5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAu
LjMxMWJlOTM4OGI1Ywo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9w
aS9hcmNocmFuZG9tX2Vhcmx5LmMKPiBAQCAtMCwwICsxLDcxIEBACj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiArCj4gKy8qCj4gKyAqIFRvIGF2b2lkIHJld3Jp
dGVpbmcgY29kZSBpbmNsdWRlIGFzbS9hcmNocmFuZG9tLmggYW5kIGNyZWF0ZSBtYWNyb3MKPiAr
ICogZm9yIHRoZSBmdW5jdGlvbnMgdGhhdCB3b24ndCBiZSBpbmNsdWRlZC4KPiArICovCj4gKwo+
ICsjZGVmaW5lIHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KC4uLikgZmFsc2UKPiArI2RlZmlu
ZSBwcl9lcnJfb25jZSguLi4pCj4gKwo+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiArI2lu
Y2x1ZGUgPGFzbS9od2NhcC5oPgo+ICsjaW5jbHVkZSA8YXNtL2FyY2hyYW5kb20uaD4KPiArCj4g
Ky8qCj4gKyAqIEFzbSBnb3RvIGlzIG5lZWRlZCBzbyB0aGF0IHRoZSBjb21waWxlciBkb2VzIG5v
dCByZW1vdmUgdGhlIGxhYmVsLgo+ICsgKi8KPiArCj4gKyNkZWZpbmUgY3NyX2dvdG9fc3dhcChj
c3IsIHZhbCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gKyh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBfX3Y7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIF9fYXNtX18g
X192b2xhdGlsZV9fIGdvdG8oImNzcnJ3ICUwLCAiIF9fQVNNX1NUUihjc3IpICIsICUxIiAgICBc
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogIj1yIiAoX192KSA6ICJySyIg
KCYmdmFsKSAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6
ICJtZW1vcnkiIDogdmFsKTsgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIF9fdjsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gK30pCj4gKwo+ICsvKgo+ICsgKiBEZWNsYXJlIHRoZSBmdW5jdGlvbnMgdGhhdCBhcmUgZXhw
b3J0ZWQgKGJ1dCBwcmVmaXhlZCkgaGVyZSBzbyB0aGF0IExMVk0KPiArICogZG9lcyBub3QgY29t
cGxhaW4gaXQgbGFja3MgdGhlICdzdGF0aWMnIGtleXdvcmQgKHdoaWNoLCBpZiBhZGRlZCwgbWFr
ZXMKPiArICogTExWTSBjb21wbGFpbiBiZWNhdXNlIHRoZSBmdW5jdGlvbiBpcyBhY3R1YWxseSB1
bnVzZWQgaW4gdGhpcyBmaWxlKS4KPiArICovCj4gKwo+ICt1NjQgZ2V0X2thc2xyX3NlZWRfemty
KHZvaWQpOwo+ICsKPiArLyoKPiArICogVGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgYnkgc2V0dXBf
dm0gdG8gY2hlY2sgaWYgdGhlIGtlcm5lbCBoYXMgdGhlIFpLUi4KPiArICogVHJhcHMgaGF2ZW4n
dCBiZWVuIHNldCB1cCB5ZXQsIGJ1dCBzYXZlIGFuZCByZXN0b3JlIHRoZSBUVkVDIHRvIGF2b2lk
Cj4gKyAqIGFueSBzaWRlIGVmZmVjdHMuCj4gKyAqLwo+ICsKPiArc3RhdGljIGlubGluZSBib29s
IF9fbXVzdF9jaGVjayByaXNjdl9oYXNfemtyKHZvaWQpCj4gK3sKPiArICAgICAgIHVuc2lnbmVk
IGxvbmcgdHZlYzsKPiArCj4gKyAgICAgICB0dmVjID0gY3NyX2dvdG9fc3dhcChDU1JfVFZFQywg
bm90X3prcik7Cj4gKyAgICAgICBjc3Jfc3dhcChDU1JfU0VFRCwgMCk7Cj4gKyAgICAgICBjc3Jf
d3JpdGUoQ1NSX1RWRUMsIHR2ZWMpOwo+ICsgICAgICAgcmV0dXJuIHRydWU7Cj4gK25vdF96a3I6
Cj4gKyAgICAgICBjc3Jfd3JpdGUoQ1NSX1RWRUMsIHR2ZWMpOwo+ICsgICAgICAgcmV0dXJuIGZh
bHNlOwo+ICt9Cj4gKwo+ICt1NjQgZ2V0X2thc2xyX3NlZWRfemtyKHZvaWQpCj4gK3sKPiArICAg
ICAgIGNvbnN0IGludCBuZWVkZWRfc2VlZHMgPSBzaXplb2YodTY0KSAvIHNpemVvZihsb25nKTsK
PiArICAgICAgIGludCBpID0gMDsKPiArICAgICAgIHU2NCBzZWVkID0gMDsKPiArICAgICAgIGxv
bmcgKmVudHJvcHkgPSAobG9uZyAqKSgmc2VlZCk7Cj4gKwo+ICsgICAgICAgaWYgKCFyaXNjdl9o
YXNfemtyKCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAgICAgIGZvciAo
aSA9IDA7IGkgPCBuZWVkZWRfc2VlZHM7IGkrKykgewo+ICsgICAgICAgICAgICAgICBpZiAoIWNz
cl9zZWVkX2xvbmcoJmVudHJvcHlbaV0pKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biAwOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiBzZWVkOwo+ICt9Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBpbmRl
eCA5OTQwMTcxYzc5ZjAuLjhlZjFlZGQyY2RkZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21t
L2luaXQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gQEAgLTEwMjUsNiArMTAyNSw3
IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwdF9vcHNfc2V0X2xhdGUodm9pZCkKPiAgI2lmZGVmIENP
TkZJR19SQU5ET01JWkVfQkFTRQo+ICBleHRlcm4gYm9vbCBfX2luaXQgX19waV9zZXRfbm9rYXNs
cl9mcm9tX2NtZGxpbmUodWludHB0cl90IGR0Yl9wYSk7Cj4gIGV4dGVybiB1NjQgX19pbml0IF9f
cGlfZ2V0X2thc2xyX3NlZWQodWludHB0cl90IGR0Yl9wYSk7Cj4gK2V4dGVybiB1NjQgX19pbml0
IF9fcGlfZ2V0X2thc2xyX3NlZWRfemtyKHZvaWQpOwo+Cj4gIHN0YXRpYyBpbnQgX19pbml0IHBy
aW50X25va2FzbHIoY2hhciAqcCkKPiAgewo+IEBAIC0xMDQ5LDYgKzEwNTAsOCBAQCBhc21saW5r
YWdlIHZvaWQgX19pbml0IHNldHVwX3ZtKHVpbnRwdHJfdCBkdGJfcGEpCj4gICAgICAgICAgICAg
ICAgIHUzMiBrZXJuZWxfc2l6ZSA9ICh1aW50cHRyX3QpKCZfZW5kKSAtICh1aW50cHRyX3QpKCZf
c3RhcnQpOwo+ICAgICAgICAgICAgICAgICB1MzIgbnJfcG9zOwo+Cj4gKyAgICAgICAgICAgICAg
IGlmIChrYXNscl9zZWVkID09IDApCj4gKyAgICAgICAgICAgICAgICAgICAgICAga2FzbHJfc2Vl
ZCA9IF9fcGlfZ2V0X2thc2xyX3NlZWRfemtyKCk7CgpDb3VsZCB5b3UgZWxhYm9yYXRlIG9uIHdo
eSB3ZSB0cnkgdG8gZ2V0IHRoZSBzZWVkIGZyb20gRFQgZmlyc3QsCnJhdGhlciB0aGFuIGZyb20g
WktSPyBBbHNvLCBJIHdhcyB3b25kZXJpbmcgaWYsIGJ5IGFueSBjaGFuY2UsIGl0IGNhbgpsZXZl
cmFnZSBhcmNoX2dldF9yYW5kb21fc2VlZF9sb25ncygpIHRvIGdldCB0aGUgc2VlZCBpbnN0ZWFk
IG9mCl9fcGlfZ2V0X2thc2xlcl9zZWVkX3prcigpPyBUaGFua3MKCj4gICAgICAgICAgICAgICAg
IC8qCj4gICAgICAgICAgICAgICAgICAqIENvbXB1dGUgdGhlIG51bWJlciBvZiBwb3NpdGlvbnMg
YXZhaWxhYmxlOiB3ZSBhcmUgbGltaXRlZAo+ICAgICAgICAgICAgICAgICAgKiBieSB0aGUgZWFy
bHkgcGFnZSB0YWJsZSB0aGF0IG9ubHkgaGFzIG9uZSBQVUQgYW5kIHdlIG11c3QKPiAtLQo+IDIu
NDMuMAo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
