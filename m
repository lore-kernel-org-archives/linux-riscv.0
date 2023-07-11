Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18529EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSFfOIXrrrWZ6D6uDQWWxX97TkNQMkDNxE7jjkZce+g=; b=f8xzQjdh/zL84x
	0u6B6bWVnnms1IOoGMHbsnK73zhECJVt4h8WqwgWlMSZoHQA9vhkcvU2X0VmiCdq/NBkxf2QN0MRs
	VYN/JtVZYyRbjf1vKmv5KFvqyd9TEKgWIttJHYG/ZwTIXIivvu1RWHQ6vZ/zx78993BNPdVk/c6CJ
	c0EFa88A1uw2RHYUDhE17AGvjdR22liOp1I2w/TulH1mnExwhTTCk/SsEiEJ1eN9AfTc1dNNZ1s3M
	KYqTaaBuIXIoJ3laFK+JkaMhJiEA3Lw+7xwFo7NG0fBr/6HEDmMWYe6EA1Gj1vdgWwco1vUDVwlkc
	arDChxFHqbl3+OOCKzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJEz6-00FDKK-0Z;
	Tue, 11 Jul 2023 15:09:00 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJEz3-00FDIn-0o
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 15:08:59 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b701e1ca63so92991901fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689088135; x=1691680135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELbRN/LifTQ/7zfClfcRkCTRTEOE/j2wLv/6DGZBUz4=;
        b=bHShCj9WG6pWGVLraRILWTJ5Y6Mng+dA241HQjJRiFC35Gq1C/o5NW6At9jKzg/rbX
         Zqokjm0nSV5C4DYOXykaXAsu32+8OkBgyjAE4UuMzsJqVnpFMREp+43yARPuzrWVvnqP
         4JSK+5PwF1fY/5hcE/B7w1V4JrnX142QDccqWs4eAZ83DYQ5Etg9/pJV+h9iwON/dpSb
         Efw8rDIr7GVWNglfdYQjccwsfKpqH7BhHMrA35G7xEoSGEh7G5fSwXA8dmLiDufUwcfk
         nVvAKnFlI6ihu4nxJpkF4BAHv//PG48mX8nsoijXRUKtIQJT+JCQjVflSVZvglMin8TM
         Og3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689088135; x=1691680135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELbRN/LifTQ/7zfClfcRkCTRTEOE/j2wLv/6DGZBUz4=;
        b=fJ/LngfczmgzNwpoxKxny016ONrAcJA+qzlE+WgJf6D+ms8+BryH4uK4oiFC+Sq3iB
         bQmgNpoC4uhoou0vGx1CzIZ5Q1cEIxrrPNu+EiLQempvMYkM8rYqx7U1n/mExMD5XZIq
         ihBEttNbYIJ4lHtJE0QwVoefP62Xf4r0gNbdWyJpSnoAr8rfqvVuW0htMP/lvAL9lmAW
         lAN74LGKBkUkKmED68Uq+pkuQNC8RjO766vCDDoYJjFSlusogNNsu9yoWvYixP/CGF6U
         bSjgPawJAsOCNTGAKZRJt5x10eMprV+G6ox6IqYLhQRNqOwSC9xQA2cnrlGHzpS/8pMA
         RFtA==
X-Gm-Message-State: ABy/qLaVVsxgOs4/SELExUOwH2Zb3CpY/XKp4S+Z2KUVBBBhBvrwJjhs
	9CD2AsrlAue0F05+Qwz6ZH9a8+gsqtP1PAfNm58uZRrXdbluOsmhWMA=
X-Google-Smtp-Source: APBJJlFyHgLU0mFIDZnS5y64MOAa8Euz64fKBxKrauS2sfQG8LwcHwrFCtcUV/dbu7fZM9mUz4o8e49Feg8R5ByUPWU=
X-Received: by 2002:a2e:b0c6:0:b0:2b6:fa3f:9230 with SMTP id
 g6-20020a2eb0c6000000b002b6fa3f9230mr11813753ljl.46.1689088135367; Tue, 11
 Jul 2023 08:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230616063210.19063-1-eric.lin@sifive.com> <20230616063210.19063-3-eric.lin@sifive.com>
 <20230616-revision-speed-a83dc926b334@wendy> <CAPqJEFo5genyjY7qJBaESzeppbEnTiDe9qzv98ETLhWfMZeG4A@mail.gmail.com>
 <74385f9d-ed8d-8906-13e3-b3091dae7993@codethink.co.uk>
In-Reply-To: <74385f9d-ed8d-8906-13e3-b3091dae7993@codethink.co.uk>
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 11 Jul 2023 23:08:44 +0800
Message-ID: <CAPqJEFpSkN9fJgNut6bdZUzpTvNp_mikWdCSrE=TNnajf5BRRw@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: sifive: Add SiFive private L2 cache PMU driver
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: will@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_080857_303963_A8A1A84A 
X-CRM114-Status: GOOD (  21.66  )
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

SGkgQmVuLAoKT24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgNDo0MeKAr1BNIEJlbiBEb29rcyA8YmVu
LmRvb2tzQGNvZGV0aGluay5jby51az4gd3JvdGU6Cj4KPiBPbiAyMC8wNi8yMDIzIDA0OjE0LCBF
cmljIExpbiB3cm90ZToKPiA+IE9uIEZyaSwgSnVuIDE2LCAyMDIzIGF0IDY6MTPigK9QTSBDb25v
ciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9u
IEZyaSwgSnVuIDE2LCAyMDIzIGF0IDAyOjMyOjA5UE0gKzA4MDAsIEVyaWMgTGluIHdyb3RlOgo+
ID4+PiBGcm9tOiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+ID4+Pgo+
ID4+PiBUaGlzIGFkZHMgU2lGaXZlIHByaXZhdGUgTDIgY2FjaGUgUE1VIGRyaXZlci4gVXNlcgo+
ID4+PiBjYW4gdXNlIHBlcmYgdG9vbCB0byBwcm9maWxlIGJ5IGV2ZW50IG5hbWUgYW5kIGV2ZW50
IGlkLgo+ID4+Pgo+ID4+PiBFeGFtcGxlOgo+ID4+PiAkIHBlcmYgc3RhdCAtQyAwIC1lIC9zaWZp
dmVfcGwyX3BtdS9pbm5lcl9hY3F1aXJlX2Jsb2NrX2J0b3QvCj4gPj4+ICAgICAgICAgICAgICAg
ICAgLWUgL3NpZml2ZV9wbDJfcG11L2lubmVyX2FjcXVpcmVfYmxvY2tfbnRvYi8KPiA+Pj4gICAg
ICAgICAgICAgICAgICAtZSAvc2lmaXZlX3BsMl9wbXUvaW5uZXJfYWNxdWlyZV9ibG9ja19udG90
LyBscwo+ID4+Pgo+ID4+PiAgIFBlcmZvcm1hbmNlIGNvdW50ZXIgc3RhdHMgZm9yICdDUFUocykg
MCc6Cj4gPj4+Cj4gPj4+ICAgICAgICAgICAgICAgICAzMDAgICAgICBzaWZpdmVfcGwyX3BtdS9p
bm5lcl9hY3F1aXJlX2Jsb2NrX2J0b3QvCj4gPj4+ICAgICAgICAgICAgICAgMTc4MDEgICAgICBz
aWZpdmVfcGwyX3BtdS9pbm5lcl9hY3F1aXJlX2Jsb2NrX250b2IvCj4gPj4+ICAgICAgICAgICAg
ICAgIDUyNTMgICAgICBzaWZpdmVfcGwyX3BtdS9pbm5lcl9hY3F1aXJlX2Jsb2NrX250b3QvCj4g
Pj4+Cj4gPj4+ICAgICAgICAgMC4wODg5MTczMjYgc2Vjb25kcyB0aW1lIGVsYXBzZWQKPiA+Pj4K
PiA+Pj4gJCBwZXJmIHN0YXQgLUMgMCAtZSAvc2lmaXZlX3BsMl9wbXUvZXZlbnQ9MHgxMDAwMS8K
PiA+Pj4gICAgICAgICAgICAgICAgICAtZSAvc2lmaXZlX3BsMl9wbXUvZXZlbnQ9MHg0MDAxLwo+
ID4+PiAgICAgICAgICAgICAgICAgIC1lIC9zaWZpdmVfcGwyX3BtdS9ldmVudD0weDgwMDEvIGxz
Cj4gPj4+Cj4gPj4+ICAgUGVyZm9ybWFuY2UgY291bnRlciBzdGF0cyBmb3IgJ0NQVShzKSAwJzoK
PiA+Pj4KPiA+Pj4gICAgICAgICAgICAgICAgIDI1MSAgICAgIHNpZml2ZV9wbDJfcG11L2V2ZW50
PTB4MTAwMDEvCj4gPj4+ICAgICAgICAgICAgICAgIDI2MjAgICAgICBzaWZpdmVfcGwyX3BtdS9l
dmVudD0weDQwMDEvCj4gPj4+ICAgICAgICAgICAgICAgICA2NDQgICAgICBzaWZpdmVfcGwyX3Bt
dS9ldmVudD0weDgwMDEvCj4gPj4+Cj4gPj4+ICAgICAgICAgMC4wOTI4MjcxMTAgc2Vjb25kcyB0
aW1lIGVsYXBzZWQKPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogR3JlZW50aW1lIEh1IDxncmVl
bnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogRXJpYyBMaW4gPGVyaWMu
bGluQHNpZml2ZS5jb20+Cj4gPj4+IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+Cj4gPj4+IFJldmlld2VkLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4g
Pj4+IC0tLQo+ID4+PiAgIGRyaXZlcnMvc29jL3NpZml2ZS9LY29uZmlnICAgICAgICAgICAgfCAg
IDkgKwo+ID4+PiAgIGRyaXZlcnMvc29jL3NpZml2ZS9NYWtlZmlsZSAgICAgICAgICAgfCAgIDEg
Kwo+ID4+PiAgIGRyaXZlcnMvc29jL3NpZml2ZS9zaWZpdmVfcGwyLmggICAgICAgfCAgMjAgKwo+
ID4+PiAgIGRyaXZlcnMvc29jL3NpZml2ZS9zaWZpdmVfcGwyX2NhY2hlLmMgfCAgMTYgKwo+ID4+
PiAgIGRyaXZlcnMvc29jL3NpZml2ZS9zaWZpdmVfcGwyX3BtdS5jICAgfCA2NjkgKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiA+Pgo+ID4+IFBlcmYgZHJpdmVycyBzaG91bGQgYmUgaW4gZHJp
dmVycy9wZXJmLCBubz8KPiA+Pgo+ID4KPiA+IEhpIENvbm9yLAo+ID4KPiA+IFllcywgSSBzZWUg
bW9zdCBvZiB0aGUgZHJpdmVycyBhcmUgaW4gdGhlIGRyaXZlcnMvcGVyZi4KPiA+Cj4gPiBCdXQg
SSBncmVwIHBlcmZfcG11X3JlZ2lzdGVyKCksIGl0IHNlZW1zIG5vdCBhbGwgdGhlIHBtdSBkcml2
ZXJzIGFyZQo+ID4gaW4gZHJpdmVycy9wZXJmIGFzIGJlbG93Ogo+ID4KPiA+IGFyY2gvYXJtL21h
Y2gtaW14L21tZGMuYzo1MTc6ICAgcmV0ID0KPiA+IHBlcmZfcG11X3JlZ2lzdGVyKCYocG11X21t
ZGMtPnBtdSksIG5hbWUsIC0xKTsKPiA+IGFyY2gvYXJtL21tL2NhY2hlLWwyeDAtcG11LmM6NTUy
OiAgICAgICByZXQgPQo+ID4gcGVyZl9wbXVfcmVnaXN0ZXIobDJ4MF9wbXUsIGwyeDBfbmFtZSwg
LTEpOwo+ID4gLi4uCj4gPiBkcml2ZXJzL2RtYS9pZHhkL3BlcmZtb24uYzo2Mjc6IHJjID0gcGVy
Zl9wbXVfcmVnaXN0ZXIoJmlkeGRfcG11LT5wbXUsCj4gPiBpZHhkX3BtdS0+bmFtZSwgLTEpOwo+
ID4gZHJpdmVycy9mcGdhL2RmbC1mbWUtcGVyZi5jOjkwNDpzdGF0aWMgaW50Cj4gPiBmbWVfcGVy
Zl9wbXVfcmVnaXN0ZXIoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiA+IGRyaXZlcnMv
ZnBnYS9kZmwtZm1lLXBlcmYuYzo5Mjk6ICAgICAgICByZXQgPSBwZXJmX3BtdV9yZWdpc3Rlcihw
bXUsIG5hbWUsIC0xKTsKPiA+IC4uLgo+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BtdS5jOjU0OTogICAgcmV0ID0KPiA+IHBlcmZfcG11X3JlZ2lzdGVyKCZwbXVfZW50cnkt
PnBtdSwgcG11X25hbWUsIC0xKTsKPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcG11LmM6
MTE5MDogICByZXQgPQo+ID4gcGVyZl9wbXVfcmVnaXN0ZXIoJnBtdS0+YmFzZSwgcG11LT5uYW1l
LCAtMSk7Cj4gPiBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bS1wZXJm
LmM6OTA3OiAgIHJldCA9Cj4gPiBwZXJmX3BtdV9yZWdpc3RlcigmZXRtX3BtdSwgQ09SRVNJR0hU
X0VUTV9QTVVfTkFNRSwgLTEpOwo+ID4gZHJpdmVycy9od3RyYWNpbmcvcHR0L2hpc2lfcHR0LmM6
ODk1OiAgIHJldCA9Cj4gPiBwZXJmX3BtdV9yZWdpc3RlcigmaGlzaV9wdHQtPmhpc2lfcHR0X3Bt
dSwgcG11X25hbWUsIC0xKTsKPiA+IGRyaXZlcnMvaW9tbXUvaW50ZWwvcGVyZm1vbi5jOjU3MDog
ICAgICByZXR1cm4KPiA+IHBlcmZfcG11X3JlZ2lzdGVyKCZpb21tdV9wbXUtPnBtdSwgaW9tbXVf
cG11LT5wbXUubmFtZSwgLTEpOwo+ID4gZHJpdmVycy9udmRpbW0vbmRfcGVyZi5jOjMwOTogICBy
YyA9IHBlcmZfcG11X3JlZ2lzdGVyKCZuZF9wbXUtPnBtdSwKPiA+IG5kX3BtdS0+cG11Lm5hbWUs
IC0xKTsKPiA+IC4uLgo+ID4KPiA+IEkganVzdCB3b25kZXJpbmcgd2hhdCBraW5kIG9mIHBtdSBk
cml2ZXJzIHNob3VsZCBiZSBpbiBkcml2ZXJzL3BlcmYKPiA+IGFuZCB3aGF0IGtpbmQgb2YgcG11
IGRyaXZlcnMgc2hvdWxkIG5vdCBiZSBpbiBkcml2ZXJzL3BlcmYuCj4gPiBUaGFua3MuCj4gPgo+
Cj4gR2l2ZW4gdGhlIHJlZ2lzdGVycyBmb3IgdGhlIGwyIGNhY2hlIGNvbnRyb2xzIGFuZCBsMiBw
bXUgZG9uJ3Qgb3ZlcmxhcAo+IGRvIHdlIG5lZWQgdGhlIHBtdSBhbmQgZ2VuZXJhbCBjYWNoZSBk
cml2ZXJzIHRvZ2V0aGVyPwo+CgpGcm9tIFdpbGwncyBzdWdnZXN0aW9uLCBJJ2xsIHB1dCB0aGUg
cGwyIHBtdSBkcml2ZXIgdG8gZHJpdmVycy9wZXJmIGluCnYyLiBUaGFua3MuCgpCZXN0IFJlZ2Fy
ZHMsCkVyaWMgTGluLgoKPiAtLQo+IEJlbiBEb29rcyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBodHRwOi8vd3d3LmNvZGV0aGluay5jby51ay8KPiBTZW5pb3IgRW5naW5lZXIgICAgICAg
ICAgICAgICAgICAgICAgICAgQ29kZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwo+Cj4gaHR0cHM6
Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbAo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
