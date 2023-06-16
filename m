Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE02FEB64D8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 19:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAtREoIlikHKfdzmhEHiw/Vrb16CK5h9zjjg3OhAd8M=; b=ct1EtbT1Ra4H+6
	bEvavI6SOGDBqIR/5+qeAvMF0lqIL8lKyEUzc/LkFSPJ0AniTekqcP5KbBgo8n8Ok2G6tbmjlNf1w
	9YEfnJHJZRz7Ty74PWkSxELZl35jkcGDsH/0I598kv4bo5RGLVDc+g1lr9qbZUCUbx2u1m43oS1Pq
	022dP9PvWvNXccLeOdiDLyOF8N575b3onYn4+UWdo9RuRoI3GnlCBcpYyNnzY7WDmxHlXn5Hzvc2+
	DPB89BD7hAhUr9CuL7Ue6Cx2ud8mr1ISgdG3De03PlP5rrFjGbAeGWa5jN+KZE9iow1IhImrXiQ+B
	Es5PuJnk0gW2sgZtzwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEiJ-001Wte-12;
	Fri, 16 Jun 2023 19:02:27 +0000
Received: from smtp-15.smtpout.orange.fr ([80.12.242.15] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEiF-001WrM-1E
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 19:02:25 +0000
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id AEi1qWzKoL90OAEi1qKqTz; Fri, 16 Jun 2023 21:02:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1686942138;
	bh=nEdbn9EvNL9x4pbYLYVTKkeSAVLXfuwp+q07LLfbX1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=sOWE4+7HVfsNkjsMEvlZ6hpsZ+iJKdFcqrmJkZcxJ1VYvvfvHV9AQ2WEqmoK5VerS
	 UeeyqjO+UWiczrsz5uYbmMTmFSzHLOo0c+PHzbd+6L3NBlQvYwhby+UNZbPXrbpcox
	 wIqGEZ0uY0HaRADEg7AchAxeVlEa1EttGokpyUaFLvmFUkULJLyb2NNJUbC83DhYcL
	 y7RiMiJvi6KLkRxgZPpf+GfloPG1JDuPh5pomucyEWgDrJN0Iw/4ce5z2nlRKMASN6
	 E7vTl5kHqHPajKD6la6+Igfducbtun/bOgdGOA0JtixDG/YHhhi8jHHP0/DRlUsSC9
	 57vwCen7w11cw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 16 Jun 2023 21:02:18 +0200
X-ME-IP: 86.243.2.178
Message-ID: <28f511f2-ffbb-2ef7-c47c-caf9f5164512@wanadoo.fr>
Date: Fri, 16 Jun 2023 21:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] soc: sifive: Add SiFive private L2 cache support
Content-Language: fr
To: Eric Lin <eric.lin@sifive.com>, conor@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, maz@kernel.org,
 chenhuacai@kernel.org, baolu.lu@linux.intel.com, will@kernel.org,
 kan.liang@linux.intel.com, nnac123@linux.ibm.com, pierre.gondois@arm.com,
 huangguangbin2@huawei.com, jgross@suse.com, chao.gao@intel.com,
 maobibo@loongson.cn, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dslin1010@gmail.com
Cc: Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>,
 Nick Hu <nick.hu@sifive.com>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-2-eric.lin@sifive.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230616063210.19063-2-eric.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_120223_574757_82EA544E 
X-CRM114-Status: GOOD (  11.23  )
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

TGUgMTYvMDYvMjAyMyDDoCAwODozMiwgRXJpYyBMaW4gYSDDqWNyaXTCoDoKPiBUaGlzIGFkZHMg
U2lGaXZlIHByaXZhdGUgTDIgY2FjaGUgZHJpdmVyIHdoaWNoIHdpbGwgc2hvdwo+IGNhY2hlIGNv
bmZpZyBpbmZvcm1hdGlvbiB3aGVuIGJvb3RpbmcgYW5kIGFkZCBjcHUgaG90cGx1Zwo+IGNhbGxi
YWNrIGZ1bmN0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBFcmljIExpbiA8ZXJpYy5saW4tU3BN
REhQWVB5UGJRVDBkWlIrQWxmQUBwdWJsaWMuZ21hbmUub3JnPgo+IFNpZ25lZC1vZmYtYnk6IE5p
Y2sgSHUgPG5pY2suaHUtU3BNREhQWVB5UGJRVDBkWlIrQWxmQUBwdWJsaWMuZ21hbmUub3JnPgo+
IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpLVNwTURIUFlQeVBiUVQwZFpSK0FsZkFAcHVi
bGljLmdtYW5lLm9yZz4KClsuLi5dCgo+ICtzdGF0aWMgaW50IF9faW5pdCBzaWZpdmVfcGwyX2Nh
Y2hlX2luaXQodm9pZCkKPiArewo+ICsJaW50IHJldDsKPiArCj4gKwlyZXQgPSBjcHVocF9zZXR1
cF9zdGF0ZShDUFVIUF9BUF9SSVNDVl9TSUZJVkVfUEwyX09OTElORSwKPiArCQkJCSJzb2Mvc2lm
aXZlL3BsMjpvbmxpbmUiLAo+ICsJCQkJICAgICAgc2lmaXZlX3BsMl9vbmxpbmVfY3B1LAo+ICsJ
CQkJICAgICAgc2lmaXZlX3BsMl9vZmZsaW5lX2NwdSk7Cj4gKwlpZiAocmV0IDwgMCkgewo+ICsJ
CXByX2VycigiRmFpbGVkIHRvIHJlZ2lzdGVyIENQVSBob3RwbHVnIG5vdGlmaWVyICVkXG4iLCBy
ZXQpOwo+ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4gKwo+ICsJcmV0ID0gcGxhdGZvcm1fZHJpdmVy
X3JlZ2lzdGVyKCZzaWZpdmVfcGwyX2NhY2hlX2RyaXZlcik7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJ
cHJfZXJyKCJGYWlsZWQgdG8gcmVnaXN0ZXIgc2lmaXZlX3BsMl9jYWNoZV9kcml2ZXI6ICVkXG4i
LCByZXQpOwoKQmxpbmQgZ3Vlc3M6IGRvZXMgY3B1aHBfcmVtb3ZlX3N0YXRlKCkgbmVlZHMgdG8g
YmUgY2FsbGVkPwoKPiArCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICsKPiArCXNpZml2ZV9wbDJfcG1f
aW5pdCgpOwo+ICsKPiArCXJldHVybiByZXQ7CgpJZiB5b3Ugc2VuZCBhIHYyLCByZXR1cm4gMDsg
d291bGQgYmUgc2xpZ2hseSBuaWNlciBoZXJlLgoKQ0oKCj4gK30KClsuLi5dCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
