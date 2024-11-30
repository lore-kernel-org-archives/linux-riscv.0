Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D425D735FF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nap5D9Jvhp9m2Ry16nmU0YfNVYwsN30s7idgMnOL8iw=; b=e3fqN0Q/Y2I1gD
	xzdoPOYTtB6doTXnOtBRuskMlAwiyRDZ/Vz2FJ4M1jV7K9d3u9MZJG+4/qds2j/ZHA8LLKcJZRBp3
	tuQvWxKPjqgaznqBzKd3GPY8Xu8Yjbxdc85d55DHG8gEynp0WPXfVjfCjLA9lKh/HP315q4ZaSwFm
	zIQmDC0aackvJE3jsZQrMvnZL/2yG1f/PO1QmCyHPPTewuwKzp5e3bFoGxZte8pcGgXV2hnmlUEAx
	/MqDkvUA+u0eHYq/TmTd5NbA5Px7aH95vWA149vtNrFTjc0SaWqEtQ9SjCZCAdMy51nOYIKSd7ExJ
	cMkrXFnE4weZ488EUyvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHMBS-00000001zlZ-3Ddo;
	Sat, 30 Nov 2024 12:02:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHMBQ-00000001zks-1mXZ
	for linux-riscv@lists.infradead.org;
	Sat, 30 Nov 2024 12:02:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11E21A40245
	for <linux-riscv@lists.infradead.org>; Sat, 30 Nov 2024 12:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D992C4CECC
	for <linux-riscv@lists.infradead.org>; Sat, 30 Nov 2024 12:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732968163;
	bh=GgGrVsRLF8fDG+0XdVVSFInWrE2wLo1WfnjdtdLWP5k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X8IISfEztJIUm2uQqPem03pS5E+CwTpxZuzuuFt86uI1vZWV2oiUueCx7N5OnIlG0
	 RtaYVJCpmixzkXqYdRqmnLz4ai5kM28bptgDfGdIbuvE7Ulxg+t5mUnuesQlZSA1wV
	 oCmRuhkl+lMVzVhWZ/scS+obwRuwycp3SqcH2WX7AFzYV2g7viDf1rOUjq3RXGupYF
	 GLoYMznBtl/ugn42G90MpFeSZjSPxn/BJTeMDL5oLDozGmNbCMOs5dIRicJ6DocNpw
	 828GXJ0/KQbAbVwzn6DdG2pee5Ah3bhd4zGMISkUlLw42kxDw8Z16kyxM9VdObj7op
	 pGa0U+bHPIqjw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9ec267b879so375301966b.2
        for <linux-riscv@lists.infradead.org>; Sat, 30 Nov 2024 04:02:43 -0800 (PST)
X-Gm-Message-State: AOJu0YzCEm0t4Jt27dqoM1qgUypIf0hGuoTnlVuQQL2rth6RToUo80pu
	bIxIVY0lHseKcWdOsXQs1YtCfEG5LrxC2vDIazH1G1xM0s2DQAuPmKvW93+qsUMw9VqIjRgg81P
	AYlIgYG/7zOJNAEBeCkZRQBqk7/0=
X-Google-Smtp-Source: AGHT+IElNoz63sGR/Pr4Z1XCmisV3hHaR8F2E8tfX0E8rj8MuwA54HL0IKQaN4Xo1LICAO/r1/m+rxVBZKe+e1HfcZk=
X-Received: by 2002:a17:907:7846:b0:aa5:2573:e38c with SMTP id
 a640c23a62f3a-aa580f178a6mr1069566666b.16.1732968161835; Sat, 30 Nov 2024
 04:02:41 -0800 (PST)
MIME-Version: 1.0
References: <20241130115355.3316160-1-guoren@kernel.org>
In-Reply-To: <20241130115355.3316160-1-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 30 Nov 2024 20:02:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQhfr-wsj2VZwwP7sWq=yp9HtT_kzzr68xh1VpKLSbybQ@mail.gmail.com>
Message-ID: <CAJF2gTQhfr-wsj2VZwwP7sWq=yp9HtT_kzzr68xh1VpKLSbybQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fixup boot failure when CONFIG_RT_MUTEXES=y
To: paul.walmsley@sifive.com, palmer@dabbelt.com, guoren@kernel.org, 
	bjorn@rivosinc.com, conor@kernel.org, leobras@redhat.com, 
	peterz@infradead.org, parri.andrea@gmail.com, will@kernel.org, 
	longman@redhat.com, boqun.feng@gmail.com, arnd@arndb.de, 
	alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_040244_589402_9813EFA5 
X-CRM114-Status: GOOD (  19.20  )
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

T24gU2F0LCBOb3YgMzAsIDIwMjQgYXQgNzo1NOKAr1BNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4KPiBXaGVu
IENPTkZJR19SVF9NVVRFWEVTPXksIG11dGV4X2xvY2stPnJ0X211dGV4X3RyeV9hY3F1aXJlIHdv
dWxkCkNvcnJlY3Q6IENPTkZJR19ERUJVR19SVF9NVVRFWEVTPXkKCj4gY2hhbmdlIGZyb20gcnRf
bXV0ZXhfY21weGNoZ19hY3F1aXJlIHRvIHJ0X211dGV4X3Nsb3d0cnlsb2NrKCk6Cj4gICAgICAg
ICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmxvY2stPndhaXRfbG9jaywgZmxhZ3MpOwo+ICAgICAg
ICAgcmV0ID0gX19ydF9tdXRleF9zbG93dHJ5bG9jayhsb2NrKTsKPiAgICAgICAgIHJhd19zcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZsb2NrLT53YWl0X2xvY2ssIGZsYWdzKTsKPgo+IEJlY2F1c2Ug
cXVldWVkX3NwaW5fI29wcyB0byB0aWNrZXRfI29wcyBpcyBjaGFuZ2VkIG9uZSBieSBvbmUgYnkK
PiBqdW1wX2xhYmVsLCByYXdfc3Bpbl9sb2NrL3VubG9jayB3b3VsZCBjYXVzZSBhIGRlYWRsb2Nr
IGR1cmluZyB0aGUKPiBjaGFuZ2luZy4KPgo+IFRoYXQgbWVhbnMgaW4gYXJjaC9yaXNjdi9rZXJu
ZWwvanVtcF9sYWJlbC5jOgo+IDEuCj4gYXJjaF9qdW1wX2xhYmVsX3RyYW5zZm9ybV9xdWV1ZSgp
IC0+Cj4gbXV0ZXhfbG9jaygmdGV4dF9tdXRleCk7ICstPiByYXdfc3Bpbl9sb2NrICAtPiBxdWV1
ZWRfc3Bpbl9sb2NrCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHwtPiByYXdfc3Bpbl91bmxv
Y2sgLT4gcXVldWVkX3NwaW5fdW5sb2NrCj4gcGF0Y2hfaW5zbl93cml0ZSAtPiBjaGFuZ2UgdGhl
IHJhd19zcGluX2xvY2sgdG8gdGlja2V0X2xvY2sKPiBtdXRleF91bmxvY2soJnRleHRfbXV0ZXgp
Owo+IC4uLgo+Cj4gMi4gLyogRGlydHkgdGhlIGxvY2sgdmFsdWUgKi8KPiBhcmNoX2p1bXBfbGFi
ZWxfdHJhbnNmb3JtX3F1ZXVlKCkgLT4KPiBtdXRleF9sb2NrKCZ0ZXh0X211dGV4KTsgKy0+IHJh
d19zcGluX2xvY2sgLT4gKnRpY2tldF9sb2NrKgo+ICAgICAgICAgICAgICAgICAgICAgICAgICB8
LT4gcmF3X3NwaW5fdW5sb2NrIC0+ICpxdWV1ZWRfc3Bpbl91bmxvY2sqCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAvKiBCVUc6IHRpY2tldF9sb2NrIHdpdGggcXVldWVkX3NwaW5fdW5sb2Nr
ICovCj4gcGF0Y2hfaW5zbl93cml0ZSAgLT4gIGNoYW5nZSB0aGUgcmF3X3NwaW5fdW5sb2NrIHRv
IHRpY2tldF91bmxvY2sKPiBtdXRleF91bmxvY2soJnRleHRfbXV0ZXgpOwo+IC4uLgo+Cj4gMy4g
LyogRGVhZCBsb2NrICovCj4gYXJjaF9qdW1wX2xhYmVsX3RyYW5zZm9ybV9xdWV1ZSgpIC0+Cj4g
bXV0ZXhfbG9jaygmdGV4dF9tdXRleCk7ICstPiByYXdfc3Bpbl9sb2NrIC0+IHRpY2tldF9sb2Nr
IC8qIGRlYWRsb2NrISAqLwo+ICAgICAgICAgICAgICAgICAgICAgICAgICB8LT4gcmF3X3NwaW5f
dW5sb2NrIC0+IHRpY2tldF91bmxvY2sKPiBwYXRjaF9pbnNuX3dyaXRlIC0+IGNoYW5nZSBvdGhl
ciByYXdfc3Bpbl8jb3AgLT4gdGlja2V0XyNvcAo+IG11dGV4X3VubG9jaygmdGV4dF9tdXRleCk7
Cj4KPiBTbywgdGhlIHNvbHV0aW9uIGlzIHRvIGRpc2FibGUgbXV0ZXggdXNhZ2Ugb2YKPiBhcmNo
X2p1bXBfbGFiZWxfdHJhbnNmb3JtX3F1ZXVlKCkgZHVyaW5nIGVhcmx5X2Jvb3RfaXJxc19kaXNh
YmxlZCwganVzdAo+IGxpa2Ugd2UgaGF2ZSBkb25lIGZvciBzdG9wX21hY2hpbmUuCj4KPiBSZXBv
cnRlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6
IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBHdW8g
UmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiBGaXhlczogYWI4MzY0N2ZhZGFlICgicmlzY3Y6IEFk
ZCBxc3BpbmxvY2sgc3VwcG9ydCIpCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvQ0FKRjJnVFF3WVRHaW5CbUNTZ1ZVb1B2MF9xNEVQdF8rV2l5ZlVBMUhWaUFLZ1V6
eEFnQG1haWwuZ21haWwuY29tL1QvI21mNDg4ZTYzNDc4MTdmY2EwM2JiOTNhN2QzNGRmMzNkODYx
NWIzNzc1Cj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4gQ2M6IEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNj
di9rZXJuZWwvanVtcF9sYWJlbC5jIHwgMTIgKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvanVtcF9sYWJlbC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvanVtcF9sYWJlbC5j
Cj4gaW5kZXggNmVlZTZmNzM2ZjY4Li42NTRlZDE1OWM4MzAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvanVtcF9sYWJlbC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvanVtcF9s
YWJlbC5jCj4gQEAgLTM2LDkgKzM2LDE1IEBAIGJvb2wgYXJjaF9qdW1wX2xhYmVsX3RyYW5zZm9y
bV9xdWV1ZShzdHJ1Y3QganVtcF9lbnRyeSAqZW50cnksCj4gICAgICAgICAgICAgICAgIGluc24g
PSBSSVNDVl9JTlNOX05PUDsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgbXV0ZXhfbG9jaygmdGV4
dF9tdXRleCk7Cj4gLSAgICAgICBwYXRjaF9pbnNuX3dyaXRlKGFkZHIsICZpbnNuLCBzaXplb2Yo
aW5zbikpOwo+IC0gICAgICAgbXV0ZXhfdW5sb2NrKCZ0ZXh0X211dGV4KTsKPiArICAgICAgIGlm
IChlYXJseV9ib290X2lycXNfZGlzYWJsZWQpIHsKPiArICAgICAgICAgICAgICAgcmlzY3ZfcGF0
Y2hfaW5fc3RvcF9tYWNoaW5lID0gMTsKPiArICAgICAgICAgICAgICAgcGF0Y2hfaW5zbl93cml0
ZShhZGRyLCAmaW5zbiwgc2l6ZW9mKGluc24pKTsKPiArICAgICAgICAgICAgICAgcmlzY3ZfcGF0
Y2hfaW5fc3RvcF9tYWNoaW5lID0gMDsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAg
ICAgIG11dGV4X2xvY2soJnRleHRfbXV0ZXgpOwo+ICsgICAgICAgICAgICAgICBwYXRjaF9pbnNu
X3dyaXRlKGFkZHIsICZpbnNuLCBzaXplb2YoaW5zbikpOwo+ICsgICAgICAgICAgICAgICBtdXRl
eF91bmxvY2soJnRleHRfbXV0ZXgpOwo+ICsgICAgICAgfQo+Cj4gICAgICAgICByZXR1cm4gdHJ1
ZTsKPiAgfQo+IC0tCj4gMi40MC4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
