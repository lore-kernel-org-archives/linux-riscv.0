Return-Path: <SRS0=4NHM=NW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95AEC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 11 Nov 2018 03:17:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51AC520892
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 11 Nov 2018 03:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dweR870V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HGuIawFH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51AC520892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X+I7PPzqp2OFhO3oT6CNj8VlAIXarQoRWG+rXTx5/zg=; b=dweR870VfFJDeuD1BnVJMX5vu
	rZor3mVCrmb8wBrhvVcw1WKGiZUBDWFV+j4zqO9PsRM6TAJVAPQoI2yx9xuYufgLuf2tvlViEDXh/
	oy3dOGky7+YNTIHUn1ZadKjdDoLNYWxItV7pITLPm+f6evctcOp9OiBKBdGT2bilERR1zEJhEaHFt
	OnBPa4tvpcaK9e25vCXKesQ+R+ZHovZ8rAiKmzbtiyjX2RWaM8+NnBYcj9rCxp8VoX7LqBB+qJ9xm
	LYPO8uHP99xsc05z0ezthtU2OJ27oKOuFGsP88XD+Ye5jY5CzOZ3aqvLbSZoPmlatJnOJrrVOQovI
	F1Iho9Ndw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLgFP-0005JJ-01; Sun, 11 Nov 2018 03:17:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLgFN-0005JC-0K
 for linux-riscv@bombadil.infradead.org; Sun, 11 Nov 2018 03:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k8gZaZIau5dWFPvVQgXomj3l4xyiwpr2EvVocuVvcwk=; b=HGuIawFHDs4GXDKmB63NU22yNg
 VDXqmDMPIYiaDhdzAQkqyfa6v06F6VY67V6rFFZqzvX9LqngciusN3V8KCgh55/mqBpHXhH8aRlp2
 9wUh89T2Py6XJfhSqQdmE+eli3qiyXbFrr9ax+2y7Nm4/+aiXaFRKzxdd3kshV1r3SvITt5K4QUsv
 mUk1/V3q83DrFr0TORqbTMFb7i3IEKhCTHItB96zTmB6l6Qe4fNm01Y0xf/uEVH8Q46rzl8MC29iw
 5HHwJEIQgOjWb6fAEQ8MtSk2MPLh4GF5hD96xNVlE+KKm7bZ99XWE0FzxZ4NYnY6B4e2KrA1NjYUb
 UbloOeGQ==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLgFJ-00048Y-NM
 for linux-riscv@lists.infradead.org; Sun, 11 Nov 2018 03:17:11 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAB3FJbb061737; Sun, 11 Nov 2018 05:15:21 +0200 (EET)
X-AuditID: 8b5b9d4d-903ff70000000e62-de-5be79ec61968
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 3D.DD.03682.6CE97EB5; Sun, 11 Nov 2018 05:15:18 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wAB3FEnp009803; Sun, 11 Nov 2018 05:15:14 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sun, 11 Nov 2018 05:15:14 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Subject: Re: [sw-dev] SBI extension proposal v2
Organization: FORTH
In-Reply-To: <CAPweEDxzkNTGKbitReqUqpsybF3ZAZSL4StVjxfkB956gYSPcw@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
 <84838217ee26d70634368ef63d43427d@mailhost.ics.forth.gr>
 <CAPweEDxzkNTGKbitReqUqpsybF3ZAZSL4StVjxfkB956gYSPcw@mail.gmail.com>
Message-ID: <ee0d847efd9d9d4bc1a54e4474d9bf0c@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsXSHc2orHts3vNog+2HFCwe9txhsjhx5R+j
 xbYlq1ktdu5+wWqx5XaMRcuHd6wWi1Z8Z7Fobf/GZHF6wiImi22fW9gsTr9ZwGSx9PpFJovm
 d+fYLXZ23WG1OHX9M5vF5gkLWC3aZvFbbDqYZrH9RT+bxfOVvWwOIh57Ts9i9lgzbw2jx9Tf
 Z1g8ds66y+4x89VDJo9duxrZPR5uusTksXmFlsfmJfUeV040sXq8v/6bzeNS83V2j82nqz3a
 D3QzBfBFcdmkpOZklqUW6dslcGWc27iCuWCCVMWWP7OYGxh3iHQxcnJICJhIND3bygZiCwkc
 ZpSYuzq9i5ELyD7EKPFl43Z2iCJTidl7OxlBbF4BQYmTM5+wgNjMAhYSU6/sZ4Sw5SWat85m
 BrFZBFQlfjxaAzaUTUBTYv6lg0D1HBwiAgYS3c8DQeYzC7xikXi3fyVYvbCAvsSUz4dYQWx+
 AWGJT3cvgtmcAoES1x8fY4c46BaLxPEr79kgjnCR+Lf2I9RxKhIffj8As0UFlCVenJjOOoFR
 aBaSW2chuXUWklsXMDKvYhRILDPWy0wu1kvLLyrJ0Esv2sQIju+5vjsYzy2wP8QowMGoxMO7
 Qet5tBBrYllxZS4wZDiYlUR4Zbc8jRbiTUmsrEotyo8vKs1JLT7EKM3BoiTOe/hFeJCQQHpi
 SWp2ampBahFMlomDU6qBcVr2pJ7VFvfNp5l4cl69uT1+IiNjho6Lvh7/X91jlwK/NM4Mbjui
 w5SudaX7RKi1fLDEsef8iZPdJbTT5+xqsz34QZxxi+Eq79+vL295Jheaa1a+XKdv0Wpth0a9
 f+rLrDhfbTh1uuR4SY0Ch7r6wudHs2V0vTmWzb6cct9lzqaIj0mH/ls/V2Ipzkg01GIuKk4E
 AFrFU9XrAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181111_031709_949966_D47131C1 
X-CRM114-Status: GOOD (  25.72  )
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
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, atish.patra@wdc.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, Olof Johansson <olof@lixom.net>,
 ron minnich <rminnich@gmail.com>, sw-dev@groups.riscv.org,
 paul.walmsley@sifive.com, mick@ics.forth.gr, Alistair.Francis@wdc.com,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181111031514.Zj5OZ0q1cfdFwnyBhv5bk09ZwR45UffoOpq0L6QAvpI@z>

zqPPhM65z4IgMjAxOC0xMS0xMCAyMTozOSwgTHVrZSBLZW5uZXRoIENhc3NvbiBMZWlnaHRvbiDO
rc6zz4HOsc+IzrU6Cj4gLS0tCj4gY3Jvd2QtZnVuZGVkIGVjby1jb25zY2lvdXMgaGFyZHdhcmU6
IGh0dHBzOi8vd3d3LmNyb3dkc3VwcGx5LmNvbS9lb21hNjgKPiAKPiBPbiBTYXQsIE5vdiAxMCwg
MjAxOCBhdCA1OjU5IFBNIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+IAo+IHdy
b3RlOgo+PiAKPj4gzqPPhM65z4IgMjAxOC0xMS0xMCAxOTo0NywgTHVrZSBLZW5uZXRoIENhc3Nv
biBMZWlnaHRvbiDOrc6zz4HOsc+IzrU6Cj4+ID4gT24gU2F0LCBOb3YgMTAsIDIwMTggYXQgNTo0
MiBQTSBPbG9mIEpvaGFuc3NvbiA8b2xvZkBsaXhvbS5uZXQ+IHdyb3RlOgo+PiA+Cj4+ID4+IFRo
ZSBjYXNlIG9mIGNvbnNvbGUgaXMgaW4gdGhpcyBjYXNlIHByZXR0eSBzaW1wbGU6IEl0J3MgaW50
ZW5kZWQgZm9yCj4+ID4+IGVhcmx5IGJvb3QgZm9yIHZlcnkgc2ltcGxpc3RpYyBlbnZpcm9ubWVu
dHMgKGJlZm9yZSB0aGUgcmVzdCBvZiB0aGUKPj4gPj4ga2VybmVsIGlzIHVwLCBldGMpLiBLZWVw
aW5nIHRoZSBTQkkgY29uc29sZSBhcm91bmQgYmV5b25kIGVhcmx5IGJvb3QsCj4+ID4+IGFuZCBz
b21laG93IHRyeWluZyB0byBvcHRpbWl6ZSBmb3IgaXQgZm9yIHRob3NlIHVzZSBjYXNlcyBpcyBh
Cj4+ID4+IG1pc2RpcmVjdGVkIGVmZm9ydDsgdGhhdCdzIHdoYXQgbmF0aXZlIGRyaXZlcnMgYXJl
IGZvci4KPj4gPgo+PiA+ICBzcGlrZSAod2hpY2ggaXMgb25seSBhcm91bmQgNywwMDAgbGluZXMg
b2YgY29kZSkgZG9lc24ndCBoYXZlIG5hdGl2ZQo+PiA+IGRyaXZlcnMsIGFuZCBxZW11IGlzIHRv
byBoZWF2eS1kdXR5IHRvIGNvbnNpZGVyIGFkZGluZyBjdXN0b20KPj4gPiBleHRlbnNpb25zIGFu
ZCBleHBlcmltZW50YWwgcmVzZWFyY2ggb250by4KPj4gPgo+PiA+ICB3aXRoIG5vdGhpbmcgaW4g
c3Bpa2UgKm90aGVyKiB0aGFuIHRoZSBzZXJpYWwgY29uc29sZSwgaXQncyB0aGUgb25seQo+PiA+
IHdheSBpbiBhbmQgb3V0Lgo+PiA+Cj4+ID4gIGwuCj4+IAo+PiBBbnl0aGluZyBtb3JlIHRoYW4g
YSBtYWluL2RlYnVnIGNvbnNvbGUgaXMgdG9vIG11Y2ggZm9yIHRoZSBTQkksIGl0cwo+PiBnb2Fs
IGlzIHRvIGJlIHVzZWQgZWFybHkgb24gaW4gdGhlIGJvb3QgcHJvY2VzcyB1bnRpbCB0aGUgT1Mg
b3IgdGhlCj4+IGJhcmUgbWV0YWwgYXBwIHRha2VzIGNvbnRyb2wuCj4gCj4gIG5vb28sIHRoYXQn
cyBqdXN0IF9vbmVfIHVzZSB0byB3aGljaCBpdCdzIGJlaW5nIHB1dC4KPiAKPj4gSGF2aW5nIG11
bHRpcGxlIHNlcmlhbCBsaW5lcyB0aHJvdWdoCj4+IHRoZSBTQkkgZm9yIHRoaW5ncyBsaWtlIFBQ
UCwgVVBTLCB2aXJ0dWFsIGNvbnNvbGVzIGFuZCBhbGwgdGhlIHN0dWZmCj4+IHlvdSBtZW50aW9u
ZWQgaXMgb3V0IG9mIHNjb3BlLgo+IAo+ICB3aHk/Cj4gCgpCZWNhdXNlIHRoZSBmaXJtd2FyZSBp
cyBtZWFudCB0byBiZSBzb21ldGhpbmcgbWluaW1hbCwgbm90IHRvIHJlcGxhY2UgCnRoZQpPUy4g
TGV0IG1lIGFzayB5b3UgdGhpcywgaWYgeW91IHdhbnQgdG8gY2hhbmdlIFVBUlQgc3BlZWQgb3Ig
c2V0dGluZ3MgaW4KZ2VuZXJhbCB3b3VsZCB5b3UgYWxzbyBhc2sgZm9yIGFuIFNCSSBjYWxsIGZv
ciB0aGF0ID8gV2hhdCdzIGNvbWluZyB1cApuZXh0ID8gQWRkaW5nIG5ldHdvcmtpbmcgc3VwcG9y
dCBmb3IgZXhhbXBsZSA/IFdoZXJlIGRvIHlvdSBwdXQgdGhlIApiYXJyaWVyCm9uIGZpcm13YXJl
J3MgY29tcGxleGl0eSAvIHNjb3BlID8KCj4+IEJvb3QgYW4gT1MgYW5kIHVzZSB0aGUgc3RhbmRh
cmQgVUFSVAo+PiBkcml2ZXJzIGZvciBhY2Nlc3NpbmcgdGhlIHNlcmlhbCBsaW5lcy4gSWYgdGhl
cmUgYXJlIG5vIGRyaXZlcnMKPj4gb3Igc3VwcG9ydCBvbiBzcGlrZSwgaXQncyBvcGVuIHNvdXJj
ZSAhCj4gCj4gIHRoaXMgaXMgYSBjb21tb24gbWlzY29uY2VwdGlvbiB0aGF0ICJiZWNhdXNlIGl0
J3Mgb3BlbiBzb3VyY2UgYW55b25lCj4gY2FuIGRvIHdoYXQgdGhleSB3YW50Ii4gIGNvZGUgY29z
dHMgbW9uZXkuICBzZXJ2ZXJzIHRvIGhvc3QgY29kZSBjb3N0Cj4gbW9uZXkuICBhbnN3ZXJpbmcg
dGhlIGVtYWlscyB3aGVyZSBwZW9wbGUgZXhwZWN0ICJmcmVlIiBzdXBwb3J0Cj4gYmVjYXVzZSB5
b3UncmUgaG9zdGluZyB0aGUgb25seSBwdWJsaWMgdmVyc2lvbiBvZiB0aGF0IHNlcnZlciBjb3N0
cwo+IG1vbmV5Lgo+IAoKRXZlbiBpZiB3ZSBkZWNpZGUgdGhhdCB0aGUgU0JJIGdldHMgZXh0ZW5k
ZWQgZm9yIGFjY2Vzc2luZyBkaWZmZXJlbnQKc2VyaWFsIGxpbmVzLCBzb21lb25lIHdpbGwgaGF2
ZSB0byB3cml0ZSBjb2RlIGZvciB0aGF0IGUuZy4gb24gQkJMIG9yIG9uCk9wZW5TQkksIGNvcmVi
b290IGV0Yy4gSWYgd2UgZm9sbG93IHlvdXIgbG9naWMsIG1haW50YWluaW5nLCBob3N0aW5nCmFu
ZCBzdXBwb3J0aW5nIHRoaXMgYWxzbyBjb3N0cyBtb25leS4gU28gd2hhdCdzIHRoZSBwb2ludCBo
ZXJlID8gVGhhdAppdCdzIGVhc2llciB0byBpbXBsZW1lbnQgaXQgdGhlcmUgZm9yIGV2ZXJ5b25l
IHRoYW4gd3JpdGUgYSBVQVJUIGRyaXZlcgpmb3Igc3Bpa2UgPwoKQnkgdGhlIHdheSBzcGlrZSBp
cyBhbiBJU0Egc2ltdWxhdG9yLCBJIGRvbid0IHNlZSB3aHkgaXQgc2hvdWxkIGVtdWxhdGUKVUFS
VCBwb3J0cywgbGFzdCB0aW1lIEkgY2hlY2tlZCBpdCBkaWRuJ3QsIHNvIHNvbWVvbmUgd2lsbCBu
ZWVkIHRvIHdyaXRlCmNvZGUgZm9yIHRoYXQsIG1vcmUgbW9uZXkgISBZb3UgY2FuIHVzZSBRRU1V
IGZvciB0aGF0IHdoZXJlIHlvdSBjYW4gaGF2ZQphcyBtYW55IFVBUlRzIGFzIHlvdSB3YW50IGFu
ZCB0aGUgZHJpdmVycyBmb3IgdGhlbSBhcmUgYWxyZWFkeSBhdmFpbGFibGUKZm9yIHlvdS4KCj4g
IGknbSBhbiBldGhpY2FsIGxpYnJlIGRldmVsb3BlcjogaSBjYW4ndCBnbyBmb290aW5nIHRoZSBi
aWxsIGZvciBvdGhlcgo+IHBlb3BsZSB0byBzcG9uZ2Ugb2ZmIG15IGVmZm9ydHMgYWxsIHRoZSB0
aW1lLCBpJ3ZlIGhhZCAyMCB5ZWFycyBvZgo+IHBlb3BsZSBkb2luZyB0aGF0IGFuZCBpJ20gZioq
KioqZyB3ZWxsIG5vdCBwdXR0aW5nIHVwIHdpdGggaXQgb24gdGhpcwo+IHByb2plY3QuCj4gCj4g
IHNvIG5vLCBtaWNrLCBzb3JyeSwgbm90IGJ1eWluZyB0aGUgYXJndW1lbnQgIml0J3Mgb3BlbiBz
b3VyY2UiLgo+IAo+IGwuCgpEb24ndCBhc3N1bWUgeW91IGFyZSB0aGUgb25seSBvbmUuCgpSZWdh
cmRzLApOaWNrCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
