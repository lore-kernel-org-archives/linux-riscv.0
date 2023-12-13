Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA95C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 10:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZXNbWCInbS0GJS0Z8tvvcNOuA/139SjzZkXjYC+new=; b=P/cxIBctRo0Q/Y
	YMyKN80cmG8k3oZRNmykhhFux2KuId2hO84yZi1es69yKLyvjgcAaVWS6hc29pOP+9COGsA5wYC7n
	R4IIdrjJAz4YY4cczrnAzxNUxltDmaGN3AQcTY9qupcWvTqaJW/kqvtxPC5+P/j1+o4xfaayLusFz
	r8WFMcEa/M7GCx7Ab5fNyFZGfuIDxdLGEaIoh2SKY8WhRRQzpRAwetRBWbZmOXbQBGY9yTigyPir0
	apB3JeoSqK5rOpajDIs4fUywqsPbh58plffJ5Scxf+Qom328kZ8ZOyCeqPpYX3uDEMEjJdzwDXYGI
	ODNQg408nymYWPoFEJyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDMSZ-00EFNB-37;
	Wed, 13 Dec 2023 10:27:23 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDMSW-00EFLu-2H
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 10:27:23 +0000
X-QQ-mid: bizesmtp79t1702463167tcr6ufva
Received: from [10.4.6.71] ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 13 Dec 2023 18:26:02 +0800 (CST)
X-QQ-SSF: 00200000000000B0B000000A0000000
X-QQ-FEAT: hoArX50alxEwBXgz7H828rQPfU4yCvC4EsFNNxEEJw9G+Qj6wXQGud/XnpIeu
	gzsjzr7vzPbJdkTk7qpCyHhAXmN6jsoOMT6g5nDU/+/oXwJCQXaFLBKP2t52SEDxqnZV7jM
	LO7odQU8OgeMDCiBukYm3Qj3gDWvNQS00C5P3OYGX7XfzyTwW25djjB2AAAHwafzTGVBT42
	2GXhZMmLANroa6P8eXuDmRuHBW1qawrpw+WNDoYf7/02e0ySkvPrE9LdsBN0Jf9xxBE00lT
	Mp8i9YaSLZfixre13lDKyjJh63qGtZgJtYcGazaGhR0aIbH0cZP7SGovFgoSmg+4Y0pLMyL
	T6suoB3IITd8Y7IA1iXkYe8XM8v+UJYB87XFdVrn1p2Zo93qzlQ6351rbbH5Q==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2304332684790857452
Message-ID: <F2DEAEC9AF268DB2+dab1e766-962a-de7a-4b89-0498a43d177d@tinylab.org>
Date: Wed, 13 Dec 2023 18:26:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V2 0/2] riscv: kexec_file: Support loading Image binary
 file
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 lihuafei1@huawei.com, conor.dooley@microchip.com, liaochang1@huawei.com,
 guoren@kernel.org, ajones@ventanamicro.com, alexghiti@rivosinc.com,
 evan@rivosinc.com, sunilvl@ventanamicro.com,
 xianting.tian@linux.alibaba.com, samitolvanen@google.com,
 masahiroy@kernel.org, apatel@ventanamicro.com, jszhang@kernel.org,
 duwe@suse.de, eric.devolder@oracle.com, emil.renner.berthing@canonical.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231016092006.3347632-1-songshuaishuai@tinylab.org>
From: Song Shuai <songshuaishuai@tinylab.org>
In-Reply-To: <20231016092006.3347632-1-songshuaishuai@tinylab.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_022721_079049_76DE63CF 
X-CRM114-Status: GOOD (  15.35  )
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

CgrlnKggMjAyMy8xMC8xNiAxNzoyMCwgU29uZyBTaHVhaSDlhpnpgZM6Cj4gQ2hhbmdlcyBzaW5j
ZSBWMToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDkxNDAyMDA0
NC4xMzk3MzU2LTEtc29uZ3NodWFpc2h1YWlAdGlueWxhYi5vcmcvCj4gCj4gLSBQYXRjaDE6IGZp
eCB0aGUgYnVpbGQgZXJyb3IgZHVlIHRvIHRoZSBtaXNzaW5nIGZ1bmN0aW9ucyBpbiBtYWNoaW5l
X2tleGVjX2ZpbGUuYwo+IC0gUGF0Y2gyOiB1c2UgRklFTERfR0VUKCkgdG8gZ2V0IHRoZSBmbGFn
cydzIGVuZGlhbm5lc3MgYXMgRW1pbCBwcm9wb3NlZAo+IC0gQ292ZXI6IHVwZGF0ZSB0aGUga2V4
ZWMtdG9vbHMgbGluayBhcyB0aGlzIG9uZVsyXSB3aGljaCBpcyBiYXNlZCBvbiBob3Jtcy9rZXhl
Yy10b29scyBtYWluIGJyYW5jaApwaW5nIC4uLgo+IAo+IFRoaXMgc2VyaWVzIG1ha2VzIHRoZSBr
ZXhlY19maWxlX2xvYWQoKSBzeXNjYWxsIHN1cHBvcnQgdG8gbG9hZCBJbWFnZSBiaW5hcnkgZmls
ZS4KPiBBdCB0aGUgc2FtZSB0aW1lLCBjb3JyZXNwb25kaW5nIHN1cHBvcnQgZm9yIGtleGVjLXRv
b2xzIGhhZCBiZWVuIHB1c2hlZCB0byBteSByZXBvWzJdLgo+IAo+IE5vdywgd2UgY2FuIGxldmVy
YWdlIHRoYXQga2V4ZWMtdG9vbHMgYW5kIHRoaXMgc2VyaWVzIHRvIHVzZSB0aGUKPiBrZXhlY19s
b2FkKCkgb3Iga2V4ZWNfZmlsZV9sb2FkKCkgc3lzY2FsbCB0byBib290IGJvdGggdm1saW51eAo+
IGFuZCBJbWFnZSBmaWxlLCBhcyBzZWVuIGluIHRoZXNlIGNvbWJvIHRlc3RzOgo+IAo+IGBgYAo+
IDEuIGtleGVjIC1sIHZtbGludXggW290aGVyIG9wdGlvbnNdIC8vIG9yIGJvb3QgcGFuaWNlZCBr
ZXJuZWwgd2l0aCAtcAo+IDIuIGtleGVjIC1sIEltYWdlCj4gMy4ga2V4ZWMgLXMgLWwgdm1saW51
eAo+IDQuIGtleGVjIC1zIC1sIEltYWdlCj4gYGBgCj4gCj4gVGhvdWdoIGFsbCBvZiB0aGUgYWZv
cmVtZW50aW9uZWQgdGVzdHMgaGFkIGJlZW4gcGFzc2VkIGluIG15IFJWNjQgUWVtdS12aXJ0LAo+
IGl0IHNob3VsZCBiZSBub3RlZCB0aGF0IHRlc3RzIDMgYW5kIDQgc2hvdWxkIGJlIHRoZSBlbXBo
YXNpcyBmb3IgdGhlIGN1cnJlbnQgc2VyaWVzLgo+IAo+IH5+WzFdOiBodHRwczovL2dpdGh1Yi5j
b20vc3VnYXJmaWxsZXQva2V4ZWMtdG9vbHMvY29tbWl0cy9ydi1JbWFnZX5+Cj4gWzJdOiBodHRw
czovL2dpdGh1Yi5jb20vc3VnYXJmaWxsZXQva2V4ZWMtdG9vbHMvY29tbWl0cy9tYWluX3J2Cj4g
Cj4gU29uZyBTaHVhaSAoMik6Cj4gICAgcmlzY3Y6IGtleGVjX2ZpbGU6IFNwbGl0IHRoZSBsb2Fk
aW5nIG9mIGtlcm5lbCBhbmQgb3RoZXJzCj4gICAgcmlzY3Y6IGtleGVjX2ZpbGU6IFN1cHBvcnQg
bG9hZGluZyBJbWFnZSBiaW5hcnkgZmlsZQo+IAo+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
ZXhlYy5oICAgICAgICAgfCAgIDYgKwo+ICAgYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAg
ICAgICAgICAgfCAgIDIgKy0KPiAgIGFyY2gvcmlzY3Yva2VybmVsL2VsZl9rZXhlYy5jICAgICAg
ICAgIHwgNDY5IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGFyY2gvcmlzY3Yva2VybmVs
L2tleGVjX2VsZi5jICAgICAgICAgIHwgMTQ3ICsrKysrKysrCj4gICBhcmNoL3Jpc2N2L2tlcm5l
bC9rZXhlY19pbWFnZS5jICAgICAgICB8ICA5OCArKysrKysKPiAgIGFyY2gvcmlzY3Yva2VybmVs
L21hY2hpbmVfa2V4ZWNfZmlsZS5jIHwgMzQ0ICsrKysrKysrKysrKysrKysrKwo+ICAgNiBmaWxl
cyBjaGFuZ2VkLCA1OTYgaW5zZXJ0aW9ucygrKSwgNDcwIGRlbGV0aW9ucygtKQo+ICAgZGVsZXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2VsZl9rZXhlYy5jCj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwva2V4ZWNfZWxmLmMKPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9rZXhlY19pbWFnZS5jCj4gCgotLSAKVGhhbmtzClNvbmcg
U2h1YWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
