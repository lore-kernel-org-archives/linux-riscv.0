Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEDBC46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 02:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Cyl2Nf4HikcygxQnuybkbSwGrtg+DYaOxBJLfGwBgE=; b=fqCIoCUkp76OZX
	eBvvgOxkZtQTaqKw1O6q2lDVefhhpUAXCoXCdSE4gLyUOurUSdW+HeYWPyOUSWuIrrJMWrh9UmLfw
	M6NgHK8rwvK6Q66EYt8GTCB9U2O9sKw/1Qn5CT7irgmBkoSPXhGGVO+Q9bLctcQmCRlV6+Pi6ph8k
	6vdUaVEnzW6zMtOKAf3SEExUyp5pxZqsh3UPBxwcuNkjHFOQEZnVjMqp+FPtFd9IUhrgBcbPEyKZ/
	orpGUIdgM4FRTVMOKChclUrWRkBqXWjMX9KVsdQCb0N8E7e3twcZvj6N25y+MMzXYBwk9FUPjGH3A
	ZbSwGL6srsBqVufdBzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGs8J-007DaC-1F;
	Sat, 23 Dec 2023 02:52:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGs8G-007DZK-28
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 02:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 43D2561CFF
	for <linux-riscv@lists.infradead.org>; Sat, 23 Dec 2023 02:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5ECC433A9
	for <linux-riscv@lists.infradead.org>; Sat, 23 Dec 2023 02:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703299969;
	bh=rGnjRsJeeEvv71gmE5cTVsYlTCyd72dN5f4IXTVEfoM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LQh3OKkE3rSV4uLpymgW+d9EI1/XuHbmbyO5rf2XHRh3VnMJVKXJAuYM/ivMIYzNc
	 JL5l5ff2zFR+Lf4CapDVYEOTxKLdqIQ+IHBXps0d+MqCX+J6ui6MOOF46emXCNsyu5
	 yz+dxshxQH/QZA8i+crBkslhoAq2sO4qC4jnMQizE/cbpCSbb8FE2sDRcSX7q7fwE9
	 1mrOcIisJGojcOZGwXp20SxrYS4aIVRaWGARLU936nzIjuVEpQ+gj+1/Hf/v93o2nJ
	 /xEQ5L0uazoDBerVoAx42w+A4J1uZcM2odFsVNvjXSvvk55d2yAv206pWwOzRANLlx
	 3LlM2zHW5RqsQ==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a22deb95d21so298119066b.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 18:52:49 -0800 (PST)
X-Gm-Message-State: AOJu0YyXDPHZJPEOTkfftKiKa53pYu4eosw1kWVgYQ8QvFY+Lr07LScO
	zVvB++aKCN4lmcvAfDMev8iiIhJL52HHG5OGmos=
X-Google-Smtp-Source: AGHT+IEA3F1ZH6akb6TqgOv4EwDv+FR0JNU+GRUyUtR0om3BzEz50XDimZiwdW0XxmY19KszQQcTqA43lyTSe7B6tjc=
X-Received: by 2002:a17:906:25d:b0:a26:98ff:6464 with SMTP id
 29-20020a170906025d00b00a2698ff6464mr1182977ejl.17.1703299967812; Fri, 22 Dec
 2023 18:52:47 -0800 (PST)
MIME-Version: 1.0
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-5-guoren@kernel.org>
 <ZYUZ8QUJxCL93Fgv@LeoBras> <CAJF2gTTX7AjexoRUw=ZS34HEWno7H3zvnXA+Q7TYsztNU=k2cg@mail.gmail.com>
 <e3f1521a9f04463587d07d0c99534d5a@AcuMS.aculab.com>
In-Reply-To: <e3f1521a9f04463587d07d0c99534d5a@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 23 Dec 2023 10:52:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRD827Fbs_2FxBP=Z8yudfAAqG6dA+a9eq74RMOz2WDnw@mail.gmail.com>
Message-ID: <CAJF2gTRD827Fbs_2FxBP=Z8yudfAAqG6dA+a9eq74RMOz2WDnw@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] riscv: mm: Optimize TASK_SIZE definition
To: David Laight <David.Laight@aculab.com>
Cc: Leonardo Bras <leobras@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"alexghiti@rivosinc.com" <alexghiti@rivosinc.com>, "charlie@rivosinc.com" <charlie@rivosinc.com>, 
	"xiao.w.wang@intel.com" <xiao.w.wang@intel.com>, "david@redhat.com" <david@redhat.com>, 
	"panqinglin2020@iscas.ac.cn" <panqinglin2020@iscas.ac.cn>, 
	"rick.p.edgecombe@intel.com" <rick.p.edgecombe@intel.com>, "willy@infradead.org" <willy@infradead.org>, 
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>, 
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>, "cleger@rivosinc.com" <cleger@rivosinc.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_185256_784999_6D611D76 
X-CRM114-Status: GOOD (  12.65  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgNzo1MuKAr1BNIERhdmlkIExhaWdodCA8RGF2aWQuTGFp
Z2h0QGFjdWxhYi5jb20+IHdyb3RlOgo+Cj4gRnJvbTogR3VvIFJlbgo+ID4gU2VudDogMjIgRGVj
ZW1iZXIgMjAyMyAxMToyNQo+IC4uLgo+ID4gPiA+ICsjZGVmaW5lIFRBU0tfU0laRSAgICAoaXNf
Y29tcGF0X3Rhc2soKSA/IFwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgIFRBU0tfU0la
RV8zMiA6IFRBU0tfU0laRV82NCkKPiA+IEkgd291bGQgcmVtb3ZlIGlzX2NvbXBhdF90YXNrKCkg
aW4gdGhlIG5leHQgdmVyc2lvbiBiZWNhdXNlIHlvdXIgcGF0Y2gKPiA+IGNvbnRhaW5zIHRoYXQu
Cj4KPiBEb2VzIFRBU0tfU0laRSBnZXQgdXNlZCBpbiBhY2Nlc3Nfb2soKSA/Cj4gSWYgc28gdGhl
IHJlcGVhdGVkIGV4cGFuc2lvbiBvZiB0aGF0ICdtZXNzJyB3aWxsIHNsb3cgdGhpbmdzIGRvd24u
Cj4KPiBPVE9IIGFjY2Vzc19vayhwdHIsIGxlbikgY2FuIGp1c3QgY2hlY2sgKHB0ciB8IChwdHIg
KyBsZW4pKSA8IDApCj4gYW5kIHJlbHkgb24gdGhlIHBhZ2UgZmF1bHRzIGZvciBldmVyeXRoaW5n
IGVsc2UuCk9yIGRvIHlvdSB3YW50IHRvIGRpc2N1c3MgdGhlIGJhZCBzaWRlIGVmZmVjdCBvZiBp
c19jb21wYXRfdGFzaygpPwoKWWVzLCB0ZXN0X3RocmVhZF9mbGFnKFRJRl8zMkJJVCkgd291bGQg
c2xvdyBkb3duIGFjY2Vzc19vaygpLiBCdXQgaWYKd2UgdXNlIFRBU0tfU0laRV9NQVgsIFZBX0JJ
VFMgc3RpbGwgbmVlZHMgcGd0YWJsZV9sNV9lbmFibGVkLApwZ3RhYmxlX2w0X2VuYWJsZWQgZGV0
ZWN0YXRpb24gZm9yIHJpc2N2LgoKSXQncyBub3Qgb25seSBmb3IgY29tcGF0IG1vZGUsIGJ1dCBh
bHNvIFN2MzksIFN2NDgsIFN2NTcuIEFsbCB0cmVhdApUQVNLX1NJWkVfTUFYIGFzIDB4ODAwMDAw
MDAwMDAwMDAwMCwgcmlnaHQ/IFRoZW46CmFjY2Vzc19vayhwdHIsIGxlbikgY2FuIGp1c3QgY2hl
Y2sgKHB0ciB8IChwdHIgKyBsZW4pKSA8IDApCgpJdCdzIGFub3RoZXIgZmVhdHVyZSBhbmQgZG9l
cyBub3QgcmVsYXRlIHRvIGNvbXBhdCBtb2RlLgoKPgo+ICAgICAgICAgRGF2aWQKPgo+IC0KPiBS
ZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWls
dG9uIEtleW5lcywgTUsxIDFQVCwgVUsKPiBSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVz
KQoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
