Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6021BC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9A/ApHiBrnBD+XPZaem3sKqx1XgmcCe8dCw4f/w4N74=; b=LJRw2nlp+CUKr+zv2/7EukKBwi
	KPC+stB5LzkZ/0Vbb49XfSYVviAPrUkqRZ32vWEz1UQV/ma+qOKIQYys7+JkEwOh1qhpWUgwtjZbW
	Xzjexc/j70VZ+mHi5SGgIYVnV1v3Yd1cEJgcmo9Yv52+QVjmpnUAwhgUSSXmUizibE7d8NlVaFXlz
	/ArWADKFpiFxchB5jH8V56MQA8EAzw3med2AK3UroEwL5s23JLucM69h/Y8rnFdSbY7U/y2cJn+xc
	p3r2L2UuNTiZ/e7SS5VXob8yWSfKfboyhT4iuJ1SufcM7Qm0ecxi3BWF8/UXvSavrrvtlcUsa1BZS
	FYDNYYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pttbG-002DJG-1T;
	Tue, 02 May 2023 17:15:38 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pttbC-002DHz-22
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 17:15:36 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-63b67a26069so4670369b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 May 2023 10:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683047731; x=1685639731;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+A8Sw/GbyUDc6OouvqtsYaVPbEunyRKH6rDdt34P9UU=;
        b=5WK5y1bY3X05dM+FciBY67/a/ctI+ZTwnd2B24QsqAFA36I4c2l/8FbVdwaZft3Qzl
         C1gr9FsBDOzFcszIEe6gERJxVvbTFn2wnM5Y6+wYmtAHdZlERKIHo6frIGdiZFd6yGXL
         x93Yddo2ne4PfKneHgb3rlZhoO7XD0K5//oXSuB5EIs1vZLv62pvIUZjn4fvwaHeFBfO
         ypwWMPOhqx8DRCNgurS8A62Rrey7kv9oPyZ3ys8yM/c017iVGZCB2OV+Oc0TKZ/GKjCk
         V+kjwd+FA77pTUy2qm38PWZXVREZUvuc0j/zfsjLOMC8vfLCIgqRI99zKKCKgaMhWVNN
         95SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683047731; x=1685639731;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+A8Sw/GbyUDc6OouvqtsYaVPbEunyRKH6rDdt34P9UU=;
        b=MRsVp64HVzxvEltBLVKKzsuOH6VwSmjI9G6EgOrQrGAFaZfSPWNub1V9HA4typ/U6c
         20dZKW89beszzpRbJo8KgxrEOvrJ1rwoQl/W0RQD8l5SaUxOMj8N+xYFPqF0rtiXp9JH
         eIA/wAUlF7ymR4Ra+Ds3Nj5Tn/UOTG0cdEcr+g/SXJ0GCwz6nlsCAPWImF7yC8dsiTKt
         SjvF5VDRHwlJo6v9aE7/vcelyQb/VNqEZRHEH62gx+qnARcYYTqeZYCgFdfjriKu21IR
         JjZtPLuMA5IhXi3Vpxc3kpqscTXPo66R2gXMNJqEkmvHGjAnaCQ5Vju/+4Kr+aDnCJCW
         K2Hw==
X-Gm-Message-State: AC+VfDzGfrHDRe1yY/E1aEkkMf7ltv+0P+06H0gAZA8r59h78GgSHNKz
	Tn3ucZlUERvOb1M3DQjr6SuP0Q==
X-Google-Smtp-Source: ACHHUZ5swfbozraNarhMeYBm10PBdqGxzIJMEQxji86jnf86amM1DM0VBEs/+AN6eLoOq84GFcYR+Q==
X-Received: by 2002:a05:6a20:7d95:b0:f4:98d2:591d with SMTP id v21-20020a056a207d9500b000f498d2591dmr23657544pzj.5.1683047730546;
        Tue, 02 May 2023 10:15:30 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id p11-20020a635b0b000000b0050bd4bb900csm7393064pgb.71.2023.05.02.10.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 10:15:29 -0700 (PDT)
Date: Tue, 02 May 2023 10:15:29 -0700 (PDT)
X-Google-Original-Date: Tue, 02 May 2023 10:15:27 PDT (-0700)
Subject: Re: [PATCH 0/4] Expose the isa-string via the AT_BASE_PLATFORM aux vector
In-Reply-To: <CAAeLtUCqyARVaY2YtVXWc_cucMOCbQ2RAd2y35pun_MMagEN_w@mail.gmail.com>
CC: bjorn@kernel.org, jrtc27@jrtc27.com, heiko@sntech.de,
  linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, kito.cheng@sifive.com,
  Conor Dooley <conor.dooley@microchip.com>, matthias.bgg@gmail.com, heinrich.schuchardt@canonical.com,
  greentime.hu@sifive.com, nick.knight@sifive.com, christoph.muellner@vrull.eu,
  Richard Henderson <richard.henderson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
  heiko.stuebner@vrull.eu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: philipp.tomsich@vrull.eu
Message-ID: <mhng-4b9e3d86-2f0b-47da-8a5d-bd383a0171d6@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_101534_908142_6731813D 
X-CRM114-Status: GOOD (  29.66  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAwMiBNYXkgMjAyMyAwMjoxMzoxMCBQRFQgKC0wNzAwKSwgcGhpbGlwcC50b21zaWNo
QHZydWxsLmV1IHdyb3RlOgo+IE9uIFR1ZSwgMiBNYXkgMjAyMyBhdCAwOTo1OCwgQmrDtnJuIFTD
tnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IFBoaWxpcHAgVG9tc2ljaCA8cGhp
bGlwcC50b21zaWNoQHZydWxsLmV1PiB3cml0ZXM6Cj4+Cj4+ID4gSXQgaXMgYSBwaXR5IHRoYXQg
dGhlIGN1cnJlbnQgaW50ZXJmYWNlIHdhcyBkZXNpZ25lZCB3aXRob3V0IGludm9sdmluZwo+PiA+
IFJWSSAoYW5kIHRoYXQgSSBoYWQgdG8gYXNrIG15IHRlYW0gdG8gcHV0IHRvZ2V0aGVyIGEgcGF0
Y2ggc2V0IGZvcgo+PiA+IGZ1cnRoZXIgZGlzY3Vzc2lvbiwgZ2l2ZW4gdGhhdCBub25lIG9mIHRo
ZSBvdGhlciBtYWpvciB2ZW5kb3JzIGluIFJWSQo+PiA+IHN0ZXBwZWQgZm9yd2FyZCkuICBJIGd1
YXJhbnRlZSB0aGF0IHBsZW50eSBvZiByZXZpZXdlcnMgd291bGQgaGF2ZQo+PiA+IGhpZ2hsaWdo
dGVkIHRoYXQgYSBjZW50cmFsIHJlZ2lzdHJ5IChldmVuIGlmIGl0IGlzIGp1c3QgYSBrZXJuZWwK
Pj4gPiBoZWFkZXIpIHNob3VsZCBiZSBhdm9pZGVkLgo+Pgo+PiBBcmUgeW91IGNsYWltaW5nIHRo
YXQgdGhlIGh3cHJvYmUgd29yayB3YXMgbm90IGRvbmUgaW4gdGhlIG9wZW4sIGJ1dAo+PiBzZWNy
ZXRseSBtZXJnZWQ/IFRoYXQgaXMgbm90IG9ubHkgaW5jb3JyZWN0LCBidXQgcnVkZSB0byB1cHN0
cmVhbSBSSVNDLVYKPj4gTGludXggZGV2ZWxvcGVycy4gSSBzdWdnZXN0IHlvdSByZXZpZXcgaG93
IHlvdSBpbnRlcmFjdCB3aXRoIHVwc3RyZWFtCj4+IGtlcm5lbCB3b3JrLgo+Cj4gUGxlYXNlIGRv
bid0IHB1dCB3b3JkcyBpbnRvIG15IG1vdXRoLi4uCj4KPiBJIHdhcyBtZXJlbHkgcG9pbnRpbmcg
b3V0IHRoYXQgdGhlcmUgd2FzIG5vIGVuZ2FnZW1lbnQgYnkgdGhlIFJWSQo+IG1lbWJlciBjb21w
YW5pZXMgKGluIHJlZ2FyZCB0byB0aGlzIG1lY2hhbmlzbSkgd2l0aGluIFJWSSwgd2hpY2ggd291
bGQKPiBoYXZlIHByZXZlbnRlZCBKZXNzaWNhJ3MgaXNzdWUuCj4gVGhpcyB3b3VsZCBoYXZlIGFs
c28gaGVscGVkIHRvIGFkZHJlc3MgdGhlIGNvbmNlcm5zIG9uIHZlbmRvci1kZWZpbmVkCj4gZXh0
ZW5zaW9ucy4KPgo+IEFsc28gd2hvIGRvIHlvdSByZWZlciB0byB3aGVuIHlvdSBzYXkgImhvdyBf
eW91XyBpbnRlcmFjdCI/ICBJZiBpdCBpcwo+IFJWSSB0aGF0IHlvdSByZWZlciB0bzogaXQgZG9l
c24ndCBpbnRlcmFjdCB3aXRoIHVwc3RyZWFtIHdvcmsKPiBkaXJlY3RseSwgYXMgaXQgZG9lc24n
dCBvd24gYW55IGVuZ2luZWVyaW5nIHJlc291cmNlcy4KPiBSVkkgcHJvdmlkZXMgYSBmb3J1bSBm
b3IgbWVtYmVyIGNvbXBhbmllcyB0byBjb21lIHRvIGFuCj4gdW5kZXJzdGFuZGluZy9kZXNpZ24g
YW5kIHRoZW4gaGF2ZSB0aGUgbWVtYmVyIGNvbXBhbmllcyBwZXJmb3JtIHRoZQo+IHdvcmsgYW5k
IHRha2UgaXQgdXBzdHJlYW0uCgpJJ20gbm90IGV2ZW4gc3VyZSB3aGF0IHlvdSdyZSBsb29raW5n
IGZvciBoZXJlOiBpZiBSVkkgZG9lc24ndCB3YW50IHRvIAp3b3JrIHVwc3RyZWFtLCB0aGVuIGNv
bXBsYWluaW5nIHRoYXQgUlZJIGlzbid0IHBhcnQgb2YgdXBzdHJlYW0gCmRpc2N1c3Npb25zIGlz
IHByZXR0eSBwb2ludGxlc3MuCgo+PiBXaHkgZGlkbid0IFJWSSBnZXQgaW52b2x2ZWQgaW4gdGhl
IHJldmlldyBvZiB0aGUgc2VyaWVzPyBUaGUgZXhwZWN0YXRpb24KPj4gY2Fubm90IGJlIHRoYXQg
YWxsIG9wZW4gc291cmNlIHByb2plY3RzIGdvIHRvIFJWSSwgYnV0IHJhdGhlciB0aGUgb3RoZXIK
Pj4gd2F5IGFyb3VuZC4KPgo+IFRoYXQgaXMgZXhhY3RseSB0aGUgcG9pbnQgSSB3YXMgbWFraW5n
IGFuZCB3aGljaCB5b3Ugc2VlbSB0byBtaXNzOiBSVkkKPiBkb2VzIG5vdCBvd24gYW55IGVuZ2lu
ZWVyaW5nIHJlc291cmNlcyBhbmQgZGVwZW5kcyBzb2xlbHkgb24gaXRzCj4gbWVtYmVyIGNvbXBh
bmllcyB0byBwcm9qZWN0IGludG8gb3BlbiBzb3VyY2UgcHJvamVjdHMuCj4KPj4gVGFrZSBhIGxv
b2sgYXQgY29tbWl0IGVhM2RlOWNlOGFhMiAoIlJJU0MtVjogQWRkIGEgc3lzY2FsbCBmb3IgSFcK
Pj4gcHJvYmluZyIpLiBZb3VyIHRlYW0gd2FzIHZlcnkgbXVjaCBpbnZvbHZlZCBpbiB0aGUgcmV2
aWV3Lgo+Cj4gSSBhbSBhd2FyZSwgYXMgSSBoYWQgcmV2aWV3ZWQgYW5kIGNvbW1lbnRlZCBvbiB0
aGVzZSBhcmUgd2VsbC4KPiBBbmQgbXkgb25seSByZXF1ZXN0ICh3YXMgYW5kKSBpcyB0aGF0IHdl
IG5lZWQgdG8gZmlndXJlIG91dCBhIHdheSB0bwo+IGVmZmljaWVudGx5IGRlYWwgd2l0aCB2ZW5k
b3ItZGVmaW5lZCBleHRlbnNpb25zLgoKTWF5YmUgeW91IHNob3VsZCBnbyB0YWxrIHRvIHlvdSB0
ZWFtLCB0aGVuPyAgSGFuZGxpbmcgdmVuZG9yIGV4dGVuc2lvbnMgCnZpYSBod3Byb2JlIGhhcyBi
ZWVuIGRpc2N1c3NlZCwgc291bmRzIGxpa2UgeW91J3JlIGNvbmZ1c2VkIGFnYWluLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
