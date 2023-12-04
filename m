Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC44AC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FT6zC8rBKUN9G2qEMgsVEoOARK7OLUgylb/bPMeCSgY=; b=PZh60oBYgVnAjH
	qk5VhFCWhDgpx99kChySy082D882ts9WpSHU5ZBrQ8UXTj48KOPFXjzYS6NC23DOCRXfHgTmotIkK
	vLUY2aqy5eCT3XSwr104c4ojR7av65a7y7n6m8TmcBIe392sHdpbBrtHTiMJplG5gb+a7Yf8UEEJE
	yhhxRJS32NBw/l6/o154EpbQOe9QU1tLfWc3jAeWGHLKxFj1UTy9pLtYhgz6vrJGX2ArgOZLjEbZ8
	lhGhKXYrINjAPir8y/84xcyO0QlROQ3R9MdZ2gemnHvbF+o0dJeqsZxpDAH8pXiUqNFwgo48+43vT
	ah5OEW1xoET40kG8OPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAAJn-004rLR-0L;
	Mon, 04 Dec 2023 14:53:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAAJj-004rKJ-2e
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 14:53:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5BA06B8101C
	for <linux-riscv@lists.infradead.org>; Mon,  4 Dec 2023 14:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088EBC433C7
	for <linux-riscv@lists.infradead.org>; Mon,  4 Dec 2023 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701701582;
	bh=NuRXrq7N3kGS8uwkFtg1Srlgms/l7Ivsv0arLwupqHw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IAFHXXqfghi9TPmq3hZ9HtoyYfptiVays5G/rHL0Oh/qzMfnG/09yVgyew/Pjh5Yx
	 iQtNBjLovBwZvXAdxLY04z/TLrhKfjE/jbvuDDdL1lc9AuYilZNBdRsPGVARnnRFjH
	 oFgoLhsPJu6kRVMaUY2YxWNU7qDL4A9hHxojVRgJrQ5KRWmS+H0tIJSEVD5p1rj0Ya
	 XIlUvIU4A55BbHhPmceVxjTfpK98QPtzOhMuBFOKw+bSOs3I620udckcQiYAOssx9f
	 9kzzWOM71Gc7PaEySoWVsT0ZZZhQHzWfck+jlATBFKSB2h5Ng67jrlPA1j7z+E7wCp
	 nKz44afyVm5vA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c9fc0b84d0so17083951fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 06:53:01 -0800 (PST)
X-Gm-Message-State: AOJu0YxxLYrQ82oWhXkv8VuGpyLxXZUw/2TznwrLdE4xAVeEwr442FZX
	91E1XVdokUuccL1RmsIRazTyPE84Pc5eBSkcq2g=
X-Google-Smtp-Source: AGHT+IHkCIk7W6xkoYH24E/xUgUUfHwLDL7y3oi7LnhmU/itgHIKTq9PTHKelorqOMuakQ0gScRN0vRvJbK8HIusknc=
X-Received: by 2002:a2e:8015:0:b0:2c9:f181:7347 with SMTP id
 j21-20020a2e8015000000b002c9f1817347mr1874219ljg.4.1701701580168; Mon, 04 Dec
 2023 06:53:00 -0800 (PST)
MIME-Version: 1.0
References: <IA1PR20MB4953C912FC58C0D248976564BB86A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49531ED1BCC00D6B265C2D10BB86A@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB49531ED1BCC00D6B265C2D10BB86A@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 4 Dec 2023 22:52:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSf5dCuYecY39nksczFzuXUvEJ_hLef5tyW0OgLmCDLPQ@mail.gmail.com>
Message-ID: <CAJF2gTSf5dCuYecY39nksczFzuXUvEJ_hLef5tyW0OgLmCDLPQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>, 
	Anup Patel <anup@brainfault.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_065304_198932_A5B8724A 
X-CRM114-Status: GOOD (  21.81  )
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

T24gTW9uLCBEZWMgNCwgMjAyMyBhdCA1OjUx4oCvUE0gSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QG91dGxvb2suY29tPiB3cm90ZToKPgo+IFRoZSB0aW1lciByZWdpc3RlcnMgb2YgYWNsaW50IGRv
bid0IGZvbGxvdyB0aGUgY2xpbnQgbGF5b3V0IGFuZCBjYW4KPiBiZSBtYXBwZWQgb24gYW55IGRp
ZmZlcmVudCBvZmZzZXQuIEFzIHNnMjA0MiB1c2VzIHNlcGFyYXRlZCB0aW1lcgo+IGFuZCBtc3dp
IGZvciBpdHMgY2xpbnQsIGl0IHNob3VsZCBmb2xsb3cgdGhlIGFjbGludCBzcGVjIGFuZCBoYXZl
Cj4gc2VwYXJhdGVkIHJlZ2lzdGVycy4KPgo+IFRoZSBwcmV2aW91cyBwYXRjaCBpbnRyb2R1Y2Vk
IGEgbmV3IHR5cGUgb2YgVC1IRUFEIGFjbGludCB0aW1lciB3aGljaAo+IGhhcyBjbGludCB0aW1l
ciBsYXlvdXQuIEFsdGhvdWdoIGl0IGhhcyB0aGUgY2xpbnQgdGltZXIgbGF5b3V0LCBpdAo+IHNo
b3VsZCBmb2xsb3cgdGhlIGFjbGludCBzcGVjIGFuZCB1c2VzIHRoZSBzZXBhcmF0ZWQgbXRpbWUg
YW5kIG10aW1lY21wCj4gcmVncy4gU28gYSBBQkkgY2hhbmdlIGlzIG5lZWRlZCB0byBtYWtlIHRo
ZSB0aW1lciBmaXQgdGhlIGFjbGludCBzcGVjLgo+Cj4gVG8gbWFrZSBULUhFQUQgYWNsaW50IHRp
bWVyIG1vcmUgY2xvc2VyIHRvIHRoZSBhY2xpbnQgc3BlYywgdXNlCj4gcmVncy1uYW1lcyB0byBy
ZXByZXNlbnQgdGhlIG10aW1lY21wIHJlZ2lzdGVyLCB3aGljaCBjYW4gYXZvaWQgaGFjawo+IGZv
ciB1bnN1cHBvcnQgbXRpbWUgcmVnaXN0ZXIgb2YgVC1IRUFEIGFjbGludCB0aW1lci4KPgo+IEFs
c28sIGFzIFQtSEVBRCBhY2xpbnQgb25seSBzdXBwb3J0cyBtdGltZWNtcCwgaXQgaXMgdW5uZWNl
c3NhcnkgdG8KPiBpbXBsZW1lbnQgdGhlIHdob2xlIGFjbGludCBzcGVjLiBUbyBtYWtlIHRoaXMg
YmluZGluZyBULUhFQUQgc3BlY2lmaWMsCj4gb25seSBhZGQgcmVnLW5hbWUgZm9yIGV4aXN0ZWQg
cmVnaXN0ZXIuIEZvciBkZXRhaWxzLCBzZWUgdGhlIGRpc2N1c3Npb24KPiBpbiB0aGUgbGFzdCBs
aW5rLgo+Cj4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQG91dGxvb2su
Y29tPgo+IEZpeGVzOiA0NzM0NDQ5ZjczMTEgKCJkdC1iaW5kaW5nczogdGltZXI6IEFkZCBTb3Bo
Z28gc2cyMDQyIENMSU5UIHRpbWVyIikKPiBMaW5rOiBodHRwczovL2xpc3RzLmluZnJhZGVhZC5v
cmcvcGlwZXJtYWlsL29wZW5zYmkvMjAyMy1PY3RvYmVyLzAwNTY5My5odG1sCj4gTGluazogaHR0
cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWFjbGludC9ibG9iL21haW4vcmlzY3YtYWNsaW50
LmFkb2MKPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvSUExUFIyME1CNDk1M0Y5
RDc3RkZDNzZBOUQyMzY5MjJEQkJCNkFASUExUFIyME1CNDk1My5uYW1wcmQyMC5wcm9kLm91dGxv
b2suY29tLwo+IC0tLQo+ICAuLi4vYmluZGluZ3MvdGltZXIvdGhlYWQsYzkwMC1hY2xpbnQtbXRp
bWVyLnlhbWwgICAgICAgICB8IDkgKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdGltZXIvdGhlYWQsYzkwMC1hY2xpbnQtbXRpbWVyLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvdGhlYWQsYzkwMC1hY2xpbnQt
bXRpbWVyLnlhbWwKPiBpbmRleCBmYmQyMzU2NTBlNTIuLjJlOTJiY2RlYjQyMyAxMDA2NDQKPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvdGhlYWQsYzkwMC1h
Y2xpbnQtbXRpbWVyLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdGltZXIvdGhlYWQsYzkwMC1hY2xpbnQtbXRpbWVyLnlhbWwKPiBAQCAtMTcsNyArMTcsMTIg
QEAgcHJvcGVydGllczoKPiAgICAgICAgLSBjb25zdDogdGhlYWQsYzkwMC1hY2xpbnQtbXRpbWVy
Cj4KPiAgICByZWc6Cj4gLSAgICBtYXhJdGVtczogMQo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0g
ZGVzY3JpcHRpb246IE1USU1FQ01QIFJlZ2lzdGVycwo+ICsKPiArICByZWctbmFtZXM6Cj4gKyAg
ICBpdGVtczoKPiArICAgICAgLSBjb25zdDogbXRpbWVjbXAKPgo+ICAgIGludGVycnVwdHMtZXh0
ZW5kZWQ6Cj4gICAgICBtaW5JdGVtczogMQo+IEBAIC0yOCw2ICszMyw3IEBAIGFkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQo+ICByZXF1aXJlZDoKPiAgICAtIGNvbXBhdGlibGUKPiAgICAtIHJl
Zwo+ICsgIC0gcmVnLW5hbWVzCj4gICAgLSBpbnRlcnJ1cHRzLWV4dGVuZGVkCj4KPiAgZXhhbXBs
ZXM6Cj4gQEAgLTM5LDUgKzQ1LDYgQEAgZXhhbXBsZXM6Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8JmNwdTNpbnRjIDc+LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZj
cHU0aW50YyA3PjsKPiAgICAgICAgcmVnID0gPDB4YWMwMDAwMDAgMHgwMDAxMDAwMD47Cj4gKyAg
ICAgIHJlZy1uYW1lcyA9ICJtdGltZWNtcCI7Cj4gICAgICB9Owo+ICAuLi4KPiAtLQo+IDIuNDMu
MAo+CkFja2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCi0tIApCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
