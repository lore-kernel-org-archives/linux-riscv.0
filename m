Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AD2C3ABB0
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 11:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktuUwJ7h0N6zm4H9dp0UPr7XF7QD0sXWp294IW1hR10=; b=MmEGV7iiadWPVK
	vQGJZrUAEZP1pjlFDmMhmB56vqSOvCtaXZy8gYL0E0QUHYLPOFoZ9P0KgkbiSyESscCbe/oic9dDJ
	akDwukIR5mU0siM/xBriO72p0h28TyeGu2kQ2Ekyl+eZJxnin0kOQlXuUWCqjVjTHKSbDJclod1YT
	9AErOlQJojm3nZhuUZ3p0GJ1M/lMmWdVws8wOAgzJpzBPIPskdzuBPxfIJC2FkAjWag8+0kS3LIli
	3UfJO5BsgrPY0WP+OdKqjf5toYNHtcKCReAb3f4zwu7lOnckyVAvu5GF9xy4Wo247K08AH4z/BXpi
	aAItKegT+yKPxzEcLzlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBtc2-000000076LS-15lN;
	Mon, 05 May 2025 11:03:54 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBtbz-000000076Ki-2zpv
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 11:03:53 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate-4.ics.forth.gr (8.16.1/ICS-FORTH/V10-1.8-GATE) with ESMTP id 545B3E4U1638298
	for <linux-riscv@lists.infradead.org>; Mon, 5 May 2025 14:03:16 +0300
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1746442994; x=1749034994;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/SZ9Avu0vKWcNbLi+LaanXc+moBJXBj6ksLSRUR8oHc=;
	b=Fx6gBNHobNIQn0ItDj/3C8fPX7nWTGtb0CtOwN827/9vZviPLaFPhXERChoo1lbR
	272ogFUe9LqToUMg2xLJtSFECk/SbICB8/88gp01D/fKj/Xd1/i/CQsIPAi0eEI1
	nWuBqX6B0AkW+0D9OvbMCYerKG5tOKhdkMb94bxiUmgP/9PUXaBEk7XhBsmTf3cf
	7T8uVO1G6Esxn0uU0ri20dq9KawCGcQYzREbiczwcPgj3hksVGscybrh/thVXMa3
	DTCMk3Zb3nO55jKP62kYAPZqPLvYlOa8Rec1qUut4tYWze8wKxTvpjvN+S1pI8co
	L6tf4rsbLp0Z9vnkB1YK3g==;
X-AuditID: 8b5b014d-b8599640001fc5c4-f8-68189af2e145
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id 89.56.50628.2FA98186; Mon,  5 May 2025 14:03:14 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Message-ID: <d7cff5d9-e36a-4b7f-95c4-9f5d170f2c46@ics.forth.gr>
Date: Mon, 5 May 2025 14:02:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] kexec-tools RISC-V port
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Simon Horman <horms@kernel.org>, Simon Horman <horms@verge.net.au>,
        Song Shuai <songshuaishuai@tinylab.org>,
        Li Zhengyu <lizhengyu3@huawei.com>, kexec@lists.infradead.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        Dave Young <dyoung@redhat.com>, Yixun Lan <yixun.lan@gmail.com>,
        Xianting Tian <xianting.tian@linux.alibaba.com>,
        linux-riscv@lists.infradead.org
References: <20250422162304.169431-1-bjorn@kernel.org>
Content-Language: en-US, el-en, el-GR
From: Nick Kossifidis <mick@ics.forth.gr>
In-Reply-To: <20250422162304.169431-1-bjorn@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNLMWRmVeSWpSXmKPExsXSHT1dWffTLIkMg5fbxC22vl/FYvH2xitG
	i4aJDSwWj/pPsFk0b/3KaLH79Fcmi22fW9gsrv8MtPj+5w6Lxf6OhWwWX7fNZXbg9tg56y67
	R8uRt6wem1Z1snnsfGjpsXlJvcf7fVfZPG7MivDY03ua1WPOz28sAZxRXDYpqTmZZalF+nYJ
	XBmNi76yF5zQqti/8CxzA+NqhS5GTg4JAROJKed/sHcxcnEICRxllFi8o4cVImEpsfnTSxYQ
	m1fAXmJz83uwOIuAisS/09OZIeKCEidnPgGrERWQl7h/awbQIA4OYQFjiYeTXEFmigj8Y5R4
	s+cqE4jDLPCcUeLd9A6wBiEBM4nnZyeBDWIWUJWY/2wT2AI2AU2J+ZcOgtVwCphLbPj8hQmi
	xkyia2sXI4QtL9G8dTbzBEaBWUjumIVk1CwkLbOQtCxgZFnFKJBYZqyXmVysl5ZfVJKhl160
	iREcP4y+Oxhvb36rd4iRiYPxEKMEB7OSCG8LMMaEeFMSK6tSi/Lji0pzUosPMUpzsCiJ856w
	XZAsJJCeWJKanZpakFoEk2Xi4JRqYNI44fvkpcXPsh6pvVs3BBsIJs5lXZkqH70uzFjiyUYJ
	QYXZD6dk7m9zWu1j97s5Or1Ok8Nmx/8M8c7OUrfe1ylqj7xfVKoHXZ15g0OvoHLer7UnSmec
	3fC17N8LgSQdiZirVlOf2rstfnHN8sPf14XaNzw/f3i/T7NJWqO6bUuq3/2JzYwl9j2T7I/M
	Fdz40sG693FxJ39HnLHafHe7mSZXhW6/eWbVfPlt5fe8fQd+Lve/cE9ryWmBKW0qYTz5Ta6m
	tlN2Z9V1pe2X/RbmKZjoFvhncq7HierFBYYmC7TmGXfsaZk6J3+69AGxyAemIULbvnBM5T6x
	dK/l/hMZya63VzSef+tn4txYdaj6gRJbcUaikamZFnNRcSIAmtwzDhADAAA=
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-4.ics.forth.gr [139.91.1.7]); Mon, 05 May 2025 14:03:16 +0300 (EEST) for IP:'139.91.1.77' DOMAIN:'av3in.ics.forth.gr' HELO:'av3.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mailgate-4.ics.forth.gr [139.91.1.7]); Mon, 05 May 2025 14:03:16 +0300 (EEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_040352_109758_25DD309C 
X-CRM114-Status: GOOD (  30.39  )
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

T24gNC8yMi8yNSAxOToyMiwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2
cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gCj4gSGkhCj4gCj4gKlBhdGNoIGhpc3RvcnkqCj4g
Cj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2tleGVjLzIwMjUwNDA5MjAxNDI4LjY0ODcx
Ny0xLWJqb3JuQGtlcm5lbC5vcmcvCj4gdjI6IEFkZGVkIEdpdGh1YiBBY3Rpb25zIHN1cHBvcnQg
Zm9yIHJpc2N2NjQgKFNpbW9uKQo+ICAgICAgU29ydGVkIGZpbGVuYW1lcyBpbiBNYWtlZmlsZSAo
U2ltb24pCj4gICAgICBBZGRlZCBtaXNzaW5nIGRpc3QgZmlsZXMgKFNpbW9uKQo+ICAgICAgRml4
ZWQgbWlwcyBidWlsZCAoU2ltb24pCj4gCj4gSGVyZSdzIGEgcGFzc2VkIENJIHJ1biB3aXRoIHRo
aXMgc2VyaWVzIG9uIG1hc3RlcjoKPiBodHRwczovL2dpdGh1Yi5jb20vYmpvdG8va2V4ZWMtdG9v
bHMvYWN0aW9ucy9ydW5zLzE0NTk3OTg4OTUyL2pvYi80MDk0ODcxNTIxNAo+IAo+IAo+ICpDb3Zl
cioKPiAKPiBUaGlzIGlzIGFuIGF0dGVtcHQgdG8gZmluYWxseSBnZXQgdGhlIFJJU0MtViBwYXRj
aGVzIGZvciBrZXhlYy10b29scwo+IHVwc3RyZWFtLgo+IAo+IFNpbW9uIHN1Z2dlc3RlZCBpbiBb
MV0gdGhhdDoKPiAKPj4gSW4gbXkgbWluZCB0aGUgYmlnIHF1ZXN0aW9uIGlzIGhvdyB0byBtb3Zl
IFJJU0MtViBzdXBwb3J0IGZyb20gdGhhdAo+PiBicmFuY2gsIHRvIGJlaW5nIG1lcmdlZCBpbnRv
IG1haW4uCj4+Cj4+IElJUkMgdGhlcmUgd2VyZSBzb21lIGlzc3VlcyB0aGF0IG5lZWRlZCB0byBi
ZSBhZGRyZXNzZWQuIFBlcmhhcHMgdGhleQo+PiBhcmUgYWxsIGFkZHJlc3NlZCBieSB0aGlzIHNl
cmllcywgYW5kIHdpdGggc29tZSBhcHByb3ByaWF0ZSBzcXVhc2hpbmcKPj4gd2UgY2FuIG1vdmUg
Zm9yd2FyZHMgd2l0aCBhIHNlcmllcyBiYXNlZCBvbiBtYWluPwo+IAo+IEkgdGFsa2VkIHRvIE5p
Y2sgbGFzdCB3ZWVrLCBhbmQgaGUgc3VnZ2VzdGVkIHRoYXQgd2UnZCB3b3JrIHRoZSBSSVNDLVYK
PiBjb2xsYWIgR2l0aHViIFsyXSwgYnV0IEkgdGhpbmsgaXQncyBqdXN0IGVhc2llciB0byBkbyBp
dCBvbiB0aGUgbGlzdC4KPiAKPiBJJ3ZlIGJlZW4gY29sbGVjdGluZyBhIG51bWJlciBvZiBkaWZm
ZXJlbnQgdHJlZXMgb3V0IHRoZXJlLCBhbmQgdHJpZWQKPiB0byBncm91cCB0aGVtIGluIGEgc2Vy
aWVzLgo+IAo+IEdpdmVuIHRoYXQgdGhlcmUgaXMgbm90IHN1cHBvcnQgZm9yIFJJU0MtViB1cHN0
cmVhbSB5ZXQsIEkgZGlkbid0IHNlZQo+IHRoZSBuZWVkIHRvIGNhcnJ5IGFsbCB0aGUgZml4ZXMv
dXBkYXRlcyAoImRldmVsb3BtZW50IGhpc3RvcnkiKSBhcwo+IHNlcGFyYXRlIGNvbW1pdHMgLS0g
aXQgZG9lc24ndCBoZWxwIGJ1Z3RyYWNraW5nL2Jpc2VjdGFiaWxpdHkuCj4gCj4gSW5zdGVhZCB0
aGUgZmlyc3QgY29tbWl0IG1lc3NhZ2UgaXMgYSBiaWcgb25lLCBhbmQgdHJpZXMgdG8gZ2l2ZQo+
IGF0dHJpYnV0aW9uIHRvIGFsbCBpbnZvbHZlZCBwYXJ0aWVzLiBJbnB1dC90aG91Z2h0cyBhcmUg
dmVyeSBtdWNoCj4gd2VsY29tZSEKPiAKPiBUbyBwcm9wZXJseSB0ZXN0IHRoaXMgb24gUklTQy1W
LCB0aGUgdXBzdHJlYW0gTGludXgga2VybmVsIGhhcyBtb3N0Cj4gdGhpbmdzIGluIDYuMTUtcmMx
LCBlLmcuOgo+IGNvbW1pdCAyODA5M2NmZWY1ZGQgKCJyaXNjdi9rZXhlY19maWxlOiBIYW5kbGUg
Ul9SSVNDVl82NCBpbiBwdXJnYXRvcnkgcmVsb2NhdG9yIikKPiBjb21taXQgM2Y3MDIzMTcxZGY0
ICgicmlzY3YvcHVyZ2F0b3J5OiA0QiBhbGlnbiBwdXJnYXRvcnlfc3RhcnQiKQo+IAo+IFRvIGNy
b3NzLWJ1aWxkIGtleGVjLXRvb2xzOgo+ICAgIHwgLi9ib290c3RyYXAKPiAgICB8IC4vY29uZmln
dXJlIC0taG9zdD1yaXNjdjY0LWxpbnV4LWdudQo+ICAgIHwgbWFrZQo+IAo+IEZvciBzb21lIHRl
c3RzLCBhZGRpdGlvbmFsIGtlcm5lbCBwYXRjaGVzIGFyZSBuZWVkZWQsIHRoYXQgYXMgb2YgdG9k
YXkKPiBpcyBub3QgaW4gNi4xNS1yYzE6Cj4gICAqIFRvIHRlc3QgImtleGVjIC1zIC1sIEltYWdl
Iiwga2V4ZWNfZmlsZV9sb2FkIHdpdGggSW1hZ2Ugc3VwcG9ydCBpcwo+ICAgICBuZWVkZWQgWzNd
Cj4gICAqIFRvIHRlc3QgImtleGVjIC1jIC1sIHZtbGludXgiIHdpdGggQ09ORklHX1JFTE9DQVRB
QkxFLCBhIGtidWlsZCBmaXgKPiAgICAgaXMgbmVlZGVkIFs0XQo+ICAgKiBUeXBpY2FsbHkgaWYg
eW91IGxvYWQgaW5pdHJkLCBvciBhIGxhcmdlIGtlcm5lbCBbNV0gKHNpbmNlIGEgYnVuY2gKPiAg
ICAgb2YgUmVzZXJ2ZWQgcmVnaW9ucyBhcmUgbm90IHByb3Blcmx5IGV4cG9zZWQpLgo+IAo+IEkn
dmUgdGVzdGVkIGNvbWJpbmF0aW9ucyB3aXRoIGNyYXNoa2VybmVsICgtcCksIGFuZCByZWd1bGFy
ICgtYy8tcyArIC1lKSBmb3I6Cj4gICAqIEFDUEkvVUVGSQo+ICAgKiBEVC9VRUZJCj4gICAqIERU
Cj4gICAqIHcvIGluaXRyZAo+ICAgKiB3L28gaW5pdHJkCj4gICAqIEVMRiAodXNlcmxhbmQgbG9h
ZGVyICsga2V4ZWNfbG9hZCwgYW5kIGtleGVjX2ZpbGVfbG9hZCkKPiAgICogSW1hZ2UgKHVzZXJs
YW5kIGxvYWRlciArIGtleGVjX2xvYWQsIGFuZCBrZXhlY19maWxlX2xvYWQpCj4gCj4gSSdtIHN1
cmUgdGhlcmUgYXJlIGNvbWJpbmF0aW9ucyBJJ3ZlIG1pc3NlZCwgYnV0IGF0IGxlYXN0IGZyb20g
bXkgUE9WCj4gd2UncmUgaW4gYSBwcmV0dHkgZ29vZCBzaGFwZS4KPiAKPiBBbGwgYXV0aG9yczog
UGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBwcmVmZXIgYW5vdGhlciBzcGxpdCBvZiB0aGUKPiBw
YXRjaGVzLiBPciBzb21ldGhpbmcgZWxzZSBmb3IgdGhhdCBtYXR0ZXIhIDstKQo+IAo+IAo+IExl
dCdzIGdldCB0aGUgYmFsbCByb2xsaW5nIQo+IEJqw7Zybgo+IAo+IFsxXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9rZXhlYy8yMDIzMDkyMDExNTYzNC5HRzIyNDM5OUBrZXJuZWwub3JnLwo+IFsy
XSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YtY29sbGFiL2tleGVjLXRvb2xzLmdpdAo+IFszXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDQwOTE5MzAwNC42NDM4Mzkt
MS1iam9ybkBrZXJuZWwub3JnLwo+IFs0XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
aXNjdi8yMDI1MDQwODA3Mjg1MS45MDI3NS0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20vCj4gWzVd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNDA5MTgyMTI5LjYzNDQx
NS0xLWJqb3JuQGtlcm5lbC5vcmcvCj4gCj4gTGkgWmhlbmd5dSAoMSk6Cj4gICAgUklTQy1WOiBF
bmFibGUga2V4ZWNfZmlsZV9sb2FkIHN5c2NhbGwKPiAKPiBOaWNrIEtvc3NpZmlkaXMgKDEpOgo+
ICAgIFJJU0MtVjogQWRkIHN1cHBvcnQgZm9yIHJpc2N2IGtleGVjL2tkdW1wIG9uIGtleGVjLXRv
b2xzCj4gCj4gU29uZyBTaHVhaSAoMik6Cj4gICAgUklTQy1WOiBTZXBhcmF0ZSBlbGZfcmlzY3Zf
ZmluZF9wYmFzZSBvdXQKPiAgICBSSVNDLVY6IFN1cHBvcnQgbG9hZGluZyBJbWFnZSBiaW5hcnkg
ZmlsZQo+IAo+ICAgLmdpdGh1Yi93b3JrZmxvd3MvYnVpbGQueW1sICAgICAgICAgICAgIHwgICAx
ICsKPiAgIGNvbmZpZ3VyZS5hYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArCj4g
ICBpbmNsdWRlL2VsZi5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICAga2V4
ZWMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgIGtleGVjL2Fy
Y2gvbWlwcy9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgMiArCj4gICBrZXhlYy9hcmNoL3Jp
c2N2L01ha2VmaWxlICAgICAgICAgICAgICAgfCAgMzggKysKPiAgIGtleGVjL2FyY2gvcmlzY3Yv
Y3Jhc2hkdW1wLXJpc2N2LmMgICAgICB8IDE0MCArKysrKysrCj4gICBrZXhlYy9hcmNoL3Jpc2N2
L2ltYWdlLWhlYWRlci5oICAgICAgICAgfCAgODggKysrKwo+ICAga2V4ZWMvYXJjaC9yaXNjdi9p
bmNsdWRlL2FyY2gvb3B0aW9ucy5oIHwgIDQzICsrCj4gICBrZXhlYy9hcmNoL3Jpc2N2L2lvbWVt
LmggICAgICAgICAgICAgICAgfCAgMTAgKwo+ICAga2V4ZWMvYXJjaC9yaXNjdi9rZXhlYy1lbGYt
cmlzY3YuYyAgICAgIHwgMTg0ICsrKysrKysrKwo+ICAga2V4ZWMvYXJjaC9yaXNjdi9rZXhlYy1p
bWFnZS1yaXNjdi5jICAgIHwgIDk1ICsrKysrCj4gICBrZXhlYy9hcmNoL3Jpc2N2L2tleGVjLXJp
c2N2LmMgICAgICAgICAgfCA1MjYgKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBrZXhlYy9h
cmNoL3Jpc2N2L2tleGVjLXJpc2N2LmggICAgICAgICAgfCAgNTMgKysrCj4gICBrZXhlYy9kdC1v
cHMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0NDIgKysrKysrKysrKysrKysrKysrKy0K
PiAgIGtleGVjL2R0LW9wcy5oICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArCj4gICBr
ZXhlYy9rZXhlYy1zeXNjYWxsLmggICAgICAgICAgICAgICAgICAgfCAgIDcgKwo+ICAgcHVyZ2F0
b3J5L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgIHB1cmdhdG9yeS9h
cmNoL3Jpc2N2L01ha2VmaWxlICAgICAgICAgICB8ICAgNyArCj4gICAxOSBmaWxlcyBjaGFuZ2Vk
LCAxNjQ4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBrZXhlYy9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQga2V4ZWMv
YXJjaC9yaXNjdi9jcmFzaGR1bXAtcmlzY3YuYwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGtleGVj
L2FyY2gvcmlzY3YvaW1hZ2UtaGVhZGVyLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBrZXhlYy9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXJjaC9vcHRpb25zLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBr
ZXhlYy9hcmNoL3Jpc2N2L2lvbWVtLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBrZXhlYy9hcmNo
L3Jpc2N2L2tleGVjLWVsZi1yaXNjdi5jCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQga2V4ZWMvYXJj
aC9yaXNjdi9rZXhlYy1pbWFnZS1yaXNjdi5jCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQga2V4ZWMv
YXJjaC9yaXNjdi9rZXhlYy1yaXNjdi5jCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQga2V4ZWMvYXJj
aC9yaXNjdi9rZXhlYy1yaXNjdi5oCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcHVyZ2F0b3J5L2Fy
Y2gvcmlzY3YvTWFrZWZpbGUKPiAKPiAKPiBiYXNlLWNvbW1pdDogMTRmNDhlYTgwZTUxMGU1YWY3
OWNhNmM0NmZhMjhlOTlhMzY5NWQxYwoKClRoYW5rcyBmb3IgZG9pbmcgdGhpcyA6LSkKClJlZ2Fy
ZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
