Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB14EB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 12:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZiHjvqtmWCOoaKK4GQZjk2nc/Od26v0NEJPsnC9iJe4=; b=V3Zwn5YAiPQLxH
	BSaHvTdLDkYaSkRto+fVj6hzUxCi9apTjrcswbMMLUTfJVuPyZMkTT77GTB+mI0oWDdjarLNgBW5Y
	EypvwiGxwLijrWeUvq26wImvuR3gGOjricOnfFx33dS0z33xdZ8SBmzdrYW2miybbFBOX/dOqykUf
	qHj2duxdlmRJa3mcnfBrhiNbBLIxKI5WZkFaGQ1lgA3DqMZEH0jVpmrfeCBMi/LRzVwtqTZCdCknp
	C5BREQnO2+49yADc203eCmimKpyMUF6BvhKiwxFRviF2OT4+J5e1uRqqOgwavVI7ibdviuy4mwVC9
	FrylPlsvkJAeCM5rnSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBa2s-00BC1H-2k;
	Tue, 20 Jun 2023 12:01:14 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBa2n-00BC03-2M
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 12:01:13 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b475b54253so34594691fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 05:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687262465; x=1689854465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFWQUb8YUAaWCnl1hQyep9GnOaoIB00JbWZuEOfrn1I=;
        b=ANe57mwHgrzuH3cCHjRIzRBAPUm5J5bTPcEqUYFT3Q6gJHqWjBUV3DvGxCpEsBodda
         2wHTFWlvV1wBHSCb5z+c+Lk0c2TjQchh548KB/0Ayio3nSx0fkiPBByA8bh6v3eBedmu
         FLJdy8x3AeaDbZ2YDMVc/xwKtpErXSQmitVGTMtQdp8os8ffBogcw1w9RrnqcIna4aRP
         7G9i1sv8lO4liOmiimWydz5G+pON4GIwLEC7q5TQfK0YlX63l7LYgLTu2i4JPFFZIYjx
         cHGKvtgDS6oNLJCgyh3MTTTezmEr1InlYb6AvaEDOzR3aHjbARiPtm+yBFnTagPQWTV3
         lClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687262465; x=1689854465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFWQUb8YUAaWCnl1hQyep9GnOaoIB00JbWZuEOfrn1I=;
        b=U7N5P9mX/zCENtfq3DGyTFER+IeIB84dyIvkqekjlX5fJPJJ7+ihFkj8vFvm3LzCQf
         PA8wCCfuwjrBuKA+i0ebKadg0Vxy6PbGoe8mlrZJLhvzR7CZEiv7EqA/83ln6d5BwlmE
         th6RpdKwQ9ejTvt+px4Oc4pl8GdHgAuEV3zKn0WBYINay1C6lRhQ6loTBAg4bD7bRGAs
         D14OmnhW+MLQO2tjJbnyDHl11o7QW8FukRseyH48F9Qu5bZlSQgHp1BlOvMp8T/yqfOg
         nbvU5ItTqPGrQdVZRsmgrcOI9u0OQ/r6kSUUJuDbP03t6pSEpZ3C7iVhRSXu17fbLfJT
         4hHA==
X-Gm-Message-State: AC+VfDxoFXUa9mQtxyW9nzo9gzoX6F/Y7gdWsZS2vyqrZt9ZwjrpiJii
	/XwsC7rlZBtTIA9rPQGZ/Ag+xJ3xr8CgFRi2XhSEsYze9ByZ3Bxqmq0=
X-Google-Smtp-Source: ACHHUZ6m6qAlPWlbn9FLMThfoWnqCrtX0nqoNL5PEOBMk2hqwmsq1Z24uhQOSAsNLMVTOrUGPwCAcWtO7SkZulDfBYw=
X-Received: by 2002:a05:6512:3290:b0:4f7:5f9e:fc59 with SMTP id
 p16-20020a056512329000b004f75f9efc59mr6842825lfe.39.1687262464918; Tue, 20
 Jun 2023 05:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
 <20230619-kerchief-unmixed-cfdbeb1cf242@wendy> <CAHVXubjV=0HNyc0-UMAQRQfi4ZUnwH8dmghV-BGogZsJiumtZA@mail.gmail.com>
 <20230619-sponge-armful-6beeaf4a8624@spud> <CAHVXubjHpdRpgrywwm1UTxwV99uCYOp9qhKBui9Ghff65yGmsQ@mail.gmail.com>
 <20230620-limes-glaring-4831955f7250@wendy>
In-Reply-To: <20230620-limes-glaring-4831955f7250@wendy>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 20 Jun 2023 14:00:53 +0200
Message-ID: <CAHVXubgaJ7m88_nh-pNrNGPG43P18Qv+6DmGJ6Gcb2DORJxqAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: riscv: Add early boot document
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_050109_992125_E3097BBF 
X-CRM114-Status: GOOD (  45.84  )
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgMTI6MzPigK9QTSBDb25vciBEb29sZXkKPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDIwLCAyMDIzIGF0IDEx
OjA5OjQ3QU0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDE5
LCAyMDIzIGF0IDY6MDDigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+ID4gPiBPbiBNb24sIEp1biAxOSwgMjAyMyBhdCAwNDowNDo1MlBNICswMjAwLCBBbGV4YW5k
cmUgR2hpdGkgd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBKdW4gMTksIDIwMjMgYXQgMjoyNuKAr1BN
IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+ID4gPiA+
ID4gT24gTW9uLCBKdW4gMTksIDIwMjMgYXQgMTE6NDc6MDRBTSArMDIwMCwgQWxleGFuZHJlIEdo
aXRpIHdyb3RlOgo+Cj4gPiA+ID4gPiA+ICtCb290Zmxvdwo+ID4gPiA+ID4KPiA+ID4gPiA+ICJC
b290IEZsb3ciLCBubz8KPiA+ID4gPiA+IEkgYW0gbm90IHN1cmUgdGhhdCB0aGlzIGlzIHRoZSAi
Y29ycmVjdCIgaGVhZGluZyBmb3IgdGhlIGNvbnRlbnQgaXQKPiA+ID4gPiA+IGRlc2NyaWJlcywg
YnV0IEkgaGF2ZSBub3RoaW5nIGJldHRlciB0byBvZmZlciA6Lwo+ID4gPiA+Cj4gPiA+ID4gWWVz
IHlvdSdyZSByaWdodCwgd2hhdCBhYm91dCBzaW1wbHkgIktlcm5lbCBFbnRyYW5jZSI/IE5vdCBz
dXJlIHRoaXMKPiA+ID4gPiBpcyBlYXNpbHkgdW5kZXJzdGFuZGFibGUgdGhvdWdoLgo+ID4gPgo+
ID4gPiAiTm9uLWJvb3QgSGFydCBJbml0aWFsaXNhdGlvbiI/Cj4gPgo+ID4gSG1tbSBub3QgdGhh
dCBncmVhdCBlaXRoZXIgKHNvcnJ5IGZvciBiZWluZyBkaXJlY3QgaGVyZSkKPgo+IGxvbCwgbm8g
bmVlZCB0byBhcG9sb2dpc2UuCj4KPiA+ID4gPiA+ID4gK1RoZXJlIGV4aXN0IDIgbWV0aG9kcyB0
byBlbnRlciB0aGUga2VybmVsOgo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICstIGBSSVNDVl9C
T09UX1NQSU5XQUlUYDogdGhlIGZpcm13YXJlIHJlbGVhc2VzIGFsbCBoYXJ0cyBpbiB0aGUga2Vy
bmVsLCBvbmUgaGFydAo+ID4gPiA+ID4gPiArICB3aW5zIGEgbG90dGVyeSBhbmQgZXhlY3V0ZXMg
dGhlIGVhcmx5IGJvb3QgY29kZSB3aGlsZSB0aGUgb3RoZXIgaGFydHMgYXJlCj4gPiA+ID4gPiA+
ICsgIHBhcmtlZCB3YWl0aW5nIGZvciB0aGUgaW5pdGlhbGl6YXRpb24gdG8gZmluaXNoLiBUaGlz
IG1ldGhvZCBpcyBub3cKPiA+ID4gPiA+Cj4gPiA+ID4gPiBuaXQ6IHMvbm93Ly8KPiA+ID4gPgo+
ID4gPiA+IE9rCj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBXaGF0IGRvIHlvdSBtZWFuIGJ5
IGRlcHJlY2F0ZWQ/IFRoZXJlJ3Mgbm8gcmVxdWlyZW1lbnQgdG8gaW1wbGVtZW50IHRoZQo+ID4g
PiA+ID4gSFNNIGV4dGVuc2lvbiwgcmlnaHQ/Cj4gPiA+ID4KPiA+ID4gPiBJIHdvdWxkIHNheSB5
ZXMsIHlvdSBoYXZlIHRvIHVzZSBhIHJlY2VudCB2ZXJzaW9uIG9mIG9wZW5TQkkgdGhhdAo+ID4g
PiA+IHN1cHBvcnRzIHRoZSBIU00gZXh0ZW5zaW9uLiBAQXRpc2ggS3VtYXIgUGF0cmEgV0RZVD8K
PiA+ID4KPiA+ID4gVWgsIHlvdSBkb24ndCBuZWVkIHRvIHVzZSBPcGVuU0JJIGluIHRoZSBmaXJz
dCBwbGFjZSwgbGV0IGFsb25lIHVzZSBhCj4gPiA+IHJlY2VudCB2ZXJzaW9uIG9mIGl0LCByaWdo
dD8gV2hhdCBhbSBJIG1pc3Npbmc/Cj4gPgo+ID4gWW91IG5lZWQgYSBNLU1vZGUgZmlybXdhcmUg
d2hpY2ggZm9sbG93cyB0aGUgU0JJIHNwZWNpZmljYXRpb24gYW5kCj4gPiB0aGF0IGltcGxlbWVu
dHMgdGhlIEhTTSBleHRlbnNpb24uCj4KPiBGaXJzdGx5LCBhbmQgbWF5YmUgSSBhbSBzaG93aW5n
IG15IGlnbm9yYW5jZSBoZXJlLCBidXQgd2UgZG8gc3VwcG9ydAo+IG0tbW9kZSBpbiBMaW51eCwg
YW5kIFNNUCBpcyBub3QgZGlzYWJsZWQgZm9yIG0tbW9kZSBrZXJuZWxzIHdoZXJlIGl0IGlzCj4g
cmVxdWlyZWQgdG8gdXNlIHRoZSBzcGlud2FpdCBtZXRob2QuCgpZb3UncmUgcmlnaHQuCgo+IFNl
Y29uZGx5LCBJIGRvbid0IHRoaW5rIHRoYXQgd2UndmUgYWN0dWFsbHkgbm90ZWQgdGhhdCBub24t
SFNNIGJvb3RpbmcKPiBpcyBkZXByZWNhdGVkIGJlZm9yZSBub3cgLSBhdCBsZWFzdCBub3Qgc29t
ZXdoZXJlIG9idmlvdXNseS4gVGhpbmdzIGxpa2UKPiB0aGUgcGxhdGZvcm0gc3BlYyBvbiBnaXRo
dWIgbWlnaHQgcmVxdWlyZSBpdCAmIGl0IG1heSBiZSBkZXByZWNhdGVkIGluCj4gU0JJIGltcGxl
bWVudGF0aW9ucyBldGMsIGJ1dCBpbiB0aGUgS2NvbmZpZyBvcHRpb24gaXQgaXMgbm90IGRlc2Ny
aWJlZAo+IGFzIGRlcHJlY2F0ZWQuIFRoZSBLY29uZmlnIG9wdGlvbiBvbmx5IHNheXMgdGhhdCBp
dCAic2hvdWxkIGJlIG9ubHkKPiBlbmFibGVkIGZvciBNLW1vZGUgTGludXggb3IgcGxhdGZvcm1z
IHJlbHlpbmcgb24gb2xkZXIgZmlybXdhcmUgd2l0aG91dAo+IFNCSSBIU00gZXh0ZW5zaW9uIi4K
PiBJIHRoaW5rIG1hcmtpbmcgaXQgYXMgZGVwcmVjYXRlZCBoZXJlIGlzIG5vdCBhY2N1cmF0ZSwg
YW5kIGluc3RlYWQgd2UKPiB3b3VsZCBiZSBiZXR0ZXIgb2ZmIHBvaW50aW5nIG91dCB3aGF0IHRo
ZSBsaW1pdGF0aW9ucyBvZiB0aGUgbWV0aG9kIGFyZQo+IGFuZCBub3RpbmcgdGhlIGxpbWl0ZWQg
c2l0dWF0aW9ucyB3aGVuIGl0IHNob3VsZCBiZSB1c2VkLgoKWW91J3JlIHJpZ2h0IGFnYWluLCBi
ZWZvcmUgdGhpcyBpcyBvZmZpY2lhbGx5IGRlcHJlY2F0ZWQsIEknbGwgcG9pbnQKb3V0IHRoZSBs
aW1pdGF0aW9ucyBvZiB0aGlzIG1ldGhvZCBvbmx5IGFzIGZvbGxvd3M6CgpLZXJuZWwgZW50cmFu
Y2UKLS0tLS0tLS0tLS0tLS0tCgpPbiBTTVAgc3lzdGVtcywgdGhlcmUgYXJlIDIgbWV0aG9kcyB0
byBlbnRlciB0aGUga2VybmVsOgoKLSBgUklTQ1ZfQk9PVF9TUElOV0FJVGA6IHRoZSBmaXJtd2Fy
ZSByZWxlYXNlcyBhbGwgaGFydHMgaW4gdGhlIGtlcm5lbCwgb25lIGhhcnQKICB3aW5zIGEgbG90
dGVyeSBhbmQgZXhlY3V0ZXMgdGhlIGVhcmx5IGJvb3QgY29kZSB3aGlsZSB0aGUgb3RoZXIKaGFy
dHMgYXJlCiAgcGFya2VkIHdhaXRpbmcgZm9yIHRoZSBpbml0aWFsaXphdGlvbiB0byBmaW5pc2gu
IFRoaXMgbWV0aG9kIGlzIG1vc3RseSB1c2VkIHRvCiAgc3VwcG9ydCBvbGRlciBmaXJtd2FyZXMg
d2l0aG91dCBTQkkgSFNNIGV4dGVuc2lvbiBhbmQgTS1tb2RlIFJJU0MtVgprZXJuZWwuCi0gYE9y
ZGVyZWQgYm9vdGluZ2A6IHRoZSBmaXJtd2FyZSByZWxlYXNlcyBvbmx5IG9uZSBoYXJ0IHRoYXQg
d2lsbApleGVjdXRlIHRoZQogIGluaXRpYWxpemF0aW9uIHBoYXNlIGFuZCB0aGVuIHdpbGwgc3Rh
cnQgYWxsIG90aGVyIGhhcnRzIHVzaW5nIHRoZSBTQkkgSFNNCiAgZXh0ZW5zaW9uLiBUaGUgb3Jk
ZXJlZCBib290aW5nIG1ldGhvZCBpcyB0aGUgcHJlZmVycmVkIGJvb3RpbmcKbWV0aG9kIGZvcgog
IGJvb3RpbmcgdGhlIFJJU0MtViBrZXJuZWwgYmVjYXVzZSBpdCBjYW4gc3VwcG9ydCBjcHUgaG90
cGx1ZyBhbmQga2V4ZWMuCgo+Cj4gPiA+IEFsc28sIHdoYXQgYWJvdXQgIVNNUCBzeXN0ZW1zPyBB
bHRob3VnaCBteSBzdWdnZXN0ZWQgbmV3IHNlY3Rpb24gdGl0bGUKPiA+ID4ga2luZGEgYWRkcmVz
c2VzIHRoYXQhCj4gPgo+ID4gSSdsbCBhZGQgIk9uIFNNUCBzeXN0ZW1zLCB0aGVyZSBleGlzdCAy
IG1ldGhvZHMgdG8gZW50ZXIgdGhlCj4KPiBuaXQ6IHMvZXhpc3QvYXJlLwo+Cj4gPiBrZXJuZWw6
Li4uLiIsIEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0byBkZXRhaWwgdGhlICFTTVAgY2FzZSBhcyBp
dCBpcwo+ID4gb2J2aW91cy4KPgo+IFRoYXQncyBmaW5lLiBNYXliZSBJIGFtIGp1c3QgYSBwZWRh
bnQsIGJ1dCBJIHRoaW5rIGl0IGlzIGdvb2QgdG8gYmUgYQo+IGJpdCBvdmVyIHByZWNpc2UuCj4K
PiA+ID4gPiA+ID4gKyAgKipkZXByZWNhdGVkKiouCj4gPiA+ID4gPiA+ICstIE9yZGVyZWQgYm9v
dGluZzogdGhlIGZpcm13YXJlIHJlbGVhc2VzIG9ubHkgb25lIGhhcnQgdGhhdCB3aWxsIGV4ZWN1
dGUgdGhlCj4gPiA+ID4gPiA+ICsgIGluaXRpYWxpemF0aW9uIHBoYXNlIGFuZCB0aGVuIHdpbGwg
c3RhcnQgYWxsIG90aGVyIGhhcnRzIHVzaW5nIHRoZSBTQkkgSFNNCj4gPiA+ID4gPiA+ICsgIGV4
dGVuc2lvbi4KPgo+ID4gPiA+ID4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ID4gK1RoZSBpbnN0YWxsYXRpb24gb2YgdGhlIHZpcnR1YWwgbWFwcGluZyBp
cyBkb25lIGluIDIgc3RlcHMgaW4gdGhlIFJJU0MtViBrZXJuZWw6Cj4gPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ID4gKzEuIDpjOmZ1bmM6YHNldHVwX3ZtYCBpbnN0YWxscyBhIHRlbXBvcmFyeSBrZXJu
ZWwgbWFwcGluZyBpbgo+ID4gPiA+ID4gPiArICAgOmM6dmFyOmBlYXJseV9wZ19kaXJgIHdoaWNo
IGFsbG93cyB0byBkaXNjb3ZlciB0aGUgc3lzdGVtIG1lbW9yeTogb25seSB0aGUKPiA+ID4gPiA+
Cj4gPiA+ID4gPiBzL3RvIGRpc2NvdmVyL2Rpc2NvdmVyeSBvZi8KPiA+ID4gPgo+ID4gPiA+IFlv
dSBtZWFuICJ0aGUgZGlzY292ZXJ5IG9mIiByaWdodD8KPiA+ID4KPiA+ID4gTm8/IFRoZSAidGhl
IiB0aGVyZSB3b3VsZCBub3QgYmUgcmVxdWlyZWQuCj4gPgo+ID4gVGhhdCB3YXMgYSBnZW51aW5l
IHF1ZXN0aW9uLCB0aGFua3MKPgo+IFNvcnJ5IGlmIHRoZSAiTm8/IiBjYW1lIGFjcm9zcyBhcyBh
Z2dyZXNzaXZlLCBJIG1lYW50IGl0IGlucXVpc2l0aXZlbHkuCj4gQWRkaW5nIHRoZSAidGhlIiBj
aGFuZ2VzIHRoZSBtZWFuaW5nIHNsaWdodGx5LCBidXQgbm90IGluIGEgd2F5IHRoYXQKPiB0aGF0
IGlzIHJlbGV2YW50IGhlcmUuCgpObyB3b3JyaWVzIDopCgo+Cj4gPiA+ID4gPiA+ICtQcmUtTU1V
IGV4ZWN1dGlvbgo+ID4gPiA+ID4gPiArLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gPiA+ID4gKwo+
ID4gPiA+ID4gPiArQW55IGNvZGUgdGhhdCBleGVjdXRlcyBiZWZvcmUgZXZlbiB0aGUgZmlyc3Qg
dmlydHVhbCBtYXBwaW5nIGlzIGVzdGFibGlzaGVkCj4gPiA+ID4gPiA+ICttdXN0IGJlIHZlcnkg
Y2FyZWZ1bGx5IGNvbXBpbGVkIGFzOgo+ID4gPiA+ID4KPiA+ID4gPiA+IENvdWxkIHlvdSBwb2lu
dCBvdXQgd2hhdCB0aGUgbm9uLW9idmlvdXMgZXhhbXBsZXMgb2YgdGhpcyBjb2RlIGFyZT8KPiA+
ID4gPgo+ID4gPiA+IEkgY2FuIGRvIGEgbGlzdCwgeWVzCj4gPiA+Cj4gPiA+IE5vdCBldmVuIGEg
bGlzdCwganVzdCBzb21ldGhpbmcgbGlrZSAiLi4uZXN0YWJsaXNoZWQsIGZvciBleGFtcGxlIGVh
cmx5Cj4gPiA+IGFsdGVybmF0aXZlcyBhbmQgZm9vLCBtdXN0IGJlIHZlcnkuLi4iCj4gPgo+ID4g
RG9uZSBhcyBmb2xsb3dzOgo+ID4KPiA+ICJBIGZldyBwaWVjZXMgb2YgY29kZSBuZWVkIHRvIHJ1
biBiZWZvcmUgZXZlbiB0aGUgZmlyc3QgdmlydHVhbCBtYXBwaW5nIGlzCj4gPiBlc3RhYmxpc2hl
ZCwgdGhhdCBjb21wcmlzZXMgdGhlIGluc3RhbGxhdGlvbiBvZiB0aGUgZmlyc3QgdmlydHVhbCBt
YXBwaW5nLCB0aGUKPiA+IGVhcmx5IGFsdGVybmF0aXZlcyBhbmQgdGhlIGVhcmx5IHBhcnNpbmcg
b2YgdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUuIFRoYXQgY29kZQo+ID4gbXVzdCBiZSB2ZXJ5IGNh
cmVmdWxseSBjb21waWxlZCBhczouLi4iCj4KPiBDaGFuZ2VkIHNsaWdodGx5Ogo+ICJBIGZldyBw
aWVjZXMgb2YgY29kZSBuZWVkIHRvIHJ1biBiZWZvcmUgZXZlbiB0aGUgZmlyc3QgdmlydHVhbCBt
YXBwaW5nIGlzCj4gZXN0YWJsaXNoZWQuIFRoZXNlIGFyZSB0aGUgaW5zdGFsbGF0aW9uIG9mIHRo
ZSBmaXJzdCB2aXJ0dWFsIG1hcHBpbmcgaXRzZWxmLAo+IHBhdGNoaW5nIG9mIGVhcmx5IGFsdGVy
bmF0aXZlcyBhbmQgdGhlIGVhcmx5IHBhcnNpbmcgb2YgdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUu
Cj4gVGhhdCBjb2RlIG11c3QgYmUgdmVyeSBjYXJlZnVsbHkgY29tcGlsZWQgYXM6Li4uIgo+Cj4g
VHdvIG1pbm9yIHN1Z2dlc3Rpb25zIHRoZXJlLCBvbmUgdG8gbWFrZSB0aGUgaXQgbW9yZSBvYnZp
b3VzIHdoYXQgdGhlIGZpcnN0Cj4gc2VjdGlvbiBpbnNpZGUgY29tbWFzIHJlZmVycyB0byAmIG9u
ZSB0byBub3RlIHdoYXQgaXQgaXMgdGhhdCB3ZSBkbyB3aXRoCj4gdGhlIGFsdGVybmF0aXZlcy4K
PgoKVGhhbmtzCgo+IENoZWVycywKPiBDb25vci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
