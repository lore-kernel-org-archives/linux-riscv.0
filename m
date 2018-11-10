Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC85C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 14:52:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9F432077B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 14:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="felThWec";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Rxwl4YfE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9F432077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eW9XXvIi0ULqgonwwzdkURT338+ms8CV5Bfa4/Un3qE=; b=felThWecIvebJQdRcSeBijhaj
	dE8TLemCE4MvxFmjIDNTfPAem3wfEbFaDKef316YjxikmaQk7CZZF+pfO3n/vSYuHrH0r0ocBDpis
	g0L4+FFB9tUIa4bE7qnlnJiBz+uQ7wuZX3rOGSXITAj7GzQxBHzG92dnMjKUeUG86m2MyeLNVT5uP
	QnF7muYSvCB+p6hs8Svz0MUbFfS3/ug53PtSZf5OoMA5uy+OYM3XpQMGOLztlAzC5M864jloviWC5
	L+hpUkpzstwTMYanTcK943pn+j7RbLbQfky/TKNBvw71TPFGAMUCpWgjaZ8y1B6qFlQBGkJMRFEaC
	ioFL7mp6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLUcj-0000dc-4w; Sat, 10 Nov 2018 14:52:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLUcg-0000dF-Sm
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 14:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2RCmFYkoym5PF7SCyzsbgC/j3nTax/AVO2FWfoe7cfw=; b=Rxwl4YfEq7muGKxvXx3kdJxoqW
 L8r0XVth07zPm1NfxgY+W90X9r9/mNCJVRwdYor93Q5L16fa5mHL9oPORPRMDfgv0ASnSQj2oPABB
 OBsFAzmlSmd3WtNO0WUd/uv48y9dvTY+1KtX49VOTsQ498ZMW+aqh/MhTEbEwxWP5wtx+OU7m+F/q
 bzQfLDIewSRy/VD0BGuo5d9+upZ353BsiNe2bXWXrVkb+vDmyEP/qb16kk+TUcRadtIwuS8hHdq1H
 oDDwqo2xMFa1LMoWsYN1gkl7W8ZFOQf5E7eFYwu2YT02px5D9TC41mAfYpzLd8lZpUf60V2No0lRk
 RCPdwqEA==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLUcd-0005O5-Sw
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 14:52:29 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAAEoeuR050470; Sat, 10 Nov 2018 16:50:42 +0200 (EET)
X-AuditID: 8b5b9d4d-903ff70000000e62-6c-5be6f03f053b
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 46.BD.03682.F30F6EB5; Sat, 10 Nov 2018 16:50:39 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wAAEoa0F010653; Sat, 10 Nov 2018 16:50:36 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sat, 10 Nov 2018 16:50:36 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Subject: Re: [sw-dev] SBI extension proposal v2
Organization: FORTH
In-Reply-To: <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
Message-ID: <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsXSHc2orOvw4Vm0wa12FouHPXeYLE5c+cdo
 sW3JalaLnbtfsFpsuR1j0fLhHavFohXfWSxa278xWZyesIjJYtvnFjaL028WMFksvX6RyaL5
 3Tl2i51dd1gtNk9YwGrRNovfYvuLfjaL5yt72RyEPPacnsXssWbeGkaPqb/PsHjsnHWX3WPm
 q4dMHrt2NbJ7PNx0iclj8wotj81L6j3eX//N5nGp+Tq7x+bT1R7tB7qZAnijuGxSUnMyy1KL
 9O0SuDI+L5/DUvBRvOLp4iPsDYztwl2MnBwSAiYS299/YOpi5OIQEjjMKHH6109WCOcQo8TB
 md9YIKpMJWbv7WQEsXkFBCVOznwCFmcWsJCYemU/I4QtL9G8dTYziM0ioCoxq+MoWA2bgKbE
 /EsHgWwODhEBA4nu54Eg85kF3jJLPNl1B6xeWEBfYsrnQ6wgNr+AsMSnuxfBbE6BQImDC5dD
 XdfIKPHwyXdmiCNcJDZv/MQGcZyKxIffD9hBbFEBZYkXJ6azTmAUmoXk1llIbp2F5NYFjMyr
 GAUSy4z1MpOL9dLyi0oy9NKLNjGCo3iu7w7GcwvsDzEKcDAq8fD+WP40Wog1say4MhcYMhzM
 SiK8sluAQrwpiZVVqUX58UWlOanFhxilOViUxHkPvwgPEhJITyxJzU5NLUgtgskycXBKNTBK
 BX2pvCdWXK5328cyUNJo5slFCk03kxhfiTi7d2+5vKBvR+ODRNXZG0QWHPJi5nzAlC6g2TrB
 7r6vx6+T9X8OLt0/833iBq8phRMyzZJUTLbW7v6fJ7XsZ/b51nU3z1naNW4Of3f94oWbYXIq
 Lwp8C184zJH+8Jjb+dYNcXfOsrS5T2elmHAqsRRnJBpqMRcVJwIAJ1C9094CAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_145228_158037_1D5A76A2 
X-CRM114-Status: GOOD (  22.62  )
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
 olof.johansson@gmail.com, alankao@andestech.com, abner.chang@hpe.com,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 agraf@suse.de, zong@andestech.com, atish.patra@wdc.com,
 sw-dev@groups.riscv.org, paul.walmsley@sifive.com, mick@ics.forth.gr,
 Alistair.Francis@wdc.com, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110145036.lkQgneq90UR86isqwkgTPXF3Pz6UMgVPGtWvGM-tqM0@z>

zqPPhM65z4IgMjAxOC0xMS0xMCAwNzoxMiwgTHVrZSBLZW5uZXRoIENhc3NvbiBMZWlnaHRvbiDO
rc6zz4HOsc+IzrU6Cj4gT24gU2F0LCBOb3YgMTAsIDIwMTggYXQgMjo0MiBBTSBBdGlzaCBQYXRy
YSA8YXRpc2gucGF0cmFAd2RjLmNvbT4gCj4gd3JvdGU6Cj4gCj4+ICMjIENvbmNsdXNpb24KPj4g
VGhpcyBwcm9wb3NhbCBpcyBmYXIgZnJvbSBwZXJmZWN0IGFuZCBhYnNvbHV0ZWx5IGFueSBzdWdn
ZXN0aW9uIGlzCj4+IHdlbGNvbWUuIE9idmlvdXNseSwgdGhlcmUgYXJlIG1hbnkgb3RoZXIgZnVu
Y3Rpb25hbGl0aWVzIHRoYXQgY2FuIGJlCj4+IGFkZGVkIHRvIHRoaXMgcHJvcG9zYWwuIEhvd2V2
ZXIsIEkganVzdCB3YW50ZWQgdG8gc3RhcnQgd2l0aCBzb21ldGhpbmcKPj4gdGhhdCBpcyBhbiBp
bmNyZW1lbnRhbCBjaGFuZ2UgYXQgYmVzdCB0byBraWNrIG9mZiB0aGUgZGlzY3Vzc2lvbi4gVGhl
Cj4+IGFpbSBoZXJlIGlzIHRvIGluaXRpYXRlIGEgZGlzY3Vzc2lvbiB0aGF0IGNhbiBsZWFkIHRv
IGEgcm9idXN0IFNCSQo+PiBzcGVjaWZpY2F0aW9uLgo+IAo+ICB2ZXJ5IGNvb2wsIGF0aXNoLgo+
IAo+ICBpIHdvdWxkIHZlcnkgbXVjaCBsaWtlIHRvIHNlZSB0aGUgb3B0aW9uYWwgYWRkaXRpb24g
b2YgbXVsdGlwbGUKPiBzZXJpYWwgbGluZXMsIGJ5IGFkZGluZyBhIGdldGNoYXIgYW5kIHB1dGNo
YXIgZnVuY3Rpb24gdGhhdCB0YWtlcyBqdXN0Cj4gb25lIGV4dHJhIGFyZ3VtZW50OiB0aGUgc2Vy
aWFsIGxpbmUgaW5kZXguCj4gCj4gIHRoZXJlIGFyZSBhIGxvdCBvZiBkaWZmZXJlbnQgdXNlcyB0
byB3aGljaCBtdWx0LXNlcmlhbCBsaW5lcyBtYXkgYmUgCj4gcHV0Ogo+IAo+ICAqIGJvb3QgbWVz
c2FnZSBzZXBhcmF0aW9uIGZyb20gY29uc29sZSBsb2dpbgo+ICAqIGJvb3QgbWFuYWdlbWVudCBz
ZXBhcmF0aW9uIGZyb20gb3RoZXIgcHVycG9zZXMgKHUtYm9vdC9jb3JlYm9vdCkKPiAgKiB2aXJ0
dWFsIC9kZXYvdHR5UzAtMwo+ICAqIGNsZWFuIFVQUyByZXBvcnRpbmcgYW5kIG1hbmFnZW1lbnQK
PiAgKiByZW1vdGUgdmlydHVhbCBtYWNoaW5lIHBvd2VyIG1hbmFnZW1lbnQgKHBvd2VyLW9uIC8g
b2ZmKQo+ICAqIHNpbXBsZSBib2ctc3RhbmRhcmQgbXVsdGlwbGUgdmlydHVhbCBsb2dpbiBjb25z
b2xlcwo+ICAqIHNlcGFyYXRpb24gb2YgZGVidWcgbWVzc2FnZXMgKHN0ZG91dC9zdGRlcnIpIHRv
IGVhc2UgZGVidWdnaW5nIGFuZAo+IGRldmVsb3BtZW50Cj4gICogcmVtb3RlIGFuZCB2aXJ0dWFs
IE9wZW5PQ0QgYW5kIGtlcm5lbCBkZWJ1Z2dpbmcgd2l0aG91dCBkaXNydXB0aW5nCj4gdGhlIG1h
aW4gc2VyaWFsIGNvbnNvbGUKPiAgKiBQUFAgc2VyaWFsIGxpbmtzLgo+IAo+IHRoaXMgbGF0dGVy
IGlzIG9uZSB0aGF0IGkgYW0gcGFydGljdWxhcmx5IGludGVyZXN0ZWQgaW4sIGFzIGkgd291bGQK
PiBsaWtlIHRvIGJlIGFibGUgdG8gYm9vdCBhIGZ1bGwgR05VL0xpbnV4IE9TIG9uIHNwaWtlLCBn
aXZlbiB0aGUgbG93ZXIKPiBiYXJyaWVyIHRvIGVudHJ5IGluIG1ha2luZyBtb2RpZmljYXRpb25z
IGFuZCBleHBlcmltZW50aW5nIHdpdGggc3Bpa2UKPiB0aGFuIGl0IGlzIHdpdGggcWVtdS4KPiAK
PiAgaWYgc3Bpa2Ugd2VyZSBhYmxlLCB0aHJvdWdoIGEgbXVsdGktc2VyaWFsIFNCSSBpbnRlcmZh
Y2UsIHRvIGhhdmUgYQo+IFBQUCBzZXJpYWwgbGluZSwgaXQgd291bGQgYmUgcG9zc2libGUgdG8g
cnVuIGEgcm9vdCBORlMgKG9yIG90aGVyCj4gbmV0d29yayBibG9jayBkZXZpY2UpIHdpdGhvdXQg
aGF2aW5nIHRvIHNhY3JpZmljZSBjb25zb2xlIGFjY2Vzcy4gIGl0Cj4gd291bGQgYmUgcG9zc2li
bGUgdG8gY3JlYXRlIGFuIGluaXRyYW1mcyBmcm9tIGEgbG93ZXItY2FwYWJpbGl0eQo+IHN5c3Rl
bSBsaWtlIGJ1aWxkcm9vdCwgY29udGFpbmluZyBQUFAsIGVuYWJsZSBpdCwgYW5kIHBpdm90LXJv
b3Qgb3V0Cj4gdG8gYSBmdWxsIHN0b2NrIEdOVS9MaW51eCBPUyBzdWNoIGFzIGRlYmlhbiBvciBm
ZWRvcmEuCj4gCj4gIHNvIHRoZXJlIGFyZSBodWdlIGJlbmVmaXRzLCByZWR1Y2luZyB0aGUgZGV2
ZWxvcG1lbnQgYmFycmllciB0byBlbnRyeQo+IGludG8gUklTQy1WIGV4cGVyaW1lbnRhdGlvbiBh
bmQgZGVidWdnaW5nLCBhbmQgb3BlbmluZyB1cCBhIG11Y2ggd2lkZXIKPiByYW5nZSBvZiBjYXBh
YmlsaXRpZXMgYW5kIHBvc3NpYmlsaXRpZXMgZm9yIG1hY2hpbmUgYW5kIHZpcnR1YWwgc3lzdGVt
Cj4gbWFuYWdlbWVudC4KPiAKPiBsLgoKClRoZSBjdXJyZW50IFNCSSBzYXlzIHRoYXQgY29uc29s
ZV9nZXRjaGFyL2NvbnNvbGVfcHV0Y2hhciBhcmUgZm9yIHRoZSAKZGVidWcKY29uc29sZSBidXQg
b24gTGludXggd2UgdXNlIHRoZW0gZm9yIHRoZSBtYWluIGNvbnNvbGUgb24gZWFybHlwcmludGsu
IEkKdGhpbmsgaXQncyBtaXNsZWFkaW5nIGFuZCB3ZSBzaG91bGQgYXQgbGVhc3QgaGF2ZSBhbiBh
cmd1bWVudCB0byBjaG9zZQpiZXR3ZWVuIHRoZSBtYWluIGNvbnNvbGUgYW5kIGFuIG9wdGlvbmFs
IGRlYnVnIGNvbnNvbGUsIG9yIHJlbmFtZQp0aGVtIHRvIGRlYnVnX2NvbnNvbGVfZ2V0Y2hhci9k
ZWJ1Z19jb25zb2xlX3B1dGNoYXIgYW5kIAptYWluX2NvbnNvbGVfZ2V0Y2hhci8KbWFpbl9jb25z
b2xlX3B1dGNoYXIuCgpIb3dldmVyIEkgZG9uJ3QgdGhpbmsgdGhhdCBhcmd1bWVudCBzaG91bGQg
YmUgdGhlIHNlcmlhbCBsaW5lLiBEaWZmZXJlbnQKdmVuZG9ycyBtYXkgdXNlIGRpZmZlcmVudCBz
ZXJpYWwgbGluZXMgZm9yIHRoZSBtYWluIGNvbnNvbGUgLyBkZWJ1ZyAKY29uc29sZSwKdGhlIGNh
bGxlciBkb2Vzbid0IGtub3cgd2hpY2ggc2VyaWFsIGxpbmUgbWFwcyB0byB3aGljaCBjb25zb2xl
LCBzbyB0aGUgClNCSQpzaG91bGQgYmUgbW9yZSBhYnN0cmFjdCBhbmQgdXNlIHNvbWV0aGluZyBs
aWtlIGEgY29uc29sZSBpZCB3aGVyZSBlLmcuIDAgCmlzCm1haW4gY29uc29sZSBhbiAxIGlzIGRl
YnVnLgoKUmVnYXJkcywKTmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
