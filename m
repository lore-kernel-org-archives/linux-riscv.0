Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4865C77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 16:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxkAzFb4paCM6xPrpHTK3ushhRHGmvnvBEfGbVv67oE=; b=B/d6kkp496dW3s
	od/7QunaLqwxVayVCpmXMksSlas+3U6A6mdNdrfdNFTf64m90s10dbtk9SDnXghHOost9TFmtZh5z
	fo0wbcK+f6CLYTutrwNwA4gdv5oECr8/igFMNP5FDythdGHRLOy/Q/2N4miEldzdfzj/97oscLOrr
	spWNw+TLG8A7mrbUz8AMtxT9znHl6Kl2bDUO4eXRm3Y0slCcJvae5RQzr/WaWKPT9NC9+YlgGTYLA
	2pehV/qqcTu1F8PND6elmOYftrRAVt2xELozmSrUfek9SU15WrliHI/8HHc3rXTpImGF4e9N9xhUF
	6XLsWw3AuYACA+Zr52Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw444-0010KX-1k;
	Mon, 08 May 2023 16:50:20 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw441-0010JZ-23
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 16:50:19 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f137dbaa4fso5498624e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683564609; x=1686156609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcrvD/HGfP0sQ8rn7rEA3w+8hNghq9eS4p2dVN+XRPw=;
        b=YOe7TLYwTq2FS+pgqtD6IU9zBah2N7CgzKD2s77+3g0flsJL5ZT26ZJDFP1VHBRTe4
         2IO8Ftmnh1CMF0cxapLxrjnmlFauKy8nE4BxvJGryBUlE39XnO915uS7n+XtzU6YuHZH
         flN05rExGkzzgrVw964Il3tUAsR9bOBc9C56OSxbKNlXIRyHJ45RyQ7oiZ7qDnKhk9+Z
         xr7UsTGKzw29fbQyJJTSybV9tLNGnyWkYTjOld/lmRZeCbFY3efN1VrMD8ZfQ/tRT8a4
         XyYtd05TmYT2MhEzor+UGPYjaigZ8vYNEcCt+d/hx75xkDaJUb/kWgzjkLcp4YQcipXw
         VWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683564609; x=1686156609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcrvD/HGfP0sQ8rn7rEA3w+8hNghq9eS4p2dVN+XRPw=;
        b=hAI8rI0yvQuM18Xlnu7K5Ra22OdS9iWla2Az8L04x3OSs2u6AK9BTCiE/REop1ASVk
         A0oOnMjsXXS3i7gIJ5xRR7Xp9UpHJof+H9T0YCozAwHPiEwQvJ/772TpxyQuxe8NNnfl
         +CpOL85rGX0OdOM+ojy8vEd1sUTscHcOfxDN8u0eZPGrJiFjMgNOjtZ7CccOoKDdUKOV
         EbD92AfgGdUTvk4C+WWE0wfkanwKeFhemAfjVTpiPgWYYHHoQh8ZUMC0/mwjTw6WhlKH
         6d/IrgXoG0RZ/ooPrJamvWd+eXHh1N9+6d9Ac7qCxJRFjY4K95Eg2RcC1Qgse3UamI+l
         K3fA==
X-Gm-Message-State: AC+VfDxVadHINTVAss4BdlxaKNTBO1gXgalWnBtSf5xg+C3lobE514Qk
	72EgtFsrZHlpuLwYZKYzhZhGpbmv4J40G/1ZJrVb4g==
X-Google-Smtp-Source: ACHHUZ4+gjA9MQpcwzYPPM5k47cAY6H6hQhv8AiOghh9B/HC+0qEmiIPg0YCZV1xuf2Ou2iOsJjKnEGGtcVPWiJTNEw=
X-Received: by 2002:a19:f709:0:b0:4ef:9633:f119 with SMTP id
 z9-20020a19f709000000b004ef9633f119mr2918416lfe.26.1683564608901; Mon, 08 May
 2023 09:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-4b9e3d86-2f0b-47da-8a5d-bd383a0171d6@palmer-ri-x1c9> <4830085.8hb0ThOEGa@diego>
In-Reply-To: <4830085.8hb0ThOEGa@diego>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 8 May 2023 09:49:32 -0700
Message-ID: <CALs-HsveK-uUuSAOkUUPuUYK6_ChG95_YWtdwYvGsTfKYSWUpg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Expose the isa-string via the AT_BASE_PLATFORM aux vector
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: philipp.tomsich@vrull.eu, Palmer Dabbelt <palmer@dabbelt.com>, bjorn@kernel.org, 
	jrtc27@jrtc27.com, linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, kito.cheng@sifive.com, 
	Conor Dooley <conor.dooley@microchip.com>, matthias.bgg@gmail.com, 
	heinrich.schuchardt@canonical.com, greentime.hu@sifive.com, 
	nick.knight@sifive.com, christoph.muellner@vrull.eu, 
	Richard Henderson <richard.henderson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_095017_678179_7173E189 
X-CRM114-Status: GOOD (  41.22  )
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

T24gV2VkLCBNYXkgMywgMjAyMyBhdCAzOjMx4oCvQU0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4gd3JvdGU6Cj4KPiBIaSwKPgo+IEFtIERpZW5zdGFnLCAyLiBNYWkgMjAyMywgMTk6
MTU6MjkgQ0VTVCBzY2hyaWViIFBhbG1lciBEYWJiZWx0Ogo+ID4gT24gVHVlLCAwMiBNYXkgMjAy
MyAwMjoxMzoxMCBQRFQgKC0wNzAwKSwgcGhpbGlwcC50b21zaWNoQHZydWxsLmV1IHdyb3RlOgo+
ID4gPiBPbiBUdWUsIDIgTWF5IDIwMjMgYXQgMDk6NTgsIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IFBoaWxpcHAgVG9tc2ljaCA8cGhpbGlwcC50
b21zaWNoQHZydWxsLmV1PiB3cml0ZXM6Cj4gPiA+Pgo+ID4gPj4gPiBJdCBpcyBhIHBpdHkgdGhh
dCB0aGUgY3VycmVudCBpbnRlcmZhY2Ugd2FzIGRlc2lnbmVkIHdpdGhvdXQgaW52b2x2aW5nCj4g
PiA+PiA+IFJWSSAoYW5kIHRoYXQgSSBoYWQgdG8gYXNrIG15IHRlYW0gdG8gcHV0IHRvZ2V0aGVy
IGEgcGF0Y2ggc2V0IGZvcgo+ID4gPj4gPiBmdXJ0aGVyIGRpc2N1c3Npb24sIGdpdmVuIHRoYXQg
bm9uZSBvZiB0aGUgb3RoZXIgbWFqb3IgdmVuZG9ycyBpbiBSVkkKPiA+ID4+ID4gc3RlcHBlZCBm
b3J3YXJkKS4gIEkgZ3VhcmFudGVlIHRoYXQgcGxlbnR5IG9mIHJldmlld2VycyB3b3VsZCBoYXZl
Cj4gPiA+PiA+IGhpZ2hsaWdodGVkIHRoYXQgYSBjZW50cmFsIHJlZ2lzdHJ5IChldmVuIGlmIGl0
IGlzIGp1c3QgYSBrZXJuZWwKPiA+ID4+ID4gaGVhZGVyKSBzaG91bGQgYmUgYXZvaWRlZC4KPiA+
ID4+Cj4gPiA+PiBBcmUgeW91IGNsYWltaW5nIHRoYXQgdGhlIGh3cHJvYmUgd29yayB3YXMgbm90
IGRvbmUgaW4gdGhlIG9wZW4sIGJ1dAo+ID4gPj4gc2VjcmV0bHkgbWVyZ2VkPyBUaGF0IGlzIG5v
dCBvbmx5IGluY29ycmVjdCwgYnV0IHJ1ZGUgdG8gdXBzdHJlYW0gUklTQy1WCj4gPiA+PiBMaW51
eCBkZXZlbG9wZXJzLiBJIHN1Z2dlc3QgeW91IHJldmlldyBob3cgeW91IGludGVyYWN0IHdpdGgg
dXBzdHJlYW0KPiA+ID4+IGtlcm5lbCB3b3JrLgo+ID4gPgo+ID4gPiBQbGVhc2UgZG9uJ3QgcHV0
IHdvcmRzIGludG8gbXkgbW91dGguLi4KPiA+ID4KPiA+ID4gSSB3YXMgbWVyZWx5IHBvaW50aW5n
IG91dCB0aGF0IHRoZXJlIHdhcyBubyBlbmdhZ2VtZW50IGJ5IHRoZSBSVkkKPiA+ID4gbWVtYmVy
IGNvbXBhbmllcyAoaW4gcmVnYXJkIHRvIHRoaXMgbWVjaGFuaXNtKSB3aXRoaW4gUlZJLCB3aGlj
aCB3b3VsZAo+ID4gPiBoYXZlIHByZXZlbnRlZCBKZXNzaWNhJ3MgaXNzdWUuCj4gPiA+IFRoaXMg
d291bGQgaGF2ZSBhbHNvIGhlbHBlZCB0byBhZGRyZXNzIHRoZSBjb25jZXJucyBvbiB2ZW5kb3It
ZGVmaW5lZAo+ID4gPiBleHRlbnNpb25zLgo+ID4gPgo+ID4gPiBBbHNvIHdobyBkbyB5b3UgcmVm
ZXIgdG8gd2hlbiB5b3Ugc2F5ICJob3cgX3lvdV8gaW50ZXJhY3QiPyAgSWYgaXQgaXMKPiA+ID4g
UlZJIHRoYXQgeW91IHJlZmVyIHRvOiBpdCBkb2Vzbid0IGludGVyYWN0IHdpdGggdXBzdHJlYW0g
d29yawo+ID4gPiBkaXJlY3RseSwgYXMgaXQgZG9lc24ndCBvd24gYW55IGVuZ2luZWVyaW5nIHJl
c291cmNlcy4KPiA+ID4gUlZJIHByb3ZpZGVzIGEgZm9ydW0gZm9yIG1lbWJlciBjb21wYW5pZXMg
dG8gY29tZSB0byBhbgo+ID4gPiB1bmRlcnN0YW5kaW5nL2Rlc2lnbiBhbmQgdGhlbiBoYXZlIHRo
ZSBtZW1iZXIgY29tcGFuaWVzIHBlcmZvcm0gdGhlCj4gPiA+IHdvcmsgYW5kIHRha2UgaXQgdXBz
dHJlYW0uCj4gPgo+ID4gSSdtIG5vdCBldmVuIHN1cmUgd2hhdCB5b3UncmUgbG9va2luZyBmb3Ig
aGVyZTogaWYgUlZJIGRvZXNuJ3Qgd2FudCB0bwo+ID4gd29yayB1cHN0cmVhbSwgdGhlbiBjb21w
bGFpbmluZyB0aGF0IFJWSSBpc24ndCBwYXJ0IG9mIHVwc3RyZWFtCj4gPiBkaXNjdXNzaW9ucyBp
cyBwcmV0dHkgcG9pbnRsZXNzLgo+ID4KPiA+ID4+IFdoeSBkaWRuJ3QgUlZJIGdldCBpbnZvbHZl
ZCBpbiB0aGUgcmV2aWV3IG9mIHRoZSBzZXJpZXM/IFRoZSBleHBlY3RhdGlvbgo+ID4gPj4gY2Fu
bm90IGJlIHRoYXQgYWxsIG9wZW4gc291cmNlIHByb2plY3RzIGdvIHRvIFJWSSwgYnV0IHJhdGhl
ciB0aGUgb3RoZXIKPiA+ID4+IHdheSBhcm91bmQuCj4gPiA+Cj4gPiA+IFRoYXQgaXMgZXhhY3Rs
eSB0aGUgcG9pbnQgSSB3YXMgbWFraW5nIGFuZCB3aGljaCB5b3Ugc2VlbSB0byBtaXNzOiBSVkkK
PiA+ID4gZG9lcyBub3Qgb3duIGFueSBlbmdpbmVlcmluZyByZXNvdXJjZXMgYW5kIGRlcGVuZHMg
c29sZWx5IG9uIGl0cwo+ID4gPiBtZW1iZXIgY29tcGFuaWVzIHRvIHByb2plY3QgaW50byBvcGVu
IHNvdXJjZSBwcm9qZWN0cy4KPiA+ID4KPiA+ID4+IFRha2UgYSBsb29rIGF0IGNvbW1pdCBlYTNk
ZTljZThhYTIgKCJSSVNDLVY6IEFkZCBhIHN5c2NhbGwgZm9yIEhXCj4gPiA+PiBwcm9iaW5nIiku
IFlvdXIgdGVhbSB3YXMgdmVyeSBtdWNoIGludm9sdmVkIGluIHRoZSByZXZpZXcuCj4gPiA+Cj4g
PiA+IEkgYW0gYXdhcmUsIGFzIEkgaGFkIHJldmlld2VkIGFuZCBjb21tZW50ZWQgb24gdGhlc2Ug
YXJlIHdlbGwuCj4gPiA+IEFuZCBteSBvbmx5IHJlcXVlc3QgKHdhcyBhbmQpIGlzIHRoYXQgd2Ug
bmVlZCB0byBmaWd1cmUgb3V0IGEgd2F5IHRvCj4gPiA+IGVmZmljaWVudGx5IGRlYWwgd2l0aCB2
ZW5kb3ItZGVmaW5lZCBleHRlbnNpb25zLgo+ID4KPiA+IE1heWJlIHlvdSBzaG91bGQgZ28gdGFs
ayB0byB5b3UgdGVhbSwgdGhlbj8gIEhhbmRsaW5nIHZlbmRvciBleHRlbnNpb25zCj4gPiB2aWEg
aHdwcm9iZSBoYXMgYmVlbiBkaXNjdXNzZWQsIHNvdW5kcyBsaWtlIHlvdSdyZSBjb25mdXNlZCBh
Z2Fpbi4KPgo+IEkgdG9vIGhhdmUgdGhpcyB2YWd1ZSBtZW1vcnkgb2YgdXMgdGFsa2luZyBhYm91
dCB2ZW5kb3IgZXh0ZW5zaW9ucywKPiBidXQgbXkgbWVtb3J5IGlzIHJlYWxseSBiYWQgZm9yIHN0
dWZmIGxpa2UgdGhpcywgc28gSSBzcGVudCB0aGUgbW9ybmluZwo+IGNvbWJpbmcgdGhyb3VnaCBh
bGwgdGhlIGh3cHJvYmUgaXRlcmF0aW9ucyBsb29raW5nIGZvciBpdCwgYnV0IHNvIGZhcgo+IGhh
dmUgb25seSBmb3VuZAo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQUxzLUhzdG9l
b1RXalRFWnJMV291Q2d3cTB0M3REQjZ1TD10QjY4UkpEczF1YjRGcndAbWFpbC5nbWFpbC5jb20v
Cj4KPiBJJ20gbW9zdCBsaWtlbHkganVzdCBibGluZCwgYnV0IGRvZXMgc29tZW9uZSBoYXZlIGFu
b3RoZXIgcG9pbnRlcj8KCkhlbGxvISBUaGF0J3MgcHJvYmFibHkgdGhlIG9ubHkgcG9pbnRlci4K
CkNvdWxkbid0IGhhbmRsaW5nIHZlbmRvciBleHRlbnNpb25zIHdpdGhpbiB0aGUgaHdwcm9iZSBm
cmFtZXdvcmsgYmUgYXMKc3RyYWlnaHRmb3J3YXJkIGFzIGV4cGxpY2l0bHkgY2FydmluZyBvdXQg
YSByZWdpb24gZm9yIHRoZW0/IFNheQoweDgwMDAwMDAwMDAwMDAwMDArIGJlbG9uZ3MgdG8gdGhl
IHZlbmRvcj8gVGhlIGxheW91dCBvZiBrZXlzIHdpdGhpbgp0aGUgdmVuZG9yIGh3cHJvYmUgcmVn
aW9uIHRoZW4gZGVwZW5kcyBvbiB0aGUgdmFsdWUgaW4gbXZlbmRvcmlkIChhbmQKaWYgdGhlIHZl
bmRvciBzbyBjaG9vc2VzLCBhcmNoaWQgYW5kIGltcGlkIGFzIHdlbGwpLiBUaGVuIHZlbmRvcnMg
Y2FuCmV4cG9zZSBrZXlzIHRvIHRoZWlyIGhlYXJ0cyAoYXZvaWRpbmcgdGhlIGR1bWIgcHVuIHRo
ZXJlKSBjb250ZW50LgoKV2UgY2FuIHByb2JhYmx5IHNraXAgY2FjaGluZyB0aGUgdmVuZG9yIGtl
eXMgaW4gdGhlIHZEU08gZm9yIG5vdy4gSWYKaXQgcmVhbGx5IG5lZWRzIHRvIGJlIGRvbmUgd2Ug
Y2FuIGFkZCBpdCBsYXRlci4KClRoaXMgd291bGQgZW5mb3JjZSB0aGF0IHRoZXJlJ3Mgb25seSBv
bmUgInZlbmRvciIgYXQgYSB0aW1lIGZvciBhCmdpdmVuIGhhcnQsIGJ1dCBJIHRoaW5rIHRoYXQn
cyByZWFzb25hYmxlLiBMZXQgbWUga25vdyB3aGF0IHlvdSB0aGluay4KCi1FdmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
