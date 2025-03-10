Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85166C28B28
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 02:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWM3/Mo0AF8JOjpSdyYaeoRllspHhNpt/rAMt/v8IFo=; b=nLEA1C0ZWH5FzY
	g1wb68HZIBmawiA9HTa643oDc04cO1KGN0LpHpdBfmkdBy8808jFwJqGxjR9iyJwNoxtvrQLI7o0H
	bGrCHENof9SJNuUKuOTC9j2frKNS6kRTueVzkQhI2nwtecXGRw0dfsnZFrFi1fqFMsD9cr06pJ0tY
	IuXb+oEJh0z8z9Io8DrnPzwQbd8eoiy/6aDHtOQa/uWz6M5WpMXXjPKFysRLKFYHMLlxWDFYb/bsf
	Vbuwl8NasI7PmnhijsRCZpT5s+mTWN8N38rTGGuobRIJJvirmwfZKmxQT1QFxca8Hia6cW3w8wE3p
	bxHY/fq69FH+Ae8InxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trSeC-00000001QZv-1M2O;
	Mon, 10 Mar 2025 02:13:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trSeA-00000001QZI-3Gk8
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 02:13:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51D625C53B6
	for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 02:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E78C4CEEF
	for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 02:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741572817;
	bh=z9mLsHw9Q3v422/Yt1W+ofnnkznofgPzm/tT/dzXn38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HR3HVoEJs8Dj3SJUQJl/9yOkY3qzYNH49NJSed8dRp+v8BKG7DmZN4jkt97KyJc0b
	 r5kJKlTVYyJPJBrKUJXCa+eJt0MrjnGYClR9q2KAzOQgc9Ixw+TUTAD8tHdCTm8INh
	 TjfexCnSzVOWUHewX3eeZTMyY6U4YkR6yRaJPRelwGTDeWt4gQxZNbDP7QntiPZnyS
	 EjZodPom+DIfeozpq4+YApfldJjutgQTSIgU9BY94Qm/1L2c6oI3wJoJC0p6IqKa2t
	 xhqNc1/CG/p1coU/y2Ckk+KrUR5B9n1JH+6a7KFXAp2X2fTaGrHg44mpj2TaUh2CrL
	 1ZnerZ2TWwT0w==
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43bcbdf79cdso21036415e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 09 Mar 2025 19:13:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWL3Mmpah/RBd8XAzTcHU7em/sYo3Z9BkCMw7koZJxY4kt9kR93H2vjV9cNkxEyl0cY23n/+wnjBNyu/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW5efgNd3uC8L6KYNARDqLSeuWcEipcXmes9RgQpMbUNK3RMaw
	OFJEOHvoPto/XkumSrM3gBvEjqnlEpA6jPUiV2a5lMr1BF1EZrBpkn26ODHiq648u8T55sx0MOA
	RYMN6jd1WuGDBF4Bb7G6oQ/4rSh8=
X-Google-Smtp-Source: AGHT+IFKsAup9e8Gc1v8ulkbmHr98edm6s87EvlcdJ5Cvko4at1GaCbqwTsdJwbMKXfm/BQUgl53lstuyy4HISvzJV0=
X-Received: by 2002:a05:600c:1d1a:b0:43c:e6d1:efe7 with SMTP id
 5b1f17b1804b1-43ce6d1f1e6mr28755625e9.26.1741572816273; Sun, 09 Mar 2025
 19:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250224112042.60282-1-xry111@xry111.site> <91797ac4bbe27d7d60b89053050e429bcd630db3.camel@xry111.site>
In-Reply-To: <91797ac4bbe27d7d60b89053050e429bcd630db3.camel@xry111.site>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 10 Mar 2025 10:13:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRXyMX+9C_aEDbxAsxWDD2rbnDWO775YDZ3EmrQ=QinfQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpxPLjcz__aP8mbaWjnVB43tgqVJ36D7ViX6jxsCAtJ6NThRTlt4NTpaRI
Message-ID: <CAJF2gTRXyMX+9C_aEDbxAsxWDD2rbnDWO775YDZ3EmrQ=QinfQ@mail.gmail.com>
Subject: Re: Ping: [PATCH 0/3] Drop explicit --hash-style= setting for new
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Fangrui Song <i@maskray.me>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_191338_933716_712C402D 
X-CRM114-Status: GOOD (  16.10  )
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

T24gV2VkLCBNYXIgNSwgMjAyNSBhdCA5OjI34oCvUE0gWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTEx
LnNpdGU+IHdyb3RlOgo+Cj4gUGluZy4KPgo+IE9uIE1vbiwgMjAyNS0wMi0yNCBhdCAxOToyMCAr
MDgwMCwgWGkgUnVveWFvIHdyb3RlOgo+ID4gRm9yIHJpc2N2LCBjc2t5LCBhbmQgTG9vbmdBcmNo
LCBHTlUgaGFzaCBoYWQgYWxyZWFkeSBiZWNvbWUgdGhlIGRlLQo+ID4gZmFjdG8KPiA+IHN0YW5k
YXJkIHdoZW4gdGhleSBib3JuZWQsIHNvIHRoZXJlJ3Mgbm8gR2xpYmMvTXVzbCByZWxlYXNlcyBm
b3IgdGhlbQo+ID4gd2l0aG91dCBHTlUgaGFzaCBzdXBwb3J0LCBhbmQgdGhlIHRyYWRpdGlvbmFs
IFN5c1YgaGFzaCBpcyBqdXN0Cj4gPiB3YXN0aW5nCj4gPiBzcGFjZSBmb3IgdGhlbS4KPiA+Cj4g
PiBSZW1vdmUgdGhvc2Ugc2V0dGluZ3MgYW5kIGZvbGxvdyB0aGUgZGlzdHJvIHRvb2xjaGFpbiBk
ZWZhdWx0LCB3aGljaAo+ID4gaXMKPiA+IGxpa2VseSAtLWhhc2gtc3R5bGU9Z251LiAgSW4gdGhl
IHBhc3QgaXQgY291bGQgYnJlYWsgdkRTTyBzZWxmIHRlc3RzLAo+ID4gYnV0IG5vdyB0aGUgaXNz
dWUgaGFzIGJlZW4gYWRkcmVzc2VkIGJ5IGNvbW1pdAo+ID4gZTA3NDZiZGU2ZjgyICgic2VsZnRl
c3RzL3ZEU086IHN1cHBvcnQgRFRfR05VX0hBU0giKS4KPiA+Cj4gPiBYaSBSdW95YW8gKDMpOgo+
ID4gICByaXNjdjogdkRTTzogUmVtb3ZlIC0taGFzaC1zdHlsZT1ib3RoClRoZSBwYXRjaCdzIGNv
bW1lbnQgaXMgaW5jb3JyZWN0OyB3aGVuIEkgcmVtb3ZlZCAtLWhhc2gtc3R5bGU9Ym90aCwKdGhl
IG91dHB1dCBzdGlsbCBjb250YWluZWQgdGhlIEhBU0gsIGFuZCBubyBzcGFjZSB3YXMgc2F2ZWQu
CgotLWhhc2gtc3R5bGU9Ym90aCBhbmQgYWZ0ZXIgdGhlIHBhdGNoIGFyZSB0aGUgc2FtZToKU2Vj
dGlvbiBIZWFkZXJzOgogIFtOcl0gTmFtZSAgICAgICAgICAgICAgVHlwZSAgICAgICAgICAgICBB
ZGRyZXNzICAgICAgICAgICBPZmZzZXQKICAgICAgIFNpemUgICAgICAgICAgICAgIEVudFNpemUg
ICAgICAgICAgRmxhZ3MgIExpbmsgIEluZm8gIEFsaWduCiAgWyAwXSAgICAgICAgICAgICAgICAg
ICBOVUxMICAgICAgICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgIDAwMDAwMDAwCiAgICAgICAwMDAw
MDAwMDAwMDAwMDAwICAwMDAwMDAwMDAwMDAwMDAwICAgICAgICAgICAwICAgICAwICAgICAwCiAg
WyAxXSAuaGFzaCAgICAgICAgICAgICBIQVNIICAgICAgICAgICAgIDAwMDAwMDAwMDAwMDAxMjAg
IDAwMDAwMTIwCiAgICAgICAwMDAwMDAwMDAwMDAwMDNjICAwMDAwMDAwMDAwMDAwMDA0ICAgQSAg
ICAgICAzICAgICAwICAgICA4CiAgWyAyXSAuZ251Lmhhc2ggICAgICAgICBHTlVfSEFTSCAgICAg
ICAgIDAwMDAwMDAwMDAwMDAxNjAgIDAwMDAwMTYwCiAgICAgICAwMDAwMDAwMDAwMDAwMDQ0ICAw
MDAwMDAwMDAwMDAwMDAwICAgQSAgICAgICAzICAgICAwICAgICA4CgpCdXQsIC0taGFzaC1zdHls
ZT1nbnUgY291bGQgc2F2ZSBzcGFjZToKU2VjdGlvbiBIZWFkZXJzOgogIFtOcl0gTmFtZSAgICAg
ICAgICAgICAgVHlwZSAgICAgICAgICAgICBBZGRyZXNzICAgICAgICAgICBPZmZzZXQKICAgICAg
IFNpemUgICAgICAgICAgICAgIEVudFNpemUgICAgICAgICAgRmxhZ3MgIExpbmsgIEluZm8gIEFs
aWduCiAgWyAwXSAgICAgICAgICAgICAgICAgICBOVUxMICAgICAgICAgICAgIDAwMDAwMDAwMDAw
MDAwMDAgIDAwMDAwMDAwCiAgICAgICAwMDAwMDAwMDAwMDAwMDAwICAwMDAwMDAwMDAwMDAwMDAw
ICAgICAgICAgICAwICAgICAwICAgICAwCiAgWyAxXSAuZ251Lmhhc2ggICAgICAgICBHTlVfSEFT
SCAgICAgICAgIDAwMDAwMDAwMDAwMDAxMjAgIDAwMDAwMTIwCiAgICAgICAwMDAwMDAwMDAwMDAw
MDQ0ICAwMDAwMDAwMDAwMDAwMDAwICAgQSAgICAgICAyICAgICAwICAgICA4CgoKSGVyZSBpcyBt
eSBHQ0MgVkVSU0lPTjoKVXNpbmcgYnVpbHQtaW4gc3BlY3MuCkNPTExFQ1RfR0NDPS9ydmhvbWUv
cmVuLmd1by9zb3VyY2UvdG9vbGNoYWluL3J2NjRscDY0L2Jpbi9yaXNjdjY0LXVua25vd24tbGlu
dXgtZ251LWdjYwpDT0xMRUNUX0xUT19XUkFQUEVSPS9ydmhvbWUvcmVuLmd1by9zb3VyY2UvdG9v
bGNoYWluL3J2NjRscDY0L2Jpbi8uLi9saWJleGVjL2djYy9yaXNjdjY0LXVua25vd24tbGludXgt
Z251LzEzLjIuMC9sdG8td3JhcHBlcgpUYXJnZXQ6IHJpc2N2NjQtdW5rbm93bi1saW51eC1nbnUK
Q29uZmlndXJlZCB3aXRoOgovaG9tZS9ydW5uZXIvd29yay9yaXNjdi1nbnUtdG9vbGNoYWluL3Jp
c2N2LWdudS10b29sY2hhaW4vZ2NjL2NvbmZpZ3VyZQotLXRhcmdldD1yaXNjdjY0LXVua25vd24t
bGludXgtZ251IC0tcHJlZml4PS9vcHQvcmlzY3YKLS13aXRoLXN5c3Jvb3Q9L29wdC9yaXNjdi9z
eXNyb290IC0td2l0aC1wa2d2ZXJzaW9uPQotLXdpdGgtc3lzdGVtLXpsaWIgLS1lbmFibGUtc2hh
cmVkIC0tZW5hYmxlLXRscwotLWVuYWJsZS1sYW5ndWFnZXM9YyxjKyssZm9ydHJhbiAtLWRpc2Fi
bGUtbGlibXVkZmxhcCAtLWRpc2FibGUtbGlic3NwCi0tZGlzYWJsZS1saWJxdWFkbWF0aCAtLWRp
c2FibGUtbGlic2FuaXRpemVyIC0tZGlzYWJsZS1ubHMKLS1kaXNhYmxlLWJvb3RzdHJhcCAtLXNy
Yz0uLi8uL2djYyAtLWRpc2FibGUtZGVmYXVsdC1waWUKLS1kaXNhYmxlLW11bHRpbGliIC0td2l0
aC1hYmk9bHA2NGQgLS13aXRoLWFyY2g9cnY2NGdjCi0td2l0aC10dW5lPXJvY2tldCAtLXdpdGgt
aXNhLXNwZWM9MjAxOTEyMTMgJ0NGTEFHU19GT1JfVEFSR0VUPS1PMgotbWNtb2RlbD1tZWRsb3cn
ICdDWFhGTEFHU19GT1JfVEFSR0VUPS1PMiAgICAtbWNtb2RlbD1tZWRsb3cnClRocmVhZCBtb2Rl
bDogcG9zaXgKU3VwcG9ydGVkIExUTyBjb21wcmVzc2lvbiBhbGdvcml0aG1zOiB6bGliCmdjYyB2
ZXJzaW9uIDEzLjIuMCAoKQoKU28sIGRvIHlvdSBtZWFuICItLWhhc2gtc3R5bGU9Z251Ij8KCj4g
PiAgIGNza3k6IHZEU086IFJlbW92ZSAtLWhhc2gtc3R5bGU9Ym90aAo+ID4gICBMb29uZ0FyY2g6
IHZEU086IFJlbW92ZSAtLWhhc2gtc3R5bGU9c3lzdgo+ID4KPiA+ICBhcmNoL2Nza3kva2VybmVs
L3Zkc28vTWFrZWZpbGUgIHwgMiArLQo+ID4gIGFyY2gvbG9vbmdhcmNoL3Zkc28vTWFrZWZpbGUg
ICAgfCAyICstCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSB8IDIgKy0KPiA+
ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4K
PiAtLQo+IFhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPgo+IFNjaG9vbCBvZiBBZXJvc3Bh
Y2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFuIFVuaXZlcnNpdHkKCgoKLS0gCkJlc3Qg
UmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
