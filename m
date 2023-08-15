Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13DFC001DB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 01:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6oIjijh6zS2NYzQN1sjH31+74d6n7+0EAidBE1r2+1E=; b=tf0mCx6UrpmIxg
	yEV8Hj9/rQVK0s7V7JcowBUDTgnit/taBFEcIRMe36ytprnwkdoES4MNtr8iKHvlQVBMyyHwH2s0A
	axFUXs8XPboRkKbh083Eun52R21pIJhHpBH1eVT9YhIC4eeiaO8La/Tantr8ImVr8YtHQkeO+wL2P
	mdx9vYcmPNnKqG1bL4NeG0KM1aFqb5xVmtysGtbLwEA8R4PT9kDYWJaboNJbse00hTUqinR3I07c8
	/HQBZtN2W6P5UYiANUXoseYsC49KT0j2B8TXP7TMAfMvTWKN1H+oBb5YIjIhVoY6eBU4jl1QCJrYm
	1DIIW0VtJIhEsfdJmRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViru-000faX-0Y;
	Tue, 15 Aug 2023 01:29:10 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVirr-000fa7-17
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 01:29:08 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-349a7cb1a5cso14516835ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 18:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692062945; x=1692667745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7/FNZ+/kn2EN/jZotOHGG2mqO/LoJv2hq7cxgzJU0c=;
        b=lbhrr8uBFXl29L3W+33eTVbMaroAQxnceIFgwppNlBLVMefUy7eDcjWUt4KIW83CMQ
         xs0wxbuqj4QYKrrG3jEbYQxLkNBB8xhyzZJ0lKO+QmbpnDKQ9M3trfWfW5wHK5qfY/Lp
         v9FjwaPH7p249FyuVU1mP8raMsabFvcGvXifimINyHSEWHtcBS9gix8/LRVIO6ed/ekV
         fWjo4sFNJPaFLF9CPk2HCX2nWWfdLtpT4ROFxZ7Bi3nCMQzwFGIqBhkZuTutvViH5wtV
         YOq481ZyyK2m1eDDb/M1cqyOjmErgvSVcyTBfV6BW1bjkGl8smhMibEvhRXkxdRaFXXr
         rKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692062945; x=1692667745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7/FNZ+/kn2EN/jZotOHGG2mqO/LoJv2hq7cxgzJU0c=;
        b=NldPGhSBdmBPVDrZbUv45z5MlpAsDnnO1Eu7BLrbFca3yvEODsJ12zcwtRtq9aLG7q
         9/oDP7NShbZcZRG0Ahr8M52cz+f3jDoZyq2NnIBFM/xD6g+3Fe1SEclKomrHDJUcnt/4
         SekVBq/+IxXsIboybxJjv3kfhy5sVbZXpUzU92xPWN8MJt48Xwmc+9S5yMnl/3yPVfQL
         HPPH8GXLahmfNa9D5YszZQSCZX2uVVawVm3LxWOMitZ/zk+vOOULlwHzUg9RnixR0+RO
         Jj9cDkTYAFZ9Wf4Qx82x6WqgODaQ4hevYmwYP7HR7Nj2HfMf3XUA4DMMORX2J3Ax4MbQ
         T+hg==
X-Gm-Message-State: AOJu0YyGLyOfiWxiNsJ/3ZYI8MRDdxb23wUbBQZo7fXugqgpkhnAbpHk
	6Ehn74DMRdpjLW5jyoTGcregMMKxVWigQ13e3HWyXw==
X-Google-Smtp-Source: AGHT+IH9fTgdlitNkb6EBHqBlRxGk0okfJiotZadNreJXeHoK0oyZVb3KFtPGjg2dfY+aKFJWqcw0nu5oBMqLfit85w=
X-Received: by 2002:a05:6e02:1d18:b0:349:862e:a862 with SMTP id
 i24-20020a056e021d1800b00349862ea862mr18151358ila.20.1692062945654; Mon, 14
 Aug 2023 18:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <d62ceb33620cab766d809e6bbf30eaf5b46bc955.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0r=2eqpy9wLjVt1U0J7=LpnJLcKV7N9d90jvCss=7+Fzg@mail.gmail.com>
 <CAK9=C2Vg9eR5LJPeqDDQ0pHZcrT5DOUzA8_wYEVEjfnhb6s8pw@mail.gmail.com>
 <CANXhq0oTrU_-OQroW7H+hvxcU7YROhkgdCF9g_WtPTzVFQL7gA@mail.gmail.com>
 <CAK9=C2XoQjPzZ5yB5jfTbee4-Pb8GgFAZRbfcMwMk9pyo39WxQ@mail.gmail.com>
 <CANXhq0q7R9Srx6U=fReq7LDLFgW6rMmjKH=o6MzDT5AWNRXP6w@mail.gmail.com>
 <592edb17-7fa4-3b5b-2803-e8c50c322eee@linux.intel.com> <CANXhq0pS_=YxgrxSKbdfrFdGcBduzk3LTyC4vp_hqoJTbX3e0g@mail.gmail.com>
 <ZMEO1kNGfGjN6kZM@ziepe.ca> <CANXhq0qMWS_j0n_aUO8BVFSedYCjuMM=Z_tsnK05ZhG+Ob6pqw@mail.gmail.com>
 <ZNOpbac4i5zfmHj4@ziepe.ca>
In-Reply-To: <ZNOpbac4i5zfmHj4@ziepe.ca>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 15 Aug 2023 09:28:54 +0800
Message-ID: <CANXhq0rzz1Sn8dKvNt7acvKN_g5yXFN9u6XPiRHr9ay7q2VbzA@mail.gmail.com>
Subject: Re: [PATCH 03/11] dt-bindings: Add RISC-V IOMMU bindings
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, 
	Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_182907_424099_83FC4064 
X-CRM114-Status: GOOD (  23.85  )
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

T24gV2VkLCBBdWcgOSwgMjAyMyBhdCAxMDo1N+KAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPiB3cm90ZToKPgo+IE9uIFRodSwgSnVsIDI3LCAyMDIzIGF0IDEwOjQyOjQ3QU0gKzA4
MDAsIFpvbmcgTGkgd3JvdGU6Cj4KPiA+IFBlcmhhcHMgdGhpcyBxdWVzdGlvbiBjb3VsZCBiZSBy
ZWxhdGVkIHRvIHRoZSBzY2VuYXJpb3MgaW4gd2hpY2gKPiA+IGRldmljZXMgd2lzaCB0byBiZSBp
biBieXBhc3MgbW9kZSB3aGVuIHRoZSBJT01NVSBpcyBpbiB0cmFuc2xhdGlvbgo+ID4gbW9kZSwg
YW5kIHdoeSBJT01NVSBkZWZpbmVzL3N1cHBvcnRzIHRoaXMgY2FzZS4gQ3VycmVudGx5LCBJIGNv
dWxkCj4gPiBlbnZpc2lvbiBhIHNjZW5hcmlvIHdoZXJlIGEgZGV2aWNlIGlzIGFscmVhZHkgY29u
bmVjdGVkIHRvIHRoZSBJT01NVQo+ID4gaW4gaGFyZHdhcmUsIGJ1dCBpdCBpcyBub3QgZnVuY3Rp
b25pbmcgY29ycmVjdGx5LCBvciB0aGVyZSBhcmUKPiA+IHBlcmZvcm1hbmNlIGltcGFjdHMuIElm
IG1vZGlmeWluZyB0aGUgaGFyZHdhcmUgaXMgbm90IGZlYXNpYmxlLCBhCj4gPiBkZWZhdWx0IGNv
bmZpZ3VyYXRpb24gdGhhdCBhbGxvd3MgYnlwYXNzIG1vZGUgY291bGQgYmUgcHJvdmlkZWQgYXMg
YQo+ID4gc29sdXRpb24uIFRoZXJlIG1pZ2h0IGJlIG90aGVyIHNjZW5hcmlvcyB0aGF0IEkgbWln
aHQgaGF2ZSBvdmVybG9va2VkLgo+ID4gSXQgc2VlbXMgdG8gbWUgc2luY2UgSU9NTVUgc3VwcG9y
dHMgdGhpcyBjb25maWd1cmF0aW9uLCBpdCB3b3VsZCBiZQo+ID4gYWR2YW50YWdlb3VzIHRvIGhh
dmUgYW4gYXBwcm9hY2ggdG8gYWNoaWV2ZSBpdCwgYW5kIERUIG1pZ2h0IGJlIGEKPiA+IGZsZXhp
YmxlIHdheS4KPgo+IFNvIGZhciB3ZSd2ZSB0YWtlbiB0aGUgYXBwcm9hY2ggdGhhdCBicm9rZW4g
aGFyZHdhcmUgaXMgcXVpcmtlZCBpbiB0aGUKPiBrZXJuZWwgYnkgbWF0Y2hpbmcgT0YgY29tcGF0
aWJsZSBzdHJpbmcgcGF0dG5lcnMuIFRoaXMgaXMgSFcgdGhhdCBpcwo+IGNvbXBsZXRlbHkgYnJv
a2VuIGFuZCB0aGUgSU9NTVUgZG9lc24ndCB3b3JrIGF0IGFsbCBmb3IgaXQuCj4KPiBIVyB0aGF0
IGlzIHNsb3cgb3Igd2hhdGV2ZXIgaXMgbm90IHF1aXJrZWQgYW5kIHRoaXMgaXMgYW4gYWRtaW4g
cG9saWN5Cj4gY2hvaWNlIHdoZXJlIHRoZSBzeXN0ZW0gc2hvdWxkIGxhbmQgb24gdGhlIHNlY3Vy
aXR5L3BlcmZvcm1hbmNlCj4gc3BlY3RydW0uCj4KPiBTbyBJJ20gbm90IHN1cmUgYWRkaW5nIERU
IG1ha2VzIHNlbnNlIGhlcmUuCj4KCkhpIEphc29uLApTb3JyeSBmb3IgYmVpbmcgbGF0ZSBoZXJl
LCBJIGhhZG4ndCBub3RpY2VkIHRoaXMgcmVwbHkgZWFybGllci4gVGhlCmFwcHJvYWNoIHNlZW1z
IHRvIGFkZHJlc3MgdGhlIHNpdHVhdGlvbi4gQ291bGQgeW91IGtpbmRseSBwcm92aWRlCmluZm9y
bWF0aW9uIGFib3V0IHRoZSBsb2NhdGlvbiBvZiB0aGUgcGF0Y2hlcz8gSSB3YXMgd29uZGVyaW5n
IGFib3V0CmZ1cnRoZXIgZGV0YWlscyByZWdhcmRpbmcgdGhpcyBwYXJ0aWN1bGFyIGltcGxlbWVu
dGF0aW9uLiBUaGFua3MKCj4gSmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
