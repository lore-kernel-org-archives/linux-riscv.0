Return-Path: <SRS0=/DNs=NT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82109ECDE47
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 16:48:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55DC0206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 16:48:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mC6hKs3t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DJEw5wmV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55DC0206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJ4fV3qtVhqVKsq80sdta6cgFXoFKyXWD6R9dDIhABo=; b=mC6hKs3tKM+Smk
	l21ebzmkolg406lC07+XTIDn4vdkU8iIVic8Z7EqbpuMO9KnvGOHEUTC+m7Im8TQUb4YYiWxnYw60
	NnAfGpqPdYfjGnKZfUL0kEfmiXt6xtosDKyspE+46ivvEfPq/NIiz0Ygvv8EIqLO74HiQsDgeVOVb
	AcebgS6Hqn9uoKGxeGnJB8mrXFPNxkNT7EG8J+H808fNpals/siVJLzuw1h8nLtSnjg/MdKzDz4gn
	cDQ5MbUnmxcnWk/9FQ3X5M8eGeiaoW8WX7rwBTaOAV1aCPqblg0cySTbWkEXjoZpDddGTPYI4c5ju
	n9G6i7TbRLPzSKkbWuwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKnUA-0001iq-CJ; Thu, 08 Nov 2018 16:48:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKnU8-0001iS-0M
 for linux-riscv@bombadil.infradead.org; Thu, 08 Nov 2018 16:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oVOlJK+BQhSBpRBaZS4mg5GSOIQHQU8baEOq0OQGBmg=; b=DJEw5wmVMFo0rqVctLAgA3oW8k
 KggyW3UaCEQGu9tbT7AoKcHLSAdtqkm3ZjoQtB2lS3gvZs/k/k6pLRzv6KxWh4EnCqWZhlISacnwA
 EpS+zyqUrqBDyfKCLES2E51tWq2gWqjjRf2X8NaOgrOAI+86NYS7X1V4v1Lj870nJk5AUJWXCe63G
 jRlSEzCmP4Hr8CGX2pJvwEBY/0GWbRuzuVpcTPyFrprFKDcntbRzlTPl/xWxrqL7ztsgZbC0qzZca
 /SkafylU9BvJlFBOQCttTD2PaPof356CIZRrBQhuS6H1rTJnt2jEIic52vRqLgVA0fOY1EsKba8yY
 eed6GQZw==;
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKnU4-00027d-Jh
 for linux-riscv@lists.infradead.org; Thu, 08 Nov 2018 16:48:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C8E580D;
 Thu,  8 Nov 2018 08:48:32 -0800 (PST)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D52843F5CF;
 Thu,  8 Nov 2018 08:48:29 -0800 (PST)
Date: Thu, 8 Nov 2018 16:48:27 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [RFC 0/2] Add RISC-V cpu topology
Message-ID: <20181108164827.GB10953@e107155-lin>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
 <20181106141331.GA28458@e107155-lin>
 <969fc2a5198984e0dfe8c3f585dc65f9@mailhost.ics.forth.gr>
 <20181106162051.w7fyweuxrl7ujzuz@lakrids.cambridge.arm.com>
 <abcae019e6ae749b17ecb0c721fd3177@mailhost.ics.forth.gr>
 <20181107122803.GA8433@e107155-lin>
 <d04779705c47b59b94300365e805dbd3@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d04779705c47b59b94300365e805dbd3@mailhost.ics.forth.gr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181108_164844_936565_7F2BAE25 
X-CRM114-Status: GOOD (  47.15  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Damien.LeMoal@wdc.com, alankao@andestech.com, hch@infradead.org,
 anup@brainfault.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 zong@andestech.com, Atish Patra <atish.patra@wdc.com>, robh+dt@kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>, linux-riscv@lists.infradead.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181108164827.BWFngwXAA_az24Q7yFk9268EbiqlL5IepcGquJcw0Os@z>

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDQ6NTI6MzBQTSArMDIwMCwgTmljayBLb3NzaWZpZGlz
IHdyb3RlOgo+IM6jz4TOuc+CIDIwMTgtMTEtMDcgMTQ6MjgsIFN1ZGVlcCBIb2xsYSDOrc6zz4HO
sc+IzrU6Cj4gPgo+ID4gSSBhZ3JlZSwgYnV0IHdlIGhhdmUga2VybmVsIGNvZGUgdXNpbmcgaXQo
YXJtNjQva2VybmVsL3RvcG9sb2d5LmMpLiBJdCdzCj4gPiB0b28gbGF0ZSB0byByZW1vdmUgaXQu
IEJ1dCB3ZSBjYW4gYWx3YXlzIGtlZXAgdG8gb3B0aW9uYWwgaWYgd2UgbW92ZSB0aGUKPiA+IEFS
TTY0IGJpbmRpbmcgYXMgZ2VuZXJpYyB0byBzdGFydCB3aXRoIGFuZCBtYW5kYXRlIGl0IGZvciBv
bmx5IEFSTTY0Lgo+ID4KPgo+IFRoYXQncyBteSBwb2ludCBhcyB3ZWxsLCBpZiB3ZSBhcmUgZ29p
bmcgdG8gZGVmaW5lIHNvbWV0aGluZyB0byBiZSB1c2VkCj4gYnkgZXZlcnlib2R5IGFuZCBpbiB0
aGlzIGNhc2UsIGF0IGxlYXN0IGZvciBSSVNDLVYsIHRoZXJlIGlzIG5vIG5lZWQgdG8KPiBjYXJy
eSB0aGlzIGZyb20gdGhlIEFSTTY0IGJpbmRpbmcuCgpTdXJlLCB3aGF0ZXZlciB5b3UgZG9uJ3Qg
bmVlZCBpbiBSSVNDLVYgeW91IGNhbiBzZWUgaWYgdGhleSBjYW4gYmUgbWFkZQpvcHRpb25hbC4g
SSBkb24ndCB0aGluayB0aGF0IHNob3VsZCBiZSBhIHByb2JsZW0uCgo+IEl0IHNob3VsZG4ndCBi
ZSB0aGF0IGhhcmQgdG8gZml4IHRoaXMKPiBpbiB0aGUgZnV0dXJlIGZvciBBUk02NCBhcyB3ZWxs
LCB3ZSBtYXkgZ2l2ZSB0aGUgbmV3IG1hcHBpbmcgYW5vdGhlciBuYW1lLAo+IG1heWJlIGNwdS1t
YXAyIG9yIGNwdS10b3BvbG9neSB0byBzbG93bHkgbW92ZSB0byB0aGUgbmV3IG9uZS4KCk5vLCB3
ZSBoYXZlIGl0IGFuZCB3ZSB3aWxsIGNvbnRpbnVlIHRvIHN1cHBvcnQgaXQuIEl0J3Mgbm90IGJy
b2tlbiB0bwpmaXggb24gQVJNNjQuIFdoeSBkbyB5b3UgdGhpbmsgdGhhdCBpdCdzIGJyb2tlbiBv
biBBUk02NCA/Cgo+IENoYW5naW5nIHRoZQo+IGR0cyBmaWxlcyBzaG91bGRuJ3QgYmUgdGhpcyBo
YXJkLCB3ZSBjYW4gcHJvdmlkZSBhIHNjcmlwdCBmb3IgaXQuIFdlIGNhbgo+IGV2ZW4gY29udGFp
biBzb21lIGNvbXBhdGliaWxpdHkgY29kZSB0aGF0IGFsc28gdW5kZXJzdGFuZHMgPHRocmVhZD4g
bm9kZXMKPiBhbmQgZS5nLiBtZXJnZXMgdGhlbSB0b2dldGhlciBvbiBhIGNvcmUgbm9kZS4KPgoK
U3VyZSwgaGFuZyBvbiB0aGlzIGlkZWEgb2Ygc2NyaXB0aW5nLCB3ZSBjYW4gbWFrZSBhIGJldHRl
ciB1c2Ugb2YgaXQuCkRldGFpbHMgbGF0ZXIgZnVydGhlciBpbiB0aGUgbWFpbC4KClsuLi5dCgo+
ID4gPiBUaGUgc2FtZSBhbHNvIGhhcHBlbnMgd2l0aCB0aGUgZ2VuZXJpYyBudW1hIGJpbmRpbmcg
b24KPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL251bWEudHh0Cj4gPiA+
IHdoaWNoIHNheXMgd2Ugc2hvdWxkIGFkZCB0aGUgbnVuYS1ub2RlLWlkIG9uIGVhY2ggb2YgdGhl
IGNwdSBub2Rlcy4KPiA+ID4KPiA+Cj4gPiBZZXMsIGJ1dCBhZ2FpbiB3aGF0J3MgdGhlIHByb2Js
ZW0gPwo+ID4KPgo+IFRoZXJlIGlzIG5vIHByb2JsZW0gd2l0aCB0aGUgYWJvdmUgYmluZGluZ3Ms
IHRoZSBwcm9ibGVtIGlzIHRoYXQgd2UgaGF2ZQo+IHRvIHB1dCB0aGVtIG9uIGVhY2ggY3B1IG5v
ZGUgd2hpY2ggaXMgbWVzc3kuIFdlIGNvdWxkIGluc3RlYWQgcHV0IHRoZW0KPiAob3B0aW9uYWxs
eSkgb24gdGhlIHZhcmlvdXMgZ3JvdXBpbmdzIHVzZWQgb24gY3B1LW1hcC4gVGhpcyB3b3VsZCBh
bGxvdwo+IGNwdS1tYXAgdG8gYmUgbW9yZSBzcGVjaWZpYyBvZiB3aGF0IGlzIHNoYXJlZCBhY3Jv
c3MgdGhlIG1lbWJlcnMgb2YgZWFjaAo+IGdyb3VwIChjb3JlL2NsdXN0ZXIvd2hhdGV2ZXIpLgo+
CgpJIHRoaW5rIE1hcmsgaGFzIGFscmVhZHkgZXhwbGFpbiB3aHkvaG93IGdlbmVyaWMgYmluZGlu
Z3MgYXJlIHVzZWZ1bC4KSWYgeW91IHN0aWxsIGhhdmUgY29uY2VybnMsIHRha2UgaXQgdXAgc2Vw
YXJhdGVseSBhbmQgc2VlIGhvdyB5b3UgY2FuCmJ1aWxkICpwZXJmZWN0KiBiaW5kaW5ncyBmb3Ig
UklTQy1WIHRvIGF2b2lkIGFueSBsZWdhY3kgYmFnZ2FnZS4KCldlIGhhdmUgcmVhc29ucyB3aHkg
d2UgY2FuJ3QgYXNzdW1lIGluZm9ybWF0aW9uIGFib3V0IGNhY2hlIG9yIHBvd2VyCmRvbWFpbiB0
b3BvbG9neSBmcm9tIENQVSB0b3BvbG9neS4gSSBoYXZlIHN1bW1hcmlzZWQgdGhlbSBhbHJlYWR5
IGFuZAp3ZSBhcmUgbm90IGRpc2N1c3NpbmcuIFRoZXJlIG1heSBub3QgYmUgcGVyZmVjdCBiaW5k
aW5ncyBidXQgdGhlcmUgYXJlCmFscmVhZHkgc3VwcG9ydGVkIGFuZCBub3RoaW5nIGlzIGJyb2tl
biBoZXJlIHRvIGZpeC4gRFQgYmluZGluZ3MgYXJlCipub3QqIHNhbWUgYXMgY29kZSB0byBmaXgg
aXQgd2l0aCBhIHBhdGNoIHRvIHRoZSBiaW5kaW5ncyB0aGVtc2VsdmVzLgpPbmNlIGFncmVlZCBh
bmQgbWVyZ2VkLCB0aGV5IG5lZWQgdG8gYmUgdHJlYXRlZCBsaWtlIHVzZXIgQUJJLgoKPiBBcyBJ
IHdyb3RlIG9uIG15IGFuc3dlciB0byBNYXJrIHByZXZpb3VzbHksIHRoZSBiaW5kaW5ncyBmb3Ig
aW5mZXJpbmcKPiB0aGUgY2FjaGUgdG9wb2xvZ3ksIG51bWEgdG9wb2xvZ3ksIHBvd2VyIGRvbWFp
biB0b3BvbG9neSBldGMgYXJlIGFscmVhZHkKPiB0aGVyZSwgdGhleSBhcmUgaW4gdGhlIGRldmlj
ZXQgdHJlZSBzcGVjIGFuZCBwcm92aWRlIHZlcnkgc3BlY2lmaWMKPiBpbmZvcm1hdGlvbnMgd2Ug
Y2FuIHVzZS4gTXVjaCAic3Ryb25nZXIiIGhpbnRzIG9mIHdoYXQncyBnb2luZyBvbiBhdAo+IHRo
ZSBodyBsZXZlbC4gVGhlIGNwdS1tYXAgZG9lc24ndCBwcm92aWRlIHN1Y2ggaW5mb3JtYXRpb24s
IGl0IGp1c3QKPiBwcm92aWRlcyBhIHZpZXcgb2YgaG93IHRoZSB2YXJpb3VzIGhhcnRzL3RocmVh
ZHMgYXJlICJwYWNrZWQiIG9uIHRoZSBjaGlwLAo+IG5vdCB3aGF0IHRoZXkgc2hhcmUgaW5zaWRl
IGVhY2ggbGV2ZWwgb2YgInBhY2tpbmciLiBJdCdzIHVzZWZ1bCBiZWNhdXNlCj4gaXQgc2F2ZXMg
cGVvcGxlIGZyb20gaGF2aW5nIHRvIGRlZmluZSBhIGJ1bmNoIG9mIGNhY2hlIG5vZGVzIGFuZCBk
ZXNjcmliZQo+IHRoZSBjYWNoZSBoaWVyYXJjaHkgb24gdGhlIGRldmljZSB0cmVlIHVzaW5nIHRo
ZSBzdGFuZGFyZCBzcGVjLgo+CgpBaCwgaGVyZSBjb21lcy4gSWYgeW91IHdhbnQgdG8gc2F2ZSBw
ZW9wbGUncyB0aW1lIG9yIHdoYXRldmVyLCB5b3UgY2FuIHVzZQp5b3VyIHNjcmlwdGluZyBtYWdp
YyB5b3UgaGF2ZSBtZW50aW9uZWQgYWJvdmUgdG8gZGVmaW5lIHRob3NlIGJ1bmNoIG9mIG5vZGVz
CnlvdSB3YW50IHRvIGF2b2lkLgoKPiBTbyBzaW5jZSBjcHUtbWFwIGlzIHRoZXJlIGZvciBjb252
ZW5pZW5jZSBsZXQncyBtYWtlIGl0IG1vcmUgY29udmVuaWVudCAhCj4gV2hhdCBJJ20gc2F5aW5n
IGlzIHRoYXQgY3B1LW1hcCBjb3VsZCBiZSBhIG1vcmUgY29tcGFjdCB3YXkgb2YgdXNpbmcgdGhl
Cj4gZXhpc3RpbmcgYmluZGluZ3MgZm9yIGFkZGluZyBwcm9wZXJ0aWVzIG9uIGdyb3VwcyBvZiBo
YXJ0cyBpbnN0ZWFkIG9mCj4gcHV0dGluZyB0aGVtIG9uIGVhY2ggaGFydCBpbmRpdmlkdWFsbHku
IEl0IHdpbGwgc2ltcGxpZnkgdGhlIHJlcHJlc2VudGF0aW9uCj4gYW5kIG1heSBhbHNvIG9wdGlt
aXplIHRoZSBpbXBsZW1lbnRhdGlvbiBhIGJpdCAod2UgbWF5IGdldCB0aGUgaW5mb3JtYXRpb24K
PiB3ZSBuZWVkIGZhc3RlcikuIEkgZG9uJ3Qgc2VlIGFueSBvdGhlciByZWFzb24gZm9yIHVzaW5n
IGNwdS1tYXAgb24gUklTQy1WCj4gb3IgZm9yIG1ha2luZyBpdCBnbG9iYWwgYWNyb3NzIGFyY2hz
Lgo+CgpTdXJlLCBJIGRvbid0IGhhdmUgc3Ryb25nIG9waW5pb25zIHRoZXJlLiBKdXN0IHN0b3Ag
bWVudGlvbmluZyB0aGF0IHRoaXMKaXMgdGhlIG9ubHkgc29sdXRpb24gYW5kIGFsbCBleGlzdGlu
ZyBvbmVzIGFyZSBicm9rZW4uIFRoZXkgYXJlIG5vdCBhbmQKbmVlZHMgdG8gYmUgc3VwcG9ydGVk
IHVudGlsIHRoZXkgYXJlIGV4cGxpY2l0bHkgZGVwcmVjYXRlZCwgYmVjb21lcwpvYnNvbGV0ZSBh
bmQgZmluYWxseSByZW1vdmVkLgoKWy4uLl0KCj4gPgo+ID4gV2h5IGFyZSB5b3Ugc28ga2VlbiBv
biBvcHRpbWlzaW5nIHRoZSByZXByZXNlbnRhdGlvbiA/Cj4gPiBJZiB5b3UgYXJlIHdvcnJpZWQg
YWJvdXQgbGFyZ2Ugc3lzdGVtcywgZ2VuZXJhdGUgb25lIGluc3RlYWQgb2YKPiA+IGhhbmRjcmFm
dGVkLgo+ID4KPgo+IEkgZG9uJ3Qgc2VlIGEgcmVhc29uIG5vdCB0byB0cnkgdG8gb3B0aW1pemUg
aXQsIHNpbmNlIHdlIGFyZSB0YWxraW5nCj4gYWJvdXQgYSBiaW5kaW5nIHRvIGJlIHVzZWQgYnkg
UklTQy1WIGFuZCBwb3RlbnRpYWxseSBldmVyeWJvZHksIEkgdGhpbmsKPiBpdCBtYWtlcyBzZW5z
IHRvIGltcHJvdmUgdXBvbiB3aGF0IHdlIGFscmVhZHkgaGF2ZS4KPgoKU3VyZSwgeW91IGNhbiBh
bHdheXMgdW5sZXNzIHlvdSBzdG9wIHRyZWF0aW5nIGV4aXN0aW5nIG9uZXMgYXJlIGJyb2tlbi4K
SSBoYXZlIGFscmVhZHkgdG9sZCBEVCBiaW5kaW5ncyBhcmUgbm90ICpub3JtYWwgY29kZSouIFlv
dSBjYW4ganVzdApyZXBsYWNlIGV4aXN0aW5nIG9uZXMgd2l0aCBuZXcgb3B0aW1pc2VkIG9uZXMu
IFlvdSBjYW4gb25seSBhZGQgdGhlIG5ldwooKm9wdGltaXNlZCopIG9uZXMgdG8gdGhlIGV4aXN0
aW5nIG9uZXMuIFlvdSAqbmVlZCogdG8gdW5kZXJzdGFuZCB0aGF0CmNvbmNlcHQgZmlyc3QsIG90
aGVyd2lzZSB0aGVyZSdzIG5vdCBwb2ludCBpbiB0aGlzIGVuZGxlc3MgZGlzY3Vzc2lvbgpJTU8u
CgpJIHdpbGwgc3RvcCBoZXJlIGFzIEkgd2lsbCBoYXZlIHRvIHJlcGVhdCB3aGF0ZXZlciBJIGhh
dmUgYWxyZWFkeQptZW50aW9uZWQgdG8gY29tbWVudCBvbiB5b3VyIGFyZ3VtZW50cyBiZWxvdy4K
CkluIHN1bW1hcnksIEkgYW0gbm90IGFnYWluc3QgaW1wcm92aW5nIHRoZSBiaW5kaW5ncyBpZiB5
b3UgdGhpbmsgaXQncwpwb3NzaWJsZSwgYnV0IEkgZG9uJ3Qgc2VlIGhvdyBpdCdzIG1vcmUgYmVu
ZWZpY2lhbGx5IGVzcGVjaWFsbHkgaWYgd2UKYXJlIGdvaW5nIHRvIHN1cHBvcnQgZXhpc3Rpbmcg
b25lcyBhbHNvLiBNYXJrIGhhcyBhbHJlYWR5IGdpdmVuIGFsbCB0aGUKZGV0YWlscy4KCi0tClJl
Z2FyZHMsClN1ZGVlcAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
