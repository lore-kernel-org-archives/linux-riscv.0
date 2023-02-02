Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7788C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 06:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUHAiqb9UvNGpNzHyv31KWq4SFOEXjzx+K5lT8AwWus=; b=QLkg4hC2nIaCh4
	xgOQPR7QzYjuBlmssJd3AxhHjbdhUNj668hd1cAwsnmhY1yXHL3CFocM9UU/lfNhO4+kEV43QuOqd
	UqDfak49cQQ/4zZG0XVhaF/wvQ2YFDwCL6oNkTlSQ5ZJEXiQ0T/d54jf3c9FwRxW1WK4mQo5HZWhF
	lmfkFHAEq3wlz54cuP9m5b1Wajjy1+ulGWqwWuNDryL9z5OaIqu7XoqY512jCjbSTO0oVzlY2MmRm
	wqrpiYTDo+qL79YiD+kmfZ8gnehD9dvkkXkLJA4UlcsFlYOC0z1QjO5kVAd9EDRTzbPjAqw7BywgD
	qy+hNsPxX/Xy0OEJsZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNSkW-00EVFs-7W; Thu, 02 Feb 2023 06:07:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNSkT-00EVEV-5S
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 06:07:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F2F361556
	for <linux-riscv@lists.infradead.org>; Thu,  2 Feb 2023 06:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02653C433D2
	for <linux-riscv@lists.infradead.org>; Thu,  2 Feb 2023 06:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675318021;
	bh=yiRBHv+l/4auQ24x9qnvybomygiIEXgSlWdHdZ3lxoM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PMDieNdvA/P2JLoNdwh4yqwRP38jvQEYJpamLZkZLixyc5hYQkN5j7rnHZyMPYCJB
	 xzM6HPr2rxk+0Wf1QyQNg0dwV8IDXFV4QqVIdJcLzd5M4LFCHSTsH7rOpfY6R0Ijfr
	 UjIOuxWlAVc0Mj5np2zcgrk79o0WJ+REswOASMb+3PXBdFabttafCQNP3pYcA5NypC
	 aJJBlTdailL8kMNp7HLz2otgwEk5pzlA2943yU95tO0s72CmEKvWSbWccbkw6IkEmM
	 Zu5g0NIGbLfP5+p7mO66mNusJxyI8xosfvLUWftUXzgoBcUWDckEDEitQ+LREb8NEy
	 L5rclAAZQHp4A==
Received: by mail-ej1-f52.google.com with SMTP id mc11so2930119ejb.10
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 22:07:00 -0800 (PST)
X-Gm-Message-State: AO0yUKVcjcqhWHJh22CRjjeovDqgjzkXS+VqL5oUxmAImvFpiX1UCDsL
	2GeoJdeyokFfMUva0ENvNiRObSLAuZdRQybB4K8=
X-Google-Smtp-Source: AK7set933sMPvVA4x1tga0jepXMF7Xtm4wVnvu+W88FO6CBdjG4X+kDRvXeX9j8pKDBHRVhXilNxTFKqFa/DonGr0LI=
X-Received: by 2002:a17:906:2a51:b0:88c:b87d:b771 with SMTP id
 k17-20020a1709062a5100b0088cb87db771mr1495268eje.195.1675318019271; Wed, 01
 Feb 2023 22:06:59 -0800 (PST)
MIME-Version: 1.0
References: <20230126130509.1418251-1-guoren@kernel.org> <878rhig9zj.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTQHDmT=XWE=j8+5Y5ogKh4qNMpXCwAa+7wXEkBit0ujXw@mail.gmail.com> <87357pravt.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87357pravt.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 2 Feb 2023 14:06:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTn52FWRU9-ZqDLpTUe0BkLgttP3NOyk-PzxJbbX75cPg@mail.gmail.com>
Message-ID: <CAJF2gTTn52FWRU9-ZqDLpTUe0BkLgttP3NOyk-PzxJbbX75cPg@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup kernel panic when probing an illegal position
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, mhiramat@kernel.org, 
	conor.dooley@microchip.com, penberg@kernel.org, mark.rutland@arm.com, 
	liaochang <liaochang1@huawei.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_220705_325670_BC13E5CF 
X-CRM114-Status: GOOD (  20.13  )
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

T24gV2VkLCBGZWIgMSwgMjAyMyBhdCA1OjMwIFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKPgo+
ID4+ID4gKyAgICAgaWYgKCFhcmNoX2NoZWNrX2twcm9iZShwKSkKPiA+PiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIC1FSUxTRVE7Cj4gPj4gPiArCj4gPj4gPiAgICAgICAvKiBjb3B5IGluc3RydWN0
aW9uICovCj4gPj4gPiAgICAgICBwLT5vcGNvZGUgPSAqcC0+YWRkcjsKPiA+Pgo+ID4+IE5vdCBy
ZWxhdGVkIHRvIHlvdXIgcGF0Y2gsIGJ1dCB0aGlzIGNhbiBhbHNvIHRyaWdnZXIgYSBtaXNhbGln
bmVkIGxvYWQuCj4gPiBBZnRlciByZXJlYWRpbmcgdGhlIHNwZWMsIG1pc2FsaWduZWQgbG9hZC9z
dG9yZSBpcyBub3QgbWFuZGF0b3J5Cj4gPiBzdXBwb3J0ZWQuIChBbHRob3VnaCBteSBtYWNoaW5l
cyBhbmQgcWVtdSBhcmUgY29ycmVjdCkKPgo+IFllcy4gSXQgd291bGQgYmUgZ3JlYXQgaWYgaXQg
Y291bGQgYmUgdHVybmVkIG9uIGJ5IFFFTVUgKHlvdSBjYW4gd2l0aAo+IFNwaWtlKS4KPgo+ID4g
U28gSSBuZWVkIGZpeHVwOgo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9w
cm9iZXMva3Byb2Jlcy5jCj4gPiBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMK
PiA+IGluZGV4IDI3Zjg5NjBjMzIxYy4uMGMwMTZkNDk2NzQ2IDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvcHJvYmVzL2twcm9iZXMuYwo+ID4gQEAgLTU4LDEyICs1OCwxNCBAQCBzdGF0aWMgYm9vbCBf
X2twcm9iZXMgYXJjaF9jaGVja19rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKPiA+ICB7Cj4gPiAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgdG1wICA9ICh1bnNpZ25lZCBsb25nKXAtPmFkZHIgLSBwLT5v
ZmZzZXQ7Cj4gPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciA9ICh1bnNpZ25lZCBsb25nKXAt
PmFkZHI7Cj4gPiArICAgICAgIGtwcm9iZV9vcGNvZGVfdCBvcGNvZGU7Cj4gPgo+ID4gICAgICAg
ICB3aGlsZSAodG1wIDw9IGFkZHIpIHsKPiA+ICAgICAgICAgICAgICAgICBpZiAodG1wID09IGFk
ZHIpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+Cj4gPiAtICAg
ICAgICAgICAgICAgdG1wICs9IEdFVF9JTlNOX0xFTkdUSCgqKGtwcm9iZV9vcGNvZGVfdCAqKXRt
cCk7Cj4gPiArICAgICAgICAgICAgICAgbWVtY3B5KCZvcGNvZGUsICh2b2lkICopdG1wLCBzaXpl
b2Yoa3Byb2JlX29wY29kZV90KSk7Cj4gPiArICAgICAgICAgICAgICAgdG1wICs9IEdFVF9JTlNO
X0xFTkdUSChvcGNvZGUpOwo+Cj4gSSdkIHByZWZlciBzaXplb2Yob3Bjb2RlKS4KcHJlZmVyIHNp
emVvZihvcGNvZGUpID0gNAoKR0VUX0lOU05fTEVOR1RIKG9wY29kZSkgcmV0dXJucyAyIG9yIDQ7
CgoKPgo+ID4gICAgICAgICB9Cj4gPgo+ID4gICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiBAQCAt
ODAsNyArODIsNyBAQCBpbnQgX19rcHJvYmVzIGFyY2hfcHJlcGFyZV9rcHJvYmUoc3RydWN0IGtw
cm9iZSAqcCkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTFNFUTsKPiA+Cj4gPiAgICAg
ICAgIC8qIGNvcHkgaW5zdHJ1Y3Rpb24gKi8KPiA+IC0gICAgICAgcC0+b3Bjb2RlID0gKnAtPmFk
ZHI7Cj4gPiArICAgICAgIG1lbWNweSgmcC0+b3Bjb2RlLCBwLT5hZGRyLCBzaXplb2Yoa3Byb2Jl
X29wY29kZV90KSk7Cj4KPiBTYW1lIGNvbW1lbnQgYXMgYWJvdmUsIGFuZCB0aGlzIHdvdWxkIGlk
ZWFsbHkgYmUgYSBzZXBhcmF0ZSBwYXRjaC4KWWVzCgo+Cj4KPiBCasO2cm4KCgoKLS0gCkJlc3Qg
UmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
