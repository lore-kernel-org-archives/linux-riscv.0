Return-Path: <SRS0=BHV5=OA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA33C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 05:10:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 187552087E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 05:10:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lbweF9wJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOoSfRNy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 187552087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HELMm0Xv/+eutxyGB7p8F/WpcKnnH+uDLo153gKeEZM=; b=lbweF9wJmKlfiP
	OvfeIFAgfJ/8POXY495TzQazwqm4472H8iskxhNIv0DG60WmmopdN3RMqoq5bhlkC5to73sN5g/wB
	yyPaRvScLOKQysMwzO+ErTIohhhYwGM5Q8XzIK0MabHuM0SrFfNxVv2DRY/5Jvi1Fk09v7A3mvn+o
	zozfmYg8NyOZvmddk3F9hC6xKG7MkaYi57/MKQjO+YTKLpHVMUQxgvbThTEYZowKStk2CbmQ82Ewb
	qEQqQRW//IzSHSWMmSrCNQvtK95StqV9jlTTAj9S9sRpR5iQ79FF/VsAtwxO/tK7kygr+3ivzc1dZ
	TzKiCgXgVPvXwoQQQV2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPKmD-0002S1-FY; Wed, 21 Nov 2018 05:10:13 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPKm9-0001AJ-Ur
 for linux-riscv@lists.infradead.org; Wed, 21 Nov 2018 05:10:11 +0000
Received: by mail-ed1-x543.google.com with SMTP id z28so3812909edi.8
 for <linux-riscv@lists.infradead.org>; Tue, 20 Nov 2018 21:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nk8+iXWPWZSv+MTO/RTEsZIR3nyYGoAXrN9ArS9QDqU=;
 b=BOoSfRNyfzqt5t837Kd5w8uvxH6npfzXCd0pBzjZpXsvTKmtpjIpumI7+Rn44jq5zy
 iIVZegH1A9/9vF4V6BiLL6taOY4OB0usGG1eMPxFLqAmTLVgByBs/JceF+WD1ToS0zAQ
 K6reYa2ppOl/wbeZb/wwTwYH3BCADPeDps6DOvz3uQpUSOBWIW530e7x6CCb3O/fGpTS
 rpD0soDTm4Rtaq6yI+3UnvYtidEmAEcuWW2xSNInnZV+OQ9l21v2RgRqrho4YAO/FpuT
 nGkRGPKdTDEOUApfi+sts09S7LxxareKx+9/Lh/cp0fVFlo6p+TqUEjxdaO1xH4iBbhC
 5EKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nk8+iXWPWZSv+MTO/RTEsZIR3nyYGoAXrN9ArS9QDqU=;
 b=Dsbgf/PpBplmuTj9IaTY9N/j7PoPS0BfxDyqJx1ZmPE6bktNcbY2/Zw3V9Nzi2b5eF
 yF12wVH2Qu47QfVUUY4ncDdqm/7BcXOhYJaST4WbqVpidkZ9jIWPpmZrjspF9RRsBxIE
 tyBrKmmDKpZp+ykZptWSPHXgC5J3Blj55PcP0vGRyCIcD2nshpcMdViQes4rT2MRnZgg
 pHpFIRlv/zaduKdxSeP9eYPYlMQrBN1jtiOTOj5Egtg7JnQ7DeXK2OmJD9PcrCgm1tYx
 oZj823M3ut572jr1PFj1XTju8fJiIPawjjAHseSGOnuA/dTHxuKUzKLEludpZJnISyo9
 bLpw==
X-Gm-Message-State: AA+aEWZdpqlHwU86LpXj5MGGPraai5fT+3aYjppLbwZZhV69eVplBf9H
 npU5BYmUPN8GRo0xoe4FyPIpndxQDFINAeKRWA6A/zAD
X-Google-Smtp-Source: AFSGD/X2gDX/iE/c9YAsIVe0evTFrT0WCJ6Rj3Rsm1MlWKKgsk9uUg5FNTlXgRW+l3nCvr7fF6veINRKMqblZ+x2wqs=
X-Received: by 2002:a50:de47:: with SMTP id
 a7-v6mr4246937edl.245.1542776998521; 
 Tue, 20 Nov 2018 21:09:58 -0800 (PST)
MIME-Version: 1.0
References: <mhng-c4f4aebd-afe6-42f8-a2e0-a0c6ff3dc001@palmer-si-x1c4>
In-Reply-To: <mhng-c4f4aebd-afe6-42f8-a2e0-a0c6ff3dc001@palmer-si-x1c4>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Nov 2018 13:09:47 +0800
Message-ID:
 <CAEUhbmWiSKJhAotBC13PN+useOCktnfvDr6nCuqVoDOP9cnuZQ@mail.gmail.com>
Subject: Re: [PULL RFC] RISC-V Patches for 4.20-rc4
To: palmer@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_211009_996160_FC91E91E 
X-CRM114-Status: GOOD (  15.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181121050947.v9P9pE1E2UjUkasrYi1Q2VYctOQNu67pCw4sqPPdcbU@z>

SGkgUGFsbWVyLAoKT24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMjoxMyBBTSBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNp
bmNlIGNvbW1pdCA5ZmYwMTE5M2EyMGQzOTFlOGRiY2U0NDAzZGQ1ZWY4N2M3ZWFhY2E2Ogo+Cj4g
ICBMaW51eCA0LjIwLXJjMyAoMjAxOC0xMS0xOCAxMzozMzo0NCAtMDgwMCkKPgo+IGFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGFsbWVyL3Jpc2N2LWxpbnV4LmdpdCB0YWdzL3Jp
c2N2LWZvci1saW51cy00LjIwLXJjNAo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IDVkOGY4MWJhMWRhNTUyMTAxMjNiOTU5NWU4N2I5MTNjNzk1NzlkMDI6Cj4KPiAgIFJJU0MtVjog
cmVjb2duaXplIFMvVSBtb2RlIGJpdHMgaW4gcHJpbnRfaXNhICgyMDE4LTExLTIwIDA1OjE5OjI4
IC0wODAwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+IFJJU0MtViBQYXRjaGVzIGZvciA0LjIwLXJjNAo+Cj4gVGhp
cyB3ZWVrIGlzIGEgYml0IGJpZ2dlciB0aGFuIEkgZXhwZWN0ZWQuICBUaGF0J3MgbXkgZmF1bHQs
IGFzIEkgbWlzc2VkCj4gYSBmZXcgcGF0Y2hlcyB3aGlsZSBJIHdhcyBhdCBQbHVtYmVycyBsYXN0
IHdlZWsuICBXZSBoYXZlOgo+Cj4gKiBBIGZpeCB0byBhIHF1aXRlIGVtYmFyYXNzaW5nIGlzc3Vl
IHdoZXJlIHJhd19jb3B5X3RvX3VzZXIoKSB3YXMKPiAgIGltcGxlbWVudGVkIHdpdGggYXNtX2Nv
cHlfZnJvbV91c2VyKCkgKGFuZCB2aWNlIHZlcnNhKS4KPiAqIEltcHJvdmVtZW50cyB0byBvdXIg
bWFrZWZpbGUgdG8gYWxsb3cgZmxhdCBiaW5hcmllcyB0byBiZSBnZW5lcmF0ZWQuCj4gKiBBIGJ1
aWxkIGZpeCB0aGF0IHByZWRlY2xhcmVzICJzdHJ1Y3QgbW9kdWxlIiBhdCB0aGUgdG9wIG9mCj4g
ICA8YXNtL21vZHVsZS5oPiwgd2hpY2ggdHJpZ2dlcnMgd2FybmluZ3MgbGF0ZXIgaW4gdGhhdCBo
ZWFkZXIuCj4gKiBUaGUgYWRkaXRpb24gb2Ygb3VyIG93biA8dWFwaS9hc20vdW5pc3RkPiBoZWFk
ZXIsIHdoaWNoIGlzIG5lY2Vzc2FyeQo+ICAgdG8gYWxpZ24gb3VyIHN0YXQgQUJJIG9uIDMyLWJp
dCBzeXN0ZW1zLgo+ICogQSBmaXggdG8gYXZvaWQgcHJpbnRpbmcgYSB3YXJuaW5nIHdoZW4gdGhl
IFMgb3IgVSBiaXRzIGFyZSBzZXQgaW4KPiAgIHByaW50X2lzYSgpLgo+Cj4gSSBhbHJlYWR5IGhh
dmUgb25lIHBhdGNoIGluIHRoZSBxdWV1ZSBmb3IgbmV4dCB3ZWVrLgo+Cj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEFu
dXAgUGF0ZWwgKDEpOgo+ICAgICAgIFJJU0MtVjogQnVpbGQgZmxhdCBhbmQgY29tcHJlc3NlZCBr
ZXJuZWwgaW1hZ2VzCj4KClRoaXMgb25lIG5lZWQgYSBtaW5vciB0d2VhayBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UuClNlZSBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgt
cmlzY3YvMjAxOC1Ob3ZlbWJlci8wMDIzMjcuaHRtbAoKRmVlbCBmcmVlIHRvIGluY2x1ZGUgbXkg
UkIvVEIgdGFncyB3aGVuIHlvdSB0b3VjaCBpdC4KCj4gRGF2aWQgQWJkdXJhY2htYW5vdiAoMik6
Cj4gICAgICAgcmlzY3Y6IGZpeCB3YXJuaW5nIGluIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vbW9k
dWxlLmgKPiAgICAgICByaXNjdjogYWRkIGFzbS91bmlzdGQuaCBVQVBJIGhlYWRlcgo+Cj4gT2xv
ZiBKb2hhbnNzb24gKDEpOgo+ICAgICAgIFJJU0MtVjogRml4IHJhd19jb3B5X3t0byxmcm9tfV91
c2VyKCkKPgo+IFBhdHJpY2sgU3TDpGhsaW4gKDEpOgo+ICAgICAgIFJJU0MtVjogcmVjb2duaXpl
IFMvVSBtb2RlIGJpdHMgaW4gcHJpbnRfaXNhCj4KClJlZ2FyZHMsCkJpbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
