Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD339C64EC7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 02:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gp/xdXoVpiN3ldf1h2RG4DKDqPcAqxujXrKXFyxsU2g=; b=pqcG7xI/ahiEMv
	IekQ655LELyHEsnIz9hscBuaKKcceRSHm9P/vDoLNhrUs+vEazcwDpHFiRQYuLYkTjrC7WlqX5ymH
	8PySJ7EeJ4ZOb6s+wv/tWplhWFym7EqOaeuUJv4z/ukeewQ0g0HRse8nrJHiXemNWBZF4w6k73HPE
	FcbZEhLr/o8VgT6u/JF4xMvOieY819eq+DcDbCtdC7jH3eiXi9J6c1Jt9/6065uiwLhMwkF6JA5qe
	8InNgRWLvmYpfIaJ0iVjH2zguvpFEBJYQznrSDRBUHWbG3xSvb4SwTYlEyPFbkr5iXLDQoWVfpSKn
	Uvo3k5OM5J8JZtuJnl5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXC6S-00EsE6-Bk; Wed, 01 Mar 2023 02:22:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXC6P-00EsDh-Cp
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 02:21:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A62226121D
	for <linux-riscv@lists.infradead.org>; Wed,  1 Mar 2023 02:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B783C433D2
	for <linux-riscv@lists.infradead.org>; Wed,  1 Mar 2023 02:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677637316;
	bh=KymsAAZhTXhaULv7piniQQoD5iMV1Bl5HKPh08O2spg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AHe3rlsmB5yHU7dV5GW8YekfdY+SO97C0WIKIBwkhDO9QpJ6TLLLXoYbzZqP5LfXl
	 M/z9mO1XGIRd5a2NFlSdI9L7VTu7PhcOna7anXC/4hkqfHL5mxUd+jwAyx8Myc48SQ
	 x3lOvdSgUfpR8TvVN6M641KWE8fw9NJs1dn2mFY3CzbppcWbZYreCyy+Z+C26betPJ
	 9he+4UUqNhU94ChC5ucbKzXdWNIS9sFxzProTxhB5N3xncdHbWt4zWoZoKl9yftUXI
	 1JISqHMH3Lrb7FDjbTsZShbAPuREUfGErFetQ3JDQZHvvhL9YqHEc3cSyCj/4FjbvB
	 I9HSz98H1gorg==
Received: by mail-ed1-f48.google.com with SMTP id eg37so47922072edb.12
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 18:21:55 -0800 (PST)
X-Gm-Message-State: AO0yUKWq5LUBsZFqKMl24fqSLw/z6LoKdh4uDxNsFwpGZlir91OfRXFE
	YcOHjgwIr2R3QH1ZbQB3cI59LVUy0e9tQtigWio=
X-Google-Smtp-Source: AK7set+8Ojeh58hPB0HzS94VXKaeYHAwQIW/3HmewYHJro4+F02U2eYtE8TMWJArKu8qe7mttDVpspY1DxOjYZxtH+o=
X-Received: by 2002:a17:906:5594:b0:877:7480:c568 with SMTP id
 y20-20020a170906559400b008777480c568mr2424754ejp.8.1677637314205; Tue, 28 Feb
 2023 18:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20230228215435.3366914-1-heiko@sntech.de>
In-Reply-To: <20230228215435.3366914-1-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 1 Mar 2023 10:21:43 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSG23qMp6UuF_zrHY-QvVCR4BNm2vA088BJTe3rF0vUkg@mail.gmail.com>
Message-ID: <CAJF2gTSG23qMp6UuF_zrHY-QvVCR4BNm2vA088BJTe3rF0vUkg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] RISC-V: T-Head vector handling
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, samuel@sholland.org, 
	christoph.muellner@vrull.eu, conor.dooley@microchip.com, 
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_182157_555099_62D456AF 
X-CRM114-Status: GOOD (  20.84  )
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

T24gV2VkLCBNYXIgMSwgMjAyMyBhdCA1OjU04oCvQU0gSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4gd3JvdGU6Cj4KPiBGcm9tOiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJA
dnJ1bGwuZXU+Cj4KPiBBcyBpcyB3aWRlbHkga25vd24gdGhlIFQtSGVhZCBDOXh4IGNvcmVzIHVz
ZWQgZm9yIGV4YW1wbGUgaW4gdGhlCj4gQWxsd2lubmVyIEQxIGltcGxlbWVudCBhbiBvbGRlciBu
b24tcmF0aWZpZWQgdmFyaWFudCBvZiB0aGUgdmVjdG9yIHNwZWMuCj4KPiBXaGlsZSB1c2Vyc3Bh
Y2Ugd2lsbCBwcm9iYWJseSBoYXZlIGEgbG90IG1vcmUgcHJvYmxlbXMgaW1wbGVtZW50aW5nCj4g
c3VwcG9ydCBmb3IgYm90aCwgb24gdGhlIGtlcm5lbCBzaWRlIHRoZSBuZWVkZWQgY2hhbmdlcyBh
cmUgYWN0dWFsbHkKPiBzb21ld2hhdCBzbWFsbCdpc2ggYW5kIGNhbiBiZSBoYW5kbGVkIHZpYSBh
bHRlcm5hdGl2ZXMgc29tZXdoYXQgbmljZWx5Lgo+Cj4gV2l0aCB0aGlzIHBhdGNoc2V0IEkgY291
bGQgcnVuIHRoZSBzYW1lIHVzZXJzcGFjZSBwcm9ncmFtIChwaWNrZWQgZnJvbQo+IHNvbWUgcmlz
Y3YtdmVjdG9yLXRlc3QgcmVwb3NpdG9yeSkgdGhhdCBkb2VzIHNvbWUgdmVjdG9yIGFkZGl0aW9u
cyBvbgo+IGJvdGggcWVtdSBhbmQgYSBkMS1uZXpoYSBib2FyZC4gT24gYm90aCBwbGF0Zm9ybXMg
aXQgcmFuIHN1Y2Vzc2Z1bGx5IGFuZAo+IGV2ZW4gcHJvZHVjZWQgdGhlIHNhbWUgcmVzdWx0cy4K
R3JlYXQhIFRoeC4KCj4KPgo+IEFzIGNhbiBiZSBzZWVuIGluIHRoZSB0b2RvIGxpc3QsIHRoZXJl
IGFyZSAyIHBsYWNlcyB3aGVyZSB0aGUgY2hhbmdlZAo+IFNSX1ZTIGxvY2F0aW9uIHN0aWxsIG5l
ZWRzIHRvIGJlIGhhbmRsZWQgaW4gdGhlIG5leHQgcmV2aXNpb24KPiAoYXNzZW1ibHkgKyBBTFRF
Uk5BVElWRVMgKyBjb25zdGFudHMgKyBwcm9iYWJseSBzdHJpbmdpZnkgcmVzdWx0ZWQgaW4KPiAg
c29tZSBncmV5IGhhaXIgc28gZmFyIGFscmVhZHkpCj4KPgo+IFRvRG86Cj4gLSBmb2xsb3cgYWxv
bmcgd2l0aCB0aGUgYmFzZSB2ZWN0b3IgcGF0Y2hzZXQKPiAtIGhhbmRsZSBTUl9WUyBhY2Nlc3Mg
aW4gX3NhdmVfY29udGV4dCBhbmQgX3NlY29uZGFyeV9zdGFydF9zYmkKPgo+Cj4gSGVpa28gU3R1
ZWJuZXIgKDIpOgo+ICAgUklTQy1WOiBkZWZpbmUgdGhlIGVsZW1lbnRzIG9mIHRoZSBWQ1NSIHZl
Y3RvciBDU1IKPiAgIFJJU0MtVjogYWRkIFQtSGVhZCB2ZWN0b3IgZXJyYXRhIGhhbmRsaW5nCj4K
PiAgYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YXMgICAgICAgICAgIHwgIDEzICsrKwo+ICBhcmNo
L3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYyAgICAgfCAgMzIgKysrKysrCj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3NyLmggICAgICAgICB8ICAzMSArKysrKy0KPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oIHwgIDYyICsrKysrKysrKysrLQo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3ZlY3Rvci5oICAgICAgfCAxMzkgKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgMjYxIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygt
KQo+Cj4gLS0KPiAyLjM5LjAKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
