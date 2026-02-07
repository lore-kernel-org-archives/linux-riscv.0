Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10FFEE6B65
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 04:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ll4j9pE6Kd36TkSZ/8K2GdizWSiuKi99Vp11VFT8rZY=; b=Qnvv2J7vIRsk3u
	mRmGIiv11Yfx7BsW8UIGCTaMaOnYJsGK1OmcZd2eTPRxs3gY2z2qgDELWVB5rDsMAQut5BLrhIkPr
	0+SQYoDU57/QuQ7kUz8zl0KawbpyV48xYvZA/xAMMm+d5XUsZsrRA56MjUk7CG84V0dWukjo0dU8m
	liR4tAWQUeRxADFgfOdaG4O2FrfVETALFcYmfWtFa4WtzOD8f7D7PLyOtOQ4edduEdJn3a4QBmXT4
	HuaKXRaU0VP+felNLxnatJL2kn9Zkjf/6/VVkFyOPFlWjTocjhlA5bZyrqUNKoV/cNffmwI0Fjrpb
	VJSt7sQIFL/mFooNlgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voZeY-0000000C6TY-3QXE;
	Sat, 07 Feb 2026 04:10:39 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voZeV-0000000C6T9-1tlM
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 04:10:36 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6481bd173c0so1180536d50.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 20:10:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770437432; cv=none;
        d=google.com; s=arc-20240605;
        b=eFR5MKgvnzTeXANEYbuNy4Jh3NrnbkafBxc8K/5+9wcELaKvS5rycF26DzLepmCDxV
         agmYkdI+0olWr57MEDekkKC75yY1rEk1nbVJAIQ8wEj4XJubi3Hxf3sbfwe34Zdf1StM
         lQrAOuGggaoc64BOO5cUvqAC5+rmxEhOwJcL+BTR6Uw0IoQFlIsj5xNCw6Smh0qlkkqi
         HVC+6geD7/j3OCI7SCpNIHsoeRSqT1OVcFKbpIA/fKESwNoIcKmO4fN1yrkm2UV6+nuT
         M2LoOdE2n8/WRxTvIqHWZYaNjzGSN5MdgwKNwVVWRbPzeKXlHpbKklu81REs9jPUzNy9
         IqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HQK2vIOwkG2ALyK6WHU0SCQALHfOl9ftPcggyCW9CDQ=;
        fh=6cPi46pnl5ep5+3hPq5uOcXlrGfaYvCRRysHOOhnFIE=;
        b=ULQol/Omn06SvIvvcMQzFm44msM484qHc6lXhyQmJ1NqblbJ8Pup6pCVd8OtpOD5gT
         Mpkjth8zQGPO/Bq2Vrf5rheiAeor8RMVy/GHgRSeFl76TdtMKyUg9pZhB2/eED8CPxep
         pJ0UmIy51Znw2H02G2i+4I7hQx7u4U+5NQS05/0s8+H+xiQ/lkTYIgGPxdfMhGIJSqNQ
         P6nxem2C2WipGJyJdUhvra6vjvxJjxoO0ajWFEn62tJ1A8n9Ab7oFdQ03SqhKfL14l55
         5yOOe4XxwFIZ2204EPFfCe3iRupiNVFdylLKY/ntpl4VVG1GWNx/0CA6g8LrFHKWfgNl
         Eq7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770437432; x=1771042232; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQK2vIOwkG2ALyK6WHU0SCQALHfOl9ftPcggyCW9CDQ=;
        b=KC6KuGKSL88fi+LaGlgOrUseWc9cTYscDo0buGyvT7nToDmEiQk6LrBxEQqOJ37rjK
         bQEosTLCnrsnTjtp6397ntfMon+AypA/xXfQUr5E/7RovlRmZRB5hWvAWpbwB7Ej29eW
         dae5rdID740Btg++QwlTi3j3hqpJ4g3BjYyrPgzwge06Qd4ekSHFFXfhLpNYhHDEBUUx
         zuJzgdGTme6+xVJ2NzRrEEv9+tbJ5TF9hNqqN1CJJMu5OKvTW9m3Nb69BK9LxlODjyTK
         uyz1oP7YIVTRdcBwv1TAoXyJEImsZkksUgss689DFwPu61744nYEjo/9Sr2zjxMljzMO
         Bjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770437432; x=1771042232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQK2vIOwkG2ALyK6WHU0SCQALHfOl9ftPcggyCW9CDQ=;
        b=o/g7apba92PrNGE5fchjwvHvuB+1Rp+Z5J7OOJXJ6A6tOnc2SvOLrTp5Hug23YIRkM
         uqjSztIEu4bfo1APqPqiuxZndQuMdpAbM5wev6IJUFw8VRxmWXsf9rhzmWO7Y1RiSVpm
         bWywSAgm2eitj4Dw2Pq9bpjdDudsqB0SaftninqTIH2+jZsiF3Gv5Qog+tAZg1o3r+9Z
         o1gfmKeIFiiGA9Eh8ol09CfH2Osq0x0ZzYi/RGw2jmtqxmrmmBqUe9ZAkqP378TNhhEg
         4wjqgddn9sRPwVxaQ/nnKk0e6LKwzpJlFCVRdE6Y9TrdH0Zv0+2HFPnSMQXVWEll8J83
         ckuw==
X-Forwarded-Encrypted: i=1; AJvYcCXz+e5GOvGIstZI4/P1tnba/vUmPRLN0tj47QDUkGnJlFmIN+2sAAvZcNVUsWaVWw92xW0t7KYGtNqJ7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMIllwTF37VWkwR/XQNL6xjj9/jbHtMoDZtl3l/c8RnfVuqi4I
	SkjSRI+I11O5m8nk+Tjz1M2Humtm3DbMHl0vgbyAQjiynYdSHkTLWZ0sitaqEdi1yf7WyHYoOZH
	NIOMo5pAXlaVBDha702sTVC7STwx01WikIMTu9UohtqkGOf6fuR/cqJ4=
X-Gm-Gg: AZuq6aJjWAkVZ+MnnKDOCZF7JDLUqM51lVqlHZt5gQIfnNS4e9h6+NVgJ4BoGOjByPH
	/dp5Pna1pxR2ZDtemkMyF7gwcfopR8df4e78zsoJ9cF+KFvy7j45K/fs3jwOE25ku9c4jFyGw9p
	uM0lYGDHwvEA85Q76FK4szTsEHU7HG9GvhY6lIQEqhvnfpZbGn8ril0/3gsR6N9anQgX9rtEFzD
	J+cv9lykzQxaNK+qBJDbWYIHUlkx2yFaPABywcEaBQbv7lC0urCypRXFGPeSSAhsnAWIbSZ8lKB
	jlRA8LSKOWpA/CrDmQB/WUrzRVL9XifIve8crX+gTpb5zzH8uz/7JODJgIJs
X-Received: by 2002:a53:c5d1:0:b0:649:c36a:a9bb with SMTP id
 956f58d0204a3-649f1f42967mr3431006d50.61.1770437431753; Fri, 06 Feb 2026
 20:10:31 -0800 (PST)
MIME-Version: 1.0
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-2-0922e43acaba@oss.tenstorrent.com>
 <20260205-spiffy-bizarre-doberman-184d2b@quoll> <CAEev2e_S9LYV609VmrHCqNneuTro=hbAjzgHFLAO6RD0_fErwA@mail.gmail.com>
 <cb18f760-500b-4417-b706-cdc7448441a4@kernel.org>
In-Reply-To: <cb18f760-500b-4417-b706-cdc7448441a4@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 6 Feb 2026 22:10:20 -0600
X-Gm-Features: AZwV_QiWVk70UuqcqOk0z1X8KAuxupWx6vboVsxCRDDE3guQwzCiVTZlUA0eLqY
Message-ID: <CAEev2e9SqrHu5HdXzpCf1wuFNakEa=p8N-CMEZY-=DwS45E80w@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] reset: tenstorrent: Add reset controller for Atlantis
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_201035_570418_2EB1DFAC 
X-CRM114-Status: GOOD (  20.13  )
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

T24gVGh1LCBGZWIgNSwgMjAyNiBhdCAxMjo0N+KAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAwNS8wMi8yMDI2IDE1OjE4LCBBbmlydWRoIFNy
aW5pdmFzYW4gd3JvdGU6Cj4gPiBIZWxsbyBLcnp5c3p0b2YsCj4gPgo+ID4gT24gVGh1LCBGZWIg
NSwgMjAyNiBhdCAzOjI34oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Pgo+ID4+IE9uIE1vbiwgRmViIDAyLCAyMDI2IGF0IDAxOjQ2OjUwUE0gLTA2
MDAsIEFuaXJ1ZGggU3Jpbml2YXNhbiB3cm90ZToKPiA+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
c29jL3RlbnN0b3JyZW50L2F0bGFudGlzLXByY20uaCBiL2luY2x1ZGUvc29jL3RlbnN0b3JyZW50
L2F0bGFudGlzLXByY20uaAo+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+PiBpbmRleCAw
MDAwMDAwMDAwMDAuLjg0MTUxNmNiZWZkOQo+ID4+PiAtLS0gL2Rldi9udWxsCj4gPj4+ICsrKyBi
L2luY2x1ZGUvc29jL3RlbnN0b3JyZW50L2F0bGFudGlzLXByY20uaAo+ID4+PiBAQCAtMCwwICsx
LDMxIEBACj4gPj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpICovCj4gPj4+ICsvKgo+ID4+PiArICogU2hhcmVkIGRlZmluaXRpb25z
IGZvciBBdGxhbnRpcyBQUkNNIENsb2NrIGFuZCBSZXNldCBEcml2ZXJzCj4gPj4+ICsgKgo+ID4+
PiArICogQ29weXJpZ2h0IChjKSAyMDI2IFRlbnN0b3JyZW50Cj4gPj4+ICsgKi8KPiA+Pj4gKyNp
Zm5kZWYgX19TT0NfQVRMQU5USVNfUFJDTV9IX18KPiA+Pj4gKyNkZWZpbmUgX19TT0NfQVRMQU5U
SVNfUFJDTV9IX18KPiA+Pj4gKwo+ID4+PiArI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KPiA+Pj4g
KyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ID4+PiArCj4gPj4+ICtzdHJ1Y3QgYXRsYW50aXNf
cHJjbV9hZGV2IHsKPiA+Pj4gKyAgICAgc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgYWRldjsKPiA+
Pj4gKyAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ID4+PiArfTsKPiA+Pgo+ID4+IERyb3As
IHRoZXJlIGlzIG5vIGRyaXZlci13aWRlIHVzZXIgb2YgdGhpcy4KPiA+Cj4gPj4KPiA+Pj4gKwo+
ID4+PiArc3RhdGljIGlubGluZSBzdHJ1Y3QgYXRsYW50aXNfcHJjbV9hZGV2ICoKPiA+Pj4gK3Rv
X2F0bGFudGlzX3ByY21fYWRldihzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYWRldikKPiA+Pgo+
ID4+IFNhbWUgaGVyZS4KPiA+Pgo+ID4+IERvIG5vdCBhZGQgc3ltYm9scyB0byBoZWFkZXJzIHdo
aWNoIG5vdGhpbmcgdXNlcy4gVGhlc2UgYXJlIHByaXZhdGUgdG8KPiA+PiB0aGUgZHJpdmVyIHNv
IHRoZXkgbXVzdCBzdGF5IE9OTFkgaW4gdGhlIGRyaXZlci4KPiA+Cj4gPiBUaGUgZGVmaW5pdGlv
bnMgaW4gdGhlc2UgZmlsZXMgYXJlIHNoYXJlZCBiZXR3ZWVuIHRoZSBjbG9jayBhbmQgcmVzZXQK
PiA+IGRyaXZlciAod2hpY2ggYXJlIGluIGRyaXZlcnMvY2xrL3RlbnN0b3JyZW50LyBhbmQgZHJp
dmVycy9yZXNldC8pLAo+ID4gaGVuY2UgdGhleSBoYXZlIGJlZW4gcHV0IGhlcmUuCj4KPgo+IEFo
LCBidXQgdGhlbiBJIHdvbmRlciB3aHkgeW91ciBjbG9jayBkcml2ZXIgbmVlZHMgdG8gYWNjZXNz
IHJlc2V0IGRyaXZlcgo+IHN0cnVjdHVyZXMuIE9yIHZpY2UgdmVyc2EuIFlvdSBhcmUgb25seSBl
eHBlY3RlZCB0byBnZXQgcmVnbWFwIGZyb20gdGhlCj4gcGFyZW50LCBubz8KClllcywgaXQgc2Vl
bXMgdG8gYmUgZG9hYmxlIHdpdGhvdXQgdGhlc2Ugc3RydWN0cy4gSSB3aWxsIHJlbW92ZSB0aGVt
LAphbmQgbW92ZSB0aGUgcmVnaXN0ZXIgZGVmaW5pdGlvbnMgaW50byB0aGUgc3BlY2lmaWMgZHJp
dmVycy4KCj4KPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
