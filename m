Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE14C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 13:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvNlSquoP8BJXCNnXhlxE2+BAuJAVtLkrAUA2iAxXi4=; b=JWoV2olsDk7BWH
	6l3J6rfiqqIl+dLG0ADoXYekqqvAb0Wqs2tSXhhx1DsnQnSMA43GKdiW/tvBHn87UO5QxW29ercWW
	XD7LeeqnJD/yC/c7sbmQq53K79HymG9vtZ2gKEDOD6VAiLpnID7UZRjMSQlKc4oAE7vgfXjsBCJNd
	LlYHD8uaccwDeu9QGBDvMaJVQYrxC/itTlTLjgObYCT3H26vuJaNz+GE3ZScgNCMBdBw2fT9Fr7/p
	cWRy0FVufw9sPsBDDrisyy5ujdHWDCsM5Vie8lBCRXRxSewYmeHF58ZP8dF2A1z0Ajlmou1Q8giq+
	xbXCJNqm8Az9HAf5nuXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrK9-00ELPU-1e; Wed, 23 Feb 2022 13:04:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMqyd-00EDw3-9D; Wed, 23 Feb 2022 12:42:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BCAFC61330;
 Wed, 23 Feb 2022 12:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33795C340F5;
 Wed, 23 Feb 2022 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645620158;
 bh=vfHK+gkNDrAvQXi1VtrHdfwiLvh+3euoD4Z2MIR/0m0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O/3TthIL4XfWE4YBU4n+//W2s9Oow3MOp0B72JrNSWI9KdK60Fxzenp1OHUXkcfNg
 wQ7nSn9LwIWUM+G3FYGfPJNfyAsXufq6P/hrN4O65dMg+sODhN+Eq+xESdDU6kkZPn
 KGWyOsXBMn0QXs3d1k/784mt2AhszZ2hGQ24pD0l+ywIQ8PdW3Lv6NpsT3QhFcby8J
 IgUqm/pVBKu3CC3PrhVeIq9ZhkFShwNCPKjC2XoyoUGEOvbYj6krNNEmELypMGKImn
 A7z8e4rFe7arHT49oeRXRQiNaNFWqRLSlQSuF6qDCG+RKV0Sg8fWcV0Xrgo04qcTyl
 ivzYRC93uGpoA==
Received: by mail-vk1-f182.google.com with SMTP id k15so12099962vkn.13;
 Wed, 23 Feb 2022 04:42:38 -0800 (PST)
X-Gm-Message-State: AOAM533AReM4Q2K48hIpoAJFAK+rw5quPqtCuhombyiHQ5RmijtVRgS6
 wCgVmSs+yYKmRRT1yPe+DDskwhuWKgR/9pRi+pY=
X-Google-Smtp-Source: ABdhPJwiS2/TnUZj6eqhOkeNucJDlHqkwMwsfsk+suYlfmqT0vHvdSP7AQRVGgao7f8HjSLljPJQRV0WirIw6+DTixk=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr1166442vkf.35.1645620157156; Wed, 23 Feb
 2022 04:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-18-guoren@kernel.org>
 <4379941.LvFx2qVVIh@eto.sf-tec.de>
In-Reply-To: <4379941.LvFx2qVVIh@eto.sf-tec.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 23 Feb 2022 20:42:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRcfvd6Sin=3Dv91WZO6DxLsUsB=ap+F1WehKb6=w5fkA@mail.gmail.com>
Message-ID: <CAJF2gTRcfvd6Sin=3Dv91WZO6DxLsUsB=ap+F1WehKb6=w5fkA@mail.gmail.com>
Subject: Re: [PATCH V5 17/21] riscv: compat: vdso: Add setup additional pages
 implementation
To: Rolf Eike Beer <eb@emlix.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_044239_456198_A4E5474D 
X-CRM114-Status: GOOD (  15.19  )
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

T24gV2VkLCBGZWIgMjMsIDIwMjIgYXQgODoxOSBQTSBSb2xmIEVpa2UgQmVlciA8ZWJAZW1saXgu
Y29tPiB3cm90ZToKPgo+ID4gQEAgLTY2LDM1ICs2OCwzNSBAQCBzdGF0aWMgaW50IHZkc29fbXJl
bWFwKGNvbnN0IHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcKPiA+ICpzbSwgcmV0dXJuIDA7Cj4g
PiAgfQo+ID4KPiA+IC1zdGF0aWMgaW50IF9faW5pdCBfX3Zkc29faW5pdCh2b2lkKQo+ID4gK3N0
YXRpYyBpbnQgX19pbml0IF9fdmRzb19pbml0KHN0cnVjdCBfX3Zkc29faW5mbyAqdmRzb19pbmZv
KQo+ID4gIHsKPiA+ICAgICAgIHVuc2lnbmVkIGludCBpOwo+ID4gICAgICAgc3RydWN0IHBhZ2Ug
Kip2ZHNvX3BhZ2VsaXN0Owo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBwZm47Cj4gPgo+ID4gLSAg
ICAgaWYgKG1lbWNtcCh2ZHNvX2luZm8udmRzb19jb2RlX3N0YXJ0LCAiXDE3N0VMRiIsIDQpKSB7
Cj4gPiArICAgICBpZiAobWVtY21wKHZkc29faW5mby0+dmRzb19jb2RlX3N0YXJ0LCAiXDE3N0VM
RiIsIDQpKSB7Cj4gPiAgICAgICAgICAgICAgIHByX2VycigidkRTTyBpcyBub3QgYSB2YWxpZCBF
TEYgb2JqZWN0IVxuIik7Cj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gICAg
ICAgfQo+ID4KPgo+IERvZXMgYW55b25lIGFjdHVhbGx5IGd1YXJhbnRlZSB0aGF0IHRoaXMgaXMg
YXQgbGVhc3QgdGhpcyA0IGJ5dGVzIGxvbmc/CgpZb3UgY2FuIHJlZjoKYXJjaC9hcm02NC9rZXJu
ZWwvdmRzby5jCmFyY2gvYXJtL2tlcm5lbC92ZHNvLmMKYXJjaC9uZHMzMi9rZXJuZWwvdmRzby5j
CgphbmQgaW4gYXJjaC9wb3dlcnBjL2Jvb3QvZWxmLmg6CmFyY2gvcG93ZXJwYy9rZXJuZWwvZmFk
dW1wLmM6ICAgbWVtY3B5KGVsZi0+ZV9pZGVudCwgRUxGTUFHLCBTRUxGTUFHKTsKYXJjaC9wb3dl
cnBjL2Jvb3QvZWxmLmg6I2RlZmluZSBFTEZNQUcwICAgICAgICAgMHg3ZiAgICAvKiBFSV9NQUcg
Ki8KYXJjaC9wb3dlcnBjL2Jvb3QvZWxmLmg6I2RlZmluZSBFTEZNQUcxICAgICAgICAgJ0UnCmFy
Y2gvcG93ZXJwYy9ib290L2VsZi5oOiNkZWZpbmUgRUxGTUFHMiAgICAgICAgICdMJwphcmNoL3Bv
d2VycGMvYm9vdC9lbGYuaDojZGVmaW5lIEVMRk1BRzMgICAgICAgICAnRicKYXJjaC9wb3dlcnBj
L2Jvb3QvZWxmLmg6I2RlZmluZSBFTEZNQUcgICAgICAgICAgIlwxNzdFTEYiCmFyY2gvcG93ZXJw
Yy9ib290L2VsZi5oOiNkZWZpbmUgU0VMRk1BRyAgICAgICAgIDQKCgo+Cj4gRWlrZQo+IC0tCj4g
Um9sZiBFaWtlIEJlZXIsIGVtbGl4IEdtYkgsIGh0dHBzOi8vd3d3LmVtbGl4LmNvbQo+IEZvbiAr
NDkgNTUxIDMwNjY0LTAsIEZheCArNDkgNTUxIDMwNjY0LTExCj4gR290aGFlciBQbGF0eiAzLCAz
NzA4MyBHw7Z0dGluZ2VuLCBHZXJtYW55Cj4gU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBHw7Z0dGlu
Z2VuLCBBbXRzZ2VyaWNodCBHw7Z0dGluZ2VuIEhSIEIgMzE2MAo+IEdlc2Now6RmdHNmw7xocnVu
ZzogSGVpa2UgSm9yZGFuLCBEci4gVXdlIEtyYWNrZSDigJMgVXN0LUlkTnIuOiBERSAyMDUgMTk4
IDA1NQo+Cj4gZW1saXggLSBzbWFydCBlbWJlZGRlZCBvcGVuIHNvdXJjZQoKCgotLSAKQmVzdCBS
ZWdhcmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3NreS8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
