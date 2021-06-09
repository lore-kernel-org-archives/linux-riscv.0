Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47336C47095
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 03:29:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5EC160FEA
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 03:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5EC160FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHExHex7Dsf2h0uXiMoF+IABcqEq1Gd2sTzoisMqg48=; b=oNEIY/m25uxKcs
	1GorX2wkACUthplOyjNOlEWjcsmOHQ6qZ4lX++goQySAlVmTZt/HhtA8X3bM/8ZIgV5j5FfEW5Fc/
	nlsA5PKs7qLZK6XXszr7V4GDLRwrbE7LchyBDmGYyb0UFfKPo65KqnU6DSRCbtBZIc51vHTUNg6Eo
	vR+2HdrBdacHkOlUGhmyphXYQTe8RZEgGBdxBYX7Hr35sgVfDiukdGsMU6qcd+eYKC6vhbVfUgfaN
	LXFfiFYqvtv8OykAQpb8NaQJ5yBw7b+53XM2qdhLcA+PNRT1ypO9N207BEl8QaLgpa6Z0EbxPx0h7
	pLHKa1V9WQgmnjr1u6lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqotQ-00BYXT-9U; Wed, 09 Jun 2021 03:28:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqotN-00BYX5-T0
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 03:28:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 277F76136D
 for <linux-riscv@lists.infradead.org>; Wed,  9 Jun 2021 03:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623209313;
 bh=sVOvpgkj/HcQEC0DEM+Ytv8Acia96LYlFJs0iR7sVE0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Prreyzpb+3DlgrClJOr+3H3PX/coyUs5SEPJorPwPemvOan9aHP6vrbIqHWn3XYUH
 tooelE1e5K3whyhpOMytDg7IODDI4Dpwi92LT0ugkIfLQkSSmL1dwwEtUESd7WSv1V
 AuBFoRFO9NLSV+zam3AKBJC0Ses7L63TzeW/u0AZQqxTOb6lR5QJAvwvjB7BspZM1F
 V61tbf4lTiXl+veTtVpLMA+vYyhubEfhj+YK8JncnWYxCH0B5VXLyMOzQb9QQIxgVe
 M+6uCo1WvWGHSc7ZDJgFh4739nC9+6Co8EgnHe6H07ySNIzJHfPLNxcrQrYk+RTbeI
 XB5vuu+1cmxUg==
Received: by mail-lf1-f50.google.com with SMTP id p17so34823267lfc.6
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jun 2021 20:28:33 -0700 (PDT)
X-Gm-Message-State: AOAM531BjhrQyiZeHMfZEK9v0KGsJB2gmGIqACd49vRCnKp8cc+WmbIO
 qg7WvM5KV9WYJrPXh97bS8Tfi+YNpr03XLFjKhE=
X-Google-Smtp-Source: ABdhPJwDVqYkObA62qLG+4TPhlT9SBuEvINu2sgJQXwLM5FUZrBppwPRTfk/CWhxukVGHyzD6LNcvNuNg8kJtWeuhAg=
X-Received: by 2002:ac2:4c0e:: with SMTP id t14mr17968325lfq.555.1623209311215; 
 Tue, 08 Jun 2021 20:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
In-Reply-To: <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 9 Jun 2021 11:28:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ5271AP8aw42yvfOg0LjtnmPD8j_Uza6NH2nHxVz_QgQ@mail.gmail.com>
Message-ID: <CAJF2gTQ5271AP8aw42yvfOg0LjtnmPD8j_Uza6NH2nHxVz_QgQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Christoph Hellwig <hch@lst.de>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup.patel@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Benjamin Koch <snowball@c3pb.de>, 
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_202833_993668_CB03483D 
X-CRM114-Status: GOOD (  25.76  )
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

T24gTW9uLCBKdW4gNywgMjAyMSBhdCAyOjE0IEFNIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3Mu
Zm9ydGguZ3I+IHdyb3RlOgo+Cj4gzqPPhM65z4IgMjAyMS0wNS0yMCAwNDo0NSwgR3VvIFJlbiDO
rc6zz4HOsc+IzrU6Cj4gPiBPbiBXZWQsIE1heSAxOSwgMjAyMSBhdCAyOjUzIFBNIENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiA+Pgo+ID4+IE9uIFR1ZSwgTWF5IDE4LCAy
MDIxIGF0IDExOjQ0OjM1UE0gLTA3MDAsIERyZXcgRnVzdGluaSB3cm90ZToKPiA+PiA+IFRoaXMg
cGF0Y2ggc2VyaWVzIGxvb2tzIGxpa2UgaXQgbWlnaHQgYmUgdXNlZnVsIGZvciB0aGUgU3RhckZp
dmUgSkg3MTAwCj4gPj4gPiBbMV0gWzJdIHRvbyBhcyBpdCBoYXMgcGVyaXBoZXJhbHMgb24gYSBu
b24tY29oZXJlbnQgaW50ZXJjb25uZWN0LiBHTUFDLAo+ID4+ID4gVVNCIGFuZCBTRElPIHJlcXVp
cmUgdGhhdCB0aGUgTDIgY2FjaGUgbXVzdCBiZSBtYW51YWxseSBmbHVzaGVkIGFmdGVyCj4gPj4g
PiBETUEgb3BlcmF0aW9ucyBpZiB0aGUgZGF0YSBpcyBpbnRlbmRlZCB0byBiZSBzaGFyZWQgd2l0
aCBVNzQgY29yZXMgWzJdLgo+ID4+Cj4gPj4gTm90IHRvbyBtdWNoLCBnaXZlbiB0aGF0IHRoZSBT
aUZpdmUgbGluZWFnZSBDUFVzIGhhdmUgYW4gdW5jYWNoZWQKPiA+PiB3aW5kb3csIHRoYXQgaXMg
YSB0b3RhbGx5IGRpZmZlcmVudCB3YXkgdG8gYWxsb2NhdGUgdW5jYWNoZWQgbWVtb3J5Lgo+ID4g
SXQncyBhIHZlcnkgYmlnIE1JUFMgc21lbGwuIFdoYXQncyB0aGUgYXR0cmlidXRlIG9mIHRoZSB1
bmNhY2hlZAo+ID4gd2luZG93PyAodW5jYWNoZWQgKyBzdHJvbmctb3JkZXIvIHVuY2FjaGVkICsg
d2VhaywgbW9zdCB2ZW5kb3JzIHN0aWxsCj4gPiB1c2UgQVhJIGludGVyY29ubmVjdCwgaG93IHRv
IGRlYWwgd2l0aCBhIGJ1ZmZlcmFibGUgYXR0cmlidXRlPykgSW4KPiA+IGZhY3QsIGN1c3RvbWVy
cycgZHJpdmVycyB1c2UgZGlmZmVyZW50IHdheXMgdG8gZGVhbCB3aXRoIERNQSBtZW1vcnkgaW4K
PiA+IG5vbi1jb2hlcmVudCBTT0MuIE1vc3QgcmlzY3YgU09DIHZlbmRvcnMgYXJlIGZyb20gQVJN
LCBzbyBnaXZpbmcgdGhlbQo+ID4gdGhlIHNhbWUgd2F5IGluIERNQSBtZW1vcnkgaXMgYSBzbWFy
dCBjaG9pY2UuIFNvIHVzaW5nIFBURSBhdHRyaWJ1dGVzCj4gPiBpcyBtb3JlIHN1aXRhYmxlLgo+
ID4KPiA+IFNlZToKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi92aXJ0dWFsLW1lbW9yeS9i
bG9iL21haW4vc3BlY3MvNjExLXZpcnR1YWwtbWVtb3J5LWRpZmYucGRmCj4gPiA0LjQuMQo+ID4g
VGhlIGRyYWZ0IHN1cHBvcnRzIGN1c3RvbSBhdHRyaWJ1dGUgYml0cyBpbiBQVEUuCj4gPgo+Cj4g
Tm90IG9ubHkgaXQgZG9lc24ndCBzdXBwb3J0IGN1c3RvbSBhdHRyaWJ1dGVzIG9uIFBURXM6Cj4K
PiAiQml0czYz4oCTNTQgYXJlIHJlc2VydmVkIGZvciBmdXR1cmUgc3RhbmRhcmQgdXNlIGFuZCBt
dXN0IGJlIHplcm9lZCBieQo+IHNvZnR3YXJlIGZvciBmb3J3YXJkIGNvbXBhdGliaWxpdHkuIgo+
Cj4gSXQgYWxzbyBnb2VzIGZ1cnRoZXIgdG8gc2F5IHRoYXQ6Cj4KPiAiaWYgYW55IG9mIHRoZXNl
IGJpdHMgYXJlIHNldCwgYSBwYWdlLWZhdWx0IGV4Y2VwdGlvbiBpcyByYWlzZWQiCkFncmVlLCB3
aGVuIG91ciBwcm9jZXNzb3IncyBtbXUgd29ya3MgaW4gY29tcGF0aWJsZSBtbXUsIHdlIG11c3Qg
a2VlcAoiQml0czYz4oCTNTQgYml0IiB6ZXJvIGluIExpbnV4LgpTbywgSSB0aGluayB0aGlzIGlz
IHRoZSBmaXJzdCB2ZXJzaW9uIG9mIHRoZSBQVEUgZm9ybWF0LgoKSWYgdGhlICJQQk1UIiBleHRl
bnNpb24gcHJvcG9zYWwgaXMgYXBwcm92ZWQsIGl0IHdpbGwgY2F1c2UgdGhlIHNlY29uZAp2ZXJz
aW9uIG9mIHRoZSBQVEUgZm9ybWF0LgoKTWF5YmUgaW4gdGhlIGZ1dHVyZSwgd2UnbGwgZ2V0IG1v
cmUgdmVyc2lvbnMgb2YgdGhlIFBURSBmb3JtYXRzLgoKU28sIHNlZW1zIExpbnV4IG11c3Qgc3Vw
cG9ydCBtdWx0aSB2ZXJzaW9ucyBvZiBQVEUgZm9ybWF0cyB3aXRoIG9uZQpJbWFnZSwgcmlnaHQ/
CgpPa2F5LCB3ZSBjb3VsZCBzdG9wIGFyZ3Vpbmcgd2l0aCB0aGUgRDEgUFRFIGZvcm1hdC4gQW5k
IHRhbGsgYWJvdXQgaG93CnRvIGxldCBMaW51eCBzdXBwb3J0IG11bHRpIHZlcnNpb25zIG9mIFBU
RSBmb3JtYXRzIHRoYXQgY29tZSBmcm9tIHRoZQpmdXR1cmUgUklTQy1WIHByaXZpbGVnZSBzcGVj
LgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKTUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWNza3kvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
