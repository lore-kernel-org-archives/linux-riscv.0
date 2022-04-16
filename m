Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7427BC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Apr 2022 16:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVLhywSwOvzCdvQ3pev5WQ8QtkFmtpcyPe/KVWyOQqY=; b=jxxXN54mffgPh5
	fpPfsuASM5jsa+toT6mo73oqzxONN9nz7TyULfS1gSc3+QIJAeiDh5JqmF8cy1FFC5HeykfxKvGKr
	97BXbfsC/yfK06fWES4ZCHQ3YuCmdNtCN503ZDpJLvURh6XrH5FCnPgOA4ak4omqamGWuE60Fhkox
	nzXBj85DfGd1UhYSUVTofcnCc2aco1sra1chixyFyoc0/c1K2RzRfF1nIzfCYQFvnHirzg5L3XiXD
	FH4w3e4nccaqMiJq2zSTlAepqBmU56I75eUwjPiTJdy3LjubipNTXKn+0Qzqb64fpKrwdQVBjil9o
	lq33YRfT5MAASDFyP9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nflca-00DFrx-7H; Sat, 16 Apr 2022 16:50:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nflcX-00DFqu-FO
 for linux-riscv@lists.infradead.org; Sat, 16 Apr 2022 16:50:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4804EB8068B
 for <linux-riscv@lists.infradead.org>; Sat, 16 Apr 2022 16:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087D4C385B1
 for <linux-riscv@lists.infradead.org>; Sat, 16 Apr 2022 16:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650127797;
 bh=qmUgUDofYI1jD2rLu9hnpnW6IkiX3GQmx1xSkVNgS3w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uX6FDLh1xYTVbyEzNXitbz83f6Cg91ZDDcNYwBdv/WV1qF+ZvrHSVyDxeTXbyD7J3
 Q20nw2UqDyITBf8kOc3WKlZUbCWsAdC4xE1l7k8lHydpEq8QfaVcrWmLU7iSkzypwg
 BOe+jqXK3+Riqd6ShVvgsaox8q5btBCD7mFYeW/HkAGo2xoMtTvPAWWtJ95W53rgcE
 j/97MznAO5W9zXppmsNMwRmK9V7BernTAlejIxQS8H46AIKYrmhG34oQ1h1gOHaI2F
 0q3SM3xAiWdgLiC1NpA1d05bXu5q5BfgUmUmBQDNwJE/JbVNwn4OuPBwJp0z0RegeY
 c1NAeFBCt7gXg==
Received: by mail-vs1-f44.google.com with SMTP id n5so9360069vsc.4
 for <linux-riscv@lists.infradead.org>; Sat, 16 Apr 2022 09:49:56 -0700 (PDT)
X-Gm-Message-State: AOAM531/SHjijL+gzD4paG/sWxASvMYqxWdiaud8By3sHzcri2cG8Lhw
 bb2os3F/g+FyO4FOHXacQ990wyokwl0Qo0gRNmw=
X-Google-Smtp-Source: ABdhPJwipWUHJGVYg3G9YqlCYWyULpwS8q2oCbq6rdTlaCM+02oXS/mNA7AoQvfY8ATUS0Y3Fps/fH6ZLKhSWSYgb9Y=
X-Received: by 2002:a67:ec04:0:b0:32a:4a53:172f with SMTP id
 d4-20020a67ec04000000b0032a4a53172fmr463677vso.59.1650127795835; Sat, 16 Apr
 2022 09:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220412034957.1481088-1-guoren@kernel.org>
 <YlbwOG46mCR8Q5tJ@tardis>
In-Reply-To: <YlbwOG46mCR8Q5tJ@tardis>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 17 Apr 2022 00:49:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRws6RqKmJHBdKsycWSkFgYna_MocJ+qp3Z9r1v7mQzsg@mail.gmail.com>
Message-ID: <CAJF2gTRws6RqKmJHBdKsycWSkFgYna_MocJ+qp3Z9r1v7mQzsg@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] riscv: atomic: Optimize AMO instructions usage
To: Boqun Feng <boqun.feng@gmail.com>, Andrea Parri <parri.andrea@gmail.com>, 
 Daniel Lustig <dlustig@nvidia.com>,
 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_095001_843157_B0FA21F0 
X-CRM114-Status: GOOD (  19.88  )
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

SGkgQm9xdW4sCgpPbiBXZWQsIEFwciAxMywgMjAyMiBhdCAxMTo0NiBQTSBCb3F1biBGZW5nIDxi
b3F1bi5mZW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBbQ2MgQW5kcmVhXQo+Cj4gT24gVHVlLCBB
cHIgMTIsIDIwMjIgYXQgMTE6NDk6NTRBTSArMDgwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6
Cj4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gVGhl
c2UgcGF0Y2ggc2VyaWVzIGNvbnRhaW4gb25lIGNsZWFudXAgYW5kIHNvbWUgb3B0aW1pemF0aW9u
cyBmb3IKPiA+IGF0b21pYyBvcGVyYXRpb25zLgo+ID4KPgo+IFNlZW1zIHRvIG1lIHRoYXQgeW91
IGFyZSBiYXNpY2FsbHkgcmV2ZXJ0aW5nIDVjZTZjMWYzNTM1Zgo+ICgicmlzY3YvYXRvbWljOiBT
dHJlbmd0aGVuIGltcGxlbWVudGF0aW9ucyB3aXRoIGZlbmNlcyIpLiBUaGF0IGNvbW1pdAo+IGZp
eGVkIGFuIG1lbW9yeSBvcmRlcmluZyBpc3N1ZSwgY291bGQgeW91IGV4cGxhaW4gd2h5IHRoZSBp
c3N1ZSBubwo+IGxvbmdlciBuZWVkcyBhIGZpeD8KCkknbSBub3QgcmV2ZXJ0aW5nIHRoZSBwcmlv
ciBwYXRjaCwganVzdCBvcHRpbWl6aW5nIGl0LgoKSW4gUklTQy1WIOKAnEHigJ0gU3RhbmRhcmQg
RXh0ZW5zaW9uIGZvciBBdG9taWMgSW5zdHJ1Y3Rpb25zIHNwZWMsIGl0IHNhaWQ6CklmIG9ubHkg
dGhlIGFxIGJpdCBpcyBzZXQsIHRoZSBhdG9taWMgbWVtb3J5IG9wZXJhdGlvbiBpcyB0cmVhdGVk
IGFzCmFuIGFjcXVpcmUgYWNjZXNzLCBpLmUuLCBubyBmb2xsb3dpbmcgbWVtb3J5IG9wZXJhdGlv
bnMgb24gdGhpcyBSSVNDLVYKaGFydCBjYW4gYmUgb2JzZXJ2ZWQgdG8gdGFrZSBwbGFjZSBiZWZv
cmUgdGhlIGFjcXVpcmUgbWVtb3J5Cm9wZXJhdGlvbi4KLSAgICAgICAgICAgICAgICAgICAgICAg
IiAgICAgICBhbW9zd2FwLncgJTAsICUyLCAlMVxuIiAgICAgICAgICAgICAgICAgXAotICAgICAg
ICAgICAgICAgICAgICAgICBSSVNDVl9BQ1FVSVJFX0JBUlJJRVIgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCisgICAgICAgICAgICAgICAgICAgICAgICIgICAgICAgYW1vc3dhcC53LmFxICUw
LCAlMiwgJTFcbiIgICAgICAgICAgICAgIFwKU28gUklTQ1ZfQUNRVUlSRV9CQVJSSUVSIGlzICJm
ZW5jZSByLCBydyIgYW5kICJmZW5jZSByIiBpcyBvdmVyCmNvbnN0cmFpbnRzIHRvIHByb3RlY3Qg
YW1vc3dhcC53LiBIZXJlIHVzaW5nIGFtb3N3YXAudy5hcSBpcyBtb3JlCnByb3Blci4KCklmIG9u
bHkgdGhlIHJsIGJpdCBpcyBzZXQsIHRoZSBhdG9taWMgbWVtb3J5IG9wZXJhdGlvbiBpcyB0cmVh
dGVkIGFzIGEKcmVsZWFzZSBhY2Nlc3MsIGkuZS4sIHRoZSByZWxlYXNlIG1lbW9yeSBvcGVyYXRp
b24gY2Fubm90IGJlIG9ic2VydmVkCnRvIHRha2UgcGxhY2UgYmVmb3JlIGFueSBlYXJsaWVyIG1l
bW9yeSBvcGVyYXRpb25zIG9uIHRoaXMgUklTQy1WCmhhcnQuCi0gICAgICAgICAgICAgICAgICAg
ICAgIFJJU0NWX1JFTEVBU0VfQkFSUklFUiAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAg
ICAgICAgICAgICAgICAgICAgICAgIiAgICAgICBhbW9zd2FwLncgJTAsICUyLCAlMVxuIiAgICAg
ICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAgICAgICAiICAgICAgIGFtb3N3YXAudy5y
bCAlMCwgJTIsICUxXG4iICAgICAgICAgICAgICBcClNvIFJJU0NWX1JFTEVBU0VfQkFSUklFUiBp
cyAiZmVuY2UgcncsIHciIGFuZCAiZmVuY2UgLHciIGlzIG92ZXIKY29uc3RyYWludHMgdG8gcHJv
dGVjdCBhbW9zd2FwLncuIEhlcmUgdXNpbmcgYW1vc3dhcC53LnJsIGlzIG1vcmUKcHJvcGVyLgoK
SWYgYm90aCB0aGUgYXEgYW5kIHJsIGJpdHMgYXJlIHNldCwgdGhlIGF0b21pYyBtZW1vcnkgb3Bl
cmF0aW9uIGlzCnNlcXVlbnRpYWxseSBjb25zaXN0ZW50IGFuZCBjYW5ub3QgYmUgb2JzZXJ2ZWQg
dG8gaGFwcGVuIGJlZm9yZSBhbnkKZWFybGllciBtZW1vcnkgb3BlcmF0aW9ucyBvciBhZnRlciBh
bnkgbGF0ZXIgbWVtb3J5IG9wZXJhdGlvbnMgaW4gdGhlCnNhbWUgUklTQy1WIGhhcnQgYW5kIHRv
IHRoZSBzYW1lIGFkZHJlc3MgZG9tYWluLgogICAgICAgICAgICAgICAgIjA6ICAgICBsci53ICAg
ICAlW3BdLCAgJVtjXVxuIgogICAgICAgICAgICAgICAgIiAgICAgICBzdWIgICAgICAlW3JjXSwg
JVtwXSwgJVtvXVxuIgogICAgICAgICAgICAgICAgIiAgICAgICBibHR6ICAgICAlW3JjXSwgMWZc
biIuCi0gICAgICAgICAgICAgICAiICAgICAgIHNjLncucmwgICVbcmNdLCAlW3JjXSwgJVtjXVxu
IgorICAgICAgICAgICAgICAgIiAgICAgICBzYy53LmFxcmwgJVtyY10sICVbcmNdLCAlW2NdXG4i
CiAgICAgICAgICAgICAgICAiICAgICAgIGJuZXogICAgICVbcmNdLCAwYlxuIgotICAgICAgICAg
ICAgICAgIiAgICAgICBmZW5jZSAgICBydywgcndcbiIKICAgICAgICAgICAgICAgICIxOlxuIgpT
byAucmwgKyBmZW5jZSBydywgcncgaXMgb3ZlciBjb25zdHJhaW50cywgb25seSB1c2luZyBzYy53
LmFxcmwgaXMgbW9yZSBwcm9wZXIuCgo+Cj4gUmVnYXJkcywKPiBCb3F1bgo+Cj4gPiBDaGFuZ2Vz
IGluIFYyOgo+ID4gIC0gRml4dXAgTFIvU0MgbWVtb3J5IGJhcnJpZXIgc2VtYW50aWMgcHJvYmxl
bXMgd2hpY2ggcG9pbnRlZCBieQo+ID4gICAgUnV0bGFuZAo+ID4gIC0gQ29tYmluZSBwYXRjaGVz
IGludG8gb25lIHBhdGNoc2V0IHNlcmllcwo+ID4gIC0gU2VwYXJhdGUgQU1PIG9wdGltaXphdGlv
biAmIExSU0Mgb3B0aW1pemF0aW9uIGZvciBjb252ZW5pZW5jZQo+ID4gICAgcGF0Y2ggcmV2aWV3
Cj4gPgo+ID4gR3VvIFJlbiAoMyk6Cj4gPiAgIHJpc2N2OiBhdG9taWM6IENsZWFudXAgdW5uZWNl
c3NhcnkgZGVmaW5pdGlvbgo+ID4gICByaXNjdjogYXRvbWljOiBPcHRpbWl6ZSBhY3F1aXJlIGFu
ZCByZWxlYXNlIGZvciBBTU8gb3BlcmF0aW9ucwo+ID4gICByaXNjdjogYXRvbWljOiBPcHRpbWl6
ZSBtZW1vcnkgYmFycmllciBzZW1hbnRpY3Mgb2YgTFJTQy1wYWlycwo+ID4KPiA+ICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2F0b21pYy5oICB8IDcwICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmggfCA0MiArKysrKy0t
LS0tLS0tLS0tLS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNlcnRpb25zKCspLCAzNiBk
ZWxldGlvbnMoLSkKPiA+Cj4gPiAtLQo+ID4gMi4yNS4xCj4gPgoKCgotLQpCZXN0IFJlZ2FyZHMK
IEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
