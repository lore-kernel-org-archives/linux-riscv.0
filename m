Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5815FC7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 07:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLvzMMhb9zF30SEyz2axTSmpNkWsQkhxqn+7bMfZe7g=; b=DTJvtlWpPqNh3v
	gs1chRubpxzLK7FQmgPpIiKyncTjx1NDU2lD7/wevf/+SxmD8kFZhW0Ex6rrtbbDFAe4IkOoXtRC2
	ZZdXaApHg41jYUcFXAQIhcHBk6WYGhqvwQ9MYBzMnS700CoqqBQLzqXjz4rC+TgTdgM2PVvV8fJrI
	Y1uBBw84iTWAOXMRse3kPA0JOxeBp8uzrat85EDEjXSvDL3YLABWygieQHfT3U/oo5RPENTfwTxhV
	PPEzzPPnXJlTGyozQcLTg0Y0YKyFXgiLSu2cEEl51qx460EKl0VBpGMCci577WENemw+KzkEyi6sq
	MnwE/f29qdFk/3Az5v1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwe1u-005MWR-37;
	Wed, 10 May 2023 07:14:30 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwe1q-005MTz-0x;
	Wed, 10 May 2023 07:14:27 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4501f454581so3045079e0c.3;
        Wed, 10 May 2023 00:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683702863; x=1686294863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvYmUAzo0cwOybz0hjxV39+5gh/FQ5/NU0n3aFKpLiE=;
        b=PISa4ddY1I/KguwI43tmpXJj05qO/4pkFTnYfFIr75pG7bMkEiZN1gvAcTgIf7h7vM
         o6iud80LrYBCD3cD1eUjnIidyrgLHbBRfpckEQ489MOA/E5gwmb6LX7S/kG6qcHq7rPn
         5sEhVkSXla39Wbf8xln6FvT/GFVCDXZCl/hFRUqXokmKtzCvRUj1Wuloyky84tEveArf
         42H2xhTScbC2Y/76VFLR2vRCfQbYTfcJ2Ga8p4z/Urir1pzCLomqaKS3o65V0rGaHIsu
         l+AU31zMY7jze+vVe/OmnJD3NNb2unX6/1uRgUBCQ6+FaDR71JhjW2c5XuP5mG+NiNHb
         KB3g==
X-Gm-Message-State: AC+VfDySLPZvS51ZyaVMfVHgHs8uGBE6cwPseHAftmmPZuer/G2LxrV7
	bdVajQ+Y1yIW7uEdwsEqzp/gqJnFZDXRmw==
X-Google-Smtp-Source: ACHHUZ6Efmf6SnNw1/ZaHl5W9lH7oJpP3nX4cwnXU1AtkoLOIKkkIHJfPWG9LLm85jXqdNUWvhzSdw==
X-Received: by 2002:a1f:4e02:0:b0:44f:ba05:46cf with SMTP id c2-20020a1f4e02000000b0044fba0546cfmr5019455vkb.3.1683702863376;
        Wed, 10 May 2023 00:14:23 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id h126-20020a1f2184000000b004500a8f395asm1924917vkh.38.2023.05.10.00.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:14:22 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-44ff2f8ec9dso4252418e0c.1;
        Wed, 10 May 2023 00:14:22 -0700 (PDT)
X-Received: by 2002:a05:6902:1147:b0:b99:4ac6:3c75 with SMTP id
 p7-20020a056902114700b00b994ac63c75mr18672301ybu.10.1683702842290; Wed, 10
 May 2023 00:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com> <237c8410-ce61-94c-4260-7318ad6a4f3@google.com>
In-Reply-To: <237c8410-ce61-94c-4260-7318ad6a4f3@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2023 09:13:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWb0SrEs=cDzKW1Ai2UywnnpZip4pk9mOkiVGivPpj8sg@mail.gmail.com>
Message-ID: <CAMuHMdWb0SrEs=cDzKW1Ai2UywnnpZip4pk9mOkiVGivPpj8sg@mail.gmail.com>
Subject: Re: [PATCH 05/23] m68k: allow pte_offset_map[_lock]() to fail
To: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>, 
	Suren Baghdasaryan <surenb@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	John David Anglin <dave.anglin@bell.net>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_001426_343454_1E09D89E 
X-CRM114-Status: GOOD (  21.72  )
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

SGkgSHVnaCwKClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIFdlZCwgTWF5IDEwLCAyMDIzIGF0
IDY6NDjigK9BTSBIdWdoIERpY2tpbnMgPGh1Z2hkQGdvb2dsZS5jb20+IHdyb3RlOgo+IEluIHJh
cmUgdHJhbnNpZW50IGNhc2VzLCBub3QgeWV0IG1hZGUgcG9zc2libGUsIHB0ZV9vZmZzZXRfbWFw
KCkgYW5kCj4gcHRlX29mZnNldF9tYXBfbG9jaygpIG1heSBub3QgZmluZCBhIHBhZ2UgdGFibGU6
IGhhbmRsZSBhcHByb3ByaWF0ZWx5Lgo+Cj4gUmVzdHJ1Y3R1cmUgY2ZfdGxiX21pc3MoKSB3aXRo
IGEgcHRlX3VubWFwKCkgKHByZXZpb3VzbHkgb21pdHRlZCkKPiBhdCBsYWJlbCBvdXQsIGZvbGxv
d2VkIGJ5IG9uZSBsb2NhbF9pcnFfcmVzdG9yZSgpIGZvciBhbGwuCgpUaGF0J3MgYSBidWcgZml4
LCB3aGljaCBzaG91bGQgYmUgYSBzZXBhcmF0ZSBwYXRjaD8KCj4KPiBTaWduZWQtb2ZmLWJ5OiBI
dWdoIERpY2tpbnMgPGh1Z2hkQGdvb2dsZS5jb20+CgoKPiAtLS0gYS9hcmNoL202OGsvaW5jbHVk
ZS9hc20vbW11X2NvbnRleHQuaAo+ICsrKyBiL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9tbXVfY29u
dGV4dC5oCj4gQEAgLTk5LDcgKzk5LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGxvYWRfa3NwX21t
dShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spCj4gICAgICAgICBwNGRfdCAqcDRkOwo+ICAgICAg
ICAgcHVkX3QgKnB1ZDsKPiAgICAgICAgIHBtZF90ICpwbWQ7Cj4gLSAgICAgICBwdGVfdCAqcHRl
Owo+ICsgICAgICAgcHRlX3QgKnB0ZSA9IE5VTEw7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIG1t
dWFyOwo+Cj4gICAgICAgICBsb2NhbF9pcnFfc2F2ZShmbGFncyk7Cj4gQEAgLTEzOSw3ICsxMzks
NyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbG9hZF9rc3BfbW11KHN0cnVjdCB0YXNrX3N0cnVjdCAq
dGFzaykKPgo+ICAgICAgICAgcHRlID0gKG1tdWFyID49IFBBR0VfT0ZGU0VUKSA/IHB0ZV9vZmZz
ZXRfa2VybmVsKHBtZCwgbW11YXIpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDogcHRlX29mZnNldF9tYXAocG1kLCBtbXVhcik7Cj4gLSAgICAgICBpZiAocHRlX25vbmUo
KnB0ZSkgfHwgIXB0ZV9wcmVzZW50KCpwdGUpKQo+ICsgICAgICAgaWYgKCFwdGUgfHwgcHRlX25v
bmUoKnB0ZSkgfHwgIXB0ZV9wcmVzZW50KCpwdGUpKQo+ICAgICAgICAgICAgICAgICBnb3RvIGJ1
ZzsKCklmIHRoZSBhYnNlbmNlIG9mIGEgcHRlIGlzIHRvIGJlY29tZSBhIG5vbi1hYm5vcm1hbCBj
YXNlLCBpdCBzaG91bGQKcHJvYmFibHkganVtcCB0byAiZW5kIiBpbnN0ZWFkLCB0byBhdm9pZCBz
cGFtbWluZyB0aGUga2VybmVsIGxvZy4KCj4KPiAgICAgICAgIHNldF9wdGUocHRlLCBwdGVfbWt5
b3VuZygqcHRlKSk7Cj4gQEAgLTE2MSw2ICsxNjEsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbG9h
ZF9rc3BfbW11KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaykKPiAgYnVnOgo+ICAgICAgICAgcHJf
aW5mbygia3NwIGxvYWQgZmFpbGVkOiBtbT0weCVwIGtzcD0weDA4JWx4XG4iLCBtbSwgbW11YXIp
Owo+ICBlbmQ6Cj4gKyAgICAgICBpZiAocHRlICYmIG1tdWFyIDwgUEFHRV9PRkZTRVQpCj4gKyAg
ICAgICAgICAgICAgIHB0ZV91bm1hcChwdGUpOwoKSXMgdGhpcyBhbHNvIGEgYnVnZml4LCBub3Qg
bWVudGlvbmVkIGluIHRoZSBwYXRjaCBkZXNjcmlwdGlvbj8KCj4gICAgICAgICBsb2NhbF9pcnFf
cmVzdG9yZShmbGFncyk7Cj4gIH0KPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
