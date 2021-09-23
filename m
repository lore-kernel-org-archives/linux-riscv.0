Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170F1C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 10:08:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A22A60F24
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 10:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A22A60F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vrull.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W14qpGKv0Qe52hUEGnd3w62TUNixFtM1y37haIYMLfk=; b=j99k3yuCkQ7/+8
	MGAbP5QFl2FaNakuZbSdlHEHCo2Cpf6vImj1TKo2RunntrdxiSUk1ecCQ6aAungBtPYfAYcvHt91E
	7z5Cw3LWFn3Knj//9A+xYK1bEInq7Zzpod2xfb/HRASL9dNGxpojxaNP1P1SWZlShyL4HfRxhfetN
	cjoUtL+wqVes9HFLf0TlXVljUJd04cq1tR309D3rzkeWE8JkxAq2tH0gXz9hNhYJsuylU37/sNrtN
	3r3Go43cBvBobl0xDmkuwLxCUouh+Pc44znOLENoOc8yiKZY2Uhkn0TF/CxxyPUWXGaJy0XccbzUX
	pqJMPYSYABDN3lBNaUgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTLeE-00AsEv-Ki; Thu, 23 Sep 2021 10:08:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTLeB-00AsE9-Vx
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 10:08:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id d6so15466883wrc.11
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 03:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i7IsEz0+TmFkryE0xyDQDEXuyo40G1KZMcgl/iAYgo4=;
 b=q2W+u1f2RRvpTmOehNT9mdT9VyMO5bHBoZ7RGb1K94+Qtr1Ba+ju3E5g3rJq6SXDaa
 myQ3hGatvAFK1KPtzux15zrB34XK2sBlweuBw/L2F9EpW6dm71BrCx/IkKbIXOYOkCT4
 PHWbSlBxe1QerHRWGudBQ1FteEWKb5HLgmvRydXFxKC7FOA2DYS7OtMBJ1lASGeisr81
 KGmfYS7SDcpygf0GzIFuIfbiKUYoCCkrpdNkZWiauSP+6ajDm2/5azk2axruxStN0FLU
 l5r0tw/TJ/sssCpV3CpAfn1bfdyFwKapBVSkIVNXkmRSh6MHsACHni44GO3gHnp4ljq4
 j0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i7IsEz0+TmFkryE0xyDQDEXuyo40G1KZMcgl/iAYgo4=;
 b=CQwlaJBxvxYn+rHGDuuFpZPIWxH54n2RlqyHLAtqBRL1jSF6/A9ZR6OIGXMT7kOelq
 UHrgoa8ChfUxJ6kQmFUSv0Pdo6eYnqngUk7R2yT/2Mv3GNA6JUTpbbQAcU0ZbOwkTLG2
 fegx2N0VB31RAxS6qZzDpUfQdavZYmO4WboxuchY6iDRmUCAWxl5Iel6gaeAza27OukK
 KgNEa007ySQ90w/TPWtCj8R1Orw+ZM1Mi/U+82yod/6jDka57hXWDK3DHsq5FHxVthdQ
 jurn1a2Coz326Z8O6BGEytXhZi3z1m3IndVyHza0MNnxOrP+eGgWzWQqKyoWNm23uzyM
 uEyg==
X-Gm-Message-State: AOAM5331s3yauCHmctkQdnEIuTD2tv65F9dkq+opdrWLM+nfWdic7YAu
 032FjV305q0Y/baf3pHBMlT4pz6oZgUQRmVemFlmEQ==
X-Google-Smtp-Source: ABdhPJwGNrmZBdCaAuiMHYcDdjm8dp+KCSXZu2axXhUghWj03xWT691jPsqVIga9dNDPzUfTnoHhAPw+J3qSWXCfqa4=
X-Received: by 2002:adf:eec3:: with SMTP id a3mr4191548wrp.276.1632391686063; 
 Thu, 23 Sep 2021 03:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210923072716.913826-1-guoren@kernel.org>
 <6d7b1668c1f562a5ef426bb2519f9784@mailhost.ics.forth.gr>
 <CAAhSdy0YDP3Nk8N9fnrKgS+3Rjt=5tLCh20upmUGK9SK67nNvg@mail.gmail.com>
 <0861cc74d3886e685e9aa5d13ddcd781@mailhost.ics.forth.gr>
 <16de95480d279b086cf0c612461e4235@mailhost.ics.forth.gr>
In-Reply-To: <16de95480d279b086cf0c612461e4235@mailhost.ics.forth.gr>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 23 Sep 2021 12:07:55 +0200
Message-ID: <CAAeLtUChjjzG+P8yg45GLZMJy5UR2K5RRBoLFVZhtOaZ5pPtEA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add RISC-V svpbmt extension
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com, 
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>, 
 Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>, 
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>, 
 Bill Huffman <huffman@cadence.com>, Allen Baum <allen.baum@esperantotech.com>, 
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_030808_057512_0C473899 
X-CRM114-Status: GOOD (  20.46  )
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

T24gVGh1LCAyMyBTZXB0IDIwMjEgYXQgMTE6NDgsIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3Mu
Zm9ydGguZ3I+IHdyb3RlOgo+Cj4gzqPPhM65z4IgMjAyMS0wOS0yMyAxMjo0MiwgTmljayBLb3Nz
aWZpZGlzIM6tzrPPgc6xz4jOtToKPiA+IM6jz4TOuc+CIDIwMjEtMDktMjMgMTI6MzcsIEFudXAg
UGF0ZWwgzq3Os8+BzrHPiM61Ogo+ID4+IE9uIFRodSwgU2VwIDIzLCAyMDIxIGF0IDI6NTUgUE0g
TmljayBLb3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4KPiA+PiB3cm90ZToKPiA+Pj4KPiA+
Pj4gSGVsbG8gR3VvLAo+ID4+Pgo+ID4+PiDOo8+EzrnPgiAyMDIxLTA5LTIzIDEwOjI3LCBndW9y
ZW5Aa2VybmVsLm9yZyDOrc6zz4HOsc+IzrU6Cj4gPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPj4+IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4+PiBpbmRleCBlNTM0
ZjZhN2NmYTEuLjE4MjVjZDhkYjBkZSAxMDA2NDQKPiA+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPj4+IEBAIC01Niw3ICs1
Niw5IEBAIHByb3BlcnRpZXM6Cj4gPj4+ICAgICAgIGVudW06Cj4gPj4+ICAgICAgICAgLSByaXNj
dixzdjMyCj4gPj4+ICAgICAgICAgLSByaXNjdixzdjM5Cj4gPj4+ICsgICAgICAtIHJpc2N2LHN2
Mzksc3ZwYm10Cj4gPj4+ICAgICAgICAgLSByaXNjdixzdjQ4Cj4gPj4+ICsgICAgICAtIHJpc2N2
LHN2NDgsc3ZwYm10Cj4gPj4+ICAgICAgICAgLSByaXNjdixub25lCj4gPj4+Cj4gPj4+IElzbid0
IHN2cGJtdCBvcnRob2dvbmFsIHRvIHRoZSBtbXUgdHlwZSA/IEl0J3MgYSBmdW5jdGlvbmFsaXR5
IHRoYXQKPiA+Pj4gY2FuCj4gPj4+IGJlIHByZXNlbnQgb24gZWl0aGVyIHN2MzkvNDgvNTcgc28g
d2h5IG5vdCBoYXZlIGFub3RoZXIgInN2cGJtdCIKPiA+Pj4gcHJvcGVydHkgZGlyZWN0bHkgb24g
dGhlIGNwdSBub2RlID8KPiA+Pgo+ID4+IEFjdHVhbGx5LCAibW11LXR5cGUiIHdvdWxkIGJlIGEg
Z29vZCBwbGFjZSBiZWNhdXNlIGl0J3MgcGFnZSBiYXNlZAo+ID4+IG1lbW9yeSBhdHRyaWJ1dGUg
YW5kIHBhZ2luZyBjYW4ndCBleGlzdCB3aXRob3V0IG1tdSB0cmFuc2xhdGlvbiBtb2RlLgo+ID4+
Cj4gPj4gQWxzbywgInN2cG1idCIgaXMgaW5kZWVkIGEgQ1BVIHByb3BlcnR5IHNvIGhhcyB0byBi
ZSBmZWF0dXJlCj4gPj4gaW5kaXZpZHVhbAo+ID4+IENQVSBub2RlLiBIeXBvdGhldGljYWxseSwg
YSBoZXRlcm9nZW5lb3VzIHN5c3RlbSBpcyBwb3NzaWJsZSB3aGVyZQo+ID4+IHNvbWUgQ1BVcyBo
YXZlICJzdnBtYnQiIGFuZCBzb21lIENQVXMgZG9uJ3QgaGF2ZSAic3ZwbWJ0Ii4gRm9yCj4gPj4g
ZXhhbXBsZSwgYSBmdXR1cmUgRlV4eHggU29DIG1pZ2h0IGhhdmUgYSBFLWNvcmUgYW5kIGZldyBT
LWNvcmVzCj4gPj4gd2hlcmUgUy1jb3JlcyBoYXZlIFN2cG1idCB3aGVyZWFzIEUtY29yZSBkb2Vz
IG5vdCBoYXZlIFN2cG1idAo+ID4+IGJlY2F1c2UgaXQncyBhbiBlbWJlZGRlZCBjb3JlLgo+ID4+
Cj4gPgo+ID4gSSBzaG91bGQgc2F5IGNwdVggbm9kZSwgbm90IHRoZSByb290IC9jcHUgbm9kZS4g
V2UgY2FuIGhhdmUgYW4gc3ZwYm10Cj4gPiBwcm9wZXJ0eSBpbiB0aGUgc2FtZSB3YXkgd2UgaGF2
ZSBhbiBtbXUtdHlwZSBwcm9wZXJ0eS4KPiA+Cj4KPiBJJ20gYWxzbyB0aGlua2luZyBvZiBmdXR1
cmUgbW11LXJlbGF0ZWQgZXh0ZW5zaW9ucywgZS5nLiB3aGF0IGFib3V0Cj4gc3ZuYXBvdCA/IFNo
b3VsZCB3ZSBoYXZlIG1tdS10eXBlIGJlIHJpc2N2LHN2Mzksc3ZuYXBvdCBhbmQgZS5nLgo+IHJp
c2N2LnN2Mzksc3ZwYm10LHN2bmFwb3QgPyBJdCdsbCBiZWNvbWUgbWVzc3kuCgpIb3cgaWYgd2Ug
ZXhwYW5kIHRoaXMgdG8gYSBtbXUgc3Vibm9kZSBpbiBjcHVAeCBhbmQgYWRkIGEgYm9vbGVhbnMg
Zm9yCmFkb3JubWVudHMgbGlrZSBzdm5hcG90IGFuZCBzdnBibXQ/CgpUaGUgb2xkZXIgbW11LXR5
cGUgY291bGQgdGhlbiB0cmVhdGVkIHRvIGluZGljYXRlIGEgbW11IHcvbyBhbnkgYWRvcm5tZW50
cwpzcGVjaWZpZWQuICBJIGFtIGF3YXJlIHRoYXQgdGhpcyBnZW5lcmF0ZXMgYW4gYWRkaXRpb25h
bCBwYXJzaW5nLXBhdGgKdGhhdCB3aWxsIGJlCm1haW50YWluZWQsIGJ1dCBpdCB3aWxsIGFsbG93
IGZ1dHVyZSBwcm9wZXJ0aWVzIHRvIGJlIGdyb3VwZWQuCgpUaGlzIGNvdWxkIGxpa2UgbGlrZSB0
aGUgZm9sbG93aW5nOgoKICBjcHVAMCB7CiAgICAuLi4KICAgIG1tdSB7CiAgICAgICB0eXBlID0g
InJpc2N2LHN2MzkiOwogICAgICAgc3VwcG9ydHMtc3ZwYm10OwogICAgfQogICAgLi4uCiAgfQoK
Q2hlZXJzLApQaGlsaXBwLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
