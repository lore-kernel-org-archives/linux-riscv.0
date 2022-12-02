Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D253AC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRWlaWp5gXNVfzTzTVx5KGEPcrQUwFbxsdgPF62JSg0=; b=U9qXrX0vxnQ//u
	YgH8BhRTQczlYFFyqaC7zd+Wybe61Z96DcZo2EgqkVVg2f9+29MtQ0XQ38aRnMSZH2kfMvOQgZW9E
	+rA8DgTdp13efQ8yP6KPYKxKA8fQeiCKHVVIK61Kb6D+rU3DzSlq/f/IsNWnmGhjRdn1qTi5I6hlc
	SOpEXSjLvGa0pJRcoBWUyV1LvHjbVA39oPQkrgctBp1AneiJ8LRhoR69NbEif8bZJPsBkix+NI5tY
	xaQdVX7hvSJjq22Nu99+D5pmPJSFt1jsTWUDs+EbXf8zfjNVWN10P8+tywzsKxNRz/rFTW3QafKY6
	CPbXR8uHxeomoOkemMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13h8-00Flju-Bt; Fri, 02 Dec 2022 10:55:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13h5-00FlhG-3w
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 10:55:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA75161152;
	Fri,  2 Dec 2022 10:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8EEC433C1;
	Fri,  2 Dec 2022 10:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669978497;
	bh=LSMFzqyB1fXLSKOizp7KzytquPKo2a5Fv0X9tR9yTCY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l8ad7NbW5u0wdRxS+IL6ctl2VgKfegP2RIE05KO94y1XhSvK4LT9JiPs089HgJxSc
	 NsMtBrcg3NHEy8fXck5X5V43E2pALn90tGhyGdmy2Nd5IzK12swQgUpQ4psUZ9+J+V
	 +yYd64gKbmMMfnOG3mHojxMaMx3dr3woKWIj2me5QlTfN3URu4WU50HXiQBUT0QSmK
	 5LqfCTevkKmXcxcqkGj7dJzv0Y4X42bjROjovG7I6tl4Fxd0DT6Xt3ECUSKwvzg1VE
	 eLI5hnqA6FcW6lBB2Zt82HWIficeeCTy+Qf3Jo4ES98qc67+l11XX4k2StIrZ7/TnB
	 MneZ3HtNIuYoA==
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
Subject: Re: [PATCH bpf v2] riscv, bpf: Emit fixed-length instructions for
 BPF_PSEUDO_FUNC
In-Reply-To: <20221202094837.3872444-1-pulehui@huaweicloud.com>
References: <20221202094837.3872444-1-pulehui@huaweicloud.com>
Date: Fri, 02 Dec 2022 11:54:54 +0100
Message-ID: <87y1rq848x.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_025459_258718_1EC6C434 
X-CRM114-Status: GOOD (  14.90  )
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
Z3RoIGluc3RydWN0aW9ucy4KPgo+IEZpeGVzOiA2OWMwODdiYTYyMjUgKCJicGY6IEFkZCBicGZf
Zm9yX2VhY2hfbWFwX2VsZW0oKSBoZWxwZXIiKQo+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxw
dWxlaHVpQGh1YXdlaS5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAy
MCArKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gaW5kZXggZWI5OWRm
NDFmYTMzLi45NzIzZjM0ZjdhMDYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dF9jb21wNjQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiBAQCAt
MTM5LDYgKzEzOSwxOSBAQCBzdGF0aWMgYm9vbCBpbl9hdWlwY19qYWxyX3JhbmdlKHM2NCB2YWwp
Cj4gIAkJdmFsIDwgKCgxTCA8PCAzMSkgLSAoMUwgPDwgMTEpKTsKPiAgfQo+ICAKPiArLyogRW1p
dCBmaXhlZC1sZW5ndGggaW5zdHJ1Y3Rpb25zIGZvciBhZGRyZXNzICovCj4gK3N0YXRpYyB2b2lk
IGVtaXRfYWRkcih1OCByZCwgdTY0IGFkZHIsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQo+
ICt7Cj4gKwl1NjQgaXAgPSAodTY0KShjdHgtPmluc25zICsgY3R4LT5uaW5zbnMpOwo+ICsJczY0
IG9mZiA9IGFkZHIgLSBpcDsKPiArCXM2NCB1cHBlciA9IChvZmYgKyAoMSA8PCAxMSkpID4+IDEy
Owo+ICsJczY0IGxvd2VyID0gKChvZmYgJiAweGZmZikgPDwgNTIpID4+IDUyOwo+ICsKPiArCWVt
aXQocnZfYXVpcGMocmQsIHVwcGVyKSwgY3R4KTsKPiArCWVtaXQocnZfYWRkaShyZCwgcmQsIGxv
d2VyKSwgY3R4KTsKPiArfQoKTmljZSEgVHdvIGluc3RydWN0aW9ucyBhcmUgYmV0dGVyIHRoYW4g
NiEgOi0pCgpPbmUgZmluYWwgdGhpbmcuIFBsZWFzZSBhZGQgYSBzYW5pdHkgY2hlY2ssIHRoYXQg
dGhlIHJhbmdlIGlzIGNvcnJlY3QsCmUuZy46CgogIGlmICghKGFkZHIgJiYgaW5fYXVpcGNfYWRk
aV9yYW5nZShvZmYpKSkKICAgICByZXR1cm4gLTE7CgpIYXZlIGEgbG9vayBhdCBlbWl0X2p1bXBf
YW5kX2xpbmsoKS4KCgpUaGFua3MhCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
