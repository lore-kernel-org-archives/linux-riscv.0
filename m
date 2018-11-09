Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BDEC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 21:05:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9250920827
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 21:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X/idu+eS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ru/q2ccB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9250920827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=YCN6I6gEDnoDGZj1OsAiZKLcCJ5dr9uKigysxq0NoF4=; b=X/idu+eSzWZjF0Hhb8UL4D6tv
	en4Dq0kcTwttBcgx1ABwO9Huqdga3fbWUz5UPZKcHwFR2ZiyOzaAjCuPl+nNt9Qy7TrqmfaD9H+LE
	O+uXjUuig35Wpw1hOs3RUl8M7lL5YFFbG5hf6Cft1NadgoRcEI2x05KceGMy31yzd5j04mbeZF81h
	dr7tB+cUxdx+FXkLklsu4wsLeabfl8+L/lAkI9rNSrA4zHI6I+1VEqlOLeAI2VOBMOPvXzSUz66hb
	mp6Mbq3YKvaZ0eOu/v4lSLhqoL5c0YD5X+UWFzU0ip+665RE+JCyHO1WgHiXw9jFOoPhrxttbdOSu
	5qK25KFUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLDyY-0001tY-FE; Fri, 09 Nov 2018 21:05:58 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLDyV-0001sh-EX
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 21:05:56 +0000
Received: by mail-pg1-x541.google.com with SMTP id n10-v6so1347214pgv.10
 for <linux-riscv@lists.infradead.org>; Fri, 09 Nov 2018 13:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=w3jObkKLFXODkDHuyI04nfbClrjWU9H7ClbsOaBts/o=;
 b=Ru/q2ccBO1x7ibuFH+JxF75kSQUWIQCKLUO5XMZ9Bn25Q25GgloOaFFcm/J42P5NeY
 hnVbmyW3awHwIkXHr7GLnJgZ9FQKL1vjUZ0cpjHAO09v0B+FXwP3jey4Ar0nbRBbsxAY
 /bCSqmhEaMDpdAZt8AmEapvh+wOsoabs6Kd2MO2CuS01zunVCgf3W4BLi0Oi+s8Kj/mP
 1CUzjXiYXv0kI4EUvIaMdyG6kLPYhtAORFGRuYrg8gOOoaXGMPVZ815jFQsQz8ABQ8q8
 hNoK6sRixz5tXYAmC0tZGc8mpRFSv37zU72MF/EOQqJqhAukN+50qsEaRLPx7Ms+7cXL
 u+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=w3jObkKLFXODkDHuyI04nfbClrjWU9H7ClbsOaBts/o=;
 b=rpWc9YpdyvsSd11WRsxpflSO4UCviVnaib9OAbcsknMXDP3TqcM+5gFCUysQTuDK2Z
 h0CJfT8Q6fXtNSayhSsxLKZB+sPLftkZqOKRFltiPso2GqS6cLmnsJ050YjjLXCFVgg6
 IZM0rdodkukiLtAnDW+h77GsGomXy4Zv3ZMphW9jm3bn11TkihL2Yothb8xoN6//5H7l
 azoE+w/FpFHxrw9bQQqGqlr0jR+wCVuJf4fZ4ZuWwsuQbD1B0shlGzebMsUYF5LOmQuY
 j/gl/12wEOn5Q+Km4zjAA/TEWtlTsDLU1bluoLr9nxuKRDOMVM/HAnwIe3sqybdP0Y/V
 FkoA==
X-Gm-Message-State: AGRZ1gLO/7ObFLdSGGuMYk1CyoJQrxiWbVM4V4T1cnAjNfkHtu7t8vmG
 Acgyrf83haoMk26nyxJT7P0rCgPJNGQ=
X-Google-Smtp-Source: AJdET5eXEvwNJWs/RwwNGGKdVB3SzUgWkUBnS0l7a0QwfgSLi7RrS3J1VQroG3jemAV2yHynP+1ipg==
X-Received: by 2002:a63:1e17:: with SMTP id e23mr8720065pge.130.1541797544358; 
 Fri, 09 Nov 2018 13:05:44 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id s186-v6sm17896645pfs.164.2018.11.09.13.05.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Nov 2018 13:05:43 -0800 (PST)
Date: Fri, 09 Nov 2018 13:05:43 -0800 (PST)
X-Google-Original-Date: Fri, 09 Nov 2018 13:03:26 PST (-0800)
Subject: Re: [PATCH] RISC-V: Update Kconfig to better handle CMDLINE
In-Reply-To: <ebe1db4d71a42711acb212013fd0fc2b@mailhost.ics.forth.gr>
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr
Message-ID: <mhng-3d2613a4-e6ec-447d-b6a0-eeb939091895@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_130555_497833_322362E0 
X-CRM114-Status: GOOD (  18.61  )
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
Message-ID: <20181109210543.UZxD9-7ygCeOxT_uKyQPLHL02o9IYmVjghGmnfXMZIA@z>

T24gRnJpLCAwOSBOb3YgMjAxOCAxMDozNDowMCBQU1QgKC0wODAwKSwgbWlja0BpY3MuZm9ydGgu
Z3Igd3JvdGU6Cj4gSGVsbG8gUGFsbWVyLAo+Cj4gzqPPhM65z4IgMjAxOC0xMC0wNCAxNDozMiwg
TmljayBLb3NzaWZpZGlzIM6tzrPPgc6xz4jOtToKPj4gQWRkIGEgbWVudSB0byBjaG9zZSBob3cg
dGhlIGJ1aWx0LWluIGNvbW1hbmQgbGluZSB3aWxsIGJlIHVzZWQgYW5kCj4+IGFkZCBDTURMSU5F
X0VYVEVORCBmb3IgY29tcGF0aWJpbGl0eSB3aXRoIEZEVCBjb2RlLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgo+PiAtLS0KPj4gIGFyY2gv
cmlzY3YvS2NvbmZpZyB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9L
Y29uZmlnCj4+IGluZGV4IDgyMTcyYmY4NS4uY2NlMTQxNTUyIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L0tjb25maWcKPj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+IEBAIC0yMTgsMzkg
KzIxOCw0MiBAQCBlbmRtZW51Cj4+Cj4+ICBtZW51ICJCb290IG9wdGlvbnMiCj4+Cj4+IC1jb25m
aWcgQ01ETElORV9CT09MCj4+IC0JYm9vbCAiQnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgbGluZSIK
Pj4gK2NvbmZpZyBDTURMSU5FCj4+ICsJc3RyaW5nICJCdWlsdC1pbiBrZXJuZWwgY29tbWFuZCBs
aW5lIgo+PiAgCWhlbHAKPj4gIAkgIEZvciBtb3N0IHBsYXRmb3JtcywgaXQgaXMgZmlybXdhcmUg
b3Igc2Vjb25kIHN0YWdlIGJvb3Rsb2FkZXIKPj4gIAkgIHRoYXQgYnkgZGVmYXVsdCBzcGVjaWZp
ZXMgdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUgb3B0aW9ucy4KPj4gIAkgIEhvd2V2ZXIsIGl0IG1p
Z2h0IGJlIG5lY2Vzc2FyeSBvciBhZHZhbnRhZ2VvdXMgdG8gZWl0aGVyIG92ZXJyaWRlCj4+IC0J
ICB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBsaW5lIG9yIGFkZCBhIGZldyBleHRyYSBvcHRp
b25zIHRvIGl0Lgo+PiAtCSAgRm9yIHN1Y2ggY2FzZXMsIHRoaXMgb3B0aW9uIGFsbG93cyBoYXJk
Y29kaW5nIGNvbW1hbmQgbGluZSBvcHRpb25zCj4+IC0JICBkaXJlY3RseSBpbnRvIHRoZSBrZXJu
ZWwuCj4+ICsJICB0aGUgcHJvdmlkZWQga2VybmVsIGNvbW1hbmQgbGluZSBvciBhZGQgYSBmZXcg
ZXh0cmEgb3B0aW9ucyB0byBpdC4KPj4gKwkgIEZvciBzdWNoIGNhc2VzLCBpdCBpcyBwb3NzaWJs
ZSB0byBkZWZpbmUgYSBidWlsdC1pbiBjb21tYW5kIGxpbmUKPj4gKwkgIGhlcmUgYW5kIGNob3Nl
IGhvdyB0aGUga2VybmVsIHNob3VsZCB1c2UgaXQgbGF0ZXIgb24uCj4+Cj4+IC0JICBGb3IgdGhh
dCwgY2hvb3NlICdZJyBoZXJlIGFuZCBmaWxsIGluIHRoZSBleHRyYSBib290IHBhcmFtZXRlcnMK
Pj4gLQkgIGluIENPTkZJR19DTURMSU5FLgo+PiArY2hvaWNlCj4+ICsJcHJvbXB0ICJCdWlsdC1p
biBjb21tYW5kIGxpbmUgdXNhZ2UiIGlmIENNRExJTkUgIT0gIiIKPj4gKwlkZWZhdWx0IENNRExJ
TkVfRkFMTEJBQ0sKPj4gKwloZWxwCj4+ICsJICBDaG9zZSBob3cgdGhlIGtlcm5lbCB3aWxsIGhh
bmRsZSB0aGUgcHJvdmlkZWQgYnVpbHQtaW4gY29tbWFuZAo+PiArCSAgbGluZS4KPj4KPj4gLQkg
IFRoZSBidWlsdC1pbiBvcHRpb25zIHdpbGwgYmUgY29uY2F0ZW5hdGVkIHRvIHRoZSBkZWZhdWx0
IGNvbW1hbmQKPj4gLQkgIGxpbmUgaWYgQ01ETElORV9GT1JDRSBpcyBzZXQgdG8gJ04nLiBPdGhl
cndpc2UsIHRoZSBkZWZhdWx0Cj4+IC0JICBjb21tYW5kIGxpbmUgd2lsbCBiZSBpZ25vcmVkIGFu
ZCByZXBsYWNlZCBieSB0aGUgYnVpbHQtaW4gc3RyaW5nLgo+PiArY29uZmlnIENNRExJTkVfRkFM
TEJBQ0sKPj4gKwlib29sICJGYWxsYmFjayIKPj4gKwloZWxwCj4+ICsJICBVc2UgdGhlIGJ1aWx0
LWluIGNvbW1hbmQgbGluZSBhcyBmYWxsYmFjayBpbiBjYXNlIHdlIGdldCBub3RoaW5nCj4+ICsJ
ICBmcm9tIHRoZSBib290IGxvYWRlci4KPj4KPj4gLWNvbmZpZyBDTURMSU5FCj4+IC0Jc3RyaW5n
ICJCdWlsdC1pbiBrZXJuZWwgY29tbWFuZCBzdHJpbmciCj4+IC0JZGVwZW5kcyBvbiBDTURMSU5F
X0JPT0wKPj4gLQlkZWZhdWx0ICIiCj4+ICtjb25maWcgQ01ETElORV9FWFRFTkQKPj4gKwlib29s
ICJFeHRlbnNpb24iCj4+ICAJaGVscAo+PiAtCSAgU3VwcGx5IGNvbW1hbmQtbGluZSBvcHRpb25z
IGF0IGJ1aWxkIHRpbWUgYnkgZW50ZXJpbmcgdGhlbSBoZXJlLgo+PiArCSAgVXNlIHRoZSBidWls
dC1pbiBjb21tYW5kIGxpbmUgYXMgYW4gZXh0ZW5zaW9uIG9mIHRoZSBjb21tYW5kIGxpbmUKPj4g
KwkgIHByb3ZpZGVkIGJ5IHRoZSBib290IGxvYWRlci4KPj4KPj4gIGNvbmZpZyBDTURMSU5FX0ZP
UkNFCj4+IC0JYm9vbCAiQnVpbHQtaW4gY29tbWFuZCBsaW5lIG92ZXJyaWRlcyBib290bG9hZGVy
IGFyZ3VtZW50cyIKPj4gLQlkZXBlbmRzIG9uIENNRExJTkVfQk9PTAo+PiArCWJvb2wgIkZvcmNl
ZCIKPj4gIAloZWxwCj4+IC0JICBTZXQgdGhpcyBvcHRpb24gdG8gJ1knIHRvIGhhdmUgdGhlIGtl
cm5lbCBpZ25vcmUgdGhlIGJvb3Rsb2FkZXIKPj4gLQkgIG9yIGZpcm13YXJlIGNvbW1hbmQgbGlu
ZS4gIEluc3RlYWQsIHRoZSBidWlsdC1pbiBjb21tYW5kIGxpbmUKPj4gLQkgIHdpbGwgYmUgdXNl
ZCBleGNsdXNpdmVseS4KPj4gKwkgIFVzZSB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lIGluIHBs
YWNlIG9mIHRoZSBjb21tYW5kIGxpbmUKPj4gKwkgIHByb3ZpZGVkIGJ5IHRoZSBib290IGxvYWRl
ci4KPj4KPj4gLQkgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5IE4uCj4+
ICtlbmRjaG9pY2UKPj4KPj4gIGVuZG1lbnUKPgo+IFNpbmNlIHdlJ2xsIGJlIHVzaW5nIEZEVCBv
bmx5IGZvciBoYW5kbGluZyBjbWRsaW5lLCB0aGlzIG9uZSBpcyBzdGlsbAo+IG5lZWRlZAo+IGJl
Y2F1c2UgRkRUIGNvZGUgdXNlcyBDTURMSU5FX0VYVEVORCAvIEZBTExCQUNLIGluc3RlYWQuIERv
IHlvdSB3YW50IG1lCj4gdG8KPiByZS1zZW5kID8KClRoYXQgd291bGQgYmUgZ3JlYXQsIHRoYW5r
cy4gIEkgbG9zdCB0cmFjayBvZiB0aGUgZGlzY3Vzc2lvbiBvbiB0aGUgZ2VuZXJpYyAKZml4LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
