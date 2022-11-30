Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC80DC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIm6NHKENXzfb9q35L4ooSg0NT/UPdil607wtdRpkos=; b=i6kEYZXt7l4DSe
	ZNgOUXGnUS84YRtTLiXU/yyC+jIsdZT/z6vKal+m+U4jcLJm1Me2pm9SJFy4DxiJ4057e6MM1x4U7
	uWaeRTBdLyDXm4tFz4DpYU5UVcHWA89DdfY+uJh7LyhriguaVaVfyNHzY5ynMGh1kK6aH3Rx4uQ9e
	zdLxVcThAlULxJ/73tnrhcNFVhAmU0YGkUl/EU0C8JwoHN4J8xKMpiNWpmjB0Km0DO70Fm1QvbS9e
	NOXEltA/h0RBWEDT5O0FL+NOIel9xyNjt77iBK7yVZYQ0LJnEEInu1OLuRnHNfLM15wFGhk1jVIuG
	GRr69eLa3+JqbymCiUWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LPw-00Frv0-AS; Wed, 30 Nov 2022 11:38:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LPt-00Frt6-SV
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 11:38:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7650BB81AEF;
	Wed, 30 Nov 2022 11:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CE6C433C1;
	Wed, 30 Nov 2022 11:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669808294;
	bh=5bEYlFEyZKCYZEyNNJPRBWYDQP0ERj+j46soRPrLxVs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dYTi4FNxDiF0nqG0Fg2vbGzAGx/ebqcpdavkWjmErzAeMgb6Dl9RLE1jKWnI1fHGg
	 Cvbxb6NbVUL239BT6qpgAZ1vIcICYUW2GKqpKsXiTVSvZWoB+toUy+MwLym5aVTWk7
	 wFzDKjGt3rx/ZyVO/PlyPAhztE5YQ924dKxm2qz0RcvJN4CwXbwsSiYNFKoHcbUbhJ
	 WXhetBwYCHdC+DdQH6qPtQ+FWgqhwscNcwT2TTo7O3nXoynM8kbTz4+q3rQtOrum4A
	 coTd+zd4EXZC1Oi9jPc2ymUD3vWrIywn44pX9bnzUl3fGwGzmWTr2jMlLDhc6LHpi/
	 f+Z4r4BZuJlVQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf] riscv, bpf: Emit fixed-length imm64 for
 BPF_PSEUDO_FUNC
In-Reply-To: <20221130033806.2967822-1-pulehui@huaweicloud.com>
References: <20221130033806.2967822-1-pulehui@huaweicloud.com>
Date: Wed, 30 Nov 2022 12:38:11 +0100
Message-ID: <87h6yg1xlo.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_033818_255324_DE453A28 
X-CRM114-Status: GOOD (  18.02  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBGb3IgQlBGX1BTRVVET19GVU5DIGluc3RydWN0
aW9uLCB2ZXJpZmllciB3aWxsIHJlZmlsbCBpbW0gd2l0aAo+IGNvcnJlY3QgYWRkcmVzc2VzIG9m
IGJwZl9jYWxscyBhbmQgdGhlbiBydW4gbGFzdCBwYXNzIG9mIEpJVC4KPiBTaW5jZSB0aGUgZW1p
dF9pbW0gb2YgUlY2NCBpcyB2YXJpYWJsZS1sZW5ndGgsIHdoaWNoIHdpbGwgZW1pdAo+IGFwcHJv
cHJpYXRlIGxlbmd0aCBpbnN0cnVjdGlvbnMgYWNjb3Jyb2RpbmcgdG8gdGhlIGltbSwgaXQgbWF5
Cj4gYnJva2UgY3R4LT5vZmZzZXQsIGFuZCBsZWFkIHRvIHVucHJlZGljdGFibGUgcHJvYmxlbSwg
c3VjaCBhcwo+IGluYWNjdXJhdGUganVtcC4gU28gbGV0J3MgZml4IGl0IHdpdGggZml4ZWQtbGVu
Z3RoIGltbTY0IGluc25zLgoKQWgsIG5pY2Ugb25lISBTbywgdGhlIHRoZSBpbnZhcmlhbnQgZG9l
c24ndCBob2xkICh0aGUgaW1hZ2UgZ3JvdyBpbiB0aGUKbGFzdCBwYXNzKS4KCj4gRml4ZXM6IDY5
YzA4N2JhNjIyNSAoImJwZjogQWRkIGJwZl9mb3JfZWFjaF9tYXBfZWxlbSgpIGhlbHBlciIpCgpU
aGlzIGlzIG9kZD8gVGhpcyBjYW4ndCBiZSB0aGUgcmlnaHQgRml4ZXMtdGFnLi4uCgo+IFNpZ25l
ZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlz
Y3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiBpbmRleCBlYjk5ZGY0MWZhMzMuLmY5ODRkNWZhMDE0
YiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gKysrIGIv
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+IEBAIC0xMzksNiArMTM5LDMwIEBAIHN0
YXRpYyBib29sIGluX2F1aXBjX2phbHJfcmFuZ2UoczY0IHZhbCkKPiAgCQl2YWwgPCAoKDFMIDw8
IDMxKSAtICgxTCA8PCAxMSkpOwo+ICB9Cj4gIAo+ICsvKiBFbWl0IGZpeGVkLWxlbmd0aCBpbnN0
cnVjdGlvbnMgZm9yIDMyLWJpdCBpbW0gKi8KPiArc3RhdGljIHZvaWQgZW1pdF9maXhlZF9pbW0z
Mih1OCByZCwgczMyIHZhbCwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCj4gK3sKPiArCXMz
MiB1cHBlciA9ICh2YWwgKyAoMVUgPDwgMTEpKSA+PiAxMjsKPiArCXMzMiBsb3dlciA9ICgodmFs
ICYgMHhmZmYpIDw8IDIwKSA+PiAyMDsKPiArCj4gKwllbWl0KHJ2X2x1aShyZCwgdXBwZXIpLCBj
dHgpOwo+ICsJZW1pdChydl9hZGRpKHJkLCByZCwgbG93ZXIpLCBjdHgpOwo+ICt9Cj4gKwo+ICsv
KiBFbWl0IGZpeGVkLWxlbmd0aCBpbnN0cnVjdGlvbnMgZm9yIDY0LWJpdCBpbW0gKi8KPiArc3Rh
dGljIHZvaWQgZW1pdF9maXhlZF9pbW02NCh1OCByZCwgczY0IHZhbCwgc3RydWN0IHJ2X2ppdF9j
b250ZXh0ICpjdHgpCj4gK3sKPiArCS8qIENvbXBlbnNhdGlvbiBmb3Igc2lnbi1leHRlbnNpb24g
b2YgcnZfYWRkaSAqLwo+ICsJczMyIGltbV9oaSA9ICh2YWwgKyAoMVUgPDwgMzEpKSA+PiAzMjsK
PiArCXMzMiBpbW1fbG8gPSB2YWw7Cj4gKwo+ICsJZW1pdF9maXhlZF9pbW0zMihyZCwgaW1tX2hp
LCBjdHgpOwo+ICsJZW1pdF9maXhlZF9pbW0zMihSVl9SRUdfVDEsIGltbV9sbywgY3R4KTsKPiAr
CWVtaXQocnZfc2xsaShyZCwgcmQsIDMyKSwgY3R4KTsKPiArCWVtaXQocnZfYWRkKHJkLCByZCwg
UlZfUkVHX1QxKSwgY3R4KTsKPiArfQoKSG1tLCB3aWxsIHRoaXMgcmVhbGx5IGJlIGZpeGVkPyBX
ZSBjYW4gZW5kIHVwIHdpdGggY29tcHJlc3NlZAppbnN0cnVjdGlvbnMsIHdoaWNoIGNhbiB0aGVu
IGJlIGEgbm9uLWNvbXByZXNzZWQgaW4gdGhlIGxhc3QgcGFzcywgYW5kCndlIGhhdmUgdGhlIHNh
bWUgcHJvYmxlbT8KClRoZSByYW5nZSBvZiB2YWxpZCBhZGRyZXNzIGZvciBSVjY0IChzdjM5IHRv
IHN2NTcpIGFyZQoweGZmZmZmZmZmMDAwMDAwMDAgdG8gMHhmZmZmZmZmZmZmZmZmZmZmLCBzbyBJ
IHRoaW5rIHdlIGNhbiBkbyBiZXR0ZXIKdGhhbiA2IGluc24sIG5vPyBNeSBndXQgZmVlbGluZyAo
SSBuZWVkIHRvIHRpbmtlciBhIGJpdCkgaXMgdGhhdCA0CnNob3VsZCBiZSBzdWZmaWNpZW50LgoK
Tm90ZSB0aGF0IHdvcnN0IGNhc2UgZm9yIGEgaW1tNjQgbG9hZCBhcmUgOCBpbnN0cnVjdGlvbnMs
IGJ1dCB0aGlzIGlzCm5vdCB0aGUgZ2VuZXJhbCBjYXNlLgoKCkJqw7ZybgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
