Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ADCC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyyBLFuCGQu6nzzkG9/Etp0o4JgmbxEA/GY6zpwAwWs=; b=GLFF03RTjpMhhl
	tY7KSfOmCMyfzoii4DH4tXGYi+HnIQJDPn/LuAbJdcTm7wWvjc55TDSawNfdLp5yYlmLUNkWFMC+u
	b5QHwHxLE5JZTMOuDx6pccn2r9efWCgnvKbTgC/QkHK4k0V68zXNLMDbqC8rK4Vd21uzV2hSs2sqP
	FgBO9K7MRz6S+jaaQS9cfDQ+GRims3achm6w+BzP3IdJhzXcHrjp9k85Wsq1ZRLVRIB68PV5MSu7O
	QbNODl4XaAHOzhbITzGNQkkeaUh7IJfmx3EPpguyWDMmZi6zSPJcwLAj/2vyPa9OaXHOZAYC0lcPb
	9GClSyub2IltEXKg3ZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUPp-008dmR-Fb; Tue, 21 Feb 2023 15:18:49 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUPm-008dkr-7J
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 15:18:48 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 2661B2000C;
	Tue, 21 Feb 2023 15:18:35 +0000 (UTC)
Message-ID: <e8b16a7b-8221-2e36-bc8f-92059d083b6b@ghiti.fr>
Date: Tue, 21 Feb 2023 16:18:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/2] scripts/decodecode: Add support for RISC-V
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
References: <20230119074738.708301-1-bjorn@kernel.org>
 <20230119074738.708301-3-bjorn@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230119074738.708301-3-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_071846_463595_114098F2 
X-CRM114-Status: GOOD (  17.47  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQmrDtnJuLAoKT24gMS8xOS8yMyAwODo0NywgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBGcm9t
OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBSSVNDLVYgaGFzIHNvbWUg
R05VIGRpc2Fzc2VtYmx5IHF1aXJrcywgZS5nLiBpdCByZXF1aXJlcyAnLUQnIHRvCj4gcHJvcGVy
bHkgZGlzYXNzZW1ibGUgLjJieXRlIGRpcmVjdGl2ZXMgc2ltaWxhciB0byBBcm0gWzFdLiBGdXJ0
aGVyLAo+IEdOVSBvYmpkdW1wIGdyb3VwcyBSSVNDLVYgaW5zdHJ1Y3Rpb24gYnkgMiBvciA0IGJ5
dGUgY2h1bmtzLCBpbnN0ZWFkCj4gZG9pbmcgYnl0ZS1mb3ItYnl0ZS4KPgo+IEFkZCB0aGUgcmVx
dWlyZWQgc3dpdGNoZXMsIGFuZCB0cmFuc2xhdGUgZnJvbSBzaG9ydC93b3JkIHRvIGJ5dGVzIHdo
ZW4KPiBBUkNIIGlzICJyaXNjdiIuCj4KPiBBbiBleGFtcGxlIGhvdyB0byBpbnZva2UgZGVjb2Rl
Y29kZSBmb3IgUklTQy1WOgo+ICAgICQgZWNobyAnQ29kZTogYmY0NSBmNzkzIDEwMDcgZjdkOSA1
MGVmIDM3YWYgZDU0MSBiN2Q5IDcwOTcgMDBjOCAoODBlNykKPiAgICA2MTQwJyB8IEFGTEFHUz0i
LW1hcmNoPXJ2NjRpbWFjX3ppY2JvbV96aWhpbnRwYXVzZSIgIFwKPiAgICBBUkNIPXJpc2N2IENS
T1NTX0NPTVBJTEU9cmlzY3Y2NC1saW51eC1nbnUtIC4vc2NyaXB0cy9kZWNvZGVjb2RlCj4gICAg
Q29kZTogYmY0NSBmNzkzIDEwMDcgZjdkOSA1MGVmIDM3YWYgZDU0MSBiN2Q5IDcwOTcgMDBjOCAo
ODBlNykgNjE0MAo+ICAgIEFsbCBjb2RlCj4gICAgPT09PT09PT0KPiAgICAgICAwOiAgIGJmNDUg
ICAgICAgICAgICAgICAgICAgIGMuaiAgICAgMHhmZmZmZmZmZmZmZmZmZmIwCj4gICAgICAgMjog
ICAxMDA3Zjc5MyAgICAgICAgICAgICAgICBhbmRpICAgIGE1LGE1LDI1Ngo+ICAgICAgIDY6ICAg
ZjdkOSAgICAgICAgICAgICAgICAgICAgYy5ibmV6ICBhNSwweGZmZmZmZmZmZmZmZmZmOTQKPiAg
ICAgICA4OiAgIDM3YWY1MGVmICAgICAgICAgICAgICAgIGphbCAgICAgcmEsMHhmNTM4Mgo+ICAg
ICAgIGM6ICAgZDU0MSAgICAgICAgICAgICAgICAgICAgYy5iZXF6ICBhMCwweGZmZmZmZmZmZmZm
ZmZmOTQKPiAgICAgICBlOiAgIGI3ZDkgICAgICAgICAgICAgICAgICAgIGMuaiAgICAgMHhmZmZm
ZmZmZmZmZmZmZmQ0Cj4gICAgICAxMDogICAwMGM4NzA5NyAgICAgICAgICAgICAgICBhdWlwYyAg
IHJhLDB4Yzg3Cj4gICAgICAxNDoqICA2MTQwODBlNyAgICAgICAgICAgICAgICBqYWxyICAgIHJh
LDE1NTYocmEpICMgMHhjODc2MjQgICAgICAgICAgPC0tIHRyYXBwaW5nIGluc3RydWN0aW9uCj4K
PiAgICBDb2RlIHN0YXJ0aW5nIHdpdGggdGhlIGZhdWx0aW5nIGluc3RydWN0aW9uCj4gICAgPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICAgICAgIDA6ICAgNjE0
MDgwZTcgICAgICAgICAgICAgICAgamFsciAgICByYSwxNTU2KHJhKQo+Cj4gWzFdIGh0dHBzOi8v
c291cmNld2FyZS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTEwMjYzCj4KPiBTaWduZWQt
b2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gLS0tCj4gICBzY3Jp
cHRzL2RlY29kZWNvZGUgfCAxMiArKysrKysrKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9kZWNv
ZGVjb2RlIGIvc2NyaXB0cy9kZWNvZGVjb2RlCj4gaW5kZXggYjI4ZmQyNjg2NTYxLi44ZmU3MWMy
OTIzODEgMTAwNzU1Cj4gLS0tIGEvc2NyaXB0cy9kZWNvZGVjb2RlCj4gKysrIGIvc2NyaXB0cy9k
ZWNvZGVjb2RlCj4gQEAgLTkzLDYgKzkzLDExIEBAIGRpc2FzKCkgewo+ICAgCQkke0NST1NTX0NP
TVBJTEV9c3RyaXAgJHQubwo+ICAgCWZpCj4gICAKPiArCWlmIFsgIiRBUkNIIiA9ICJyaXNjdiIg
XTsgdGhlbgo+ICsJCU9CSkRVTVBGTEFHUz0iLU0gbm8tYWxpYXNlcyAtLXNlY3Rpb249LnRleHQg
LUQiCj4gKwkJJHtDUk9TU19DT01QSUxFfXN0cmlwICR0Lm8KPiArCWZpCj4gKwo+ICAgCWlmIFsg
JHBjX3N1YiAtbmUgMCBdOyB0aGVuCj4gICAJCWlmIFsgJFBDIF07IHRoZW4KPiAgIAkJCWFkal92
bWE9JCgoICRQQyAtICRwY19zdWIgKSkKPiBAQCAtMTI2LDggKzEzMSwxMyBAQCBnZXRfc3Vic3Ry
X29wY29kZV9ieXRlc19udW0oKQo+ICAgCWRvCj4gICAJCXN1YnN0cis9IiRvcGMiCj4gICAKPiAr
CQlvcGNvZGU9IiRzdWJzdHIiCj4gKwkJaWYgWyAiJEFSQ0giID0gInJpc2N2IiBdOyB0aGVuCj4g
KwkJCW9wY29kZT0kKGVjaG8gJG9wY29kZSB8IHRyICcgJyAnXG4nIHwgdGFjIHwgdHIgLWQgJ1xu
JykKPiArCQlmaQo+ICsKPiAgIAkJIyByZXR1cm4gaWYgb3Bjb2RlIGJ5dGVzIGRvIG5vdCBtYXRj
aCBAb3BsaW5lIGFueW1vcmUKPiAtCQlpZiAhIGVjaG8gJG9wbGluZSB8IGdyZXAgLXEgIiRzdWJz
dHIiOwo+ICsJCWlmICEgZWNobyAkb3BsaW5lIHwgZ3JlcCAtcSAiJG9wY29kZSI7Cj4gICAJCXRo
ZW4KPiAgIAkJCWJyZWFrCj4gICAJCWZpCgoKVGVzdGVkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFs
ZXhnaGl0aUByaXZvc2luYy5jb20+CgpUaGFua3MsIHRoYXQncyB2ZXJ5IHVzZWZ1bCEKCkFsZXgK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
