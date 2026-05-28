Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4037CD5BC9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 01:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Flmj9uw8gqS4htYFS1hnMNo1Xv8UTS3PsmQh9Qyx7es=; b=LdntiWdL7i9utpcmgrPl5mX+vv
	Oad+Fi0vylcL1At+pMWYHa0rWnqnGpvGiDRjcefLsyy5v7yguo3fwe750B7WUmcheMhFJU5r6a1KH
	EOkomIEmE4Wr3FflcgsjcuOvR7XkAb2e70UdkYnsbyVKwtQkosP05DUIAGha7T7wrFTAN7/GQsBkY
	HWElPouq5zPvU9UJYbbUmz5k9PUrhOjtotvx+KDH/BzxWn42SRvbXvFtMLQLrI5olQ3S1ppSh/uMF
	h7bCU5KFIX780813qxmK5zNJoYM/BuHcaOZwl576dJ+Iz1HPJoNYfL3TZOVHYhy7p5UZG2Rv9ejOQ
	eJ6LJoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPDU-00000004vbo-2ZCi;
	Thu, 28 May 2026 01:07:20 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPDR-00000004vbK-46y9
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 01:07:19 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-bd2087858c4so2201465466b.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 18:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779930435; cv=none;
        d=google.com; s=arc-20240605;
        b=FasaFABgzRiuKOhK0s2jNHkBDUUmYof8aMrLJa/nTKfAlnq1p6QoaXXSJWJIIdKXO9
         wnevgOV/zzkQjAaII2+HkxZ5u+rQ7EXEDzFEcGraz9jx4VjAbpXnHsLzNIYY8HLcd9Io
         qMpaTcktWU8pQcu36UDVenqyd2rEUAuVbd0gBihUKGEpTs3pj2K4aaa74HvsDkoOnIfD
         OhzCBofxbIfgEQphriV2/YctDvdTSkSw/BAAxgqFgzIZ6o99i8u6iEK3CrMHyCq8YtP9
         L859JmpakOwUkv/vfDQqpeldjPEvYTt/nBE08qiURmXitH3MSQKRAhDbosUVSk45pQWA
         lTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrEygET0ub6SXScGyc1WXWEeJfR0n/OfKmQ2Hcu6rDE=;
        fh=HqfEA8382++Z5Cr4nH71n00i8TmqwIXyFibgB5kIEkw=;
        b=FcuNdlEr258HYK7qHl/R4KgIYp10bzJrSga/LjX9I03scSeYWDyEKvqvQSyW/TZ1ce
         19Wxsp4ieS3CYKuFJ1a7OqauxNWGQyTCS0jxjjRpKUj2pshZOJljKo1Z8RQDfMO48Hz6
         2T1W59tdPBVnu1J4uOp5GVsYaLwvk0g/WSlYvMhfAytorxh8B0yKDVoE4gV1ezEo+RJm
         BVrRzk3DWUjokW8fwCpKp/hR1LoiuomXO2WzmxwHFAhXbHmFSAPRKE/jfTSF+TjOnepu
         11E/juZIpg9+VDkp6WcUeNePRflc6guMy5Y5Uzu6dSxyqjOutOzNLRFFvKyCYRzv2mUG
         W33g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779930435; x=1780535235; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrEygET0ub6SXScGyc1WXWEeJfR0n/OfKmQ2Hcu6rDE=;
        b=CPcpQfHNsAJCVozRTeIuIeebKJayzKnoAZSitmjjwe3Ajdk9qTzqnQAAQG2A35/l3D
         loBLPlkrIsPKFirBvLYahp9u09VoeJuk6SwPSrrlPnx3x2b55GWeXomPDtIEJ2D2Kog9
         Mj8E31dI/b6YE2qB7W33wdQDPqdLJe0ROW2u2dCDFjMOTB3f8tciHf3ZRRh1aHt2hkqG
         BD/MckFgE1SWIlWRecCUoBG7B0fX75BHJ6CSvz+xy8Z6eDyI5l8QMKFqapUwPot8e7wv
         TqENjXDuKDSepUBwBYB3d/7rBggsid8xajRyZnXIEKs2HRS1djQuv8eqHbShUah4LDv4
         dj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779930435; x=1780535235;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UrEygET0ub6SXScGyc1WXWEeJfR0n/OfKmQ2Hcu6rDE=;
        b=eThFnx6GQDFgPymgN7/uk5pQ7PF/UniVTudBPUhVFtXDLbZdesaneVweABVskLszBB
         DYuIJB2dRkX/tuVSp235DoRkIMm/l5CiwJMPJ9XxI7YTE4AfSOqKzQdKiUf3UP/ibS5j
         WiXRNgy7gm/1rxzlaPLnp6b8PJ0PRGLLniLd6Fjt2p0BlstzYOevmoULDrl0qYv8b6kJ
         HMr2rV0f9W153jIczvcJKfmznv1bM9gah1j7zTPV3O/KapwLeQXlvPeMcqh0vKcA0srI
         jj94P2QLTO1mgQDIcg/khydnWW6hzTYhjkz2tL+DGwYAhWUtblKNjdeT1x5xI+qNI/u5
         8bkg==
X-Forwarded-Encrypted: i=1; AFNElJ8JpK+h3sKolD8JTTqsbz+R6S8nQmygHWes55nY5cyy6zIXnAqXcQbDDpZfUTw69N61yTPf/wor53/Bdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbIbu0izg8R3pz4i2Kn871m3Lfei9S2StTIq7NkyY9OxgNT++s
	Ow4ZTr8HH3q/UM9JR3vQFAFWZrF1kp65a/udLFlyu2NXPeKYzruSipW448gc1rVjbuDndE9ajBV
	ncpSUDKnbs/l+opp9JTy6lxO1LNrbnXalZRn5cOgSXlLDB7SpG8MmlEcrew==
X-Gm-Gg: Acq92OFo6FyXHeSRh/cpZWhGmSDaC4kuAtxPLSRauJ8lTFf2jmOf3Gk6CbXTF8Nq/eA
	zZQ4HkEGoXgghk/9av86EDJCDQpgUOfbgHQ97rVj469Hkxce3EkqGmC+JamRXv3E5qmLxsYici6
	plUFXhIl5A7Y+UkI81zdnObU1t2XiCwqYMqIAkmD7UyKxHKnS4e3iWSQriNPnCMHSK0sxm2G1Lr
	5DoBaO9A03L7CEZtkQ6oGUCVedipBlbIkT6viwvw1UKquoQQAGZypNRbS2uO1jtpkCtGnzkF0Pg
	cEEdtDzD72Ks2CW2cGD/
X-Received: by 2002:a17:906:ef0c:b0:bc6:2bd3:8176 with SMTP id
 a640c23a62f3a-bdd279d1b58mr1683985266b.35.1779930435376; Wed, 27 May 2026
 18:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260522093634.3530233-1-zong.li@sifive.com>
In-Reply-To: <20260522093634.3530233-1-zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 28 May 2026 09:07:04 +0800
X-Gm-Features: AVHnY4LOBzez2hZ26ydiwh9HyF_yruxObXW8zrldUZyc1uRvSlEpFCslJSdzyAg
Message-ID: <CANXhq0pfU1+Qv-SdJRzwvSDQw010+QovUH-OuG4tcwwsjf90MQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: cfi: reduce shadow stack size limit from 2GB to 512MB
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	debug@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, re@w6rz.net, 
	Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, szabolcs.nagy@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_180718_073767_2D774AD0 
X-CRM114-Status: GOOD (  28.75  )
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

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgNTozNuKAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBDaGFuZ2UgdGhlIHNoYWRvdyBzdGFjayBzaXplIGNhbGN1bGF0aW9u
IGZyb20gUkxJTUlUX1NUQUNLLzIgKGNhcHBlZCBhdAo+IDJHQikgdG8gUkxJTUlUX1NUQUNLLzgg
KGNhcHBlZCBhdCA1MTJNQiksIGZvbGxvd2luZyBEYXZpZCBMYWlnaHQncwo+IGFuYWx5c2lzIGFu
ZCByZWNvbW1lbmRhdGlvbi4KPgo+IFJhdGlvbmFsZToKPgo+IERhdmlkIExhaWdodCBwb2ludGVk
IG91dCB0aGF0IHRoZSBmb2N1cyBzaG91bGQgYmUgb24gdGhlIHJhdGlvIGJldHdlZW4KPiBzaGFk
b3cgc3RhY2sgc2l6ZSBhbmQgdGhlIG5vcm1hbCBzdGFjayBzaXplLCByYXRoZXIgdGhhbiBqdXN0
IHRoZQo+IGFic29sdXRlIHVwcGVyIGxpbWl0LiBIaXMgYW5hbHlzaXMgc2hvd2VkIHRoYXQgd2hp
bGUgdGhlcmUgYXJlIG1hbnkKPiBmdW5jdGlvbnMgd2l0aCBzbWFsbCBzdGFjayBmcmFtZXMsIHRo
ZSBtYWpvcml0eSBoYXZlIHN0YWNrIGRlbHRhcyBvZgo+IG92ZXIgNjQgYnl0ZXMgZHVlIHRvIHNh
dmVkIHJlZ2lzdGVycyBhbmQgbG9jYWwgdmFyaWFibGVzLgo+Cj4gU2hhZG93IHN0YWNrcyBvbmx5
IHN0b3JlIHJldHVybiBhZGRyZXNzZXMgKDggYnl0ZXMgcGVyIGVudHJ5IG9uIDY0LWJpdAo+IHN5
c3RlbXMpLCB3aGVyZWFzIG5vcm1hbCBzdGFjayBmcmFtZXMgdHlwaWNhbGx5IGNvbnN1bWUgNjQr
IGJ5dGVzLiBUaGlzCj4gODo2NCBieXRlIHJhdGlvIG1lYW5zIHRoYXQgcHJvZ3JhbXMgdXNpbmcg
YSBsb3Qgb2Ygc3RhY2sgc3BhY2UgYXJlCj4gZG9taW5hdGVkIGJ5IGxhcmdlIGJ1ZmZlciBhbGxv
Y2F0aW9ucyBhbmQgbG9jYWwgdmFyaWFibGVzLCBub3QgZXh0cmVtZQo+IHJlY3Vyc2lvbiBkZXB0
aHMgd2l0aCBtaW5pbWFsIGxvY2FsIGRhdGEuCj4KPiBGb3IgZXhhbXBsZSwgd2l0aCB0aGUgZGVm
YXVsdCBSTElNSVRfU1RBQ0sgb2YgOE1COgo+IC0gUkxJTUlUX1NUQUNLLzIgZ2l2ZXMgYSA0TUIg
c2hhZG93IHN0YWNrIHN1cHBvcnRpbmcgNTEySyBuZXN0ZWQgY2FsbHMKPiAtIFJMSU1JVF9TVEFD
Sy84IGdpdmVzIGEgMU1CIHNoYWRvdyBzdGFjayBzdXBwb3J0aW5nIDEyOEsgbmVzdGVkIGNhbGxz
Cj4KPiBHaXZlbiB0eXBpY2FsIHN0YWNrIGZyYW1lIHNpemVzIG9mIDY0KyBieXRlcywgUkxJTUlU
X1NUQUNLLzggaXMgc3RpbGwKPiBjb25zZXJ2YXRpdmUgYW5kIHByb3ZpZGVzIGFkZXF1YXRlIGRl
cHRoIGZvciBwcmFjdGljYWwgYXBwbGljYXRpb25zLgo+IERhdmlkIG5vdGVkIHRoYXQgdGhpcyBj
b3VsZCBldmVuIGJlIHNhZmVseSBoYWx2ZWQgYWdhaW4uCj4KPiBUaGlzIHJlZHVjdGlvbiBhbHNv
IGJldHRlciBhY2NvbW1vZGF0ZXMgbWVtb3J5LWNvbnN0cmFpbmVkIHBsYXRmb3Jtcy4KPiBPbiBz
eXN0ZW1zIHdpdGggbGltaXRlZCBwaHlzaWNhbCBtZW1vcnksIGFsbG9jYXRpbmcgbGFyZ2Ugc2hh
ZG93IHN0YWNrcwo+IGNhbiBjYXVzZSB2aXJ0dWFsIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmVz
IHdoZW4gb3ZlcmNvbW1pdCBtb2RlIGlzIHNldAo+IHRvIE9WRVJDT01NSVRfR1VFU1Mgb3IgT1ZF
UkNPTU1JVF9ORVZFUi4KPgoKQWRkaW5nIE1hcmssIFN6YWJvbGNzIGFuZCBDYXRhbGluIHRvIHRo
aXMgdGhyZWFkLgoKSSBub3RpY2VkIHlvdXIgcHJldmlvdXMgZGlzY3Vzc2lvbnMgYWJvdXQgdGhl
IHNoYWRvdyBzdGFjayBzaXplIGluIHRoZQpBUk02NCBHQ1MgcGF0Y2ggc2VyaWVzLiBJIHNlZSB0
aGF0IHRoZSBHQ1Mgc2l6ZSB3YXMgZXZlbnR1YWxseSByZWR1Y2VkCmZyb20gNEcgdG8gMkcuCgpC
ZWNhdXNlIHRoZSBSSVNDLVYgc2hhZG93IHN0YWNrIHN0b3JlcyB2ZXJ5IHNpbWlsYXIgZGF0YSB0
byBHQ1MsIEkKYWxzbyByZWR1Y2VkIHRoZSBSSVNDLVYgc2hhZG93IHN0YWNrIHNpemUgdG8gMkcg
aW4gbXkgcmVjZW50IHBhdGNoLgpZb3UgY2FuIGZpbmQgdGhlIHJlYXNvbnMgZm9yIHRoaXMgY2hh
bmdlIGhlcmU6Cmh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtcmlz
Y3YvMjAyNi1NYXkvMDkxMzA4Lmh0bWwKCkluIHRoZSBzYW1lIHRocmVhZCwgd2UgZGlzY3Vzc2Vk
IGlmIHdlIGNvdWxkIG1ha2UgdGhlIHNpemUgZXZlbgpzbWFsbGVyLiBUaGFuayBEYXZpZCBmb3Ig
aGlzIGhlbHBmdWwgYW5hbHlzaXMgb24gdGhpcyB0b3BpYy4KClNpbmNlIEdDUyBoYXMgYmVlbiBt
ZXJnZWQgZm9yIGEgZmV3IHllYXJzIG5vdywgd2UnZCBsaWtlIHRvIGxlYXJuIGZyb20KeW91ciBl
eHBlcmllbmNlLiBXZSB3YW50IHRvIG1ha2Ugc3VyZSB3ZSBhcmUgbm90IG1pc3NpbmcgYW55IGlt
cG9ydGFudAppbXBhY3RzIG9yIGlzc3Vlcy4gVGhlcmVmb3JlLCB3ZSB3b3VsZCByZWFsbHkgYXBw
cmVjaWF0ZSBpdCBpZiB5b3UKY291bGQgc2hhcmUgeW91ciB0aG91Z2h0cyB3aXRoIHVzLiBUaGlz
IHdpbGwgZ2l2ZSB1cyB0aGUgY29uZmlkZW5jZSB0bwptb3ZlIGZvcndhcmQgd2l0aCB0aGUgcGF0
Y2gKClRoYW5rcwoKCj4gU3VnZ2VzdGVkLWJ5OiBEYXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdodC5s
aW51eEBnbWFpbC5jb20+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYw
NTE4MTA1NzI1LjdhZmU3YTRjQHB1bXBraW4vCj4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9u
Zy5saUBzaWZpdmUuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMgfCA0
ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC91c2VyY2ZpLmMKPiBpbmRleCBjYmZiNGU0OTVlOWYuLmFkZjk3NDI2YTkwNiAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC91c2VyY2ZpLmMKPiBAQCAtMTEwLDcgKzExMCw3IEBAIHZvaWQgc2V0X2luZGlyX2xw
X2xvY2soc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBib29sIGxvY2spCj4gIH0KPiAgLyoKPiAg
ICogVGhlIHNoYWRvdyBzdGFjayBvbmx5IHN0b3JlcyB0aGUgcmV0dXJuIGFkZHJlc3MgYW5kIG5v
dCBhbnkgdmFyaWFibGVzCj4gLSAqIHRoaXMgc2hvdWxkIGJlIG1vcmUgdGhhbiBzdWZmaWNpZW50
IGZvciBtb3N0IGFwcGxpY2F0aW9ucy4KPiArICogNTEyTSBzaG91bGQgYmUgbW9yZSB0aGFuIHN1
ZmZpY2llbnQgZm9yIG1vc3QgYXBwbGljYXRpb25zLgo+ICAgKiBFbHNlIFBBR0VfQUxJR04gaXQg
YW5kIHJldHVybiBiYWNrCj4gICAqLwo+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBjYWxjX3Noc3Rr
X3NpemUodW5zaWduZWQgbG9uZyBzaXplKQo+IEBAIC0xMTgsNyArMTE4LDcgQEAgc3RhdGljIHVu
c2lnbmVkIGxvbmcgY2FsY19zaHN0a19zaXplKHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiAgICAgICAg
IGlmIChzaXplKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gUEFHRV9BTElHTihzaXplKTsKPgo+
IC0gICAgICAgcmV0dXJuIFBBR0VfQUxJR04obWluKHJsaW1pdChSTElNSVRfU1RBQ0spIC8gMiwg
U1pfMkcpKTsKPiArICAgICAgIHJldHVybiBQQUdFX0FMSUdOKG1pbihybGltaXQoUkxJTUlUX1NU
QUNLKSAvIDgsIFNaXzUxMk0pKTsKPiAgfQo+Cj4gIC8qCj4gLS0KPiAyLjQzLjcKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
