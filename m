Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFAEC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 09:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVmkHqaNbJyzActXeU8qBktlljSwAhWouP/7HfJAIGk=; b=Gp+LcDNm+Xsffw
	uGfebtMfen9TzTlCuWFEqHA/9nkKir3Mirx5WhaxmYXZRMDxa7ivflcuhghBxlSOQ6vof9PwjsE+m
	z13/vmpY6FqrL0aZRCxGi/qznnR8cMfr32P+q8QxX4zhoj3UgDIw6Jv1L9LGJzPLoMR42mxH/N2fp
	2mk4as2laf+BW/79oPkQUQm4jYcSiFpUGp/V9iJoR0kHMR/qsJG3MW7JBKagz3sK+zj3rww8VHTwj
	CR6MEVugJrMTApUSeG8VwnGFuBskWkQeV5yHyqRtf1K+D8LguR/+4nm55t8jrxjCXyCpcAdbVuXq8
	4rIWms5yz2dRG2mqwDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWCz-00FFBM-MJ; Thu, 02 Feb 2023 09:48:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWCv-00FF8L-4L
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 09:48:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 59E7E61A6A;
	Thu,  2 Feb 2023 09:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B580C433D2;
	Thu,  2 Feb 2023 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675331319;
	bh=WCEiLESm2ErJPjaBal/9ZH056ER36/vOC8v5zxr8nDg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QU3DBFMaYt3H52FCXpQ/dn5eElV6wyf0aO2iEA7WX1mELk6K+v6U3A59kneLz2ZO2
	 lbbfzPKKkF5z/N9Qi4Lt0OAHOY0hak5++nTUrREWjXbhuXHELa9TKdYXl8FvhUPBza
	 7wmtImjIvVemz6PVlopJmINq3ppHmrnK4vuJaed+TwdLF5K25pJTq8fqNPbSjhLIDY
	 SPLp9g4A2kLnaFp9+UmjB3fuv/s07iw6IWMv4AgVGAJ05FjnnU/qOW80J6McKkMCen
	 Jax6YD/mIP35BiClLwjh8lTN0G4uXQkj8J9QOkMmciEQMj0BIfDnq0Dxoj3JP+SYgX
	 M9tO4ZMtealig==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: palmer@rivosinc.com, conor.dooley@microchip.com, liaochang1@huawei.com,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, Bjorn
 Topel <bjorn.topel@gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup misaligned load text
In-Reply-To: <CAJF2gTSj12E9+peMF0rNY_psGDyEG5BbMY6V-s4dK0FpkCC9Yw@mail.gmail.com>
References: <20230201064608.3486136-1-guoren@kernel.org>
 <87tu05pvur.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTSj12E9+peMF0rNY_psGDyEG5BbMY6V-s4dK0FpkCC9Yw@mail.gmail.com>
Date: Thu, 02 Feb 2023 10:48:37 +0100
Message-ID: <87cz6s75ze.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_014841_275856_FFFEA0B0 
X-CRM114-Status: GOOD (  18.66  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gT24gV2VkLCBGZWIgMSwgMjAy
MyBhdCA1OjQwIFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+
PiBndW9yZW5Aa2VybmVsLm9yZyB3cml0ZXM6Cj4+Cj4+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVu
QGxpbnV4LmFsaWJhYmEuY29tPgo+PiA+Cj4+ID4gVGhlIGN1cnJlbnQga3Byb2JlIHdvdWxkIGNh
dXNlIGEgbWlzYWxpZ25lZCBsb2FkIGZvciB0aGUgcHJvYmUgcG9pbnQuCj4+ID4gVGhpcyBwYXRj
aCBmaXh1cCBpdCB3aXRoIHR3byBoYWxmLXdvcmQgbG9hZHMgaW5zdGVhZC4KPj4gPgo+PiA+IEZp
eGVzOiBjMjJiMGJjYjFkZDAgKCJyaXNjdjogQWRkIGtwcm9iZXMgc3VwcG9ydGVkIikKPj4gPiBT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4+ID4gU2ln
bmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4+ID4gTGluazogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvODc4cmhpZzl6ai5mc2ZAYWxsLnlvdXIuYmFz
ZS5hcmUuYmVsb25nLnRvLnVzLwo+PiA+IFJlcG9ydGVkLWJ5OiBCam9ybiBUb3BlbCA8Ympvcm4u
dG9wZWxAZ21haWwuY29tPgo+PiA+IC0tLQo+PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMv
a3Byb2Jlcy5jIHwgNCArKystCj4+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPj4gPgo+PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9w
cm9iZXMva3Byb2Jlcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+PiA+
IGluZGV4IDQxYzc0ODFhZmRlMy4uYzExNjA2MjljZWY0IDEwMDY0NAo+PiA+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9wcm9iZXMva3Byb2Jlcy5jCj4+ID4gQEAgLTc0LDcgKzc0LDkgQEAgaW50IF9fa3Byb2JlcyBh
cmNoX3ByZXBhcmVfa3Byb2JlKHN0cnVjdCBrcHJvYmUgKnApCj4+ID4gICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTFNFUTsKPj4gPgo+PiA+ICAgICAgIC8qIGNvcHkgaW5zdHJ1Y3Rpb24gKi8KPj4g
PiAtICAgICBwLT5vcGNvZGUgPSAqcC0+YWRkcjsKPj4gPiArICAgICBwLT5vcGNvZGUgPSAoa3By
b2JlX29wY29kZV90KSgqKHUxNiAqKXByb2JlX2FkZHIpOwo+PiA+ICsgICAgIGlmIChHRVRfSU5T
Tl9MRU5HVEgocC0+b3Bjb2RlKSA9PSA0KQo+PiA+ICsgICAgICAgICAgICAgcC0+b3Bjb2RlIHw9
IChrcHJvYmVfb3Bjb2RlX3QpKCoodTE2ICopKHByb2JlX2FkZHIgKyAyKSkKPj4gPiAgICAgICA8
PCAxNjsKPj4KPj4gVWdoLCB0aG9zZSBjYXN0cy4gOi0oIFdoYXQgYWJvdXQgdGhlIG1lbWNweSB2
YXJpYW50IHlvdSBoYWQgaW4gdGhlIG90aGVyCj4+IHRocmVhZD8KPiBUaGUgbWVtY3B5IHZlcnNp
b24gd291bGQgZm9yY2UgbG9hZCBwcm9iZV9hZGRyICsgMi4gVGhpcyBvbmUgd291bGQKPiBzYXZl
IGFuIGxoIG9wZXJhdGlvbi4gVGhlIGNvZGUgdGV4dCBndWFyYW50ZWVzIGhhbGYtd29yZCBhbGln
bm1lbnQuIE5vCj4gbWlzYWxpZ25lZCBsb2FkIGhhcHBlbmVkLiBTZWNvbmQsIGtwcm9iZSB3b3Vs
ZG4ndCB3cml0ZSB0aGUgbGFzdCBoYWxmCj4gb2YgMzJiIGluc3RydWN0aW9uLgoKT2ssIHNvbWV0
aGluZyBtb3JlIHJlYWRhYmxlLCBsaWtlOgoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3Byb2Jlcy9rcHJvYmVzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCmlu
ZGV4IGYyMTU5MmQyMDMwNi4uMzYwMjM1MmJhMTc1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9wcm9iZXMva3Byb2Jlcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJv
YmVzLmMKQEAgLTUwLDE0ICs1MCwxNiBAQCBzdGF0aWMgdm9pZCBfX2twcm9iZXMgYXJjaF9zaW11
bGF0ZV9pbnNuKHN0cnVjdCBrcHJvYmUgKnAsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCiBpbnQg
X19rcHJvYmVzIGFyY2hfcHJlcGFyZV9rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKIHsKLQl1bnNp
Z25lZCBsb25nIHByb2JlX2FkZHIgPSAodW5zaWduZWQgbG9uZylwLT5hZGRyOworCXUxNiAqaW5z
biA9ICh1MTYgKilwLT5hZGRyOwogCi0JaWYgKHByb2JlX2FkZHIgJiAweDEpCisJaWYgKCh1aW50
cHRyX3QpaW5zbiAmIDB4MSkKIAkJcmV0dXJuIC1FSUxTRVE7CiAKIAkvKiBjb3B5IGluc3RydWN0
aW9uICovCi0JcC0+b3Bjb2RlID0gKnAtPmFkZHI7Ci0KKwlwLT5vcGNvZGUgPSAqaW5zbisrOwor
CWlmIChHRVRfSU5TTl9MRU5HVEgocC0+b3Bjb2RlKSA9PSA0KQorCQlwLT5vcGNvZGUgfD0gKmlu
c24gPDwgMTY7CisJCiAJLyogZGVjb2RlIGluc3RydWN0aW9uICovCiAJc3dpdGNoIChyaXNjdl9w
cm9iZV9kZWNvZGVfaW5zbihwLT5hZGRyLCAmcC0+YWluc24uYXBpKSkgewogCWNhc2UgSU5TTl9S
RUpFQ1RFRDoJLyogaW5zbiBub3Qgc3VwcG9ydGVkICovCgoKQmrDtnJuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
