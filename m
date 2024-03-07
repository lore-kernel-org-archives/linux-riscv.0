Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6890C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 09:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAIbxgmgM1dnx96BDRDZnssXQmZhbp2WS5DfJZW43a8=; b=GGnvYBQdgJkB1n
	iAOCuKCqIX6fWlz0cclIFWDUIwlvHztuGsY8F7Fg4fcz1ONss1DuqRr086RZVY0K+/BSFt+OKfPOh
	JMRDdsiF3yVqdUHhqc0wDAvpt177dgVQodipFCKahrSYm4qjeqNwTsfgA8pMFBdXmRIRhwBEXIVpC
	jwwqvk0uVHlwoVR5WilHhopMyPq19TIlE30S56kbqnDj55LC+LrxX9h2rtDO/4rLg0LhTYBn8vZFZ
	5xXM7c0Lqvvwj6psqzDLxfjxI3hmFPr+ey2ZwYcl1cMY33Zzld8mEwp8FU974dG/TIOhpMuwn9fkw
	OP07M7T4YYo5VA7Sppyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9vA-00000003ozT-0T2U;
	Thu, 07 Mar 2024 09:20:12 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9v6-00000003ou3-31JQ
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 09:20:10 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d28051376eso9123541fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 01:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709803204; x=1710408004; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80RTQxeG1HoYvnNvzrKo401rks3qN8X2iKrIw4d9yaQ=;
        b=hwrG2FO9CCRgSgy17VfixnTOmJwGYWsPD5TW7tFGjnbSLMsX6oY8Vsn94V6UX/b4BI
         2Nw1vlSdMraNWNASUsc7umbeRv2IG8om+fQEnLSwUWvO6vcGVcTD8GxHCAb2/v8v7HFt
         ogyI8L/7ed7tYeDKVEPja2gDkrnKPeAGfxwjqoPiUEto7bUTqz+Zd1SSnRZaJ+MD13j8
         b5R0oVZu8EMWBVXNrbzQPvBMcXD99JMbTLhN9B7kWtsMB81wre8vxEV1KPkt24OFJeLV
         748JZCPYB/5U4h+kIJ10NLXDU6k+1vkjZSxj4tTVr8BCiDOFJmzWo92HLsJCKVM/SWio
         BsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709803204; x=1710408004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80RTQxeG1HoYvnNvzrKo401rks3qN8X2iKrIw4d9yaQ=;
        b=gs1eD5Zoh80K2qFrtyc3XXI1QO6O8OSS0E+8C1YYDq3eiJH9YpLiONc4d2bAvRVmPo
         wCrVbgjlE1aPFfv+2CLrpDjhEYPGF6oUvKvlqC711C9Ez3iHNIEcUj5O+QC/Celu8ZBJ
         xJXWOgqzQ8e2a+uGWcYLkd3kF5pLuy1N8R/q7dz0vePyKAjlUgCSeLiTbYItNoODpUUw
         JLmzKshL+WU5OuyeT5CKOMSei+IFBGUuzBfC9CcpUc4OXfIZlMLJUMwUEbjgaNwA4x/J
         66G+NNXJsi9oANzr2M+9/V20QS4tG3EwrOhscBLcludM1gNm5sr8fNDl09hgU9MRVQK8
         6VkA==
X-Forwarded-Encrypted: i=1; AJvYcCVWKDoV7PcoAO9/6JSHUp3d46RJaKNnOkx4ek5g8hKuLkMyjqBEf46j/2g+bRRoRUf7xFKzdov9eweqHeW5IG0ur0h7TT7wIgf4rrBmKGrl
X-Gm-Message-State: AOJu0YzGAn85rPrfcJKQoJgohpuq9DhYpdRtMbjfqyMxLMws4UkZonQn
	VkeX7zs73XfZ/1BWuMTyLvkUy2P6WegkicT6NnniJRIbAHQ6wsctOAZGs1wTDFhteEx7TvCFm2M
	sqUcEjh/2yopamIhJ5REUkF6Cm38=
X-Google-Smtp-Source: AGHT+IEe43Gp9xWf88EuXib+ywhG0E+gf0UnlcztjMhnwdiDupBKxPSSYhqii6oCxJLhS0kHoQOREXn5DPA0iSZD7b0=
X-Received: by 2002:ac2:5f87:0:b0:513:6632:2f62 with SMTP id
 r7-20020ac25f87000000b0051366322f62mr1049502lfe.7.1709803203752; Thu, 07 Mar
 2024 01:20:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1709780590.git.haibo1.xu@intel.com> <f23da383a8fdbee15acd41fdcd38ef3a89045a43.1709780590.git.haibo1.xu@intel.com>
 <c9e9da9f-ff81-48eb-beec-4f54921cd268@app.fastmail.com>
In-Reply-To: <c9e9da9f-ff81-48eb-beec-4f54921cd268@app.fastmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Thu, 7 Mar 2024 17:19:52 +0800
Message-ID: <CAJve8o=BsR1SG0k_7mb61Jj1fb+9rc4V9Y=MMX004fpAWE4vjg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ACPI: NUMA: Remove ARCH depends option in
 ACPI_NUMA Kconfig
To: Arnd Bergmann <arnd@arndb.de>
Cc: Haibo Xu <haibo1.xu@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>, 
	Zong Li <zong.li@sifive.com>, James Morse <james.morse@arm.com>, 
	linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Baoquan He <bhe@redhat.com>, acpica-devel@lists.linux.dev, 
	Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Chen Jiahao <chenjiahao16@huawei.com>, 
	Yuntao Wang <ytcoode@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_012008_807070_FA7DD3B9 
X-CRM114-Status: GOOD (  21.53  )
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

T24gVGh1LCBNYXIgNywgMjAyNCBhdCA0OjQ04oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1hciA3LCAyMDI0LCBhdCAwOTo0NywgSGFpYm8gWHUg
d3JvdGU6Cj4gPiB4ODYvYXJtNjQvbG9vbmdhcmNoIHdvdWxkIHNlbGVjdCBBQ1BJX05VTUEgYnkg
ZGVmYXVsdCBhbmQgcmlzY3YKPiA+IHdvdWxkIGRvIHRoZSBzYW1lIHRoaW5nLCBzbyB0aGUgZGVw
ZW5kZW5jeSBpcyBubyBsb25nZXIgbmVlZGVkCj4gPiBzaW5jZSB0aGVzZSBhcmUgdGhlIGZvdXIg
YXJjaGl0ZWN0dXJlcyB0aGF0IHN1cHBvcnQgQUNQSS4KPiA+Cj4gPiBTdWdnZXN0ZWQtYnk6IEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPiBTdWdnZXN0ZWQtYnk6IFN1bmlsIFYgTCA8
c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8gWHUgPGhh
aWJvMS54dUBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2FjcGkvbnVtYS9LY29uZmln
IHwgMSAtCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9hY3BpL251bWEvS2NvbmZpZyBiL2RyaXZlcnMvYWNwaS9udW1hL0tjb25m
aWcKPiA+IGluZGV4IDg0OWMyYmQ4MjBiOS4uMmJmNDdhZDFlYzliIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9hY3BpL251bWEvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9hY3BpL251bWEvS2Nv
bmZpZwo+ID4gQEAgLTIsNyArMiw2IEBACj4gPiAgY29uZmlnIEFDUElfTlVNQQo+ID4gICAgICAg
Ym9vbCAiTlVNQSBzdXBwb3J0Igo+ID4gICAgICAgZGVwZW5kcyBvbiBOVU1BCj4gPiAtICAgICBk
ZXBlbmRzIG9uIChYODYgfHwgQVJNNjQgfHwgTE9PTkdBUkNIKQo+ID4gICAgICAgZGVmYXVsdCB5
IGlmIEFSTTY0Cj4KPiBDYW4gd2UgcmVtb3ZlIHRoZSBwcm9tcHQgYXMgd2VsbCBhbmQgbWFrZSB0
aGlzIGEKPiBoaWRkZW4gb3B0aW9uPyBJIHRoaW5rIHRoaXMgaXMgbm93IGFsd2F5cyBzZWxlY3Rl
ZAo+IHdoZW4gaXQgY2FuIGJlIHVzZWQgYW55d2F5Lgo+Cj4gSWYgd2UgbWFrZSBpdAo+Cj4gICAg
ICAgZGVmX2Jvb2wgTlVNQSAmJiAhWDg2Cj4KPiB0aGVuIHRoZSBzZWxlY3Qgc3RhdGVtZW50cyBl
eGNlcHQgZm9yIHRoZSBYODZfNjRfQUNQSV9OVU1BCj4gY2FuIGFsc28gZ28gYXdheS4KPgoKR29v
ZCBpZGVhIQpTaGFsbCB3ZSBpbmNsdWRlIHRoZSBBQ1BJIGluIHRoZSBkZWZfYm9vbCBkZWZpbml0
aW9uPwoKPiAgICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
