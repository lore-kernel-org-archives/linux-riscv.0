Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2871C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 02:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWdBsxc/UFsOPrm2l039Q6D0xtaZO+u38WDfUAnLUjE=; b=U2qAtkxaIgkLVE
	pyFMWU4NZKbC/+BdsoZOe/gnFNtbXXh7KO+W5mrXAEVU8MNMr+iF4dRpLqy1F9RqwS72XLAYiWvgI
	QguOclVvAPTLMtkVhYGi/UFvaJUE8UflR6P6KLY+VXmSxm4OjtgNnu7To/LYR2YqNcgUhccqnAa+k
	sQ6bn4fQvkYj2LWLRSGkKhMoW/pFcsy9kJqKiTrjKELXSK/hqMQPWRMdloMGrnxq714p9mDTWWcUh
	sZwvP9+4M9pX4hhCDU/gJLVWrGnZM5TIEDjQiUBXkQWNv5L7ZVbX0SqHQ/xai9k73Ld2hZs4xkpUG
	/RpJEllynekAL8GANuoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ZYC-0040BK-14; Thu, 01 Dec 2022 02:43:48 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ZY8-00407G-Hu
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 02:43:46 +0000
Received: by mail-ed1-x52a.google.com with SMTP id s5so542147edc.12
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 18:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WMuFoLwq6if5lfsejZqkU+pkwkmJVnwkSd6yWbaeyOY=;
        b=QFoku3nZm3W8q3prt+EhbRpDYHxv4fc7ergeIIGsDpA+3Us5h/oncs8WpRUeKomnd0
         pO6VNkJd8slm/hEijPmdOIuqWZNazLV9gkrAwJ1ulptle/tSyJChy6osS7TPbu5fukMY
         8kQiONr6xYZWU2QR+Yasaf4UX7q0xgko6Kik9x5HBtqiwl9xH4yHYqWQckGrt/xAm5xP
         Seg86FyFzAHMbABPIJQmygBFBUrIXUxUYSTx3RtmiwEQteE3JQflis3tLloUhcBkaPQp
         8mCSNbyfIy1D0e6hSbnKmBBcgRYeQhCO/Nc3Ru18Zt6EsiLncfRYlb5jF1iqjkJ0HfaY
         /hTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WMuFoLwq6if5lfsejZqkU+pkwkmJVnwkSd6yWbaeyOY=;
        b=q/vBfIbjNPZ1ecZJQvyRI+a8E2KJmq/f5izvQjUFFia1wanrhNCmOIczN+fRs9IkAo
         qn8DkE/aGHX5Oy+e9AGnM9lLmLu6sdFNvTL7DaBi8osqPtl87eiVHQHmQRQ/75DQ9kiG
         ZWIwJb08E0PcvwI29FfLNaJSwT/IKqqBzdM9q/0qqD/E6W36qgETJ4dlzq0/C1izkEg1
         5UpLiokn3gNZLkg2M3kiM7pKP+eKH0KlQNF98EqGk31N5VvU5xgq7FromwhiM2yGtQjv
         DFtaimBNYwIvnxlkQdYm/4UDpY/Uoc/2bfP5WsBS3Ak3SwCMzTqPjZKGT0Vxvtqz8SE3
         wSOA==
X-Gm-Message-State: ANoB5plbB8WVrzr2lRF0iPlwYYWJB3uiVA7JcF+nZepO4Yd2exG6HxV5
	ODRNi8ngGkkIpk0P701EP3YSW8KfarvDQjXl
X-Google-Smtp-Source: AA0mqf6v2PExAoNMrIKI4AK1MjDKAsaOkEr1IGWcxKgj9FPBNjIQkw8GS+pomOGeXWinf7x9/1e4hw==
X-Received: by 2002:a05:6402:206b:b0:46a:d5ed:e066 with SMTP id bd11-20020a056402206b00b0046ad5ede066mr24110003edb.335.1669862619507;
        Wed, 30 Nov 2022 18:43:39 -0800 (PST)
Received: from andrea (host-79-26-70-104.retail.telecomitalia.it. [79.26.70.104])
        by smtp.gmail.com with ESMTPSA id q3-20020a056402040300b004616b006871sm1210741edv.82.2022.11.30.18.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 18:43:38 -0800 (PST)
Date: Thu, 1 Dec 2022 03:43:32 +0100
From: Andrea Parri <andrea@rivosinc.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, guoren@kernel.org,
	jszhang@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: fix race when vmap stack overflow
Message-ID: <Y4gSJnVh1/lUSnWo@andrea>
References: <mhng-72408cf8-cbde-489b-9042-379b5aa8624f@palmer-ri-x1c9>
 <F84A2656-5938-45F7-A097-58CE348B7119@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F84A2656-5938-45F7-A097-58CE348B7119@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_184344_799970_2C833F84 
X-CRM114-Status: GOOD (  14.84  )
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

PiA+Pj4gQEAgLTIzLDYgKzIzLDcgQEAKPiA+Pj4gI2RlZmluZSBSRUdfTCAgICAgICAgICBfX1JF
R19TRUwobGQsIGx3KQo+ID4+PiAjZGVmaW5lIFJFR19TICAgICAgICAgIF9fUkVHX1NFTChzZCwg
c3cpCj4gPj4+ICNkZWZpbmUgUkVHX1NDICAgICAgICAgX19SRUdfU0VMKHNjLmQsIHNjLncpCj4g
Pj4+ICsjZGVmaW5lIFJFR19BTU9TV0FQX0FRIF9fUkVHX1NFTChhbW9zd2FwLmQuYXEsIGFtb3N3
YXAudy5hcSkKPiA+PiBCZWxvdyBpcyB0aGUgcmVhc29uIHdoeSBJIHVzZSB0aGUgcmVsYXggdmVy
c2lvbiBoZXJlOgo+ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUpGMmdUUkFFWF9q
UV93NUgwNWR5YWZaekhxK1A1ajA1VEo9Qyt2K09MX19HUWFtNEFAbWFpbC5nbWFpbC5jb20vVC8j
dQo+ID4gCj4gPiBTb3JyeSwgSSBoYWRuJ3Qgc2VlbiB0aGF0IG9uZS4gIEFkZGluZyBBbmRyZWEu
ICBJTU8gdGhlIGFjcXVpcmUvcmVsZWFzZSBwYWlyIGlzIG5lY2Vzc2FyeSBoZXJlLCB3aXRoIGp1
c3QgcmVsYXhlZCB0aGUgc3RhY2sgc3RvcmVzIGluc2lkZSB0aGUgbG9jayBjb3VsZCBzaG93IHVw
IG9uIHRoZSBuZXh0IGhhcnQgdHJ5aW5nIHRvIHVzZSB0aGUgc3RhY2suCj4gCj4gSSB0aGluayB3
aGF0IHlvdSByZWFsbHkgd2FudCBpcyBhICpjb25zdW1lKiBiYXJyaWVyLCBhbmQgc2luY2UgeW91
IGhhdmUKPiB0aGUgZGF0YSBkZXBlbmRlbmN5IGJldHdlZW4gdGhlIGFtb3N3YXAgYW5kIHRoZSBt
ZW1vcnkgYWNjZXNzZXMgKGFuZAo+IHRoaXMgaXNu4oCZdCBBbHBoYSkgeW914oCZcmUgdGVjaG5p
Y2FsbHkgZmluZSB3aXRob3V0IHRoZSBhY3F1aXJlLCBzaW5jZQo+IHlvdeKAmXJlIHdyaXRpbmcg
YXNzZW1ibHkgYW5kIGhhdmUgdGhlIGRhdGEgZGVwZW5kZW5jeSBhcyBzeW50YWN0aWMuCj4gVGhv
dWdoIHlvdSBtYXkgc3RpbGwgd2FudCAobmVlZD8pIHRoZSBhY3F1aXJlIHNvIGxvYWRzL3N0b3Jl
cyB1bnJlbGF0ZWQKPiB0byB0aGUgc3RhY2sgcG9pbnRlciB0aGF0IGhhcHBlbiBsYXRlciBpbiBw
cm9ncmFtIG9yZGVyIGdldCBvcmRlcmVkCj4gYWZ0ZXIgdGhlIGxvYWQgb2YgdGhlIG5ldyBzdGFj
ayBwb2ludGVyIGluIGNhc2UgdGhlcmUgY291bGQgYmUgd2VpcmQKPiBpc3N1ZXMgKnRoZXJlKi4K
CkFncmVlZC4KCkp1c3QgdGhlIGZhY3QgdGhhdCB0aGlzIGlzIHRoZSA0dGggaXRlcmF0aW9uIG9m
IHRoaXMgZGlzY3Vzc2lvbiBzdHJvbmdseQpzdWdnZXN0cyB0byBzdGljayB0byB0aGUgYWNxdWly
ZSBhbmQgdGhlc2UgaW5saW5lIGNvbW1lbnRzIHRvIG1lLiAgOykKCiAgQW5kcmVhCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
