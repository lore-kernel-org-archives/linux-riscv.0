Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E74C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 12:34:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA9CA20825
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 12:34:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TknmRy3k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V1YvRNU1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA9CA20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZQr+tjv69vLcSrpJPL6fH4LNfsumT8JBFJGjVHEgbg=; b=TknmRy3kFtk0a/
	4y2cdFWWab7xtryhw9Y+gLWXqc14PxRonC2+HQvtIv6RmcwqeUZzvVL+3DMH1pJcwYhCw/LQ79SBL
	p3aMdwVTT3UPArFlrmSY8/hymcCecNW9OU2Pkztzfr4Z2a40PPOX08ezmvV8EpFLG1OYdLsqPOgZc
	9HspMbky5poAOeKYrWWD0Ypcw+ZQbi936yln8AbeATmnUHgt4hFX+We2+6VbzF0+KgxFrFY5xNlUR
	rSd/gOB7dgDHwbHyRcqkTWB8BGMBVNvDLH34zs+spiRWDPcPSB9viUzef9JI7rd9O6CZ7wcMTlHWA
	KKYuOs+i115z3Ubsm2xA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gL5zB-0002j3-Hd; Fri, 09 Nov 2018 12:34:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL5z9-0002iw-4X
 for linux-riscv@bombadil.infradead.org; Fri, 09 Nov 2018 12:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zWWrNb/CA6rAmuHxafUeutZIfp1LlkjCJijkG+6c+yA=; b=V1YvRNU1wQ3aggBKm4z38DDtWr
 ouCc6BwJpc5hLtMW7MHINTc5iKOCcVZp4z0l2D89wjpPJGy+uYLzaS72ugPd2flHt8J+VzbQJv53v
 1oO8lf9C88syIF8wY3eyUKotH86ywI6S0dFSwBFTDWJd79LKbCnMmp6Yy/R5TGhrT7k1DJa1Vw+7L
 Rj1zTeEOCdCqWamdZX28CPXQKfx4drAtGDut8A8siqlS+n1hrHtMqCYlwmDnMBASXDvwzP/UXPhkI
 U+kPZ+mgavJS50pPPpDaJPj6J6vHAFBO+6KpJ19ytx3jrSF43rXOdFPNxP5uE7WFJhv9soA7W5TL/
 28e9ShGA==;
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL5z4-0006N0-Kn
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 12:34:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77F0180D;
 Fri,  9 Nov 2018 04:33:46 -0800 (PST)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F66A3F718;
 Fri,  9 Nov 2018 04:33:43 -0800 (PST)
Date: Fri, 9 Nov 2018 12:33:38 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [RFC 0/2] Add RISC-V cpu topology
Message-ID: <20181109123338.GA8385@e107155-lin>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
 <20181106141331.GA28458@e107155-lin>
 <969fc2a5198984e0dfe8c3f585dc65f9@mailhost.ics.forth.gr>
 <20181106162051.w7fyweuxrl7ujzuz@lakrids.cambridge.arm.com>
 <abcae019e6ae749b17ecb0c721fd3177@mailhost.ics.forth.gr>
 <20181107122803.GA8433@e107155-lin>
 <d04779705c47b59b94300365e805dbd3@mailhost.ics.forth.gr>
 <20181108164827.GB10953@e107155-lin>
 <b44d94e4a5575e2ce49344b50956bf8e@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b44d94e4a5575e2ce49344b50956bf8e@mailhost.ics.forth.gr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_123358_954842_7E0554D9 
X-CRM114-Status: GOOD (  40.25  )
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
 linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109123338.YgieyLEmCaEHkDE_wcreHHcSwuvizbo-h6bNU6B4Kn0@z>

T24gRnJpLCBOb3YgMDksIDIwMTggYXQgMDQ6MzY6MTlBTSArMDIwMCwgTmljayBLb3NzaWZpZGlz
IHdyb3RlOgo+IM6jz4TOuc+CIDIwMTgtMTEtMDggMTg6NDgsIFN1ZGVlcCBIb2xsYSDOrc6zz4HO
sc+IzrU6CgpbLi4uXQoKPiB3ZSBjYW4ga2VlcCBpdCBhcyBpcyBhbmQgbWFuZGF0ZSB0aGUgPHRo
cmVhZD4gbm9kZXMgb25seSBmb3IgQVJNNjQgYXMgeW91Cj4gc3VnZ2VzdGVkLgo+CgpGaW5lIGJ5
IG1lLgoKWy4uLl0KCj4gPiBXZSBoYXZlIHJlYXNvbnMgd2h5IHdlIGNhbid0IGFzc3VtZSBpbmZv
cm1hdGlvbiBhYm91dCBjYWNoZSBvciBwb3dlcgo+ID4gZG9tYWluIHRvcG9sb2d5IGZyb20gQ1BV
IHRvcG9sb2d5LiBJIGhhdmUgc3VtbWFyaXNlZCB0aGVtIGFscmVhZHkgYW5kCj4gPiB3ZSBhcmUg
bm90IGRpc2N1c3NpbmcuCj4KPiBCdXQgdGhhdCdzIHdoYXQgeW91IGRvIG9uIGFyY2gvYXJtL2tl
cm5lbC90b3BvbG9neS5jLCB5b3UgYXNzdW1lCj4gaW5mb3JtYXRpb24gb24gcG93ZXIgZG9tYWlu
IGFuZCBjYWNoZSB0b3BvbG9neSBiYXNlZCBvbiB0aGUgQ1BVIHRvcG9sb2d5Cj4gd2hlbiB5b3Ug
ZGVmaW5lIHRoZSBzY2hlZHVsaW5nIGRvbWFpbiB0b3BvbG9neSBsZXZlbHMuCj4KCk5PLCB3ZSBk
b24ndCBhc3N1bWUgYW55IGtub3dsZWRnZSBhYm91dCBwb3dlciBkb21haW4gYW5kIGNhY2hlIHRv
cG9sb2d5CmJhc2VkIG9uIHRoZSBDUFUgdG9wb2xvZ3kuIFdlIGhhdmUgdXBkYXRlZCBzY2hlZHVs
aW5nIGRvbWFpbnMgZm9yIEFDUEkKYmFzZWQgc3lzdGVtcyBhbmQgcGxhbiB0byBkbyB0aGUgc2Ft
ZSBmb3IgRFQuIFRoZSBjdXJyZW50IGNvZGUgbWF5IG5vdApiZSBvcHRpbWFsLgoKPiBQb3dlclBD
IGFsc28gZG9lcyB0aGUgc2FtZSBvbiBhcmNoL3Bvd2VycGMva2VybmVsL3NtcC5jIGFuZCBiYXNp
Y2FsbHkgaWYKPiB5b3UgdHJhY2sgdGhlIHVzYWdlIG9mIHN0cnVjdCBzY2hlZF9kb21haW5fdG9w
b2xvZ3lfbGV2ZWwgeW91J2xsIHNlZSB0aGF0Cj4gZXZlcnkgYXJjaCB0aGF0IHVzZXMgaXQgdG8g
aW5zdHJ1Y3QgdGhlIHNjaGVkdWxlciBhYm91dCB0aGUgc2NoZWR1bGluZwo+IGRvbWFpbnMsIGRv
ZXMgaXQgYmFzZWQgb24gaXRzIENQVSB0b3BvbG9neSwgd2hpY2ggSSB0aGluayB3ZSBib3RoIGFn
cmVlCj4gaXMgd3JvbmcuCj4KCkFnYWluLCB0aGF0J3MgYXJjaCBzcGVjaWZpYywgc28gSSBjYW4n
dCBjb21tZW50IG9uIGFueXRoaW5nIG90aGVyIHRoYW4gQVJNLgoKPiA+IFRoZXJlIG1heSBub3Qg
YmUgcGVyZmVjdCBiaW5kaW5ncyBidXQgdGhlcmUgYXJlCj4gPiBhbHJlYWR5IHN1cHBvcnRlZCBh
bmQgbm90aGluZyBpcyBicm9rZW4gaGVyZSB0byBmaXguIERUIGJpbmRpbmdzIGFyZQo+ID4gKm5v
dCogc2FtZSBhcyBjb2RlIHRvIGZpeCBpdCB3aXRoIGEgcGF0Y2ggdG8gdGhlIGJpbmRpbmdzIHRo
ZW1zZWx2ZXMuCj4gPiBPbmNlIGFncmVlZCBhbmQgbWVyZ2VkLCB0aGV5IG5lZWQgdG8gYmUgdHJl
YXRlZCBsaWtlIHVzZXIgQUJJLgo+ID4KPgo+IFRoZSBvbmx5IHVzZSBvZiB0aGUgZGV2aWNldHJl
ZSBzcGVjIGJpbmRpbmdzIGZvciBjYWNoZXMgaWYgSSdtIG5vdAo+IG1pc3Rha2VuIGFyZSB1c2Vk
IG9uIHlvdXIgY2FjaGVpbmZvIGRyaXZlciBmb3IgZXhwb3J0aW5nIHRoZW0gdG8gdXNlcnNwYWNl
Cj4gdGhyb3VnaCBzeXNmcyAodGhhbmsgeW91IGZvciBjbGVhbmluZyB0aGlzIHVwIGJ0dykuIEV2
ZW4gaWYgd2UgaGF2ZSB0aGUKPiBjYWNoZSB0b3BvbG9neSAgdXNpbmcgdGhlIGdlbmVyaWMgYmlu
ZGluZ3MsIHdlIGFyZSBub3QgZG9pbmcgYW55dGhpbmcgd2l0aAo+IHRoYXQgaW5mb3JtYXRpb24g
YnV0IGV4cG9ydCBpdCB0byB1c2Vyc3BhY2UuCj4KCk9LLCB3ZSBtYXkgdXNlIExMQyBmb3Igc2No
ZWQgZG9tYWlucyBpbiBmdXR1cmUsIHdlIGRvIGZvciBBQ1BJIHN5c3RlbXMuCgo+IEFzIGZvciB0
aGUgcG93ZXIgZG9tYWluIGJpbmRpbmdzLCB3ZSBoYXZlIGRyaXZlcnMvYmFzZS9wb3dlci9kb21h
aW4uYyB0aGF0Cj4gaGFuZGxlcyB0aGUgZ2VuZXJpYyBiaW5kaW5ncyBhbmQgaXQncyBiZWluZyB1
c2VkIGJ5IHNvbWUgZHJpdmVycyB0byBwdXQKPiBkZXZpY2VzIHRvIHBvd2VyIGRvbWFpbnMgKHNv
bWV0aGluZyB1c2VkIGJ5IHRoZSBwbSBjb2RlKSwgYnV0IGZyb20gYSBxdWljawo+IHNlYXJjaCBp
dCdzIG5vdCB1c2VkIGZvciBjcHUgbm9kZXMgYW5kIEkgZGlkbid0IHNlZSB0aGlzIGluZm8gYmVp
bmcgdXNlZAo+IGZvciBwcm92aWRpbmcgaGludHMgdG8gdGhlIHNjaGVkdWxlciBlaXRoZXIuIEV2
ZW4gd2l0aCB0aGUgZ2VuZXJpYyBwb3dlcgo+IGRvbWFpbiBiaW5kaW5ncyBpbiBwbGFjZSwgZm9y
IENQVSBpZGxlIHN0YXRlcywgb24gQVJNIHdlIGhhdmUgYW5vdGhlcgo+IGJpbmRpbmcgdGhhdCdz
IGJhc2ljYWxseSB0aGUgc2FtZSB3aXRoIHRoZSBhZGRpdGlvbiBvZiAid2FrZXVwLWxhdGVuY3kt
dXMiLgo+CgpPSywgaXQncyBqdXN0IGFuIGV4dGVuc2lvbi4KCj4gRm9yIGhhdmluZyBkaWZmZXJl
bnQgY2FwYWNpdHkgdGhlcmUgaXMgbm8gZ2VuZXJpYyBiaW5kaW5nIGJ1dCBJIGd1ZXNzIHdlCj4g
Y291bGQgdXNlIEFSTSdzLgo+CgpCZXR0ZXIuCgo+IE9mIHRoZSBnZW5lcmljIGJpbmRpbmdzIHRo
YXQgcmVsYXRlIHRvIHRoZSBzY2hlZHVsZXIncyBiZWhhdmlvciwgb25seSB0aGUKPiBudW1hIGJp
bmRpbmcgaXMgdXNlZCBhcyBleHBlY3RlZCBhbmQgb25seSBieSBBUk02NCwgcG93ZXJwYyBhbmQg
c3BhcmMgdXNlCj4gdGhlaXIgb3duIHN0dWZmLgo+CgpZZXMsIFBQQyBhbmQgU1BBUkMgaGFzIGxv
dHMgb2YgT3BlbiBGaXJtd2FyZSBiYXNlIHdoaWNoIGlzIGRpZmZlcmVudCBmcm9tCkRULgoKPiBT
byB0aGVyZSBtYXkgYmUgbm90aGluZyBicm9rZW4gcmVnYXJkaW5nIHRoZSBnZW5lcmljIC8gYWxy
ZWFkeSBleGlzdGluZwo+IGJpbmRpbmdzLCBidXQgdGhlaXIgc3VwcG9ydCBuZWVkcyBmaXhpbmcu
IFRoZSB3YXkgdGhleSBhcmUgbm93IHdlIGNhbid0Cj4gdXNlIHRoZW0gb24gUklTQy1WIGZvciBj
b25maWd1cmluZyB0aGUgc2NoZWR1bGVyIGFuZCBzdXBwb3J0aW5nIFNNVCBhbmQKPiBNQyBwcm9w
ZXJseSArIEknbSBub3QgaW4gZmF2b3Igb2YgdXNpbmcgQ1BVIHRvcG9sb2d5IGJsaW5kbHkgYXMg
dGhlCj4gb3RoZXIgYXJjaHMgZG8uCj4KClN1cmUsIGlmIHlvdSB3YW50IHRvIGltcHJvdmUgc3Vw
cG9ydCBmb3IgdGhlIGV4aXN0aW5nIERUIGJpbmRpbmdzIHRoYXQncwpmaW5lLiBIYXBweSB0byBz
ZWUgdGhlIHBhdGNoZXMuCgpEVCBiaW5kaW5ncyBjYW4gYmUgZ2VuZXJpYywgeW91IGNhbiBzdGls
bCBpbnRlcnByZXQgYW5kIG1hbmFnZSB0aGUgc2NoZWQKZG9tYWlucyBpbiB0aGUgYmVzdCB3YXkg
Zm9yIFJJU0MtVi4KClsuLi5dCgo+IEkgbWVudGlvbmVkIHRoZSBzY3JpcHQgYXMgYSB0cmFuc2l0
aW9uaW5nIG1ldGhvZCwgYnV0IHlvdSBhcmUgcmlnaHQsIGl0IGdvZXMKPiBib3RoIHdheXMuCj4K
ClRoYW5rcyA6KQoKPiBCdXQgSSBuZXZlciBzYWlkIHRoYXQncyAidGhlIG9ubHkgc29sdXRpb24g
YW5kIGV2ZXJ5dGhpbmcgZWxzZSBpcyBicm9rZW4iICEKPiBJJ20ganVzdCBwcm9wb3NpbmcgYW4g
ZXh0ZW5zaW9uIHRvIGNwdS1tYXAgc2luY2UgTWFyayBzdWdnZXN0ZWQgdGhhdCBpdCdzCj4gcG9z
c2libGUuIE15IGdvYWwgaXMgdG8gdHJ5IGFuZCBjb25zb2xpZGF0ZSBjcHUtbWFwIHdpdGggd2hh
dCBBdGlzaCBwcm9wb3NlZAo+IGZvciBSSVNDLVYgKHNvIHRoYXQgd2UgY2FuIHVzZSB0aGUgc2Ft
ZSBjb2RlKSBhbmQgcG9pbnQgb3V0IHNvbWUgaXNzdWVzCj4gb24gaG93IHdlIHVzZSBhbmQgZGVm
aW5lIHRoZSBDUFUgdG9wb2xvZ3kuCj4KCkdvb2QsIHdlIGFyZSBpbiBhZ3JlZW1lbnQgaGVyZS4K
Cj4gQUNLLCB0aGFua3MgYSBsb3QgZm9yIHlvdXIgdGltZSBhbmQgdGhlIGRpc2N1c3Npb24gc28g
ZmFyLCBJIHJlYWxseQo+IGFwcHJlY2lhdGUgaXQuCj4KCk5vIHdvcnJpZXMsIGdsYWQgaWYgaXQg
aGVscHMuCgotLQpSZWdhcmRzLApTdWRlZXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
