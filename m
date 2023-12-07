Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C1AC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 15:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+arHlG31o1j2V9I3iOlsVXjwLuef8r4iRS/uhB/UbFI=; b=yBGyqXc+mzBmj5
	A6l8Y0RTYPEb0L12CJtFCKE9+NdQFOHi+RVKeNmiETlU3p0wap+Bbq6icLK2MdsmsOOMmzfGwirBd
	T0xj5/V/yzZ3yepSBpuRER981J0pz35InvBE6B0DCXo6e95uGizYOflIyS9/gtFmukvg/U7GwSqUl
	9Y78TBxn77Bn9ISLDm/RCsZ2TSZEDgNeX15S80MXcsedllou/z5+V/iggTHROMd6a6hwCJTppXOmM
	t94blBSqUoIbctsXfi23zvPbwoYr1xJQeJ4xvWRcBn4XIeSPyDOchCdI4rpEz8zxxPUtRM3f/QrOn
	xUKygsTJ2Y97mg/d9hTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGLj-00DCbX-0I;
	Thu, 07 Dec 2023 15:31:39 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGLg-00DCZt-0Z
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 15:31:37 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c9fe0ef02aso8544001fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 07:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701963091; x=1702567891; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtiqskbcnjDsrUAbUuslefnc5brEtYif6q3+FyG2PFY=;
        b=KF2KL9IxilVqdZeoL9wvQr0p25LNFowgUxY+Lw76L4ExdhP1w6GhbYVfE3WO/ZO/MK
         RQBU5u3tj/P/J7A4pMr0JIVkfeEm4Z8VJ5vmf1JpomeLGpB41P3BpREj74XAZwwq/tF4
         hdgiVxytrw7yNYrY1iaHOrhrMsp0iB2J9w1NN5MNNIYDSO5exKGZveUSdpXVG/nDhSpc
         nlYEyjjb2npJc2Higxu35GeLyIoN/TkJrCBdrCfZ9lSE6ordKj89q9hUwAu5lhJvqmr4
         Ve06YqMUK47n65rkYERqttupFifDrTzkKEjEKHS7xWPYkdKSNZ580ac3Qwmm2pObhQaq
         7aCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701963091; x=1702567891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtiqskbcnjDsrUAbUuslefnc5brEtYif6q3+FyG2PFY=;
        b=C7OQDJ9ja3P9MIqvS7jjWb+DCq6mQciEd0GQrjAxefX0kvG8afUehAU+NRgqp+Vqbj
         HQcDpaKKoAH6ylREgmTd2UlWERzfugJnt25iDNVQvfa1arAUaD6j7Xh2TmC8ZaiKmjTK
         ANpStmNv1b7XHo4wo7d2c3kfgwYme0lVaoUjHARBKZkKig99AVm6LASXoDDUgOhikW1+
         1lv4duJ0qK2ao+IS9lb/0UH8WjVB3tueiQrcdXp/MNJLA1Psr5JS/0+wIXOtxG71oYK7
         fayPp++t6CU6jR/YjhYTvMxvPDbgN3yruwAhBc90k1xzr5Ouz3QNO16JfMl/KfCYiJzd
         OOrg==
X-Gm-Message-State: AOJu0YxSQ2xiRIOVjzBQ1lp9+WvjY1dRAIfnL5ND79Im8fO746JWqE5R
	I537XuKKNt/ZbDj62xPzB2LW2tXIhld3xz9fefgfSw==
X-Google-Smtp-Source: AGHT+IFlA9HTmihxqP9eI8R5gPdPM/Z8JG8U15RyZk88XiZ+K7z6TR3eNC4WO8VGtec4ngEHJsTq9LU+nvqWPHIWwIA=
X-Received: by 2002:a05:6512:4015:b0:50b:f52b:e337 with SMTP id
 br21-20020a056512401500b0050bf52be337mr4185096lfb.1.1701963091444; Thu, 07
 Dec 2023 07:31:31 -0800 (PST)
MIME-Version: 1.0
References: <20231206074155.GA43833@sol.localdomain> <mhng-9f5b6a98-57f4-40a8-becc-93319bbed97c@palmer-ri-x1c9>
In-Reply-To: <mhng-9f5b6a98-57f4-40a8-becc-93319bbed97c@palmer-ri-x1c9>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 7 Dec 2023 23:31:19 +0800
Message-ID: <CABgGipVad0ohfhWc4tA0865atKLMLazwJ4u-3e3MF=aesVKQSg@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] RISC-V: provide some accelerated cryptography
 implementations using vector extensions
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ebiggers@kernel.org, jerry.shih@sifive.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	herbert@gondor.apana.org.au, davem@davemloft.net, 
	Conor Dooley <conor.dooley@microchip.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Conor Dooley <conor@kernel.org>, heiko@sntech.de, phoebe.chen@sifive.com, 
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_073136_266742_34968CF4 
X-CRM114-Status: GOOD (  41.49  )
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

SGkgUGFsbWVyLAoKT24gVGh1LCBEZWMgNywgMjAyMyBhdCAxOjA34oCvQU0gUGFsbWVyIERhYmJl
bHQgPHBhbG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDA1IERlYyAyMDIzIDIz
OjQxOjU1IFBTVCAoLTA4MDApLCBlYmlnZ2Vyc0BrZXJuZWwub3JnIHdyb3RlOgo+ID4gSGkgSmVy
cnksCj4gPgo+ID4gT24gV2VkLCBEZWMgMDYsIDIwMjMgYXQgMDM6MDI6NDBQTSArMDgwMCwgSmVy
cnkgU2hpaCB3cm90ZToKPiA+PiBPbiBEZWMgNiwgMjAyMywgYXQgMDg6NDYsIEVyaWMgQmlnZ2Vy
cyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4gPiBPbiBUdWUsIERlYyAwNSwgMjAy
MyBhdCAwNToyNzo0OVBNICswODAwLCBKZXJyeSBTaGloIHdyb3RlOgo+ID4+ID4+IFRoaXMgc2Vy
aWVzIGRlcGVuZCBvbjoKPiA+PiA+PiAyLiBzdXBwb3J0IGtlcm5lbC1tb2RlIHZlY3Rvcgo+ID4+
ID4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDcyMTExMjg1NS4xMDA2
LTEtYW5keS5jaGl1QHNpZml2ZS5jb20vCj4gPj4gPj4gMy4gdmVjdG9yIGNyeXB0byBleHRlbnNp
b25zIGRldGVjdGlvbgo+ID4+ID4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
MjAyMzEwMTcxMzE0NTYuMjA1MzM5Ni0xLWNsZWdlckByaXZvc2luYy5jb20vCj4gPj4gPgo+ID4+
ID4gV2hhdCdzIHRoZSBzdGF0dXMgb2YgZ2V0dGluZyB0aGVzZSBwcmVyZXF1aXNpdGVzIG1lcmdl
ZD8KPiA+PiA+Cj4gPj4gPiAtIEVyaWMKPiA+Pgo+ID4+IFRoZSBsYXRlc3QgZXh0ZW5zaW9uIGRl
dGVjdGlvbiBwYXRjaCB2ZXJzaW9uIGlzIHY1Lgo+ID4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAyMzExMTQxNDEyNTYuMTI2NzQ5LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8K
PiA+PiBJdCdzIHN0aWxsIHVuZGVyIHJldmlld2luZy4KPiA+PiBCdXQgSSB0aGluayB0aGUgY2hl
Y2tpbmcgY29kZXMgdXNlZCBpbiB0aGlzIGNyeXB0byBwYXRjaCBzZXJpZXMgd2lsbCBub3QgY2hh
bmdlLgo+ID4+IFdlIGNvdWxkIGp1c3Qgd2FpdCBhbmQgcmViYXNlIHdoZW4gaXQncyBtZXJnZWQu
Cj4gPj4KPiA+PiBUaGUgbGF0ZXN0IGtlcm5lbC1tb2RlIHZlY3RvciBwYXRjaCB2ZXJzaW9uIGlz
IHYzLgo+ID4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTAxOTE1NDU1
Mi4yMzM1MS0xLWFuZHkuY2hpdUBzaWZpdmUuY29tLwo+ID4+IFRoaXMgcGF0Y2ggZG9lc24ndCB3
b3JrIHdpdGggcWVtdShoaXQga2VybmVsIHBhbmljIHdoZW4gdXNpbmcgdmVjdG9yKS4gSXQncyBu
b3QKPiA+PiBjbGVhciBmb3IgdGhlIHN0YXR1cy4gQ291bGQgd2Ugc3RpbGwgZG8gdGhlIHJldmll
d2luZyBwcm9jZXNzIGZvciB0aGUgZ2x1aW5nIGNvZGUgYW5kCj4gPj4gdGhlIGNyeXB0byBhc20g
cGFydHM/Cj4gPgo+ID4gSSdtIGFsbW9zdCByZWFkeSB0byBnaXZlIG15IFJldmlld2VkLWJ5IGZv
ciB0aGlzIHdob2xlIHNlcmllcy4gIFRoZSBwcm9ibGVtIGlzCj4gPiB0aGF0IGl0IGNhbid0IGJl
IG1lcmdlZCB1bnRpbCBpdHMgcHJlcmVxdWlzaXRlcyBhcmUgbWVyZ2VkLgo+ID4KPiA+IEFuZHkg
Q2hpdSdzIGxhc3QgcGF0Y2hzZXQgInJpc2N2OiBzdXBwb3J0IGtlcm5lbC1tb2RlIFZlY3RvciIg
d2FzIDIgbW9udGhzIGFnbywKPiA+IGJ1dCBoZSBhbHNvIGdhdmUgYSB0YWxrIGF0IFBsdW1iZXJz
IGFib3V0IGl0IG1vcmUgcmVjZW50bHkKPiA+IChodHRwczovL3d3dy55b3V0dWJlLmNvbS93YXRj
aD92PWVodDNQY2NFbjVvKS4gIFNvIEkgYXNzdW1lIGhlJ3Mgc3RpbGwgd29ya2luZwo+ID4gb24g
aXQuICBJdCBzb3VuZHMgbGlrZSBoZSdzIGFsc28gZ29pbmcgdG8gaW5jbHVkZSBzdXBwb3J0IGZv
ciBwcmVlbXB0aW9uLCBhbmQKPiA+IG9wdGltaXphdGlvbnMgdG8gbWVtY3B5LCBtZW1zZXQsIG1l
bW1vdmUsIGFuZCBjb3B5X3t0byxmcm9tfV91c2VyLgo+Cj4gU28gSSB0aGluayB3ZSBqdXN0IGdv
dCBibG9ja2VkIG9uIG5vdCBrbm93aW5nIGlmIHR1cm5pbmcgb24gdmVjdG9yCj4gZXZlcnl3aGVy
ZSBpbiB0aGUga2VybmVsIHdhcyBhIGdvb2QgaWRlYSAtLSBpdCdzIG5vdCB3aGF0IGFueSBvdGhl
ciBwb3J0Cj4gZG9lcyBkZXNwaXRlIHRoZXJlIGhhdmluZyBiZWVuIHNvbWUgZGlzY3Vzc2lvbnMg
ZmxvYXRpbmcgYXJvdW5kLCBidXQgd2UKPiBuZXZlciByZWFsbHkgZmlndXJlZCBvdXQgd2h5LiAg
SSBjYW4gY29tZSB1cCB3aXRoIHNvbWUgcG9zc2libGUKPiBwZXJmb3JtYW5jZSBwYXRob2xvZ2ll
cyByZWxhdGVkIHRvIGhhdmluZyB2ZWN0b3Igb24gaW4gbWFueSBjb250ZXh0cywKPiBidXQgaXQn
cyBhbGwgdGhlb3J5IGFzIHRoZXJlJ3Mgbm90IHJlYWxseSBhbnkgdmVjdG9yIGhhcmR3YXJlIHRo
YXQgd29ya3MKPiB1cHN0cmVhbSAodGhvdWdoIHRoZSBLMjMwIGlzIHN0YXJ0aW5nIHRvIGNvbWUg
YWxvbmcsIHNvIG1heWJlIHRoYXQnbGwKPiBzb3J0IGl0c2VsZiBvdXQpLgo+Cj4gTGFzdCB3ZSB0
YWxrZWQgSSB0aGluayB0aGUgZ2VuZXJhbCBjb25zZW5zdXMgaXMgdGhhdCB3ZSdkIHdhaXRlZCBs
b25nCj4gZW5vdWdoLCBpZiBub2JvZHkgaGFzIGEgY29uY3JldGUgb2JqZWN0aW9uIHdlIHNob3Vs
ZCBqdXN0IHRha2UgaXQgYW5kCj4gc2VlIC0tIHN1cmUgbWF5YmUgdGhlcmUncyBzb21lIHBvc3Np
YmxlIGlzc3VlcywgYnV0IGFueXRoaW5nIGNvdWxkIGhhdmUKPiBpc3N1ZXMuCj4KPiA+IEkgdGhp
bmsgaXQgd291bGQgYmUgYSBnb29kIGlkZWEgdG8gc3BsaXQgb3V0IHRoZSBiYXNpYyBzdXBwb3J0
IGZvcgo+ID4ga2VybmVsX3ZlY3Rvcl97YmVnaW4sZW5kfSBzbyB0aGF0IHRoZSB1c2VycyBvZiB0
aGVtLCBhcyB3ZWxsIGFzIHRoZSBwcmVlbXB0aW9uCj4gPiBzdXBwb3J0LCBjYW4gYmUgY29uc2lk
ZXJlZCBhbmQgbWVyZ2VkIHNlcGFyYXRlbHkuICBNYXliZSBwYXRjaCAxIG9mIHRoZSBzZXJpZXMK
PiA+IChodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMxMDE5MTU0NTUyLjIzMzUxLTItYW5k
eS5jaGl1QHNpZml2ZS5jb20pIGlzIGFsbAo+ID4gdGhhdCdzIG5lZWRlZCBpbml0aWFsbHk/Cj4K
PiBJJ20gZmluZSB3aXRoIHRoYXQgc29ydCBvZiBhcHByb2FjaCB0b28sIGl0J3MgY2VydGFpbmx5
IG1vcmUgaW4gbGluZQo+IHdpdGggb3RoZXIgcG9ydHMgdG8ganVzdCByZXN0cmljdCB0aGUga2Vy
bmVsLW1vZGUgdmVjdG9yIHN1cHBvcnQgdG8KPiBleHBsaWNpdGx5IGVuYWJsZWQgc2VjdGlvbnMu
ICBTdXJlIG1heWJlIHRoZXJlJ3Mgb3RoZXIgc3R1ZmYgdG8gZG8gaW4KPiBrZXJuZWwgdmVjdG9y
IGxhbmQsIGJ1dCB3ZSBjYW4gYXQgbGVhc3QgZ2V0IHNvbWV0aGluZyBnb2luZy4KCldpdGggdGhl
IGN1cnJlbnQgYXBwcm9hY2ggb2YgcHJlZW1wdF92IHdlIHN0aWxsIG5lZWQKa2VybmVsX3ZlY3Rv
cl9iZWdpbi9lbmQgdG8gZXhwbGljaXRseSBtYXJrIGVuYWJsZWQgc2VjdGlvbnMuIEJ1dAppbmRl
ZWQsIHByZWVtcHRfdiB3aWxsIG1ha2UgaXQgZWFzeSB0byBkbyBmdW5jdGlvbi13aXNlLCB0aHJl
YWQtd2lzZQplbmFibGUgaWYgcGVvcGxlIG5lZWQgaXQuCgo+Cj4gPiBBbmR5LCB3aGF0IGRvIHlv
dSB0aGluaz8KPgo+IEknbGwgd2FpdCBvbiBBbmR5IHRvIHNlZSwgYnV0IEkgZ2VuZXJhbGx5IGFn
cmVlIHdlIHNob3VsZCBtZXJnZQo+IHNvbWV0aGluZyBmb3IgdGhpcyBjeWNsZS4KPgo+IEFuZHk6
IG1heWJlIGp1c3Qgc2VuZCBhIHBhdGNoIHNldCB3aXRoIHdoYXQgeW91IHRoaW5rIGlzIHRoZSBi
ZXN0IHdheSB0bwo+IGdvPyAgVGhlbiB3ZSBoYXZlIG9uZSB0YXJnZXQgYXBwcm9hY2ggYW5kIHdl
IGNhbiBnZXQgdGhpbmdzIG1vdmluZy4KClllcywgSSB0aGluayB3ZSBjYW4gc3BsaXQuIEl0IHdp
bGwgaW50cm9kdWNlIHNvbWUgb3ZlcmhlYWQgb24gbXkgc2lkZSwKYnV0IGF0IGxlYXN0IHdlIGNh
biBnZXQgc29tZSBwYXJ0cyBtb3ZpbmcuIEkgd2FzIHByZWVtcHRlZCBieSBzb21lCmhpZ2hlciBw
cmlvcml0eSB0YXNrcy4gTHVja2lseSBJIGFtIGJhY2sgbm93LiBQbGVhc2UgZXhwZWN0IHY0IGJ5
IG5leHQKd2VlaywgSSBob3BlIGl0IHdvbid0IGJlIHRvbyBsYXRlIGZvciB0aGUgY3ljbGUuCgo+
Cj4gPiAtIEVyaWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
