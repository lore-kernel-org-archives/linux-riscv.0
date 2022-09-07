Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC9FECAAA1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 00:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6xxnWg/LrF9YQXFhCYBscvanMd1XLbHxEXS0DX1kGk=; b=CAHHgwKQB+RwNT
	xK7pXUGcfpD/LiihBZgSDiK+zjSHat86bwJqj47lrvlbpikODgiL9UoSHoHW3lh8LpP4/Eop7Afho
	lEqryjDF+LTB/GEe6MwyJ95ufvc7od5Y7DHh04Fu6vzj2pyCS5xtbCdLSZGtvrqSvmFfLBiRjGjn2
	hqNTDOT7ro/bj9aTp4g0KKnCtsW5otsw4P333RzpMAsX1RpKwynylWxpZO2PQ44gC67NmJV/SPL+k
	+Vr0tb1a+eYwsLo4i6+N3FZTdSChHEWkhToS0KT0rcoB7q73HqgSZVU08oQdQJRA+VsKvLczQjkGM
	/GJkp1bPvOT7Cxtfcczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVjL7-0015R8-7Z; Wed, 07 Sep 2022 00:54:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVjL4-0015Ph-MB
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 00:54:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7376AB818B2
	for <linux-riscv@lists.infradead.org>; Wed,  7 Sep 2022 00:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A7BC433C1
	for <linux-riscv@lists.infradead.org>; Wed,  7 Sep 2022 00:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662512083;
	bh=SC+Hs3+8sgeFMw3h38n6zDv3JRNaTxvHlzp08pJv7mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AfZvJftkz58+dYoPlKIQOYui2EE3NLEiNMsVUyVOPDcFLx1A1GJJELEc0j/IcxGlN
	 KKEeN6x3epysvSiXwdvBb1aKlQ6TuCvUXkZvc2sLdzJxgZW2wOMk/63fFsj1f0UfL2
	 14zHXHsyG7FDi6P/Zbgjm89CJSyLF/siXjw5MakqzgzYJGXithg7iZDldK8UtkmyT6
	 hTTgfB8BFJXycJByF4ZoT2sJX6Wco3Oz1b5YMUCi/XhLfWwjfB5OBeJnRYfAg70J8U
	 S4IqUF9JusZAWX8+12jwOc81IBLinPiqv8W6EyFe48OOjJiOGzKQg/u2O/0dyG3my5
	 R3fVakzz8MHZw==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1225219ee46so32489071fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 17:54:43 -0700 (PDT)
X-Gm-Message-State: ACgBeo3TfsPnA0YNnIsZw3rtO0QspklRa01b2h8dENkSfL+n4Zamd8Di
	JNXUpzpHu6gWyoYJ6N9ladcvQXwUL7GXdhUTEZo=
X-Google-Smtp-Source: AA6agR4GBRHPDj2s0R+HEZdjbGd7h5e0le/7MDXnl/o9xnctQ79UtwCwp+ud8cbAQ+FdUTgmKxCCYwPP5FsrSQfTMmk=
X-Received: by 2002:a05:6870:c596:b0:101:6409:ae62 with SMTP id
 ba22-20020a056870c59600b001016409ae62mr12942331oab.112.1662512082262; Tue, 06
 Sep 2022 17:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220906035423.634617-1-guoren@kernel.org> <8db7caea-a1a0-25a3-ade0-2f1714d709c8@microchip.com>
In-Reply-To: <8db7caea-a1a0-25a3-ade0-2f1714d709c8@microchip.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 7 Sep 2022 08:54:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ29bn=hgubC+YU1qSw_L3W2kAt3Yi4_EknrNCkR-dRFg@mail.gmail.com>
Message-ID: <CAJF2gTQ29bn=hgubC+YU1qSw_L3W2kAt3Yi4_EknrNCkR-dRFg@mail.gmail.com>
Subject: Re: [PATCH V3 0/7] riscv: Add GENERIC_ENTRY, irq stack support
To: Conor.Dooley@microchip.com
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, bigeasy@linutronix.de, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_175447_043798_C7A14347 
X-CRM114-Status: GOOD (  19.72  )
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

T24gV2VkLCBTZXAgNywgMjAyMiBhdCAxOjQyIEFNIDxDb25vci5Eb29sZXlAbWljcm9jaGlwLmNv
bT4gd3JvdGU6Cj4KPiBPbiAwNi8wOS8yMDIyIDA0OjU0LCBndW9yZW5Aa2VybmVsLm9yZyB3cm90
ZToKPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBU
aGUgcGF0Y2hlcyBjb252ZXJ0IHJpc2N2IHRvIHVzZSB0aGUgZ2VuZXJpYyBlbnRyeSBpbmZyYXN0
cnVjdHVyZSBmcm9tCj4gPiBrZXJuZWwvZW50cnkvKi4gQWRkIGluZGVwZW5kZW50IGlycSBzdGFj
a3MgKElSUV9TVEFDS1MpIGZvciBwZXJjcHUgdG8KPiA+IHByZXZlbnQga2VybmVsIHN0YWNrIG92
ZXJmbG93cy4gQWRkIHRoZSBIQVZFX1NPRlRJUlFfT05fT1dOX1NUQUNLCj4gPiBmZWF0dXJlIGZv
ciB0aGUgSVJRX1NUQUNLUyBjb25maWcuIFlvdSBjYW4gdHJ5IGl0IGRpcmVjdGx5IHdpdGggWzFd
Lgo+Cj4gSGV5IEd1byBSZW4sCj4gSSBhcHBsaWVkIHRoaXMgcGF0Y2hzZXQgdG8gdjYuMC1yYzQg
JiByYW4gaW50byBhIGJ1aWxkIGVycm9yOgo+IC9zdHVmZi9saW51eC9hcmNoL3Jpc2N2L2tlcm5l
bC9lbnRyeS5TOjM0Nzo5OiBlcnJvcjogb3BlcmFuZCBtdXN0IGJlIGEgYmFyZSBzeW1ib2wgbmFt
ZQo+ICBsYSBhMywgKCgxIDw8ICgxMikpIDw8ICgyICsgMCkpClllcywgcGxlYXNlIHRyeToKLSAg
ICAgICBsYSAgICAgIGEzLCBJUlFfU1RBQ0tfU0laRQorICAgICAgIGxpICAgICAgYTMsIElSUV9T
VEFDS19TSVpFCgpsYSBpcyBmb3IgdGhlIHN5bWJvbCwgbm90IGltbWVkaWF0ZS4gQnV0IHdoeSBk
b2VzIG15IHRvb2xjaGFpbiBub3QKcmVwb3J0IHRoZSBlcnJvcj8KCuKenCAgbGludXggZ2l0Oihn
ZW5lcmljX2VudHJ5X3YzKSBtYWtlIEFSQ0g9cmlzY3YKQ1JPU1NfQ09NUElMRT1yaXNjdjY0LXVu
a25vd24tbGludXgtZ251LSBFWFRSQV9DRkxBR1MrPS1nCk89Li4vYnVpbGQtcmlzY3YvIC1rajYy
IGFsbCAta2oK4p6cICBsaW51eCBnaXQ6KGdlbmVyaWNfZW50cnlfdjMpIHJpc2N2NjQtdW5rbm93
bi1saW51eC1nbnUtZ2NjIC12ClVzaW5nIGJ1aWx0LWluIHNwZWNzLgpDT0xMRUNUX0dDQz1yaXNj
djY0LXVua25vd24tbGludXgtZ251LWdjYwpDT0xMRUNUX0xUT19XUkFQUEVSPS9vcHQvcmlzY3Yv
bGliZXhlYy9nY2MvcmlzY3Y2NC11bmtub3duLWxpbnV4LWdudS8xMS4xLjAvbHRvLXdyYXBwZXIK
VGFyZ2V0OiByaXNjdjY0LXVua25vd24tbGludXgtZ251CkNvbmZpZ3VyZWQgd2l0aDoKL2hvbWUv
Z3VvcmVuL3NvdXJjZS9yaXNjdi1nbnUtdG9vbGNoYWluL3Jpc2N2LWdjYy9jb25maWd1cmUKLS10
YXJnZXQ9cmlzY3Y2NC11bmtub3duLWxpbnV4LWdudSAtLXByZWZpeD0vb3B0L3Jpc2N2Ci0td2l0
aC1zeXNyb290PS9vcHQvcmlzY3Yvc3lzcm9vdCAtLXdpdGgtcGtndmVyc2lvbj1nNTk2NGI1Y2Q3
MjcyCi0td2l0aC1zeXN0ZW0temxpYiAtLWVuYWJsZS1zaGFyZWQgLS1lbmFibGUtdGxzCi0tZW5h
YmxlLWxhbmd1YWdlcz1jLGMrKyxmb3J0cmFuIC0tZGlzYWJsZS1saWJtdWRmbGFwIC0tZGlzYWJs
ZS1saWJzc3AKLS1kaXNhYmxlLWxpYnF1YWRtYXRoIC0tZGlzYWJsZS1saWJzYW5pdGl6ZXIgLS1k
aXNhYmxlLW5scwotLWRpc2FibGUtYm9vdHN0cmFwIC0tc3JjPS4uLy4vcmlzY3YtZ2NjIC0tZW5h
YmxlLW11bHRpbGliCi0td2l0aC1hYmk9bHA2NGQgLS13aXRoLWFyY2g9cnY2NGltYWZkYyAtLXdp
dGgtdHVuZT1yb2NrZXQKLS13aXRoLWlzYS1zcGVjPTIuMiAnQ0ZMQUdTX0ZPUl9UQVJHRVQ9LU8y
ICAgLW1jbW9kZWw9bWVkbG93JwonQ1hYRkxBR1NfRk9SX1RBUkdFVD0tTzIgICAtbWNtb2RlbD1t
ZWRsb3cnClRocmVhZCBtb2RlbDogcG9zaXgKU3VwcG9ydGVkIExUTyBjb21wcmVzc2lvbiBhbGdv
cml0aG1zOiB6bGliCmdjYyB2ZXJzaW9uIDExLjEuMCAoZzU5NjRiNWNkNzI3MikKCgoKPiAgICAg
ICAgIF4KPiAgIENDICAgICAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5vCj4gbWFrZVs1XTog
KioqIFsvc3R1ZmYvbGludXgvc2NyaXB0cy9NYWtlZmlsZS5idWlsZDozMjI6IGFyY2gvcmlzY3Yv
a2VybmVsL2VudHJ5Lm9dIEVycm9yIDEKPiBtYWtlWzVdOiAqKiogV2FpdGluZyBmb3IgdW5maW5p
c2hlZCBqb2JzLi4uLgo+Cj4gVGhhbmtzLAo+IENvbm9yLgo+ID4KPiA+IFsxXSBodHRwczovL2dp
dGh1Yi5jb20vZ3VvcmVuODMvbGludXgvdHJlZS9nZW5lcmljX2VudHJ5X3YzCj4gPgo+ID4gVjM6
Cj4gPiAgLSBGaXh1cCBDT05GSUdfQ09NUEFUPW4gY29tcGlsZSBlcnJvcgo+ID4gIC0gQWRkIFRI
UkVBRF9TSVpFX09SREVSIGNvbmZpZwo+ID4gIC0gT3B0aW1pemUgZWxmX2tleGVjLmMgd2Fybmlu
ZyBmaXh1cAo+ID4gIC0gQWRkIHN0YXRpYyB0byBpcnFfc3RhY2tfcHRyIGRlZmluaXRpb24KPiA+
Cj4gPiBWMjoKPiA+ICBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8y
MDIyMDkwNDA3MjYzNy44NjE5LTEtZ3VvcmVuQGtlcm5lbC5vcmcvCj4gPiAgLSBGaXh1cCBjb21w
aWxlIGVycm9yIGJ5IGluY2x1ZGUgInJpc2N2OiBwdHJhY2U6IFJlbW92ZSBkdXBsaWNhdGUKPiA+
ICAgIG9wZXJhdGlvbiIKPiA+ICAtIEZpeHVwIGNvbXBpbGUgd2FybmluZwo+ID4gICAgUmVwb3J0
ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+ID4gIC0gQWRkIHRlc3Qg
cmVwbyBsaW5rIGluIGNvdmVyIGxldHRlcgo+ID4KPiA+IFYxOgo+ID4gIExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIwOTAzMTYzODA4LjE5NTQxMzEtMS1ndW9y
ZW5Aa2VybmVsLm9yZy8KPiA+Cj4gPiBHdW8gUmVuICg3KToKPiA+ICAgcmlzY3Y6IGVsZl9rZXhl
YzogRml4dXAgY29tcGlsZSB3YXJuaW5nCj4gPiAgIHJpc2N2OiBjb21wYXRfc3lzY2FsbF90YWJs
ZTogRml4dXAgY29tcGlsZSB3YXJuaW5nCj4gPiAgIHJpc2N2OiBwdHJhY2U6IFJlbW92ZSBkdXBs
aWNhdGUgb3BlcmF0aW9uCj4gPiAgIHJpc2N2OiBjb252ZXJ0IHRvIGdlbmVyaWMgZW50cnkKPiA+
ICAgcmlzY3Y6IFN1cHBvcnQgSEFWRV9JUlFfRVhJVF9PTl9JUlFfU1RBQ0sKPiA+ICAgcmlzY3Y6
IFN1cHBvcnQgSEFWRV9TT0ZUSVJRX09OX09XTl9TVEFDSwo+ID4gICByaXNjdjogQWRkIGNvbmZp
ZyBvZiB0aHJlYWQgc3RhY2sgc2l6ZQo+ID4KPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAg
ICAgICAgICAgICAgIHwgIDE5ICsrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAg
ICAgICAgICB8ICAgMSAtCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24u
aCB8ICAgOCArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pcnEuaCAgICAgICAgICB8ICAg
MyArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wdHJhY2UuaCAgICAgICB8ICAxMCArLQo+
ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2t0cmFjZS5oICAgfCAgIDUgKwo+ID4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc3lzY2FsbC5oICAgICAgfCAgIDYgKwo+ID4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCAgfCAgMTkgKy0KPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3ZtYXBfc3RhY2suaCAgIHwgIDI4ICsrKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVs
L01ha2VmaWxlICAgICAgICAgICAgfCAgIDEgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2VsZl9r
ZXhlYy5jICAgICAgICAgfCAgIDIgKy0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TICAg
ICAgICAgICAgIHwgMjU1ICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgYXJjaC9yaXNj
di9rZXJuZWwvaXJxLmMgICAgICAgICAgICAgICB8ICA3NSArKysrKysrKwo+ID4gIGFyY2gvcmlz
Y3Yva2VybmVsL3B0cmFjZS5jICAgICAgICAgICAgfCAgNDEgLS0tLS0KPiA+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9zaWduYWwuYyAgICAgICAgICAgIHwgIDIxICstLQo+ID4gIGFyY2gvcmlzY3Yva2Vy
bmVsL3N5c19yaXNjdi5jICAgICAgICAgfCAgMjcgKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYyAgICAgICAgICAgICB8ICAxMSArKwo+ID4gIGFyY2gvcmlzY3YvbW0vZmF1bHQuYyAg
ICAgICAgICAgICAgICAgfCAgMTIgKy0KPiA+ICAxOCBmaWxlcyBjaGFuZ2VkLCAyNTkgaW5zZXJ0
aW9ucygrKSwgMjg1IGRlbGV0aW9ucygtKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdm1hcF9zdGFjay5oCj4gPgoKCgotLSAKQmVzdCBSZWdhcmRz
CiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
