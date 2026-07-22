Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46727C4453C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 17:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODxwDqiuzbIm8tet85QqF2+oF/YVPWpqFagM7Oovn+g=; b=oW1KUIXyXcJjil
	ouriDxNb+HedN9nw9XRITGbQqx7ujZtZd/6bshxmYNyVyI2LRtNrhxAEbBakBvVMNOg50TINRUK32
	bPIh7T9oYzRfNsMJKOV60CBvSCMQBX6jglqStyfgS0kyJ0kfpvPuoe+w67v1Kb26D45XtQPgDCiEZ
	2jjziQ4esM0FGMOf1029puuduv+wLS5buy/gxZ7oWFAMp2rO9ovbJt+DX8RdsARQuzTxDvMwvi3ND
	fAD0wUyB7xqgTPFVOYXYyOT4LfjMBgkgdbIMQoEvN/ERQbvzhq25d1ookf5r7jJ0HbrXxkFK7grDZ
	quZ79fal2K0ygRms9mWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaRf-0000000CQ5l-34hb;
	Wed, 22 Jul 2026 17:09:23 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaRc-0000000CQ54-2vlS
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 17:09:22 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-ca88130e09aso7975096a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 10:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784740160; x=1785344960; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrTCSIzPcJ82u0tUjUSjSEmR3gxr33ajrULj/zhF5g4=;
        b=Odnb9xh5nddsjXnJ8soIb89LHoAqKrRjcfVOUcpvagxcXOJx9KVHxroURwV72UE3oM
         87uZwYq7KxkvM05RoFu1iHZhnyvymBApj8UhjxZKl3wfPde3/oW6BK9X/pvI+PQmE5rX
         BYOv/oKNMvpvpt6s7JnOSACNivX6ERuFDW5S5i/MxO7KiJiUnjqfgj8+WPpb1jQYmyuT
         uD0k/n+jTEWiBbn04EHV9I21miNEeRhJVjEueLJqGxZTmzCQ29NRaXhRUw2H5Hc3Y/Wh
         5fo1y+hfDciQl/D9Uw0yWe7osKM6ubXNBbLWCDdZ+4nfyMcIgu3EkQu+56MSj/Xxt7qY
         JJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784740160; x=1785344960;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hrTCSIzPcJ82u0tUjUSjSEmR3gxr33ajrULj/zhF5g4=;
        b=DjMYLV2rt7BBRDR86g8bs09zJGL1+Dj5SCOiG2nS1cQFunlA5qlUfiCS4F52rBZnjC
         jxTbIxa07onrqCFVP7RlpApnHbbFWvcOioQpVstI/AVk8PbhK1imieHwiMFMUyT1bdjM
         Gz1o/s39/NAQ07B7Y7VkLHDQGwgWTM9OXin3E/zaMyioKM8F8tkdRydrbTB3lHAloJwN
         JEBeOnhMY+3rxFm3kk8yO0fdiGSe+8qECvxkTSxkTafclBjHkOH6skhrCGEe3rmSzHcz
         4K7wcnLVPox+xwbNW6SOa6YlpfuQD00xKPX6PanJIZkyiyNHjCc6jaqKXcU5UKln+R3n
         GoPg==
X-Forwarded-Encrypted: i=1; AHgh+RqBpGM9Mpa9jo0jvDTi87pMy4CR5r4qeITR2UtcUSziyVNkSDmxLUcYbbA3mxyDSe9tOO0e6sFfALnuXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzClX5FdgUJLSML8DhQiv1aYn9xLI68EWX0Y3U51rNl1YpvKFbR
	jbo/TJUZtSIEpMDYmlUT/0jILm/2csdrC9yX5XSfTKLo01nbvdwTVSEt
X-Gm-Gg: AR+sD1221M008mZSxa7df/ZQzye0Xo/mIIZ95G7e4mTM+V8eqQBfs8qDg33/+eHh2ai
	6P4KPxX5rS5IZowxGhx3H5rrk+Nt7j+1GQiioXCLzWqMh0xNbfBoUKaxYaU6/p+VByZbSRMmj0G
	w5B9fT8TskTed8NWULwqQer/aqtILKM1tcDuyFU425MHhDq+uAwLPquFkz6Z7dwIG51Kp92F9ab
	9IkuHyoTuzqcLkEnHsR4V2sS3nLtEzREYLQArA3hXUlrrPXTlTwsTUMLChdFcg3AkOn0Y/QI8IO
	3aoY26qE6I86ENULddsQ6U6+kC36jAhdUfZ6fWdn2mvGzNHrML5LqRecDtL1ScfswDejI0cr2oF
	anT8pxyKrRBwXoDDYuc27uUUqr64O/WJEOAkd9qgnF+orynyYOnxGbs3GKDZkinWu7AKi8kDP0M
	Z5/r0OXz6WxpaMGcKeLdAfHY2FwpNW94pMhSGEPPTGZXs7wwIGW5w=
X-Received: by 2002:a05:6300:8d:b0:3bf:83f3:b810 with SMTP id adf61e73a8af0-3c3ad6488e4mr25887162637.29.1784740159578;
        Wed, 22 Jul 2026 10:09:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0f58dfsm1471345a12.13.2026.07.22.10.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 10:09:18 -0700 (PDT)
Message-ID: <ee6a2fdd-9e6e-49f5-a95f-af44a1a8edc6@roeck-us.net>
Date: Wed, 22 Jul 2026 10:09:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Sensylink
To: Conor Dooley <conor@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-doc@vger.kernel.org
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
 <20260721-dill-dab-df15585090d2@spud>
 <673be23a-2a84-43b7-9be7-a661cf0e7935@roeck-us.net>
 <20260722-devious-seventh-9859bb3741b3@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260722-devious-seventh-9859bb3741b3@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_100920_756648_00CC8B79 
X-CRM114-Status: GOOD (  24.70  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNy8yMi8yNiAwOToxNSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDIxLCAy
MDI2IGF0IDEwOjU2OjM2QU0gLTA3MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4+IE9uIDcvMjEv
MjYgMDg6NDksIENvbm9yIERvb2xleSB3cm90ZToKPj4+IE9uIFR1ZSwgSnVsIDIxLCAyMDI2IGF0
IDAyOjQ4OjI3QU0gLTA3MDAsIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4+Pj4gQWRkIHRoZSB2ZW5k
b3IgcHJlZml4IGZvciBTZW5zeWxpbmsgTWljcm9lbGVjdHJvbmljcy4KPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguZGV2Pgo+Pj4+IC0t
LQo+Pj4+ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4
ZXMueWFtbCB8IDIgKysKPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+
Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Zl
bmRvci1wcmVmaXhlcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Zl
bmRvci1wcmVmaXhlcy55YW1sCj4+Pj4gaW5kZXggMzk2MDQ0ZjM2OGU3Li4yMmQwZDI2ZjFiYmQg
MTAwNjQ0Cj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRv
ci1wcmVmaXhlcy55YW1sCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCj4+Pj4gQEAgLTE0NjcsNiArMTQ2Nyw4IEBAIHBhdHRl
cm5Qcm9wZXJ0aWVzOgo+Pj4+ICAgICAgICBkZXNjcmlwdGlvbjogU2Vuc2lyaW9uIEFHCj4+Pj4g
ICAgICAiXnNlbnNvcnRlaywuKiI6Cj4+Pj4gICAgICAgIGRlc2NyaXB0aW9uOiBTZW5zb3J0ZWsg
VGVjaG5vbG9neSBDb3Jwb3JhdGlvbgo+Pj4+ICsgICJec2Vuc3lsaW5rLC4qIjoKPj4+PiArICAg
IGRlc2NyaXB0aW9uOiBTZW5zeWxpbmsgTWljcm9lbGVjdHJvbmljcyBUZWNobm9sb2d5IENvLiwg
THRkLgo+Pj4KPj4+IEdvb2dsaW5nIHRoZSBjb21wYW55IHRvIHNlZSB3aGF0IHRoZWlyIHdlYnNp
dGUgaXMsIEkgc2VlbSB0byBzZWUgYQo+Pj4gZGlmZmVyZW50IG5hbWUgZm9yIHRoZSBjb21wYW55
OiBTaGFuZ2hhaSBTZW5zeWxpbmsgTWljcm9lbGVjdHJvbmljcyBJbmMuCj4+PiBUaGVpciB3ZWJz
aXRlIGhhcyB0aGF0IHdpdGggdGhlIFNoYW5naGFpIGRyb3BwZWQuCj4+Pgo+Pj4gQWxzbywgcHJv
YmFibHkgdGhlIGNvbW1pdCBtZXNzYWdlIHNob3VsZCBjb250YWluCj4+PiBMaW5rOiBodHRwczov
L2VuLnNlbnN5bGluay5jb20vCj4+Pgo+Pgo+PiBBc2tpbmcgR29vZ2xlIHNlYXJjaDogIldoeSB0
aGUgdHdvIG5hbWVzID8gRGlkIHRoZXkgcmVuYW1lIHRoZW1zZWx2ZXMgYXQgc29tZSBwb2ludCA/
Igo+IAo+IFRoZSBnb29nbGUgc2VhcmNoICJBSSIgcmVzcG9uc2Ugd2FzIHdoYXQgc2hvd2VkIG1l
IHRoZSBkaWZmZXJlbnQgbmFtZSwKPiBzb3VuZHMgbGlrZSBJIHNob3VsZCBoYXZlIHF1ZXN0aW9u
ZWQgaXQgc29tZSBtb3JlIQo+IAo+Pgo+PiBSZXNwb25zZToKPj4KPj4gVW5kZXJzdGFuZGluZyB0
aGUgTmFtZSBTdHJ1Y3R1cmUKPj4KPj4gMS4gRW5nbGlzaCBMZWdhbCBOYW1lIHZzLiBNYXJrZXRp
bmcgQWJicmV2aWF0aW9uCj4+Cj4+IFNlbnN5bGluayBNaWNyb2VsZWN0cm9uaWNzIFRlY2hub2xv
Z3kgQ28uLCBMdGQuOgo+PiBUaGlzIGlzIHRoZSBsaXRlcmFsIHRyYW5zbGF0aW9uIG9mIHRoZWly
IGZ1bGwsIGZvcm1hbCByZWdpc3RlcmVkIGNvcnBvcmF0ZSBuYW1lCj4+IHVzZWQgZm9yIGludGVy
bmF0aW9uYWwgdHJhZGUsIGN1c3RvbXMsIGFuZCBsZWdhbCBkb2N1bWVudGF0aW9uLgo+Pgo+PiBT
ZW5zeWxpbmsgTWljcm9lbGVjdHJvbmljcyBJbmMuOgo+PiBUaGlzIGlzIGEgc2ltcGxpZmllZCwg
V2VzdGVybml6ZWQgYWJicmV2aWF0aW9uIHVzZWQgb24gdGhlaXIgb2ZmaWNpYWwKPj4gRW5nbGlz
aCB3ZWJzaXRlIGFuZCBtYXJrZXRpbmcgbWF0ZXJpYWxzIGZvciBjbGVhbmVyIGdsb2JhbCBicmFu
ZGluZy4KPj4KPj4gMi4gVGhlIE5hdGl2ZSBDaGluZXNlIE5hbWUKPj4KPj4g5LiK5rW355Sz55+9
5YeM5b6u55S15a2Q56eR5oqA6IKh5Lu95pyJ6ZmQ5YWs5Y+4IChTaGFuZ2hhaSBTaGVueGlsaW5n
IE1pY3JvZWxlY3Ryb25pY3MgVGVjaG5vbG9neQo+PiBDby4sIEx0ZC4pOiBUaGlzIGlzIHRoZSBj
b21wYW55J3Mgc29sZSwgb2ZmaWNpYWwgbGVnYWwgbmFtZSByZWdpc3RlcmVkIHdpdGgKPj4gdGhl
IENoaW5lc2UgZ292ZXJubWVudC4KPj4KPj4gIlNlbnN5bGluayIgaXMgYSBwb3J0bWFudGVhdSBj
cmVhdGVkIHNwZWNpZmljYWxseSBmb3IgaW50ZXJuYXRpb25hbCBtYXJrZXRzLAo+PiBibGVuZGlu
ZyAiU2Vuc2luZyIgKHRoZWlyIGNvcmUgdGVjaG5vbG9neSkgYW5kICJMaW5rIiAodGhlaXIgaW50
ZXJmYWNlIGFuZAo+PiBjb25uZWN0aXZpdHkgcHJvZHVjdHMpLgo+Pgo+PiBQcm9kZGluZyBmdXJ0
aGVyLCBhc2tpbmcgaWYgdGhlIHByZXZpb3VzIHJlc3BvbnNlIHdhcyBjb21wbGV0ZSwgaXQgdGVs
bHMKPj4gbWUgdGhhdCB0aGVyZSB3YXMgYSBuYW1lIGNoYW5nZToKPj4KPj4gQWNjb3JkaW5nIHRv
IENoaW5lc2UgY29ycG9yYXRlIHJlZ2lzdHJ5IGRhdGEgKHZpYSBUaWFueWFuY2hhIGFuZCBRY2Mp
LAo+PiB0aGV5IGRpZCBjaGFuZ2UgdGhlaXIgb2ZmaWNpYWwgQ2hpbmVzZSBsZWdhbCBuYW1lOgo+
Pgo+PiBPbGQgTmFtZTog5LiK5rW355Sz55+95YeM5b6u55S15a2Q56eR5oqA5pyJ6ZmQ5YWs5Y+4
IChTaGFuZ2hhaSBTZW5zeWxpbmsgTWljcm9lbGVjdHJvbmljcyBUZWNobm9sb2d5Cj4+IENvLiwg
THRkLikKPj4KPj4gTmV3IE5hbWU6IOS4iua1t+eUs+efveWHjOW+rueUteWtkOenkeaKgOiCoeS7
veaciemZkOWFrOWPuCAoU2hhbmdoYWkgU2Vuc3lsaW5rIE1pY3JvZWxlY3Ryb25pY3MgVGVjaG5v
bG9neQo+PiBDby4sIEx0ZC4gYnkgU2hhcmVzIC8gSm9pbnQtU3RvY2sgQ29tcGFueSkKPj4KPj4g
SSBkb24ndCBrbm93IGlmIExpbnV4IGhhcyBhIHBvbGljeSBhYm91dCBMZWdhbCB2cy4gTWFya2V0
aW5nIG5hbWVzLiBQZXJzb25hbGx5Cj4+IEkgZG9uJ3QgaGF2ZSBhbiBvcGluaW9uLiBZb3VyIGNh
bGwsIHJlYWxseS4KPiAKPiBJIGRvbid0IGtub3cgd2hhdCB0aGUgcG9saWN5IGlzLCBvciBpZiB0
aGVyZSBpcyBvbmUsIGJ1dCBwZXJzb25hbGx5IEkKPiB3b3VsZG4ndCB1c2UgdGhlIHdlc3Rlcm5p
c2VkIGFiYnJldmlhdGlvbiBzaW5jZSB0aGV5IG1heSBkZWNpZGUgdG8gcmVicmFuZAo+IHRoYXQg
ZXRjIGFuZCB0aGUgdmVuZG9yIHByZWZpeCBpbmZvcm1hdGlvbiBzaG91bGQgcmVtYWluIHN0YXRp
Yy4KPiAKPiBTbyB0aGlzIGlzIHByb2JhYmx5IGZpbmUgYXMtaXMsIGp1c3QgSSdkIGxpa2UgdG8g
c2VlIHRoYXQgbGluayBhZGRlZCB0bwo+IHRoZWlyIHdlYnNpdGUuCj4gCj4gVGhhbmtzIChhbmQg
dGhhbmtzIGZvciBkb2luZyB0aGUgZXh0cmEgZGlnZ2luZyksCgpQYXJ0IG9mIHRoYXQgZXh0cmEg
ZGlnZ2luZyBub3dhZGF5cyBpcyB0byBhc2sgaXQgaWYgaXRzIGluaXRpYWwgcmVzcG9uc2UKaXMg
cmVhbCBvciBpZiBpdCB3YXMgaGFsbHVjaW5hdGVkLiBTYWRseSBlbm91Z2gsIG1vc3Qgb2YgdGhl
IHRpbWUgaXQgd2lsbAphZG1pdCB0aGF0IGF0IGxlYXN0IHBhcnQgb2YgdGhlIGluaXRpYWwgcmVz
cG9uc2UgZG9lcyBub3QgbWF0Y2ggcmVhbGl0eS4KVGhhdCB3YXMgdGhlIGNhc2UgaGVyZSBhcyB3
ZWxsLCBiZWNhdXNlIGl0IGluaXRpYWxseSBkaWQgY2xhaW0gdGhhdCB0aGUKY29tcGFueSBuZXZl
ciBjaGFuZ2VkIHRoZWlyIG5hbWUgKG9mIGNvdXJzZSwgdGhlIG5leHQgcXVlc3Rpb24gdG8gYXNr
CndvdWxkIGJlIGlmIGl0IHJlYWxseSBjaGFuZ2VkIGl0cyBuYW1lIG9yIGlmIHRoYXQgd2FzIGFu
b3RoZXIKaGFsbHVjaW5hdGlvbiA7LSkuCgpHdWVudGVyCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
