Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63582C7618E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 22:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utNiK1REgxOLfeGlfy5P62umBYaH0hCAhyt+pIJETgg=; b=4PlEszAiy8THYD
	TjpZD578ZpOZBhwdWaW2IR1q1Ye7MPR+HHDQTwdX1zGAVxXkVTB+CnpTSs3M4wLn4LyfOxr+RKk0U
	JXalTTE8UQGU6GfbIznWsGt+++r6nAlZmj26r87LN7KvlddUn3nRgRm9TUwsswJtR1LlSgx/Tg9wB
	XHmjXA/BCnA+iuaKbi997whP3zFSUZDUTAxtvqKlGt7y+mNNW85QejFgbbOi3zliQnwFdrLxoBLCY
	GuSSxGrKRyqcW7HLWLjH957dS40Jon94YiJHKL96hYY2MHklhmaHj+69jHwZf39CuWvbYsOpwksLM
	4MCsOq+vP8r9L9ivF2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppcLN-0095hW-2i;
	Thu, 20 Apr 2023 22:01:33 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppcLI-0095fV-0o
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 22:01:32 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-51f597c975fso1541624a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 15:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682028086; x=1684620086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2Ev3XkqPH6pBRfYHzJ+uQ7XVHtYSI/8IWEmQRBv/YI=;
        b=XccRPyOwGtCXf7M5O+HNfS7PIZwaQD/v87OkbY9kPKXbSXCwAHUwb77DmpKXQM0oF7
         R0iGe67jW+b5DNWOVTJNemJXy3OKOX6KdYoUmETuzx9PGEbJFJQ2pUniMRMuVPMdDiGU
         /5tCrXANgIgLRaYyadJDbdo+RbIOZFK426WywYo54ew0ofNLXcABU5+/CMzqIREzPHeY
         nozuQwG7Zt6NpmqIblntxNB1TQq9MjpSBvyrh0FYtiq26IkPB90nc3IN0Z5SPpjDuFAg
         Uf2dafkB6vN/Ipj35Qgs/T7S7nQT6pBp/glwP+uShCgN0NssPyN9BTUsrhgWhmezZtGB
         kVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682028086; x=1684620086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2Ev3XkqPH6pBRfYHzJ+uQ7XVHtYSI/8IWEmQRBv/YI=;
        b=S5sR0gWZky8R2bbsmHOIxLOSIHw2Oec7hHINh4rgeK0+6rdO9B73/whLx/EAARz3fR
         V8wqezbFT678QHOMXakLrHB9t/PXtsXJsoWUf8FX+AkOiEUDForcWuWwHtBwr5tLPe1Q
         Rg2SyEvoTSU/nEtCypIvXFsxpTWtCaF1f0m+zBwPn7UaHfrc9SMkUX05M35YPZjZ5AUf
         LhDI7D7TG4eQuzh95unM/MIyFv78I6MhJlR+EZcO/Y9QGlY8rFIJyqR2Nx/aQGN0y8SF
         poYUhYlbEoGRIiUzZ78kxkYBTpXdwwkiF4WVgnMsKqORPoqZtZLff0XWJeE+YXudLwHb
         gxiA==
X-Gm-Message-State: AAQBX9fMI3J/ymP9kFAhI+g8N1f5LFJkBz62Ompbwhv6OflDceiV3iaz
	0SdndyeVPnvPRIi0Oq5BYkq0oZoo5UM/3rZRra2oew==
X-Google-Smtp-Source: AKy350ZODjmhBgPpSK9yTOVPr1QR4R227MhIwe3aNJJTXaij0JPaPQ4lg0m0d3q6HUIib6fUODiqrkndxcAY/A+hkAo=
X-Received: by 2002:a17:90a:5509:b0:247:a272:71d1 with SMTP id
 b9-20020a17090a550900b00247a27271d1mr3035541pji.7.1682028086370; Thu, 20 Apr
 2023 15:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230419221716.3603068-1-atishp@rivosinc.com> <20230419221716.3603068-2-atishp@rivosinc.com>
 <b58eadb7-c80c-42fe-b803-09f2f466c0bd@lucifer.local>
In-Reply-To: <b58eadb7-c80c-42fe-b803-09f2f466c0bd@lucifer.local>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 21 Apr 2023 03:31:15 +0530
Message-ID: <CAHBxVyE3G975UZBhcSsJN1bUFGtnRLSuY=OLMreu5orgc2zKQw@mail.gmail.com>
Subject: Re: [RFC 01/48] mm/vmalloc: Introduce arch hooks to notify
 ioremap/unmap changes
To: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev, 
	Dylan Reid <dylan@rivosinc.com>, abrestic@rivosinc.com, 
	Samuel Ortiz <sameo@rivosinc.com>, Christoph Hellwig <hch@infradead.org>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jiri Slaby <jirislaby@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Uladzislau Rezki <urezki@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_150128_510710_E1A6EC9D 
X-CRM114-Status: GOOD (  39.39  )
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

T24gRnJpLCBBcHIgMjEsIDIwMjMgYXQgMToxMuKAr0FNIExvcmVuem8gU3RvYWtlcyA8bHN0b2Fr
ZXNAZ21haWwuY29tPiB3cm90ZToKPgo+IEknbSBhIHZtYWxsb2MgcmV2aWV3ZXIgdG9vIG5vdyAt
bmV4dC9tbS11bnN0YWJsZSBnZXRfbWFpbnRhaW5lci5wbCBzaG91bGQgc2F5Cj4gc28sIGJ1dCBm
b3JnaXZhYmxlIGJlY2F1c2UgcGVyaGFwcyB5b3UgcmFuIGFnYWluc3QgYW5vdGhlciB0cmVlIGJ1
dCBGWUkgZm9yCj4gZnV0dXJlIEknZCBhcHByZWNpYXRlIGEgY2MtIDopCj4KCkFoaC4gVGhhbmtz
IGZvciBwb2ludGluZyB0aGF0IG91dC4gSSBzZWUgdGhlIHBhdGNoIGZvciB0aGF0IG5vdwpodHRw
czovL2xrbWwub3JnL2xrbWwvMjAyMy8zLzIxLzEwODQKClRoaXMgc2VyaWVzIGlzIGJhc2VkIG9u
IDYuMy1yYzQuIFRoYXQncyBwcm9iYWJseSB3aHkgZ2V0X21haW50YWluZXIucGwKZGlkIG5vdCBw
aWNrIGl0IHVwLgpJIHdpbGwgbWFrZSBzdXJlIGl0IGluY2x1ZGVzIHlvdSBpbiB0aGUgZnV0dXJl
IHJldmlzaW9ucy4KCj4gT24gV2VkLCBBcHIgMTksIDIwMjMgYXQgMDM6MTY6MjlQTSAtMDcwMCwg
QXRpc2ggUGF0cmEgd3JvdGU6Cj4gPiBGcm9tOiBSYWpuZXNoIEthbndhbCA8cmthbndhbEByaXZv
c2luYy5jb20+Cj4gPgo+ID4gSW4gdmlydHVhbGl6YXRpb24sIHRoZSBndWVzdCBtYXkgbmVlZCBu
b3RpZnkgdGhlIGhvc3QgYWJvdXQgdGhlIGlvcmVtYXAKPiA+IHJlZ2lvbnMuIFRoaXMgaXMgYSBj
b21tb24gdXNlY2FzZSBpbiBjb25maWRlbnRpYWwgY29tcHV0aW5nIHdoZXJlIHRoZQo+ID4gaG9z
dCBvbmx5IHByb3ZpZGVzIE1NSU8gZW11bGF0aW9uIGZvciB0aGUgcmVnaW9ucyBzcGVjaWZpZWQg
YnkgdGhlIGd1ZXN0Lgo+ID4KPiA+IEFkZCBhIHBhaXIgaWYgYXJjaCBzcGVjaWZpYyBjYWxsYmFj
a3MgdG8gdHJhY2sgdGhlIGlvcmVtYXBwZWQgcmVnaW9ucy4KPgo+IE5pdDogdHlwbyBpZiAtPiBv
Zi4KPgoKRml4ZWQuIFRoYW5rcy4KCj4gPgo+ID4gVGhpcyBwYXRjaCBpcyBiYXNlZCBvbiBwa3Zt
IHBhdGNoZXMuIEEgZ2VuZXJpYyBhcmNoIGNvbmZpZyBjYW4gYmUgYWRkZWQKPiA+IHNpbWlsYXIg
dG8gcGt2bSBpZiB0aGlzIGlzIGdvaW5nIHRvIGJlIHRoZSBmaW5hbCBzb2x1dGlvbi4gVGhlIGRl
dmljZQo+ID4gYXV0aG9yaXphdGlvbi9maWx0ZXJpbmcgYXBwcm9hY2ggaXMgdmVyeSBkaWZmZXJl
bnQgZnJvbSB0aGlzIGFuZCB3ZQo+ID4gbWF5IHByZWZlciB0aGF0IG9uZSBhcyBpdCBwcm92aWRl
cyBtb3JlIGZsZXhpYmlsaXR5IGluIHRlcm1zIG9mIHdoaWNoCj4gPiBkZXZpY2VzIGFyZSBhbGxv
d2VkIGZvciB0aGUgY29uZmlkZW50aWFsIGd1ZXN0cy4KPgo+IFNvIGl0J3MgYW4gUkZDIHRoYXQg
YXNzdW1lcyBleGlzdGluZyBwYXRjaGVzIGFyZSBhbHJlYWR5IGFwcGxpZWQgb3IgZG8geW91IG1l
YW4KPiBzb21ldGhpbmcgZWxzZSBoZXJlPyBXaGF0IGRvIEkgbmVlZCB0byBkbyB0byBnZXQgdG8g
YSB2bWFsbG9jLmMgd2l0aCB5b3VyIHBhdGNoCj4gYXBwbGllZD8KPgo+IEkgZ3Vlc3MgdGhpcyBp
cyBwcmV0dHkgbml0dHkgc2luY2UgeW91ciBjaGFuZ2VzIGFyZSBzbWFsbCBoZXJlIGJ1dCBiZSBn
b29kIHRvCj4ga25vdyEKPgoKSGVyZSBpcyBhIGJpdCBtb3JlIGNvbnRleHQ6IFRoaXMgcGF0Y2gg
aXMgaW5zcGlyZWQgZnJvbSBNYXJjJ3MgcGt2bSBwYXRjaFsxXQoKV2UgaGF2ZW4ndCBzZWVuIGEg
cmV2aXNlZCB2ZXJzaW9uIG9mIHRoYXQgc2VyaWVzLiBUaHVzLCB3ZSBhcmUgbm90CnN1cmUgaWYg
dGhpcyBpcyB3aGF0IHdpbGwgYmUgdGhlIGZpbmFsIHNvbHV0aW9uIGZvciBwS1ZNLgpUaGUgYWx0
ZXJuYXRpdmUgc29sdXRpb24gaXMgdGhlIGd1ZXN0IGRldmljZSBmaWx0ZXJpbmcgYXBwcm9hY2gu
IFdlCmFyZSBhbHNvIHRyYWNraW5nIHRoYXQgd2hpY2ggaW50cm9kdWNlcyBhIG5ldyBzZXQgb2Yg
ZnVuY3Rpb25zCihpb3JlbWFwX2hhcmRuZWQpWzFdIGZvciBhdXRob3JpemVkIGRldmljZXMgYWxs
b3dlZCBmb3IuIFRoYXQgc2VyaWVzCmRvZXNuJ3QgcmVxdWlyZSBhbnkgY2hhbmdlcyB0byB0aGUg
dm1hbGxvYy5jIGFuZCB0aGlzCnBhdGNoIGNhbiBiZSBkcm9wcGVkLgoKQXMgdGhlIFREWCBpbXBs
ZW1lbnRhdGlvbiBpcyBub3QgcmVhZHkgeWV0LCB3ZSBjaG9zZSB0byBnbyB0aGlzIHdheSB0bwpn
ZXQgdGhlIGJhbGwgcm9sbGluZyBmb3IgaW1wbGVtZW50aW5nIGNvbmZpZGVudGlhbCBjb21wdXRp
bmcKaW4gUklTQy1WLiBPdXIgcGxhbiBpcyB0byBhbGlnbiB3aXRoIHRoZSBzb2x1dGlvbiB0aGF0
IHRoZSB1cHN0cmVhbQpjb21tdW5pdHkgZmluYWxseSBhZ3JlZXMgdXBvbi4KClsxXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9rdm0vMjAyMTEwMDcxNDM4NTIucHlhZTQyc2Jvdmk0dmsyM0BnYXRv
ci90LyNtYzM0ODBlMmExZDY5ZjkxOTk5YWFlMTEwMDQ5NDFkYmRmYmJkZDYwMApbMl0gaHR0cHM6
Ly9naXRodWIuY29tL2ludGVsL3RkeC9jb21taXQvZDhiYjE2OGUxMGQxYmE1MzRjYjgzMjYwZDlh
OGEzYzViMjY5ZWI1MAoKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSYWpuZXNoIEthbndhbCA8cmth
bndhbEByaXZvc2luYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hw
QHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIG1tL3ZtYWxsb2MuYyB8IDE2ICsrKysrKysrKysr
KysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9tbS92bWFsbG9jLmMgYi9tbS92bWFsbG9jLmMKPiA+IGluZGV4IGJlZjZjZjIuLjAy
MzYzMGUgMTAwNjQ0Cj4gPiAtLS0gYS9tbS92bWFsbG9jLmMKPiA+ICsrKyBiL21tL3ZtYWxsb2Mu
Ywo+ID4gQEAgLTMwNCw2ICszMDQsMTQgQEAgc3RhdGljIGludCB2bWFwX3JhbmdlX25vZmx1c2go
dW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCwKPiA+ICAgICAgIHJldHVybiBl
cnI7Cj4gPiAgfQo+ID4KPiA+ICtfX3dlYWsgdm9pZCBpb3JlbWFwX3BoeXNfcmFuZ2VfaG9vayhw
aHlzX2FkZHJfdCBwaHlzX2FkZHIsIHNpemVfdCBzaXplLCBwZ3Byb3RfdCBwcm90KQo+ID4gK3sK
PiA+ICt9Cj4gPiArCj4gPiArX193ZWFrIHZvaWQgaW91bm1hcF9waHlzX3JhbmdlX2hvb2socGh5
c19hZGRyX3QgcGh5c19hZGRyLCBzaXplX3Qgc2l6ZSkKPiA+ICt7Cj4gPiArfQo+ID4gKwo+Cj4g
SSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMgZm9yIGVmZmljaWVuY3kgYnkgdXNpbmcgYSB3ZWFrIHJl
ZmVyZW5jZSwgaG93ZXZlciwgYW5kCj4gcGVyaGFwcyBhIG5pdCwgYnV0IEknZCBwcmVmZXIgYW4g
YXJjaF8qKCkgdGhhdCdzIGRlZmluZWQgaW4gYSBoZWFkZXIgc29tZXdoZXJlLAo+IGFzIGl0IGRv
ZXMgaGlkZSB0aGUgY2FsbCBwYXRocyBxdWl0ZSBlZmZlY3RpdmVseS4KPgoKU3VyZS4gV2lsbCBk
byB0aGF0LgoKPiA+ICBpbnQgaW9yZW1hcF9wYWdlX3JhbmdlKHVuc2lnbmVkIGxvbmcgYWRkciwg
dW5zaWduZWQgbG9uZyBlbmQsCj4gPiAgICAgICAgICAgICAgIHBoeXNfYWRkcl90IHBoeXNfYWRk
ciwgcGdwcm90X3QgcHJvdCkKPiA+ICB7Cj4gPiBAQCAtMzE1LDYgKzMyMywxMCBAQCBpbnQgaW9y
ZW1hcF9wYWdlX3JhbmdlKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBlbmQsCj4g
PiAgICAgICBpZiAoIWVycikKPiA+ICAgICAgICAgICAgICAga21zYW5faW9yZW1hcF9wYWdlX3Jh
bmdlKGFkZHIsIGVuZCwgcGh5c19hZGRyLCBwcm90LAo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaW9yZW1hcF9tYXhfcGFnZV9zaGlmdCk7Cj4gPiArCj4gPiArICAg
ICBpZiAoIWVycikKPiA+ICsgICAgICAgICAgICAgaW9yZW1hcF9waHlzX3JhbmdlX2hvb2socGh5
c19hZGRyLCBlbmQgLSBhZGRyLCBwcm90KTsKPiA+ICsKPiA+ICAgICAgIHJldHVybiBlcnI7Cj4g
PiAgfQo+ID4KPiA+IEBAIC0yNzcyLDYgKzI3ODQsMTAgQEAgdm9pZCB2dW5tYXAoY29uc3Qgdm9p
ZCAqYWRkcikKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFkZHIpOwo+ID4gICAg
ICAgICAgICAgICByZXR1cm47Cj4gPiAgICAgICB9Cj4gPiArCj4gPiArICAgICBpZiAodm0tPmZs
YWdzICYgVk1fSU9SRU1BUCkKPiA+ICsgICAgICAgICAgICAgaW91bm1hcF9waHlzX3JhbmdlX2hv
b2sodm0tPnBoeXNfYWRkciwgZ2V0X3ZtX2FyZWFfc2l6ZSh2bSkpOwo+ID4gKwo+Cj4gVGhlcmUg
YXJlIHBsYWNlcyBvdGhlciB0aGFuIGlvcmVtYXBfcGFnZV9yYW5nZSgpIHRoYXQgY2FuIHNldCBW
TV9JT1JFTUFQLAo+IGUuZy4gdm1hcF9wZm4oKSwgc28gdGhpcyBtYXkgdHJpZ2dlciB3aXRoIGFk
ZHJlc3NlcyBvdGhlciB0aGFuIHRob3NlIHNwZWNpZmllZAo+IGluIHRoZSBvcmlnaW5hbCBob29r
LiBJcyB0aGlzIGludGVuZGVkPwo+CgpUaGFua3MgZm9yIHBvaW50aW5nIHRoYXQgb3V0LiBZZWFo
LiBUaGF0IGlzIG5vdCBpbnRlbnRpb25hbC4KCj4gPiAgICAgICBrZnJlZSh2bSk7Cj4gPiAgfQo+
ID4gIEVYUE9SVF9TWU1CT0wodnVubWFwKTsKPiA+IC0tCj4gPiAyLjI1LjEKPiA+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
