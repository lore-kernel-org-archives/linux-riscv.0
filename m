Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A18DC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 15:10:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7A9320817
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 15:10:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u74DSy5a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lKlH8c0V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7A9320817
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uUFtbOUfSfbO06rPDifX7ahCaardxgy9dJwqe8AYwvU=; b=u74DSy5aH9nKsUB8MqiBSioVN
	ISHVkjuBfDciDbkvcOb5jAIWC4Yl3U/Mm9J0dODnFd+G+G1zAilt2UIe5xpi8UreITj2UCfMVWkiT
	Mh2eCDaLlfOjSJT1rBlJhl4FNeLB24vwquzsJSm1cMAbdfvDcB8ST8JaLEHNNYfVK4KfPGz40vmfS
	5bydFRl11WmWW5T41Yoi2/8S7DxAa4w8Q0Cllj2ajGoiS/1x3iTZsBmz8e4KilYmIxL44Yah7mX6K
	gWKRAbyd4jwZDCy1FHGuSVqIU3YdLXZogXO83eUo5VUsIYEKn1QCaDBYrE28hadgWBis1Ee6t4LTu
	QbnV5f+9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLUuQ-0006Ak-Tt; Sat, 10 Nov 2018 15:10:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLUuO-0006Ab-6h
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 15:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qzTe0TZ+N7VZdLbTHk5sX8MfFyUs2ERZEUDa42eMUTY=; b=lKlH8c0V3R89WeWWD/2KEr51Bd
 9Zi1k4CZWOkZko/s2sc+tf6hviDB65/XuK+YMmb1Rx4Bnt07kc2FnVUHS/PJZWwHnBbZWMi5Z1+no
 M2Bypgs6Ck5n7Kona2yMknQUXxpOwhOavkJuVoPLCe3u5ITPU9Px4bJk3JIPOQc+WCPCHobkhxEwL
 SkKKRrzqWvGPuZlCEp/EBK0sDOVCyh9eJ3ko+a5WhOM/o7W6U6GWeBERCTTv7L+PP7CSrfKw7DBWv
 HVqnxVFi9pTxY0uDVs70rtjK1vFbxDFPXxejnWfQinR7v2n4lTVBnHDv3CNwdLPO0tuA9cwSjNl8U
 gfVOZZng==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLUuL-0005tI-Bd
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 15:10:46 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAAF95Ax050766; Sat, 10 Nov 2018 17:09:07 +0200 (EET)
X-AuditID: 8b5b9d4d-91bff70000000e62-bd-5be6f49040f1
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 58.BD.03682.094F6EB5; Sat, 10 Nov 2018 17:09:04 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wAAF93mo012571; Sat, 10 Nov 2018 17:09:03 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sat, 10 Nov 2018 17:09:03 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Andrew Waterman <andrew@sifive.com>
Subject: Re: [sw-dev] SBI extension proposal v2
Organization: FORTH
In-Reply-To: <CA++6G0BTdybjhqaXm9EhAz0HsgpwfozK6OEL7DuzbS48RbEChA@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAEn-LTo1gKtuDpH6iZVT_-ixaQHh79gJ6oDbEsP4yAawriXeEw@mail.gmail.com>
 <CA++6G0BTdybjhqaXm9EhAz0HsgpwfozK6OEL7DuzbS48RbEChA@mail.gmail.com>
Message-ID: <c1e5487d6071af143bf9e829c3fd1aa8@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsXSHc2orDvhy7Nogy8fLC0e9txhsjhx5R+j
 xbYlq1ktdu5+wWqx5XaMRcuHd6wWi1Z8Z7Fobf/GZPHndhurxekJi5gstn1uYbNYev0ik0Xz
 u3PsFju77rBabJ6wgNWibRa/xfYX/WwWz1f2sjkIeew5PYvZY828NYweU3+fYfHYOesuu8fM
 Vw+ZPHbtamT3eLjpEpPH5hVaHpuX1Htcar7O7rH5dLVH+4FupgCeKC6blNSczLLUIn27BK6M
 57sbWQrW8VY0HHrG3sB4mKuLkZNDQsBE4vj+qUxdjFwcQgKHGSUunLrJCuEcYpR4dvQuO0SV
 qcTsvZ2MIDavgKDEyZlPWEBsZgELialX9jNC2PISzVtnM4PYLAKqEjOu3ADrZRPQlJh/6SBY
 vYiAusT/I5fYQBYwC9xnkTh95hAbSEJYQF9iyudDrCA2v4CwxKe7F8FsToFAiauTnoLZQgIn
 GCU+7NKCOMJF4ua79VDHqUh8+P0AzBYVUJZ4cWI66wRGoVlIbp2F5NZZSG5dwMi8ilEgscxY
 LzO5WC8tv6gkQy+9aBMjOHbn+u5gPLfA/hCjAAejEg/vj+VPo4VYE8uKK3OBIcPBrCTCK7sF
 KMSbklhZlVqUH19UmpNafIhRmoNFSZz38IvwICGB9MSS1OzU1ILUIpgsEwenVANj4zuDLr3a
 3dUreDuqcmarTQ1/MZ+9obFewLLGuVlZtTCd582Jvik/zp5jXL2gJ+fF9z+XmWP6GMt2Pj7A
 E+zJetT4jfu04lPZTd6Tvk9ceWzrCr+qaY61TOnbrRxuTUnepVlTMueij8p1w4jsf0Grkos3
 Hbh5O8MnqkNmepBvw+6kzWsdTv5VYinOSDTUYi4qTgQAb/48cdkCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_151045_568362_0797EC83 
X-CRM114-Status: GOOD (  15.35  )
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
 Damien.LeMoal@wdc.com, "Olof Johansson." <olof.johansson@gmail.com>,
 alankao@andestech.com, "Chang, Abner" <abner.chang@hpe.com>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 agraf@suse.de, Zong Li <zong@andestech.com>, atish.patra@wdc.com,
 sw-dev@groups.riscv.org, Paul Walmsley <paul.walmsley@sifive.com>,
 mick@ics.forth.gr, Alistair.Francis@wdc.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110150903.fn3nOKCfxAVPNlXzCj8T9-OZ5z4JqWM5C4Fb1fLnx6Q@z>

zqPPhM65z4IgMjAxOC0xMS0xMCAwNzo0NywgQW5kcmV3IFdhdGVybWFuIM6tzrPPgc6xz4jOtToK
PiBPbiBGcmksIE5vdiA5LCAyMDE4IGF0IDk6MzcgUE0gRGF2aWQgQWJkdXJhY2htYW5vdgo+IDxk
YXZpZC5hYmR1cmFjaG1hbm92QGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4+IE9uIFNhdCwgTm92IDEw
LCAyMDE4IGF0IDM6NDIgQU0gQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+Cj4+IHdy
b3RlOgo+Pj4gCj4+IFsuLl0KPj4gCj4+PiAyLiBFdmVyeSBTQkkgZnVuY3Rpb24gY2FsbCBtYXkg
cmV0dXJuIHRoZSBmb2xsb3dpbmcgc3RydWN0dXJlCj4+PiBgYGAKPj4+IHN0cnVjdCB2YWxlcnIg
ewo+Pj4gbG9uZyB2YWx1ZTsKPj4+IGxvbmcgZXJyb3I7Cj4+PiB9Owo+Pj4gYGBgCj4+IAo+PiBb
Li5dCj4+IAo+Pj4gaW50IHNiaV9oYXJ0X3N1c3BlbmQodTMyIHN0YXRlLCB1bnNpZ25lZCBsb25n
IHJlc3VtZV9lbnRyeSwKPj4gdW5zaWduZWQKPj4+IGxvbmcgcHJpdikKPj4gCj4+IEEgc21hbGwg
bmljdHBpY2ssIGJ1dCBjb3VsZCB3ZSBoYXZlIGNvbnNpc3RlbnQgdHlwaW5nL2xhbmd1YWdlIGlu
Cj4+IHRoZSBkb2N1bWVudD8KPj4gSSBzZWUgeW91IHVzZSAibG9uZyIsIGFuZCBldmVuIG1peCAi
aW50IiBhbmQgInUzMiIgaW4gYSBzaW5nbGUKPj4gZGVmaW5pdGlvbi4KPj4gCj4+IElmIEkgbG9v
ayBpbnRvIFBTQ0kgSSBzZWU6Cj4+IGBgYAo+PiBTTUMzMiB1aW50MzIKPj4gU01DNjQgdWludDY0
Cj4+IGVudHJ5X3BvaW50X2FkZHJlc3MKPj4gYGBgCj4+IHdoaWNoIGxlYXZlcyBsZXNzIGludGVy
cHJldGF0aW9uIGZvciBteSBleWVzLiBGb3IgZXhhbXBsZSwgImxvbmciCj4+IGNhbiBiZQo+PiAz
Mi1iaXQgb3IgNjQtYml0IGxvbmcgZGVwZW5kaW5nIG9uIGEgZmV3IHRoaW5ncyBhbmQgdGh1cyBl
YXNpZXIgdG8KPj4gbWFrZQo+PiBtaXN0YWtlIGludGVycHJldGluZyB0aGUgc3BlYy4KPj4gCj4+
IEkgd291bGQgc3VnZ2VzdCB0byB1c2UgKHUpaW50MzIvKHUpdWludDY0L2ZyaWVuZHMgYW5kIHNv
bWV0aGluZwo+PiBzaW1pbGFyIHRvIFNNQ3szMiw2NH0KPj4gaWYgbmVlZGVkLgo+IAo+IE5vdGUs
IGhvd2V2ZXIsIHRoYXQgdGhlIHNhbWUgc3BlYyBpcyBtZWFudCB0byBiZSB1c2VkIGZvciBib3Ro
IFJWMzIKPiBhbmQgUlY2NCBzeXN0ZW1zLCBzbyBzb21lIGRlZ3JlZSBvZiB0eXBlIHBhcmFtZXRl
cml6YXRpb24gaXMKPiBuZWNlc3NhcnkuCj4gCj4+IGRhdmlkCgpXZSBzaG91bGQgZGVmaW5pdGVs
eSB1c2UgdHlwZWQgaW50ZWdlcnMgZm9yIGNsYXJpdHkgYnV0IHRoZXJlIGlzIG5vCmlzc3VlIG9u
IGhvdyB0aGUgc3RydWN0cyB3aWxsIGJlIGZvcm1hdHRlZCBzaW5jZSB0aGUgY3VycmVudCBjYWxs
aW5nCmNvbnZlbnRpb24gcHJvdmlkZXMgYSBwb2ludGVyIHRvIHRoZSBzdHJ1Y3QgKHNvIGl0J3Mg
dHlwZSBpcyB2b2lkKikKYW5kIHRoZSBudW1iZXJzIHBhc3NlZCB0aHJvdWdoIHRoZSBTQkkgYXJl
IDMyYml0IGludHMgKHUzMikgc28gdGhleQpmaXQgb24gYm90aCAzMiwgNjQgYW5kIDEyOGJpdCBy
ZWdpc3RlcnMuIEFzIGxvbmcgYXMgd2Ugc3RpY2sgd2l0aAp0aGlzIGNhbGxpbmcgY29udmVudGlv
biBvZiBwYXNzaW5nIHBvaW50ZXJzIGFuZCAzMmJpdCBpbnRzLCB3ZQpzaG91bGQgYmUgZmluZS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
