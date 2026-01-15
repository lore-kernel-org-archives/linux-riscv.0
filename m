Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E361D4116C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 11:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Uu3sKWE9LzxnE9xFqbRnGXVMKVSEQ7hnnIJDpGU+18=; b=Byo10iQSF5xy0c
	0hHQvO1qBN1JxmrK6uDjCEEj+Gr4DCwt/LGd0ZKpvURPRZSMy0W8GHQ2Sn1Nw0sJ7BLpX4SQpmhS6
	HBIA3SxYChy+jihFn6X/PY2wergw2bra1IC/AnQeODTWKa/CStrUYZb0hAq9CfVuOI5ExNuKECE2I
	GFu9JQFJ1IJNCY9ndM1Rf/pfQoGlhA3Yag4h4grCaiWTyfny3aSnJPhmjOtCL4RWXYl5UsxJeqT/6
	DJoJ1QxG6F0APZLq+MYqR/n3GT+PSuzVveOsSTk/q3e5q7dNyPdCaDg9MZjz6mV50SjBfjdL2tXYI
	4S5Q2AY/R1lOixz+AjtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLFw-0000000CCOW-3BXu;
	Thu, 15 Jan 2026 11:11:12 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLFu-0000000CCO6-2zmu
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 11:11:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768475464; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N21EVSrgriQGJH6wCJzJaT6FgfmWPn68Cg7ViNdQJz+OmKwxjHg+yzRyq2kWwPCIN5eFXKQ+qQ0YQN/SKVqYiuJYYqOhl/hj7lfM43xEBsAt2/6RhZasl/xOR1hFbnFNw+cr1chT4F1WDk8pwNMwxIEy5RX2rryDicKC7kws9ao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768475464; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0ZzcyUUnaf+p4JILgIfwq7VVSI4bHuKOX3hx4ktkbXc=; 
	b=fUR4+d5dgK6OPD78TNYN6AAlfFkUr//HPe9luZt2z8iY6QqcXGkBDyPWyzpqMntfiPOWpU5oV4sZAy+nQeekZenB3v9NCuN0E5U2QSjAT/sn675JTx2jQ+0SHm6eVUGjQptL06LjsSB1q9ZOIwNGkYPzGsZzRUJPmLwfr1uM4/Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768475464;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=0ZzcyUUnaf+p4JILgIfwq7VVSI4bHuKOX3hx4ktkbXc=;
	b=lSl6y+QHI1IDPk+M9q2rhxEssQ9i9FMYCkMyaDzwpKQOqwD23zPEOdpKWTs/HmXp
	2cO8FHPCCYPgVvAso/R+eptsbcyGkr8CqZdLZP5dyabKqf4/ONIILAHjQ8GV57bOrJt
	g7MCmiqPMzbSbcBFyvkQg+H/TLYhqgAAWbDfFt+Y=
Received: by mx.zohomail.com with SMTPS id 1768475462679109.26630067242331;
	Thu, 15 Jan 2026 03:11:02 -0800 (PST)
Date: Thu, 15 Jan 2026 11:10:41 +0000
From: Yao Zi <me@ziyao.cc>
To: Paul Walmsley <pjw@kernel.org>, Han Gao <rabenda.cn@gmail.com>,
	guoren@kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>, palmer@dabbelt.com,
	conor@kernel.org, paul.walmsley@sifive.com, bjorn@rivosinc.com,
	eobras@redhat.com, corbet@lwn.net, peterlin@andestech.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH V2 2/2] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
Message-ID: <aWjLMYZ10iNxs1i6@pie>
References: <20250713155321.2064856-1-guoren@kernel.org>
 <20250713155321.2064856-3-guoren@kernel.org>
 <1cfdf6c1-a384-43ad-9588-284335d073f7@ghiti.fr>
 <CAAT7Ki9_Vm0+v9RHpa2w-Bg3agJy2Tp4d6+tcPJ=M7XX3GV-7Q@mail.gmail.com>
 <CAHVXubgrbjHXAPSLjk6uZmUoa52fTYBvutk4q0GFYJPQ0swrGA@mail.gmail.com>
 <6c45ed33-d6f8-d385-8b89-9caf2ec18c77@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c45ed33-d6f8-d385-8b89-9caf2ec18c77@kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_031110_856193_54262925 
X-CRM114-Status: GOOD (  15.46  )
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

T24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgMDk6Mzc6NDdQTSAtMDYwMCwgUGF1bCBXYWxtc2xleSB3
cm90ZToKPiBIZWxsbyBIYW4gR2FvLCBHdW8gUmVuLAo+IAo+IFNvcnJ5IGZvciB0aGUgZGVsYXkg
aW4gcmVzcG9uZGluZyAtCj4gCj4gT24gVHVlLCBPY3QgNywgMjAyNSBhdCAxMTozNuKAr1BNIEhh
biBHYW8gPHJhYmVuZGEuY25AZ21haWwuY29tPiB3cm90ZToKPiAKPiA+ICAgICAgVGhpcyBwYXRj
aCBpcyBpbmNsdWRlZCBpbiB0aGUgNi4xNyBtZXJnZSB3aW5kb3cgYnV0IG5vdCBpbiB0aGUKPiA+
IDYuMTggbWVyZ2Ugd2luZG93Lgo+ID4gICAgICBJcyBpdCBwb3NzaWJsZSB0aGF0IHRoZSBwYXRj
aCB3YXMgbWlzc2VkPwo+IAo+IFRoaXMgd2FzIGFsbW9zdCBzZW50IHVwc3RyZWFtIGFzIHBhcnQg
b2YgdGhlIHY2LjE4IG1lcmdlIHdpbmRvdywgYnV0IGdpdmVuIAo+IHRoYXQgaXQgYWRkcyB0aGUg
YWJpbGl0eSBmb3IgYXJjaGl0ZWN0dXJlcyB0byBvdmVycmlkZSBXUklURV9PTkNFLCBJIHRoaW5r
IAo+IGl0IG5lZWRzIG9uZSBtb3JlIGF0dGVtcHQgYXQgZ2F0aGVyaW5nIGZlZWRiYWNrIGJlZm9y
ZSB3ZSBkby4gIEknbGwgc2VuZCAKPiB0aGF0IG91dCB0aGlzIHdlZWsuCj4gCj4gdGhhbmtzIGZv
ciB5b3VyIHBhdGllbmNlLAoKSGkgUGF1bCwKCkNvdWxkIHRoaXMgc2VyaWVzIGJlIHF1ZXVlZCBm
b3IgNi4yMD8gSXQgaGFzIGJlZW4gbW9yZSB0aGFuIHR3byBtb250aHMsCmFuZCBzZWVtcyBubyBt
b3JlIGZlZWRiYWNrIGhhcyBjb21lIHVwLiBUaGFua3MgZm9yIHlvdXIgd29yayEKCj4gLSBQYXVs
CgpCZXN0IHJlZ2FyZHMsCllhbyBaaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
