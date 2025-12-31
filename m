Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB3AEE6428
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wr2uBOyVhcEbuA9u7iWHnJQceBQi0fLjKHHdt9CH6Zg=; b=NLOyvg3exkYTdo
	M5Ek/Kht5t6BlqJTVLpiSQVcyYR7m05rld4F8FBsQUVYq6MlD8XphXxqZgpJr2Naq0d3MuFJYs7W5
	K6p8qIs9GQsP2WmGk59hPuTuFolIKKKAZkB31v9rUUyRkdjxqphz8DPKsFbsooy3GbFqbwnIsmkHM
	RRjCs5pM3LePC5Tz5VFibd32PHDKUBjzZBpMk2sNxkzY5eo7HtpOfYXBoBJN1LXOTeidAHltSZymH
	5i+4QMbHGXODWKM7mvbar6MPnAJWphBFLMRPhPPs+O3PWi2kV2e6BsILXm5Rm3YeQfLZ+khEQ9kiw
	e2kJwV5+w8XylbW7cRdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaySL-000000066Oo-0O4L;
	Wed, 31 Dec 2025 15:49:49 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaySH-000000066Mn-3RwT
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 15:49:47 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-64d0d41404cso13327073a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Dec 2025 07:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767196183; x=1767800983; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6r7yw9l553CBnZ0Oq6/Kvj3e3aIbXAlTRdm8Qc8sow=;
        b=QGFJM+5zzECLce/Ez4Hm9KA6Yf2GspnQLdjfiLnUsbTeaLIkdBKnz9eKXeAd01+4TB
         Rsl1Eg/dsnn+mN4bsUM0JR01/PqQDE/Zp8RhK9RpWiwT+ANY5tEVk4JNUDMU3oHuEvQ0
         dswALg0SwD518q5oPBa/UZJvodrqsY0GkjBGn5zxaQcaJYF/JEiqLEVXhBh8flXBd+/X
         WQYb+g0r50BvbK2zGN0pIEwE7tqemOTo9DqrxSo+A0PtVHLiHQIX+ezWSCoAml7dzPAR
         01jQrZB+6wHQsKClgyurzc3qcBZO0TQG9ky3ao6g3rHvsKzIhRX0QSPClWpndQgJ4BpD
         AO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767196183; x=1767800983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H6r7yw9l553CBnZ0Oq6/Kvj3e3aIbXAlTRdm8Qc8sow=;
        b=pZHtW4KjthnavwHM/2sMrU+icxVkaUWw8JUVy68clXQB4kao2E9nknVzZoTCCeaWdp
         viKN0g1BSYbGmeN98uoDc5K0Wy2Jy6eaQrRaR8z3GThkKpaOA/kfy0gcHxAg2a50Ch8u
         qhOpQ6xfDPvaoZq0BFIfQU2AEE1cxAir+Zm8Y9Nwt1Tk6XE1TMQ3INDB2NlqzdML4mJ2
         T8R1179OcZLQTOTK4WlM53uPne1FsLyrD/LgG0LtCcmEkdF4d0miZfVCKFB+UQAtI2w+
         7V6eGH9YU5O/KZqjqjG6AUSYsS1lcn93Ln/smx+f3e84pwihedjBQgkflVKeP8ZbI7j/
         pgGA==
X-Forwarded-Encrypted: i=1; AJvYcCU75nQ6TAKua5hDsJmfndWPCA/tWfThqe2wIGd35Rtp44NxRTd7dm7Ap4LQ6SloZjcPAZ0oc8i9YAgGMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx93DX8oFQ3QNnBxtZFN0zBcDe833Uvz995ewuA7wLLj8pzHjZg
	dWmP07bVHbmHEGPAhL/JVSIi4pH/CGPeuxP2LfTNl52e8OuDszBeNDNj66I/E4p7ysHBM/p0Gyg
	8W/Xy55gGfqaN6BY4sZcSWyVnRAjH/GM=
X-Gm-Gg: AY/fxX54USZ3MB6rHJu7XMeb+Pm55q8RsBEtIlBB/AWAHauCI1Z6pb2hVe/DrfVknMu
	WoyIxPV5lxfcrWHd0koo82q9grpSp3vWH1puy6qcaLfERTseRHPKrp3qFCpAekqun1HGqxapyt2
	fER+mqdIIJa9Ou2qTSaFl54fKGbw0gB5FI0AEd3zQwUaKNjYPOUCxX1zjGkWrNB09AAhhhc8dP0
	299BxiUvm84Z/XP1o9ZcfYx6x1ogO606PAOfma437dSqJAJRWQrfMwJrnDBg0//8DUckbAT
X-Google-Smtp-Source: AGHT+IFWPXcZKnGq0Krk9SV9S7c2h0pNtpTmEWv1Brc1vDiv5zIRm5JUQPWxix5qBNEZM9fT8eFcchz/mGnlgfTZ7QQ=
X-Received: by 2002:a05:6402:430d:b0:64d:170:7976 with SMTP id
 4fb4d7f45d1cf-64d01707bacmr33060451a12.16.1767196183052; Wed, 31 Dec 2025
 07:49:43 -0800 (PST)
MIME-Version: 1.0
References: <20251228124001.3624742-1-rppt@kernel.org> <20251228124001.3624742-2-rppt@kernel.org>
In-Reply-To: <20251228124001.3624742-2-rppt@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 31 Dec 2025 16:49:31 +0100
X-Gm-Features: AQt7F2rayRHt2K_8t_heYN2h4Fxse0t-QPEGBzoKWlAlrWu2fr6sWsAyLE9oYEU
Message-ID: <CA+=Fv5TDfwnu7Qf2y=PLWWN1EvNpNbr8habnTO7R4_caAySDzw@mail.gmail.com>
Subject: Re: [PATCH 01/28] alpha: introduce arch_zone_limits_init()
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_074945_895663_592DC237 
X-CRM114-Status: GOOD (  19.85  )
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

T24gU3VuLCBEZWMgMjgsIDIwMjUgYXQgMTo0MOKAr1BNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoTWljcm9zb2Z0KSIgPHJw
cHRAa2VybmVsLm9yZz4KPgo+IE1vdmUgY2FsY3VsYXRpb25zIG9mIHpvbmUgbGltaXRzIHRvIGEg
ZGVkaWNhdGVkIGFyY2hfem9uZV9saW1pdHNfaW5pdCgpCj4gZnVuY3Rpb24uCj4KPiBMYXRlciBN
TSBjb3JlIHdpbGwgdXNlIHRoaXMgZnVuY3Rpb24gYXMgYW4gYXJjaGl0ZWN0dXJlIHNwZWNpZmlj
IGNhbGxiYWNrCj4gZHVyaW5nIG5vZGVzIGFuZCB6b25lcyBpbml0aWFsaXphdGlvbiBhbmQgdGh1
cyB0aGVyZSB3b24ndCBiZSBhIG5lZWQgdG8KPiBjYWxsIGZyZWVfYXJlYV9pbml0KCkgZnJvbSBl
dmVyeSBhcmNoaXRlY3R1cmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IChNaWNy
b3NvZnQpIDxycHB0QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvYWxwaGEvbW0vaW5pdC5jIHwg
MTUgKysrKysrKysrKy0tLS0tCj4gIGluY2x1ZGUvbGludXgvbW0uaCAgIHwgIDEgKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hbHBoYS9tbS9pbml0LmMgYi9hcmNoL2FscGhhL21tL2luaXQuYwo+IGluZGV4
IDRjNWFiOWNkOGEwYS4uY2QwY2IxYWJkZTVmIDEwMDY0NAo+IC0tLSBhL2FyY2gvYWxwaGEvbW0v
aW5pdC5jCj4gKysrIGIvYXJjaC9hbHBoYS9tbS9pbml0LmMKPiBAQCAtMjA4LDEyICsyMDgsOCBA
QCBjYWxsYmFja19pbml0KHZvaWQgKiBrZXJuZWxfZW5kKQo+ICAgICAgICAgcmV0dXJuIGtlcm5l
bF9lbmQ7Cj4gIH0KPgo+IC0vKgo+IC0gKiBwYWdpbmdfaW5pdCgpIHNldHMgdXAgdGhlIG1lbW9y
eSBtYXAuCj4gLSAqLwo+IC12b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQo+ICt2b2lkIF9f
aW5pdCBhcmNoX3pvbmVfbGltaXRzX2luaXQodW5zaWduZWQgbG9uZyAqbWF4X3pvbmVfcGZuKQo+
ICB7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nIG1heF96b25lX3BmbltNQVhfTlJfWk9ORVNdID0g
ezAsIH07Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGRtYV9wZm47Cj4KPiAgICAgICAgIGRtYV9w
Zm4gPSB2aXJ0X3RvX3BoeXMoKGNoYXIgKilNQVhfRE1BX0FERFJFU1MpID4+IFBBR0VfU0hJRlQ7
Cj4gQEAgLTIyMSw4ICsyMTcsMTcgQEAgdm9pZCBfX2luaXQgcGFnaW5nX2luaXQodm9pZCkKPgo+
ICAgICAgICAgbWF4X3pvbmVfcGZuW1pPTkVfRE1BXSA9IGRtYV9wZm47Cj4gICAgICAgICBtYXhf
em9uZV9wZm5bWk9ORV9OT1JNQUxdID0gbWF4X3BmbjsKPiArfQo+ICsKPiArLyoKPiArICogcGFn
aW5nX2luaXQoKSBzZXRzIHVwIHRoZSBtZW1vcnkgbWFwLgo+ICsgKi8KPiArdm9pZCBfX2luaXQg
cGFnaW5nX2luaXQodm9pZCkKPiArewo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBtYXhfem9uZV9w
Zm5bTUFYX05SX1pPTkVTXSA9IHswLCB9Owo+Cj4gICAgICAgICAvKiBJbml0aWFsaXplIG1lbV9t
YXBbXS4gICovCj4gKyAgICAgICBhcmNoX3pvbmVfbGltaXRzX2luaXQobWF4X3pvbmVfcGZuKTsK
PiAgICAgICAgIGZyZWVfYXJlYV9pbml0KG1heF96b25lX3Bmbik7Cj4KPiAgICAgICAgIC8qIElu
aXRpYWxpemUgdGhlIGtlcm5lbCdzIFpFUk9fUEdFLiAqLwo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBpbmRleCAxNTA3NjI2MWQwYzIuLjYy
OGMwZTBhYzMxMyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKPiArKysgYi9pbmNs
dWRlL2xpbnV4L21tLmgKPiBAQCAtMzU1Miw2ICszNTUyLDcgQEAgc3RhdGljIGlubGluZSB1bnNp
Z25lZCBsb25nIGdldF9udW1fcGh5c3BhZ2VzKHZvaWQpCj4gICAqIGZyZWVfYXJlYV9pbml0KG1h
eF96b25lX3BmbnMpOwo+ICAgKi8KPiAgdm9pZCBmcmVlX2FyZWFfaW5pdCh1bnNpZ25lZCBsb25n
ICptYXhfem9uZV9wZm4pOwo+ICt2b2lkIGFyY2hfem9uZV9saW1pdHNfaW5pdCh1bnNpZ25lZCBs
b25nICptYXhfem9uZV9wZm4pOwo+ICB1bnNpZ25lZCBsb25nIG5vZGVfbWFwX3Bmbl9hbGlnbm1l
bnQodm9pZCk7Cj4gIGV4dGVybiB1bnNpZ25lZCBsb25nIGFic2VudF9wYWdlc19pbl9yYW5nZSh1
bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGVuZF9wZm4pOwo+IC0tCj4gMi41MS4wCj4K
ClRoaXMgbG9va3MgZmluZSB0byBtZSBmcm9tIHRoZSBBbHBoYSBzaWRlLgoKQWNrZWQtYnk6IE1h
Z251cyBMaW5kaG9sbSA8bGlubWFnN0BnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
