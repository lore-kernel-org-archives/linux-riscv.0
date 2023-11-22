Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE98C61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwd/fg5tuDpcbXsb3DdziTzHPeg/JyhH8jMFfxpkOqI=; b=XZy1g85jhgPDLn
	1+hwjb/92duOztngimCCJsxDW4OJ/NmgyoOf8PWR+lzQZGqw+IriUA9pFEXataTDJHYtHVNZkB2zQ
	USfy2DQXGIu4tRBZUZGislNBMh/LlU5u8esywZGAv+dhNguFU+jtftMzblmN1KEgaYUrOiLaSGF7k
	jOraW5PbTuY95Gs4r8obcDwwoS8ZAhOqa0+Bb25iYYl/AnDXdqmk6dIUwhVa5mNWGN/XyhRozAiZ5
	JKvkTk0bjf0DP2VwZeXlZ/r49YumudpxigmiQXtFY5vBG5vhJ3K7dcLMfWUt7NHgOEYSr4CpoBj/P
	qEKBhdEGiKB++Ko5T/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5joG-001IL8-0g;
	Wed, 22 Nov 2023 09:46:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jnk-001Hnr-0L
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 Nov 2023 09:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hEK1gvF+0yh3uLtMdCKIrrASVh3jVfs8UswMA/3tWPg=; b=CZzgqasQpZ+AqP8pfOB1IRnrCm
	XjHCgAOObC2auDNcFe4WAA60HAT3lKWR/IyD94pMHwDCeczEt7PLlISdjxX52MMZyMnU00kesIc9i
	gJ5l0RV2Kkpx0jlfZng2+YzR3dqMsq71vBWxi1HJOnD+9daxTiV5nZbZ/7vlEyqT2kjdtfErm8gtr
	+hm8wZJNu8plWt8596Tz5U6ttgy0UCUGavDSoyLID/PhjtT26ndhGMaH+e4H0bbl6BoUo3Vv0Ii+x
	+V+nDq8nugtUcELpryL6EatQTDPy5v/O/7lzd7tG5by2XwIvPmSzxqBjtm4hTHW3IZAVdasuA0Jt0
	i7DF77Qg==;
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jng-00CGMG-15
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 09:45:42 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-4afe5fc8ad7so1441173e0c.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 01:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700646330; x=1701251130; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEK1gvF+0yh3uLtMdCKIrrASVh3jVfs8UswMA/3tWPg=;
        b=mAqSVHgBYivungUbhaxnrUXLjfQgOVp52pwiF64thnxZb3dX5JmNR0HLlMYqMYMF3p
         bGmZHcbBIbIU4RS9CNQfBfho2kpHwnCXgCqkvYuAttySuUCTIeKmdqg4jm7lTjiMbABu
         RYw8u5bejswYdWkI2zI0I0Yi45gt3YmBFhatS6eRPO6WzLrWJ71vLxqRfDiD5jtz9AHk
         /cEEhhaUpsRMErUUhduu2Mf0foQf3TT2AsDSHf/zHPS14ShyFiMrQ4w03H73+aMD8tTE
         iTMiwEaotej4Eg4Rc4YiQgN5oDNWxavl05uYyI52iOUM/sfjhakFvoxvbqSwvGYCYdvK
         7dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646330; x=1701251130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEK1gvF+0yh3uLtMdCKIrrASVh3jVfs8UswMA/3tWPg=;
        b=Hbav7yTepxNIF3nSQFbUQEnVXy93M/yRbQ7Lqr0JjIZtYwAgl3sazUG/eB5sgkMZaL
         mlRmwtWvSkxQxC9D8chNJfWtmkVE7VvQxLkVKfACUfcH7vvCwcVMahaIErQLybqnEpJN
         98bFV4mlwFyfN4xrGBflDT2lVwhr2umzc/G1lfmDfZSLpVogP/mzrKBk407fjHlg9L3G
         0WQNRFhhSVPLPAw6jwK6IsiBZH5l7a1x20bTT0KJrqcO+c8KqM9qYH43nPh5g1hIxJQu
         cSkU7+A4njzIS+DvvLdC0ySFofr6AnQM34cjmH9JE3O/KaCx0UnTcrbyDp1fUiGHbOW+
         NqYg==
X-Gm-Message-State: AOJu0Yw5nPqO+cjWc4EoAq1Jo3YlIIGXlX8h/cQTfEjg2VcK9ew4PWdz
	kZ7/KWPvUscrBA6u+uBB1zqpzL88RUkI2GnL7fs=
X-Google-Smtp-Source: AGHT+IFuf/d1ZCRCDNio7oftxa5nhopfxwxef1qnN4viMv59EQXSl+3nZ5RhzAtZMJE+ygoRdNNAhgb2QVY7IeZndVU=
X-Received: by 2002:a1f:ec81:0:b0:49d:9916:5740 with SMTP id
 k123-20020a1fec81000000b0049d99165740mr1905727vkh.9.1700646330398; Wed, 22
 Nov 2023 01:45:30 -0800 (PST)
MIME-Version: 1.0
References: <20231121202459.36874-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXozB7PVOZM+SQa9D6Zca3x_+LE63RhmBGPDvmOma1fUA@mail.gmail.com>
In-Reply-To: <CAMuHMdXozB7PVOZM+SQa9D6Zca3x_+LE63RhmBGPDvmOma1fUA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 22 Nov 2023 09:44:50 +0000
Message-ID: <CA+V-a8tfN8goMf=sc2t6dovBsGmFbioWt7cdbOca8QHJF=EP_w@mail.gmail.com>
Subject: Re: [PATCH] riscv: errata: andes: Probe IOCP during boot stage
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Yu Chien Peter Lin <peterlin@andestech.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_094540_541685_7FDFECA0 
X-CRM114-Status: GOOD (  23.06  )
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBXZWQsIE5vdiAyMiwgMjAy
MyBhdCA4OjIz4oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4g
d3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4KPiBPbiBUdWUsIE5vdiAyMSwgMjAyMyBhdCA5OjI1
4oCvUE0gUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBG
cm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5j
b20+Cj4gPgo+ID4gV2Ugc2hvdWxkIGJlIHByb2JpbmcgZm9yIElPQ1AgZHVyaW5nIGJvb3Qgc3Rh
Z2Ugb25seS4gQXMgd2Ugd2VyZSBwcm9iaW5nCj4gPiBmb3IgSU9DUCBmb3IgYWxsIHRoZSBzdGFn
ZXMgdGhpcyBjYXVzZWQgdGhlIGJlbG93IGlzc3VlIGR1cmluZyBtb2R1bGUtaW5pdAo+ID4gc3Rh
Z2UsCj4gPgo+ID4gWzkuMDE5MTA0XSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVx
dWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgZmZmZmZmZmY4MTAwZDNhMAo+ID4gWzkuMDI3MTUzXSBP
b3BzIFsjMV0KPiA+IFs5LjAyOTQyMV0gTW9kdWxlcyBsaW5rZWQgaW46IHJjYXJfY2FuZmQgcmVu
ZXNhc191c2JocyBpMmNfcmlpYyBjYW5fZGV2IHNwaV9yc3BpIGkyY19jb3JlCj4gPiBbOS4wMzc2
ODZdIENQVTogMCBQSUQ6IDkwIENvbW06IHVkZXZkIE5vdCB0YWludGVkIDYuNy4wLXJjMSsgIzU3
Cj4gPiBbOS4wNDM3NTZdIEhhcmR3YXJlIG5hbWU6IFJlbmVzYXMgU01BUkMgRVZLIGJhc2VkIG9u
IHI5YTA3ZzA0M2YwMSAoRFQpCj4gPiBbOS4wNTAzMzldIGVwYyA6IHJpc2N2X25vbmNvaGVyZW50
X3N1cHBvcnRlZCsweDEwLzB4M2UKPiA+IFs5LjA1NTU1OF0gIHJhIDogYW5kZXNfZXJyYXRhX3Bh
dGNoX2Z1bmMrMHg0YS8weDUyCj4gPiBbOS4wNjA0MThdIGVwYyA6IGZmZmZmZmZmODAwMGQ4YzIg
cmEgOiBmZmZmZmZmZjgwMDBkOTVjIHNwIDogZmZmZmZmYzgwMDNhYmIwMAo+ID4gWzkuMDY3NjA3
XSAgZ3AgOiBmZmZmZmZmZjgxNGUyNWEwIHRwIDogZmZmZmZmZDgwMzYxZTU0MCB0MCA6IDAwMDAw
MDAwMDAwMDAwMDAKPiA+IFs5LjA3NDc5NV0gIHQxIDogMDAwMDAwMDAwOTAwMDMxZSB0MiA6IDAw
MDAwMDAwMDAwMDAwMDEgczAgOiBmZmZmZmZjODAwM2FiYjIwCj4gPiBbOS4wODE5ODRdICBzMSA6
IGZmZmZmZmZmMDE1YjU3YzcgYTAgOiAwMDAwMDAwMDAwMDAwMDAwIGExIDogMDAwMDAwMDAwMDAw
MDAwMQo+ID4gWzkuMDg5MTcyXSAgYTIgOiAwMDAwMDAwMDAwMDAwMDAwIGEzIDogMDAwMDAwMDAw
MDAwMDAwMCBhNCA6IGZmZmZmZmZmODEwMGQ4YmUKPiA+IFs5LjA5NjM2MF0gIGE1IDogMDAwMDAw
MDAwMDAwMDAwMSBhNiA6IDAwMDAwMDAwMDAwMDAwMDEgYTcgOiAwMDAwMDAwMDA5MDAwMzFlCj4g
PiBbOS4xMDM1NDhdICBzMiA6IGZmZmZmZmZmMDE1YjU3ZDcgczMgOiAwMDAwMDAwMDAwMDAwMDAx
IHM0IDogMDAwMDAwMDAwMDAwMDMxZQo+ID4gWzkuMTEwNzM2XSAgczUgOiA4MDAwMDAwMDAwMDA4
YTQ1IHM2IDogMDAwMDAwMDAwMDAwMDUwMCBzNyA6IDAwMDAwMDAwMDAwMDAwM2YKPiA+IFs5LjEx
NzkyNF0gIHM4IDogZmZmZmZmYzgwMDNhYmQ0OCBzOSA6IGZmZmZmZmZmMDE1YjExNDAgczEwOiBm
ZmZmZmZmZjgxNTFhMWIwCj4gPiBbOS4xMjUxMTNdICBzMTE6IGZmZmZmZmZmMDE1YjEwMDAgdDMg
OiAwMDAwMDAwMDAwMDAwMDAxIHQ0IDogZmVmZWZlZmVmZWZlZmVmZgo+ID4gWzkuMTMyMzAxXSAg
dDUgOiBmZmZmZmZmZjAxNWI1N2M3IHQ2IDogZmZmZmZmZDhiNjNhNjAwMAo+ID4gWzkuMTM3NTg3
XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMjAgYmFkYWRkcjogZmZmZmZmZmY4MTAwZDNhMCBjYXVz
ZTogMDAwMDAwMDAwMDAwMDAwZgo+ID4gWzkuMTQ1NDY4XSBbPGZmZmZmZmZmODAwMGQ4YzI+XSBy
aXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQrMHgxMC8weDNlCj4gPiBbOS4xNTE5NzJdIFs8ZmZm
ZmZmZmY4MDAwMjdlOD5dIF9hcHBseV9hbHRlcm5hdGl2ZXMrMHg4NC8weDg2Cj4gPiBbOS4xNTc3
ODRdIFs8ZmZmZmZmZmY4MDAwMjliZT5dIGFwcGx5X21vZHVsZV9hbHRlcm5hdGl2ZXMrMHgxMC8w
eDFhCj4gPiBbOS4xNjQxMTNdIFs8ZmZmZmZmZmY4MDAwOGZjYz5dIG1vZHVsZV9maW5hbGl6ZSsw
eDVlLzB4N2EKPiA+IFs5LjE2OTU4M10gWzxmZmZmZmZmZjgwMDg1Y2Q2Pl0gbG9hZF9tb2R1bGUr
MHhmZDgvMHgxNzljCj4gPiBbOS4xNzQ5NjVdIFs8ZmZmZmZmZmY4MDA4NjYzMD5dIGluaXRfbW9k
dWxlX2Zyb21fZmlsZSsweDc2LzB4YWEKPiA+IFs5LjE4MDk0OF0gWzxmZmZmZmZmZjgwMDg2N2Y2
Pl0gX19yaXNjdl9zeXNfZmluaXRfbW9kdWxlKzB4MTc2LzB4MmE4Cj4gPiBbOS4xODczNjVdIFs8
ZmZmZmZmZmY4MDg4OTg2Mj5dIGRvX3RyYXBfZWNhbGxfdSsweGJlLzB4MTMwCj4gPiBbOS4xOTI5
MjJdIFs8ZmZmZmZmZmY4MDg5MjBiYz5dIHJldF9mcm9tX2V4Y2VwdGlvbisweDAvMHg2NAo+ID4g
WzkuMTk4NTczXSBDb2RlOiAwMDA5IGI3ZTkgNjc5NyAwMTRkIGE3ODMgODVhNyBjNzk5IDQ3ODUg
MDcxNyAwMTAwICgwMTIzKSBhZWY3Cj4gPiBbOS4yMDU5OTRdIC0tLVsgZW5kIHRyYWNlIDAwMDAw
MDAwMDAwMDAwMDAgXS0tLQo+ID4KPiA+IFRoaXMgaXMgYmVjYXVzZSB3ZSBjYWxsZWQgcmlzY3Zf
bm9uY29oZXJlbnRfc3VwcG9ydGVkKCkgZm9yIGFsbCB0aGUgc3RhZ2VzCj4gPiBkdXJpbmcgSU9D
UCBwcm9iZS4gcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKCkgZnVuY3Rpb24gc2V0cwo+ID4g
bm9uY29oZXJlbnRfc3VwcG9ydGVkIHZhcmlhYmxlIHRvIHRydWUgd2hpY2ggaGFzIGFuIGFubm90
YXRpb24gc2V0IHRvCj4gPiAiX19yb19hZnRlcl9pbml0IiBkdWUgdG8gd2hpY2ggd2Ugd2VyZSBz
ZWVpbmcgdGhlIGFib3ZlIHNwbGF0LiBGaXggdGhpcyBieQo+ID4gcHJvYmluZyBJT0NQIGR1cmlu
ZyBib290IHN0YWdlIG9ubHkuCj4gPgo+ID4gRml4ZXM6IGUwMjFhZTdmNTE0NSAoInJpc2N2OiBl
cnJhdGE6IEFkZCBBbmRlcyBhbHRlcm5hdGl2ZSBwb3J0cyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBM
YWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4K
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4KPiA+IC0tLSBhL2FyY2gvcmlzY3YvZXJyYXRhL2Fu
ZGVzL2VycmF0YS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJhdGEuYwo+
ID4gQEAgLTYwLDcgKzYwLDggQEAgdm9pZCBfX2luaXRfb3JfbW9kdWxlIGFuZGVzX2VycmF0YV9w
YXRjaF9mdW5jKHN0cnVjdCBhbHRfZW50cnkgKmJlZ2luLCBzdHJ1Y3QgYWwKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyY2hp
ZCwgdW5zaWduZWQgbG9uZyBpbXBpZCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc3RhZ2UpCj4gPiAgewo+ID4gLSAgICAgICBl
cnJhdGFfcHJvYmVfaW9jcChzdGFnZSwgYXJjaGlkLCBpbXBpZCk7Cj4gPiArICAgICAgIGlmIChz
dGFnZSA9PSBSSVNDVl9BTFRFUk5BVElWRVNfQk9PVCkKPiA+ICsgICAgICAgICAgICAgICBlcnJh
dGFfcHJvYmVfaW9jcChzdGFnZSwgYXJjaGlkLCBpbXBpZCk7Cj4gPgo+ID4gICAgICAgICAvKiB3
ZSBoYXZlIG5vdGhpbmcgdG8gcGF0Y2ggaGVyZSBBVE0gc28ganVzdCByZXR1cm4gYmFjayAqLwo+
ID4gIH0KPgo+IEkgYmVsaWV2ZSB0aGlzIHN0aWxsIGNhdXNlcyBlcnJhdGFfcHJvYmVfaW9jcCgp
IHRvIGJlIGNhbGxlZCB0d2ljZToKPiBvbmNlIGZyb20gYXBwbHlfYm9vdF9hbHRlcm5hdGl2ZXMo
KSwgYW5kIGEgc2Vjb25kIHRpbWUgKGlmIENPTkZJR19NTVU9eSkKPiBmcm9tIGFwcGx5X3Zkc29f
YWx0ZXJuYXRpdmVzKCkuICBJcyB0aGF0IE9LPwo+CkhtbSBkdXJpbmcgbXkgdGVzdGluZyBJIGRp
ZG50IHNlZSB0aGlzIGJlaW5nIGNhbGxlZCB0d2ljZSAobWF5YmUKYmVjYXVzZSBhbHRlcm5hdGl2
ZSBzZWN0aW9uIHdhcyBub3QgZm91bmQpIGluCmFwcGx5X3Zkc29fYWx0ZXJuYXRpdmVzKCkuCgo+
IFBlcmhhcHMgaW5zdGVhZCB5b3Ugd2FudCB0byBhZGQgYSBjaGVjayB0byBlcnJhdGFfcHJvYmVf
aW9jcCgpIChhZnRlcgo+IHRoZSBjaGVjayBmb3IgQ09ORklHX0VSUkFUQV9BTkRFU19DTU8pLCB0
byBiYWlsIG91dCBpZiB0aGUgZnVuY3Rpb24KPiB3YXMgY2FsbGVkIGJlZm9yZT8KPgpPSyBzbyBJ
J2xsIGhhdmUgYSBzdGF0aWMgdmFyaWFibGUgKCJyaXNjdl9ub25jb2hlcmVudF9zZXQiKSBpbgpl
cnJhdGFfcHJvYmVfaW9jcCgpIGFuZCBpZiBpdCdzIGJlaW5nIHNldCBJJ2xsIGJhaWwgb3V0IGVh
cmx5LgoKQ2hlZXJzLApQcmFiaGFrYXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
