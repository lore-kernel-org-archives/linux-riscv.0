Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5B0C001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSeyzHW0XnFhiPKJNq6DJJ4ydjtn0RTXF2Nse1RGODw=; b=0dPD/BYPTcVZ9j
	gBZqkeC4Hk5NY7fJ1lsd3dBzwzfCXpE1zeDnoBQDLkL8/XPcHEO5FAbyug7FrgxU0jMCQhpeFnYjh
	s+0SusRq8BIGslYnESXiAL+Oe696iLLDClpAB0Vy1pBhSV+LhjEdMhLYaQnKAJ89bbmBvMkH153/d
	dG0YSI0wh1IuVvcHzyrXa3Ifm9SNxZ7VQroddZnwkHR7D0eJuXKT06pyfS4ZXlor/KJ2U1MEDigdf
	+OyWPHyx3Eh1heuMK2CtcvWgU4NcqPFv3EGu3yQKOIlbJvx31zKfNsLFfQTZYeSZXSFHk9GzMdgqV
	8cmNLWWWnuWDdv60Dpgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSkr-00FmVz-0J;
	Mon, 31 Jul 2023 13:16:09 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSkn-00FmUn-39
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 13:16:07 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-790970a8706so104897539f.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 06:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690809364; x=1691414164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRH6VQXemkXA+D7i+tzL2o9BcfhJ0anPcs6glUFKwE0=;
        b=Q1xK9cDrMwE0LmpgNCnRLvUiu1+Gy1wu4LA08EI6Ns27tGn2M4sR6WXFyPI4x03hCE
         R4ybue8dY+aQhR1eS8UN2p6CrvsFox2KJPbg8QEWZoAG4GsbHzcN8Rx7YiGQO1E/vDhT
         mhxaaMx6i4+u8v7bfVkcMLtgs9LLxKlunXXUjZgCUjAA0fUl338Hnvtd26JhQXGaOc9R
         +vf06UfCEhc5dv1jS+m3exRjGVN2pKVpVD6fIc8kmeJM9+b7oqlMRric8lKvpHobPGdw
         WIoJKxfkICtfilBWaf4sq9XGHKI3Qbnw1L3nM31WTMBUFVyePC6T0waakxIg4AcYn/a2
         0HGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690809364; x=1691414164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRH6VQXemkXA+D7i+tzL2o9BcfhJ0anPcs6glUFKwE0=;
        b=Z6ty25dwD6rj3g5jzhj2QM0nwQI1VL0bFNw5zp1jn0/LPYhJRLSvvHdFtdiLRr2ZPd
         G0HQOL36ko1viWp1rTrs+WuiXBozKvVROptdLrtkNBiLXDqSYqcWNwX0VjVU+6bp5IYI
         8jedIdA3fY53lBhOursSUf8Jm0FlUhLhK0ov0nIXtQQBqJn1PB4LM2lyFepaZEEdVPrg
         ZqHtbfrhGdsdxKMTjDxUvJRQHh60eVb/q0sHnYvQLaH1BsOSytUTKxxXhovwccYM3xCN
         xHc478snvpKLHv+X95E01mn+H+WpYDb+PgdBoU9mH6LoHNqvwUO61DeNBx5DNq+SAYuQ
         Yxuw==
X-Gm-Message-State: ABy/qLaoELv99txu2BezJ6eH/68TR0FxVmYZZtPHIBEb8dLZpVCcwaXZ
	q2pvsb/fcSbu/rqgcuXSFByHsf0h8RkRpz22sP/p/A==
X-Google-Smtp-Source: APBJJlH8nBsPuRb798NsaX1lz2UV52ixs9AF2BaoevPGu19FNnbZMl13NG+Y1dqJ03EeXfC0yYnuihdvfglI0jI3ilY=
X-Received: by 2002:a5d:9b1a:0:b0:787:6bd:e590 with SMTP id
 y26-20020a5d9b1a000000b0078706bde590mr9238130ion.3.1690809364466; Mon, 31 Jul
 2023 06:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0pm+1yXuvUGudwNtvNHWV3FytH4VfCnq7_Ws=t-MZP_kQ@mail.gmail.com> <3d4d9b22-8451-f4d5-bbd8-117988f3a545@ics.forth.gr>
In-Reply-To: <3d4d9b22-8451-f4d5-bbd8-117988f3a545@ics.forth.gr>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 31 Jul 2023 21:15:53 +0800
Message-ID: <CANXhq0puxuHA2cEyb2+TobkoFTc=7MQqtv7DYbuZdvf0T8+iUQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] RISC-V: drivers/iommu/riscv: Add command, fault,
 page-req queues
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, 
	Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_061606_068315_27259C9B 
X-CRM114-Status: GOOD (  16.94  )
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

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgNTozMuKAr1BNIE5pY2sgS29zc2lmaWRpcyA8bWlja0Bp
Y3MuZm9ydGguZ3I+IHdyb3RlOgo+Cj4gT24gNy8yOS8yMyAxNTo1OCwgWm9uZyBMaSB3cm90ZToK
PiA+IE9uIFRodSwgSnVsIDIwLCAyMDIzIGF0IDM6MzTigK9BTSBUb21hc3ogSmV6bmFjaCA8dGpl
em5hY2hAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+PiArICAgICAgIGlvbW11LT5jYXAgPSByaXNj
dl9pb21tdV9yZWFkcShpb21tdSwgUklTQ1ZfSU9NTVVfUkVHX0NBUCk7Cj4gPj4gKwo+ID4+ICsg
ICAgICAgLyogRm9yIG5vdyB3ZSBvbmx5IHN1cHBvcnQgV1NJcyB1bnRpbCB3ZSBoYXZlIEFJQSBz
dXBwb3J0ICovCj4gPgo+ID4gSSdtIG5vdCBjb21wbGV0ZWx5IHVuZGVyc3RhbmQgQUlBIHN1cHBv
cnQgaGVyZSwgYmVjYXVzZSBJIHNhdyB0aGUgcGNpCj4gPiBjYXNlIHVzZXMgdGhlIE1TSSwgYW5k
IGtlcm5lbCBzZWVtcyB0byBoYXZlIHRoZSBBSUEgaW1wbGVtZW50YXRpb24uCj4gPiBDb3VsZCB5
b3UgcGxlYXNlIGVsYWJvcmF0ZSBpdD8KPiA+Cj4KPiBXaGVuIEkgd3JvdGUgdGhpcyB3ZSBkaWRu
J3QgaGF2ZSBBSUEgaW4gdGhlIGtlcm5lbCwgYW5kIHdpdGhvdXQgSU1TSUMgd2UKPiBjYW4ndCBo
YXZlIE1TSXMgaW4gdGhlIGhhcnQgKHdlIGNhbiBzdGlsbCBoYXZlIE1TSXMgaW4gdGhlIFBDSWUg
Y29udHJvbGxlcikuCgpUaGFua3MgZm9yIHlvdXIgY2xhcmlmaWNhdGlvbiwgZG8gd2Ugc3VwcG9y
dCB0aGUgTVNJIGluIG5leHQgdmVyc2lvbj8KCj4KPiA+Cj4gPiBTaG91bGQgd2UgZGVmaW5lIHRo
ZSAiaW50ZXJydXB0LW5hbWVzIiBpbiBkdC1iaW5kaW5ncz8KPiA+Cj4KPiBZZXMgd2Ugc2hvdWxk
LCBhbG9uZyB3aXRoIHF1ZXVlIGxlbmd0aHMgYmVsb3cuCj4KPiA+PiArCj4gPj4gKyAgICAgICAv
KiBNYWtlIHN1cmUgZmN0bC5XU0kgaXMgc2V0ICovCj4gPj4gKyAgICAgICBmY3RsID0gcmlzY3Zf
aW9tbXVfcmVhZGwoaW9tbXUsIFJJU0NWX0lPTU1VX1JFR19GQ1RMKTsKPiA+PiArICAgICAgIGZj
dGwgfD0gUklTQ1ZfSU9NTVVfRkNUTF9XU0k7Cj4gPj4gKyAgICAgICByaXNjdl9pb21tdV93cml0
ZWwoaW9tbXUsIFJJU0NWX0lPTU1VX1JFR19GQ1RMLCBmY3RsKTsKPiA+PiArCj4gPj4gKyAgICAg
ICAvKiBQYXJzZSBRdWV1ZSBsZW5ndHMgKi8KPiA+PiArICAgICAgIHJldCA9IG9mX3Byb3BlcnR5
X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLCAiY21kcV9sZW4iLCAmaW9tbXUtPmNtZHFfbGVu
KTsKPiA+PiArICAgICAgIGlmICghcmV0KQo+ID4+ICsgICAgICAgICAgICAgICBkZXZfaW5mbyhk
ZXYsICJjb21tYW5kIHF1ZXVlIGxlbmd0aCBzZXQgdG8gJWlcbiIsIGlvbW11LT5jbWRxX2xlbik7
Cj4gPj4gKwo+ID4+ICsgICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIocGRldi0+ZGV2
Lm9mX25vZGUsICJmbHRxX2xlbiIsICZpb21tdS0+Zmx0cV9sZW4pOwo+ID4+ICsgICAgICAgaWYg
KCFyZXQpCj4gPj4gKyAgICAgICAgICAgICAgIGRldl9pbmZvKGRldiwgImZhdWx0L2V2ZW50IHF1
ZXVlIGxlbmd0aCBzZXQgdG8gJWlcbiIsIGlvbW11LT5mbHRxX2xlbik7Cj4gPj4gKwo+ID4+ICsg
ICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIocGRldi0+ZGV2Lm9mX25vZGUsICJwcmlx
X2xlbiIsICZpb21tdS0+cHJpcV9sZW4pOwo+ID4+ICsgICAgICAgaWYgKCFyZXQpCj4gPj4gKyAg
ICAgICAgICAgICAgIGRldl9pbmZvKGRldiwgInBhZ2UgcmVxdWVzdCBxdWV1ZSBsZW5ndGggc2V0
IHRvICVpXG4iLCBpb21tdS0+cHJpcV9sZW4pOwo+ID4+ICsKPiA+PiAgICAgICAgICBkbWFfc2V0
X21hc2tfYW5kX2NvaGVyZW50KCZwZGV2LT5kZXYsIERNQV9CSVRfTUFTSyg2NCkpOwo+ID4+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
