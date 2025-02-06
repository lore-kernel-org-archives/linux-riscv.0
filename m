Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AB2C02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 10:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0KjF8yNG96IWz5N8j47fM9HKscCYiJABN/eRNNxaeo=; b=xwx7EszFyNMB0b
	LHONX4ssuzr3F1pUeF8V3ZomyiBAWbUHS8JltPDPrbq9Wun2omye9p3auIA7khgTZWBkuSHoxkige
	COHsDyzvqVDyh6Pw42VQXpJ91Pz2HAZ+Vwpn03h9wfnbyB7L3WPLT90qoCi9JiIILnhIV1Y6ay6z6
	nFFE5raGTgRok+ef+3xoHjSGRsOex8eT5RGT+n3t/QDuK/ZMp4YnMVkXLNbs3k7gFF/YVyLmvzTkl
	33Hm6jTpcO5g7cXDN3OnK0EERs/CKfz3EcgYpPF6VVn8LORaMkoJJqKQQ5hiSy5gzhlY/YhtKwgQo
	emgL56I0Ck+z9YUMp5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyuA-00000005x07-2ZRs;
	Thu, 06 Feb 2025 10:14:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyoR-00000005wHZ-1XWz
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 10:08:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-436341f575fso7462695e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 02:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738836526; x=1739441326; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O95g61PF532xlL2QESo99vnXziiwui859ZgTSUP0Xv8=;
        b=ExDfIDh5LIr7J2pISfoFzCJumcmZ3F0JfC6evhuM5UkHMAHfX1toJ0gSyCbsbNPNFx
         TZzRC5FiAvCkgk/F1JhbzQnlS8yGD4bvNR+D6oYcKjSP17wg0Pjn+6wAQ8CdhobKuyQO
         V0mn3UMW3Tk0q64hIvuJSIgf0MReyyuWswHfeKMGP0XCH3qIavy8a/h2/NvHwY4L1iZe
         pix1mdWJTmLnIN5E+DO7IaTHxYylTnKIzxI8gE50+WQz/bbPgeoRg8VAfeO1KB85kNeF
         BDdZbLgMi/lm14AJPC4/QRHFv51EX9a4S7ctOn8RDdf4MDDBjtBFPnbHh50ftgkRVwNr
         1g8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738836526; x=1739441326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O95g61PF532xlL2QESo99vnXziiwui859ZgTSUP0Xv8=;
        b=kX5KkoGbKJylgjPh5BKeKnSIb2PuDa5iQyXeW2rA2NIa5LyvIFOSin9Q5XVfg43Xkm
         Lxlz4Uv3kPWE/10i8R0NHe3o2rEJB/VnyWJ1yS3usV8AfsJ1bgvm2TzxJKtIAkA7fpni
         2Z5aX4DMVK9GaIftt+sZPlntePxHKTiJ3uqYnR/Q5vhC/RhCb0uUTlEqiATo/vykHR9F
         Pi4tDoDKfGMuhalTDr6Ia66++/sZOYQEH9kR6a8QBfyx2VuSkxX8+51TqRG8nMgoat9j
         cg77niSSQK7GiJu6mL3dy/ZwWtm4eCTn8+NNP6wvNqGEepKV8Bu4mdYzRvwGYXuivUm5
         YMZg==
X-Forwarded-Encrypted: i=1; AJvYcCXp5lvgOK73zhzZtL/N15iMPaKzrc01EbtPFBgdAcXWIx4LCnOONiwua5VpMtnV3GXUk4mwBRbVuZA+0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzScZ1Z3RvK4RlKCI7L4r4wsX2LebKP9ueF6KkturW78jOIdV4v
	HoQ6z+dDTcano3TMjDU7t681AKYXbswTCwks1++qGZTwSUb8VxTIvbipXn/Mi3ZvakJ3KejnK86
	LN3E=
X-Gm-Gg: ASbGncu53KZjyxU/NXYkQOCSjqsITuZCbXDA49b2Yd6Ax/lws1k5Afhkmofoq/XiopX
	xsdzcnwcBBH6OqAyEtl6cfKPeqG+zjm+/DfdKeEuiPi2vtpbYHXAJo90/T5bMmiPqCnUFlnW9p6
	UOudN9xUt8ZjS7930Wf0wdtBZd/ZvzKfm8ztp6FujNz/n8o8XwMvO2UaUipvxYEX+1F6ARzHQ3a
	83Qb5pgJBMVcFz7+jJZCWo5f4FPW5+OGkOmsmUxl147Zu8T5gHZJNevVMDO/F4zFlPh3KpPJjhL
	pwksm+ufKooKFan1O6sxXd0ovrE/ZfKUkh9SLwjnf1z7bA9x2CjfNK5vUsuv
X-Google-Smtp-Source: AGHT+IHMDkfvCNUK/HIby3h6OMSh5D9fHxMUbwPxuCzdxDPyzd/Hn7eK8DsebYDd9x3rCNunIDakxg==
X-Received: by 2002:a05:600c:3108:b0:434:f753:6012 with SMTP id 5b1f17b1804b1-4390d43e981mr55033545e9.17.1738836525625;
        Thu, 06 Feb 2025 02:08:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93369fsm50606545e9.3.2025.02.06.02.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 02:08:45 -0800 (PST)
Message-ID: <b8e6a496-c0ff-444b-8dd0-f1768ef89e4d@rivosinc.com>
Date: Thu, 6 Feb 2025 11:08:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] RISC-V: add f & d extension validation checks
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-stifle-remake-4e497e96fd66@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-stifle-remake-4e497e96fd66@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_020847_406453_082969EB 
X-CRM114-Status: GOOD (  20.66  )
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

CgpPbiAwNS8wMi8yMDI1IDE3OjA1LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gRnJvbTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBVc2luZyBDbGVtZW50J3Mg
bmV3IHZhbGlkYXRpb24gY2FsbGJhY2tzLCBzdXBwb3J0IGNoZWNraW5nIHRoYXQKPiBkZXBlbmRl
bmNpZXMgaGF2ZSBiZWVuIHNhdGlzZmllZCBmb3IgdGhlIGZsb2F0aW5nIHBvaW50IGV4dGVuc2lv
bnMuCj4gCj4gVGhlIGNoZWNrIGZvciAiZCIgbWlnaHQgYmUgc2xpZ2h0bHkgY29uZnVzaW5nbHkg
c2hvcnRlciB0aGFuIHRoYXQgb2YgImYiLAo+IGRlc3BpdGUgImQiIGRlcGVuZGluZyBvbiAiZiIu
IFRoaXMgaXMgYmVjYXVzZSB0aGUgcmVxdWlyZW1lbnQgdGhhdCBhCj4gaGFydCBzdXBwb3J0aW5n
IGRvdWJsZSBwcmVjaXNpb24gbXVzdCBhbHNvIHN1cHBvcnQgc2luZ2xlIHByZWNpc2lvbiwKPiBz
aG91bGQgYmUgdmFsaWRhdGVkIGJ5IGR0LWJpbmRpbmdzIGV0Yywgbm90IHRoZSBrZXJuZWwgYnV0
IGxhY2sgb2YKPiBzdXBwb3J0IGZvciBzaW5nbGUgcHJlY2lzaW9uIG9ubHkgaXMgYSBsaW1pdGF0
aW9uIG9mIHRoZSBrZXJuZWwuCj4gCj4gU2luY2UgdmVjdG9yIHdpbGwgbm93IGJlIGRpc2FibGVk
IHByb2FjdGl2ZWx5LCB0aGVyZSdzIG5vIG5lZWQgdG8gY2xlYXIKPiB0aGUgYml0IGluIGVsZl9o
d2NhcCBpbiByaXNjdl9maWxsX2h3Y2FwKCkgYW55IGxvbmdlci4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IGluZGV4IDFjMTQ4ZWNlYTYxMi4uYWQ0ZmJhYTRmZjBk
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IEBAIC0xMDksNiArMTA5LDI5IEBAIHN0YXRp
YyBpbnQgcmlzY3ZfZXh0X3ppY2Jvel92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
dF9kYXRhICpkYXRhLAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgcmlzY3Zf
ZXh0X2ZfdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKPiAr
CQkJCWNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRtYXApCj4gK3sKPiArCWlmICghX19yaXNj
dl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX2QpKSB7
Cj4gKwkJcHJfd2Fybl9vbmNlKCJUaGlzIGtlcm5lbCBkb2VzIG5vdCBzdXBwb3J0IHN5c3RlbXMg
d2l0aCBGIGJ1dCBub3QgRFxuIik7Cj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwl9Cj4gKwo+ICsJ
aWYgKCFJU19FTkFCTEVEKENPTkZJR19GUFUpKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiAr
CXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHJpc2N2X2V4dF9kX3ZhbGlkYXRlKGNv
bnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgKmRhdGEsCj4gKwkJCQljb25zdCB1bnNpZ25l
ZCBsb25nICppc2FfYml0bWFwKQo+ICt7Cj4gKwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0ZQVSkp
Cj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gIHN0YXRp
YyBpbnQgcmlzY3ZfZXh0X3ZlY3Rvcl94X3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9pc2Ff
ZXh0X2RhdGEgKmRhdGEsCj4gIAkJCQkgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2Jp
dG1hcCkKPiAgewo+IEBAIC0zNjgsOCArMzkxLDggQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9l
eHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQShpLCBS
SVNDVl9JU0FfRVhUX2kpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEobSwgUklTQ1ZfSVNBX0VY
VF9tKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKGEsIFJJU0NWX0lTQV9FWFRfYSksCj4gLQlf
X1JJU0NWX0lTQV9FWFRfREFUQShmLCBSSVNDVl9JU0FfRVhUX2YpLAo+IC0JX19SSVNDVl9JU0Ff
RVhUX0RBVEEoZCwgUklTQ1ZfSVNBX0VYVF9kKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZB
TElEQVRFKGYsIFJJU0NWX0lTQV9FWFRfZiwgcmlzY3ZfZXh0X2ZfdmFsaWRhdGUpLAo+ICsJX19S
SVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoZCwgUklTQ1ZfSVNBX0VYVF9kLCByaXNjdl9leHRf
ZF92YWxpZGF0ZSksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQShxLCBSSVNDVl9JU0FfRVhUX3Ep
LAo+ICAJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKGMsIFJJU0NWX0lTQV9FWFRfYywgcmlzY3Zf
Y19leHRzKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVF9WQUxJREFURSh2LCBSSVNDVl9J
U0FfRVhUX3YsIHJpc2N2X3ZfZXh0cywgcmlzY3ZfZXh0X3ZlY3Rvcl9mbG9hdF92YWxpZGF0ZSks
CgpIaSBDb25vciwKClRlc3RlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMu
Y29tPgpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoK
VGhhbmtzLAoKQ2zDqW1lbnQKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
