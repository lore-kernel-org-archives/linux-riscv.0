Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADA1C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Apr 2022 19:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHJw52BzMi9vOdZd4rV2X2p16/+x9QXW1OZT+/RNN3w=; b=MJDwTgo7WMPjt6gYJwcJg87QaN
	FcAyXe7l6fkRcTT+Mq8DiPMC4w1YCPEyG1J+P1tTw8l9H4GEUyDWxlZTai35aR/PDkHH+uFbZG2Gs
	C8jrKBB4h7Vyl1C9gDCoVsBBY75r9zNYNyoy+WAkvVBNfJN4vPPGGBGgtE5SdhajkrIrZR4/zJCtK
	Pk9UlXTwXmtRx4h9njIfdKC3o84JY6p0jZ4tbflrbEps10429dPZ0AyUG7QhB3JCogBIooB6QLbdJ
	1R/SN0Eq+xKuUkmmF4O58vzBhHZndQ6DdgZ4bEua2vcsr3CRC3HbrhVvl3gI9wSxT3RWdmpgSle2f
	NlHfiQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkW8W-00CJcN-18; Fri, 29 Apr 2022 19:18:40 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkW8S-00CJZ9-Lx
 for linux-riscv@lists.infradead.org; Fri, 29 Apr 2022 19:18:38 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 23TJIKtX068990
 for <linux-riscv@lists.infradead.org>; Fri, 29 Apr 2022 22:18:20 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1651259895; x=1653851895;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BqOKa8AtSZmxxbB7EZVp+eH4ck8Ou2iydBBlT5ZDTMI=;
 b=YMQHCjdYRN5ORiMTOPRaTYnEnL4FVJkozhCD7/XQyF3XmXKFnBGO1kR6LJchQVsV
 31vV+Jp7iSMQrD0vVYGBm0faLsPTLG4Vaq+54zHfZZeePulDR2W+6NDivCfV/lR5
 PfLGY92Upr5HVTss3tyfjyXOqF2vJJ86Sy4li/arXjKIyjRThWyXgFa0cCMJEdwg
 r/suP0yonWoYPDytHJo9hZajelf1g0Ps+b6oo+xqQoDlDaLdF6KHLXOwwsvCgeyl
 UiEWGOuegdDS2sCDzHS2YaWB+tOQh6+GhqwuGcUjS5mmqE0mfQ7OPjki9e7frQlp
 LWefAiNmBwL9s6xhoTYL3A==;
X-AuditID: 8b5b014d-f2ab27000000641e-9f-626c39f728d9
Received: from enigma.ics.forth.gr (enigma-2.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 4F.50.25630.7F93C626; Fri, 29 Apr 2022 22:18:15 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 29 Apr 2022 22:18:14 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: mick@ics.forth.gr, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V-fixes: relocate DTB if it's outside memory region
Organization: FORTH
In-Reply-To: <mhng-6c123e84-9530-46f6-a5ec-6b908bb92f95@palmer-ri-x1c9>
References: <mhng-6c123e84-9530-46f6-a5ec-6b908bb92f95@palmer-ri-x1c9>
Message-ID: <e3b6a7ed7dc612d7338bc95d8fbbfdfc@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsXSHT1dWfe7ZU6Swd9ZfBZbf89it7i8aw6b
 xbbPLWwWze/OsVu8vNzDbNE2i9+BzePNy5csHoc7vrB7PNx0iclj85J6j0vN19k9Pm+SC2CL
 4rJJSc3JLEst0rdL4Mr48LabsaCTveLjg68sDYx7WbsYOTkkBEwkfv9ZytbFyMUhJHCcUWL3
 9ZVsEAlLic2fXrKA2LwCghInZz4Bs1kEVCX2nN0HVsMmoCkx/9JBsLiIgLrEgdd3mEFsZoHl
 jBKv/tqA2MICvhKTVu4AW8YvICzx6e5FMJtTwF1i5+7d7F2MHECL3SSW/8+EWOUisezKX6jb
 VCQ+/H7ADjHSQmLqlf2MELa8RPPW2cwTGAVmIbluFpKyWUjKFjAyr2IUSCwz1stMLtZLyy8q
 ydBLL9rECA5qRt8djLc3v9U7xMjEwXiIUYKDWUmE98vujCQh3pTEyqrUovz4otKc1OJDjNIc
 LErivOzPwpOEBNITS1KzU1MLUotgskwcnFINTBIuNsXft8RwnSn3qlu8pMxnieulBRlbZ+Tv
 eX+eO3anW2LHBfFHteHWeXWWltHZi2TDLd4pJR8zinadYpW4O3LWn86j+jVpHZPMz70TKLnZ
 ed7k09P7Uvxhuidfxl+aNGFyOsfXJq+nvpuuMap67VfSv/Eg5JNMnXP2w/tlm4PVd26rKTS/
 mnLKdGvr8T2H5R0XdS9gZJFmZGExbz75sFD0dbHKKQ+rc1/rJp2cYrLpVNfBzz5STyWq+G5u
 OzgvO7vEZdIDo4/XLn7aI3XybUz5CTX5X8lPp3fM0ytdd/flrE+Pj/kvPZw9TV3gtsznqLsO
 RiWi6YydXC+mqUWKKruX6ujrrhcT/+M85dTSC0osxRmJhlrMRcWJAMDVrWzZAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_121837_100887_A8F07F7A 
X-CRM114-Status: GOOD (  13.23  )
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

zqPPhM65z4IgMjAyMi0wNC0yOSAxODoyOCwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIFRodSwgMjggQXByIDIwMjIgMTQ6NDg6MTQgUERUICgtMDcwMCksIFBhbG1lciBEYWJiZWx0
IHdyb3RlOgo+PiBPbiBNb24sIDI1IEFwciAyMDIyIDIzOjExOjIzIFBEVCAoLTA3MDApLCBtaWNr
QGljcy5mb3J0aC5nciB3cm90ZToKPj4+IEhlbGxvIFBhbG1lciwKPj4+IAo+Pj4gQW55IHVwZGF0
ZXMgb24gdGhpcyA/Cj4+IAo+PiBTb3JyeSBhYm91dCB0aGF0LCBpdCdzIG9uIGZpeGVzLgo+IAo+
IE5vdCBzdXJlIGlmIEkganVzdCB3YXNuJ3QgcGF5aW5nIGF0dGVudGlvbiB5ZXN0ZXJkYXkgb3Ig
aWYgSSdtCj4gZ3J1bXBpZXIgdGhpcyBtb3JuaW5nLCBidXQgdGhhdCAiUklTQy1WLWZpeGVzOiAi
IHByZWZpeCBpcyBqdXN0IGEgYml0Cj4gdG9vIG9kZCAtLSBJIGtub3cgd2UndmUgZ290IGEgc3Bs
aXQgYmV0d2VlbiAiUklTQy1WIiBhbmQgInJpc2N2IiBzbwo+IG1heWJlIGl0IGRvZXNuJ3QgbWF0
dGVyLCBidXQgZXZlbiB0aGF0IGlzIGtpbmQgb2YgdWdseS4KPiAKPiBJIHJlLXdyb3RlIGl0LCBi
dXQgSSdtIGdvaW5nIHRvIGxldCBpdCByb3VuZCB0cmlwIHRocm91Z2ggbGludXgtbmV4dAo+IHNv
IEknbGwgc2VuZCBpdCB1cCBuZXh0IHRpbWUuCj4gCj4gU29ycnksIEkga25vdyB0aGlzIGhhcHBl
bmVkIHR3aWNlIHJlY2VudGx5IGJ1dCBJJ2xsIHRyeSBub3QgdG8gbWFrZSBhCj4gaGFiaXQgb2Yg
aXQuCj4gCgpEb24ndCB3b3JyeSBhYm91dCBpdCwganVzdCBsZXQgbWUga25vdyB3aGF0IHdvcmtz
IGJldHRlciBmb3IgeW91LCB3b3VsZCAKIltQQVRDSCAtZml4ZXNdIHJpc2N2OiIgYmUgb2sgbmV4
dCB0aW1lID8KClJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
