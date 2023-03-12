Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB29C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Mar 2023 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaAtUSI+eZT/e9MPng/lUOdgrwRVuCQc4KF9B4qdvX0=; b=ld4sxMaHOeddHh
	uTxPzBSAm5QNFzPemruu5I3oLWzDUevtbKAIcbDtEQEE93sWFtmxLU4cxftPGgH1MO8318EiAY8S7
	TgBEYDjegacH4eG6kW9YYEaT047zEjatNNmMQhXAwD7NmJSr++qwYZImYnUrh3quY7JlOsHUJ8ked
	QI0MhQ9mCUqwG0ZXfK7RotPHA0Z+ETswpO+G2CVdLk6/galw2GbyiKXeKETe4cZLTIY5EF38Haksr
	86GdufnQjbkkDHaIaVXUg+PELe4sgtdl8fBVc2Eu2Q7p1Wy0tDYKsZJBApsekl+3Dq1tTqzOj4Hj1
	qgFFKVQ7pNIV/yqHgfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbL0r-002ErO-Bv; Sun, 12 Mar 2023 12:41:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbL0l-002Epl-QV
	for linux-riscv@lists.infradead.org; Sun, 12 Mar 2023 12:41:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 406F960F1E
	for <linux-riscv@lists.infradead.org>; Sun, 12 Mar 2023 12:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1226DC433A4
	for <linux-riscv@lists.infradead.org>; Sun, 12 Mar 2023 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678624873;
	bh=BGavBv7KDuvgH4Q16a/CSuHp7Sto9Kb1YGzbv8hwxaU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SZTrIQkN72fss7NXE1QoK48wPS2HHDG+KsMjPUXc9H+KD6tvgde697q9T21+ByeiY
	 SMyHPirRKpo8c7p/kydu6MhdqmPzE2FlbkMRwml4QXDcsYTs+5tDTa7DY5O1lFeUdr
	 jM8QRHM7O09w88U7tnOsLfgwfCBSRCJTyGbYM+fjFSHf89FqgjCS814/npIV8bz/4g
	 EZ/rvSoNI0cjzF1k1906/VxRCUkxmeLFIdG+eKGzlxYB7gveyE9cv73yZMz0nNhHWk
	 zdhGOl5mMAQxJrKVwesxNyhzhBS42hP1X5mdEv6peDFuUiM7Q+dWKf/mJ0wYcJty3+
	 N/gu4YiFOy/Bw==
Received: by mail-ed1-f50.google.com with SMTP id ek18so7191784edb.6
        for <linux-riscv@lists.infradead.org>; Sun, 12 Mar 2023 05:41:12 -0700 (PDT)
X-Gm-Message-State: AO0yUKUXiqD1ppNwRJiWZezaDEy5WRsf7kKQK92mFbiywlncE8FFf4K/
	GFqe2qltPffsTZA4l8L0SGSV3sKZ9AH2j0YBGTc=
X-Google-Smtp-Source: AK7set+xyo5/ylaMa6xZYzFt/j7uAwPz1MMxIRKlMS7m0bazR/E948SkWRrmQix7GuVrBs9C99cJl/XsekdoEKKUV0I=
X-Received: by 2002:a17:906:eb10:b0:922:d565:3f9d with SMTP id
 mb16-20020a170906eb1000b00922d5653f9dmr1351529ejb.8.1678624871295; Sun, 12
 Mar 2023 05:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103144.396214-1-dylan@andestech.com>
In-Reply-To: <20230310103144.396214-1-dylan@andestech.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 12 Mar 2023 20:40:59 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTwEJNmee7TcbdbcmLQKTTWpokrUST4xanyreUJHxETqg@mail.gmail.com>
Message-ID: <CAJF2gTTwEJNmee7TcbdbcmLQKTTWpokrUST4xanyreUJHxETqg@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: Fix incorrect ASID argument when flushing TLB
To: Dylan Jhong <dylan@andestech.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sergey.matyukevich@syntacore.com, aou@eecs.berkeley.edu, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, x5710999x@gmail.com, tim609@andestech.com, 
	peterlin@andestech.com, ycliang@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_054116_152514_8A55A180 
X-CRM114-Status: GOOD (  20.08  )
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

T24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgNjozMuKAr1BNIER5bGFuIEpob25nIDxkeWxhbkBhbmRl
c3RlY2guY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgd2UgcGFzcyB0aGUgQ09OVEVYVElEIGlu
c3RlYWQgb2YgdGhlIEFTSUQgdG8gdGhlIFRMQiBmbHVzaAo+IGZ1bmN0aW9uLiBXZSBzaG91bGQg
b25seSB0YWtlIHRoZSBBU0lEIGZpZWxkIHRvIHByZXZlbnQgZnJvbSB0b3VjaGluZwo+IHRoZSBy
ZXNlcnZlZCBiaXQgZmllbGQuCj4KPiBGaXhlczogM2YxZTc4Mjk5OGNkICgicmlzY3Y6IGFkZCBB
U0lELWJhc2VkIHRsYmZsdXNoaW5nIG1ldGhvZHMiKQo+IFNpZ25lZC1vZmYtYnk6IER5bGFuIEpo
b25nIDxkeWxhbkBhbmRlc3RlY2guY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3RsYmZsdXNoLmggfCAyICsrCj4gIGFyY2gvcmlzY3YvbW0vY29udGV4dC5jICAgICAgICAgICB8
IDMgKystCj4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyAgICAgICAgICB8IDIgKy0KPiAgMyBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS90bGJmbHVzaC5oCj4gaW5kZXggOTA3YjllZmQzOWE4Li41OTdkNmQ4YWVjMjggMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gQEAgLTEyLDYgKzEyLDggQEAKPiAgI2lu
Y2x1ZGUgPGFzbS9lcnJhdGFfbGlzdC5oPgo+Cj4gICNpZmRlZiBDT05GSUdfTU1VCj4gK2V4dGVy
biB1bnNpZ25lZCBsb25nIGFzaWRfbWFzazsKPiArCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2Nh
bF9mbHVzaF90bGJfYWxsKHZvaWQpCj4gIHsKPiAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9f
ICgic2ZlbmNlLnZtYSIgOiA6IDogIm1lbW9yeSIpOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L21tL2NvbnRleHQuYyBiL2FyY2gvcmlzY3YvbW0vY29udGV4dC5jCj4gaW5kZXggODBjZTljYWJh
OGQyLi5hNmI3NmIzM2UzNzcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMK
PiArKysgYi9hcmNoL3Jpc2N2L21tL2NvbnRleHQuYwo+IEBAIC0yMiw3ICsyMiw4IEBAIERFRklO
RV9TVEFUSUNfS0VZX0ZBTFNFKHVzZV9hc2lkX2FsbG9jYXRvcik7Cj4KPiAgc3RhdGljIHVuc2ln
bmVkIGxvbmcgYXNpZF9iaXRzOwo+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBudW1fYXNpZHM7Cj4g
LXN0YXRpYyB1bnNpZ25lZCBsb25nIGFzaWRfbWFzazsKPiArdW5zaWduZWQgbG9uZyBhc2lkX21h
c2s7Cj4gK0VYUE9SVF9TWU1CT0woYXNpZF9tYXNrKTsKV2h5IEVYUE9SVF9TWU1CT0w/IChObyBt
b2R1bGUgd291bGQgdXNlIGl0IGJ5IHlvdXIgcGF0Y2guKQoKPgo+ICBzdGF0aWMgYXRvbWljX2xv
bmdfdCBjdXJyZW50X3ZlcnNpb247Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90bGJm
bHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gaW5kZXggY2U3ZGZjODFiYjNmLi5i
YTRjMjcxODdjOTUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gKysr
IGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gQEAgLTI3LDcgKzI3LDcgQEAgc3RhdGljIHZv
aWQgX19zYmlfdGxiX2ZsdXNoX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBs
b25nIHN0YXJ0LAo+ICAgICAgICAgLyogY2hlY2sgaWYgdGhlIHRsYmZsdXNoIG5lZWRzIHRvIGJl
IHNlbnQgdG8gb3RoZXIgQ1BVcyAqLwo+ICAgICAgICAgYnJvYWRjYXN0ID0gY3B1bWFza19hbnlf
YnV0KGNtYXNrLCBjcHVpZCkgPCBucl9jcHVfaWRzOwo+ICAgICAgICAgaWYgKHN0YXRpY19icmFu
Y2hfdW5saWtlbHkoJnVzZV9hc2lkX2FsbG9jYXRvcikpIHsKPiAtICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBhc2lkID0gYXRvbWljX2xvbmdfcmVhZCgmbW0tPmNvbnRleHQuaWQpOwo+ICsg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFzaWQgPSBhdG9taWNfbG9uZ19yZWFkKCZtbS0+
Y29udGV4dC5pZCkgJiBhc2lkX21hc2s7Cj4KPiAgICAgICAgICAgICAgICAgLyoKPiAgICAgICAg
ICAgICAgICAgICogVExCIHdpbGwgYmUgaW1tZWRpYXRlbHkgZmx1c2hlZCBvbiBoYXJ0cyBjb25j
dXJyZW50bHkKPiAtLQo+IDIuMzQuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
