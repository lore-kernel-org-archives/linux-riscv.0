Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A687EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 14:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3QXnLEdDwCISYpzwgtGNlx906BOrR9QnNhs9Jlmh1/g=; b=4wK3i6tp+lSgv1+4kiB17NLphT
	j+H8C5nWPEXY8P8mnP7eNLYOJMVjhc/xy8ipYrW0CEGtrnubEP7uZ0NavaCZjWmoBRmOMZMfucRLR
	BunaP3FKR5RGteB80G9QvhDIN2O5rnffEPlwEMCnCi3Xq8zovEIBQKAFqvwbRAijdJzOerGl7ixBG
	uJWWOulujXIJIqC5dOw6VX+QNT5Cgr5xAS2vXjMuQ+N4DInuU0uL0Hc5WE19rJnN4Sf9xKkA7MO6D
	aHzDUt7BY9r5Yqlh4muniTaTLSXc2qdh3b1bVF4Gs5W/QUPjlh/4QDhiDltdvmFD4+IAlYFMP2smQ
	3rqTBlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEW5N-00FruD-2i;
	Wed, 28 Jun 2023 14:23:57 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEW5K-00Frt3-1V
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 14:23:55 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6689430d803so3477396b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 07:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687962232; x=1690554232;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yY1dIDnDNgNUmi94u6VrIuuy9wRJjss01X4OjwLKp70=;
        b=ToSnyGTLSBn0dx9oxpNAzvMwjwIRJvOw63grMox8iyNbX0XSnooOlmPyJIq9LXTvV/
         hFf1j+p6sLWM/uY3WZiiEs7HdjnL6QqAO5SFjUuzTQsrx5Dt167qWkil51pArEASMqn7
         dUqOl+F/eN88MCcVbZ8fQxqR7bxVLDPAdRQ7dfpr6wZtkv1G4Q/7m9v4RSgmFYtJtzLB
         83VcmkIfN3xN2x1sOWl3U8jFV0qRjNFVNESjviivQhA7NREEVrmVf/4qXibbBVj1LB0g
         IePmblmvnfrMfxaBq1eDo3KrLthvDGjYc6PWyablBHZjyHQzWN5+DQqzmvqPeBZCzleG
         ZCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687962232; x=1690554232;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yY1dIDnDNgNUmi94u6VrIuuy9wRJjss01X4OjwLKp70=;
        b=cvviDG1cRHNYg0qZDRHf1PAN8qbBmE0dPKUv0uTZo2eIByhWXuM6Jf10MEK0QLL0qJ
         gtMiK88xeLLTTts9XS5/6pq8kIuMritzBQL8w5WlFDDUTvT2y9pz7vb1hqjeZCg8Sz8y
         xZJwLlc82EOz1msn3fFdXIalhczGz9FPuVouHY6CzTz+nxk8/bRhsbIVFrQH3VuCUf2u
         svl54mwjZQRoKkAJTNYTnm7mtTzufn4gnzxiRqW4y27Z2oQ03AvnbyFWy66R1wsJ/gNy
         LGQW+JoX5+PN2sX9zxz1Py61Cpolq0HKnXIdonBsfsjxan/1wrbB/U7sxL0E2Tdq+xKg
         dXBg==
X-Gm-Message-State: AC+VfDxsonesOiOZZNqnQ+Nfzf3TFNL1J9i+ny8V2lQwdFj4blC4gKsm
	gp3pg+N5cfJ5yBirs6IpCofHX3bv6dtTjRpx9vI=
X-Google-Smtp-Source: ACHHUZ57XAWEXcF4DKBZ6cGEoJ/CkyvAu0JsKIVovvTXjQupxPxVNa/s/tJanhGmZqiKbE8xyA/SPg==
X-Received: by 2002:a05:6a21:7887:b0:126:2ba7:af61 with SMTP id bf7-20020a056a21788700b001262ba7af61mr12685137pzc.32.1687962231975;
        Wed, 28 Jun 2023 07:23:51 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id q28-20020a635c1c000000b00548d361c137sm7412383pgb.61.2023.06.28.07.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:23:51 -0700 (PDT)
Date: Wed, 28 Jun 2023 07:23:51 -0700 (PDT)
X-Google-Original-Date: Wed, 28 Jun 2023 07:23:49 PDT (-0700)
Subject: Re: [PATCH v2 3/3] RISC-V: add T-Head vector errata handling
In-Reply-To: <20230627-sandlot-purity-1a27aa7a5275@spud>
CC: remi@remlab.net, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-a5f6328e-6a32-454e-ac69-a0a770af31e4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_072354_508781_93F7883B 
X-CRM114-Status: GOOD (  25.72  )
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

T24gVHVlLCAyNyBKdW4gMjAyMyAwOToxMjo0OCBQRFQgKC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFR1ZSwgSnVuIDI3LCAyMDIzIGF0IDA2OjIxOjE0UE0gKzAzMDAsIFLDqW1pIERl
bmlzLUNvdXJtb250IHdyb3RlOgo+PiBMZSBwZXJqYW50YWluYSAyMy4ga2Vzw6RrdXV0YSAyMDIz
LCAyLjEzLjA1IEVFU1QgSGVpa28gU3R1ZWJuZXIgYSDDqWNyaXQgOgo+PiA+IEZyb206IEhlaWtv
IFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVsbC5ldT4KPj4gPgo+PiA+IFQtSGVhZCBDOXh4
IGNvcmVzIGltcGxlbWVudCBhbiBvbGRlciB2ZXJzaW9uICgwLjcuMSkgb2YgdGhlIHZlY3Rvcgo+
PiA+IHNwZWNpZmljYXRpb24uCj4+ID4KPj4gPiBSZWxldmFudCBjaGFuZ2VzIGNvbmNlcm5pbmcg
dGhlIGtlcm5lbCBhcmU6Cj4+ID4gLSBkaWZmZXJlbnQgcGxhY2VtZW50IG9mIHRoZSBTUl9WUyBi
aXQgZm9yIHRoZSB2ZWN0b3IgdW5pdCBzdGF0dXMKPj4gPiAtIGRpZmZlcmVudCBlbmNvZGluZyBv
ZiB0aGUgdnNldHZsaSBpbnN0cnVjdGlvbgo+PiA+IC0gZGlmZmVyZW50IGluc3RydWN0aW9ucyBm
b3IgbG9hZHMgYW5kIHN0b3Jlcwo+PiA+Cj4+ID4gQW5kIGEgZml4ZWQgVkxFTiBvZiAxMjguCj4+
Cj4+IFVsdGltYXRlbHksIGNvbmZvcm1hbnQgaGFyZHdhcmUgYWxzbyBoYXMgYSBmaXhlZCBWTEVO
IG9mIHNvbWUgdmFsdWUuCj4+Cj4+IFNvIHdoeSBpcyB0aGF0IHJlbGV2YW50IGhlcmU/IGlzIHRo
ZSB2bGVuYiBDU1Igbm90IGltcGxlbWVudGVkPyBBbmQgZXZlbiBpZgo+PiBzbywgYyB0aGUgdmFs
dWUgbm90IGJlIHJldHJpZXZlZCB3aXRoIHZzZXR2bGk/Cj4KPiBJIHdhcyBsb29raW5nIGFyb3Vu
ZCBhIGJpdCwgYW5kIHNhdyBhIHJhbmRvbSBjb21tZW50IG9uIHJlZGRpdCB0b2RheQo+IGNsYWlt
aW5nIHRoYXQgdGhlIGM5MjAgaGFzIGEgdmxlbiBvZiAyNTYuIE9idmlvdXNseSB0aGF0IGNvbmZs
aWN0cyB3aXRoCj4gd2hhdCBpcyB3cml0dGVuIGhlcmUsIGJ1dCBpdCBpcyByZWRkaXQuLi4KPiBE
byB5b3Uga25vdyBpZiB0aGF0IGlzIHRydWUgSGVpa28sIGFuZCBpZiBpdCBpcyB0cnVlLCBkb2Vz
IHRoZSBjOTIwCj4gcG9wdWxhdGUgYXJjaGlkL2ltcGlkIHdpdGggbm9uLXplcm8gdmFsdWVzPwoK
V2Ugd2VyZSB0YWxraW5nIGluIHRoZSBwYXRjaHdvcmsgYSBiaXQsIGl0IGxvb2tzIGxpa2UgdGhl
cmUncyBhbHJlYWR5IApzb21lIGFsaWFzaW5nIGluIHRoZSBULUhlYWQgaW1wbGVtZW50YXRpb25z
IHdoZXJlIHRoZSBzYW1lCm1hcmNoaWQvbXZlbmRvcmlkL21pbXBsaWQgdHVwbGUgaGFzIGRpZmZl
cmVudCBleHRlbnNpb25zLiAgQXQgdGhhdCAKcG9pbnQgd2UgY2FuJ3QgcmVhbGx5IGRldGVjdGVk
IGJhc2VkIG9uIHRoZSBDU1JzLCBzbyBpdCBzb3J0IG9mIGRvZXNuJ3QgCm1hdHRlciB3aGF0IHRo
ZSBvdGhlciBzdHVmZiBkb2VzIChhdCBsZWFzdCBhcm91bmQgViwgaWYgdGhlcmUncyBzb21lIApv
dGhlciBlcnJhdGEgdGhhdCdzIHVuaXF1ZWx5IGlkZW50aWZpZWQgYnkgdGhlIHR1cGxlIHRoZW4g
d2UgY2FuIGRlYWwgCndpdGggaXQpLgoKU28gSSB0aGluayB3ZSBuZWVkIHRvIGFkZCBhIHdheSBv
ZiBpbmRpY2F0aW5nIHRoZSBoYXJkd2FyZSBzdXBwb3J0cyAKVC1IZWFkIFYgZnJvbSB0aGUgZGV2
aWNlIHRyZWUuICBJJ2QgYXNrZWQgQ2hhcmxpZSB0byBhZGQgaHdwcm9iZSBzdXBwb3J0IApmb3Ig
dGhlIFQtSGVhZCBWIHN0dWZmLCBMTUsgaWYgd2Ugc2hvdWxkIHBpY2sgdXAgdGhlIERUIHNpZGUg
b2YgdGhpbmdzIAphcyB3ZWxsPwoKPgo+IENoZWVycywKPiBDb25vci4KPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
