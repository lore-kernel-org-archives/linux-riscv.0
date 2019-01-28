Return-Path: <SRS0=ZHC4=QE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5FBC282C8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 19:43:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF7BE20989
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 19:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pc98/VYK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF7BE20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//07NaziREf2ddiwZM76y5llCl5gxNXjSR79AbScViY=; b=Pc98/VYKrCiQIY
	3lCDK0OvIaV3ZD2iWgrDp/L8m4LIZbsy6Ji7Esjt5tTrczjBAs5TNLsoJJQbdoI+0Pnzw2T3Gs0zn
	NBJoApa0Q30CORUIYAUraJvqazBLZZf0CrH/91t7LO79rdqKy2gYScyTVxFdI5c979yxUCYb1PDRc
	Dxrcje3qr65AnQ7XpCwZ+caGLkFDCWM4oTzqKqCpHjCd4ZjiCroH2TKiIL7+QJ6wiYc0HbhGC71JM
	KlAxpaUhnGDVNtTiie4adJACxl7708BUW1r7TPz9ofiUkCkX9hS0szWe3ifjcppYGhDKBevfEHhBX
	JerBeWvwKOSeW1YnXqeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goCoU-0005AV-AX; Mon, 28 Jan 2019 19:43:22 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goCoQ-00059S-V7
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 19:43:20 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D6519B017;
 Mon, 28 Jan 2019 19:43:15 +0000 (UTC)
Subject: Re: [sw-dev] SBI extension proposal v2
To: Nick Kossifidis <mick@ics.forth.gr>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <cbccd2dd56e1e5b498fd12abda22b863@mailhost.ics.forth.gr>
From: Alexander Graf <agraf@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=agraf@suse.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0aa02993-4f71-2171-7bec-54fe40b13279@suse.de>
Date: Mon, 28 Jan 2019 20:43:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <cbccd2dd56e1e5b498fd12abda22b863@mailhost.ics.forth.gr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_114319_292347_13B291BB 
X-CRM114-Status: GOOD (  11.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, Christoph Hellwig <hch@infradead.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, Atish Patra <atish.patra@wdc.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, zong@andestech.com,
 ron minnich <rminnich@gmail.com>, sw-dev@groups.riscv.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyOC4wMS4xOSAxNzo0NywgTmljayBLb3NzaWZpZGlzIHdyb3RlOgo+IM6jz4TOuc+CIDIw
MTktMDEtMjggMTg6MzgsIEFsZXhhbmRlciBHcmFmIM6tzrPPgc6xz4jOtToKPj4gT24gMjguMDEu
MTkgMTc6MzMsIEx1a2UgS2VubmV0aCBDYXNzb24gTGVpZ2h0b24gd3JvdGU6Cj4+PiAtLS0KPj4+
IGNyb3dkLWZ1bmRlZCBlY28tY29uc2Npb3VzIGhhcmR3YXJlOiBodHRwczovL3d3dy5jcm93ZHN1
cHBseS5jb20vZW9tYTY4Cj4+Pgo+Pj4gT24gTW9uLCBKYW4gMjgsIDIwMTkgYXQgMTI6NDQgUE0g
QWxleGFuZGVyIEdyYWYgPGFncmFmQHN1c2UuZGU+IHdyb3RlOgo+Pj4KPj4+Pj4gSWYgUmlzYy1W
IHdhbnRzIHRvIGF2b2lkIGZyYWdtZW50YXRpb24sIGl0IHNob3VsZCBzaW1wbHkga2VlcCBhIGZp
cm1lcgo+Pj4+PiByZWlnbiBpbiB3aGF0IGlzIGFsbG93ZWQgaW4gYW4gaW1wbGVtZW50YXRpb24g
YW5kIGtlZXAgYSBsaWQgb24gc3VjaAo+Pj4+PiBob3JyaWQgaWRlYXMgYXMgdmVuZG9yIHNwZWNp
ZmljIHVzZXJzcGFjZSBJU0EgZXh0ZW5zaW9ucy4KPj4+Pgo+Pj4+IEkgdGVuZCB0byBhZ3JlZSBo
ZXJlLiBJIHRoaW5rIGEgZ2xvYmFsIGlkZW50aWZpY2F0aW9uIHNjaGVtZSBpcwo+Pj4+IHJlYXNv
bmFibGUuIEJ1dCBjYW4ndCB3ZSBqdXN0IGxpdmUgd2l0aCBhIHNpbmdsZSBnbG9iYWwgc3BlYyB0
aGF0Cj4+Pj4gcGVvcGxlCj4+Pj4gY29udHJpYnV0ZSB0bz8KPj4+Cj4+PiDCoHVuZm9ydHVuYXRl
bHksIGFsZXhhbmRlciwgdGhlIFJJU0MtViBGb3VuZGF0aW9uIGhhcyBjaG9zZW4gdG8gZXhjbHVk
ZQo+Pj4gcGVvcGxlIGZyb20gdGhlIGRpc2N1c3Npb24sIGJ5IGNob29zaW5nIGFuIElUVS1zdHls
ZSAoIkNhcnRlbGxlZCIpCj4+PiBzZWNyZXRpdmUgc3RhbmRhcmRzIGRldmVsb3BtZW50IHByb2Nl
c3MuCj4+Pgo+Pj4gwqBzbyBhcyBhbiAib3V0c2lkZXIiIHdobyBmb3Igd2hhdGV2ZXIgcmVhc29u
IGNhbm5vdCBqb2luIHRoYXQgY2xvc2VkLAo+Pj4gc2VjcmV0aXZlIHByb2Nlc3MgKGZvciBleGFt
cGxlIGEgc3RyYXRlZ2ljYWxseS1jcml0aWNhbCB1LWJvb3Qgb3IKPj4+IGxpbnV4IGtlcm5lbCBk
ZXZlbG9wZXIgd2l0aCBkZWNhZGVzIG9mIHJlbGV2YW50IGV4cGVyaWVuY2UgYnV0IHdobyBpcwo+
Pj4gdW5kZXIgY29udHJhY3QpIGV2ZW4gaWYgeW91IHdhbnRlZCB0byBjb250cmlidXRlIHRvIGEg
c2luZ2xlIGdsb2JhbAo+Pj4gc3BlYywgeW91IGNhbid0Lgo+Pj4KPj4+IMKgdGhlIHJlYXNvbnMg
d2h5IHRoZSBJVFUtc3R5bGUgQ2FydGVsIHdhcyBzZXQgdXAgaGF2ZSBiZWVuIGRpc2N1c3NlZAo+
Pj4gYW5kIG1hZGUgY2xlYXIgKHBhdGVudHMpOyB0aGUganVzdGlmaWNhdGlvbnMgd2VyZSBrbm9j
a2VkIGRvd247IHRoZXJlCj4+PiB3YXMgbm8gcmVzcG9uc2UuCj4+Cj4+IEkgY2FuIHNlZSB3aHkg
eW91IHdhbnQgdG8gaGF2ZSBhIHByb2Nlc3MgbGlrZSB0aGF0IGluIHBsYWNlIGZvciB0aGUgSVNB
Cj4+IGl0c2VsZiwgYnV0IHRoZSBTQkkgc3BlYyByZWFsbHkgc2hvdWxkIG5vdCBoYXZlIGFueXRo
aW5nICJpbm5vdmF0aXZlIiBvcgo+PiBwYXRlbnRhYmxlLiBBdCB0aGUgZW5kIG9mIHRoZSBkYXks
IGl0J3MgYSBjb21tdW5pY2F0aW9uIG1lY2hhbmlzbS4KPj4KPj4KPj4gQWxleAo+IAo+IEZZSQo+
IGh0dHBzOi8vZm9zZGVtLm9yZy8yMDE5L3NjaGVkdWxlL2V2ZW50L3Jpc2N2c2JpLwoKVGhhdCBv
bmUgaXMgb3ZlcmxhcHBpbmcgd2l0aCBvbiBJIHdpbGwgYmUgY28tcHJlc2VudGluZyBvbjoKCiAg
aHR0cHM6Ly9mb3NkZW0ub3JnLzIwMTkvc2NoZWR1bGUvZXZlbnQvdWVmaV9ib290X2Zvcl9tZXJl
X21vcnRhbHMvCgpCdXQgSSdtIHN1cmUgd2UgY2FuIGRpc2N1c3MgdGhpbmdzIHJlZ2FyZGxlc3Mg
b25lIHdheSBvciBhbm90aGVyIDopLgoKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
