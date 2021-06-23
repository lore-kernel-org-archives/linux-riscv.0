Return-Path: <SRS0=kiTD=LR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9ACEC2B9F4
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 00:09:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A6B260D07
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 00:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A6B260D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKG6AUHhRR6B03LOAJHChAr06jnFh3aCkzg90GD+xvk=; b=Jav5VGNbJgYGd6
	8zcvqvlDjCM/8OfZloDO5px9J6yhiMRr2phTFj5MHisl9dkUcMtYAkwAXIGvo70KjUmtaXFunOmpz
	BQAm+YntjZvxQ02LFiYAlPoKh23tIhbesYuxD2lKycTyp10T+Fn9FXSwXACuIisEqvIiSc1EhpGde
	ndvzzeTWYH54OhjK/QhKtr0oTOBdx7D+U9BMU4tdngMiAQCE57rIMUX4gJNRqpy+jNwU0E7zvEqpL
	Sq7c/o5sr/oELHn6HYsMGeOW0stF/J152LlhdBgayRuOQrZmwEgf/k54oFdosczZ+7/5sjSq3qtSR
	GsswaND03UqRKBPdFQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvqS7-008nNg-Cx; Wed, 23 Jun 2021 00:09:11 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvqS4-008nMx-T4
 for linux-riscv@lists.infradead.org; Wed, 23 Jun 2021 00:09:10 +0000
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by linux.microsoft.com (Postfix) with ESMTPSA id C1B2220B83DE
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 17:09:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C1B2220B83DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1624406946;
 bh=u2Kpz6rC+qyNeuxX3/et2fXCG3LMTAAce/YCvewjL6E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F4AOWiKu4E4h8PeZ+1b5zD/OPMJjF/iErqq054eAH9I+TQGvhmgXZUSDaiVHWwNzp
 S2hkjc5K50UVLhNClLCdYeM1Bt4539F+/WDkIIQvSO3k0drL6oSZmsJrHuvpJKC2Hu
 88/YaHSeaNArfCVE5ZApQK2rM6mUG/cPgaci2rT0=
Received: by mail-pj1-f42.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so210245pjo.3
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 17:09:06 -0700 (PDT)
X-Gm-Message-State: AOAM5339NbGbwIRsSDYqUKDypHCGpk/SqqgbhxoyDX75eMWFc9O98QeY
 74z2/ruP0NPL0ez5aMv2NNBFdf8hJQABOTqcLcc=
X-Google-Smtp-Source: ABdhPJxADUAYw2fWMz82whP6EvMifZHPYm6r/owIfLNMTB5E0CccJG2Rjp2DhW6xHkiWbi/cyVI7XdSkrm/6g3tmaSo=
X-Received: by 2002:a17:903:304e:b029:11d:75ff:c304 with SMTP id
 u14-20020a170903304eb029011d75ffc304mr24509944pla.33.1624406946257; Tue, 22
 Jun 2021 17:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-4-mcroce@linux.microsoft.com>
 <17cd289430f08f2b75b7f04242c646f6@mailhost.ics.forth.gr>
In-Reply-To: <17cd289430f08f2b75b7f04242c646f6@mailhost.ics.forth.gr>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Wed, 23 Jun 2021 02:08:30 +0200
X-Gmail-Original-Message-ID: <CAFnufp2w1TGtaBjfTtsBpDatgAtATRZbB4MURV3tLh1fi-W1JQ@mail.gmail.com>
Message-ID: <CAFnufp2w1TGtaBjfTtsBpDatgAtATRZbB4MURV3tLh1fi-W1JQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: optimized memset
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>, 
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_170909_029013_3C353D05 
X-CRM114-Status: GOOD (  23.59  )
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

T24gVHVlLCBKdW4gMjIsIDIwMjEgYXQgMzowNyBBTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNz
LmZvcnRoLmdyPiB3cm90ZToKPgo+IM6jz4TOuc+CIDIwMjEtMDYtMTcgMTg6MjcsIE1hdHRlbyBD
cm9jZSDOrc6zz4HOsc+IzrU6Cj4gPiArCj4gPiArdm9pZCAqX19tZW1zZXQodm9pZCAqcywgaW50
IGMsIHNpemVfdCBjb3VudCkKPiA+ICt7Cj4gPiArICAgICB1bmlvbiB0eXBlcyBkZXN0ID0geyAu
dTggPSBzIH07Cj4gPiArCj4gPiArICAgICBpZiAoY291bnQgPj0gTUlOX1RIUkVTSE9MRCkgewo+
ID4gKyAgICAgICAgICAgICBjb25zdCBpbnQgYnl0ZXNfbG9uZyA9IEJJVFNfUEVSX0xPTkcgLyA4
Owo+Cj4gWW91IGNvdWxkIG1ha2UgJ2NvbnN0IGludCBieXRlc19sb25nID0gQklUU19QRVJfTE9O
RyAvIDg7JyBhbmQgJ2NvbnN0Cj4gaW50IG1hc2sgPSBieXRlc19sb25nIC0gMTsnIGZyb20geW91
ciBtZW1jcHkgcGF0Y2ggdmlzaWJsZSB0byBtZW1zZXQgYXMKPiB3ZWxsIChzdGF0aWMgY29uc3Qu
Li4pIGFuZCB1c2UgdGhlbSBoZXJlIChtYXNrIHdvdWxkIG1ha2UgbW9yZSBzZW5zZSB0bwo+IGJl
IG5hbWVkIGFzIHdvcmRfbWFzaykuCj4KCkknbGwgZG8KCj4gPiArICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgY3UgPSAodW5zaWduZWQgbG9uZyljOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAv
KiBDb21wb3NlIGFuIHVsb25nIHdpdGggJ2MnIHJlcGVhdGVkIDQvOCB0aW1lcyAqLwo+ID4gKyAg
ICAgICAgICAgICBjdSB8PSBjdSA8PCA4Owo+ID4gKyAgICAgICAgICAgICBjdSB8PSBjdSA8PCAx
NjsKPiA+ICsjaWYgQklUU19QRVJfTE9ORyA9PSA2NAo+ID4gKyAgICAgICAgICAgICBjdSB8PSBj
dSA8PCAzMjsKPiA+ICsjZW5kaWYKPiA+ICsKPgo+IFlvdSBkb24ndCBoYXZlIHRvIGNyZWF0ZSBj
dSBoZXJlLCB5b3UnbGwgZmlsbCBkZXN0IGJ1ZmZlciB3aXRoICdjJwo+IGFueXdheSBzbyBhZnRl
ciBmaWxsaW5nIHVwIGVub3VnaCAnYydzIHRvIGJlIGFibGUgdG8gZ3JhYiBhbiBhbGlnbmVkCj4g
d29yZCBmdWxsIG9mIHRoZW0gZnJvbSBkZXN0LCB5b3UgY2FuIGp1c3QgZ3JhYiB0aGF0IHdvcmQg
YW5kIGtlZXAKPiBmaWxsaW5nIHVwIGRlc3Qgd2l0aCBpdC4KPgoKSSB0cmllZCB0aGF0LCBidXQg
dGhpcyB3YXkgSSBoYXZlIHRvIHdhaXQgOCBieXRlcyBtb3JlIGJlZm9yZSBzdGFydGluZwp0aGUg
bWVtc2V0LgpBbmQsIHRoZSBtYWNoaW5lIGNvZGUgbmVlZGVkIHRvIGdlbmVyYXRlICdjdScgaXMg
anVzdCA2IGluc3RydWN0aW9ucyBvbiByaXNjdjoKCnNsbGkgYTUsYTAsOApvciBhNSxhNSxhMApz
bGxpIGEwLGE1LDE2Cm9yIGEwLGEwLGE1CnNsbGkgYTUsYTAsMzIKb3IgYTAsYTUsYTAKCnNvIHBy
b2JhYmx5IGl0J3Mgbm90IHdvcnRoIGl0LgoKPiA+ICsjaWZuZGVmIENPTkZJR19IQVZFX0VGRklD
SUVOVF9VTkFMSUdORURfQUNDRVNTCj4gPiArICAgICAgICAgICAgIC8qIEZpbGwgdGhlIGJ1ZmZl
ciBvbmUgYnl0ZSBhdCB0aW1lIHVudGlsIHRoZSBkZXN0aW5hdGlvbgo+ID4gKyAgICAgICAgICAg
ICAgKiBpcyBhbGlnbmVkIG9uIGEgMzIvNjQgYml0IGJvdW5kYXJ5Lgo+ID4gKyAgICAgICAgICAg
ICAgKi8KPiA+ICsgICAgICAgICAgICAgZm9yICg7IGNvdW50ICYmIGRlc3QudXB0ciAlIGJ5dGVz
X2xvbmc7IGNvdW50LS0pCj4KPiBZb3UgY291bGQgcmV1c2UgJiBtYXNrIGhlcmUgaW5zdGVhZCBv
ZiAlIGJ5dGVzX2xvbmcuCj4KClN1cmUsIGV2ZW4gaWYgdGhlIG1hY2hpbmUgY29kZSB3aWxsIGJl
IHRoZSBzYW1lLgoKPiA+ICsgICAgICAgICAgICAgICAgICAgICAqZGVzdC51OCsrID0gYzsKPiA+
ICsjZW5kaWYKPgo+IEkgbm90aWNlZCB5b3UgYWxzbyB1c2VkIENPTkZJR19IQVZFX0VGRklDSUVO
VF9VTkFMSUdORURfQUNDRVNTIG9uIHlvdXIKPiBtZW1jcHkgcGF0Y2gsIGlzIGl0IHdvcnRoIGl0
IGhlcmUgPyBUbyBiZWdpbiB3aXRoIHJpc2N2IGRvZXNuJ3Qgc2V0IGl0Cj4gYW5kIGV2ZW4gaWYg
aXQgZGlkIHdlIGFyZSB0YWxraW5nIGFib3V0IGEgbG9vcCB0aGF0IHdpbGwgcnVuIGp1c3QgYSBm
ZXcKPiB0aW1lcyB0byByZWFjaCB0aGUgYWxpZ25tZW50IGJvdW5kYXJ5ICh3b3JzdCBjYXNlIHNj
ZW5hcmlvIGl0J2xsIHJ1biA3Cj4gdGltZXMpLCBJIGRvbid0IHRoaW5rIHdlIGdhaW4gbXVjaCBo
ZXJlLCBldmVuIGZvciBhcmNocyB0aGF0IGhhdmUKPiBlZmZpY2llbnQgdW5hbGlnbmVkIGFjY2Vz
cy4KCkl0IGRvZXNuJ3QgX25vd18sIGJ1dCBtYXliZSBpbiB0aGUgZnV0dXJlIHdlIHdpbGwgaGF2
ZSBhIENQVSB3aGljaApoYW5kbGVzIHVuYWxpZ25lZCBhY2Nlc3NlcyBjb3JyZWN0bHkhCgotLSAK
cGVyIGFzcGVyYSBhZCB1cHN0cmVhbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
