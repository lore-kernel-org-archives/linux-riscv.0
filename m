Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F65C3ABA9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 19:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCtYxrBoIMSKswvSk3Wxb+5ldecp7ydtOZwFIHEPIKI=; b=bMjjq5XP7rFTuB
	xyGlb70ZlJP7wamLxGD+oaryBJL8ULu2rMZR8lvb+TrIBz02rkYUGfcA0WtoHrdzAv6o7KMlaY7vY
	4Gb38dx0keP5nDc5mBHkx2a5ajByhOvnGqypIMLxlRVz2ePiWq04eDL3tsj2/cy8kDQixewnqnTy5
	FiwtfWm02BeRFpdLAOFXYSo2lsuW4Ew44aWwNL4WSm5gGuX/M+fxXhXmo0c27gCqxQylj13ESEKFe
	Xy2Z9tfPUQcxSDQIv/y2fyQITWEFCtt491y8v8VZJ7jEYrRWPx9CUfImbqRD7bDwiIt680ONf4pMn
	8QlN2wQZnaqFusss8FMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qMx-0000000AdS4-1fp6;
	Tue, 29 Apr 2025 19:11:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qM9-0000000AdP4-0gW8;
	Tue, 29 Apr 2025 19:11:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d0618746bso46413905e9.2;
        Tue, 29 Apr 2025 12:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745953859; x=1746558659; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OD4Lo67S9frh/bFzs0ODT/uCFExNx9+MNFdXvKnz0+s=;
        b=LnXsHXBnhY/AHf0lEjripmy9UtwX2lsN63qWiSrkXNTBgN0qWHIowalemfqUZA2a9w
         Pj1wptQoFzucKL2Z+tIP+Q1xWTTlDFYZK7WLknqk7CYIDLprXjbJiaMQZN8bb53zLJeP
         IABoUvkNyFDlu1BQDI0Bxw90z58IQMPkE42kBzIWJEXLnVu6ARS6Iky0hhVg8EaZ1hxc
         afxsI1oQ7/aR8uAoOiXSXTBYmvA8ikkwy5B4AgGOzzUGTi7B8QmS63Aay6muPOpWsNAc
         axv85ck/Fr13TSRddxte65DTZVEtpeEK6t0xnPTQTOpPH0bnljs5WnPPUXexmWjs4iCa
         zZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953859; x=1746558659;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OD4Lo67S9frh/bFzs0ODT/uCFExNx9+MNFdXvKnz0+s=;
        b=FBMTTHindP7dIGzFQ7yjNhqlLcvUzhmAfIJNamOFwhzBbaTvdpK0+6aG0bXzBc0AVI
         bgrR5RJSOM8iFtndlGfAxti4IoBUdD2dPSAD1rmDav9PT/Q3hcv5zmHgWU4qPLxXVQqj
         H06q7RofCxuKP5PSaxsa5mE7ngNavRm+rzHGGHlCBe8AdYwNviegxHyR+IcYOoh345r6
         DJyUdeYwQtB3cPSFpppa/1io5OhjBfIl9aZLnJLHb925fEfbeYP8VdZglviI3LelffBm
         VtKvdr4OkwgQ/pNWggOeFIGtUp7uiSf3BxiRN9FSwl0HfwHEY5rDPzINIMMkDXWbWCOg
         fzQA==
X-Forwarded-Encrypted: i=1; AJvYcCWBffemKPir8rD9nAipgS/KcvhyxH7Xa/rLMndaetpSO8lUIyTDyfc0ga1cgK2058k1Fws2uT3kzhwrVsA=@lists.infradead.org, AJvYcCWavFC/BCTdZM7RNdnd9TvXlAlry6YcQSZbXkS3ntTfInH6pTOx4V4t9u/AXsvzSOhA2Bm0pOrb2A43px+jJ3s6@lists.infradead.org
X-Gm-Message-State: AOJu0Yys1o7hCrsL/1NuILD4SG7kYjk/G4ByAihLbyxxPLqmGnMdS+yO
	ln/Igbk1x71yJ20u+XF3uURwaPlt8Y8ot/+Vj2/N8wdhWBMXvqlh
X-Gm-Gg: ASbGncuIsoY8+6WOWU4xXQMh6UVL7DHxKh/QSZix2u0tM40CYaEtUTCEqE5BxHaYbR8
	rpr601FEAc8IK1UtrGEhcWLClqrRKnRDsD/IhuXHg2dzokHC7zpcw7fk7jo1UdSNWYRjWrFfMSm
	l9GRWOnwdm77kj3+CKSAHKe2EbqLX2+4hBhIlVutz71SM+VdKrDeTinT5AZok+n3ge2Cdni1gsx
	k6MDLTMF+Ks+SvyilUG3hlvKzvgGkmuoWDTWU5MWNEF7hTxBd9I2Un4nnmLO4JLEZx1naCFlzaj
	XjOim3AOV01C269kx3cyXbWxrRudehKPbPRtEj6Y8cC2AUGV8ZEFmEMlgbTq
X-Google-Smtp-Source: AGHT+IFDM8GNhhU5MZTnxhWi/Kr9STxCFjfV24N4ph+Q2bcawdkL0CkLdq/mOuAXOM7SHwbKD72ZOA==
X-Received: by 2002:a05:600c:3b88:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-441b1f60890mr3087145e9.29.1745953858483;
        Tue, 29 Apr 2025 12:10:58 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cc180bsm14985601f8f.53.2025.04.29.12.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 12:10:58 -0700 (PDT)
Message-ID: <70bc994b1e79c8d0d4c0010611c2e65042cff74f.camel@gmail.com>
Subject: Re: [PATCH v5 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
	soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Jisheng Zhang
 <jszhang@kernel.org>,  Haylen Chu <heylenay@outlook.com>, Chao Wei
 <chao.wei@sophgo.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 29 Apr 2025 21:10:57 +0200
In-Reply-To: <6wlgfvc3rkhv4s3ou67fjl6j4a26vocqck5727cg6muxlz2erj@kivndcjcqc7m>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
	 <20250316185640.3750873-2-alexander.sverdlin@gmail.com>
	 <6wlgfvc3rkhv4s3ou67fjl6j4a26vocqck5727cg6muxlz2erj@kivndcjcqc7m>
User-Agent: Evolution 3.56.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_121101_200026_FDB6BC8E 
X-CRM114-Status: GOOD (  19.50  )
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

SGkgSW5vY2hpLAoKT24gVHVlLCAyMDI1LTA0LTI5IGF0IDA2OjM1ICswODAwLCBJbm9jaGkgQW1h
b3RvIHdyb3RlOgo+ID4gTWFrZSB0aGUgcGVyaXBoZXJhbCBkZXZpY2UgdHJlZSByZS11c2FibGUg
b24gQVJNNjQgcGxhdGZvcm0gYnkgbW92aW5nIENQVQo+ID4gY29yZSBhbmQgaW50ZXJydXB0IGNv
bnRyb2xsZXJzJyBwYXJ0cyBpbnRvIG5ldyBjdjE4eHgtY3B1LmR0c2kgYW5kCj4gPiBjdjE4eHgt
aW50Yy5kdHNpLgo+ID4gCj4gPiBBZGQgU09DX1BFUklQSEVSQUxfSVJRKCkgbWFjcm8gd2hpY2gg
ZXhwbGljaXRseSBtYXBzIHBlcmlwaGVyYWwgbnViZXJpbmcKPiA+IGludG8gInBsaWMiIGludGVy
cnVwdC1jb250cm9sbGVyIG51bWJlcmluZy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFu
ZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgo+ID4gLS0tCj4gPiBD
aGFuZ2Vsb2c6Cj4gPiB2NToKPiA+IHY0Ogo+ID4gLSBjbGVhbnVwcyBkcm9wcGVkCj4gPiAtIGN2
MTh4eC1jcHUtaW50Yy5kdHNpIGluc3RlYWQgb2YgY3YxOHh4LWNwdS5kdHNpK2N2MTh4eC1pbnRj
LmR0c2kKPiA+IHYzOgo+ID4gLSAmY3B1cyBub2RlIGhhcyBiZWVuIG1vdmVkIGludG8gY3YxOHh4
LWNwdS5kdHNpLCAmcGxpYyBhbmQgJmNsaW50IG5vZGVzCj4gPiB3ZXJlIG1vdmVkIGludG8gY3Yx
OHh4LWludGMuZHRzaSB0byByZWR1Y2UgY29kZSBkdXBsaWNhdGlvbjsKPiA+IHYyOgo+ID4gLSBp
bnN0ZWFkIG9mIGNhcnZpbmcgb3V0IHBlcmlwaGVyYWxzJyBwYXJ0LCBjYXJ2ZSBvdXQgQVJDSC1z
cGVjaWZpY3MgKENQVQo+ID4gY29yZSwgaW50ZXJydXB0IGNvbnRyb2xsZXJzKSBhbmQgc3ByZWFk
IHRoZW0gYW1vbmcgMyBTb0MgLmR0c2kgZmlsZXMgd2hpY2gKPiA+IGluY2x1ZGVkIGN2MTh4eC5k
dHNpOwo+ID4gLSBkZWZpbmUgYSBsYWJlbCBmb3IgdGhlICJzb2MiIG5vZGUgYW5kIHVzZSBpdCBp
biB0aGUgbmV3bHkgaW50cm9kdWNlZCBEVHM7Cj4gPiAKPiA+IMKgIGFyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL2N2MTgwMGIuZHRzacKgwqDCoMKgwqDCoCB8wqAgNSArCj4gPiDCoCBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MTJoLmR0c2nCoMKgwqDCoMKgwqAgfMKgIDUgKwo+ID4g
wqAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODF4LmR0c2nCoMKgwqDCoMKgwqDCoCB8
wqAgMiArLQo+ID4gwqAgLi4uL2Jvb3QvZHRzL3NvcGhnby9jdjE4eHgtY3B1LWludGMuZHRzacKg
wqDCoMKgwqAgfCA1NCArKysrKysrKysrKwo+ID4gwqAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3Bo
Z28vY3YxOHh4LmR0c2nCoMKgwqDCoMKgwqDCoCB8IDkxICsrKysrLS0tLS0tLS0tLS0tLS0KPiA+
IMKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjAwMi5kdHNpwqDCoMKgwqDCoMKgwqAg
fMKgIDUgKwo+ID4gwqAgNiBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspLCA2OSBkZWxl
dGlvbnMoLSkKPiA+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9jdjE4eHgtY3B1LWludGMuZHRzaQo+ID4gCj4gCj4gSXQgaXMgYSBoYXJkIHRpbWUgZm9y
IG5vdyB0byBkbyBzb21lIGNoYW5nZSBhY3Jvc3MgdGhlIGN2MTh4eCAKPiBzZXJpZXMsIGFuZCBp
dCBoYXMgYmVjb21lIGEgbWVzcy4gRHVlIHRvIHRoZSBmYWN0LCBJIHRoaW5rIGl0Cj4gaXMgdGlt
ZSB0byBkbyBzb21lIHdvcmsgbGlrZSBzcGxpdCBzb21lIGRldmljZSAoY2xrLCBwaW5jdHJsLAo+
IHBsaWMsIGludGMpIGZyb20gY3YxOHh4LmR0c2kgdG8gYXZvaWQgb3ZlcnJpZGUsIGFuZCBtYWtl
IHJvb20KPiBmb3IgYXJtNjQgZGV2aWNlLgo+IAo+IFNpbmNlIHRoaXMgY2hhbmdlIGNvbnRhaW5z
IHNvbWUgY2hhbmdlIHNpbWlsYXIgdG8gdGhpcyBwYXRjaC4gCj4gV291bGQgeW91IG1pbmQgbWUg
dG8gdGFrZSBjb250ZW50IG9mIHRoaXMgcGF0Y2gsIGFuZCBhZGQgeW91Cj4gYXMgdGhlIGEgY28t
YXV0aG9yPwoKdGhhbmtzIGZvciBsb29raW5nIGludG8gdGhpcyEKRWl0aGVyIHdheSBpcyBnb29k
IGZvciBtZSEKCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
