Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951BBC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 16:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljCWygWbvxU8z6lerHg76u+MyBtgjqHNiN/gcwV15Bc=; b=toqYzcBtF8qP9p
	/grhndKjHbCv4xXyq4AErOou2SKNaymQ0YWVpnUA802fY5AfYwPnXHoVlY5yBd9ZeZQ1rKQaStD5q
	Eqy5sVp/HXR0HapkJ2+YpTk3CLpahoCJYZBibjHW2kOGmXoZsg71TdrRWEzD2cWhX3/m6KTmrvwD8
	Gkskc9Gprz7HiIkb6IEGrwfDEXYymwda6eE5zgZ8DVlDxn7LJOoQk5tdQEhf/vZKHUbH3o9ksQQI5
	vBu/bwu6XUzIbk2qOLLv0qiyW62VSwh+S9knLIBSfA7+G+1V/BLdM2RgBHm0gPDpiOWlxIR2HaaZ8
	h/Pf51asijytKM3MBQ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8lre-001dSn-MP; Tue, 05 Jul 2022 16:57:30 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8lrY-001dQG-MM
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 16:57:28 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 89-20020a17090a09e200b001ef7638e536so9291008pjo.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=suog/Gt5RDjFtkrl4zqgyYgxAM6ZJ7RwwJ+iiXEHGDA=;
        b=30WT+a+ickLPvR0veV/l7naQmoMAChOHusPk+6991l1bwpbrJJB+icKscul1hvjrmN
         Cp++i+Shtv56uPjoH0gZegia9ZbDKgFN0/lH3BRHga5spXjA+dE8vNqoag530DqDYvf3
         5cY8A/AG4h2VRn9lC/0mZNQG5JZvh9MNOFUd8I0A5BWTKon0uF1o0hHLnx54as9C8oMJ
         O/w00lHYVBHqgFBaNDw1NZVE0qXYXCedHh3da0Q/jC89Sffvg/b0TngUKAC/EDx2Lyt9
         zo2sJ+V0XlXjRMR8kjkHVWbs1TVdyxvs3gJin5a1jfi0DeQ4McYCrqyUYcnKpCOsmiPN
         PtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=suog/Gt5RDjFtkrl4zqgyYgxAM6ZJ7RwwJ+iiXEHGDA=;
        b=br8+4HZcjus55b04to3NbPCpGOfFvCbIV2kNI3KSseTwziHDKgyGNTrgrJwomoYjIU
         jceoNFhhU8A1j5ki1fHmQ2t/+SZmT/nxEcKRdxGdX0pgXMgzB/87Hlf5FLGZG9Qw34lX
         QSNBXwU5TJ4yeztGf5hVLjDbx9yujdlhdIyMOYuV4He+jCrtAI3uZ68bm5b9TIlfCQLe
         XzAUgZIigBS7lpw5UDsQP8Q1DkLUPMZ8IhDkjZ7u0edNaUTymTHQdxACfbGlMcn3nRh3
         OWNSqdLPGV5cVPhGUCKoHgIoyIobk5GCBYXplTP+/seNCAR1wiV4C6Gt2ur8/oFeq1dn
         LeXg==
X-Gm-Message-State: AJIora/j8cnXPT+uw4ilL8QKgTPRi1W28aRFOqR3RVBi07t6RNlurqEI
	pE070gAfQacYeyLhQACCPuKS9VDsv458OmR5PzYiIg==
X-Google-Smtp-Source: AGRyM1uQ3O1qx4NqOTNb5IarEbJ7DDPPdjkSvs285qAyDb0Ss+FWbljh2cbwuNY3UcJeaV7x711QLVGfZhtEnvk8mns=
X-Received: by 2002:a17:902:e544:b0:16b:fcbe:7ba1 with SMTP id
 n4-20020a170902e54400b0016bfcbe7ba1mr517528plf.130.1657040241622; Tue, 05 Jul
 2022 09:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220620201530.3929352-1-daolu@rivosinc.com>
In-Reply-To: <20220620201530.3929352-1-daolu@rivosinc.com>
From: Dao Lu <daolu@rivosinc.com>
Date: Tue, 5 Jul 2022 09:57:11 -0700
Message-ID: <CAKh7v-TfWBRiB6Jf0ke4Er68i_pVbvMtR-Xvvy=bdbJO4tKHvg@mail.gmail.com>
Subject: Re: [PATCH v4] arch/riscv: add Zihintpause support
To: linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Niklas Cassel <niklas.cassel@wdc.com>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
	Alexandre Ghiti <alexandre.ghiti@canonical.com>, Rob Herring <robh@kernel.org>, 
	Tsukasa OI <research_trasio@irq.a4lg.com>, Yury Norov <yury.norov@gmail.com>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_095724_970169_B23CDCF2 
X-CRM114-Status: GOOD (  24.80  )
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

cGluZwoKT24gTW9uLCBKdW4gMjAsIDIwMjIgYXQgMToxNSBQTSBEYW8gTHUgPGRhb2x1QHJpdm9z
aW5jLmNvbT4gd3JvdGU6Cj4KPiBJbXBsZW1lbnQgc3VwcG9ydCBmb3IgdGhlIFppSGludFBhdXNl
IGV4dGVuc2lvbi4KPgo+IFRoZSBQQVVTRSBpbnN0cnVjdGlvbiBpcyBhIEhJTlQgdGhhdCBpbmRp
Y2F0ZXMgdGhlIGN1cnJlbnQgaGFydOKAmXMgcmF0ZQo+IG9mIGluc3RydWN0aW9uIHJldGlyZW1l
bnQgc2hvdWxkIGJlIHRlbXBvcmFyaWx5IHJlZHVjZWQgb3IgcGF1c2VkLgo+Cj4gUmV2aWV3ZWQt
Ynk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gVGVzdGVkLWJ5OiBIZWlrbyBT
dHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+IFNpZ25lZC1vZmYtYnk6IERhbyBMdSA8ZGFvbHVA
cml2b3NpbmMuY29tPgo+IC0tLQo+Cj4gdjEgLT4gdjI6Cj4gIFJlbW92ZSB0aGUgdXNhZ2Ugb2Yg
c3RhdGljIGJyYW5jaCwgdXNlIFBBVVNFIGlmIHRvb2xjaGFpbiBzdXBwb3J0cyBpdAo+IHYyIC0+
IHYzOgo+ICBBZGRlZCB0aGUgc3RhdGljIGJyYW5jaCBiYWNrLCBjcHVfcmVsYXgoKSBiZWhhdmlv
ciBpcyBrZXB0IHRoZSBzYW1lIGZvcgo+IHN5c3RlbXMgdGhhdCBkbyBub3Qgc3VwcG9ydCBaaUhp
bnRQYXVzZQo+IHYzIC0+IHY0Ogo+ICBBZG9wdGVkIHRoZSBuZXdseSBhZGRlZCB1bmlmaWVkIHN0
YXRpYyBrZXlzIGZvciBleHRlbnNpb25zCj4gLS0tCj4gIGFyY2gvcmlzY3YvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICB8ICA0ICsrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oICAgICAgICAgIHwgIDUgKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3By
b2Nlc3Nvci5oIHwgMjEgKysrKysrKysrKysrKysrKysrLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVs
L2NwdS5jICAgICAgICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jICAgICAgICAgIHwgIDEgKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmlsZSBi
L2FyY2gvcmlzY3YvTWFrZWZpbGUKPiBpbmRleCAzNGNmOGE1OTg2MTcuLjZkZGFjYzZmNDRiOSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9NYWtl
ZmlsZQo+IEBAIC01Niw2ICs1NiwxMCBAQCByaXNjdi1tYXJjaC0kKENPTkZJR19SSVNDVl9JU0Ff
QykgICAgOj0gJChyaXNjdi1tYXJjaC15KWMKPiAgdG9vbGNoYWluLW5lZWQtemljc3ItemlmZW5j
ZWkgOj0gJChjYWxsIGNjLW9wdGlvbi15biwgLW1hcmNoPSQocmlzY3YtbWFyY2gteSlfemljc3Jf
emlmZW5jZWkpCj4gIHJpc2N2LW1hcmNoLSQodG9vbGNoYWluLW5lZWQtemljc3ItemlmZW5jZWkp
IDo9ICQocmlzY3YtbWFyY2gteSlfemljc3JfemlmZW5jZWkKPgo+ICsjIENoZWNrIGlmIHRoZSB0
b29sY2hhaW4gc3VwcG9ydHMgWmloaW50cGF1c2UgZXh0ZW5zaW9uCj4gK3Rvb2xjaGFpbi1zdXBw
b3J0cy16aWhpbnRwYXVzZSA6PSAkKGNhbGwgY2Mtb3B0aW9uLXluLCAtbWFyY2g9JChyaXNjdi1t
YXJjaC15KV96aWhpbnRwYXVzZSkKPiArcmlzY3YtbWFyY2gtJCh0b29sY2hhaW4tc3VwcG9ydHMt
emloaW50cGF1c2UpIDo9ICQocmlzY3YtbWFyY2gteSlfemloaW50cGF1c2UKPiArCj4gIEtCVUlM
RF9DRkxBR1MgKz0gLW1hcmNoPSQoc3Vic3QgZmQsLCQocmlzY3YtbWFyY2gteSkpCj4gIEtCVUlM
RF9BRkxBR1MgKz0gLW1hcmNoPSQocmlzY3YtbWFyY2gteSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2Fw
LmgKPiBpbmRleCBlNDhlZWJkZDI2MzEuLmRjNDcwMTlhMGIzOCAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3Y2FwLmgKPiBAQCAtOCw2ICs4LDcgQEAKPiAgI2lmbmRlZiBfQVNNX1JJU0NWX0hXQ0FQX0gK
PiAgI2RlZmluZSBfQVNNX1JJU0NWX0hXQ0FQX0gKPgo+ICsjaW5jbHVkZSA8YXNtL2Vycm5vLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9iaXRzLmg+Cj4gICNpbmNsdWRlIDx1YXBpL2FzbS9od2NhcC5o
Pgo+Cj4gQEAgLTU0LDYgKzU1LDcgQEAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgZWxmX2h3Y2FwOwo+
ICBlbnVtIHJpc2N2X2lzYV9leHRfaWQgewo+ICAgICAgICAgUklTQ1ZfSVNBX0VYVF9TU0NPRlBN
RiA9IFJJU0NWX0lTQV9FWFRfQkFTRSwKPiAgICAgICAgIFJJU0NWX0lTQV9FWFRfU1ZQQk1ULAo+
ICsgICAgICAgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSwKPiAgICAgICAgIFJJU0NWX0lTQV9F
WFRfSURfTUFYID0gUklTQ1ZfSVNBX0VYVF9NQVgsCj4gIH07Cj4KPiBAQCAtNjQsNiArNjYsNyBA
QCBlbnVtIHJpc2N2X2lzYV9leHRfaWQgewo+ICAgKi8KPiAgZW51bSByaXNjdl9pc2FfZXh0X2tl
eSB7Cj4gICAgICAgICBSSVNDVl9JU0FfRVhUX0tFWV9GUFUsICAgICAgICAgIC8qIEZvciAnRicg
YW5kICdEJyAqLwo+ICsgICAgICAgUklTQ1ZfSVNBX0VYVF9LRVlfWklISU5UUEFVU0UsCj4gICAg
ICAgICBSSVNDVl9JU0FfRVhUX0tFWV9NQVgsCj4gIH07Cj4KPiBAQCAtODMsNiArODYsOCBAQCBz
dGF0aWMgX19hbHdheXNfaW5saW5lIGludCByaXNjdl9pc2FfZXh0MmtleShpbnQgbnVtKQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gUklTQ1ZfSVNBX0VYVF9LRVlfRlBVOwo+ICAgICAgICAgY2Fz
ZSBSSVNDVl9JU0FfRVhUX2Q6Cj4gICAgICAgICAgICAgICAgIHJldHVybiBSSVNDVl9JU0FfRVhU
X0tFWV9GUFU7Cj4gKyAgICAgICBjYXNlIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0U6Cj4gKyAg
ICAgICAgICAgICAgIHJldHVybiBSSVNDVl9JU0FfRVhUX0tFWV9aSUhJTlRQQVVTRTsKPiAgICAg
ICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAgICAg
fQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKPiBpbmRleCAxMzQzODhj
YmFhYTEuLjFlNGY4YjRhZWY3OSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3Zkc28vcHJvY2Vzc29yLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJv
Y2Vzc29yLmgKPiBAQCAtNCwxNSArNCwzMCBAQAo+Cj4gICNpZm5kZWYgX19BU1NFTUJMWV9fCj4K
PiArI2luY2x1ZGUgPGxpbnV4L2p1bXBfbGFiZWwuaD4KPiAgI2luY2x1ZGUgPGFzbS9iYXJyaWVy
Lmg+Cj4gKyNpbmNsdWRlIDxhc20vaHdjYXAuaD4KPgo+ICBzdGF0aWMgaW5saW5lIHZvaWQgY3B1
X3JlbGF4KHZvaWQpCj4gIHsKPiArICAgICAgIGlmICghc3RhdGljX2JyYW5jaF9saWtlbHkoJnJp
c2N2X2lzYV9leHRfa2V5c1tSSVNDVl9JU0FfRVhUX0tFWV9aSUhJTlRQQVVTRV0pKSB7Cj4gICNp
ZmRlZiBfX3Jpc2N2X211bGRpdgo+IC0gICAgICAgaW50IGR1bW15Owo+IC0gICAgICAgLyogSW4g
bGlldSBvZiBhIGhhbHQgaW5zdHJ1Y3Rpb24sIGluZHVjZSBhIGxvbmctbGF0ZW5jeSBzdGFsbC4g
Ki8KPiAtICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgiZGl2ICUwLCAlMCwgemVybyIgOiAi
PXIiIChkdW1teSkpOwo+ICsgICAgICAgICAgICAgICBpbnQgZHVtbXk7Cj4gKyAgICAgICAgICAg
ICAgIC8qIEluIGxpZXUgb2YgYSBoYWx0IGluc3RydWN0aW9uLCBpbmR1Y2UgYSBsb25nLWxhdGVu
Y3kgc3RhbGwuICovCj4gKyAgICAgICAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgiZGl2
ICUwLCAlMCwgemVybyIgOiAiPXIiIChkdW1teSkpOwo+ICAjZW5kaWYKPiArICAgICAgIH0gZWxz
ZSB7Cj4gKyAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAqIFJlZHVjZSBpbnN0
cnVjdGlvbiByZXRpcmVtZW50Lgo+ICsgICAgICAgICAgICAgICAgKiBUaGlzIGFzc3VtZXMgdGhl
IFBDIGNoYW5nZXMuCj4gKyAgICAgICAgICAgICAgICAqLwo+ICsjaWZkZWYgX19yaXNjdl96aWhp
bnRwYXVzZQo+ICsgICAgICAgICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoInBhdXNlIik7
Cj4gKyNlbHNlCj4gKyAgICAgICAgICAgICAgIC8qIEVuY29kaW5nIG9mIHRoZSBwYXVzZSBpbnN0
cnVjdGlvbiAqLwo+ICsgICAgICAgICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoIi40Ynl0
ZSAweDEwMDAwMEYiKTsKPiArI2VuZGlmCj4gKyAgICAgICB9Cj4gICAgICAgICBiYXJyaWVyKCk7
Cj4gIH0KPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdS5jCj4gaW5kZXggZmJhOWU5ZjQ2YThjLi5hMTIzZTkyYjE0ZGQgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHUuYwo+IEBAIC04OSw2ICs4OSw3IEBAIGludCByaXNjdl9vZl9wYXJlbnRfaGFydGlkKHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKPiAgc3RhdGljIHN0cnVjdCByaXNjdl9pc2FfZXh0X2Rh
dGEgaXNhX2V4dF9hcnJbXSA9IHsKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzY29m
cG1mLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1GKSwKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHN2cGJtdCwgUklTQ1ZfSVNBX0VYVF9TVlBCTVQpLAo+ICsgICAgICAgX19SSVNDVl9JU0Ff
RVhUX0RBVEEoemloaW50cGF1c2UsIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UpLAo+ICAgICAg
ICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoIiIsIFJJU0NWX0lTQV9FWFRfTUFYKSwKPiAgfTsKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBpbmRleCAxYjNlYzQ0ZTI1ZjUuLjcwOGRmMmMwYmMzNCAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBAQCAtMTk4LDYgKzE5OCw3IEBAIHZvaWQgX19p
bml0IHJpc2N2X2ZpbGxfaHdjYXAodm9pZCkKPiAgICAgICAgICAgICAgICAgICAgICAgICB9IGVs
c2Ugewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0VUX0lTQV9FWFRfTUFQKCJz
c2NvZnBtZiIsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYpOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgU0VUX0lTQV9FWFRfTUFQKCJzdnBibXQiLCBSSVNDVl9JU0FfRVhUX1NWUEJN
VCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTRVRfSVNBX0VYVF9NQVAoInpp
aGludHBhdXNlIiwgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSk7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgfQo+ICAjdW5kZWYgU0VUX0lTQV9FWFRfTUFQCj4gICAgICAgICAgICAgICAgIH0K
PiAtLQo+IDIuMjUuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
