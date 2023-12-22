Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2294BC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 11:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MiwKNV+UU4OjLO7ifOyS9vSTmY7YqRAMy0ucOB4K5Jg=; b=nYtqAklOKLns2C
	j4iFrUnguwnsYFCST4XRtq5IjJVuIOhS31JDfQ4Pvr/G4vHMTdmzDybS1eKIguJsNFBzktGmjl1Tk
	BuRWzfELY25tIZ9WSr7Pszcc0zkPFAbxYNzL9cymZw6u1KtDCgR0iMHi5OZ4ZFB3L2AltshcEmfik
	E0obuSaQ38F/kLVgMgattE8W7pWhG0m5bZGelODncZDkl6oWV1b0r9CREb4f0t7DgxR/T/LI4q5tc
	RntQbKXtJOmMnTB+ao6ZkZoe5eiG6rAh323KyG4xs6R2rO/PGue9WNWLoLOsa19IJBeHFEfo8nvk9
	12ot7wwNvkpveQgDJB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGder-005fd4-12;
	Fri, 22 Dec 2023 11:25:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGden-005fb4-2D
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 11:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D80CCCE217E
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 11:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DDAC433C7
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 11:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703244330;
	bh=fHYii6xXiPmGhLTNNk4Nv4pE45XCV3c4HwqYoSgnecs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LMcUbWVbm4K7JZSvGhS0H4phPHmuFuQ4+eZm+vCFCwsJI04394W/GY5nkhrZnzuNC
	 78ey/b+EcgE8ElFkDbBFgoRH/PgLKygpaz5P2WBJ67n2o0MhU0odkHNE+Vzpor1GoB
	 VZAMPETMM4gvkg3TkrdsWLadzYm9+Wvoro2NyPUJ0/VVkkhQtvyDOhnezaIB9v/OtM
	 LJEscFs8JJCYn2VB5Yd9W8NO6mpsFqmXXy0hJlHUJcKRSPsusKoGNzK13dW2OGhSVn
	 th5XIvu+1ZtexMVFy/UqmZzvabkY+zpaSg3A4UELtOllInPqSfDpQa/d1BVbjYRyZa
	 Xrex71JcSXa7A==
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso21185685e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 03:25:30 -0800 (PST)
X-Gm-Message-State: AOJu0Yx4kKxnQSFhclQnwvjL01Yp1Q4YO9Cp64KEjdwSQsJE3GRiKJU8
	ms/3OL03BASvZvtnqrjFDh3pd+ELxiEips/2Mb0=
X-Google-Smtp-Source: AGHT+IGmmJD9R1aPfi+R41Wym7ooeb+AvNkOO/8LfjdPnuAdavPQkfFIDGqGU6mn+snPt+0EyuVPVzKCMQho9M1cd5U=
X-Received: by 2002:a05:600c:1f82:b0:40c:708b:cf52 with SMTP id
 je2-20020a05600c1f8200b0040c708bcf52mr611856wmb.122.1703244328590; Fri, 22
 Dec 2023 03:25:28 -0800 (PST)
MIME-Version: 1.0
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-5-guoren@kernel.org>
 <ZYUZ8QUJxCL93Fgv@LeoBras>
In-Reply-To: <ZYUZ8QUJxCL93Fgv@LeoBras>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 19:25:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTX7AjexoRUw=ZS34HEWno7H3zvnXA+Q7TYsztNU=k2cg@mail.gmail.com>
Message-ID: <CAJF2gTTX7AjexoRUw=ZS34HEWno7H3zvnXA+Q7TYsztNU=k2cg@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] riscv: mm: Optimize TASK_SIZE definition
To: Leonardo Bras <leobras@redhat.com>
Cc: linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	alexghiti@rivosinc.com, charlie@rivosinc.com, xiao.w.wang@intel.com, 
	david@redhat.com, panqinglin2020@iscas.ac.cn, rick.p.edgecombe@intel.com, 
	willy@infradead.org, bjorn@rivosinc.com, conor.dooley@microchip.com, 
	cleger@rivosinc.com, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_032534_181937_B1AF2654 
X-CRM114-Status: GOOD (  19.04  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTowOeKAr1BNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIERlYyAyMSwgMjAyMyBhdCAxMDo0NzowMUFN
IC0wNTAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206IEd1byBSZW4gPGd1b3Jl
bkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBVbmlmeSB0aGUgVEFTS19TSVpFIGRlZmluaXRp
b24gd2l0aCBWQV9CSVRTIGZvciBiZXR0ZXIgcmVhZGFiaWxpdHkuCj4gPiBBZGQgQ09NUEFUIG1v
ZGUgdXNlciBhZGRyZXNzIHNwYWNlIGluZm8gaW4gdGhlIGNvbW1lbnQuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gU2lnbmVkLW9m
Zi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDcgKysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmgKPiA+IGluZGV4IGU0MTU1ODIyNzZlYy4uZDE2NWRkYWUzYjQyIDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiBAQCAtODY2LDYgKzg2Niw3IEBAIHN0YXRpYyBpbmxp
bmUgcHRlX3QgcHRlX3N3cF9jbGVhcl9leGNsdXNpdmUocHRlX3QgcHRlKQo+ID4gICAqIE5vdGUg
dGhhdCBQR0RJUl9TSVpFIG11c3QgZXZlbmx5IGRpdmlkZSBUQVNLX1NJWkUuCj4gPiAgICogVGFz
ayBzaXplIGlzOgo+ID4gICAqIC0gICAgICAgIDB4OWZjMDAwMDAgICAgICAgKH4yLjVHQikgZm9y
IFJWMzIuCj4gPiArICogLSAgICAgICAgMHg4MDAwMDAwMCAgICAgICAoICAgMkdCKSBmb3IgUlY2
NCBjb21wYXQgbW9kZQo+ID4gICAqIC0gICAgICAweDQwMDAwMDAwMDAgICAgICAgKCAyNTZHQikg
Zm9yIFJWNjQgdXNpbmcgU1YzOSBtbXUKPiA+ICAgKiAtICAgIDB4ODAwMDAwMDAwMDAwICAgICAg
ICggMTI4VEIpIGZvciBSVjY0IHVzaW5nIFNWNDggbW11Cj4gPiAgICogLSAweDEwMDAwMDAwMDAw
MDAwMCAgICAgICAoICA2NFBCKSBmb3IgUlY2NCB1c2luZyBTVjU3IG1tdQo+ID4gQEAgLTg3Nywx
MSArODc4LDExIEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX3N3cF9jbGVhcl9leGNsdXNpdmUo
cHRlX3QgcHRlKQo+ID4gICAqIFNpbWlsYXJseSBmb3IgU1Y1NywgYml0cyA2M+KAkzU3IG11c3Qg
YmUgZXF1YWwgdG8gYml0IDU2Lgo+ID4gICAqLwo+ID4gICNpZmRlZiBDT05GSUdfNjRCSVQKPiA+
IC0jZGVmaW5lIFRBU0tfU0laRV82NCAoUEdESVJfU0laRSAqIFBUUlNfUEVSX1BHRCAvIDIpCj4g
PiArI2RlZmluZSBUQVNLX1NJWkVfNjQgKFVMKDEpIDw8IChWQV9CSVRTIC0gMSkpCj4KPiBDaGVj
a2VkIGZvciBsNSwgbDQgYW5kIGwzLCBhbmQgaXQgc2VlbXMgYSBjb3JyZWN0IHJlcGxhY2VtZW50
Lgo+Cj4gPgo+ID4gICNpZmRlZiBDT05GSUdfQ09NUEFUCj4gPiAtI2RlZmluZSBUQVNLX1NJWkVf
MzIgKF9BQygweDgwMDAwMDAwLCBVTCkpCj4gPiAtI2RlZmluZSBUQVNLX1NJWkUgICAgKHRlc3Rf
dGhyZWFkX2ZsYWcoVElGXzMyQklUKSA/IFwKPiA+ICsjZGVmaW5lIFRBU0tfU0laRV8zMiAoVUwo
MSkgPDwgKFZBX0JJVFNfU1YzMiAtIDEpKQo+Cj4gT2gsIG11Y2ggYmV0dGVyLiBUaGFua3MgZm9y
IHJlbW92aW5nIHRoZSBtYWdpYyBudW1iZXIgOikKPgo+ID4gKyNkZWZpbmUgVEFTS19TSVpFICAg
IChpc19jb21wYXRfdGFzaygpID8gXAo+ID4gICAgICAgICAgICAgICAgICAgICAgICBUQVNLX1NJ
WkVfMzIgOiBUQVNLX1NJWkVfNjQpCkkgd291bGQgcmVtb3ZlIGlzX2NvbXBhdF90YXNrKCkgaW4g
dGhlIG5leHQgdmVyc2lvbiBiZWNhdXNlIHlvdXIgcGF0Y2gKY29udGFpbnMgdGhhdC4KCj4gPiAg
I2Vsc2UKPiA+ICAjZGVmaW5lIFRBU0tfU0laRSAgICBUQVNLX1NJWkVfNjQKPiA+IC0tCj4gPiAy
LjQwLjEKPiA+Cj4KPiBUaGF0J3MgbXVjaCBtb3JlIHJlYWRhYmxlIElNTyBub3cuIFRoYW5rcyEK
Pgo+IEZXSVc6Cj4gUmV2aWV3ZWQtYnk6IExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNv
bT4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
