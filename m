Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DD4C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 18:35:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55A7C2086C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 18:35:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E1MEK3EE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nJS/ydbh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55A7C2086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CDJIwBLx+jGYdGMv8uHZ3V33hzUxkniLtCh9+knKsiE=; b=E1MEK3EEs2PZue3OpH99DOLnl
	6dcI3xSTLQ8xiNl3DX7ZEOAWbE8uZ50iHScovfDaKkwI3P51iCvl8FN5ltyfDt4tsaAtD0lU5Zo6w
	08zzjwbhzxjVko8KpygE+Nfn+ZKVnkaPwi5VM8I1TwYOffjW8fQaM+w1v9JW1ZWlLsQJnOSU9EYZw
	Vx41sfdBSFroPhUikiU654sj8UOMVvTWKd0IJV/N4+B8AlPSJD2yzJgelmFk0h9mOnFELHqPWGeDa
	r6cWze1THHf/3vbWmPEEBv2ifM470uMSUUDSRzc1+uE05MJLE+DtAjhe20EsbhiKr6vE9Hxl2DqxE
	mL4mr1s7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLBd4-00026m-Qc; Fri, 09 Nov 2018 18:35:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLBd3-00026Y-5y
 for linux-riscv@bombadil.infradead.org; Fri, 09 Nov 2018 18:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dcso4eUYq4F5CWbyy1Ul1QFTP2ZrI0mpTTE2I4yUk2A=; b=nJS/ydbhBvASejxpwHtApw7cvN
 O+wesAZroI1B0YoU/1ZtsK5PeEjC5NPlJNP6sizdgAvwSUZpa9CdFPF96ESfbfVjbFu/5sm4SXUYu
 ijGyZCyWhJ2YK4o7+C1yL7K6ExBZiVOFF1q/zKLQS3EKsWKTKDb494CZdbZbDzSuDD8uIt+iPDim1
 4gSJCH0jwWShlLfVrkpEOioTePMTjLeSaJ1DPyh751jUkP0AxwO+2rVWB/BThfmr+UiXIjtgbFgIq
 3+JomkKlmTIP/5AaR+eZrXfbbR078uQs1cqnZ9qkTdLFCgAC2sUdfV/tPcxZte74/bsdj4qhJ8eum
 iIU6usjw==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLBd0-00064V-2c
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 18:35:35 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wA9IY0le031995; Fri, 9 Nov 2018 20:34:02 +0200 (EET)
X-AuditID: 8b5b9d4d-91bff70000000e62-35-5be5d3186686
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 49.5D.03682.813D5EB5; Fri,  9 Nov 2018 20:34:00 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wA9IY0Z6016623; Fri, 9 Nov 2018 20:34:00 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 09 Nov 2018 20:34:00 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: palmer@sifive.com
Subject: Re: [PATCH] RISC-V: Update Kconfig to better handle CMDLINE
Organization: FORTH
In-Reply-To: <20181004113230.7995-1-mick@ics.forth.gr>
References: <20181004113230.7995-1-mick@ics.forth.gr>
Message-ID: <ebe1db4d71a42711acb212013fd0fc2b@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRmVeSWpSXmKPExsXSHc2orCtx+Wm0wcrfshZbf89it9j2uYXN
 ovndOXaLzRMWsDqweBzu+MLu8XDTJSaPzUvqPS41X2cPYInisklJzcksSy3St0vgyrj7dDtj
 wTPxivWHm5kbGHcKdTFyckgImEh0ztvFAmILCRxmlHg31a2LkQvIPsgosaa3jRWiyFRi9t5O
 RhCbV0BQ4uTMJ2ANzAIWElOv7GeEsOUlmrfOZu5i5OBgEVCVOPXDByTMJqApMf/SQbByEQFR
 iRc7+1khyn0l5tzZBNYqLOAi8fLxFTYQm19AWOLT3YtgNZwCZhJ3O64wQtxmKtF/9REzxAku
 Eq8aJzJCnKYi8eH3A3YQW1RAWeLFiemsExiFZiG5dBaSS2chuXQBI/MqRoHEMmO9zORivbT8
 opIMvfSiTYzgAJ/ru4Px3AL7Q4wCHIxKPLw/lj+NFmJNLCuuzD3EKMHBrCTCK7sFKMSbklhZ
 lVqUH19UmpNafIhRmoNFSZz38IvwICGB9MSS1OzU1ILUIpgsEwenVANj6MEMqec8Rv7+Zc9r
 DBdopDJs9ljdMWPp3eUhK99MNNDdcjOPd8/undU7lUwvv3U48yRHyfW+QOUGizAbt5K9+h1L
 N5SGM2j9TjhvL+BwoNbZW+rVy55CnYVrXR12vzaZ8X3BIZO3ukecKxt+b4k+J/RMt16v8go7
 x5XgwNPJVvrbjeVOt1xTYinOSDTUYi4qTgQAUjlk5mwCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_183534_265784_89F1E0B2 
X-CRM114-Status: GOOD (  24.20  )
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
Message-ID: <20181109183400.cR1AmZ6FRzfQdlEi4wE5w5JpYsgff9ANNFMvP1LFFiw@z>

SGVsbG8gUGFsbWVyLAoKzqPPhM65z4IgMjAxOC0xMC0wNCAxNDozMiwgTmljayBLb3NzaWZpZGlz
IM6tzrPPgc6xz4jOtToKPiBBZGQgYSBtZW51IHRvIGNob3NlIGhvdyB0aGUgYnVpbHQtaW4gY29t
bWFuZCBsaW5lIHdpbGwgYmUgdXNlZCBhbmQKPiBhZGQgQ01ETElORV9FWFRFTkQgZm9yIGNvbXBh
dGliaWxpdHkgd2l0aCBGRFQgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEtvc3NpZmlk
aXMgPG1pY2tAaWNzLmZvcnRoLmdyPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgfCA0NSAr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCA4MjE3MmJm
ODUuLmNjZTE0MTU1MiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9h
cmNoL3Jpc2N2L0tjb25maWcKPiBAQCAtMjE4LDM5ICsyMTgsNDIgQEAgZW5kbWVudQo+IAo+ICBt
ZW51ICJCb290IG9wdGlvbnMiCj4gCj4gLWNvbmZpZyBDTURMSU5FX0JPT0wKPiAtCWJvb2wgIkJ1
aWx0LWluIGtlcm5lbCBjb21tYW5kIGxpbmUiCj4gK2NvbmZpZyBDTURMSU5FCj4gKwlzdHJpbmcg
IkJ1aWx0LWluIGtlcm5lbCBjb21tYW5kIGxpbmUiCj4gIAloZWxwCj4gIAkgIEZvciBtb3N0IHBs
YXRmb3JtcywgaXQgaXMgZmlybXdhcmUgb3Igc2Vjb25kIHN0YWdlIGJvb3Rsb2FkZXIKPiAgCSAg
dGhhdCBieSBkZWZhdWx0IHNwZWNpZmllcyB0aGUga2VybmVsIGNvbW1hbmQgbGluZSBvcHRpb25z
Lgo+ICAJICBIb3dldmVyLCBpdCBtaWdodCBiZSBuZWNlc3Nhcnkgb3IgYWR2YW50YWdlb3VzIHRv
IGVpdGhlciBvdmVycmlkZQo+IC0JICB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBsaW5lIG9y
IGFkZCBhIGZldyBleHRyYSBvcHRpb25zIHRvIGl0Lgo+IC0JICBGb3Igc3VjaCBjYXNlcywgdGhp
cyBvcHRpb24gYWxsb3dzIGhhcmRjb2RpbmcgY29tbWFuZCBsaW5lIG9wdGlvbnMKPiAtCSAgZGly
ZWN0bHkgaW50byB0aGUga2VybmVsLgo+ICsJICB0aGUgcHJvdmlkZWQga2VybmVsIGNvbW1hbmQg
bGluZSBvciBhZGQgYSBmZXcgZXh0cmEgb3B0aW9ucyB0byBpdC4KPiArCSAgRm9yIHN1Y2ggY2Fz
ZXMsIGl0IGlzIHBvc3NpYmxlIHRvIGRlZmluZSBhIGJ1aWx0LWluIGNvbW1hbmQgbGluZQo+ICsJ
ICBoZXJlIGFuZCBjaG9zZSBob3cgdGhlIGtlcm5lbCBzaG91bGQgdXNlIGl0IGxhdGVyIG9uLgo+
IAo+IC0JICBGb3IgdGhhdCwgY2hvb3NlICdZJyBoZXJlIGFuZCBmaWxsIGluIHRoZSBleHRyYSBi
b290IHBhcmFtZXRlcnMKPiAtCSAgaW4gQ09ORklHX0NNRExJTkUuCj4gK2Nob2ljZQo+ICsJcHJv
bXB0ICJCdWlsdC1pbiBjb21tYW5kIGxpbmUgdXNhZ2UiIGlmIENNRExJTkUgIT0gIiIKPiArCWRl
ZmF1bHQgQ01ETElORV9GQUxMQkFDSwo+ICsJaGVscAo+ICsJICBDaG9zZSBob3cgdGhlIGtlcm5l
bCB3aWxsIGhhbmRsZSB0aGUgcHJvdmlkZWQgYnVpbHQtaW4gY29tbWFuZAo+ICsJICBsaW5lLgo+
IAo+IC0JICBUaGUgYnVpbHQtaW4gb3B0aW9ucyB3aWxsIGJlIGNvbmNhdGVuYXRlZCB0byB0aGUg
ZGVmYXVsdCBjb21tYW5kCj4gLQkgIGxpbmUgaWYgQ01ETElORV9GT1JDRSBpcyBzZXQgdG8gJ04n
LiBPdGhlcndpc2UsIHRoZSBkZWZhdWx0Cj4gLQkgIGNvbW1hbmQgbGluZSB3aWxsIGJlIGlnbm9y
ZWQgYW5kIHJlcGxhY2VkIGJ5IHRoZSBidWlsdC1pbiBzdHJpbmcuCj4gK2NvbmZpZyBDTURMSU5F
X0ZBTExCQUNLCj4gKwlib29sICJGYWxsYmFjayIKPiArCWhlbHAKPiArCSAgVXNlIHRoZSBidWls
dC1pbiBjb21tYW5kIGxpbmUgYXMgZmFsbGJhY2sgaW4gY2FzZSB3ZSBnZXQgbm90aGluZwo+ICsJ
ICBmcm9tIHRoZSBib290IGxvYWRlci4KPiAKPiAtY29uZmlnIENNRExJTkUKPiAtCXN0cmluZyAi
QnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgc3RyaW5nIgo+IC0JZGVwZW5kcyBvbiBDTURMSU5FX0JP
T0wKPiAtCWRlZmF1bHQgIiIKPiArY29uZmlnIENNRExJTkVfRVhURU5ECj4gKwlib29sICJFeHRl
bnNpb24iCj4gIAloZWxwCj4gLQkgIFN1cHBseSBjb21tYW5kLWxpbmUgb3B0aW9ucyBhdCBidWls
ZCB0aW1lIGJ5IGVudGVyaW5nIHRoZW0gaGVyZS4KPiArCSAgVXNlIHRoZSBidWlsdC1pbiBjb21t
YW5kIGxpbmUgYXMgYW4gZXh0ZW5zaW9uIG9mIHRoZSBjb21tYW5kIGxpbmUKPiArCSAgcHJvdmlk
ZWQgYnkgdGhlIGJvb3QgbG9hZGVyLgo+IAo+ICBjb25maWcgQ01ETElORV9GT1JDRQo+IC0JYm9v
bCAiQnVpbHQtaW4gY29tbWFuZCBsaW5lIG92ZXJyaWRlcyBib290bG9hZGVyIGFyZ3VtZW50cyIK
PiAtCWRlcGVuZHMgb24gQ01ETElORV9CT09MCj4gKwlib29sICJGb3JjZWQiCj4gIAloZWxwCj4g
LQkgIFNldCB0aGlzIG9wdGlvbiB0byAnWScgdG8gaGF2ZSB0aGUga2VybmVsIGlnbm9yZSB0aGUg
Ym9vdGxvYWRlcgo+IC0JICBvciBmaXJtd2FyZSBjb21tYW5kIGxpbmUuICBJbnN0ZWFkLCB0aGUg
YnVpbHQtaW4gY29tbWFuZCBsaW5lCj4gLQkgIHdpbGwgYmUgdXNlZCBleGNsdXNpdmVseS4KPiAr
CSAgVXNlIHRoZSBidWlsdC1pbiBjb21tYW5kIGxpbmUgaW4gcGxhY2Ugb2YgdGhlIGNvbW1hbmQg
bGluZQo+ICsJICBwcm92aWRlZCBieSB0aGUgYm9vdCBsb2FkZXIuCj4gCj4gLQkgIElmIHlvdSBk
b24ndCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5IE4uCj4gK2VuZGNob2ljZQo+IAo+ICBlbmRt
ZW51CgpTaW5jZSB3ZSdsbCBiZSB1c2luZyBGRFQgb25seSBmb3IgaGFuZGxpbmcgY21kbGluZSwg
dGhpcyBvbmUgaXMgc3RpbGwgCm5lZWRlZApiZWNhdXNlIEZEVCBjb2RlIHVzZXMgQ01ETElORV9F
WFRFTkQgLyBGQUxMQkFDSyBpbnN0ZWFkLiBEbyB5b3Ugd2FudCBtZSAKdG8KcmUtc2VuZCA/Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
