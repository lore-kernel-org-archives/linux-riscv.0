Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D226AC48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 22:14:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BAE261246
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 22:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BAE261246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SqC1m80darYNNHNjFHRhcH6r3CoMxefZLuh8eM00afo=; b=TauZces5sJW622
	wwWTpu7lZtVSNXWgi3mcfftnbK/ZlFVhYMegkbLuQ1ZEPUf1pfDViLxA3ZuSCtLs7Fuipy78V2wsG
	f7VByorNaDkLpYAUPt7af+PsQs+CPcfimshhZ9GRC6oyhcNdFX9bzFupfboksonXp/g6FmvQgRPbR
	xdtseWIJ+aqibFBA4ZAWsg4Wj8r9uqPd7jxJ0RHE5gqh0xnh21hhcljdnxfiiWvbosWPiK6Uo7TyG
	Pf7b/q1097cTxrtD3O1XBG8l7WqbzAM1b84IomHVYta+FxL+rf1jkOl/AOhNhSAKmXmHpKUs+Wh7y
	VVYjq/0+8xqgVq9M+mhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltHKB-003TFX-8u; Tue, 15 Jun 2021 22:14:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltEdE-002Omc-Sc
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 19:21:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D47ED611C0
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 19:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623784911;
 bh=MiyNMOqe8D+Qv1ZCBNXEEXX1PzZVvhgk3ba2lE4oIg8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mtoG7zNPtpZsvQbvGP8yhZylUX75lhUTO0D3sGutRFQw4YsC/rBkyY/aHqAa3/x7Z
 FUurSl0cAWCim2VhAR/W2YM/ZVElxcCC+RoJMkLqlo/GGM6ZlLYp8X9q15baYqri3U
 L5CQGt0K11TGkZbZ5SoMB6QxIOE4JFnnUbIULj71aWTCQ+Pkgp4CKF4lIy9Qy3qk5j
 F0Y83bsO/aP731wd93GFUKpUYngFSP8I+RcM6jiYeT93Qa+yMWv5R7HY9BEYjPKDxk
 Vwoth1qDiFUPTHKq0BBr9yUiKBh2VWI+mRLPR1zl4Jv/ibpCeJOcOk3pCG+yYPK4GU
 rGBWtfIiEGdag==
Received: by mail-ej1-f52.google.com with SMTP id ho18so24340575ejc.8
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 12:21:51 -0700 (PDT)
X-Gm-Message-State: AOAM532qTmNskV50c3E3ezoUjmlFCtqvZZgoDH+ZMMmZH1GZmFJm+n1o
 R/cPuHL0K9U087NJmp763yKpfqNxhJXqQZ+xIg==
X-Google-Smtp-Source: ABdhPJwa2eewtgu6uySopO4xXVRmZ/yjtkv5h1exXtdSD1u+7n88m1i55KAd4hYrQJiPXyTsdD6k57DUi86pkmYzJdA=
X-Received: by 2002:a17:907:2059:: with SMTP id
 pg25mr1204414ejb.130.1623784910428; 
 Tue, 15 Jun 2021 12:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210419005539.22729-1-mick@ics.forth.gr>
 <20210419005539.22729-6-mick@ics.forth.gr>
 <CAMuHMdW=23SPXwqcjD+30M_d0azdze2=ChZM-PF1brf9bCNtrA@mail.gmail.com>
 <fe02eb618eee141e8bc021e8e30906fc@mailhost.ics.forth.gr>
 <CAMuHMdXtT1L3yfzkTkbhqz3zgUQj89Bcm7mqz+m126NprAsK8Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXtT1L3yfzkTkbhqz3zgUQj89Bcm7mqz+m126NprAsK8Q@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 15 Jun 2021 13:21:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLHOmZ6az0bYGC3dg__YX3aq=+Un4_x4+R2nNksc0hM2g@mail.gmail.com>
Message-ID: <CAL_JsqLHOmZ6az0bYGC3dg__YX3aq=+Un4_x4+R2nNksc0hM2g@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] RISC-V: Add crash kernel support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_122153_053448_F32C7697 
X-CRM114-Status: GOOD (  37.16  )
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

T24gVHVlLCBKdW4gMTUsIDIwMjEgYXQgMTI6NDggUE0gR2VlcnQgVXl0dGVyaG9ldmVuCjxnZWVy
dEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBIaSBOaWNrLAo+Cj4gT24gVHVlLCBKdW4gMTUs
IDIwMjEgYXQgODoyOSBQTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPiB3cm90
ZToKPiA+IM6jz4TOuc+CIDIwMjEtMDYtMTUgMTY6MTksIEdlZXJ0IFV5dHRlcmhvZXZlbiDOrc6z
z4HOsc+IzrU6Cj4gPiA+IFRoaXMgZG9lcyBub3QgbWF0Y2gKPiA+ID4gaHR0cHM6Ly9naXRodWIu
Y29tL2RldmljZXRyZWUtb3JnL2R0LXNjaGVtYS9ibG9iL21hc3Rlci9zY2hlbWFzL2Nob3Nlbi55
YW1sI0w3NzoKPiA+ID4KPiA+ID4gICAgICRyZWY6IHR5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Vp
bnQ2NC1hcnJheQo+ID4gPiAgICAgbWF4SXRlbXM6IDIKPiA+ID4gICAgIGRlc2NyaXB0aW9uOgo+
ID4gPiAgICAgICBUaGlzIHByb3BlcnR5IChjdXJyZW50bHkgdXNlZCBvbmx5IG9uIGFybTY0KSBo
b2xkcyB0aGUgbWVtb3J5Cj4gPiA+IHJhbmdlLAo+ID4gPiAgICAgICB0aGUgYWRkcmVzcyBhbmQg
dGhlIHNpemUsIG9mIHRoZSBlbGYgY29yZSBoZWFkZXIgd2hpY2ggbWFpbmx5Cj4gPiA+IGRlc2Ny
aWJlcwo+ID4gPiAgICAgICB0aGUgcGFuaWNrZWQga2VybmVsXCdzIG1lbW9yeSBsYXlvdXQgYXMg
UFRfTE9BRCBzZWdtZW50cyBvZiBlbGYKPiA+ID4gZm9ybWF0Lgo+ID4gPgo+ID4gPiBIZW5jZSAi
bGludXgsZWxmY29yZWhkciIgc2hvdWxkIGJlIGEgcHJvcGVydHkgb2YgdGhlIC9jaG9zZW4gbm9k
ZSwKPiA+ID4gaW5zdGVhZCBvZiBhIG1lbW9yeSBub2RlIHdpdGggYSBjb21wYXRpYmxlIHZhbHVl
IG9mICJsaW51eCxlbGZjb3JlaGRyIi4KPiA+ID4KPiA+Cj4gPiBUaGF0J3MgYSBiaW5kaW5nIGZv
ciBhIHByb3BlcnR5IG9uIHRoZSAvY2hvc2VuIG5vZGUsIHRoYXQgYXMgdGhlIHRleHQKPiA+IHNh
eXMgaXQncyBkZWZpbmVkIGZvciBhcm02NCBvbmx5IGFuZCB0aGUgY29kZSB0aGF0IGhhbmRsZWQg
aXQgd2FzIGFsc28KPgo+IFRoYXQgZG9lc24ndCBtZWFuIGl0IG11c3Qgbm90IGJlIHVzZWQgb24g
b3RoZXIgYXJjaGl0ZWN0dXJlcyA7LSkKPiBBcm02NCB3YXMganVzdCB0aGUgZmlyc3Qgb25lIHRv
IHVzZSBpdC4uLgoKSXQgaXMgdXNlZCBvbiBhcm02NCBiZWNhdXNlIG1lbW9yeSBpcyBvZnRlbiBw
YXNzZWQgYnkgVUVGSSB0YWJsZXMgYW5kCm5vdCB3aXRoIC9tZW1vcnkgbm9kZS4gQXMgcmlzY3Yg
aXMgYWxzbyBzdXBwb3J0aW5nIEVGSSwgSSdkIHRoaW5rIHRoZXkKd291bGQgZG8gdGhlIHNhbWUu
Cgo+ID4gb24gYXJtNjQuIEluc3RlYWQgdGhlIHJlc2VydmVkLXJlZ2lvbiBiaW5kaW5nIEkgdXNl
ZCBpcyBhIHN0YW5kYXJkCj4gPiBiaW5kaW5nLCBpZiB5b3UgZG9uJ3QgbGlrZSB0aGUgbmFtZSB1
c2VkIGZvciB0aGUgY29tcGF0aWJsZSBzdHJpbmcKPiA+IGJlY2F1c2UgaXQgb3ZlcmxhcHMgd2l0
aCB0aGF0IHByb3BlcnR5IHdlIGNhbiBjaGFuZ2UgaXQuIEkgd2FudCB0byB1c2UgYQo+ID4gcmVz
ZXJ2ZWQtcmVnaW9uIGZvciB0aGlzIGJlY2F1c2Ugd2UnbGwgaGF2ZSB0byByZXNlcnZlIGl0IGFu
eXdheSBzbwo+ID4gdXNpbmcgYSBwcm9wZXJ0eSBvbiAvY2hvc2VuIGFuZCB0aGVuIHVzaW5nIHRo
YXQgcHJvcGVydHkgdG8gcmVzZXJ2ZSB0aGUKPiA+IHJlZ2lvbiBzZWVtZWQgc3Vib3B0aW1hbC4K
PiA+Cj4gPiA+PiB2MjoKPiA+ID4+ICAqIFVzZSBsaW51eCx1c2FibGUtbWVtb3J5IG9uIC9tZW1v
cnkgaW5zdGVhZCBvZiBhIG5ldyBiaW5kaW5nCj4gPiA+Cj4gPiA+IFRoaXMgcGFydCBzZWVtcyB0
byBoYXZlIGJlZW4gcmVtb3ZlZCBpbiB2MyBhbmQgbGF0ZXI/Cj4gPiA+IE5vdGUgdGhhdCAibGlu
dXgsdXNhYmxlLW1lbW9yeS1yYW5nZSIgc2hvdWxkIGJlIGEgcHJvcGVydHkgb2YgdGhlCj4gPiA+
IC9jaG9zZW4gbm9kZSwgdG9vLCBjZnIuCj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9kZXZpY2V0
cmVlLW9yZy9kdC1zY2hlbWEvYmxvYi9tYXN0ZXIvc2NoZW1hcy9jaG9zZW4ueWFtbCNMODUKPiA+
ID4KPiA+Cj4gPiBObyBzcGVjaWFsIGhhbmRsaW5nIGlzIG5lZWRlZCB3aGVuIHVzaW5nIGxpbnV4
LHVzYWJsZS1tZW1vcnkgb24gL21lbW9yeSwKPiA+IGxpbWl0aW5nIHRoZSBhdmFpbGFibGUgbWVt
b3J5IGlzIGhhbmRsZWQgYnkgZ2VuZXJpYyBjb2RlIGF0Cj4gPiBkcml2ZXJzL29mL2ZkdC5jCj4K
PiBJdCB3YXMgbXkgdW5kZXJzdGFuZGluZyBib3RoIHByb3BlcnRpZXMgdW5kZXIgL2Nob3NlbiBh
cmUgdGhlCj4gcmVjb21tZW5kZWQgbWV0aG9kcyBmb3IgbmV3IHBsYXRmb3Jtcy4uLiBMZXQncyBz
ZWUgd2hhdCBSb2IgaGFzCj4gdG8gc2F5Li4uCj4KPiBBbnl3YXksIEkgc2VudCBhIHBhdGNoIHNl
cmllcyB0byBzd2l0Y2ggdG8gZ2VuZXJpYyAibGludXgsZWxmY29yZWhkciIKPiBoYW5kbGluZwo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvY292ZXIuMTYyMzc4MDA1OS5naXQuZ2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmUvCj4KPiBUaGFua3MhCj4KPiBHcntvZXRqZSxlZXRpbmd9cywKPgo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4KPiAtLQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcKPgo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxp
c3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
