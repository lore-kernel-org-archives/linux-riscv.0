Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FBFC3DA63
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 14:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZDvjL5leevLvSEKnPxSzDvlkIkoRUHSRPKA1kJEWOo=; b=qLKEiQN+/eiazh
	3/EKL7uIgvWe03p4N3p+1IY+F44ry+5IsuTEHmA5xAG9386qyxq5QroPcDQVsdLAZrIswQgU8MKiS
	QrgDLbpqj8Kg2JvrPpo5Qh/z7mFJcqj9iClAYZDin6ssRtGKvW7nRth9m4x/5shgrgYCqQPUPJT5T
	MkOwswWU7x61oQrYcmGyf4lTpnAdKS4Tsf1GYLdTMODjERMvObaR2Hh/pxbnftlnNFRrNruSi0rzP
	CNLTG1wi6DllDJ9U/kZ4Y0mNm6lxG1WxDWACg00lkWfzhxG3nfLiMCEyNVmKnAHxpPyzIsiA8lPDI
	Bz3cauriopLmjJJ75hfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWdQ7-0000000FhQb-1Fq6;
	Wed, 24 Jul 2024 14:56:47 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWdPg-0000000FhMH-2gcK;
	Wed, 24 Jul 2024 14:56:22 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52ed9b802ceso7016489e87.3;
        Wed, 24 Jul 2024 07:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721832978; x=1722437778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+VhvI5u25K1G3SguH2FXDNPUbfkufH9rbAjCZBWkOc=;
        b=AOqnCcZNUNy5SaceSxYjSrQ/1u1BbvMlrh+0fE3TpcWwQziaFG77kKG9/AhK9LW7s2
         +5xAIfwYGEb0r2LyD78KL+vRx/c3be+dhPR7b5YnjtwIW3D1FoWeUlZkdRcV/uFZh6ru
         Jh5Ucl9KlF8qFRXnPoEGkTOpsyVimxyPRd8jqJaBTcVzvrGM7epdQmib8ovAx8c8Anef
         9deUyfJy+vHgQi/TSg/5p2xZJrFecUNho8H+cAj9c7A4Z3IhFWbwSoaMeHCgHVNlS/2F
         /mQzzTgt5BrCg+3o9y/BJ3Vq9531Soy61ZBEHpuaNdvPuyt+3srCL/+oGy7RYU0KVVVg
         A5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721832978; x=1722437778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+VhvI5u25K1G3SguH2FXDNPUbfkufH9rbAjCZBWkOc=;
        b=kC3JK7ryPp1FHduGPP3p43+k1hSersWFuaBwccNYLQ3i2owRSmYAY4lBfnOuHYAE9/
         49wi6t4G+bUBLoSLz6tMCNkgZR7eyO4KCC81dnZJF0oUwaNM8cUT7plcmUoV2d9wypT9
         0tToIahLdmkJkBdJ6FdewfF9h0rcopOLEvzurD9vNgSrn1FqbvS39IdsmaAY3z8KzA7F
         6UCEEUqQyWDCMn1GcSZyppXGOV2fBASW4+Q5jqR1KTz9GFkEvjLZ37lSwJuUfE7yRrz7
         B0PgQKHqkQHKZy6s4Ja+ENXpwPFU6+jhd7BVSWKiQf11a4GL8HK4FxMe4fqKkM7BWREm
         0FNA==
X-Forwarded-Encrypted: i=1; AJvYcCVgDmkHl9KMH+i2nd4iwXzUJnPnif9CTLYXiiJC6wUGyNvVGbn7FLTIwO9lscvmTjuPnrqQA7SgQP14dQ84K8KPzLdDf2yMtYIdjhHe6Ln5DPtgXZrBExaVCD+REdkRa8VQ7VrMWmq7FcprMQTXeI5G9uMqjRg=
X-Gm-Message-State: AOJu0YyoqmHktDlj2fCW3WnAFKY8Abi9IoWbZ/A5g8mPiWGDf8rh09yo
	TmaW9e+ruwSMYXaDI9QxG/WK1yuFHa6nIKpnj4MMIZcmN5PCFTsQt2uJeMGtoLuSPeStmUQvYWy
	/T5U+cZe17BHvtE5nxbq5UloULMM=
X-Google-Smtp-Source: AGHT+IEyt9/jKgY9GG2CTk2DQKwL+zQsHX8gmCjTh3r6yrd9E+GdYPop3MLBHAvwRY0udPYlhm2AykNPFdpZ5YxlgWA=
X-Received: by 2002:a05:6512:1114:b0:52e:91ff:4709 with SMTP id
 2adb3069b0e04-52efb63f078mr9627053e87.21.1721832976976; Wed, 24 Jul 2024
 07:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718268003.git.haibo1.xu@intel.com> <mhng-e0773c11-559a-4f64-a1ad-4a234993ccfc@palmer-ri-x1c9>
In-Reply-To: <mhng-e0773c11-559a-4f64-a1ad-4a234993ccfc@palmer-ri-x1c9>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 24 Jul 2024 22:56:05 +0800
Message-ID: <CAJve8omqqpLLPz7QEuC1s+jai9YeisTKgeTMZfRnAN+=WdhhbA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add ACPI NUMA support for RISC-V
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_075620_707654_03431DCB 
X-CRM114-Status: GOOD (  27.56  )
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
Cc: alison.schofield@intel.com, jszhang@kernel.org, rafael@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Jonathan.Cameron@huawei.com, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, zong.li@sifive.com, kernel@xen0n.name, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, dave.jiang@intel.com, haibo1.xu@intel.com, bhe@redhat.com, Marc Zyngier <maz@kernel.org>, chenhuacai@kernel.org, linux-riscv@lists.infradead.org, rrichter@amd.com, linux-acpi@vger.kernel.org, samitolvanen@google.com, dan.j.williams@intel.com, lenb@kernel.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, Charlie Jenkins <charlie@rivosinc.com>, chenjiahao16@huawei.com, ytcoode@gmail.com, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, cleger@rivosinc.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, Greg KH <gregkh@linuxfoundation.org>, rmk+kernel@armlinux.org.uk, samuel.holland@sifive.com, Evan Green <evan@rivosinc.com>, james.morse@arm.com, andy.chiu@sifive.com, akpm@linux-foundation.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMjQsIDIwMjQgYXQgMTA6NTDigK9QTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgMTMgSnVuIDIwMjQgMDE6NTQ6MzIgUERU
ICgtMDcwMCksIGhhaWJvMS54dUBpbnRlbC5jb20gd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIHNlcmll
cyBlbmFibGUgUklTQy1WIEFDUEkgTlVNQSBzdXBwb3J0IHdoaWNoIHdhcyBiYXNlZCBvbgo+ID4g
dGhlIHJlY2VudGx5IGFwcHJvdmVkIEFDUEkgRUNSWzFdLgo+ID4KPiA+IFBhdGNoIDEvNCBhZGQg
UklTQy1WIHNwZWNpZmljIGFjcGlfbnVtYS5jIGZpbGUgdG8gcGFyc2UgTlVNQSBpbmZvcm1hdGlv
bgo+ID4gZnJvbSBTUkFUIGFuZCBTTElUIEFDUEkgdGFibGVzLgo+ID4gUGF0Y2ggMi80IGFkZCB0
aGUgY29tbW9uIFNSQVQgUklOVEMgYWZmaW5pdHkgc3RydWN0dXJlIGhhbmRsZXIuCj4gPiBQYXRj
aCAzLzQgY2hhbmdlIHRoZSBBQ1BJX05VTUEgdG8gYSBoaWRkZW4gb3B0aW9uIHNpbmNlIGl0IHdv
dWxkIGJlIHNlbGVjdGVkCj4gPiBieSBkZWZhdWx0IG9uIGFsbCBzdXBwb3J0ZWQgcGxhdGZvcm0u
Cj4gPiBQYXRjaCA0LzQgcmVwbGFjZSBwcl9pbmZvIHdpdGggcHJfZGVidWcgaW4gYXJjaF9hY3Bp
X251bWFfaW5pdCgpIHRvIGF2b2lkCj4gPiBwb3RlbnRpYWwgYm9vdCBub2lzZSBvbiBBQ1BJIHBs
YXRmb3JtcyB0aGF0IGFyZSBub3QgTlVNQS4KPiA+Cj4gPiBCYXNlZC1vbjogaHR0cHM6Ly9naXRo
dWIuY29tL2xpbnV4LXJpc2N2L2xpbnV4LXJpc2N2L3RyZWUvZm9yLW5leHQKPgo+IE5vIGJpZyBk
ZWFsLCBidXQgdGhhdCdzIG5vdCBhY3R1YWxseSBteSByZXBvLiAgTG9va3MgbGlrZSBpdCdzIGp1
c3QKPiBtaXJyb3Jpbmcgc29tZXRoaW5nLCBJIHVzZSB0aGUga2VybmVsLm9yZyBnaXQgc3R1ZmYg
dGhlc2UgZGF5cy4gIEkKPiBkcm9wcGVkIGl0IGZyb20gdGhlIGNvdmVyIGxldHRlciBmb3IgdGhl
IG1lcmdlLCBpdCdzIG5vdCBzdXBlciB1c2VmdWwKPiBhbnl3YXkgYmVjYXVzZSBpdCdzIGEgYnJh
bmNoIHNvIG5vYm9keSB3aWxsIGtub3cgd2hhdCBpdCBtZWFucyBsYXRlci4KPgo+IEFzaWRlIGZy
b20gdGhhdCB0aGluZ3MgbG9vayBnb29kLCBJJ3ZlIGdvdCB0aGlzIHF1ZXVlZCB1cCBmb3IgdGhl
Cj4gdGVzdGVyLgo+CgpUaGFua3MhCgo+ID4KPiA+IFsxXSBodHRwczovL2RyaXZlLmdvb2dsZS5j
b20vZmlsZS9kLzFZVGREeDJJUG01SWVaakFXOTMyRVlVLXRVdGdTMDh0WC92aWV3P3VzcD1zaGFy
aW5nCj4gPgo+ID4gVGVzdGluZzoKPiA+IFNpbmNlIHRoZSBBQ1BJIEFJQS9QTElDIHN1cHBvcnQg
cGF0Y2ggc2V0IGlzIHN0aWxsIHVuZGVyIHVwc3RyZWFtIHJldmlldywKPiA+IGhlbmNlIGl0IGlz
IHRlc3RlZCB1c2luZyB0aGUgcG9sbCBiYXNlZCBIVkMgU0JJIGNvbnNvbGUgYW5kIFJBTSBkaXNr
Lgo+ID4gMSkgQnVpbGQgbGF0ZXN0IFFlbXUgd2l0aCB0aGUgZm9sbG93aW5nIHBhdGNoIGJhY2tw
b3J0ZWQKPiA+ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS92bHN1bmlsL3FlbXUvY29tbWl0LzQyYmQ0
ZWVlZmQ1ZDQ0MTBhNjhmMDJkNTRmZWU0MDZkOGExMjY5YjAKPiA+Cj4gPiAyKSBCdWlsZCBsYXRl
c3QgRURLLUlJCj4gPiAgICBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvYmxvYi9t
YXN0ZXIvT3ZtZlBrZy9SaXNjVlZpcnQvUkVBRE1FLm1kCj4gPgo+ID4gMykgQnVpbGQgTGludXgg
d2l0aCB0aGUgZm9sbG93aW5nIGNvbmZpZ3MgZW5hYmxlZAo+ID4gICAgQ09ORklHX1JJU0NWX1NC
SV9WMDE9eQo+ID4gICAgQ09ORklHX1NFUklBTF9FQVJMWUNPTl9SSVNDVl9TQkk9eQo+ID4gICAg
Q09ORklHX05PTlBPUlRBQkxFPXkKPiA+ICAgIENPTkZJR19IVkNfUklTQ1ZfU0JJPXkKPiA+ICAg
IENPTkZJR19OVU1BPXkKPiA+ICAgIENPTkZJR19BQ1BJX05VTUE9eQo+ID4KPiA+IDQpIEJ1aWxk
IGJ1aWxkcm9vdCByb290ZnMuY3Bpbwo+ID4KPiA+IDUpIExhdW5jaCB0aGUgUWVtdSBtYWNoaW5l
Cj4gPiAgICBxZW11LXN5c3RlbS1yaXNjdjY0IC1ub2dyYXBoaWMgXAo+ID4gICAgLW1hY2hpbmUg
dmlydCxwZmxhc2gwPXBmbGFzaDAscGZsYXNoMT1wZmxhc2gxIC1zbXAgNCAtbSA4RyBcCj4gPiAg
ICAtYmxvY2tkZXYgbm9kZS1uYW1lPXBmbGFzaDAsZHJpdmVyPWZpbGUscmVhZC1vbmx5PW9uLGZp
bGVuYW1lPVJJU0NWX1ZJUlRfQ09ERS5mZCBcCj4gPiAgICAtYmxvY2tkZXYgbm9kZS1uYW1lPXBm
bGFzaDEsZHJpdmVyPWZpbGUsZmlsZW5hbWU9UklTQ1ZfVklSVF9WQVJTLmZkIFwKPiA+ICAgIC1v
YmplY3QgbWVtb3J5LWJhY2tlbmQtcmFtLHNpemU9NEcsaWQ9bTAgXAo+ID4gICAgLW9iamVjdCBt
ZW1vcnktYmFja2VuZC1yYW0sc2l6ZT00RyxpZD1tMSBcCj4gPiAgICAtbnVtYSBub2RlLG1lbWRl
dj1tMCxjcHVzPTAtMSxub2RlaWQ9MCBcCj4gPiAgICAtbnVtYSBub2RlLG1lbWRldj1tMSxjcHVz
PTItMyxub2RlaWQ9MSBcCj4gPiAgICAtbnVtYSBkaXN0LHNyYz0wLGRzdD0xLHZhbD0zMCBcCj4g
PiAgICAta2VybmVsIGxpbnV4L2FyY2gvcmlzY3YvYm9vdC9JbWFnZSBcCj4gPiAgICAtaW5pdHJk
IGJ1aWxkcm9vdC9vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5jcGlvIFwKPiA+ICAgIC1hcHBlbmQgInJv
b3Q9L2Rldi9yYW0gcm8gY29uc29sZT1odmMwIGVhcmx5Y29uPXNiaSIKPiA+Cj4gPiBbICAgIDAu
MDAwMDAwXSBBQ1BJOiBTUkFUOiBOb2RlIDAgUFhNIDAgW21lbSAweDgwMDAwMDAwLTB4MTdmZmZm
ZmZmXQo+ID4gWyAgICAwLjAwMDAwMF0gQUNQSTogU1JBVDogTm9kZSAxIFBYTSAxIFttZW0gMHgx
ODAwMDAwMDAtMHgyN2ZmZmZmZmZdCj4gPiBbICAgIDAuMDAwMDAwXSBOVU1BOiBOT0RFX0RBVEEg
W21lbSAweDE3ZmUzYmM0MC0weDE3ZmUzY2ZmZl0KPiA+IFsgICAgMC4wMDAwMDBdIE5VTUE6IE5P
REVfREFUQSBbbWVtIDB4MjdmZmY0YzQwLTB4MjdmZmY1ZmZmXQo+ID4gLi4uCj4gPiBbICAgIDAu
MDAwMDAwXSBBQ1BJOiBOVU1BOiBTUkFUOiBQWE0gMCAtPiBIQVJUSUQgMHgwIC0+IE5vZGUgMAo+
ID4gWyAgICAwLjAwMDAwMF0gQUNQSTogTlVNQTogU1JBVDogUFhNIDAgLT4gSEFSVElEIDB4MSAt
PiBOb2RlIDAKPiA+IFsgICAgMC4wMDAwMDBdIEFDUEk6IE5VTUE6IFNSQVQ6IFBYTSAxIC0+IEhB
UlRJRCAweDIgLT4gTm9kZSAxCj4gPiBbICAgIDAuMDAwMDAwXSBBQ1BJOiBOVU1BOiBTUkFUOiBQ
WE0gMSAtPiBIQVJUSUQgMHgzIC0+IE5vZGUgMQo+ID4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBzaW5j
ZSB2Mwo+ID4gICAtIFJlYmFzZSB0byBsaW51eC1yaXNjdi9mb3ItbmV4dChMaW51eCA2LjEwLXJj
MSkKPiA+ICAgLSBSZW1vdmUgb3JpZ2luYWwgcGF0Y2ggMS82IHNpbmNlIGl0IGhhZCBiZWVuIG1l
cmdlZCB0aHJvdWdoCj4gPiAgICAgQUNQSUNBIHB1bGwoY29tbWl0IGZlMWM0MDhkNTA2MDRmKQo+
ID4gICAtIFJlbW92ZSBvcmlnaW5hbCBwYXRjaCA0LzYgc2luY2UgdGhlIHJlbGF0ZWQgY2hhbmdl
cyB3YXMKPiA+ICAgICBpbnRyb2R1Y2VkIGluIGNvbW1pdCAzYTc4NWUxOWY0MzI2Nwo+ID4KPiA+
IEhhaWJvIFh1ICg0KToKPiA+ICAgQUNQSTogUklTQ1Y6IEFkZCBOVU1BIHN1cHBvcnQgYmFzZWQg
b24gU1JBVCBhbmQgU0xJVAo+ID4gICBBQ1BJOiBOVU1BOiBBZGQgaGFuZGxlciBmb3IgU1JBVCBS
SU5UQyBhZmZpbml0eSBzdHJ1Y3R1cmUKPiA+ICAgQUNQSTogTlVNQTogY2hhbmdlIHRoZSBBQ1BJ
X05VTUEgdG8gYSBoaWRkZW4gb3B0aW9uCj4gPiAgIEFDUEk6IE5VTUE6IHJlcGxhY2UgcHJfaW5m
byB3aXRoIHByX2RlYnVnIGluIGFyY2hfYWNwaV9udW1hX2luaXQKPiA+Cj4gPiAgYXJjaC9hcm02
NC9LY29uZmlnICAgICAgICAgICAgfCAgIDEgLQo+ID4gIGFyY2gvbG9vbmdhcmNoL0tjb25maWcg
ICAgICAgIHwgICAxIC0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaCB8ICAxNSAr
KystCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgfCAgIDEgKwo+ID4gIGFyY2gv
cmlzY3Yva2VybmVsL2FjcGkuYyAgICAgIHwgICA1IC0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwv
YWNwaV9udW1hLmMgfCAxMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4g
IGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgICAgIHwgICA0ICstCj4gPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvc21wYm9vdC5jICAgfCAgIDIgLQo+ID4gIGRyaXZlcnMvYWNwaS9udW1hL0tjb25maWcg
ICAgIHwgICA1ICstCj4gPiAgZHJpdmVycy9hY3BpL251bWEvc3JhdC5jICAgICAgfCAgMzIgKysr
KysrKystCj4gPiAgZHJpdmVycy9iYXNlL2FyY2hfbnVtYS5jICAgICAgfCAgIDIgKy0KPiA+ICBp
bmNsdWRlL2xpbnV4L2FjcGkuaCAgICAgICAgICB8ICAgNiArKwo+ID4gIDEyIGZpbGVzIGNoYW5n
ZWQsIDE4NyBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvYWNwaV9udW1hLmMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
