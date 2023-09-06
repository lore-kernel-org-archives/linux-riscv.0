Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146E0EB8FBB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 12:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqPoJN8unItvuguq9IlfwytRo4SpvTIsxXRG7RFZ454=; b=GkkUIMRg3XVlKz
	XTK4D+lZqEyAal5DPux16QDo9CwAmk6DmiseXAyT3ZYIQHlKPLtcbvorX2IXSXl5QHXvihMAGg4V4
	XvoLFEuqyY1xfGyay73+QqXdMPb8PATPPzohEcfgn5UuPSUT2f75rvvCDu8hPDV+PdR9E4w0SRvLK
	TdYDjE+bjSGmlu5UJuGixpTwa6C991gB2rXUp45p7RMCgRG0fdqv4lCEJ5abyU4xPoA15Uki3bt+J
	OAp0cL/xpnPvlvJDhPe6O8KhxWBXozPQfNAXSEhwmGEhHMPosZOJJIG92DGq1Z/wXuSBTn/lISBdW
	ECAUvd2D2MF87BzF5rAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrt7-009aR3-1T;
	Wed, 06 Sep 2023 12:44:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrt4-009aK5-17
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 12:44:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31aec0a1a8bso614780f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 05:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694004237; x=1694609037; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97T82DaWND1ic3tMqCxU8VDEgFQSQlyfp7fMNRtDH0U=;
        b=KUhsTE+ISD0Mt2coqBJ36DKh+LpZiSA/dvvtrn5qCi7mEUyne64I1Peec4eA2Jzfk8
         EmFqAiCsPet33a92vuauied4g2JIM6/PVvBUDO5CBt4k5oqZNQIB/vG4WWBRb5rf6Mla
         tOdeRQwPaHdYIacgy/astKCL/lyz/p9JoaMICEIZKw2l1dNct4RqwupXT2yUOp862wHV
         Ldsle8z5TFB9m/8+RXrW1jxDXSbim6W6g5f3iWqvsg9Au9KjJ61NaaySxW2W6TxoeMqA
         gTH5Tbpdr8fB8yCGW+ZHji29xUClvOAhvMCywpYYbFJ9paOX8ErEnV0fphSDcH3+zlVC
         6p8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004237; x=1694609037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97T82DaWND1ic3tMqCxU8VDEgFQSQlyfp7fMNRtDH0U=;
        b=c55R2u70Kgxy+PSFWW/0mzLxV9mJsGAYlm4HmRaeb2X0IswU6HHaRpoCOor+MUB+qY
         nM8P11X95x/nP/Iyn5mypHH8tc2evht5wJ22+waNTL4/wtb5HpGXRx5webgIEBm+0Jzw
         fXUUiRiLfCR6oqMz0T+9OTNUitNkUvWtAJjSUvCd0lAmQ8xDYcXsHpT991nMN+LYTgoi
         iDD3WE+DHEhRhGh7lxXsPBJ61mrDiGESnv9JfugDwyhoRgCQ86PZ/ezsg/t8vjI3rd7x
         cqWfjC2n0sNeQnLyolV15xOuJYTlUn7EGlc0l1z9Ul3ea9zBTyZUU7Yroa1yhw1HAHa/
         zzJw==
X-Gm-Message-State: AOJu0Yzb6o/MzX3G9LnYLDtnly1NKHyd7T67HVF8dXZjtWPnkOziK6wz
	w2LtVN/1AjwQYfbfsilGvhJOIJqTgCWqJvkJDOFG2Q==
X-Google-Smtp-Source: AGHT+IE5EzPlYpM04M+Q/aJihvrqk89xvt00ppxx1QLaRQWeDL07/bJeynyeRYAenM4+M4c30V7uH8C5wCvl72MrsjQ=
X-Received: by 2002:a05:6000:5c9:b0:30f:c1fa:7901 with SMTP id
 bh9-20020a05600005c900b0030fc1fa7901mr2582820wrb.5.1694004237054; Wed, 06 Sep
 2023 05:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
 <20230801085402.1168351-5-alexghiti@rivosinc.com> <CA+V-a8t56xDqMTQfoKcsvPF8errkTMydaDz5V6nejLvVfJrW3g@mail.gmail.com>
 <CAHVXubiENHt36LrcSBoNU0rAMQ8EoT6tde9M8vLP3Hw2nwMm8g@mail.gmail.com>
 <CA+V-a8vJJFCKy3pCL2Qp1NogL-K5s9moGDbv3tTvx+z1FeKarw@mail.gmail.com>
 <CAHVXubhLB9Pw51C1ed1Youp9k0qTJKrokUAqf=Xnr+m3BoN5=g@mail.gmail.com> <CA+V-a8s0i=VMSbMa6WvOiZpqe_idAhq4cZ0inSdCNy39-rQeAg@mail.gmail.com>
In-Reply-To: <CA+V-a8s0i=VMSbMa6WvOiZpqe_idAhq4cZ0inSdCNy39-rQeAg@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 6 Sep 2023 14:43:46 +0200
Message-ID: <CAHVXubjgjAwMOi0J5zZJkuX8RKwgfKp-_=tVTLDvKN=tBBdxNQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv: Improve flush_tlb_kernel_range()
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_054402_397434_BF7BB92C 
X-CRM114-Status: GOOD (  34.76  )
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

T24gV2VkLCBTZXAgNiwgMjAyMyBhdCAyOjI04oCvUE0gTGFkLCBQcmFiaGFrYXIKPHByYWJoYWth
ci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEFsZXhhbmRyZSwKPgo+IE9uIFdlZCwg
U2VwIDYsIDIwMjMgYXQgMToxOOKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9z
aW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBTZXAgNiwgMjAyMyBhdCAyOjA54oCvUE0g
TGFkLCBQcmFiaGFrYXIKPiA+IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IEhpIEFsZXhhbmRyZSwKPiA+ID4KPiA+ID4gT24gV2VkLCBTZXAgNiwgMjAyMyBh
dCAxOjAx4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90
ZToKPiA+ID4gPgo+ID4gPiA+IEhpIFByYWJoYWthciwKPiA+ID4gPgo+ID4gPiA+IE9uIFdlZCwg
U2VwIDYsIDIwMjMgYXQgMTo0OeKAr1BNIExhZCwgUHJhYmhha2FyCj4gPiA+ID4gPHByYWJoYWth
ci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBIaSBBbGV4YW5k
cmUsCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVHVlLCBBdWcgMSwgMjAyMyBhdCA5OjU44oCvQU0g
QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gVGhpcyBmdW5jdGlvbiB1c2VkIHRvIHNpbXBseSBmbHVzaCB0aGUgd2hv
bGUgdGxiIG9mIGFsbCBoYXJ0cywgYmUgbW9yZQo+ID4gPiA+ID4gPiBzdWJ0aWxlIGFuZCB0cnkg
dG8gb25seSBmbHVzaCB0aGUgcmFuZ2UuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoZSBwcm9i
bGVtIGlzIHRoYXQgd2UgY2FuIG9ubHkgdXNlIFBBR0VfU0laRSBhcyBzdHJpZGUgc2luY2Ugd2Ug
ZG9uJ3Qga25vdwo+ID4gPiA+ID4gPiB0aGUgc2l6ZSBvZiB0aGUgdW5kZXJseWluZyBtYXBwaW5n
IGFuZCB0aGVuIHRoaXMgZnVuY3Rpb24gd2lsbCBiZSBpbXByb3ZlZAo+ID4gPiA+ID4gPiBvbmx5
IGlmIHRoZSBzaXplIG9mIHRoZSByZWdpb24gdG8gZmx1c2ggaXMgPCB0aHJlc2hvbGQgKiBQQUdF
X1NJWkUuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBH
aGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IEFu
ZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+ID4gPiA+IC0tLQo+ID4g
PiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIHwgMTEgKysrKystLS0t
LQo+ID4gPiA+ID4gPiAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAgICAgIHwgMzQgKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAzMSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiA+ID4gPiA+ID4KPiA+ID4gPiA+
IEFmdGVyIGFwcGx5aW5nIHRoaXMgcGF0Y2gsIEkgYW0gc2VlaW5nIG1vZHVsZSBsb2FkIGlzc3Vl
cyBvbiBSWi9GaXZlCj4gPiA+ID4gPiAoY29tcGxldGUgbG9nIFswXSkuIEkgYW0gdGVzdGluZyBk
ZWZjb25maWcgKyBbMV0gKHJ6L2ZpdmUgcmVsYXRlZAo+ID4gPiA+ID4gY29uZmlncykuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gQW55IHBvaW50ZXJzIG9uIHdoYXQgY291bGQgYmUgYW4gaXNzdWUgaGVy
ZT8KPiA+ID4gPgo+ID4gPiA+IENhbiB5b3UgZ2l2ZSBtZSB0aGUgZXhhY3QgdmVyc2lvbiBvZiB0
aGUga2VybmVsIHlvdSB1c2U/IFRoZSB0cmFwCj4gPiA+ID4gYWRkcmVzc2VzIGFyZSB2bWFsbG9j
IGFkZHJlc3NlcywgYW5kIGEgZml4IGZvciB0aG9zZSBsYW5kZWQgdmVyeSBsYXRlCj4gPiA+ID4g
aW4gdGhlIHJlbGVhc2UgY3ljbGUuCj4gPiA+ID4KPiA+ID4gSSBhbSB1c2luZyBuZXh0LTIwMjMw
OTA2LCBJdmUgcHVzaGVkIGEgYnJhbmNoIFsxXSBmb3IgeW91IHRvIGhhdmUgYSBsb29rLgo+ID4g
Pgo+ID4gPiBbMF0gaHR0cHM6Ly9naXRodWIuY29tL3ByYWJoYWthcmxhZC9saW51eC90cmVlL3J6
Zml2ZS1kZWJ1Zwo+ID4KPiA+IEdyZWF0LCB0aGFua3MsIEkgaGFkIHRvIGdldCByaWQgb2YgdGhp
cyBwb3NzaWJpbGl0eSA6KQo+ID4KPiA+IEFzLWlzLCBJIGhhdmUgbm8gaWRlYSwgY2FuIHlvdSB0
cnkgdG8gImJpc2VjdCIgdGhlIHByb2JsZW0/IEkgbWVhbgo+ID4gd2hpY2ggcGF0Y2ggaW4gdGhl
IHNlcmllcyBsZWFkcyB0byB0aG9zZSB0cmFwcz8KPiA+Cj4gT29wcyBzb3JyeSBmb3Igbm90IG1l
bnRpb25pbmcgZWFybGllciwgdGhpcyBpcyB0aGUgb2ZmZW5kaW5nIHBhdGNoCj4gd2hpY2ggbGVh
ZHMgdG8gdGhlIGlzc3VlcyBzZWVuIG9uIHJ6L2ZpdmUuCgpPaywgc28gYXQgbGVhc3QgSSBmb3Vu
ZCB0aGUgZm9sbG93aW5nIHByb2JsZW0sIGJ1dCBJIGRvbid0IHNlZSBob3cKdGhhdCBjb3VsZCBm
aXggeW91ciBpc3N1ZTogY2FuIHlvdSBnaXZlIGEgdHJ5IGFueXdheT8gSSBrZWVwIGxvb2tpbmcK
aW50byB0aGlzLCB0aGFua3MKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMg
Yi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKaW5kZXggZGYyYTA4MzhjM2ExLi5iNTY5MmJjNmM3
NmEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYworKysgYi9hcmNoL3Jpc2N2
L21tL3RsYmZsdXNoLmMKQEAgLTIzOSw3ICsyMzksNyBAQCB2b2lkIGZsdXNoX3RsYl9yYW5nZShz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKdW5zaWduZWQgbG9uZyBzdGFydCwKCiB2b2lkIGZs
dXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBl
bmQpCiB7Ci0gICAgICAgX19mbHVzaF90bGJfcmFuZ2UoTlVMTCwgc3RhcnQsIGVuZCwgUEFHRV9T
SVpFKTsKKyAgICAgICBfX2ZsdXNoX3RsYl9yYW5nZShOVUxMLCBzdGFydCwgZW5kIC0gc3RhcnQs
IFBBR0VfU0laRSk7CiB9CgogI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQoKPgo+
IENoZWVycywKPiBQcmFiaGFrYXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
