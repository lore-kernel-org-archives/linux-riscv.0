Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C18C46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3edI/WoxEl3H3M+XVx9J04h+WfrgUhxI0xSlQJ1/mA=; b=BLqPkBH7Tei2Lm
	3VUFDf24PPWqq0Z/rzOmG6Pqt4vl85FCBL6XeRm3uDoyqZZF/PSQW72rmLFucOdl1d3Sn1Ewg8jhm
	EpUBZTJmINA14+NK+5WqJU2XY3/q03+Y0b9jQ1ZyfjSQYyEJ4j+ObZ+fZYKwAeQrtm6Yzr43LfX1T
	9tZSToA+BU7PTLaakPpYG6TMiiEgY+fW20TzI5XGQnAbU0WK6M9ry/f/hecdn/eyL6vbaXEVawvpz
	UzKjqJvs6VSZ4SK873xupip4vS8rHiPuiTy9/TP6aZTXgMtVLvlH5j9rLRlSZKseT5dhRC/SrAeP6
	rXXiQ/TcJhHUg8m8Qdrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5Wr-00A2WO-Tu; Wed, 04 Jan 2023 15:18:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0mN-008Ktl-Bw
	for linux-riscv@bombadil.infradead.org; Wed, 04 Jan 2023 10:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1PJe1CJ7nfqyauqg0kO4wum7PMwSfW2EStF1KH5iazE=; b=oppgD1+pss6ochai5q7wQTShuN
	gaEz/2WcIsh8h+IXmuD3IrolytAwvLCamJaN7v/LWSRRYByHmMlwfFHhu3chApkQOfs5ZR1ZBnhio
	LuFBhirAHwqQEeRT++q2efHDWx/rF3jYa0c5P63ooo1HGmKd2HLT90wDicS4Lum3HBRXoQcM8wWHz
	su0uUe2kg6pYnSRuvCFoiXwLkV2NVcjcwHvE5Fb80Vr/3d8SQohcH6kEcTB7QTdw3wQwTLsQ+vEba
	Cxji/U47j51yB8ohkz4jINEevNTSGXYvmP3RXQOsU3wG0Nmhh/UKdezMjTkee5r3+gv8MGXFbZhoT
	Jd8RSUrg==;
Received: from ams.source.kernel.org ([145.40.68.75])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pCzaC-000rXF-1X
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jan 2023 08:57:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ABF84B815BB;
	Wed,  4 Jan 2023 08:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E23BC433D2;
	Wed,  4 Jan 2023 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672822634;
	bh=Jj05/IYvXvNdjB6MaDfn5BYk3BLXM/xtTSHhm5j1AwI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sQzmBVGlMhrznPIyI4B6Vc7l39vqBTGjiKCIrR35BQwIkdj4ThgtFuZm60wjH8RBB
	 G5ErEA+tbKHLNBwj9itnNJ0DcAbOs/rbVvC5XH3FFsny0RcI8Flrkva3Mz7KlHnFcw
	 F0Ytqx07xsT3gmi/pxV2ZhR2m1ZqvNSuctA1l1UXrb5a4MFoSjDHLe8a5NwErX8QKF
	 fTVWFOhd6bnEc/elT6Ymsmb7V4isRJepIjG+IaBPkolMyfFq8wm9LslcgtjYR+f3kE
	 LIfEXlTFl2Q0H3peefHIQ/oWcOZSRj4RXzWXS6Mx10pIZ2v44n3nUskQhxVJvMqu0X
	 /0OzXo0bZq6uw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: "liaochang (A)" <liaochang1@huawei.com>, Chen Guokai
 <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/9] riscv/kprobe: Add common RVI and RVC instruction
 decoder code
In-Reply-To: <ab66152d-0ae1-3edb-4f1d-01ab49edc25d@huawei.com>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-5-chenguokai17@mails.ucas.ac.cn>
 <87tu18vmnx.fsf@all.your.base.are.belong.to.us>
 <ab66152d-0ae1-3edb-4f1d-01ab49edc25d@huawei.com>
Date: Wed, 04 Jan 2023 09:57:11 +0100
Message-ID: <871qoasmmw.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_085712_799490_DE87F55B 
X-CRM114-Status: GOOD (  10.46  )
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

ImxpYW9jaGFuZyAoQSkiIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+IHdyaXRlczoKCj4+IFNob3Vs
ZG4ndCB0aGUgbWFzayBiZSAweGYwMDM/Cj4KPiBBY3R1YWxseSwgdGhlIG1hc2sgc2hvdWxkIGJl
IDB4ZjAwMyBpbmRlZWRseSwgYnV0IGl0IGFsc28gYnJpbmcgYW5vdGhlciBwcm9ibGVtIHRoYXQK
PiBpdCBjYW4ndCB0ZWxsIEMuTVYgYW5kIEMuSlIgdmlhIHRoZSBtYXNrIGFuZCB2YWx1ZSBwYXJ0
cy4gTG9vayBvcGNvZGVzIGJlbG93Ogo+Cj4gICAgICAgMTUgMTQgMTMgMTIgfCAxMSAxMCAgOSAg
OCB8IDcgNiA1IDQgfCAzIDIgIDEgMAo+IEMuSlI6ICAxICAwICAwICAwIHwgICAgICAgICAgICAg
cnMxICAgICAgICAgICAwICAxIDAKPiBDLk1WOiAgMSAgMCAgMCAgMCB8ICAgICAgICAgICAgICBy
ZCAgICAgICAgIHJzMiAgMSAwCj4KPiBUaGUgb25seSBkaWZmZXJlY2UgYmV0d2VlbiBDLk1WIGFu
ZCBDLkpSIGlzIHRoZSBiaXRzWzJ+Nl0sIHRoZXNlIGJpdGZpZWxkIG9mIEMuSlIgaXMgemVybywK
PiB0aGUgb25lcyBvZiBDLk1WIGlzIHJzMiB3aGljaCBuZXZlciBiZSB6ZXJvLiBJbiBvcmRlciB0
byB0ZWxsIEMuTVYgYW5kIEMuSlIgY29ycmVjbHR5LCBpdAo+IGlzIGJldHRlciB0byBhZGp1c3Qg
dGhlIG1hc2sgb2YgQy5KUiB0byBiZSAweGYwN2YgYXMgeW91ciBwYXRjaChyaXNjdiwga3Byb2Jl
OiBTdHJpY3RlciBjLmpyL2MuamFsciBkZWNvZGluZykKPgo+IExvb2tpbmcgZm9yd2FyZCB0byB5
b3VyIGZlZWRiYWNrLgoKWXVwLCB0aGF0IHdhcyB0aGUgcmVhc29uIEkgc3VibWl0dGVkIHRoZSBm
aXghIExldCdzIHdhaXQgZm9yIHRoZSBmaXggdG8KYmUgYXBwbGllZCwgYW5kIG5vdCBpbmNsdWRl
IHRoYXQgZml4IGluIHlvdXIgZmVhdHVyZSBzZXJpZXMuCgoKQmrDtnJuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
