Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C06C05027
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 09:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=917xHVT2ykMVzI7J6rbgMIC596NUU9vGa+QDbSOmylg=; b=mRKvBiGAAuwJ0L
	ICW8828Qu02hlVdfaTW+u4uytwt5VDPUK/XN2jo24I+3yk/PVDY6nPU5WucqZ/fReH0XmFLb674su
	pcGvBJ9pY5g1YZGKh0RXFX2JFi8obZtmsmKMo95u1jExE93US+Y/ewZxthASP+TL976OS3OufrdGh
	fkrvATTZbyHvU7U0RcpLY41BYRNBbaygwU+0xHKKokjnydf8SMS7vN72/bs3aWeY1WWvTW21CzcMn
	JbhMjBmT+kFK33HyjZgx6YURTRYi2QBUIkLbxKQw1oB+qq4BrKSWKq79lBT32CIjNzfxPwYAcqbrp
	TytDCUQ/ZaoAap+eBPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9XY-00B3C7-KD; Wed, 01 Feb 2023 09:36:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9XV-00B3BF-Nb
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 09:36:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 42C846172A;
	Wed,  1 Feb 2023 09:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C195DC433D2;
	Wed,  1 Feb 2023 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675244185;
	bh=nAUpo7Q/j5KNuIbds1/t9+qLE0Sz0LS9dwd79h6snqA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MnUP0akeHlBOwbavhm30X5chkZO3+OJe3TOoJNsAHr5hnMZic8jEIGc5X7gUZRMyc
	 nf3tGrXHj8+IfEuq+xt6tKKwq2OkUU3ZMGSc19KEJg/OIaNdiVooZ+LDYoFKan05i+
	 ZMGHI0mWWutb5N8Z+vIxC4fF9cujxJu+QC7VTNgDCMos3HWWXHrYuRPjcpzXJO6CoP
	 LrwNVz2Sme6JqnAneVfbBukd2axbn+hVsGAJ6aPCGwQUJcWqxbmCBDmKzBDih3NKDB
	 nUeYXaNhOKoofac1aS25Yz/7CMfyfcYSVC70Dt/4EmplrFdmBSlPUY8JzkEmnY/jat
	 0C18H99CFcptg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, guoren@kernel.org, palmer@rivosinc.com,
 conor.dooley@microchip.com, liaochang1@huawei.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2] riscv: kprobe: Fixup kernel panic when probing an
 illegal position
In-Reply-To: <20230201040604.3390509-1-guoren@kernel.org>
References: <20230201040604.3390509-1-guoren@kernel.org>
Date: Wed, 01 Feb 2023 10:36:22 +0100
Message-ID: <87y1phpw15.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_013625_825511_AE20A05E 
X-CRM114-Status: GOOD (  12.11  )
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

Z3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgoKPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXgu
YWxpYmFiYS5jb20+Cj4KPiBUaGUga2VybmVsIHdvdWxkIHBhbmljIHdoZW4gcHJvYmVkIGZvciBh
biBpbGxlZ2FsIHBvc2l0aW9uLiBlZzoKPgo+IChDT05GSUdfUklTQ1ZfSVNBX0M9bikKPgo+IGVj
aG8gJ3A6aGVsbG8ga2VybmVsX2Nsb25lKzB4MTYgYTA9JWEwJyA+PiBrcHJvYmVfZXZlbnRzCj4g
ZWNobyAxID4gZXZlbnRzL2twcm9iZXMvaGVsbG8vZW5hYmxlCj4gY2F0IHRyYWNlCj4KPiBLZXJu
ZWwgcGFuaWMgLSBub3Qgc3luY2luZzogc3RhY2stcHJvdGVjdG9yOiBLZXJuZWwgc3RhY2sKPiBp
cyBjb3JydXB0ZWQgaW46IF9fZG9fc3lzX25ld2ZzdGF0YXQrMHhiOC8weGI4Cj4gQ1BVOiAwIFBJ
RDogMTExIENvbW06IHNoIE5vdCB0YWludGVkCj4gNi4yLjAtcmMxLTAwMDI3LWcyZDM5OGZlNDlh
NGQgIzQ5MAo+IEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiBDYWxsIFRy
YWNlOgo+IFs8ZmZmZmZmZmY4MDAwNzI2OD5dIGR1bXBfYmFja3RyYWNlKzB4MzgvMHg0OAo+IFs8
ZmZmZmZmZmY4MGM1ZTgzYz5dIHNob3dfc3RhY2srMHg1MC8weDY4Cj4gWzxmZmZmZmZmZjgwYzZk
YTI4Pl0gZHVtcF9zdGFja19sdmwrMHg2MC8weDg0Cj4gWzxmZmZmZmZmZjgwYzZkYTZjPl0gZHVt
cF9zdGFjaysweDIwLzB4MzAKPiBbPGZmZmZmZmZmODBjNWVjZjQ+XSBwYW5pYysweDE2MC8weDM3
NAo+IFs8ZmZmZmZmZmY4MGM2ZGI5ND5dIGdlbmVyaWNfaGFuZGxlX2FyY2hfaXJxKzB4MC8weGE4
Cj4gWzxmZmZmZmZmZjgwMmRlZWIwPl0gc3lzX25ld3N0YXQrMHgwLzB4MzAKPiBbPGZmZmZmZmZm
ODAwMTU4YzA+XSBzeXNfY2xvbmUrMHgyMC8weDMwCj4gWzxmZmZmZmZmZjgwMDAzOWU4Pl0gcmV0
X2Zyb21fc3lzY2FsbCsweDAvMHg0Cj4gLS0tWyBlbmQgS2VybmVsIHBhbmljIC0gbm90IHN5bmNp
bmc6IHN0YWNrLXByb3RlY3RvcjoKPiBLZXJuZWwgc3RhY2sgaXMgY29ycnVwdGVkIGluOiBfX2Rv
X3N5c19uZXdmc3RhdGF0KzB4YjgvMHhiOCBdLS0tCj4KPiBUaGF0IGlzIGJlY2F1c2UgdGhlIGtw
cm9iZSdzIGVicmVhayBpbnN0cnVjdGlvbiBicm9rZSB0aGUga2VybmVsJ3MKPiBvcmlnaW5hbCBj
b2RlLiBUaGUgdXNlciBzaG91bGQgZ3VhcmFudGVlIHRoZSBjb3JyZWN0aW9uIG9mIHRoZSBwcm9i
ZQo+IHBvc2l0aW9uLCBidXQgaXQgY291bGRuJ3QgbWFrZSB0aGUga2VybmVsIHBhbmljLgo+Cj4g
VGhpcyBwYXRjaCBhZGRzIGFyY2hfY2hlY2tfa3Byb2JlIGluIGFyY2hfcHJlcGFyZV9rcHJvYmUg
dG8gcHJldmVudCBhbgo+IGlsbGVnYWwgcG9zaXRpb24gKFN1Y2ggYXMgdGhlIG1pZGRsZSBvZiBh
biBpbnN0cnVjdGlvbikuCj4KPiBGaXhlczogYzIyYjBiY2IxZGQwICgicmlzY3Y6IEFkZCBrcHJv
YmVzIHN1cHBvcnRlZCIpCj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFs
aWJhYmEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+
IC0tLQo+IENoYW5nZWxvZwo+IFYyOgo+ICAtIEZpeHVwIG1pc2FsaWduZWQgbG9hZCAoVGh4IEJq
b3JuKQoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
