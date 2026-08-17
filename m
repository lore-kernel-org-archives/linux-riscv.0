Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471FDC5DF66
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qPZRRgBevLFP0VThA7IdmYeptlnjXr4Jc5sHStQDaU=; b=rPez5geOzYVWAb
	XkpxGissoxBHcnY9idbeLVFPa39Oo8uRm1REGd6maKdBHCJRz8L9FJTz2RjBk2RDaKwDsu3HSD/5O
	nocWqCsxl66BvDbgx+Eui9AYQaW+TprFqcwmzQC4+w4bzsLf84mw1PIxvG2cDV2udW0CX4UL8DWjm
	jj/MO1w5fKNqSz5824BUIOUXPNPgldlYE8aFhKcFdpF15/ngkGgPbkTJAFg+BIkPnfYzuA93eD/Fv
	8oxb2+G2/on60Mi+ctWuomx0IxMRadCh1JddLc6XfU49z2m5uZGCRn5r0pd1GhxBFIAO+i7ehEEME
	FWOi2+8/xZEIOMhxYmaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvySX-00000006K95-2W8T;
	Mon, 17 Aug 2026 14:37:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvySV-00000006K8P-1ZVD
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 14:37:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so28644975e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 07:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786977421; cv=none;
        d=google.com; s=arc-20260327;
        b=BIzFusTk9GHb6vuEk1TXgssFBUhcs8j1/4h+ywhe1ggnKKC+c0dRmSo7K0xq8mHUdN
         Zm4/sSJkXXoNFoOcIG0rhUhWDnXiuPcz+WfHsGO6Ro2Ia6N0mfniz92qLCNC5qWK7w0u
         3Wd5Z0XpXJCHehFF/Cbljcg79JBJyqAJUSogU++4bpb39NDQSVMQThP/d+JVX8TlaA4p
         85OdQhnQspl3//LSjFmO+iIJ7JulWEnVlb+C/7gyorZ6CikDGem5Z6McsT5Q2eyNygN3
         JeUvXpnnxmpAY0r4TanZoF3aegUI7iKeAINte/im2obyMi5iw0nmUELWBVAj4Nrl7muP
         j5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e7e/vK/Hpt5Hlvs8SAgkbpA0UsjVN6AffSdFyyBtPoA=;
        fh=brfo6Ysyf96agF5jUnIB1va1uhheD9smAXhC4AjqiMg=;
        b=V8EXgvAfMs9wAFhs8RE1bHw9NUvhixh2ZdRrklfkEvIvVPOulUsRCHl7ssJ0pkvsyf
         WcXS7zPO75IAhTNZIkrVK6pDnE75m1KoHf2az8MqQAEyoXnqZ8YOMFJhD3vKZfnj1aM+
         QXqE+Mztd5Lki59HcppfejEBhsMFZAgAatma27UVhA4Bqr2TQaj0UHxMt0zipIZDTYV7
         UNILX5hsEpn6QCeOu5eieuSRG6s56lSJ0pMUCzGYG47cM0D0fTikpAu4q4BxhnWeMkDc
         0YRU/3oZWB2boZ+JM2jYC3YOmAiqryTEiOTMqZ2Hv/f7qDLqotaVWraWYdgTt0w59eO6
         hfcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786977421; x=1787582221; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e7e/vK/Hpt5Hlvs8SAgkbpA0UsjVN6AffSdFyyBtPoA=;
        b=C7ENwF4AM6g//ItfiXGPutPJ8TA9jk0s/Lgu3tPEmDIxNmKd4Xicy8bboWkvnySgKA
         HWwxSMReA41o5UkeTLOlRkKYFhOe11epkrMo16a5nfwGyzokkI4wcOk9aGTwzmRI+6G7
         jMeG4Y8iofLH9hWd8+sV13MjuRJ/LbCnrbpBUO12DTZdZSQnOmjexc+7M13dsE/3qhrM
         golxoKQEac/GWsiSSxFSRshSC6ncuN0y+sjvGw/wHtKPHbCsEsN7TY2DMetODSbZFbp4
         p55enFwxrHMy4x7dSWBZ0f8wvw1e/WkToYkzpaVNMu3Ek9MA7z/CVB7tle3m3uGhT4C3
         bE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786977421; x=1787582221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7e/vK/Hpt5Hlvs8SAgkbpA0UsjVN6AffSdFyyBtPoA=;
        b=lJNUoNTyNCNGWLDUrcL3ZZQDdWTTMgD5ULBijAKjuvCf/T+r7ahCYicDw2U6znUR6n
         hVIljoqGFDhcYPKV6eti55kgicuGR+QikxLuDYJ+Fz7IOaJgD8iLc2L8/ObfTTq0Z6zC
         ytEWGBEauKp3L3Jv2tqiSqxPDP3belLwNN9B0LWHZgHPqZeg8Nnl5v23pFKJXDYGtofA
         WGaGa+/Chh1I692nygad57A6iSFV7URZlEE715OgV8r06jW6r5Ya462Zx1R2QOS3owUk
         bmwzHMPwEE6T/CGTinRYbq7ZplXAo5K9joC9YitwNJA0LnHY8GZh2ISc00crVWJjKiMy
         d6HQ==
X-Gm-Message-State: AOJu0YxLGzwmB647UHhJyfVjo1N9gD2v9Viu4gKRwvzCXNzp5qm8dppr
	vy1izFodCsV2s7aRJ6Vud45YJtPeHhMi41oW6xZWIPe25Q+jVksA58LfPBAREpsHjm7sTaQzQ62
	K3KevK9EafAUxGcGyv/9hpF9DO5XdSe7t5bpfRizhsw==
X-Gm-Gg: AR+sD13MFSzpmEjR7PMPbRtHkva8np6p5ld0wA64ypHWPvLcmpdOC4YwnLdVR9AUQMQ
	XJxoXHNVDPmsUuRD1MH8IcowozMsPj4KrnM7Yzkz4bWUDv6nl88cWvgW9qDcvqFUqAxKGcdw10K
	9uUNNazVPF6r7E7fQzwALF0CoA0gN959BHOiIbvm69NcnL2tHdB+YYPH9c9fUAz/g1loOVjHv+N
	W8KpImLe/cBrvGqXWlNK9e0ez194/Aw5X8B5f+TZvOp+AiNqSpf/hBXOA1ERjoUUfH9LgYe1HtS
	ZrNvqCIzBS/5+KXL9ZmOgpzy7Vm41T18XeB245dAKiYkfhbtd76ozlUXE8Lnfy/TloOq37dNUbG
	SHF1Cl5e8tZ/qSMNLwlyi/stXB6b/BDIuuG60J4Ff8zhxa2KrqkCneBACg9w7dJc=
X-Received: by 2002:a05:600c:64c6:b0:499:84ff:b16 with SMTP id
 5b1f17b1804b1-4999fb4d60bmr10884825e9.14.1786977421453; Mon, 17 Aug 2026
 07:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260816070049.2097442-1-guoren@kernel.org> <20260816070049.2097442-6-guoren@kernel.org>
In-Reply-To: <20260816070049.2097442-6-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Aug 2026 20:06:46 +0530
X-Gm-Features: AcwNN1WT57PJWTsH-_LzQF6zsHVzgR6NAiF6FPxrmIBExpX8GmdR3vRDYNpCSKk
Message-ID: <CAAhSdy26Nk8zQf-DCFxhZELUWDxLCnyvThyc9P0ROOZRiT2_wA@mail.gmail.com>
Subject: Re: [PATCH 5/5] irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tglx@kernel.org, daniel.lezcano@kernel.org, hui.wang@canonical.com, 
	samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_073703_429735_D9EB6244 
X-CRM114-Status: GOOD (  17.08  )
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

T24gU3VuLCBBdWcgMTYsIDIwMjYgYXQgMTI6MzHigK9QTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiR1VPIFJlbiAoWHVhblRpZSkiIDxndW9yZW5Aa2VybmVs
Lm9yZz4KPgo+IElNU0lDIHdhcyBkZWZpbmluZyBpdHMgb3duIElNU0lDX05SX0lQSSAoPSA4KSB3
aGljaCBoYXBwZW5lZCB0byBtYXRjaAo+IHRoZSBhcmNoaXRlY3R1cmUncyBJUElfTUFYLiBOb3cg
dGhhdCBJUElfTUFYIGlzIGV4cG9ydGVkIGZyb20gcmlzY3YKPiBhc20vc21wLmgsIHVzZSB0aGUg
YXJjaGl0ZWN0dXJlIGNvbnN0YW50IGFuZCBkcm9wIHRoZSBwcml2YXRlIGRlZmluZS4KPgo+IFRo
aXMga2VlcHMgdGhlIG51bWJlciBvZiBtdWx0aXBsZXhlZCBJUElzIGluIHN5bmMgd2l0aCB0aGUg
cmVzdCBvZiB0aGUKPiBSSVNDLVYgSVBJIGluZnJhc3RydWN0dXJlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogR1VPIFJlbiAoWHVhblRpZSkgPGd1b3JlbkBrZXJuZWwub3JnPgoKTEdUTS4KClJldmlld2Vk
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAt
LS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jIHwgNCArKy0tCj4g
IGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuaCB8IDEgLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5LmMgYi9kcml2ZXJzL2lycWNo
aXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5LmMKPiBpbmRleCAxMmVmZDI0MWNlODguLjgyM2Y1ZjJl
Y2IzZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5
LmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5LmMKPiBAQCAt
NjcsMTIgKzY3LDEyIEBAIHN0YXRpYyBpbnQgX19pbml0IGltc2ljX2lwaV9kb21haW5faW5pdCh2
b2lkKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPgo+ICAgICAgICAgLyogQ3JlYXRlIElN
U0lDIElQSSBtdWx0aXBsZXhpbmcgKi8KPiAtICAgICAgIHZpcnEgPSBpcGlfbXV4X2NyZWF0ZShJ
TVNJQ19OUl9JUEksIGltc2ljX2lwaV9zZW5kKTsKPiArICAgICAgIHZpcnEgPSBpcGlfbXV4X2Ny
ZWF0ZShJUElfTUFYLCBpbXNpY19pcGlfc2VuZCk7Cj4gICAgICAgICBpZiAodmlycSA8PSAwKQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gdmlycSA8IDAgPyB2aXJxIDogLUVOT01FTTsKPgo+ICAg
ICAgICAgLyogU2V0IHZJUlEgcmFuZ2UgKi8KPiAtICAgICAgIHJpc2N2X2lwaV9zZXRfdmlycV9y
YW5nZSh2aXJxLCBJTVNJQ19OUl9JUEkpOwo+ICsgICAgICAgcmlzY3ZfaXBpX3NldF92aXJxX3Jh
bmdlKHZpcnEsIElQSV9NQVgpOwo+Cj4gICAgICAgICAvKiBBbm5vdW5jZSB0aGF0IElNU0lDIGlz
IHByb3ZpZGluZyBJUElzICovCj4gICAgICAgICBwcl9pbmZvKCIlcGZ3UDogcHJvdmlkaW5nIElQ
SXMgdXNpbmcgaW50ZXJydXB0ICVkXG4iLCBpbXNpYy0+Zndub2RlLCBJTVNJQ19JUElfSUQpOwo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmggYi9k
cml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmgKPiBpbmRleCBjNDJlZTE4MGIz
MDUuLjg3OGNjMTkyY2NlYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWltc2ljLXN0YXRlLmgKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0
YXRlLmgKPiBAQCAtMTMsNyArMTMsNiBAQAo+ICAjaW5jbHVkZSA8bGludXgvdGltZXIuaD4KPgo+
ICAjZGVmaW5lIElNU0lDX0lQSV9JRCAgICAgICAgICAgICAgICAgICAgICAgICAgIDEKPiAtI2Rl
ZmluZSBJTVNJQ19OUl9JUEkgICAgICAgICAgICAgICAgICAgICAgICAgICA4Cj4KPiAgc3RydWN0
IGltc2ljX3ZlY3RvciB7Cj4gICAgICAgICAvKiBGaXhlZCBkZXRhaWxzIG9mIHRoZSB2ZWN0b3Ig
Ki8KPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
