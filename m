Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA152CD8C88
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 06:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1FGikUOzVST0uUYmTBBlMuAV58mrT9f7iEVBhlzpQ4=; b=WeHIgXQxlC4UyQ
	uZ39uMerKpyTTH8pMoB8YbfhO1TOCyDULJ0RG+jx3NjIi8OucKlZQNXym8XXAszGwSJ/cw+25cZpF
	9OViHn7luaPE0RnQ//VFe/XNl/px5Z+kkYBdXfGuvfandVfCD4jSQ9BtM78LN5NDRui/qYAbtYYPg
	x0di7thjBuXhrx7zV9dzSiRRCTFLxYm27mdQXRpvRKmaJasiLZyam9Is5qtcc0iHPLICjvwndToJX
	KpWUhUcOmSXOUGEp5MN9l/SR6aNzdzVjfZRLdDE7Rj69LqVbwXl3aLKU9Wh9cX6mRoJJne5Ttoww4
	aAGHE3rtiDjM3U6BV18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6sM-0000000248N-3VbX;
	Sun, 07 Jun 2026 06:20:50 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6sK-00000002476-1nfS
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 06:20:50 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-69de237f0a3so2239591eaf.1
        for <linux-riscv@lists.infradead.org>; Sat, 06 Jun 2026 23:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780813247; cv=none;
        d=google.com; s=arc-20240605;
        b=eDrSSmg1xDXwa05HWQWKTQsiFiflLvdI2cQ6ZDI2fV2yZLS5Nlv+NlffGWw+OXFQz8
         JpuIPcSk8s0mXt2mSXpMxVTvHkNopwZA/z7s6dF7LP7Efu+BErFI41coDDc95B5a2dBQ
         ifsfT7Y1iuJ4fjf4+31AaaCyBYGutv0q+N/sG1JnBw5Wje/1ae8sB45suPJyPzxPvRrm
         024v+AD7gBNM0qhYXt9XXQTd7rpboG5mFuexu4/QmLdrAyi71pVbJnr9GYIdSuAsj/9U
         EPrvsom08BzYDUJJp/h/kCsKmR1R0kB2hxvNHBiB3Z0arnE6gqTGLolIM94c3ChE0ivM
         W7SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gMO+4PHG/t939Q89oLYKxNGAoD1wvOTj1EN3jlptu/4=;
        fh=Q/Z2sPRZXdlPcRPLsGVYzQvOZx+7nawITX4Z1HWFmn4=;
        b=kxTl7MtYD2QpamFPn3+ANq5yVZFpmPLxyHQQ2X2FLz7yjjY4gS7MVd3XDxMtFfXvig
         rwh8XmtDRzvl5+3Wvk4ScZ7Gin2N0Wqdj4H5EWl66ksuno7y6Sy2cgZfI0Tybth9IA47
         c0f7ns7RWEaUuRH3agHMfzfue7pgTtrCRb4Em4vsHD4/5QgTMcWVuidfdlLrewmNfT2O
         P3mKB0hSQ2lkoOa/7EHE83CqyQojfsj+0waT9WaVMqVmE4ivXay5J/267Y22vq5hZoUO
         6TdZN4H6yGZh+Bss1Xr3Pp5jjdRn9+XCN1kxK9Ab0brFEScLog/0CcgpFepnKIJNvucD
         b0Fw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780813247; x=1781418047; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMO+4PHG/t939Q89oLYKxNGAoD1wvOTj1EN3jlptu/4=;
        b=edLfJrLsIAJFtVVWHTTembX1dipUI+iP7HqTetsASNg0/39OyJ3g/+RgVifnLLrO9t
         PlZBGcR7U5CEQRz+mTRPcSIwnO9SBNfuPOhVGosNFTLh/4PKcudnC9aWMDdMqinIwJcE
         /emQg0cRUPQwkSRSoyWY1WkuDHQ6GN8fhiMUEU8CFM73sxsWULMqxU7i9T5vaDgpaB1y
         lBEA2dl497trtbcjzt9hkbd4AYdsEkLa16t5HLc4uzhzSyK6FWheTJ//l00GNnjbxB3G
         oBbJuEc7gpax312BpoFIMAm8nnNlFkDf1k759L+8qCTmt8KD5QjS0pfrs1g4E+kdpoS6
         d52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780813247; x=1781418047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gMO+4PHG/t939Q89oLYKxNGAoD1wvOTj1EN3jlptu/4=;
        b=CnAXV2WQ/arfFgwOanOybh3TUSikNhLC1EUaT3+whqKlEVNV1jARFcZhfxmL/LrVvj
         4MlpxnUm4+V1hNIbR65MgeMfpr5gxz0nMx5S3s0DDNXQCAp3ixxG3E1eiTTAE4N5rx+w
         M4AHI2G5zfHoLCu57ou9rmJjEi46rQiqK2uskLrJ8Rl3Qc8gIIuNTu48RYCoNdsgnAwZ
         UnF/zoO14l4+fB1rWvqnkMJ6/LzvdKsh2ydizsCDeJi+/5AaDlJuLHb4g9waSk1d55nv
         M/sn7x6wy2j+jmPOEXdOQXAvawmbdU+5wuInJ8/yGuYstaHSNtmb1LFP09rfZ9UX9jRh
         5skw==
X-Forwarded-Encrypted: i=1; AFNElJ8cqJYBFBaHrbPDPbN2m7QEJFyWh9/bjhfAtISisEjNGts5PrdggrozZ1wznDaMs+i0HR+avm9Qd4s74Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxJOTJp09KWPmKk96LwYSI5u/dFnQ7fkctON9BHTp3RsAZmBhS
	vM0MaWqt9AYTXxIlF0lVCxjUHknaYy/06/JdKGNKatUMgQxiliOQubzvea7ENrXyeU+scin/O6K
	3Czr2lDqzAlTf5VFeJ17GYVcWe0ku927S/QB84NIOWQ==
X-Gm-Gg: Acq92OEIqqsv/iB1PYIIncfNiE5UdWb4xVSTVHvDaxFUU+zTXrdut260XpQ4L9QnycB
	KNb5CEvEvFp9xfeaagc4chtuia8qEG1FhTESyZDGgmHk3Kf+y/MujZNwLbhj0b2rzkDzo4X+x8x
	B70AHOWtmgabyEBY/CcY2AfikkLG8EVzfnEHV7suPvqRCRaZYdHbiCeRf4GCMGB8d3XRGiPsKTD
	JcpqnYNPc0fZH75mXwtUHX4lSBk5U2njvdBVEUZ46Ox83IwHKokUAJbDmFaJxVDaWNvhNljG8dJ
	pkpkCAkWalJv5dU1JB4dcPh4pMXPF31LVeFq6mh1rCNuLSok8s2t6AHcvIhBZZeccdU97xMpzal
	aBkDO9RdHM1wiEvHqyMmGuSGhLueBBZQLQBUTbw==
X-Received: by 2002:a05:6820:818f:b0:69e:424a:8df1 with SMTP id
 006d021491bc7-69e68b4b285mr5462614eaf.19.1780813247371; Sat, 06 Jun 2026
 23:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260604230317.30501-1-atwufei@163.com> <20260604230317.30501-3-atwufei@163.com>
In-Reply-To: <20260604230317.30501-3-atwufei@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Jun 2026 11:50:35 +0530
X-Gm-Features: AVVi8CcWegt3ZsT9WLUI3VPXbOQxxt07m39USNjLbCcMB0d45zm2TY4QeUPVPog
Message-ID: <CAAhSdy0KLEaCevhDTR-vK4EFZuFV5Nc32eZHhqndOuXkqW4bEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_unmap_range
To: atwufei@163.com
Cc: seanjc@google.com, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Wu Fei <wu.fei9@sanechips.com.cn>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_232048_473628_01ABED1A 
X-CRM114-Status: GOOD (  17.53  )
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

T24gRnJpLCBKdW4gNSwgMjAyNiBhdCA0OjMz4oCvQU0gPGF0d3VmZWlAMTYzLmNvbT4gd3JvdGU6
Cj4KPiBGcm9tOiBXdSBGZWkgPHd1LmZlaTlAc2FuZWNoaXBzLmNvbS5jbj4KPgo+IFNhbWUgYXMg
a3ZtX3Jpc2N2X2dzdGFnZV93cF9yYW5nZSwgdGhlIHBvc3NpYmxlIHZhbGlkIHBhZ2VzIHNob3Vs
ZCBub3QKPiBiZSBza2lwcGVkIGlmICFmb3VuZF9sZWFmLiBEaWZmZXJlbnQgZnJvbSB3cCBjYXNl
LCB3aGljaCBjYW4KPiB3cml0ZS1wcm90ZWN0IG1vcmUgdGhhbiBhc2tlZCwgdW5tYXAgY2FuJ3Qg
ZG8gdGhhdCwgbm8gc3BsaXR0aW5nIGlzCj4gYWRkZWQgcmlnaHQgbm93IGJ1dCBhIHdhcm5pbmcg
aXMgbG9nZ2VkIGluc3RlYWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXdSBGZWkgPHd1LmZlaTlAc2Fu
ZWNoaXBzLmNvbS5jbj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjIKClRoYW5rcywKQW51
cAoKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jIHwgMjAgKysrKysrKysrKysrLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgYi9hcmNoL3Jpc2N2L2t2
bS9nc3RhZ2UuYwo+IGluZGV4IDJiMTQxYTc4ZWNhYy4uZDc4ZjVhZWI4YjQwIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vZ3N0YWdl
LmMKPiBAQCAtMzk1LDE1ICszOTUsMTkgQEAgdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3VubWFwX3Jh
bmdlKHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsCj4gICAgICAgICAgICAgICAgIGlmIChyZXQp
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4KPiAtICAgICAgICAgICAgICAgaWYg
KCFmb3VuZF9sZWFmKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPiAtCj4g
LSAgICAgICAgICAgICAgIGlmICghKGFkZHIgJiAocGFnZV9zaXplIC0gMSkpICYmICgoZW5kIC0g
YWRkcikgPj0gcGFnZV9zaXplKSkKPiAtICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3Zf
Z3N0YWdlX29wX3B0ZShnc3RhZ2UsIGFkZHIsIHB0ZXAsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcHRlcF9sZXZlbCwgR1NUQUdFX09QX0NMRUFSKTsK
PiArICAgICAgICAgICAgICAgaWYgKCFmb3VuZF9sZWFmKSB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgYWRkciA9IEFMSUdOKGFkZHIgKyAxLCBwYWdlX3NpemUpOwo+ICsgICAgICAgICAgICAg
ICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICghKGFkZHIgJiAocGFnZV9z
aXplIC0gMSkpICYmICgoZW5kIC0gYWRkcikgPj0gcGFnZV9zaXplKSkKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2Vfb3BfcHRlKGdzdGFnZSwgYWRkciwg
cHRlcCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHB0ZXBfbGV2ZWwsIEdTVEFHRV9PUF9DTEVBUik7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZWxzZSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXQVJOX09OQ0Uo
MSwgIlNraXAgdW5tYXAgcmFuZ2UgYWRkcjogJSNsbHgsIGVuZDogJSNsbHgsIHBhZ2Vfc2l6ZTog
JSNseFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBhZGRyLCBlbmQsIHBhZ2Vfc2l6ZSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfQo+Cj4g
LW5leHQ6Cj4gLSAgICAgICAgICAgICAgIGFkZHIgKz0gcGFnZV9zaXplOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGFkZHIgKz0gcGFnZV9zaXplOwo+ICsgICAgICAgICAgICAgICB9Cj4KPiAg
ICAgICAgICAgICAgICAgLyoKPiAgICAgICAgICAgICAgICAgICogSWYgdGhlIHJhbmdlIGlzIHRv
byBsYXJnZSwgcmVsZWFzZSB0aGUga3ZtLT5tbXVfbG9jawo+IC0tCj4gMi41MS4wCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
