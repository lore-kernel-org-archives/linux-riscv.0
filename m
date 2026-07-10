Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFBFC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSf9p6wg3LUU7KnvwUphl+Gy+/g9kZya+Po7lIFgIDc=; b=SyWDD8fWvF7IDC
	O5vwXcFrFCoC4ubq9Ya0lKMbf3bUmNr9wKp23dKOCCTstQAFf/UYOgh0gxKHzbGfvFOZ9kqSsv1p9
	xpd8UQZ405U21nc3StNSmTV213nTP+/INdEdKhlfVtH2Z6FqmBU7ZV36cZmy37sMjgEJjG8LHuwmr
	9u+5Aq+Ga5BSB3z27U1Z7Bg7ktUSVzcsI7z37OubsDPyfCKNrs9M9F3S2aMYFx13VpMvSVDOgaJoJ
	PPMRyOfW4BgjujTbCVZdLtf4eAc9xu2gPf5HAoE2l9341BV9w9NQYKNcVTXEgurn4hDgwVRIayG8j
	2TqvhvU6Ez8MBIKe5qhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCes-000000058Qr-2cpB;
	Fri, 10 Jul 2026 14:56:54 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCep-000000058QC-36it;
	Fri, 10 Jul 2026 14:56:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783695392; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ml+DhCpPf45Z/4qAMFDX1inJx4ll4cpAPqHX1XAOkFYrT3SBF+2X1xNUUPJLWRvizcJMZUrNGm2F2YGl/aoMJOcZge7IU26m8GPDfrDoTX1hgMCr9GVbSyGzS3xCtLP82LHD9t/b5hDYAYnC6hvjNE5xA5DCn5XmRu1NlOpUyoY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783695392; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zLiGYp9m/wGqSY8bb0fHrZAj5ElYrLF6yiGUlfJ+qMQ=; 
	b=M0Eg0nQ4cf9rVWSHsT/sNKKmgpk+zGv+qg8eJwb/b/K4Yr3DkpJx054fB1YayRO8z7wd/DQCiNNHDwc04nIUI9x1nvK1zCDeBO2py7aQ6gcgNnqFwzGKcc9jJrPexN5jFSUJFX/nqh4BdiG2OY5ZzByJNj1JuO/PBfQCP/jeBKM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783695392;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=zLiGYp9m/wGqSY8bb0fHrZAj5ElYrLF6yiGUlfJ+qMQ=;
	b=m40ImWUgrfvL+/QoCcMwwJ+Pgtlgx9LtjVk4mi7IQhGrkVavVKfwHBbkFtCEx2Ud
	+Jdk0QkYo/qTGfUPcl+d6JuSfpcDp72ihGQWc7IVQYiTZ95yqP5DnbTyciiYdtZIxwe
	cjQ1Spgu6g5lMsaqJlYOfs2B4CeqjFV5DOubRgrKMfxnPiK0zfeMgD1E0Z97vZDUw7I
	jPp0Cn42fZt04GrRKzr1h2Qffkvw3f0SejtLcHYPSzl+H0xkk86YquVYa8bd3aWB65A
	/1oZJabrJh9qMJ/g19xZ/RYhSbc2UJt7EgHL1rU7HbhFnUEv0mIE30v3O3f8IByUtyc
	foDq8sKiIw==
Received: by mx.zohomail.com with SMTPS id 1783695388721436.80504654321703;
	Fri, 10 Jul 2026 07:56:28 -0700 (PDT)
Message-ID: <b8fc8356212012d92186a1a4cd3ad641f01461a6.camel@icenowy.me>
Subject: Re: [PATCH 11/12] riscv: dts: thead: Add Lichee Pi 4A IO expansions
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei	
 <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod
 Koul	 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, Han Gao	
 <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>, Emil Renner Berthing	
 <emil.renner.berthing@canonical.com>
Date: Fri, 10 Jul 2026 22:56:08 +0800
In-Reply-To: <20260507081710.4090814-12-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
	 <20260507081710.4090814-12-zhengxingda@iscas.ac.cn>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_075651_855155_F34DCADF 
X-CRM114-Status: GOOD (  12.16  )
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

5ZyoIDIwMjYtMDUtMDflm5vnmoQgMTY6MTcgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ6YGT77ya
Cj4gRnJvbTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9u
aWNhbC5jb20+Cj4gCj4gTGljaGVlIFBpIDRBIGhhcyAzIEkyQyBJTyBleHBhbnNpb24gY2hpcHMg
b25ib2FyZCwgY29ubmVjdGVkIHRvIHRoZQo+IEkyQzAvMS8zIGJ1c3Nlcy4KPiAKPiBBZGQgZGV2
aWNlIHRyZWUgbm9kZXMgZm9yIHRoZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogRW1pbCBSZW5uZXIg
QmVydGhpbmcKPiA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4KPiBbSWNlbm93
eTogYWRkZWQgY29tbWl0IGRlc2NyaXB0aW9uXQo+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhl
bmcgPHpoZW5neGluZ2RhQGlzY2FzLmFjLmNuPgoKSSBhbSBnb2luZyB0byBzZW5kIGEgbmV3ZXIg
cmV2aXNpb24gb2YgUEFUQ0ggOX4xMSBpbiBhIGZldyBkYXlzLApiZWNhdXNlIHRoZSBJMkMxIGNv
bnRyb2xsZXIgaXMgYWxyZWFkeSBhZGRlZCB0byB0aGUgbWFpbmxpbmUgZGV2aWNlCnRyZWUgZm9y
IFdpLUZpIHN1cHBvcnQsIGFsdGhvdWdoIHRoZSBhbHJlYWR5LW1lcmdlZCBwYXRjaGVzIGFyZSBh
CmxpdHRsZSB3ZWlyZC4KClRoYW5rcywKSWNlbm93eQoKPiAtLS0KPiDCoC4uLi9ib290L2R0cy90
aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0c8KgwqDCoCB8IDExMQo+ICsrKysrKysrKysrKysr
KysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDExMSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMKPiBi
L2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMKPiBpbmRl
eCA0MTk4ZGJmOTUzZjA2Li4zNTRmMzg5M2FhOGNmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMKPiArKysgYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtcGktNGEuZHRzCj4gQEAgLTE2LDYgKzE2LDkg
QEAgYWxpYXNlcyB7Cj4gwqAJCWdwaW8zID0gJmdwaW8zOwo+IMKgCQlncGlvNCA9ICZncGlvNDsK
PiDCoAkJZ3BpbzUgPSAmYW9ncGlvOwo+ICsJCWkyYzAgPSAmaTJjMDsKPiArCQlpMmMxID0gJmky
YzE7Cj4gKwkJaTJjMyA9ICZpMmMzOwo+IMKgCQlzZXJpYWwwID0gJnVhcnQwOwo+IMKgCQlzZXJp
YWwxID0gJnVhcnQxOwo+IMKgCQlzZXJpYWwyID0gJnVhcnQyOwo+IEBAIC0xMTAsNiArMTEzLDc2
IEBAIGhkbWlfb3V0X2NvbjogZW5kcG9pbnQgewo+IMKgCX07Cj4gwqB9Owo+IMKgCj4gKyZpMmMw
IHsKPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gKwlwaW5jdHJsLTAgPSA8JmkyYzBf
cGlucz47Cj4gKwljbG9jay1mcmVxdWVuY3kgPSA8MTAwMDAwPjsKPiArCWkyYy1zZGEtaG9sZC10
aW1lLW5zID0gPDMwMD47Cj4gKwlpMmMtc2RhLWZhbGxpbmctdGltZS1ucyA9IDw1MTA+Owo+ICsJ
aTJjLXNjbC1mYWxsaW5nLXRpbWUtbnMgPSA8NTEwPjsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiAr
Cj4gKwlpb2V4cDE6IGdwaW9AMTggewo+ICsJCWNvbXBhdGlibGUgPSAibnhwLHBjYTk1NTciOwo+
ICsJCXJlZyA9IDwweDE4PjsKPiArCQlncGlvLWNvbnRyb2xsZXI7Cj4gKwkJI2dwaW8tY2VsbHMg
PSA8Mj47Cj4gKwkJZ3Bpby1saW5lLW5hbWVzID0gImNhbTBfZHZkZDEyIiwKPiArCQkJCcKgICJj
YW0wX2F2ZGQyOCIsCj4gKwkJCQnCoCAiY2FtMF9kb3ZkZDE4IjsKPiArCX07Cj4gK307Cj4gKwo+
ICsmaTJjMSB7Cj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICsJcGluY3RybC0wID0g
PCZpMmMxX3BpbnM+Owo+ICsJY2xvY2stZnJlcXVlbmN5ID0gPDEwMDAwMD47Cj4gKwlpMmMtc2Rh
LWhvbGQtdGltZS1ucyA9IDwzMDA+Owo+ICsJaTJjLXNkYS1mYWxsaW5nLXRpbWUtbnMgPSA8NTEw
PjsKPiArCWkyYy1zY2wtZmFsbGluZy10aW1lLW5zID0gPDUxMD47Cj4gKwlzdGF0dXMgPSAib2th
eSI7Cj4gKwo+ICsJaW9leHAyOiBncGlvQDE4IHsKPiArCQljb21wYXRpYmxlID0gIm54cCxwY2E5
NTU3IjsKPiArCQlyZWcgPSA8MHgxOD47Cj4gKwkJZ3Bpby1jb250cm9sbGVyOwo+ICsJCSNncGlv
LWNlbGxzID0gPDI+Owo+ICsJCWdwaW8tbGluZS1uYW1lcyA9ICIiLAo+ICsJCQkJwqAgImNhbTBf
cmVzZXQiLAo+ICsJCQkJwqAgImNhbTFfcmVzZXQiLAo+ICsJCQkJwqAgImNhbTJfcmVzZXQiLAo+
ICsJCQkJwqAgIndsX2hvc3Rfd2FrZSIsCj4gKwkJCQnCoCAiYnRfcmVzZXRuIiwKPiArCQkJCcKg
ICIiLAo+ICsJCQkJwqAgImJ0X2hvc3Rfd2FrZSI7Cj4gKwl9Owo+ICt9Owo+ICsKPiArJmkyYzMg
ewo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiArCXBpbmN0cmwtMCA9IDwmaTJjM19w
aW5zPjsKPiArCWNsb2NrLWZyZXF1ZW5jeSA9IDwxMDAwMDA+Owo+ICsJaTJjLXNkYS1ob2xkLXRp
bWUtbnMgPSA8MzAwPjsKPiArCWkyYy1zZGEtZmFsbGluZy10aW1lLW5zID0gPDUxMD47Cj4gKwlp
MmMtc2NsLWZhbGxpbmctdGltZS1ucyA9IDw1MTA+Owo+ICsJc3RhdHVzID0gIm9rYXkiOwo+ICsK
PiArCWlvZXhwMzogZ3Bpb0AxOCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJueHAscGNhOTU1NyI7Cj4g
KwkJcmVnID0gPDB4MTg+Owo+ICsJCWdwaW8tY29udHJvbGxlcjsKPiArCQkjZ3Bpby1jZWxscyA9
IDwyPjsKPiArCQlncGlvLWxpbmUtbmFtZXMgPSAidHAwX3JzdCIsCj4gKwkJCQnCoCAiIiwKPiAr
CQkJCcKgICIiLAo+ICsJCQkJwqAgInZjYzV2X3VzYiIsCj4gKwkJCQnCoCAidmRkMjhfdHAwIiwK
PiArCQkJCcKgICJ2ZGQzM19sY2QwIiwKPiArCQkJCcKgICJ2ZGQxOF9sY2QwIiwKPiArCQkJCcKg
ICJsY2QwX3Jlc2V0IjsKPiArCX07Cj4gK307Cj4gKwo+IMKgJnBhZGN0cmwwX2Fwc3lzIHsKPiDC
oAlmYW5fcGluczogZmFuLTAgewo+IMKgCQlwd20xLXBpbnMgewo+IEBAIC0xMjMsNiArMTk2LDE4
IEBAIHB3bTEtcGlucyB7Cj4gwqAJCX07Cj4gwqAJfTsKPiDCoAo+ICsJaTJjM19waW5zOiBpMmMz
LTAgewo+ICsJCWkyYy1waW5zIHsKPiArCQkJcGlucyA9ICJJMkMzX1NDTCIsICJJMkMzX1NEQSI7
Cj4gKwkJCWZ1bmN0aW9uID0gImkyYyI7Cj4gKwkJCWJpYXMtZGlzYWJsZTsgLyogZXh0ZXJuYWwg
cHVsbC11cCAqLwo+ICsJCQlkcml2ZS1zdHJlbmd0aCA9IDw3PjsKPiArCQkJaW5wdXQtZW5hYmxl
Owo+ICsJCQlpbnB1dC1zY2htaXR0LWVuYWJsZTsKPiArCQkJc2xldy1yYXRlID0gPDA+Owo+ICsJ
CX07Cj4gKwl9Owo+ICsKPiDCoAl1YXJ0MF9waW5zOiB1YXJ0MC0wIHsKPiDCoAkJdHgtcGlucyB7
Cj4gwqAJCQlwaW5zID0gIlVBUlQwX1RYRCI7Cj4gQEAgLTE0Niw2ICsyMzEsMzIgQEAgcngtcGlu
cyB7Cj4gwqAJfTsKPiDCoH07Cj4gwqAKPiArJnBhZGN0cmwxX2Fwc3lzIHsKPiArCWkyYzBfcGlu
czogaTJjMC0wIHsKPiArCQlpMmMtcGlucyB7Cj4gKwkJCXBpbnMgPSAiSTJDMF9TQ0wiLCAiSTJD
MF9TREEiOwo+ICsJCQlmdW5jdGlvbiA9ICJpMmMiOwo+ICsJCQliaWFzLWRpc2FibGU7IC8qIGV4
dGVybmFsIHB1bGwtdXAgKi8KPiArCQkJZHJpdmUtc3RyZW5ndGggPSA8Nz47Cj4gKwkJCWlucHV0
LWVuYWJsZTsKPiArCQkJaW5wdXQtc2NobWl0dC1lbmFibGU7Cj4gKwkJCXNsZXctcmF0ZSA9IDww
PjsKPiArCQl9Owo+ICsJfTsKPiArCj4gKwlpMmMxX3BpbnM6IGkyYzEtMCB7Cj4gKwkJaTJjLXBp
bnMgewo+ICsJCQlwaW5zID0gIkkyQzFfU0NMIiwgIkkyQzFfU0RBIjsKPiArCQkJZnVuY3Rpb24g
PSAiaTJjIjsKPiArCQkJYmlhcy1kaXNhYmxlOyAvKiBleHRlcm5hbCBwdWxsLXVwICovCj4gKwkJ
CWRyaXZlLXN0cmVuZ3RoID0gPDc+Owo+ICsJCQlpbnB1dC1lbmFibGU7Cj4gKwkJCWlucHV0LXNj
aG1pdHQtZW5hYmxlOwo+ICsJCQlzbGV3LXJhdGUgPSA8MD47Cj4gKwkJfTsKPiArCX07Cj4gK307
Cj4gKwo+IMKgJnVhcnQwIHsKPiDCoAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+IMKgCXBp
bmN0cmwtMCA9IDwmdWFydDBfcGlucz47CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
