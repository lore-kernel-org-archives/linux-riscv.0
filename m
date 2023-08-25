Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672D1C3DA66
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 15:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FJX008aIu0q4iXO8OY5RasvJD3Q7kWk3J+hJgTCO/A=; b=XZs57N9BIE6l0Y
	2p0VVaacyBhDhrGr+m7TnDNip3RIDIfOP2Af36NVfzsC7gEzAa8bxTf5/M4iIn5ABc4eZd1haoJI6
	t6Buy5wQA48mMqbWwe+4JcboyPYnIld41k2x7vosTAepJjLFZoLRQ370Qb4HLinGUK6Cq4eqdxNdk
	UWJATPxlsW7vFbf87k4aXZAvln3ru7nudxRAMMeviwcOiVrN7nchI2JuHPZW1Fq22fd45Fofq/HCe
	cwpBw37j/0gPye1GMvK3n0tcyRA7xSd/0U2tbj3MJ7fCTH5159oV15cCiKWn9o8uEdp9jEeIvTloE
	pPBIoiTWrvCmA+E8WsvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZYjk-005gVu-0V;
	Fri, 25 Aug 2023 15:28:36 +0000
Received: from out-253.mta0.migadu.com ([2001:41d0:1004:224b::fd])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZYjh-005gUx-0X
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 15:28:34 +0000
Message-ID: <2f4f0dfc-ec06-8ac8-a56a-395cc2373def@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692977303; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADrLm5FOhZF0BsOKum99yg64wr70c47LcebFXo6vRbY=;
	b=suRiEhi9s5GtH5k5XB+bLSj2CG4LmY29+v8rAFBSIX0P0CM5GGPGB2UVUxfIBGSiuI1qC5
	S2KE9mX/bMG7FEA9ljHKBxhlUlZQ72CiiZs/uHp6DJ49TFquhQd9xDwEU2I4IK05E6mzUy
	6m4fAQ/z4am5+Xv/lDatMDd3hLZjsLQ=
Date: Fri, 25 Aug 2023 08:28:17 -0700
MIME-Version: 1.0
Subject: Re: WARNING: CPU: 3 PID: 261 at kernel/bpf/memalloc.c:342
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_082833_366756_F09296BE 
X-CRM114-Status: GOOD (  12.68  )
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
Reply-To: yonghong.song@linux.dev
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA4LzI1LzIzIDM6MzIgQU0sIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gSSdtIGNoYXNpbmcg
YSB3b3JrcXVldWUgaGFuZyBvbiBSSVNDLVYvcWVtdSAoVENHKSwgdXNpbmcgdGhlIGJwZgo+IHNl
bGZ0ZXN0cyBvbiBicGYtbmV4dCA5ZTNiNDdhYmViOGYuCj4gCj4gSSdtIGFibGUgdG8gcmVwcm9k
dWNlIHRoZSBoYW5nIGJ5IG11bHRpcGxlIHJ1bnMgb2Y6Cj4gICB8IC4vdGVzdF9wcm9ncyAtYSBs
aW5rX2FwaSAtYSBsaW5rZWRfbGlzdAo+IEknbSBjdXJyZW50bHkgaW52ZXN0aWdhdGluZyB0aGF0
Lgo+IAo+IEJ1dCEgU29tZXRpbWVzIChldmVyeSBibHVlIG1vb24pIEkgZ2V0IGEgd2Fybl9vbl9v
bmNlIGhpdDoKPiAgIHwgLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gICB8
IFdBUk5JTkc6IENQVTogMyBQSUQ6IDI2MSBhdCBrZXJuZWwvYnBmL21lbWFsbG9jLmM6MzQyIGJw
Zl9tZW1fcmVmaWxsKzB4MWZjLzB4MjA2Cj4gICB8IE1vZHVsZXMgbGlua2VkIGluOiBicGZfdGVz
dG1vZChPRSkKPiAgIHwgQ1BVOiAzIFBJRDogMjYxIENvbW06IHRlc3RfcHJvZ3MtY3B1diBUYWlu
dGVkOiBHICAgICAgICAgICBPRSAgICBOIDYuNS4wLXJjNS0wMTc0My1nZGNiMTUyYmI4MzI4ICMy
Cj4gICB8IEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiAgIHwgZXBjIDog
YnBmX21lbV9yZWZpbGwrMHgxZmMvMHgyMDYKPiAgIHwgIHJhIDogaXJxX3dvcmtfc2luZ2xlKzB4
NjgvMHg3MAo+ICAgfCBlcGMgOiBmZmZmZmZmZjgwMWIxYmM0IHJhIDogZmZmZmZmZmY4MDE1ZmU4
NCBzcCA6IGZmMjAwMDAwMDAwMWJlMjAKPiAgIHwgIGdwIDogZmZmZmZmZmY4MmQyNjEzOCB0cCA6
IGZmNjAwMDAwODQ3N2E4MDAgdDAgOiAwMDAwMDAwMDAwMDQ2NjAwCj4gICB8ICB0MSA6IGZmZmZm
ZmZmODEyYjZkZGMgdDIgOiAwMDAwMDAwMDAwMDAwMDAwIHMwIDogZmYyMDAwMDAwMDAxYmU3MAo+
ICAgfCAgczEgOiBmZjVmZmZmZmZmZmU4OTk4IGEwIDogZmY1ZmZmZmZmZmZlODk5OCBhMSA6IGZm
NjAwMDAzZmVmNGIwMDAKPiAgIHwgIGEyIDogMDAwMDAwMDAwMDAwMDAzZiBhMyA6IGZmZmZmZmZm
ODAwMDgyNTAgYTQgOiAwMDAwMDAwMDAwMDAwMDYwCj4gICB8ICBhNSA6IDAwMDAwMDAwMDAwMDAw
ODAgYTYgOiAwMDAwMDAwMDAwMDAwMDAwIGE3IDogMDAwMDAwMDAwMDczNTA0OQo+ICAgfCAgczIg
OiBmZjVmZmZmZmZmZmU4OTk4IHMzIDogMDAwMDAwMDAwMDAwMDAyMiBzNCA6IDAwMDAwMDAwMDAw
MDEwMDAKPiAgIHwgIHM1IDogMDAwMDAwMDAwMDAwMDAwNyBzNiA6IGZmNWZmZmZmZmZmZTg1NzAg
czcgOiBmZmZmZmZmZjgyZDZiZDMwCj4gICB8ICBzOCA6IDAwMDAwMDAwMDAwMDAwM2YgczkgOiBm
ZmZmZmZmZjgyZDJjNWU4IHMxMDogMDAwMDAwMDAwMDAwZmZmZgo+ICAgfCAgczExOiBmZmZmZmZm
ZjgyZDJjNWQ4IHQzIDogZmZmZmZmZmY4MWVhOGYyOCB0NCA6IDAwMDAwMDAwMDAwMDAwMDAKPiAg
IHwgIHQ1IDogZmY2MDAwMDA4ZmQyODI3OCB0NiA6IDAwMDAwMDAwMDAwNDAwMDAKPiAgIHwgc3Rh
dHVzOiAwMDAwMDAwMjAwMDAwMTAwIGJhZGFkZHI6IDAwMDAwMDAwMDAwMDAwMDAgY2F1c2U6IDAw
MDAwMDAwMDAwMDAwMDMKPiAgIHwgWzxmZmZmZmZmZjgwMWIxYmM0Pl0gYnBmX21lbV9yZWZpbGwr
MHgxZmMvMHgyMDYKPiAgIHwgWzxmZmZmZmZmZjgwMTVmZTg0Pl0gaXJxX3dvcmtfc2luZ2xlKzB4
NjgvMHg3MAo+ICAgfCBbPGZmZmZmZmZmODAxNWZlYjQ+XSBpcnFfd29ya19ydW5fbGlzdCsweDI4
LzB4MzYKPiAgIHwgWzxmZmZmZmZmZjgwMTVmZWZhPl0gaXJxX3dvcmtfcnVuKzB4MzgvMHg2Ngo+
ICAgfCBbPGZmZmZmZmZmODAwMDgyOGE+XSBoYW5kbGVfSVBJKzB4M2EvMHhiNAo+ICAgfCBbPGZm
ZmZmZmZmODAwYTVjM2E+XSBoYW5kbGVfcGVyY3B1X2RldmlkX2lycSsweGE0LzB4MWY4Cj4gICB8
IFs8ZmZmZmZmZmY4MDA5ZmFmYT5dIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnErMHgyOC8weDM2
Cj4gICB8IFs8ZmZmZmZmZmY4MDBhZTU3MD5dIGlwaV9tdXhfcHJvY2VzcysweGFjLzB4ZmEKPiAg
IHwgWzxmZmZmZmZmZjgwMDBhOGVhPl0gc2JpX2lwaV9oYW5kbGUrMHgyZS8weDg4Cj4gICB8IFs8
ZmZmZmZmZmY4MDA5ZmFmYT5dIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnErMHgyOC8weDM2Cj4g
ICB8IFs8ZmZmZmZmZmY4MDdlZTcwZT5dIHJpc2N2X2ludGNfaXJxKzB4MzYvMHg0ZQo+ICAgfCBb
PGZmZmZmZmZmODEyYjVkM2E+XSBoYW5kbGVfcmlzY3ZfaXJxKzB4NTQvMHg4Ngo+ICAgfCBbPGZm
ZmZmZmZmODEyYjY5MDQ+XSBkb19pcnErMHg2Ni8weDk4Cj4gICB8IC0tLVsgZW5kIHRyYWNlIDAw
MDAwMDAwMDAwMDAwMDAgXS0tLQo+IAo+IENvZGU6Cj4gICB8IHN0YXRpYyB2b2lkIGZyZWVfYnVs
ayhzdHJ1Y3QgYnBmX21lbV9jYWNoZSAqYykKPiAgIHwgewo+ICAgfCAJc3RydWN0IGJwZl9tZW1f
Y2FjaGUgKnRndCA9IGMtPnRndDsKPiAgIHwgCXN0cnVjdCBsbGlzdF9ub2RlICpsbG5vZGUsICp0
Owo+ICAgfCAJdW5zaWduZWQgbG9uZyBmbGFnczsKPiAgIHwgCWludCBjbnQ7Cj4gICB8Cj4gICB8
IAlXQVJOX09OX09OQ0UodGd0LT51bml0X3NpemUgIT0gYy0+dW5pdF9zaXplKTsKPiAgIHwgLi4u
Cj4gCj4gSSdtIG5vdCB3ZWxsIHZlcnNlZCBpbiB0aGUgbWVtb3J5IGFsbG9jYXRvcjsgQmVmb3Jl
IEkgZGl2ZSBpbnRvIGl0IC0tCj4gaGFzIGFueW9uZSBlbHNlIGhpdCBpdD8gSWRlYXMgb24gd2h5
IHRoZSB3YXJuX29uX29uY2UgaXMgaGl0PwoKTWF5YmUgdGFrZSBhIGxvb2sgYXQgdGhlIHBhdGNo
CiAgIDgyMmZiMjZiZGI1NSAgYnBmOiBBZGQgYSBoaW50IHRvIGFsbG9jYXRlZCBvYmplY3RzLgoK
SW4gdGhlIGFib3ZlIHBhdGNoLCB3ZSBoYXZlCgorICAgICAgIC8qCisgICAgICAgICogUmVtZW1i
ZXIgYnBmX21lbV9jYWNoZSB0aGF0IGFsbG9jYXRlZCB0aGlzIG9iamVjdC4KKyAgICAgICAgKiBU
aGUgaGludCBpcyBub3QgYWNjdXJhdGUuCisgICAgICAgICovCisgICAgICAgYy0+dGd0ID0gKihz
dHJ1Y3QgYnBmX21lbV9jYWNoZSAqKilsbG5vZGU7CgpJIHN1c3BlY3QgdGhhdCB0aGUgd2Fybmlu
ZyBtYXkgYmUgcmVsYXRlZCB0byB0aGUgYWJvdmUuCkkgdHJpZWQgdGhlIGFib3ZlIC4vdGVzdF9w
cm9ncyBjb21tYW5kIGxpbmUgKHJ1bm5pbmcgbXVsdGlwbGUKYXQgdGhlIHNhbWUgdGltZSkgYW5k
IGRpZG4ndCB0cmlnZ2VyIHRoZSBpc3N1ZS4KCj4gCj4gCj4gQmrDtnJuCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
