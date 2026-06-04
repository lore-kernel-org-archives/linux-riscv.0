Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6851CD6E4A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 07:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDSOpBpdfYITwiuz1qDXxA6MKPPZsn6AtA+hov6WNAQ=; b=whMhNZiAZDmco1
	zifiATC+otRo13naEa6p1q5YRdNXfbKYY00/6R8u3gMbcnwiymo9SdRrIg5GcKUtj9O8B8rAD53hJ
	V3SnVZkC52hAEN8HMIpkj39ECX72Gmr9ZfL7ckWyuyTWq7l5cs8m7Jzr8XVehHSCDirM0BmC2buE4
	+BLT9Xt02DxIkQLaIaynqcYAdzCCwL2Tt9GZZBQSLrfkU4MhR0dHSj35oWKGdntbBKYGIWf94K1wn
	BDBSF2c9M9yrPh6ox13S6ckvbkAYMF7MPFWiSEGpYePJUZDrhffT+/MWSqEcO1Dn5DKGRTGs8VOMn
	mDhefBtck8O+eRbykuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2sz-0000000GL4m-2dNP;
	Thu, 04 Jun 2026 07:53:05 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2sv-0000000GL2d-2Ulc
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 07:53:03 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-69e4483cfe9so712910eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 00:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780559580; cv=none;
        d=google.com; s=arc-20240605;
        b=G/RxtHCFjitV4NPTHnmGoWf7Z2secNXqxo9UIaxIapdkBXptrKMDZAuGFprm/oOsxk
         UZ9vpnnwiAmt2IZ2D/GBniYkTPjnl008uDUch3WQaS7k/fY4hnCd2sO3JcbhwAWi28jh
         SmNFkEZNrTKTXVCAI5FZMeIaJNdSR5vObP/4SzkjYPqvfkb6FoZB6lEa/JIY5t2LR0mX
         JmDHDrvA8uXi4r/42uzqT3Rr9vFpffwPVQ14pZy89KBGgFm83UBjhO7N9wLJ0LU8WCst
         ZLpVu0eg/xn/6P0WSCKHe4Hb3d2bVfMkHoLeNNAgjb2iLsXEzX2G7h3nKYq6kvmVqdGS
         wnTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OqAVryQ+sSJ2qvei7sWyBycSvMmltoGs0O/9YnbcysQ=;
        fh=o0cR3As0T3q3jQUIe8beQ76NsMoqtidpIV2pSwsl8GU=;
        b=f7e/St5np6Q/lm1/F1XeDSmn0TJNa2J0prkAgQSNmsgKFyor60ibt+lRqc7ibv0OXR
         QK9B1yvCuyp3bVbIRYmpkULfpI9GF0bLGDjEwTr6QV9NuckSKzdoRGQPoOLRbVdR31BW
         F+DiiwQSQtCq8fsCCacTgsdd23+xQS04FPnlY5WFYXuEwOAGXBihY+AQogPDqi9E8QNM
         cy3lpVn0IQRwlhuWfKYp3kNQZVv+nrv5E/GFiZoqcPvdOrGUjWTDfZEC5rfuBpYjrHCY
         MZTnOLNtBQPyK7QYPO7PQz9Gfz4+1WJtL35Xk3WzirPWp9LC0yTGRx57xtB/qS7O+QR4
         jqGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780559580; x=1781164380; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqAVryQ+sSJ2qvei7sWyBycSvMmltoGs0O/9YnbcysQ=;
        b=qa9xY3h+uPl0j89WLnr6MnnYB6ZBp0Z8qOAccYSp8bQGnRsPUoYtg7s/dwwh/U4vNx
         2m/rm1hNRztNtXQJgoAbgf1p9ojuSb1oul++FgeiJbYxocay9GPX8z8DPsFZs4pIAuCJ
         C++xr2q9oZb0FQTUNxCWUV2NbPwkmS9fL3I7bSs/wZu0w5TAbu9OkMvf5v9gSlZVoDcx
         3K84Y3ybEMgmBzNmUTKQbMvft/HuTezd2vfGbutVk/2r5YDdAYX6W5FcLNGQktt9g4vQ
         u0taNp0ODj7WRCa/27CTUzLdQtoqc0tcDp3Bbn5wLagezsQTXtZ2oR85FFAaTEnUZQVS
         gQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559580; x=1781164380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OqAVryQ+sSJ2qvei7sWyBycSvMmltoGs0O/9YnbcysQ=;
        b=lnbbTm5M9Xek/WwbfAgrMR0H6PjDbESWQmtDakfCtK10WwBfiLy8sHzCirquol5u/E
         qeKB3vtcN74wsS45PiitjtTmR1jbceFdNHrct8TQKPImp2dmp+H4Ho6MsWy6V27pKxHI
         6rfoqU96y9mKFr+s1cUoL8Oz8PI+1vjyU80SX3Zak82KYWv2RD5xYF86RpyDDlfJOuf9
         mdFc7WLEhAZ5qlS9qYFR1gcsMH+5VLtuCUANWbmTbqBdBxgYV2iYf4Qq0yqvUY44Yy7A
         0y67uffDsm9+9izP0BlroqjrqWlB5hmqvsiVZ+hVPzfQWesIfau3IVzpCc9MCPt2pd26
         mCrw==
X-Forwarded-Encrypted: i=1; AFNElJ9xXUw1mW1BZXOrUoE+UeSoPJJrYX2hI3QZhVOrn6Vo/2MrY0nAhV/wKf7cbb0zHnAYHPhOznhFAnUXLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ2iGIEAE6BVUknlp/fXBR2e14d5hSuDczb9TyFSXt9uHFS7+u
	l7ffb5hmX5miawEdYvdmLjYGfAuEYPzclo0mvZbhZvzWEr8FAGydvSkr2svIzkPNbyZi+63SCAb
	parWoaP54k6qHIF3laus4yS0BnpFBg1M+4k2IdcmjiA==
X-Gm-Gg: Acq92OEaBsCefEhQzY66CnkjF4pJqlIbpQ07qWCiiLtM/QWNXUt4SIdFeJg5FCNEFwm
	zcnXJathBKlPg1hDwkv0QprS1HF7x0XkCP6FoQ45RHIx22h/5IasT7qPz/u/MyF1UcIVAdJIdJU
	w7rC2XN5G0vSbcvmHSqWCBJb9NgrSYrBJgANXcQy1VB6Joqk3+5wDK8Ur19YPC5ZfNtk8mWIFKw
	0vA5Ah3lIdpBSM67PKiXsst/MMpwqZLDz/o7QCK4juIt6tGIqclKJ1AU90NZQvJXnCK5G4XJcGc
	PfMNpRnOlRCJkCrBIh+Weu9OrMEObDmytEu5rJkMEMTJPJ7TkoUsnCYBIPF3A2/UT5SzTj+OsUE
	bb3Seg553xvY7mDIXddsCNu348U/eY0fkcbRQDAG4F4Qf9+g=
X-Received: by 2002:a05:6820:180a:b0:69e:8d4:28b8 with SMTP id
 006d021491bc7-69e590bafefmr1397926eaf.32.1780559580298; Thu, 04 Jun 2026
 00:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260526075544.796396-1-maqianga@uniontech.com>
In-Reply-To: <20260526075544.796396-1-maqianga@uniontech.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jun 2026 13:22:49 +0530
X-Gm-Features: AVHnY4IC89pVbBq6__qpDj1Dq7LuA6tOCD1DQTi9OxR8RUuRHdUDSjYF2_D39Rc
Message-ID: <CAAhSdy2GwXZ+qDdnNYe6Ykunvoa8-okQepxBNffGMFXu0U8Mig@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix timer state restore
To: Qiang Ma <maqianga@uniontech.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_005301_777314_F9F5BCD1 
X-CRM114-Status: GOOD (  17.02  )
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

T24gVHVlLCBNYXkgMjYsIDIwMjYgYXQgMToyNuKAr1BNIFFpYW5nIE1hIDxtYXFpYW5nYUB1bmlv
bnRlY2guY29tPiB3cm90ZToKPgo+IFRoZSBLVk1fUkVHX1JJU0NWX1RJTUVSX1JFRyhzdGF0ZSkg
b25lLXJlZyB3cml0ZSBwYXNzZXMgdGhlIHZhbHVlCj4gd3JpdHRlbiBieSB1c2Vyc3BhY2UgdG8g
a3ZtX3Jpc2N2X3ZjcHVfdGltZXJfbmV4dF9ldmVudCgpIHdoZW4KPiByZS1lbmFibGluZyB0aGUg
dGltZXIuCj4KPiBUaGF0IHZhbHVlIGlzIHRoZSB0aW1lciBzdGF0ZSwgS1ZNX1JJU0NWX1RJTUVS
X1NUQVRFX09OLCBub3QgdGhlCj4gdGltZXIgY29tcGFyZSB2YWx1ZS4gRHVyaW5nIG1pZ3JhdGlv
biBvciBzdGF0ZSByZXN0b3JlLCB1c2Vyc3BhY2UKPiByZXN0b3JlcyB0aGUgY29tcGFyZSByZWdp
c3RlciBzZXBhcmF0ZWx5LCB3aGljaCBzdG9yZXMgdGhlIHRhcmdldAo+IGN5Y2xlIGluIHQtPm5l
eHRfY3ljbGVzLiBSZS1hcm1pbmcgdGhlIHRpbWVyIHdpdGggdGhlIHN0YXRlIHZhbHVlCj4gc2No
ZWR1bGVzIHRoZSBuZXh0IGV2ZW50IGF0IGN5Y2xlIDEgaW5zdGVhZCBvZiB0aGUgcmVzdG9yZWQg
Y29tcGFyZQo+IHZhbHVlLCBjYXVzaW5nIHRoZSB2aXJ0dWFsIHRpbWVyIHRvIGZpcmUgdG9vIGVh
cmx5Lgo+Cj4gVXNlIHRoZSByZXN0b3JlZCBjb21wYXJlIHZhbHVlIGZyb20gdC0+bmV4dF9jeWNs
ZXMgd2hlbiB0dXJuaW5nIHRoZQo+IHRpbWVyIGJhY2sgb24uCj4KPiBGaXhlczogM2E5ZjY2Y2Iy
NWUxICgiUklTQy1WOiBLVk06IEFkZCB0aW1lciBmdW5jdGlvbmFsaXR5IikKPgo+IFNpZ25lZC1v
ZmYtYnk6IFFpYW5nIE1hIDxtYXFpYW5nYUB1bmlvbnRlY2guY29tPgoKTEdUTS4KClJldmlld2Vk
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2gg
Zm9yIExpbnV4LTcuMgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1
X3RpbWVyLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYwo+IGluZGV4IDk4MTdmZjgwMjgyMS4uYWU1MzEzM2M3
YWIwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYwo+IEBAIC0yMzEsNyArMjMxLDcgQEAgaW50IGt2bV9y
aXNjdl92Y3B1X3NldF9yZWdfdGltZXIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAg
ICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9USU1FUl9SRUcoc3Rh
dGUpOgo+ICAgICAgICAgICAgICAgICBpZiAocmVnX3ZhbCA9PSBLVk1fUklTQ1ZfVElNRVJfU1RB
VEVfT04pCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0ga3ZtX3Jpc2N2X3ZjcHVfdGlt
ZXJfbmV4dF9ldmVudCh2Y3B1LCByZWdfdmFsKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXQgPSBrdm1fcmlzY3ZfdmNwdV90aW1lcl9uZXh0X2V2ZW50KHZjcHUsIHQtPm5leHRfY3ljbGVz
KTsKPiAgICAgICAgICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9
IGt2bV9yaXNjdl92Y3B1X3RpbWVyX2NhbmNlbCh0KTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gLS0KPiAyLjIwLjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
