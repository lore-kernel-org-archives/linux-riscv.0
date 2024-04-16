Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F785C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kgBr6fANHjOBGBYDvAYlQQsolWJsw5z2efIJVKgkHQ=; b=LrnckaQwt3J6Yx
	BVzqysjDmdiHgF+5g0pn7RLDvUrmnJLCYSH9Qc9IS769H7apOeEhQ1KoPy17u5Qpw+9PHqZZP8fv0
	9NOsKFe1pxvYAtM5OtJFskllKXBtqUsUNMp71y//NUomk55h+PBoKd0yu7HzJG1hwqAi5BYkuouBT
	RxhW9lu2z8EyYvWe7cH9A725gxUi2iILesNgVYK85N0x1q79p61DQT1hBvtlGoVW6dA4nq8anYBRb
	ucCf7WelmYC+I1WNQnPGtLed9vxVYR46zC83Li6mreQA5RUXGBsnazaBziRmx5TGVneT/z51oWT28
	UoHsSsTxkKoNZloszpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnBl-0000000DFrh-1i4I;
	Tue, 16 Apr 2024 18:05:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnBi-0000000DFqc-2ETB
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:05:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4328C61257;
	Tue, 16 Apr 2024 18:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5310C2BD11;
	Tue, 16 Apr 2024 18:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713290742;
	bh=ofwzRbETYmRwC0pS8n9dd+EPWVyzyXzVpzRfaZ5N3ro=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tgo4Q4p1d1p9T0puSKluE1QgYZa7w62lj9a8aH0yC4TeNdxnVmji8JSX+Bf4sgn3F
	 eYMgcoM9yOR5Io4NBynQVzUaTT5/syfShwg0UNBIeW9Id0U/kQIk1qqH9NmV+Cj27a
	 47gIOUAsyoLBzsU9COXbsbFn1GO3RC2GZ+QMPJCkj+GRIZcHD5QiP1sZHlr5rcYZyu
	 3sbr6n5gIMkjenovcrb8ogVhK+KO+0eOpTBDQupNx+h9Np8tLGSUoTo1SVGUKPB/2H
	 6I5hzm3QznH1igAiCrfCZF0kdZB+r6veXZb0qnoa5YV/lMOwj0v4wWRJrbHVsd0O2i
	 Xawofm9TvBNGQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Mike Rapoport <rppt@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Andreas Dilger <adilger@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>, Ext4
 Developers List <linux-ext4@vger.kernel.org>, Conor Dooley
 <conor@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Anders
 Roxell <anders.roxell@linaro.org>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
In-Reply-To: <20240416181944.23af44ee@namcao>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
 <8734rlo9j7.fsf@all.your.base.are.belong.to.us>
 <Zh6KNglOu8mpTPHE@kernel.org> <20240416171713.7d76fe7d@namcao>
 <20240416173030.257f0807@namcao>
 <87v84h2tee.fsf@all.your.base.are.belong.to.us>
 <20240416181944.23af44ee@namcao>
Date: Tue, 16 Apr 2024 20:05:38 +0200
Message-ID: <875xwhuqrx.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_110546_641242_2A228F35 
X-CRM114-Status: GOOD (  15.47  )
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

TmFtIENhbyA8bmFtY2FvQGxpbnV0cm9uaXguZGU+IHdyaXRlczoKCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBpbmRleCBmYTM0Y2Y1
NTAzN2IuLmY2MDBjZmVlMGFlZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+
ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gQEAgLTE5Nyw3ICsxOTcsNiBAQCBlYXJseV9w
YXJhbSgibWVtIiwgZWFybHlfbWVtKTsKPiAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jvb3Rt
ZW0odm9pZCkKPiAgewo+ICAJcGh5c19hZGRyX3Qgdm1saW51eF9lbmQgPSBfX3BhX3N5bWJvbCgm
X2VuZCk7Cj4gLQlwaHlzX2FkZHJfdCBtYXhfbWFwcGVkX2FkZHI7Cj4gIAlwaHlzX2FkZHJfdCBw
aHlzX3JhbV9lbmQsIHZtbGludXhfc3RhcnQ7Cj4gIAo+ICAJaWYgKElTX0VOQUJMRUQoQ09ORklH
X1hJUF9LRVJORUwpKQo+IEBAIC0yMzgsMTcgKzIzNyw5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBz
ZXR1cF9ib290bWVtKHZvaWQpCj4gIAkvKgo+ICAJICogbWVtYmxvY2sgYWxsb2NhdG9yIGlzIG5v
dCBhd2FyZSBvZiB0aGUgZmFjdCB0aGF0IGxhc3QgNEsgYnl0ZXMgb2YKPiAgCSAqIHRoZSBhZGRy
ZXNzYWJsZSBtZW1vcnkgY2FuIG5vdCBiZSBtYXBwZWQgYmVjYXVzZSBvZiBJU19FUlJfVkFMVUUK
PiAtCSAqIG1hY3JvLiBNYWtlIHN1cmUgdGhhdCBsYXN0IDRrIGJ5dGVzIGFyZSBub3QgdXNhYmxl
IGJ5IG1lbWJsb2NrCj4gLQkgKiBpZiBlbmQgb2YgZHJhbSBpcyBlcXVhbCB0byBtYXhpbXVtIGFk
ZHJlc3NhYmxlIG1lbW9yeS4gIEZvciA2NC1iaXQKPiAtCSAqIGtlcm5lbCwgdGhpcyBwcm9ibGVt
IGNhbid0IGhhcHBlbiBoZXJlIGFzIHRoZSBlbmQgb2YgdGhlIHZpcnR1YWwKPiAtCSAqIGFkZHJl
c3Mgc3BhY2UgaXMgb2NjdXBpZWQgYnkgdGhlIGtlcm5lbCBtYXBwaW5nIHRoZW4gdGhpcyBjaGVj
ayBtdXN0Cj4gLQkgKiBiZSBkb25lIGFzIHNvb24gYXMgdGhlIGtlcm5lbCBtYXBwaW5nIGJhc2Ug
YWRkcmVzcyBpcyBkZXRlcm1pbmVkLgo+ICsJICogbWFjcm8uIE1ha2Ugc3VyZSB0aGF0IGxhc3Qg
NGsgYnl0ZXMgYXJlIG5vdCB1c2FibGUgYnkgbWVtYmxvY2suCj4gIAkgKi8KPiAtCWlmICghSVNf
RU5BQkxFRChDT05GSUdfNjRCSVQpKSB7Cj4gLQkJbWF4X21hcHBlZF9hZGRyID0gX19wYSh+KHVs
b25nKTApOwo+IC0JCWlmIChtYXhfbWFwcGVkX2FkZHIgPT0gKHBoeXNfcmFtX2VuZCAtIDEpKQo+
IC0JCQltZW1ibG9ja19zZXRfY3VycmVudF9saW1pdChtYXhfbWFwcGVkX2FkZHIgLSA0MDk2KTsK
PiAtCX0KPiArCW1lbWJsb2NrX3Jlc2VydmUoX19wYSgtUEFHRV9TSVpFKSwgUEFHRV9TSVpFKTsK
PiAgCj4gIAltaW5fbG93X3BmbiA9IFBGTl9VUChwaHlzX3JhbV9iYXNlKTsKPiAgCW1heF9sb3df
cGZuID0gbWF4X3BmbiA9IFBGTl9ET1dOKHBoeXNfcmFtX2VuZCk7CgpOaWNlISBXb3VsZCB5b3Ug
bWluZCBzdWJtaXR0aW5nIHRoaXMgYXMgYSBwcm9wZXIgZml4ICh1bmxlc3MgdGhlcmUncyBhCndh
eSB0byBkbyBpdCBub24tYXJjaCBzcGVjaWZpYyBsaWtlIE1hdHRoZXcgcG9pbnRlZCBvdXQpLgoK
CkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
