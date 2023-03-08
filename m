Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E065C6FA99
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 03:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6P5URJ8tTg4/0R9N2gpk5yFUF8DpM41EdIOpU/z3gY=; b=AZIN0aAJ+jSZvF
	K2WTMaI+omCKnCQCrgV3k1Wazi2nKT9aDeo/QuSg2hJ2weirpCdMuRDECc/hqNyXVBsl7OGNIFaaB
	H91n7v0uGr4Oric1Ij/vMrES5xOcNx70Xi3s3amp/5PfA3Je8cr6ddA7RyCOMj4Jj4q/hrw3/C/K6
	t2RfS8vCI5LYlks2/Q+XoSs5Hbvv1uDQ82c/LX04leMP5W2dUIwRxlMOQtdeFO8ugwzJR7n2vjdVP
	U3zaBnV9TY/Uzq9JgelRwN9Eq8QgvdHKJ0jDvi6Z55jf/oprzloA/29QRiHozs6xDSXpuuwMbJ+x3
	uzFIHDekKbHDtYTtOiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZkh1-003Ln6-K0; Wed, 08 Mar 2023 03:42:19 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZkgx-003LkD-Fk
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 03:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1678246935; x=1709782935;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oFa7Gcyn9Ul+mH142Yn1yviiCF+dyhpwwZBiVvmgMPY=;
  b=a/5SO2adE7KHzdqqA2Pwchcf0NI/QIEZfbd4kBUjoEZeOcI3EPNO3Ri0
   yt8tC0xJ4LlOjC17sWAfrph68ytwLMDog/dNYRq7aVAZ74N4eZ4x+fnuq
   OMZZR2ONsUtLVgWL9gdHdClKjTNWDmOPcPrh0gj3jsneH4TTtgmX9/gP7
   HjWLWVXqnH0gijIZJP5IXyTIy56VRlCKsWbmt7mePVoLZwYlBNGg9r3eh
   a7r6EmXaJUe5PNXV9tKMeQZOLkDvSnTN2tMSpPOyh2I3V42JolaXcKszp
   isgLSHCSysSfcKbOLjkPF7WNSyS9kI823nAH+xVs8su5TYG5j7vl7U/5z
   w==;
X-IronPort-AV: E=Sophos;i="5.98,242,1673884800"; 
   d="scan'208";a="329421737"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 08 Mar 2023 11:42:11 +0800
IronPort-SDR: yudV96PzEDDfSGf+uI0JtGqed8ys+Mjtxpm4ndESEclxQs5d2cdu0hyDewW+jEJMiUvWOsk4AV
 sVUs1ItSuY7hLW1IDedSZF5dCu2FDZjwoszbY/nNRs2OhV/sOa52qu8VoJX9UQWJNevJ7ynG9/
 ir05CLSc6qaAYnMjq9iSBfhbBgvUiF7lGObqJ1pI3PaYkZipuFzArFfsqD80GVCwJUCCK678SS
 7WGMtJ8idQE4fo6RvndxV4qkJlaNiKCRvs4Y//AkBjUuJ33JOmaw+pMyt+YnOC2Xko+/zBbBcE
 CtU=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Mar 2023 18:58:50 -0800
IronPort-SDR: tjTJIw2B4W3j5YlNrKt1EUoYErpXm61Nt37sW/D2072HYCNyd4DdwlvhaElnm12hqBLxpqPkOF
 OhjkwfSa10T/tgqW3fvgtpfLu7P9rrlQs02GqQOsdZ0WDAtasm/d1bjWf/nGN8AfXl845uP/Sd
 XpX+5K5K76s0a4oTgJNjBve/Cmq+SQdSZ5fcVd/B6jmUbOz0V5Qdjlk6M3cYcF0VwJGcJlrj5d
 gFty4rOptnaygdLPamz6eXSJyvV5BluW2UUWvN/7rAw+7fJaPe+7aGJF6/PYpxL23IK3gO66nu
 3ho=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Mar 2023 19:42:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PWdRR0mn6z1RwvL
	for <linux-riscv@lists.infradead.org>; Tue,  7 Mar 2023 19:42:10 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1678246929; x=1680838930; bh=oFa7Gcyn9Ul+mH142Yn1yviiCF+dyhpwwZB
	iVvmgMPY=; b=cek3KLifGixZZTZrx1ddYUvHS4/hW2is8iEUeEVtCi6y4tIk5pw
	t8yxPu1VtKTdJ7ThRCpYBaw0cVEERK2SwGE9PcSJxM1G3IbQZC+KQj2JE9OuX9Qq
	EJg4XL2COUGHo/p03oEv2recb8TRmvLV+/NHlLjT6G/40iCdNP/1c5lJpR0WYB/v
	RBRNdvXhvbG42V/VzebZCaLtQtar2QNZTeYDPe4dsa0wy3ufYnKHf1SbsDziIHwL
	8cFHUDf37o1D7+o0IsS792rVmKEzLH2KUeoMUqWiaqGuIszV64aRw6IG54kEWie3
	W8zN9xlQbG23dcTCbOveevg4IscNv517rPw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YxBh1P5iJ6JL for <linux-riscv@lists.infradead.org>;
	Tue,  7 Mar 2023 19:42:09 -0800 (PST)
Received: from [10.225.163.63] (unknown [10.225.163.63])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PWdRM4js0z1RvLy;
	Tue,  7 Mar 2023 19:42:07 -0800 (PST)
Message-ID: <d3fb242e-646e-50b5-7dba-17b228bb32aa@opensource.wdc.com>
Date: Wed, 8 Mar 2023 12:42:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Jesse Taube <mr.bossman075@gmail.com>, linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
 <556ce787-80eb-dc48-f8d6-83e415538e36@opensource.wdc.com>
 <f8f291d9-2723-4ab8-3020-49018757d470@gmail.com>
 <62852ee1-3763-3323-c3a8-f1e84f70204a@infradead.org>
 <c7941231-8ebd-dea5-81f8-3180cfc3f286@gmail.com>
 <1d858dbb-ae85-95a0-3e46-b67017733c04@infradead.org>
 <db3b3412-9616-d13c-3374-48647325e057@infradead.org>
 <7280914e-59e3-ba6d-4324-a29c1c0b4ce8@gmail.com>
 <2ebe4bc5-c11c-89b1-2644-358dc12bdfa5@infradead.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <2ebe4bc5-c11c-89b1-2644-358dc12bdfa5@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_194215_696498_A6C519D2 
X-CRM114-Status: GOOD (  18.68  )
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

T24gMy84LzIzIDEyOjIzLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+PiBPSywgSSBkb24ndCBrbm93
IGhvdyBpdCBoYXBwZW5lZC4gSSBjYW5ub3QgcmVwcm9kdWNlIGl0IG5vdy4KPj4+IFRoZSBmYWls
aW5nIC5jb25maWcgZmlsZXMgaGFzIENPTkZJR19NTVUgaXMgbm90IHNldCAoZm9yIFJWMzJJKSwg
d2hpY2gKPj4+IGFwcGVhcnMgdG8gYmUgaW1wb3NzaWJsZS4KPj4gVGhlc2UgcGF0Y2hlcyBhZGQg
YENPTkZJR19NTVUgaXMgbm90IHNldGAgKGZvciBSVjMySSkuCj4+IEJ1dCBubyB3b3JyaWVzIGl0
IHNlZW1zIHRvIGJlIGEgbm9uIGlzc3VlwqAgbm93Lgo+Pgo+PiBZb3VyIHRob3VnaHRzIERhbWll
bj8KPj4KPiAKPiBUaGFua3MgZm9yIHJlbWluZGluZyBtZS4KPiAKPiBXaXRoIHRoZXNlIDMgcGF0
Y2hlcyBhcHBsaWVkIHRvIGxpbnV4LW5leHQtMjAyMzAzMDcsCj4gSSBzdGlsbCBnZXQgdGhpcyBi
dWlsZCBlcnJvci4KCkRvZXMgdGhpcyBoZWxwID8KCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9j
YW5hYW4vS2NvbmZpZyBiL2RyaXZlcnMvc29jL2NhbmFhbi9LY29uZmlnCmluZGV4IDI1MjdjZjU3
NTdlYy4uNzc5NmM1ZjFkMTA5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvYy9jYW5hYW4vS2NvbmZp
ZworKysgYi9kcml2ZXJzL3NvYy9jYW5hYW4vS2NvbmZpZwpAQCAtNCw3ICs0LDggQEAgY29uZmln
IFNPQ19LMjEwX1NZU0NUTAogICAgICAgIGJvb2wgIkNhbmFhbiBLZW5kcnl0ZSBLMjEwIFNvQyBz
eXN0ZW0gY29udHJvbGxlciIKICAgICAgICBkZXBlbmRzIG9uIFJJU0NWICYmIFNPQ19DQU5BQU4g
JiYgT0YKICAgICAgICBkZWZhdWx0IFNPQ19DQU5BQU4KLSAgICAgICAgc2VsZWN0IFBNCi0gICAg
ICAgIHNlbGVjdCBNRkRfU1lTQ09OCisgICAgICAgc2VsZWN0IENPTU1PTl9DTEtfSzIxMAorICAg
ICAgIHNlbGVjdCBQTQorICAgICAgIHNlbGVjdCBNRkRfU1lTQ09OCiAgICAgICAgaGVscAogICAg
ICAgICAgQ2FuYWFuIEtlbmRyeXRlIEsyMTAgU29DIHN5c3RlbSBjb250cm9sbGVyIGRyaXZlci4K
CihqdXN0IG5vdGljZWQgdGhhdCB0aGVyZSBhcmUgd2hpdGVzcGFjZSBlcnJvcnMgaGVyZS4uLikK
Ck5vdGUgdGhhdCBib3RoIHRoZSBzeXNjdGwgYW5kIGNsayBkcml2ZXIgZGVwZW5kIG9uIFJJU0NW
LiBJIHRoaW5rIHRoZXNlIHNob3VsZApwcm9iYWJseSBhbHNvIGRlcGVuZCBvbiA2NEJJVCwgYW5k
IGV2ZW50dWFsbHkgYWRkIGEgInx8IENPTVBJTEVfVEVTVCIgYXMgd2VsbC4KU28gc29tZXRoaW5n
IGxpa2UgdGhpczoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9LY29uZmlnIGIvZHJpdmVycy9j
bGsvS2NvbmZpZwppbmRleCBiNmM1YmY2OWEyYjIuLjY1N2EzNmQyNjQwZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9jbGsvS2NvbmZpZworKysgYi9kcml2ZXJzL2Nsay9LY29uZmlnCkBAIC00MzEsNyAr
NDMxLDcgQEAgY29uZmlnIENPTU1PTl9DTEtfRklYRURfTU1JTwoKIGNvbmZpZyBDT01NT05fQ0xL
X0syMTAKICAgICAgICBib29sICJDbG9jayBkcml2ZXIgZm9yIHRoZSBDYW5hYW4gS2VuZHJ5dGUg
SzIxMCBTb0MiCi0gICAgICAgZGVwZW5kcyBvbiBPRiAmJiBSSVNDViAmJiBTT0NfQ0FOQUFOCisg
ICAgICAgZGVwZW5kcyBvbiBPRiAmJiBSSVNDViAmJiBTT0NfQ0FOQUFOICYmICg2NEJJVCB8fCBD
T01QSUxFX1RFU1QpCiAgICAgICAgZGVmYXVsdCBTT0NfQ0FOQUFOCiAgICAgICAgaGVscAogICAg
ICAgICAgU3VwcG9ydCBmb3IgdGhlIENhbmFhbiBLZW5kcnl0ZSBLMjEwIFJJU0MtViBTb0MgY2xv
Y2tzLgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvY2FuYWFuL0tjb25maWcgYi9kcml2ZXJzL3Nv
Yy9jYW5hYW4vS2NvbmZpZwppbmRleCAyNTI3Y2Y1NzU3ZWMuLjE3NDVhNjE0ZDJhNyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9zb2MvY2FuYWFuL0tjb25maWcKKysrIGIvZHJpdmVycy9zb2MvY2FuYWFu
L0tjb25maWcKQEAgLTIsOSArMiwxMCBAQAoKIGNvbmZpZyBTT0NfSzIxMF9TWVNDVEwKICAgICAg
ICBib29sICJDYW5hYW4gS2VuZHJ5dGUgSzIxMCBTb0Mgc3lzdGVtIGNvbnRyb2xsZXIiCi0gICAg
ICAgZGVwZW5kcyBvbiBSSVNDViAmJiBTT0NfQ0FOQUFOICYmIE9GCisgICAgICAgZGVwZW5kcyBv
biBSSVNDViAmJiBTT0NfQ0FOQUFOICYmIE9GICYmICg2NEJJVCB8fCBDT01QSUxFX1RFU1QpCiAg
ICAgICAgZGVmYXVsdCBTT0NfQ0FOQUFOCi0gICAgICAgIHNlbGVjdCBQTQotICAgICAgICBzZWxl
Y3QgTUZEX1NZU0NPTgorICAgICAgIHNlbGVjdCBDT01NT05fQ0xLX0syMTAKKyAgICAgICBzZWxl
Y3QgUE0KKyAgICAgICBzZWxlY3QgTUZEX1NZU0NPTgogICAgICAgIGhlbHAKICAgICAgICAgIENh
bmFhbiBLZW5kcnl0ZSBLMjEwIFNvQyBzeXN0ZW0gY29udHJvbGxlciBkcml2ZXIuCgpDT01QSUxF
X1RFU1QgaXMgb3B0aW9uYWwgdGhvdWdoLCBidXQgSSBkbyBub3Qgc2VlIGFueSByZWFzb24gd2h5
IG5vdCBldmVudGhvdWdoCmluIHByYWN0aWNlIHRoZXNlIGRyaXZlcnMgd2lsbCBsaWtlbHkgbmV2
ZXIgZW5kIHVwIGluIDMyLWJpdHMgU29DLgoKCi0tIApEYW1pZW4gTGUgTW9hbApXZXN0ZXJuIERp
Z2l0YWwgUmVzZWFyY2gKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
