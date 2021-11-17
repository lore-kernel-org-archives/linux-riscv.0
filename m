Return-Path: <SRS0=ZoRk=QE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB1BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 12:25:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66D361544
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 12:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B66D361544
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+UVGgydfLARKOVwNfMyf6itPl6BuArr01GQx3v0+qQ=; b=LquZAaog7loJ68
	wormpeBEYeDj0M7/62F3B2breo4sifCxxVCkxeKDNIESKCEB594B+cZyfsjUcrIfoZaWgHaqBCmAQ
	EoHty3qtZdwW+ojAZvukjlfq3+TG28VQhwEsDzFWiyqFye1oiA0UqkB0iORx3TUuLOgl8BXlUigLp
	F79Wf06ahqE3a4kqFhcVDTQLLifuW3myBkW4kV74qRuHDwp29U5Poi1gEBVXwP2G/ClL5lnGbRkBo
	Si6h1unTDAX5NWoEX/a5ZJhREGHAHFe1YUc3YoClMJPg8dg059wu4IqR2zpUGQVdT1R5CEVF2Y5ch
	OLyTKh+Zh8jqFnK01qOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnK0P-004iLz-2Z; Wed, 17 Nov 2021 12:25:37 +0000
Received: from forward501j.mail.yandex.net ([2a02:6b8:0:801:2::111])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnK0M-004iL7-BL
 for linux-riscv@lists.infradead.org; Wed, 17 Nov 2021 12:25:36 +0000
Received: from iva1-9aa5fe580da0.qloud-c.yandex.net
 (iva1-9aa5fe580da0.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:7683:0:640:9aa5:fe58])
 by forward501j.mail.yandex.net (Yandex) with ESMTP id AB43D623B81;
 Wed, 17 Nov 2021 15:25:26 +0300 (MSK)
Received: from iva7-f62245f79210.qloud-c.yandex.net
 (iva7-f62245f79210.qloud-c.yandex.net [2a02:6b8:c0c:2e83:0:640:f622:45f7])
 by iva1-9aa5fe580da0.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 QtXIEhqa6k-PPCe6hbT; Wed, 17 Nov 2021 15:25:26 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1637151926; bh=ElhP1hJ0vLcc8mhMZ9ZFl8CQQFdhTfiWo1lNdgbos0I=;
 h=In-Reply-To:Subject:To:From:References:Date:Message-ID:Cc;
 b=b52shgtuhdJVmYPENCPJFXgQ/30VbRZVRuwbn6JW/uoX5TXFKAEOGyTIoY9fP2dcz
 d39Fjt2t9TuW44rZFnJsNd/aXpzJj7fR/QFB3c0N2OhZGqRRBfvWcIZMOcrW2o0X3l
 BYG/NVgc+LOHswWYKRVadtsm3exAjx+V4kL8dD+A=
Authentication-Results: iva1-9aa5fe580da0.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by iva7-f62245f79210.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 Ynztu7KfJo-POTS0i5C; Wed, 17 Nov 2021 15:25:25 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Wed, 17 Nov 2021 15:25:23 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: =?ISO-8859-1?Q?Jo=E3o_M=E1rio?= Domingos <joao.mario@tecnico.ulisboa.pt>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 atish.patra@wdc.com, anup.patel@wdc.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/4] Introduce pmu-events support for HiFive Unmatched
Message-ID: <20211117152523.66f4ee8e@redslave.neermore.group>
In-Reply-To: <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
 <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_042534_759764_B8CCC783 
X-CRM114-Status: GOOD (  13.54  )
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

T24gVHVlLCAxNiBOb3YgMjAyMSAxNTo0ODowOCArMDAwMApKb8OjbyBNw6FyaW8gRG9taW5nb3Mg
PGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0PiB3cm90ZToKCkhlbGxvIE1hcmlvIQoKVGhh
bmsgeW91IGZvciB5b3VyIHBhdGNoIHNlcmllcy4KCkkgaGF2ZSByZXByb2R1Y2VkIHlvdXIgdGVz
dCB3aXRoIHNvbWUgdS1ib290IGR0cyB0aW5rZXJpbmcsIGFuZCBnb3QKc2ltaWxhciByZXN1bHRz
LgoKSG93ZXZlciwKCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9hdGlzaHAwNC9vcGVuc2Jp
L3RyZWUvcG11X3NzY29mcG1mX3YyIAoKT3BlblNCSSBzc2NvZnBtZiBoYXMgYmVlbiBtZXJnZWQu
Cgo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vYXRpc2hwMDQvdS1ib290L3RyZWUvaGlmaXZlX3Vu
bWF0Y2hlZF9kdF9wbXUKPiBbNV0KPiBodHRwczovL2dpdGh1Yi5jb20vYXRpc2hwMDQvdS1ib290
L2Jsb2IvaGlmaXZlX3VubWF0Y2hlZF9kdF9wbXUvYXJjaC9yaXNjdi9kdHMvZnU3NDAtYzAwMC5k
dHNpCgpJcyBtaXNzaW5nIHRoZSBhZGFwdGF0aW9uIGZvciBPcGVuU0JJIGJpdG1hcCBwYXRjaCBm
b3IKInJhdy1ldmVudC10by1taHBtY291bnRlcnMiLgoKPiBbM10gaHR0cHM6Ly9naXRodWIuY29t
L2F0aXNocDA0L2xpbnV4L3RyZWUvcmlzY3ZfcG11X3Y0CgpUaGUgbGluayBpcyBicm9rZW4uCgo+
IFs0XQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1yaXNjdi8y
MDIxLU9jdG9iZXIvMDA5NDA4Lmh0bWwKCj4gWzZdCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L29wZW5zYmkvcGF0Y2gvMjAyMTExMDUwMTMzMDEuMjc2NTYtMS12aW5jZW50
LmNoZW5Ac2lmaXZlLmNvbS8KPiAKClRoZXJlIGlzIGEgdmVyc2lvbiAyIHN1Ym1pdHRlZCwgYW5k
IGl0IHdvbid0IGFwcGx5IGFzIHJlcXVpcmUgcmViYXNpbmcKYW5kIHNvbWUgcmVuYW1pbmcuCgpQ
bGVhc2Ugc2hhcmUgeW91ciB1LWJvb3QgZHRzIGNoYW5nZXMgLSB0aGV5IHNob3VsZCBiZSBzbWFs
bCBhbmQgcHJvdmlkZQphIGNvbW1vbiBiYXNlIGZvciB0aGlzIHNlcmllcy4KClRlc3RlZC1ieTog
TmlraXRhIFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBKb8Oj
byBNw6FyaW8gRG9taW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0Pgo+IAo+IFRo
aXMgd29yayB3YXMgZGV2ZWxvcGVkIGF0IElORVNDLUlELCBJbnN0aXR1dG8gU3VwZXJpb3IgVMOp
Y25pY28sCj4gVW5pdmVyc2lkYWRlIGRlIExpc2JvYS4KPiAKPiAtLS0KPiBDaGFuZ2VzIGluIHYy
Ogo+ICAgLSBGaXggY29tcGlsYXRpb24gZXJyb3JzIGFuZCB3YXJuaW5ncwo+ICAgLSBSZW1vdmUg
c3BhY2UgaWRlbnRzCj4gICAtIENvcnJlY3QgZm9ybWF0dGluZwo+IAo+IEpvw6NvIE3DoXJpbyBE
b21pbmdvcyAoNCk6Cj4gICBSSVNDLVY6IENyZWF0ZSB1bmlxdWUgaWRlbnRpZmljYXRpb24gZm9y
IFNvQyBQTVUKPiAgIFJJU0MtVjogU3VwcG9ydCBDUFVJRCBmb3IgcmlzYy12IGluIHBlcmYKPiAg
IFJJU0MtVjogQWRkZWQgZ2VuZXJpYyBwbXUtZXZlbnRzIG1hcGZpbGUKPiAgIFJJU0MtVjogQWRk
ZWQgSGlGaXZlIFVubWF0Y2hlZCBQTVUgZXZlbnRzCj4gCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Ni
aS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsKPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3Bt
dS5jICAgICAgICAgICAgICAgICAgICAgIHwgMTggKysrKwo+ICBkcml2ZXJzL3BlcmYvcmlzY3Zf
cG11X3NiaS5jICAgICAgICAgICAgICAgICAgfCA0NyArKysrKysrKysrCj4gIHRvb2xzL3BlcmYv
YXJjaC9yaXNjdi91dGlsL0J1aWxkICAgICAgICAgICAgICB8ICAxICsKPiAgdG9vbHMvcGVyZi9h
cmNoL3Jpc2N2L3V0aWwvaGVhZGVyLmMgICAgICAgICAgIHwgNjYgKysrKysrKysrKysrKwo+ICB0
b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9tYXBmaWxlLmNzdiAgfCAxNSArKysKPiAg
Li4uL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9yaXNjdi1nZW5lcmljLmpzb24gIHwgMjAgKysrKwo+
ICAuLi4vYXJjaC9yaXNjdi9zaWZpdmUvdTc0L2luc3RydWN0aW9ucy5qc29uICAgfCA5Mgo+ICsr
KysrKysrKysrKysrKysrKysgLi4uL2FyY2gvcmlzY3Yvc2lmaXZlL3U3NC9tZW1vcnkuanNvbiAg
ICAgICAgIHwKPiAzMiArKysrKysrIC4uLi9hcmNoL3Jpc2N2L3NpZml2ZS91NzQvbWljcm9hcmNo
Lmpzb24gICAgICB8IDU3Cj4gKysrKysrKysrKysrIDEwIGZpbGVzIGNoYW5nZWQsIDM1MSBpbnNl
cnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL2FyY2gvcmlzY3YvdXRp
bC9oZWFkZXIuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2Fy
Y2gvcmlzY3YvbWFwZmlsZS5jc3YKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4gdG9vbHMvcGVyZi9w
bXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJpYy5qc29uIGNyZWF0ZSBtb2RlCj4gMTAw
NjQ0IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3NpZml2ZS91NzQvaW5zdHJ1Y3Rp
b25zLmpzb24KPiBjcmVhdGUgbW9kZSAxMDA2NDQKPiB0b29scy9wZXJmL3BtdS1ldmVudHMvYXJj
aC9yaXNjdi9zaWZpdmUvdTc0L21lbW9yeS5qc29uIGNyZWF0ZSBtb2RlCj4gMTAwNjQ0IHRvb2xz
L3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3NpZml2ZS91NzQvbWljcm9hcmNoLmpzb24KPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
