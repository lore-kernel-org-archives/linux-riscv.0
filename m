Return-Path: <SRS0=sGlk=O2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF61C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 13:00:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3108520656
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 13:00:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8XEf9V/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3108520656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z/T0bjiRIBFOAEF+cknVP28QC8P8Mf/C4DLp8Ol4ci0=; b=f8XEf9V/sQoPXaOCmjs/cWtxD
	ZdujA4cAyAwa1L4ViMvM4n8VC8IsNQab6lryntuorqLO92Fk7GcKFpaSgE5VEktZDZvYVza4+ansL
	DQ/Xnz2Apw8wTrFlQJopP2eaxz+t7SlE4OR6KL+MPBrDWnpwoq2ZAd1t5LA/HFiUVGSjmTdEbk/XT
	rHFGQY2303BZQiCp6Auflsxg3yrL99GFJ8VTDsicwAjf7QfiQqPtLHKnwwWXW2i9Lz/A97tlVMOCg
	Q6NGngrh5VTM9d+RALPGbkSug7E0u/tCjr9kP8IwpyTswGIxK3cNFVtUglzjHlNmhKSwof8Jdg13u
	oNz5xxDIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYsVJ-0007LF-46; Mon, 17 Dec 2018 13:00:13 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYsVF-00065n-SA
 for linux-riscv@lists.infradead.org; Mon, 17 Dec 2018 13:00:11 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 wBHCxL05031742; Mon, 17 Dec 2018 12:59:23 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-fc-5c179da8b528
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 23.FB.09052.8AD971C5; Mon, 17 Dec 2018 14:59:21 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wBHCxJsv024045; Mon, 17 Dec 2018 14:59:19 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Mon, 17 Dec 2018 14:59:19 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH] RISC-V: Make BSS section as the last section in
 vmlinux.lds.S
Organization: FORTH
In-Reply-To: <CAAhSdy1danjgviJ2WGGEANQXFkzZzXUdCj+04dZ4eLjcVOt14A@mail.gmail.com>
References: <20181126060802.19314-1-anup@brainfault.org>
 <CAAhSdy1danjgviJ2WGGEANQXFkzZzXUdCj+04dZ4eLjcVOt14A@mail.gmail.com>
Message-ID: <587bbe80f25203e6122dfcc0eadba50b@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsXSHc2orLtyrniMQdsiVouWD+9YLbb+nsVu
 sWjFdxaL0xMWMVlc3jWHzWLb5xY2i80TFrA6sHtM/X2GxeNwxxd2j80rtDw2L6n3uNR8nd3j
 8yY5j/YD3UwB7FFcNimpOZllqUX6dglcGXc3nGMt6Bes2PtsIUsDYy9vFyMnh4SAiURbewNr
 FyMXh5DAEUaJ+XM3s0M4hxgl5syaxAhRZSoxe28nmM0rIChxcuYTFhCbWcBCYuqV/YwQtrxE
 89bZzCA2i4CqRP+8lWwgNpuApsT8SwfB6kUEVCSePz0HVT+VSaL1gm0XIweHsECIxMM1YGF+
 AWGJT3cvsoKEOQUCJe5u1QQJCwnUS/ze8Y0V4gIXiamLHkNdpiLx4fcDdhBbVEBZ4sWJ6awT
 GIVmITl0FpJDZyE5dAEj8ypGgcQyY73M5GK9tPyikgy99KJNjODImOu7g/HcAvtDjAIcjEo8
 vJr7xWKEWBPLiitzgcHCwawkwttrCRTiTUmsrEotyo8vKs1JLT7EKM3BoiTOe/hFeJCQQHpi
 SWp2ampBahFMlomDU6qBMZ6Jz05C29xv8xqvZ//0rfk/e/RNn5KT9GrGZ/GPF87cFs6TiBS7
 ZRZa9NDkUMW5xd1TUs5Lsz0tzNQROVX75eXhJnsry8Wpv00jlU8eEDoWuiirl4PLeVLRsqnL
 nz2YGdkvtOnBudiPu45MPTLxvFzX/qUXOnfFtKko85U7b67bZ7/Rt1PjoxJLcUaioRZzUXEi
 AGJkZLCIAgAA
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Mon, 17 Dec 2018 12:59:23 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Mon, 17 Dec 2018 12:59:23 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181217_050010_281115_ED0DDBD7 
X-CRM114-Status: GOOD (  12.04  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOC0xMi0xNyAxMTozNiwgQW51cCBQYXRlbCDOrc6zz4HOsc+IzrU6Cj4gT24g
TW9uLCBOb3YgMjYsIDIwMTggYXQgMTE6NDIgQU0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4gCj4gd3JvdGU6Cj4+IAo+PiBUaGUgb2JqY29weSBvbmx5IGVtaXRzIGxvYWRhYmxlIHNl
Y3Rpb25zIHdoZW4gY3JlYXRpbmcgZmxhdCBrZXJuZWwKPj4gSW1hZ2UuIFRvIGhhdmUgbWluaW1h
bCBwb3NzaWJsZSBzaXplIG9mIGZsYXQga2VybmVsIEltYWdlLCB3ZSBzaG91bGQKPj4gaGF2ZSBh
bGwgbm9uLWxvYWRhYmxlIHNlY3Rpb25zIGFmdGVyIGxvYWRhYmxlIHNlY3Rpb25zLgo+PiAKPj4g
Q3VycmVudGx5LCBleGVjcHRpb24gdGFibGUgc2VjdGlvbiAobG9hZGFibGUgc2VjdGlvbikgaXMg
YWZ0ZXIgQlNTCj4+IHNlY3Rpb24gKG5vbi1sb2FkYWJsZSBzZWN0aW9uKSBpbiB0aGUgUklTQy1W
IHZtbGludXgubGRzLlMuIFRoaXMKPj4gaXMgbm90IG9wdGltYWwgZm9yIGhhdmluZyBtaW5pbWFs
IGZsYXQga2VybmVsIEltYWdlIHNpemUgaGVuY2UgdGhpcwo+PiBwYXRjaCBtYWtlcyBCU1Mgc2Vj
dGlvbiBhcyB0aGUgbGFzdCBzZWN0aW9uIGluIFJJU0MtViB2bWxpbnV4Lmxkcy5TLgo+PiAKPj4g
SW4gYWRkaXRpb24sIHdlIG1ha2UgQlNTIHNlY3Rpb24gYWxpZ25lZCB0byAxNmJ5dGUgaW5zdGVh
ZCBvZiBQQUdFCj4+IGFsaWduZWQgd2hpY2ggZnVydGhlciByZWR1Y2VzIGZsYXQga2VybmVsIElt
YWdlIHNpemUgYnkgZmV3IEtCcy4KPj4gCj4+IFRoZSBmbGF0IGtlcm5lbCBJbWFnZSBzaXplIG9m
IExpbnV4LTQuMjAtcmM0IHVzaW5nIEdDQyA4LjIuMCBpcwo+PiA4ODE5OTgwIGJ5dGVzIHdpdGgg
Y3VycmVudCBSSVNDLVYgdm1saW51eC5sZHMuUyBhbmQgaXQgcmVkdWNlcyB0bwo+PiA3OTkxNzQw
IGJ5dGVzIHdpdGggdGhpcyBwYXRjaCBhcHBsaWVkIHVzaW5nIEdDQyA4LjIuMC4gSW4gc3VtbWFy
eSwKPj4gdGhpcyBwYXRjaCByZWR1Y2VzIExpbnV4LTQuMjAtcmM0IGZsYXQga2VybmVsIEltYWdl
IHNpemUgYnkgODA5IEtCLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cEBi
cmFpbmZhdWx0Lm9yZz4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC92bWxpbnV4Lmxkcy5T
IHwgNCArKy0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3ZtbGludXgubGRzLlMg
Cj4+IGIvYXJjaC9yaXNjdi9rZXJuZWwvdm1saW51eC5sZHMuUwo+PiBpbmRleCA2NWRmMWRmZGMz
MDMuLmNjOTllZWQ0NDkzMSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdm1saW51
eC5sZHMuUwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92bWxpbnV4Lmxkcy5TCj4+IEBAIC03
NCw4ICs3NCw2IEBAIFNFQ1RJT05TCj4+ICAgICAgICAgICAgICAgICAqKC5zYnNzKikKPj4gICAg
ICAgICB9Cj4+IAo+PiAtICAgICAgIEJTU19TRUNUSU9OKFBBR0VfU0laRSwgUEFHRV9TSVpFLCAw
KQo+PiAtCj4+ICAgICAgICAgRVhDRVBUSU9OX1RBQkxFKDB4MTApCj4+ICAgICAgICAgTk9URVMK
Pj4gCj4+IEBAIC04Myw2ICs4MSw4IEBAIFNFQ1RJT05TCj4+ICAgICAgICAgICAgICAgICAqKC5y
ZWwuZHluKikKPj4gICAgICAgICB9Cj4+IAo+PiArICAgICAgIEJTU19TRUNUSU9OKDB4MTAsIDB4
MTAsIDB4MTApCj4+ICsKPj4gICAgICAgICBfZW5kID0gLjsKPj4gCj4+ICAgICAgICAgU1RBQlNf
REVCVUcKPj4gLS0KPj4gMi4xNy4xCj4+IAo+IAo+IEhpIEFsbCwKPiAKPiBBbnkgY29tbWVudCBv
biB0aGlzIHBhdGNoPwo+IAo+IFJlZ2FyZHMsCj4gQW51cAo+IAoKSnVzdCBhIG5vdGUgb24gY29k
aW5nIHN0eWxlLCB5b3Ugc2hvdWxkIGJlIHVzaW5nIGEgbWFjcm8gaW5zdGVhZCBvZiAweDEwIApz
byB0aGF0IHRob3NlIHdobyByZWFkIHRoZSBjb2RlIGNhbiB1bmRlcnN0YW5kIHdoYXQgaXQgaXMg
YW5kIGFsc28gYSBmZXcgCmNvbW1lbnRzIHNpbmNlIHNlYXJjaGluZyB0aHJvdWdoIHRoZSBjb21t
aXQgbG9ncyB0byB1bmRlcnN0YW5kIHdoeSB5b3UgCnVzZWQgaXQgaXNuJ3Qgb3B0aW1hbC4KClJl
Z2FyZHMsCk5pY2sKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
