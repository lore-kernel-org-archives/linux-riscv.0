Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B2BC02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSIiR+lXkL351Ef0rhp3sTnj99D4pXs1xy71vemAtf8=; b=NkJhxLCDSyGwhR
	uFDMQ9gROlfwazbSttwwoWxoR5wgscXLxix1Um3jPU0DgyHu3/DEjQqSYvQrGWDa0sLyOuH8NG3VE
	pprBT/HxCdRI0PSY3ZGSqm9y1M4RsYvkFSJAUEV8/yO6jk74bI1ECbf2YXwticNNA4nmrCcqP4DWH
	iK8JuLLfEeDkvdPRmD9VJSsdP/FJibLzt7HPYY8lGje1LeEoxTv6HsYSFOxoXWnn/ca5tklbEnRgg
	8ouAf8p+RkFO4TNVvBM6xwny2zPw0m8c6Z21xVNWzjNFnd5CHXUmsHhgAOKux62VP6D8WgvRuZ6wP
	nfW94ZShr0P2nKNxu/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1RW-00000006K9C-29GV;
	Thu, 06 Feb 2025 12:57:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1Qn-00000006K4M-1kVQ
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 12:56:34 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43618283d48so6019955e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 04:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738846592; x=1739451392; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dSneZhQMz42NLjIZ9INmqk/5Ehqq2enW8mbh8jsOOB0=;
        b=q87nlmfHBR/lPLkOXkz9hv6ad4S9FmvxqCXQvFck3y+1p9kD5qmHAcpJy8rjNgGFkZ
         G0HU05fjukbLx0ji8RG/2P/+noZj1G/zbmoPGNa8xQZTRCfT8TvdduEH5AnPTBCF1QFt
         SHXxrdB0LbjTrCyS0GdNiiVUK1X3kQg+tQFRnNeR80k5X6DTkNhC/J1YDQBjDHGjDPKi
         ykevNRektDDmTjGpE99s+kxYXwwg8CjqVemLziR0CYOgQ5cPdycGEi9nipA+dLFVmaed
         V1kjwzLYIt4xqsin8//oh5Q5RR3pbdt7XeskpA2H76cFIuR7GIaEPbpxFpPEN1DDrv0u
         ctVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738846592; x=1739451392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSneZhQMz42NLjIZ9INmqk/5Ehqq2enW8mbh8jsOOB0=;
        b=o7aD//8FGnuMA8m11jbld5sdnvQmZKHCgs+q66ecT9aPEro7/3TUpqIXu6p7DaOO0H
         KVUKdOVXQbjwgiCYDaB0c7oTXo29V0ywHsJ9CS3jEuc2ixuxHAhgWb3Q6ks2+08exIBd
         BgqzF5udkGK0dpJAB2z6ipwoSYyOpA7WoOltd2VI6PO557QIV4J415ZCN9MREnrXr2Ms
         3x2UbUAowvCF3M05uGdV8GancAft0/rjSHicXj9CiVaK2e6AFyxoq58IEJrU81+Dp/b6
         PBKuuzwEIj5yI1Ddxypprm+sXSnT1fuVoGGYrVqAcMx6gcbYGEjwmujBBbBxXUsAKGAl
         nsug==
X-Gm-Message-State: AOJu0YyN5J+7WmVR6KWcYNvkw3v49+lYMTlUk6zNbVMJtW6X4NA7C5ej
	+dUROPsHi3/AIAd0nd1tChjawxlmhDb2G2sSO8Pj10YsK+/ANRPRABIqqKCVP00=
X-Gm-Gg: ASbGncskx8KhA0N9fVaBZCbCMoA4AJWXvIuM/3ybQ3KNzE7lEPmiBlyzAwnGgVPv0Bf
	jPwBHbYuZgfrf616Dy6WXQTurILiGfxharmB5dNE8x6yDJ5AjTudGp9lbkpuyKmrFqvHU46jCaY
	gMd1tc5W64RNfKDSShdso6Y9Fy0aBhjNklHuAtakVTKLMNnVrEEZxgfBcJFEIYMxESS73XWbcUf
	9VNUqMT1Ndz6Sf+eTLNLU/q30IRqV1K2Z5CxRBgpESpooDIcxxnAzDVMS4vIUCEKVXbw1rOEnQQ
	BfmwKn4Bgypr5QZ2EkspzoOMCG9YAQHZenCV7qy2MgOi6xnXEBnCaRXTjafE
X-Google-Smtp-Source: AGHT+IHo0rAwCXLXwfKWz6RSqfUjc9Bk6Vt9OF485t+NIZ62i+CSdactAKssxCygX1CrtVfPW8ntaQ==
X-Received: by 2002:a05:600c:3b0f:b0:434:a529:3b87 with SMTP id 5b1f17b1804b1-4390d434065mr56547865e9.10.1738846591542;
        Thu, 06 Feb 2025 04:56:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd8000sm18420605e9.37.2025.02.06.04.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 04:56:31 -0800 (PST)
Message-ID: <00485221-2343-4d5c-93ca-3a28a59427d2@rivosinc.com>
Date: Thu, 6 Feb 2025 13:56:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] RISC-V: add vector crypto extension validation
 checks
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>, Eric Biggers <ebiggers@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-quench-entrench-09bed8c8c823@spud>
 <00dc2fb7-da9b-42c3-9c3b-47d917df7cf6@rivosinc.com>
 <20250206-overcook-legibly-0350a9af8a2a@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250206-overcook-legibly-0350a9af8a2a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_045633_647896_5D8939EF 
X-CRM114-Status: GOOD (  17.94  )
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

CgpPbiAwNi8wMi8yMDI1IDEyOjI0LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBGZWIg
MDYsIDIwMjUgYXQgMTE6MjA6MzVBTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBP
biAwNS8wMi8yMDI1IDE3OjA1LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBGcm9tOiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Pj4KPj4+IFVzaW5nIENsZW1lbnQn
cyBuZXcgdmFsaWRhdGlvbiBjYWxsYmFja3MsIHN1cHBvcnQgY2hlY2tpbmcgdGhhdAo+Pj4gZGVw
ZW5kZW5jaWVzIGhhdmUgYmVlbiBzYXRpc2ZpZWQgZm9yIHRoZSB2ZWN0b3IgY3JweXRvIGV4dGVu
c2lvbnMuCj4+PiBDdXJyZW50bHkgcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoPHZlY3Rv
ciBjcnlwdG8+KSB3aWxsIHJldHVybgo+Pj4gdHJ1ZSBvbiBzeXN0ZW1zIHRoYXQgc3VwcG9ydCB0
aGUgZXh0ZW5zaW9ucyBidXQgdmVjdG9yIGl0c2VsZiBoYXMgYmVlbgo+Pj4gZGlzYWJsZWQgYnkg
dGhlIGtlcm5lbCwgYWRkaW5nIHZhbGlkYXRpb24gY2FsbGJhY2tzIHdpbGwgcHJldmVudCBzdWNo
IGEKPj4+IHNjZW5hcmlvIGZyb20gb2NjdXJpbmcgYW5kIG1ha2UgdGhlIGJlaGF2aW91ciBvZiB0
aGUgZXh0ZW5zaW9uIGRldGVjdGlvbgo+Pj4gZnVuY3Rpb25zIG1vcmUgY29uc2lzdGVudCB3aXRo
IHVzZXIgZXhwZWN0YXRpb25zIC0gaXQncyBub3QgZXhwZWN0ZWQgdG8KPj4+IGhhdmUgdG8gY2hl
Y2sgZm9yIHZlY3RvciBBTkQgdGhlIHNwZWNpZmljIGNyeXB0byBleHRlbnNpb24uCj4+Pgo+Pj4g
VGhlIDEuMC4wIFZlY3RvciBjcnlwdG8gc3BlYyBzdGF0ZXM6Cj4+PiAJVGhlIFp2a25oYiBhbmQg
WnZiYyBWZWN0b3IgQ3J5cHRvIEV4dGVuc2lvbnMgLS1hbmQgYWNjb3JkaW5nbHkKPj4+IAl0aGUg
Y29tcG9zaXRlIGV4dGVuc2lvbnMgWnZrbiBhbmQgWnZrcy0tIHJlcXVpcmUgYSBadmU2NHggYmFz
ZSwKPj4+IAlvciBhcHBsaWNhdGlvbiAoIlYiKSBiYXNlIFZlY3RvciBFeHRlbnNpb24uIEFsbCBv
ZiB0aGUgb3RoZXIKPj4+IAlWZWN0b3IgQ3J5cHRvIEV4dGVuc2lvbnMgY2FuIGJlIGJ1aWx0IG9u
IGFueSBlbWJlZGRlZCAoWnZlKikgb3IKPj4+IAlhcHBsaWNhdGlvbiAoIlYiKSBiYXNlIFZlY3Rv
ciBFeHRlbnNpb24uCj4+PiBhbmQgdGhpcyBjb3VsZCBiZSB1c2VkIGFzIHRoZSBiYXNpcyBmb3Ig
Y2hlY2tpbmcgdGhhdCB0aGUgY29ycmVjdCBiYXNlCj4+PiBmb3IgaW5kaXZpZHVhbCBjcnlwdG8g
ZXh0ZW5zaW9ucywgYnV0IHRoYXQncyBub3QgcmVhbGx5IHRoZSBrZXJuZWwncyBqb2IKPj4+IGlu
IG15IG9waW5pb24gYW5kIGl0IGlzIHN1ZmZpY2llbnQgdG8gbGVhdmUgdGhhdCBzb3J0IG9mIHBy
ZWNpc2lvbiB0bwo+Pj4gdGhlIGR0LWJpbmRpbmdzLiBUaGUga2VybmVsIG9ubHkgbmVlZHMgdG8g
bWFrZSBzdXJlIHRoYXQgdmVjdG9yLCBpbiBzb21lCj4+PiBmb3JtLCBpcyBhdmFpbGFibGUuCj4+
Pgo+Pj4gU2luY2UgdmVjdG9yIHdpbGwgbm93IGJlIGRpc2FibGVkIHByb2FjdGl2ZWx5LCB0aGVy
ZSdzIG5vIG5lZWQgdG8gY2xlYXIKPj4+IHRoZSBiaXQgaW4gZWxmX2h3Y2FwIGluIHJpc2N2X2Zp
bGxfaHdjYXAoKSBhbnkgbG9uZ2VyLgo+Pgo+PiBUbyB3aGljaCBwYXJ0IG9mIHRoZSBjb21taXQg
ZG9lcyB0aGlzIHJlZmVyIHRvID8KPiAKPiBDb3B5LXBhc3RlIG1pc3Rha2Ugd2hlbiBzcGxpdHRp
bmcgaW4gdHdvLCB3aG9vcHMuCj4gCj4+PiBAQCAtMzk3LDggKzQxNCw4IEBAIGNvbnN0IHN0cnVj
dCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+Pj4gIAlfX1JJU0NWX0lT
QV9FWFRfREFUQSh6a3NlZCwgUklTQ1ZfSVNBX0VYVF9aS1NFRCksCj4+PiAgCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHprc2gsIFJJU0NWX0lTQV9FWFRfWktTSCksCj4+PiAgCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBKHp0c28sIFJJU0NWX0lTQV9FWFRfWlRTTyksCj4+PiAtCV9fUklTQ1ZfSVNBX0VYVF9T
VVBFUlNFVCh6dmJiLCBSSVNDVl9JU0FfRVhUX1pWQkIsIHJpc2N2X3p2YmJfZXh0cyksCj4+PiAt
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmMsIFJJU0NWX0lTQV9FWFRfWlZCQyksCj4+PiArCV9f
UklTQ1ZfSVNBX0VYVF9TVVBFUlNFVF9WQUxJREFURSh6dmJiLCBSSVNDVl9JU0FfRVhUX1pWQkIs
IHJpc2N2X3p2YmJfZXh0cywgcmlzY3ZfZXh0X3ZlY3Rvcl94X3ZhbGlkYXRlKSwKPj4+ICsJX19S
SVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoenZiYywgUklTQ1ZfSVNBX0VYVF9aVkJDLCByaXNj
dl9leHRfdmVjdG9yX2NyeXB0b192YWxpZGF0ZSksCj4gCj4+Cj4+IEknbSBub3Qgc3VyZSBpZiBJ
IGFscmVhZHkgbWFkZSB0aGF0IGNvbW1lbnQsIHNvIGhlcmUgd2UgZ28gYWdhaW4uCj4+IFNob3Vs
ZG4ndCBadmJiIHVzZSByaXNjdl9leHRfdmVjdG9yX2NyeXB0b192YWxpZGF0ZSgpIGFzIHdlbGwg
PyAgVGhlCj4+IHNwZWMgc3RhdGVzIHRoYXQgWnZiYiBpcyBhIHN1cGVyc2V0IG9mIFp2a2IgYW5k
IFp2a2IgdXNlcyB0aGUKPj4gcmlzY3ZfZXh0X3ZlY3Rvcl9jcnlwdG9fdmFsaWRhdGUoKSB2YWxp
ZGF0aW9uIGNhbGxiYWNrLiBJIGd1ZXNzIFp2YmMKPj4gc2hvdWxkIGFsc28gdXNlIGl0IGJhc2Vk
IG9uIHlvdXIgc3BlYyBleGNlcnB0IGluIHRoZSBjb21tbWl0IGxvZy4KPiAKPiBadmJjIGRvZXMg
dXNlIGl0LCBubz8gSSdsbCBhbWVuZCB0aGUgWnZiYiBvbmUsIHRoZXJlIHNob3VsZCBvbmx5IGJl
IHR3bwo+IHVzZXJzIG9mIHRoZSAieCIgdmFyaWFudC4KCk9oIHllcyBadmJjIGlzIGFscmVhZHkg
b2ssIGZvcmdldCB0aGF0IHRoZW4uCgpDbMOpbWVudAoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
