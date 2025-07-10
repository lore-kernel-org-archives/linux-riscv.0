Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EE8C83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjkAdCsBcx1za0MTaXYVacOBZ7kBSKbedLE8WjwVh+w=; b=i6n8n7TZ/Rn+uE
	9HEKAcbOfT280M/TQ88NRA31Ns62uZgV3k/y8ta8IeiyFGnRzHPI7ixz6Z1Ob9llOZM3Et/dJxYku
	0czEnocOsHO3KaGLChN9cKUMbmj/+Ch0TWHJTjwNs3wuivaADtHtuTi97C9vp5omGzuBFnd6NZ6El
	P5biJOvH4NRnTYzhGaw+67gQFjtVm1g2KLvASA0iMCK2HUOrO9Mn6p0dZholPihz43v6PP64mPGAR
	Uryc40+e3k/uBOmhF0+o8Vr97f1uyGN+e2D7CCiYpJixm9nQ4XeiG7PLBklVCxAV8ohmNrm/HDfy/
	dxgjS5jGmgClTDlJKZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu8M-0000000CRNv-3ieU;
	Thu, 10 Jul 2025 16:28:30 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsAx-0000000C6Pp-10tt
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 14:23:04 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id C1B9A1F79C;
	Thu, 10 Jul 2025 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752157381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDWy7RXo3qzq9NIKFne9faNRuPJeuvOs7IjMZhvIGf0=;
	b=yZguuCvK7o8CKMT6IXSdpWjhpwXyK3xuV4Z7u1Ga195rHuYaO9+ahaY+73+wvRzxk0u160
	ZQ2RoEzE7nRSSOhaDpd9GmhttkOm13lJQZxIvRUUZWr1zgXTHiZXUcDLEAqeAlaLndCSsi
	UO04JdKh5QsLQZ3W6WWMudEVWLb4wFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752157381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDWy7RXo3qzq9NIKFne9faNRuPJeuvOs7IjMZhvIGf0=;
	b=mn0KUQsHwDVBeaT43i5R7T+uu71W0kyfslE0Guc8C5LbgE+WlSqm1JdKU8O8VjtmE3EdNY
	L/ReeBdVsLODZODg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752157381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDWy7RXo3qzq9NIKFne9faNRuPJeuvOs7IjMZhvIGf0=;
	b=yZguuCvK7o8CKMT6IXSdpWjhpwXyK3xuV4Z7u1Ga195rHuYaO9+ahaY+73+wvRzxk0u160
	ZQ2RoEzE7nRSSOhaDpd9GmhttkOm13lJQZxIvRUUZWr1zgXTHiZXUcDLEAqeAlaLndCSsi
	UO04JdKh5QsLQZ3W6WWMudEVWLb4wFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752157381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDWy7RXo3qzq9NIKFne9faNRuPJeuvOs7IjMZhvIGf0=;
	b=mn0KUQsHwDVBeaT43i5R7T+uu71W0kyfslE0Guc8C5LbgE+WlSqm1JdKU8O8VjtmE3EdNY
	L/ReeBdVsLODZODg==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 6E53D4A0569; Thu, 10 Jul 2025 16:23:00 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-riscv@lists.infradead.org,  Palmer Dabbelt <palmer@dabbelt.com>,
  Paul Walmsley <paul.walmsley@sifive.com>,  Shuah Khan <shuah@kernel.org>,
  Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v4] selftests: riscv: add misaligned access testing
In-Reply-To: <5db9ec69-d0e4-4113-a989-ac75d0f1e5dd@rivosinc.com>
 (=?utf-8?Q?=22Cl=C3=A9ment=09L=C3=A9ger=22's?= message of "Thu, 10 Jul 2025
 16:10:03 +0200")
References: <20250710133506.994476-1-cleger@rivosinc.com>
	<mvmecuognj7.fsf@suse.de>
	<5db9ec69-d0e4-4113-a989-ac75d0f1e5dd@rivosinc.com>
Date: Thu, 10 Jul 2025 16:23:00 +0200
Message-ID: <mvma55cgm63.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.989];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_072303_425130_48B0A65A 
X-CRM114-Status: GOOD (  16.13  )
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

T24gSnVsIDEwIDIwMjUsIENsw6ltZW50IEzDqWdlciB3cm90ZToKCj4gT24gMTAvMDcvMjAyNSAx
NTo1MywgQW5kcmVhcyBTY2h3YWIgd3JvdGU6Cj4+IE9uIEp1bCAxMCAyMDI1LCBDbMOpbWVudCBM
w6lnZXIgd3JvdGU6Cj4+IAo+Pj4gVGhpcyBzZWxmdGVzdCB0ZXN0cyBhbGwgdGhlIGN1cnJlbnRs
eSBlbXVsYXRlZCBpbnN0cnVjdGlvbnMgKGV4Y2VwdCBmb3IKPj4+IHRoZSBSVjMyIGNvbXByZXNz
ZWQgb25lcyB3aGljaCBhcmUgbGVmdCBhcyBhIGZ1dHVyZSBleGVyY2lzZSBmb3IgYSBSVjMyCj4+
PiB1c2VyKS4gRm9yIHRoZSBGUFUgaW5zdHJ1Y3Rpb25zLCBhbGwgdGhlIEZQVSByZWdpc3RlcnMg
YXJlIHRlc3RlZC4KPj4gCj4+IElmIHRoYXQgZGlkbid0IGNhdGNoIHRoZSBtaXNzaW5nIHNpZ24g
ZXh0ZW5zaW9uIHRoYXQgSSBqdXN0IGZpeGVkIGluCj4+IDxodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi9tdm1pa2swZ29pbC5mc2ZAc3VzZS5kZT4sIHlvdQo+PiBzaG91bGQgY29u
c2lkZXIgZXh0ZW5kaW5nIHRoZSB0ZXN0cy4KPj4gCj4KPiBIaSBBbmRyZWFzLCB5b3UgbGluayBk
b2Vzbid0IHdvcmsgYW5kIEkgZGlkbid0IGZpbmQgYW55dGhpbmcgYWJvdXQgc2lnbgo+IGV4dGVu
c2lvbiBleGNlcHQgYSBwYXRjaCB5b3Ugd3JvdGUgZm9yIGFyY2hfY21weGcoKS4KCmxvcmUuay5v
IGlzIGN1cnJlbnRseSBkb3duLCBoZXJlJ3MgdGhlIHBhdGNoIEkgaGF2ZSBzZW50OgoKRnJvbSA3
N2M4MjU1ZGEyNGVlNGZhYzU0ZTIzNzE1OTRkNzIxMGQxZGRlZTE5IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQpGcm9tOiBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQHN1c2UuZGU+CkRhdGU6IFRodSwg
MTAgSnVsIDIwMjUgMTM6NTI6MzUgKzAyMDAKU3ViamVjdDogW1BBVENIXSByaXNjdjogdHJhcHNf
bWlzYWxpZ25lZDogcHJvcGVybHkgc2lnbiBleHRlbmQgdmFsdWUgaW4KIG1pc2FsaWduZWQgbG9h
ZCBoYW5kbGVyCgpBZGQgbWlzc2luZyBjYXN0IHRvIHNpZ25lZCBsb25nLgoKU2lnbmVkLW9mZi1i
eTogQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBzdXNlLmRlPgotLS0KIGFyY2gvcmlzY3Yva2VybmVs
L3RyYXBzX21pc2FsaWduZWQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21p
c2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCA5
MzA0MzkyNGZlNmMuLmY3NjBlNGZjYzA1MiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWdu
ZWQuYwpAQCAtNDYxLDcgKzQ2MSw3IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3NjYWxhcl9taXNhbGln
bmVkX2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAJfQogCiAJaWYgKCFmcCkKLQkJU0VUX1JE
KGluc24sIHJlZ3MsIHZhbC5kYXRhX3Vsb25nIDw8IHNoaWZ0ID4+IHNoaWZ0KTsKKwkJU0VUX1JE
KGluc24sIHJlZ3MsIChsb25nKSh2YWwuZGF0YV91bG9uZyA8PCBzaGlmdCkgPj4gc2hpZnQpOwog
CWVsc2UgaWYgKGxlbiA9PSA4KQogCQlzZXRfZjY0X3JkKGluc24sIHJlZ3MsIHZhbC5kYXRhX3U2
NCk7CiAJZWxzZQotLSAKMi41MC4wCgoKLS0gCkFuZHJlYXMgU2Nod2FiLCBTVVNFIExhYnMsIHNj
aHdhYkBzdXNlLmRlCkdQRyBLZXkgZmluZ2VycHJpbnQgPSAwMTk2IEJBRDggMUNFOSAxOTcwIEY0
QkUgIDE3NDggRTRENCA4OEUzIDBFRUEgQjlENwoiQW5kIG5vdyBmb3Igc29tZXRoaW5nIGNvbXBs
ZXRlbHkgZGlmZmVyZW50LiIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
