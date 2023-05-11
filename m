Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373EBC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 07:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4lX5/Eiez67RVU2wp4IwUb6dNYxON1vpPL/MibKBY68=; b=zPQ43YoOqmJJt2
	6701OyH15bS5fw+fe/vWRdTqTD9hBTFPx8d5WOx2Jv204tcE7cQqnk8W/x/+Cd0osZJtiUF3MaCZ8
	OgW7O1zJWUC37Zx2DcJclSIqzqsL2s0vbmi0OvVn43vYoNViPx5ppLhQm0lLeyOc1avcxWu8rM4Q7
	ksHFVQSDoTIGoJ1QcsNMp45crlLk6PePq+/L2u8PsJkQGboCkpcKL1JyhKKooBDAsBwSuoXXAZWmT
	jRhQlC1ccodIF4DIEoN75KtnbZ1w5lAFucOuAtxsYTxamTzbsiWHH+BQ6Vptia0ErRqEuTa3u2mGP
	oQRUMmQeXaEnchGWqowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px0aR-0086r1-10;
	Thu, 11 May 2023 07:19:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px0aO-0086qb-1F
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 07:19:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E4CA6172E;
	Thu, 11 May 2023 07:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF67C433D2;
	Thu, 11 May 2023 07:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683789574;
	bh=RldIo1naMhWsjg+eblgYl0fqvCmzAXd9XT2gYmTJlYY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TCHeOcbFHEFBlnfvO2DcVzeUngNfP9qkTplOBwpJtXXFm9ai6OdBnNDT9v2KbJldH
	 GSKdJOlY20kYo0JrPMQ2XgkAFVs57BEzQ42lZst5p2ifzeNZ7VwJi6VWWM+pRJoXvc
	 luYYyULNuHr2AYM9rq9TfPfl/4j7N3zOiDwABp1n+b2N5KVKOQ62R2Xvd9ZeOmW6a0
	 wmINNZvpe1S+4QkmnGCbzBhPCJgRNmWc2lFoa4Z5Hd7q91FjRrBOIJDfIRb3zck7wP
	 Nfr1vK3OlwFDEm3utEc61YVW68cxEaekwQSEfBg35kihDnjzGjRk/t9WlrwPHI4DQP
	 TsO/jDqPF2aeg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Song Shuai <suagrfillet@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mhiramat@kernel.org, mark.rutland@arm.com, guoren@kernel.org,
 suagrfillet@gmail.com, jszhang@kernel.org, e.shatokhin@yadro.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH V9 3/4] riscv: ftrace: Add
 DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
In-Reply-To: <20230510101857.2953955-4-suagrfillet@gmail.com>
References: <20230510101857.2953955-1-suagrfillet@gmail.com>
 <20230510101857.2953955-4-suagrfillet@gmail.com>
Date: Thu, 11 May 2023 09:19:31 +0200
Message-ID: <87ttwjjpx8.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_001936_519319_C5FF3088 
X-CRM114-Status: GOOD (  20.96  )
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

U29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPiB3cml0ZXM6Cgo+IFRoaXMgcGF0Y2gg
YWRkcyBEWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUyBzdXBwb3J0IGZvciBSSVNDLVYu
Cj4KPiBzZWxlY3QgdGhlIERZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExTIHRvIHByb3Zp
ZGUgdGhlCj4gcmVnaXN0ZXJfZnRyYWNlX2RpcmVjdFtfbXVsdGldIGludGVyZmFjZXMgYWxsb3dp
bmcgdXNlcnMgdG8gcmVnaXN0ZXIKPiB0aGUgY3VzdG9tZWQgdHJhbXBvbGluZSAoZGlyZWN0X2Nh
bGxlcikgYXMgdGhlIG1jb3VudCBmb3Igb25lIG9yCj4gbW9yZSB0YXJnZXQgZnVuY3Rpb25zLiBB
bmQgbW9kaWZ5X2Z0cmFjZV9kaXJlY3RbX211bHRpXSBhcmUgYWxzbwo+IHByb3ZpZGVkIGZvciBt
b2RpZnlpbmcgZGlyZWN0X2NhbGxlci4KPgo+IFRvIG1ha2UgdGhlIGRpcmVjdF9jYWxsZXIgYW5k
IHRoZSBvdGhlciBmdHJhY2UgaG9va3MgKGVnLiBmdW5jdGlvbi9mZ3JhcGgKPiB0cmFjZXIsIGtb
cmV0XXByb2JlcykgY28tZXhpc3QsIGEgdGVtcG9yYXJ5IHJlZ2lzdGVyIGlzIG5vbWluYXRlZCB0
bwo+IHN0b3JlIHRoZSBhZGRyZXNzIG9mIGRpcmVjdF9jYWxsZXIgaW4gZnRyYWNlX3JlZ3NfY2Fs
bGVyLiBBZnRlciB0aGUKPiBzZXR0aW5nIG9mIHRoZSBhZGRyZXNzIGRpcmVjdF9jYWxsZXIgYnkg
ZGlyZWN0X29wcy0+ZnVuYyBhbmQgdGhlCj4gUkVTVE9SRV9SRUdTIGluIGZ0cmFjZV9yZWdzX2Nh
bGxlciwgZGlyZWN0X2NhbGxlciB3aWxsIGJlIGp1bXBlZCB0bwo+IGJ5IHRoZSBganJgIGluc3Qu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+Cj4g
VGVzdGVkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBH
dW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAg
ICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaCB8ICA4
ICsrKysrKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUyAgfCAxMCArKysrKysr
KysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IGUwNjMyNDkz
NDgyZi4uZmRmMGIyMTlhMDJjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ICsr
KyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC0xNDQsNiArMTQ0LDcgQEAgY29uZmlnIFJJU0NW
Cj4gIAlzZWxlY3QgVUFDQ0VTU19NRU1DUFkgaWYgIU1NVQo+ICAJc2VsZWN0IFpPTkVfRE1BMzIg
aWYgNjRCSVQKPiAgCXNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFIGlmICFYSVBfS0VSTkVMICYm
IE1NVSAmJiAoQ0xBTkdfU1VQUE9SVFNfRFlOQU1JQ19GVFJBQ0UgfHwgR0NDX1NVUFBPUlRTX0RZ
TkFNSUNfRlRSQUNFKQo+ICsJc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1Rf
Q0FMTFMKPiAgCXNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyBpZiBIQVZFX0RZ
TkFNSUNfRlRSQUNFCj4gIAlzZWxlY3QgSEFWRV9GVFJBQ0VfTUNPVU5UX1JFQ09SRCBpZiAhWElQ
X0tFUk5FTAo+ICAJc2VsZWN0IEhBVkVfRlVOQ1RJT05fR1JBUEhfVFJBQ0VSCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2Z0cmFjZS5oCj4gaW5kZXggODRmODU2YTMyODZlLi44NDkwNGMxZTQzNjkgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vZnRyYWNlLmgKPiBAQCAtMTE0LDYgKzExNCwxNCBAQCBzdHJ1Y3QgZnRyYWNl
X3JlZ3M7Cj4gIHZvaWQgZnRyYWNlX2dyYXBoX2Z1bmModW5zaWduZWQgbG9uZyBpcCwgdW5zaWdu
ZWQgbG9uZyBwYXJlbnRfaXAsCj4gIAkJICAgICAgIHN0cnVjdCBmdHJhY2Vfb3BzICpvcCwgc3Ry
dWN0IGZ0cmFjZV9yZWdzICpmcmVncyk7Cj4gICNkZWZpbmUgZnRyYWNlX2dyYXBoX2Z1bmMgZnRy
YWNlX2dyYXBoX2Z1bmMKPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9pZAo+ICtfX2FyY2hfZnRyYWNl
X3NldF9kaXJlY3RfY2FsbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIGFk
ZHIpCj4gK3sKPiArCQlyZWdzLT50MSA9IGFkZHI7Cj4gK30KPiArI2RlZmluZSBhcmNoX2Z0cmFj
ZV9zZXRfZGlyZWN0X2NhbGxlcihmcmVncywgYWRkcikgXAo+ICsJX19hcmNoX2Z0cmFjZV9zZXRf
ZGlyZWN0X2NhbGxlcigmKGZyZWdzKS0+cmVncywgYWRkcikKPiAgI2VuZGlmIC8qIENPTkZJR19E
WU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgKi8KPiAgCj4gICNlbmRpZiAvKiBfX0FTU0VNQkxZX18g
Ki8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TIGIvYXJjaC9y
aXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4gaW5kZXggZjI2ZTlmNmUyZmVkLi45ZDQwNWJhZWRi
NTIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4gQEAgLTIzMSw2ICsyMzEsNyBAQCBFTkRQ
Uk9DKGZ0cmFjZV9jYWxsZXIpCj4gIAo+ICAjZWxzZSAvKiBDT05GSUdfRFlOQU1JQ19GVFJBQ0Vf
V0lUSF9SRUdTICovCj4gIEVOVFJZKGZ0cmFjZV9yZWdzX2NhbGxlcikKPiArCW1vdmUJdDEsIHpl
cm8KClBsZWFzZSB1c2UgIm12IiwgYW5kIG5vdCAibW92ZSIgWzFdLgoKPiAgCVNBVkVfQUJJX1JF
R1MgMQo+ICAJUFJFUEFSRV9BUkdTCj4gIAo+IEBAIC0yMzksNyArMjQwLDEwIEBAIGZ0cmFjZV9y
ZWdzX2NhbGw6Cj4gIAljYWxsCWZ0cmFjZV9zdHViCj4gIAo+ICAJUkVTVE9SRV9BQklfUkVHUyAx
Cj4gKwlibmV6CXQxLC5MZGlyZWN0Cj4gIAlqciB0MAo+ICsuTGRpcmVjdDoKPiArCWpyIHQxCgpB
Z2Fpbiwgd2hpbGUgeW91J3JlIGRvaW5nIGNoYW5nZXMgaGVyZSwgcGxlYXNlIHRyeSB0byBhbGln
biBvcC9vcGVyYW5kcy4KCldlYXJpbmcgbXkgQlBGIGhhdCwgSSdtIGhhcHB5IHRvIGZpbmFsbHkg
Z2V0IERJUkVDVF9DQUxMUyBzdXBwb3J0IQoKVGhpcyBkb2VzIG5vdCB0YWtlIHRoZSBXSVRIX0NB
TExfT1BTIGFwcHJvYWNoIE1hcmsgc3VnZ2VzdGVkIGluIHRoZSB2Nwp0aHJlYWRzLCBidXQgZ2l2
ZW4gdGhhdCB0ZXh0IHBhdGNoaW5nIHN0b3J5IG9uIFJJU0MtViBpcyBzdGlsbCBhIGJpdCBzYWQK
KGluY29uc2lzdGVuY3kgaW4gdGhlIFJWIHRyZWUsIG5vIHNwZWNpZmljYXRpb24sIGNhbm5vdCB3
b3JrIHdpdGgKcHJlZW1wdCwgLi4uKSBJJ2Qgc2F5IHRoaXMgYXBwcm9hY2ggaXMgT0sgZm9yIG5v
dywgYW5kIHdlIGNhbiBjaGFuZ2UgdG8KV0lUSF9DQUxMX09QUyBsYXRlciBpbiBhIHdpZGVyICJs
ZXQncyBpbXByb3ZlIFJJU0MtViB0ZXh0cGF0Y2hpbmciIHdvcmsuCgpUaG91Z2h0cz8KCgpCasO2
cm4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1hc20tbWFudWFs
L2Jsb2IvbWFzdGVyL3Jpc2N2LWFzbS5tZCMtYS1saXN0aW5nLW9mLXN0YW5kYXJkLXJpc2Mtdi1w
c2V1ZG9pbnN0cnVjdGlvbnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
