Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5640C77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 17:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ragDCyfvxW7KlYv6d64PEK/UREP3gv5YvPAbp8i9B2w=; b=DqNDVx2jOzB0/n
	kW+XgShui6JdrRKYRnWxDB1zmKxYAypwNIBPKgNVc3nY9nq1/EflWf/8CrrtqQpVmyt7ZZrUv36R2
	h9CH20LEs+0oVJvY6ep+aUTeVGWc+YweSVBYFg9IKWF/+skGWhXV6guCZTxUnCCXux+QNSDeQcNr0
	nKYoRVC9YJsn0KBBy73/dhXtX3BN8hExkXG5aHZmRPcgbXHOBzPxI0Nl0XMaIIr2CI0WCGQVgDKth
	FNtOqMW/SYfD+cg3JM3z8Mf4ANjVPEtWHPKLXkls4BLiWPlDOxKKg6El4F3rOUwUePXl9xPKXggrQ
	3cobSD32QJzqEcEzVsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw4oR-0014Ay-2x;
	Mon, 08 May 2023 17:38:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw4oK-0014AM-2H
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 17:38:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f41d087b3bso22991285e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 10:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1683567485; x=1686159485;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M25WATLyhzQhxEa9d8o7KkxKQW/wNscePwtVST5KSrQ=;
        b=VE2s1SsbDx/aXrQS0NgPAk+WgOdHzf/3QqunudodyRdICX4j2qtYPKHQkGHIIrqlNx
         sx4mZcdMePOV2XyS4GUz43h30N5lR0N91qh2enquQDOHWMxCmhEogmN550EVNPOOajmC
         T0x2AFGIgbbpZS7DvVlBhuJ44DTjHR30UUw4NrL3yOb5M6b2+KA6kUoAsVoN1mQ1iyzl
         OVNvBRkmjh21X5KkqzBak91XB+t/0QQXsjirTPr/Q6+YcYKJ9HGxU2l1QjkwKW3s9zyq
         thAzQHhJR6/mHDxLulIlbitkOXbcetIB+3lFg17tvUW6gvs/DcD0KGz1MCjvPNuM/TFp
         AfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683567485; x=1686159485;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M25WATLyhzQhxEa9d8o7KkxKQW/wNscePwtVST5KSrQ=;
        b=K/KCR/uIGB+eDmEF6uO0zgA3XnD5UOi1ula6BoM144HSjKLVedryaKhBTnRbmtExwa
         63Hd5bH89rLd+O2R+9DcRQUOPiuagrnpEwm00/qi4rW++xtj/5gfiayRMbUuheQTI8lo
         63qD+a6F6Cwe4dITnbP1YOiXUt0uC6mwQ0q3FW7p03iKtIx0kjzTuBU2neBnj4Yu+C8G
         G4brnJiB7tSk2TfkgWkqXL34kdHBRmVaDHDHIhyvjkBeHwFKDng5gzH9TqhC2GS48JvF
         METK8pKYAfyYDepfkjaLm3scUcG3Uk5hNijv8t5QdDHpFBNJXQfXMozWF7xS/q4C7Vtl
         WF3g==
X-Gm-Message-State: AC+VfDylC4kmUtKHL6I2MplLz13w2RLcvMI7SMuyj1XqQ10WT7WaWFTZ
	PZ5QJxP5A9cb5BOF3ZO+k4XdaA==
X-Google-Smtp-Source: ACHHUZ5bFycPjjdZDy4zh3O1GgESwHukk7T6kJrOeduza6REZE6xLKd6D6eBN/8xMKM7PgA1xNoiXw==
X-Received: by 2002:a5d:470b:0:b0:306:2ddb:47ab with SMTP id y11-20020a5d470b000000b003062ddb47abmr8138690wrq.39.1683567485115;
        Mon, 08 May 2023 10:38:05 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id z18-20020a1c4c12000000b003f188f608b9sm17420521wmf.8.2023.05.08.10.38.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 May 2023 10:38:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH 0/4] Expose the isa-string via the AT_BASE_PLATFORM aux
 vector
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAAeLtUCUNV36JQNQ1REzbe8Wwk-JvEOqpOZp2udYxfNPOqq3hQ@mail.gmail.com>
Date: Mon, 8 May 2023 18:38:03 +0100
Cc: Evan Green <evan@rivosinc.com>,
 =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 matthias.bgg@gmail.com,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 nick.knight@sifive.com,
 =?utf-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Message-Id: <7F569E2F-EDE5-452D-91B8-3781B611E438@jrtc27.com>
References: <mhng-4b9e3d86-2f0b-47da-8a5d-bd383a0171d6@palmer-ri-x1c9>
 <4830085.8hb0ThOEGa@diego>
 <CALs-HsveK-uUuSAOkUUPuUYK6_ChG95_YWtdwYvGsTfKYSWUpg@mail.gmail.com>
 <CAAeLtUDgWwT0wxhFANagBX4ExA_HkyqM-ZdPn==+_atGV3vTww@mail.gmail.com>
 <CAAeLtUCUNV36JQNQ1REzbe8Wwk-JvEOqpOZp2udYxfNPOqq3hQ@mail.gmail.com>
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_103808_799268_6684F352 
X-CRM114-Status: GOOD (  28.40  )
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

T24gOCBNYXkgMjAyMywgYXQgMTg6MzQsIFBoaWxpcHAgVG9tc2ljaCA8cGhpbGlwcC50b21zaWNo
QHZydWxsLmV1PiB3cm90ZToKPiAKPiBbUmVzZW5kLCBhcyBteSBtYWlsIGNsaWVudCBoYWRuJ3Qg
cGlja2VkIHVwIHRoYXQgaXQgc2hvdWxkIHJlc3BvbmQgYXMKPiBwbGFpbi10ZXh0Ll0KPiAKPiBP
biBNb24sIDggTWF5IDIwMjMgYXQgMTk6MzIsIFBoaWxpcHAgVG9tc2ljaCA8cGhpbGlwcC50b21z
aWNoQHZydWxsLmV1PiB3cm90ZToKPj4gCj4+IEV2YW4sCj4+IAo+PiBPbiBNb24sIDggTWF5IDIw
MjMgYXQgMTg6NTAsIEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPiB3cm90ZToKPj4+IAo+
Pj4gT24gV2VkLCBNYXkgMywgMjAyMyBhdCAzOjMx4oCvQU0gSGVpa28gU3TDvGJuZXIgPGhlaWtv
QHNudGVjaC5kZT4gd3JvdGU6Cj4+Pj4gCj4+Pj4gSGksCj4+Pj4gCj4+Pj4gQW0gRGllbnN0YWcs
IDIuIE1haSAyMDIzLCAxOToxNToyOSBDRVNUIHNjaHJpZWIgUGFsbWVyIERhYmJlbHQ6Cj4+Pj4+
IE9uIFR1ZSwgMDIgTWF5IDIwMjMgMDI6MTM6MTAgUERUICgtMDcwMCksIHBoaWxpcHAudG9tc2lj
aEB2cnVsbC5ldSB3cm90ZToKPj4+Pj4+IE9uIFR1ZSwgMiBNYXkgMjAyMyBhdCAwOTo1OCwgQmrD
tnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4+Pj4gCj4+Pj4+Pj4gUGhp
bGlwcCBUb21zaWNoIDxwaGlsaXBwLnRvbXNpY2hAdnJ1bGwuZXU+IHdyaXRlczoKPj4+Pj4+PiAK
Pj4+Pj4+Pj4gSXQgaXMgYSBwaXR5IHRoYXQgdGhlIGN1cnJlbnQgaW50ZXJmYWNlIHdhcyBkZXNp
Z25lZCB3aXRob3V0IGludm9sdmluZwo+Pj4+Pj4+PiBSVkkgKGFuZCB0aGF0IEkgaGFkIHRvIGFz
ayBteSB0ZWFtIHRvIHB1dCB0b2dldGhlciBhIHBhdGNoIHNldCBmb3IKPj4+Pj4+Pj4gZnVydGhl
ciBkaXNjdXNzaW9uLCBnaXZlbiB0aGF0IG5vbmUgb2YgdGhlIG90aGVyIG1ham9yIHZlbmRvcnMg
aW4gUlZJCj4+Pj4+Pj4+IHN0ZXBwZWQgZm9yd2FyZCkuICBJIGd1YXJhbnRlZSB0aGF0IHBsZW50
eSBvZiByZXZpZXdlcnMgd291bGQgaGF2ZQo+Pj4+Pj4+PiBoaWdobGlnaHRlZCB0aGF0IGEgY2Vu
dHJhbCByZWdpc3RyeSAoZXZlbiBpZiBpdCBpcyBqdXN0IGEga2VybmVsCj4+Pj4+Pj4+IGhlYWRl
cikgc2hvdWxkIGJlIGF2b2lkZWQuCj4+Pj4+Pj4gCj4+Pj4+Pj4gQXJlIHlvdSBjbGFpbWluZyB0
aGF0IHRoZSBod3Byb2JlIHdvcmsgd2FzIG5vdCBkb25lIGluIHRoZSBvcGVuLCBidXQKPj4+Pj4+
PiBzZWNyZXRseSBtZXJnZWQ/IFRoYXQgaXMgbm90IG9ubHkgaW5jb3JyZWN0LCBidXQgcnVkZSB0
byB1cHN0cmVhbSBSSVNDLVYKPj4+Pj4+PiBMaW51eCBkZXZlbG9wZXJzLiBJIHN1Z2dlc3QgeW91
IHJldmlldyBob3cgeW91IGludGVyYWN0IHdpdGggdXBzdHJlYW0KPj4+Pj4+PiBrZXJuZWwgd29y
ay4KPj4+Pj4+IAo+Pj4+Pj4gUGxlYXNlIGRvbid0IHB1dCB3b3JkcyBpbnRvIG15IG1vdXRoLi4u
Cj4+Pj4+PiAKPj4+Pj4+IEkgd2FzIG1lcmVseSBwb2ludGluZyBvdXQgdGhhdCB0aGVyZSB3YXMg
bm8gZW5nYWdlbWVudCBieSB0aGUgUlZJCj4+Pj4+PiBtZW1iZXIgY29tcGFuaWVzIChpbiByZWdh
cmQgdG8gdGhpcyBtZWNoYW5pc20pIHdpdGhpbiBSVkksIHdoaWNoIHdvdWxkCj4+Pj4+PiBoYXZl
IHByZXZlbnRlZCBKZXNzaWNhJ3MgaXNzdWUuCj4+Pj4+PiBUaGlzIHdvdWxkIGhhdmUgYWxzbyBo
ZWxwZWQgdG8gYWRkcmVzcyB0aGUgY29uY2VybnMgb24gdmVuZG9yLWRlZmluZWQKPj4+Pj4+IGV4
dGVuc2lvbnMuCj4+Pj4+PiAKPj4+Pj4+IEFsc28gd2hvIGRvIHlvdSByZWZlciB0byB3aGVuIHlv
dSBzYXkgImhvdyBfeW91XyBpbnRlcmFjdCI/ICBJZiBpdCBpcwo+Pj4+Pj4gUlZJIHRoYXQgeW91
IHJlZmVyIHRvOiBpdCBkb2Vzbid0IGludGVyYWN0IHdpdGggdXBzdHJlYW0gd29yawo+Pj4+Pj4g
ZGlyZWN0bHksIGFzIGl0IGRvZXNuJ3Qgb3duIGFueSBlbmdpbmVlcmluZyByZXNvdXJjZXMuCj4+
Pj4+PiBSVkkgcHJvdmlkZXMgYSBmb3J1bSBmb3IgbWVtYmVyIGNvbXBhbmllcyB0byBjb21lIHRv
IGFuCj4+Pj4+PiB1bmRlcnN0YW5kaW5nL2Rlc2lnbiBhbmQgdGhlbiBoYXZlIHRoZSBtZW1iZXIg
Y29tcGFuaWVzIHBlcmZvcm0gdGhlCj4+Pj4+PiB3b3JrIGFuZCB0YWtlIGl0IHVwc3RyZWFtLgo+
Pj4+PiAKPj4+Pj4gSSdtIG5vdCBldmVuIHN1cmUgd2hhdCB5b3UncmUgbG9va2luZyBmb3IgaGVy
ZTogaWYgUlZJIGRvZXNuJ3Qgd2FudCB0bwo+Pj4+PiB3b3JrIHVwc3RyZWFtLCB0aGVuIGNvbXBs
YWluaW5nIHRoYXQgUlZJIGlzbid0IHBhcnQgb2YgdXBzdHJlYW0KPj4+Pj4gZGlzY3Vzc2lvbnMg
aXMgcHJldHR5IHBvaW50bGVzcy4KPj4+Pj4gCj4+Pj4+Pj4gV2h5IGRpZG4ndCBSVkkgZ2V0IGlu
dm9sdmVkIGluIHRoZSByZXZpZXcgb2YgdGhlIHNlcmllcz8gVGhlIGV4cGVjdGF0aW9uCj4+Pj4+
Pj4gY2Fubm90IGJlIHRoYXQgYWxsIG9wZW4gc291cmNlIHByb2plY3RzIGdvIHRvIFJWSSwgYnV0
IHJhdGhlciB0aGUgb3RoZXIKPj4+Pj4+PiB3YXkgYXJvdW5kLgo+Pj4+Pj4gCj4+Pj4+PiBUaGF0
IGlzIGV4YWN0bHkgdGhlIHBvaW50IEkgd2FzIG1ha2luZyBhbmQgd2hpY2ggeW91IHNlZW0gdG8g
bWlzczogUlZJCj4+Pj4+PiBkb2VzIG5vdCBvd24gYW55IGVuZ2luZWVyaW5nIHJlc291cmNlcyBh
bmQgZGVwZW5kcyBzb2xlbHkgb24gaXRzCj4+Pj4+PiBtZW1iZXIgY29tcGFuaWVzIHRvIHByb2pl
Y3QgaW50byBvcGVuIHNvdXJjZSBwcm9qZWN0cy4KPj4+Pj4+IAo+Pj4+Pj4+IFRha2UgYSBsb29r
IGF0IGNvbW1pdCBlYTNkZTljZThhYTIgKCJSSVNDLVY6IEFkZCBhIHN5c2NhbGwgZm9yIEhXCj4+
Pj4+Pj4gcHJvYmluZyIpLiBZb3VyIHRlYW0gd2FzIHZlcnkgbXVjaCBpbnZvbHZlZCBpbiB0aGUg
cmV2aWV3Lgo+Pj4+Pj4gCj4+Pj4+PiBJIGFtIGF3YXJlLCBhcyBJIGhhZCByZXZpZXdlZCBhbmQg
Y29tbWVudGVkIG9uIHRoZXNlIGFyZSB3ZWxsLgo+Pj4+Pj4gQW5kIG15IG9ubHkgcmVxdWVzdCAo
d2FzIGFuZCkgaXMgdGhhdCB3ZSBuZWVkIHRvIGZpZ3VyZSBvdXQgYSB3YXkgdG8KPj4+Pj4+IGVm
ZmljaWVudGx5IGRlYWwgd2l0aCB2ZW5kb3ItZGVmaW5lZCBleHRlbnNpb25zLgo+Pj4+PiAKPj4+
Pj4gTWF5YmUgeW91IHNob3VsZCBnbyB0YWxrIHRvIHlvdSB0ZWFtLCB0aGVuPyAgSGFuZGxpbmcg
dmVuZG9yIGV4dGVuc2lvbnMKPj4+Pj4gdmlhIGh3cHJvYmUgaGFzIGJlZW4gZGlzY3Vzc2VkLCBz
b3VuZHMgbGlrZSB5b3UncmUgY29uZnVzZWQgYWdhaW4uCj4+Pj4gCj4+Pj4gSSB0b28gaGF2ZSB0
aGlzIHZhZ3VlIG1lbW9yeSBvZiB1cyB0YWxraW5nIGFib3V0IHZlbmRvciBleHRlbnNpb25zLAo+
Pj4+IGJ1dCBteSBtZW1vcnkgaXMgcmVhbGx5IGJhZCBmb3Igc3R1ZmYgbGlrZSB0aGlzLCBzbyBJ
IHNwZW50IHRoZSBtb3JuaW5nCj4+Pj4gY29tYmluZyB0aHJvdWdoIGFsbCB0aGUgaHdwcm9iZSBp
dGVyYXRpb25zIGxvb2tpbmcgZm9yIGl0LCBidXQgc28gZmFyCj4+Pj4gaGF2ZSBvbmx5IGZvdW5k
Cj4+Pj4gCj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQUxzLUhzdG9lb1RXalRF
WnJMV291Q2d3cTB0M3REQjZ1TD10QjY4UkpEczF1YjRGcndAbWFpbC5nbWFpbC5jb20vCj4+Pj4g
Cj4+Pj4gSSdtIG1vc3QgbGlrZWx5IGp1c3QgYmxpbmQsIGJ1dCBkb2VzIHNvbWVvbmUgaGF2ZSBh
bm90aGVyIHBvaW50ZXI/Cj4+PiAKPj4+IEhlbGxvISBUaGF0J3MgcHJvYmFibHkgdGhlIG9ubHkg
cG9pbnRlci4KPj4gCj4+IAo+PiBUaGFua3MgZm9yIGZvbGxvd2luZyB1cCwgYXMgd2Ugd2VyZSBk
ZWJhdGluZyBpbnRlcm5hbGx5IGlmIGFuZCB3aGF0IGRpc2N1c3Npb25zIHdlIGhhZCBtaXNzZWQu
Cj4+IAo+Pj4gCj4+PiBDb3VsZG4ndCBoYW5kbGluZyB2ZW5kb3IgZXh0ZW5zaW9ucyB3aXRoaW4g
dGhlIGh3cHJvYmUgZnJhbWV3b3JrIGJlIGFzCj4+PiBzdHJhaWdodGZvcndhcmQgYXMgZXhwbGlj
aXRseSBjYXJ2aW5nIG91dCBhIHJlZ2lvbiBmb3IgdGhlbT8gU2F5Cj4+PiAweDgwMDAwMDAwMDAw
MDAwMDArIGJlbG9uZ3MgdG8gdGhlIHZlbmRvcj8gVGhlIGxheW91dCBvZiBrZXlzIHdpdGhpbgo+
Pj4gdGhlIHZlbmRvciBod3Byb2JlIHJlZ2lvbiB0aGVuIGRlcGVuZHMgb24gdGhlIHZhbHVlIGlu
IG12ZW5kb3JpZCAoYW5kCj4+PiBpZiB0aGUgdmVuZG9yIHNvIGNob29zZXMsIGFyY2hpZCBhbmQg
aW1waWQgYXMgd2VsbCkuIFRoZW4gdmVuZG9ycyBjYW4KPj4+IGV4cG9zZSBrZXlzIHRvIHRoZWly
IGhlYXJ0cyAoYXZvaWRpbmcgdGhlIGR1bWIgcHVuIHRoZXJlKSBjb250ZW50Lgo+Pj4gCj4+PiBX
ZSBjYW4gcHJvYmFibHkgc2tpcCBjYWNoaW5nIHRoZSB2ZW5kb3Iga2V5cyBpbiB0aGUgdkRTTyBm
b3Igbm93LiBJZgo+Pj4gaXQgcmVhbGx5IG5lZWRzIHRvIGJlIGRvbmUgd2UgY2FuIGFkZCBpdCBs
YXRlci4KPj4+IAo+Pj4gVGhpcyB3b3VsZCBlbmZvcmNlIHRoYXQgdGhlcmUncyBvbmx5IG9uZSAi
dmVuZG9yIiBhdCBhIHRpbWUgZm9yIGEKPj4+IGdpdmVuIGhhcnQsIGJ1dCBJIHRoaW5rIHRoYXQn
cyByZWFzb25hYmxlLiBMZXQgbWUga25vdyB3aGF0IHlvdSB0aGluay4KPj4gCj4+IAo+PiBXZSBn
ZW5lcmFsbHkgdHJ5IHRvIHRyZWF0IHZlbmRvci1leHRlbnNpb25zIGFzICJ2ZW5kb3ItZGVmaW5l
ZCIgYW5kIG5vdCAidmVuZG9yLXNwZWNpZmljIi4gIEluIG90aGVyIHdvcmRzLCBhbiBpbXBsZW1l
bnRvciB3b3VsZCBiZSBmcmVlIHRvIGltcGxlbWVudCBYVmVudGFuYUNvbmRPcCBhbmQgWFRIZWFk
VkRvdC4gIFdoaWxlIHdlIGNvdWxkIHNpbXBseSBhbGlhcyB0aGluZ3MgaW50byB0aGUgaW1wbGVt
ZW50b3IncyAidmVuZG9yIi1zcGFjZSwgSSBzZWUgc29tZSBiZW5lZml0cyB0byBoYXZpbmcgYSB1
bmlxdWUgaWQgZm9yIGV2ZXJ5IHZlbmRvci1kZWZpbmVkIHByb3BlcnR54oCmCj4+IAo+PiBDb3Vs
ZCB3ZSB1c2UgKCAweDgwMDAwMDAwMDAwMDAwMDAgfCB2ZW5kb3ItaWQgPDwgVkVORE9SX1NISUZU
IHwga2V5LWluLXZlbmRvci1zcGFjZSApPwo+PiBJZiBzbywgZG8gd2UgaGF2ZSB2ZW5kb3ItaWRz
IGFsbG9jYXRlZCB0b2RheSB0aGF0IHdlIGNvdWxkIHVzZSBmb3IgdGhpcyBwdXJwb3NlPwoKVGhl
IG9ubHkgc29tZXdoYXQgdXNlZnVsIG9uZSBpcyBtdmVuZG9yaWQsIGJ1dCB0aGF04oCZcyBhIEpF
REVDIHRoaW5nIHNvCmlmIHlvdeKAmXJlIGFuIGFjYWRlbWljIHRoZW4geW91cnMgd2lsbCBiZSAw
IGFuZCB3ZeKAmXJlIGJhY2sgdG8gYSBzaGFyZWQKbmFtZXNwYWNlLgoKSmVzcwoKPj4gVGhhbmtz
LAo+PiBQaGlsaXBwLgo+PiAKPj4+IAo+Pj4gCj4+PiAtRXZhbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
