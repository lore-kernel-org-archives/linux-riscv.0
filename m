Return-Path: <SRS0=ssm3=N3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5AFC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 17:34:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D28FF2086A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 17:34:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bij4nE43";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pA7egVXP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D28FF2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=csvi5td8lZ44Ubi/pyrc4+OiyMdpRw+oDZL5kHjSvf0=; b=bij4nE43oto+LBujrdAdYdz3V
	kli63pjjftO7HyvcD2zkc98oTIwrVZ8tJCc55q0VrpYpQ2VN5cS4nqKg4Exa3n0ixvM0DqJ+l/Cu9
	LfxgX2TEATraq1skQyq+ANQnfIBe/zJlfO/SXC8EZrqJvSB4o4EGUyf+Vip26xQDqB+g9LyGJP3pc
	5uneoNtnxL4AlQsVE/7osJbeiTDzePYDTp6UjG6dh0OQfMZLVrNexIjdzRl3EH0IoyHNd9MaFAjfv
	kieMt16DxjJjwE4JXIK9AB7+yyyTxiT9UDFE66Nq4Bt9Pi1F6ES11qZfGelQkgFiNVA6scKsTED/9
	BYuonIdYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNi0r-0006CK-Ar
	for infradead-linux-riscv@archiver.kernel.org; Fri, 16 Nov 2018 17:34:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNi0p-0006B8-Ri
 for linux-riscv@bombadil.infradead.org; Fri, 16 Nov 2018 17:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G1k1MJZC4CsYnNJkesJZvXIbozFiGFOTd6Y+apCCCdY=; b=pA7egVXPX/lY2LSLGmNa27UsLt
 v9W6lDETVMpfMQLeftBuDLgxGKgyF7UqBK80hyNis1ZjQKYQs8JzN9eo3VC2CILsWApEHvH56xOL6
 ShwUFCukq3sH1UldYG+B2crUpLMPivuX9V7mb09bial9YJJHaafq9EkzO6LyBofRB1tTyu98TeCSp
 5latzovdSoXO4fLZU2UjP1OlF0QZz0PfRk1obbsYyIQWlLeGXd0xWQ2iochOAAzXEUFxPVch/6k2c
 bNzRtBwmVeQFWyDWG1xVb8jKOL+rPE7/qoRkmu69lXjnpvkqoNRmkNhRApHfQI61K0DCrdgSNDi9u
 hk3tUW8w==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNi0m-00056f-D5
 for linux-riscv@lists.infradead.org; Fri, 16 Nov 2018 17:34:34 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAGHX3YA097301; Fri, 16 Nov 2018 19:33:05 +0200 (EET)
X-AuditID: 8b5b9d4d-903ff70000000e62-cd-5beeff4e3bf7
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 79.64.03682.E4FFEEB5; Fri, 16 Nov 2018 19:33:03 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wAGHX2Im020146; Fri, 16 Nov 2018 19:33:02 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 16 Nov 2018 19:33:02 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] RISC-V: Update Kconfig to better handle CMDLINE
Organization: FORTH
In-Reply-To: <mhng-c4cd5cdc-bffb-48f9-9594-0eca3acfe36c@palmer-si-x1c4>
References: <mhng-c4cd5cdc-bffb-48f9-9594-0eca3acfe36c@palmer-si-x1c4>
Message-ID: <2b4257cfe91538377458f8940cb35a0a@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFLMWRmVeSWpSXmKPExsXSHc2orOv//120wYl1YhZbf89it9j2uYXN
 ovndOXaLzRMWsDqweBzu+MLu8XDTJSaPzUvqPS41X2cPYInisklJzcksSy3St0vgyuh/YlEw
 16ji3+l7zA2Mn1S7GDk5JARMJA617GftYuTiEBI4wiixaeY2KOcQo8SrvgVMEFWmErP3djKC
 2LwCghInZz5hAbGZBSwkpl7Zzwhhy0s0b53NDGKzCKhKnHrbBtbLJqApMf/SQbB6EQE1iUNN
 R6DqfSW2TT8PVi8s4CLx8vEVNhCbX0BY4tPdi6wgNqeAu8S3F1/AbCEBN4nld96zQ9zgIjH1
 6wRmiNtUJD78fgAWFxVQlnhxYjrrBEahWUhOnYXk1FlITl3AyLyKUSCxzFgvM7lYLy2/qCRD
 L71oEyM4xOf67mA8t8D+EKMAB6MSD2/Fo3fRQqyJZcWVucCA4WBWEuH98QIoxJuSWFmVWpQf
 X1Sak1p8iFGag0VJnPfwi/AgIYH0xJLU7NTUgtQimCwTB6dUA2OawkWB3ZOlkzpF+q+9z9qz
 xcC0JkX04sa/tanFgicCA+UjTy9wkldMD5l1ncfMUunF+U/Cd3u8xd/eLel6emf9JK+VvSn+
 yQdl1p/ljEzlFix1bZ49yStzZbr9c46F7ivSw/ata7ryrzShd4PP9C1t72583fH6uFvIyzuz
 qvMy+s931xklvVZiKc5INNRiLipOBAA8ZwsvbQIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181116_173432_666378_8B102C39 
X-CRM114-Status: GOOD (  27.43  )
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
Cc: mick@ics.forth.gr, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181116173302.QZQKCklysFSZ9Q--9uS0E9o777Z2zQRTNP5090xsCYU@z>

zqPPhM65z4IgMjAxOC0xMS0xNiAxOToyNywgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIEZyaSwgMTYgTm92IDIwMTggMDk6MTQ6MDQgUFNUICgtMDgwMCksIG1pY2tAaWNzLmZvcnRo
LmdyIHdyb3RlOgo+PiDOo8+EzrnPgiAyMDE4LTExLTE2IDE5OjA4LCBOaWNrIEtvc3NpZmlkaXMg
zq3Os8+BzrHPiM61Ogo+Pj4gzqPPhM65z4IgMjAxOC0xMS0xNiAxODo1MiwgUGFsbWVyIERhYmJl
bHQgzq3Os8+BzrHPiM61Ogo+Pj4+IE9uIEZyaSwgMDkgTm92IDIwMTggMTc6MDI6NDQgUFNUICgt
MDgwMCksIG1pY2tAaWNzLmZvcnRoLmdyIHdyb3RlOgo+Pj4+PiBBZGQgYSBtZW51IHRvIGNob3Nl
IGhvdyB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lIHdpbGwgYmUKPj4+Pj4gdXNlZCBhbmQgYWRk
IENNRExJTkVfRVhURU5EIGZvciBjb21wYXRpYmlsaXR5IHdpdGggRkRUIGNvZGUuCj4+Pj4+IAo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgo+
Pj4+PiAtLS0KPj4+Pj4gIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDQ1Cj4+Pj4+ICsrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4+PiAgMSBmaWxlIGNoYW5nZWQs
IDI0IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+Pj4+PiAKPj4+Pj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4+PiBpbmRleCA1
NWRhOTNmNGU4MTguLjgxZjg4NDE2NGI1MiAxMDA2NDQKPj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9L
Y29uZmlnCj4+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4+PiBAQCAtMjI3LDM5ICsy
MjcsNDIgQEAgZW5kbWVudQo+Pj4+PiAKPj4+Pj4gIG1lbnUgIkJvb3Qgb3B0aW9ucyIKPj4+Pj4g
Cj4+Pj4+IC1jb25maWcgQ01ETElORV9CT09MCj4+Pj4+IC0JYm9vbCAiQnVpbHQtaW4ga2VybmVs
IGNvbW1hbmQgbGluZSIKPj4+Pj4gK2NvbmZpZyBDTURMSU5FCj4+Pj4+ICsJc3RyaW5nICJCdWls
dC1pbiBrZXJuZWwgY29tbWFuZCBsaW5lIgo+Pj4+PiAgCWhlbHAKPj4+Pj4gIAkgIEZvciBtb3N0
IHBsYXRmb3JtcywgaXQgaXMgZmlybXdhcmUgb3Igc2Vjb25kIHN0YWdlIGJvb3Rsb2FkZXIKPj4+
Pj4gIAkgIHRoYXQgYnkgZGVmYXVsdCBzcGVjaWZpZXMgdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUg
b3B0aW9ucy4KPj4+Pj4gIAkgIEhvd2V2ZXIsIGl0IG1pZ2h0IGJlIG5lY2Vzc2FyeSBvciBhZHZh
bnRhZ2VvdXMgdG8gZWl0aGVyIAo+Pj4+PiBvdmVycmlkZQo+Pj4+PiAtCSAgdGhlIGRlZmF1bHQg
a2VybmVsIGNvbW1hbmQgbGluZSBvciBhZGQgYSBmZXcgZXh0cmEgb3B0aW9ucyB0byAKPj4+Pj4g
aXQuCj4+Pj4+IC0JICBGb3Igc3VjaCBjYXNlcywgdGhpcyBvcHRpb24gYWxsb3dzIGhhcmRjb2Rp
bmcgY29tbWFuZCBsaW5lCj4+Pj4+IG9wdGlvbnMKPj4+Pj4gLQkgIGRpcmVjdGx5IGludG8gdGhl
IGtlcm5lbC4KPj4+Pj4gKwkgIHRoZSBwcm92aWRlZCBrZXJuZWwgY29tbWFuZCBsaW5lIG9yIGFk
ZCBhIGZldyBleHRyYSBvcHRpb25zIHRvCj4+Pj4+IGl0Lgo+Pj4+PiArCSAgRm9yIHN1Y2ggY2Fz
ZXMsIGl0IGlzIHBvc3NpYmxlIHRvIGRlZmluZSBhIGJ1aWx0LWluIGNvbW1hbmQgCj4+Pj4+IGxp
bmUKPj4+Pj4gKwkgIGhlcmUgYW5kIGNob3NlIGhvdyB0aGUga2VybmVsIHNob3VsZCB1c2UgaXQg
bGF0ZXIgb24uCj4+Pj4+IAo+Pj4+PiAtCSAgRm9yIHRoYXQsIGNob29zZSAnWScgaGVyZSBhbmQg
ZmlsbCBpbiB0aGUgZXh0cmEgYm9vdCBwYXJhbWV0ZXJzCj4+Pj4+IC0JICBpbiBDT05GSUdfQ01E
TElORS4KPj4+Pj4gK2Nob2ljZQo+Pj4+PiArCXByb21wdCAiQnVpbHQtaW4gY29tbWFuZCBsaW5l
IHVzYWdlIiBpZiBDTURMSU5FICE9ICIiCj4+Pj4+ICsJZGVmYXVsdCBDTURMSU5FX0ZBTExCQUNL
Cj4+Pj4+ICsJaGVscAo+Pj4+PiArCSAgQ2hvc2UgaG93IHRoZSBrZXJuZWwgd2lsbCBoYW5kbGUg
dGhlIHByb3ZpZGVkIGJ1aWx0LWluIGNvbW1hbmQKPj4+Pj4gKwkgIGxpbmUuCj4+Pj4+IAo+Pj4+
PiAtCSAgVGhlIGJ1aWx0LWluIG9wdGlvbnMgd2lsbCBiZSBjb25jYXRlbmF0ZWQgdG8gdGhlIGRl
ZmF1bHQgCj4+Pj4+IGNvbW1hbmQKPj4+Pj4gLQkgIGxpbmUgaWYgQ01ETElORV9GT1JDRSBpcyBz
ZXQgdG8gJ04nLiBPdGhlcndpc2UsIHRoZSBkZWZhdWx0Cj4+Pj4+IC0JICBjb21tYW5kIGxpbmUg
d2lsbCBiZSBpZ25vcmVkIGFuZCByZXBsYWNlZCBieSB0aGUgYnVpbHQtaW4gCj4+Pj4+IHN0cmlu
Zy4KPj4+Pj4gK2NvbmZpZyBDTURMSU5FX0ZBTExCQUNLCj4+Pj4+ICsJYm9vbCAiRmFsbGJhY2si
Cj4+Pj4+ICsJaGVscAo+Pj4+PiArCSAgVXNlIHRoZSBidWlsdC1pbiBjb21tYW5kIGxpbmUgYXMg
ZmFsbGJhY2sgaW4gY2FzZSB3ZSBnZXQgCj4+Pj4+IG5vdGhpbmcKPj4+Pj4gKwkgIGZyb20gdGhl
IGJvb3QgbG9hZGVyLgo+Pj4+PiAKPj4+Pj4gLWNvbmZpZyBDTURMSU5FCj4+Pj4+IC0Jc3RyaW5n
ICJCdWlsdC1pbiBrZXJuZWwgY29tbWFuZCBzdHJpbmciCj4+Pj4+IC0JZGVwZW5kcyBvbiBDTURM
SU5FX0JPT0wKPj4+Pj4gLQlkZWZhdWx0ICIiCj4+Pj4+ICtjb25maWcgQ01ETElORV9FWFRFTkQK
Pj4+Pj4gKwlib29sICJFeHRlbnNpb24iCj4+Pj4+ICAJaGVscAo+Pj4+PiAtCSAgU3VwcGx5IGNv
bW1hbmQtbGluZSBvcHRpb25zIGF0IGJ1aWxkIHRpbWUgYnkgZW50ZXJpbmcgdGhlbSAKPj4+Pj4g
aGVyZS4KPj4+Pj4gKwkgIFVzZSB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lIGFzIGFuIGV4dGVu
c2lvbiBvZiB0aGUgY29tbWFuZCAKPj4+Pj4gbGluZQo+Pj4+PiArCSAgcHJvdmlkZWQgYnkgdGhl
IGJvb3QgbG9hZGVyLgo+Pj4+PiAKPj4+Pj4gIGNvbmZpZyBDTURMSU5FX0ZPUkNFCj4+Pj4+IC0J
Ym9vbCAiQnVpbHQtaW4gY29tbWFuZCBsaW5lIG92ZXJyaWRlcyBib290bG9hZGVyIGFyZ3VtZW50
cyIKPj4+Pj4gLQlkZXBlbmRzIG9uIENNRExJTkVfQk9PTAo+Pj4+PiArCWJvb2wgIkZvcmNlZCIK
Pj4+Pj4gIAloZWxwCj4+Pj4+IC0JICBTZXQgdGhpcyBvcHRpb24gdG8gJ1knIHRvIGhhdmUgdGhl
IGtlcm5lbCBpZ25vcmUgdGhlIGJvb3Rsb2FkZXIKPj4+Pj4gLQkgIG9yIGZpcm13YXJlIGNvbW1h
bmQgbGluZS4gIEluc3RlYWQsIHRoZSBidWlsdC1pbiBjb21tYW5kIGxpbmUKPj4+Pj4gLQkgIHdp
bGwgYmUgdXNlZCBleGNsdXNpdmVseS4KPj4+Pj4gKwkgIFVzZSB0aGUgYnVpbHQtaW4gY29tbWFu
ZCBsaW5lIGluIHBsYWNlIG9mIHRoZSBjb21tYW5kIGxpbmUKPj4+Pj4gKwkgIHByb3ZpZGVkIGJ5
IHRoZSBib290IGxvYWRlci4KPj4+Pj4gCj4+Pj4+IC0JICBJZiB5b3UgZG9uJ3Qga25vdyB3aGF0
IHRvIGRvIGhlcmUsIHNheSBOLgo+Pj4+PiArZW5kY2hvaWNlCj4+Pj4+IAo+Pj4+PiAgZW5kbWVu
dQo+Pj4+IAo+Pj4+IEl0IGxvb2tzIGxpa2UgdGhpcyBpcyBmdW5jdGlvbmFsbHkgZXF1aXZhbGVu
dCB0byB3aGF0IEFSTSBoYXMsIGJ1dCAKPj4+PiB0aGUKPj4+PiBwb2xhcml0eSBpcyBhIGJpdCBk
aWZmZXJlbnQgYW5kIHRoZSBoZWxwIHN0cmluZ3MgYXJlbid0IGFzIGVhc3kgdG8KPj4+PiByZWFk
LiAgSXMgdGhlcmUgYSByZWFzb24gd2UgY2FuJ3QganVzdCBjb3B5IHdoYXQgdGhleSBkbz8KPj4+
PiAKPj4+PiAgICBjb25maWcgQ01ETElORQo+Pj4+ICAgICAgICAgICAgc3RyaW5nICJEZWZhdWx0
IGtlcm5lbCBjb21tYW5kIHN0cmluZyIKPj4+PiAgICAgICAgICAgIGRlZmF1bHQgIiIKPj4+PiAg
ICAgICAgICAgIGhlbHAKPj4+PiAgICAgICAgICAgICAgT24gc29tZSBhcmNoaXRlY3R1cmVzIChF
QlNBMTEwIGFuZCBDQVRTKSwgdGhlcmUgaXMKPj4+PiBjdXJyZW50bHkgbm8gd2F5Cj4+Pj4gICAg
ICAgICAgICAgIGZvciB0aGUgYm9vdCBsb2FkZXIgdG8gcGFzcyBhcmd1bWVudHMgdG8gdGhlIGtl
cm5lbC4gCj4+Pj4gRm9yCj4+Pj4gdGhlc2UKPj4+PiAgICAgICAgICAgICAgYXJjaGl0ZWN0dXJl
cywgeW91IHNob3VsZCBzdXBwbHkgc29tZSBjb21tYW5kLWxpbmUKPj4+PiBvcHRpb25zIGF0IGJ1
aWxkCj4+Pj4gICAgICAgICAgICAgIHRpbWUgYnkgZW50ZXJpbmcgdGhlbSBoZXJlLiBBcyBhIG1p
bmltdW0sIHlvdSBzaG91bGQKPj4+PiBzcGVjaWZ5IHRoZQo+Pj4+ICAgICAgICAgICAgICBtZW1v
cnkgc2l6ZSBhbmQgdGhlIHJvb3QgZGV2aWNlIChlLmcuLCBtZW09NjRNCj4+Pj4gcm9vdD0vZGV2
L25mcykuCj4+Pj4gICAgICAgY2hvaWNlCj4+Pj4gICAgICAgICAgICBwcm9tcHQgIktlcm5lbCBj
b21tYW5kIGxpbmUgdHlwZSIgaWYgQ01ETElORSAhPSAiIgo+Pj4+ICAgICAgICAgICAgZGVmYXVs
dCBDTURMSU5FX0ZST01fQk9PVExPQURFUgo+Pj4+ICAgICAgICAgICAgZGVwZW5kcyBvbiBBVEFH
Uwo+Pj4+ICAgICAgIGNvbmZpZyBDTURMSU5FX0ZST01fQk9PVExPQURFUgo+Pj4+ICAgICAgICAg
ICAgYm9vbCAiVXNlIGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyBpZiBhdmFpbGFibGUiCj4+
Pj4gICAgICAgICAgICBoZWxwCj4+Pj4gICAgICAgICAgICAgIFVzZXMgdGhlIGNvbW1hbmQtbGlu
ZSBvcHRpb25zIHBhc3NlZCBieSB0aGUgYm9vdCAKPj4+PiBsb2FkZXIuCj4+Pj4gSWYKPj4+PiAg
ICAgICAgICAgICAgdGhlIGJvb3QgbG9hZGVyIGRvZXNuJ3QgcHJvdmlkZSBhbnksIHRoZSBkZWZh
dWx0IGtlcm5lbAo+Pj4+IGNvbW1hbmQKPj4+PiAgICAgICAgICAgICAgc3RyaW5nIHByb3ZpZGVk
IGluIENNRExJTkUgd2lsbCBiZSB1c2VkLgo+Pj4+ICAgICAgIGNvbmZpZyBDTURMSU5FX0VYVEVO
RAo+Pj4+ICAgICAgICAgICAgYm9vbCAiRXh0ZW5kIGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50
cyIKPj4+PiAgICAgICAgICAgIGhlbHAKPj4+PiAgICAgICAgICAgICAgVGhlIGNvbW1hbmQtbGlu
ZSBhcmd1bWVudHMgcHJvdmlkZWQgYnkgdGhlIGJvb3QgbG9hZGVyCj4+Pj4gd2lsbCBiZQo+Pj4+
ICAgICAgICAgICAgICBhcHBlbmRlZCB0byB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJp
bmcuCj4+Pj4gICAgICAgY29uZmlnIENNRExJTkVfRk9SQ0UKPj4+PiAgICAgICAgICAgIGJvb2wg
IkFsd2F5cyB1c2UgdGhlIGRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIgo+Pj4+ICAgICAg
ICAgICAgaGVscAo+Pj4+ICAgICAgICAgICAgICBBbHdheXMgdXNlIHRoZSBkZWZhdWx0IGtlcm5l
bCBjb21tYW5kIHN0cmluZywgZXZlbiBpZiAKPj4+PiB0aGUKPj4+PiBib290Cj4+Pj4gICAgICAg
ICAgICAgIGxvYWRlciBwYXNzZXMgb3RoZXIgYXJndW1lbnRzIHRvIHRoZSBrZXJuZWwuCj4+Pj4g
ICAgICAgICAgICAgIFRoaXMgaXMgdXNlZnVsIGlmIHlvdSBjYW5ub3Qgb3IgZG9uJ3Qgd2FudCB0
byBjaGFuZ2UgCj4+Pj4gdGhlCj4+Pj4gICAgICAgICAgICAgIGNvbW1hbmQtbGluZSBvcHRpb25z
IHlvdXIgYm9vdCBsb2FkZXIgcGFzc2VzIHRvIHRoZQo+Pj4+IGtlcm5lbC4KPj4+PiAgICBlbmRj
aG9pY2UKPj4+PiAgICBJJ20gbm90IHJlYWxseSBvcHBvc2VkIHRvIHlvdXIgc29sdXRpb24sIEkn
bSBqdXN0IHRyeWluZyB0byBhdm9pZAo+Pj4+IGJlaW5nIGRpZmZlcmVudCB3aXRob3V0IGEgcmVh
c29uLgo+Pj4gCj4+PiBBVEFHUyBhbmQgcmVmZXJlbmNlcyB0byBBUk0gcGxhdGZvcm1zIHN1Y2gg
YXMgRUJTQTExMCBhcmUgbm90IHJlbGF0ZWQKPj4+IHRvIFJJU0MtVgo+Pj4gYW5kIEkgdGhpbmsg
Q01ETElORV9GQUxMQkFDSyBpcyBtb3JlIGRlc2NyaXB0aXZlIHRoYW4KPj4+IENNRExJTkVfRlJP
TV9CT09UTE9BREVSLgo+IAo+IE9LLgo+IAo+PiBOb3cgdGhhdCB5b3UgbWVudGlvbiBpdCB0aGUg
dGV4dCBjb3VsZCBiZSBiZXR0ZXIuIEkganVzdCB3YW50ZWQgdG8KPj4ga2VlcCB0aGVtIHNob3J0
IGFuZCBjb25zaXN0ZW50LiBEbyB5b3Ugd2FudCBtZSB0byB1c2UgQVJNJ3MgdGV4dCBmb3IKPj4g
Q01ETElORV9FWFRFTkQgYW5kIENNRExJTkVfRk9SQ0UgPwo+IAo+IFRoYXQncyBwcmV0dHkgbXVj
aCB0aGUgb25seSBwYXJ0IEkgbG9va2VkIGF0LiAgIkV4dGVuc2lvbiIgYW5kCj4gIkZvcmNlZCIg
bG9va2VkIGEgYml0IHRvbyBicmllZiwgc28gSSBncmVwcGVkIGFyb3VuZCBhbmQgZm91bmQgdGhl
IEFSTQo+IG9uZS4gIEkgb25seSBsb29rZWQgYXQgdGhlIHN0cmluZ3MsIEkgYWdyZWUgbXVjaCBv
ZiB0aGUgaGVscCB0ZXh0Cj4gbWFrZXMgbm8gc2Vuc2UgZm9yIFJJU0MtViAtLSB3aGF0IHdhcyB0
aGVyZSBpcyBmaW5lLgo+IAo+IENhbiB5b3UgcmUtc3BpbiB0aGUgcGF0Y2g/CgpBQ0sKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
