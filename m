Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17065C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 12:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zz2N8RY3YwuLPm3wkpvkytZcEJ/eua/avIO6tuN9EUQ=; b=iEVtacLJV8iaek
	KxmFOHx66IQc+lp7QF2PXfXqBviPjOyeNVMjXPCJcp1Z1n2CSQhNDAjYFMQ3WfRZcF6Nlq3RfFA/5
	A2gBu7HJEvpnGkPsjMareMNxjOQdhSrHOQS32UKMSVCzyC9IETIyg+Q5JaBvEIjf/+zIu/NSQq1gq
	6JbNsA4BP5xkFASKmD9s0NDpguku9weA9v+gdFYdJ6QPl2dy4vDGfvqlK4suSURukDX9iZkXLmmjG
	k9rLBzEs/uoMXeSe6QL6xai1SMFCv6TUiAuA3gfXa6/InXUxwANy+aIWTjsoiTNo+VrKDp84EdVmY
	ncQC2UiERZ9NjiMwr1Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6rZh-0000000Fuf3-0jL1;
	Tue, 14 May 2024 12:48:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6rZd-0000000Fudn-0NcH
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 12:48:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-351cb099fd7so44733f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 05:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715690883; x=1716295683; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uEDd1uZ3WD8w5BLnI3VEk4mficDxDq165y157o9KZ8I=;
        b=Z1nMYxylY179qOks6WPZ3dfa7w4MeHwOK2IBWP+zpaWbJmQuGbF9nSAmP7NXHbW5PH
         uoOIqI7o5kb69nr6jezETEL2xQ/ppQJTTaORASZ+VjGXFbLeRBgqS7q0oudWTqzzRYgJ
         PeeiyrdeHYgXIbVo/5iQY0Y/iY61VVwm6K9S63yjawcNvtYrghaJopbJfXMKcBWaLBIt
         Ug4E3oWZSs5IUq/B0Wmlkpp+qebVxvEHY9fXN/eFfdmqDbv5CN/JcPt/s8ZglfaLMpwS
         /1OI4NZALNGLAPianLe1lne5rXhQMXg2KcjOIKEtH4xBRNwka8VH8k3wrBim4at0X9Rl
         MKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715690883; x=1716295683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEDd1uZ3WD8w5BLnI3VEk4mficDxDq165y157o9KZ8I=;
        b=OJE519kTrCJZZO4696/Uei7jBys4I/XPPpiPNsySMahK5qnrV1qS3Pa5EY1s4Rt9CG
         QB/MBnX3XdKWoA8LFJG9j19N8sQJkyVDBuVp1KQDpA2QSgsPLRcRYodKH7VDhaqSYst1
         IBPNMZcfw3Wec16qDt2kdg690M1OdRsksVmxAKSt12RoXRXqb6pnEv77DmiL8So37ex2
         bldO44Ekpo21e/qdtthRJJCmPQAemiI7VEaH0hkGq2KxkyxfrUpuVdZVCFrTJzlxaut+
         PjKk8H9plzt7pAPcsN9VKRl4MSZ42s7meThzZwyLtUf8kFFl7DNMvxtitvIyjAaRo14H
         ZMGw==
X-Forwarded-Encrypted: i=1; AJvYcCUy5NYZ1ZHRAz8f4r1/R5JXn5BM/9/CpKp0WGAp2xpclUKcJeT6p0htvm5Oi/+ElUb0P4519BzA2qOlSbm1uCnauQmdawtQzlGmdvJFjkTM
X-Gm-Message-State: AOJu0YxxpANHn4uTc8OidoRHtBIiATHUH7qiWsXv3KXm5nR3NmEMjW2W
	GD3wPT+sgMzkLPH6ReE/2kkzqI4GNk3i8YelQkMgpNdGaG424YYTjoJYh/Hddhg=
X-Google-Smtp-Source: AGHT+IFe1dRVmkB1/oPC61qywBvaee0ia6xRc5GKDk0ZftS91pmd8oOAB/sk26VPRQ5WxDKVoBlCig==
X-Received: by 2002:a05:600c:3548:b0:418:9941:ca28 with SMTP id 5b1f17b1804b1-41feac49036mr92211155e9.2.1715690882999;
        Tue, 14 May 2024 05:48:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:1660:5f6e:2f9c:91b9? ([2a01:e0a:999:a3a0:1660:5f6e:2f9c:91b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42016a511a7sm67036525e9.0.2024.05.14.05.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 05:48:02 -0700 (PDT)
Message-ID: <9d0840ff-d00a-4866-8f45-e8676f369ad6@rivosinc.com>
Date: Tue, 14 May 2024 14:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] riscv: add ISA extensions validation
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-3-cleger@rivosinc.com>
 <20240429-subtext-tabby-3a1532f058a5@spud>
 <5d5febd5-d113-4e8c-9535-9e75acf23398@rivosinc.com>
 <20240430-payable-famished-6711765d5ca4@wendy>
 <e57f8b70-7981-42c1-bb04-2060054dd796@rivosinc.com>
 <20240514-sip-exclusion-014b07b01f4c@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240514-sip-exclusion-014b07b01f4c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_054805_348886_E8E8D6B4 
X-CRM114-Status: GOOD (  31.63  )
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

CgpPbiAxNC8wNS8yMDI0IDE0OjQzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVHVlLCBNYXkg
MTQsIDIwMjQgYXQgMDk6NTM6MDhBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAzMC8wNC8yMDI0IDEzOjQ0LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBPbiBUdWUs
IEFwciAzMCwgMjAyNCBhdCAwOToxODo0N0FNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4+Pj4KPj4+Pgo+Pj4+IE9uIDMwLzA0LzIwMjQgMDA6MTUsIENvbm9yIERvb2xleSB3cm90ZToK
Pj4+Pj4gT24gTW9uLCBBcHIgMjksIDIwMjQgYXQgMDU6MDQ6NTVQTSArMDIwMCwgQ2zDqW1lbnQg
TMOpZ2VyIHdyb3RlOgo+Pj4+Pj4gU2luY2UgYSBmZXcgZXh0ZW5zaW9ucyAoWmljYm9tL1ppY2Jv
eikgYWxyZWFkeSBuZWVkcyB2YWxpZGF0aW9uIGFuZAo+Pj4+Pj4gZnV0dXJlIG9uZXMgd2lsbCBu
ZWVkIGl0IGFzIHdlbGwgKFpjKikgYWRkIGEgdmFsaWRhdGUoKSBjYWxsYmFjayB0bwo+Pj4+Pj4g
c3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YS4gVGhpcyByZXF1aXJlIHRvIHJld29yayB0aGUgd2F5
IGV4dGVuc2lvbnMgYXJlCj4+Pj4+PiBwYXJzZWQgYW5kIHNwbGl0IGl0IGluIHR3byBwaGFzZXMu
IEZpcnN0IHBoYXNlIGlzIGlzYSBzdHJpbmcgb3IgaXNhCj4+Pj4+PiBleHRlbnNpb24gbGlzdCBw
YXJzaW5nIGFuZCBjb25zaXN0cyBpbiBlbmFibGluZyBhbGwgdGhlIGV4dGVuc2lvbnMgaW4gYQo+
Pj4+Pj4gdGVtcG9yYXJ5IGJpdG1hc2sgd2l0aG91dCBhbnkgdmFsaWRhdGlvbi4gVGhlIHNlY29u
ZCBzdGVwICJyZXNvbHZlcyIgdGhlCj4+Pj4+PiBmaW5hbCBpc2EgYml0bWFwLCBoYW5kbGluZyBw
b3RlbnRpYWwgbWlzc2luZyBkZXBlbmRlbmNpZXMuIFRoZSBtZWNoYW5pc20KPj4+Pj4+IGlzIHF1
aXRlIHNpbXBsZSBhbmQgc2ltcGx5IHZhbGlkYXRlIGVhY2ggZXh0ZW5zaW9uIGRlc2NyaWJlZCBp
biB0aGUKPj4+Pj4+IHRlbXBvcmFyeSBiaXRtYXAgYmVmb3JlIGVuYWJsaW5nIGl0IGluIHRoZSBm
aW5hbCBpc2EgYml0bWFwLiB2YWxpZGF0ZSgpCj4+Pj4+PiBjYWxsYmFja3MgY2FuIHJldHVybiBl
aXRoZXIgMCBmb3Igc3VjY2VzcywgLUVQUk9CRURFRkVSIGlmIGV4dGVuc2lvbgo+Pj4+Pj4gbmVl
ZHMgdG8gYmUgdmFsaWRhdGVkIGFnYWluIGF0IG5leHQgbG9vcC4gQSBwcmV2aW91cyBJU0EgYml0
bWFwIGlzIGtlcHQKPj4+Pj4+IHRvIGF2b2lkIGxvb3BpbmcgbXV0bGlwbGUgdGltZXMgaWYgYW4g
ZXh0ZW5zaW9uIGRlcGVuZGVuY2llcyBhcmUgbmV2ZXIKPj4+Pj4+IHNhdGlzZmllZCB1bnRpbCB3
ZSByZWFjaCBhIHN0YWJsZSBzdGF0ZS4gSW4gb3JkZXIgdG8gYXZvaWQgYW55IHBvdGVudGlhbAo+
Pj4+Pj4gaW5maW5pdGUgbG9vcGluZywgYWxsb3cgbG9vcGluZyBhIG1heGltdW0gb2YgdGhlIG51
bWJlciBvZiBleHRlbnNpb24gd2UKPj4+Pj4+IGhhbmRsZS4gWmljYm96IGFuZCBaaWNib20gZXh0
ZW5zaW9ucyBhcmUgbW9kaWZpZWQgdG8gdXNlIHRoaXMgdmFsaWRhdGlvbgo+Pj4+Pj4gbWVjaGFu
aXNtLgo+Pj4+Pgo+Pj4+PiBZb3VyIHJlcGx5IHRvIG15IGxhc3QgcmV2aWV3IG9ubHkgdGFsa2Vk
IGFib3V0IHBhcnQgb2YgbXkgY29tbWVudHMsCj4+Pj4+IHdoaWNoIGlzIHVzdWFsbHkgd2hhdCB5
b3UgZG8gd2hlbiB5b3UncmUgZ29ubmEgaW1wbGVtZW50IHRoZSByZXN0LCBidXQKPj4+Pj4geW91
IGhhdmVuJ3QuCj4+Pj4+IEkgbGlrZSB0aGUgY2hhbmdlIHlvdSd2ZSBtYWRlIHRvIHNob3J0ZW4g
bG9vcGluZywgYnV0IEknZCBhdCBsZWFzdCBsaWtlCj4+Pj4+IGEgcmVzcG9uc2UgdG8gd2h5IGEg
c3BsaXQgaXMgbm90IHdvcnRoIGRvaW5nIDopCj4+Pj4KPj4+PiBIaSBDb25vciwKPj4+Pgo+Pj4+
IE1pc3NlZCB0aGF0IHBvaW50IHNpbmNlIEkgd2FzIGZlZWxpbmcgdGhhdCBteSBzb2x1dGlvbiBh
Y3R1YWxseQo+Pj4+IGFkZHJlc3NlcyB5b3VyIGNvbmNlcm5zLiBZb3VyIGFyZ3VtZW50IHdhcyB0
aGF0IHRoZXJlIGlzIG5vIHJlYXNvbiB0bwo+Pj4+IGxvb3AgZm9yIFppY2JvbS9aaWNib3ogYnV0
IHRoYXQgd291bGQgYWxzbyBhcHBseSB0byBaY2YgaW4gY2FzZSB3ZSBhcmUKPj4+PiBvbiBSVjY0
IGFzIHdlbGwgKHNpbmNlIHpjZiBpcyBub3Qgc3VwcG9ydGVkIG9uIFJWNjQpLiBTbyBmb3IgWmNm
LCB0aGF0Cj4+Pj4gd291bGQgbGVhZCB0byB1c2luZyBib3RoIG1lY2FuaXNtIG9yIGFkZGl0aW9u
YWwgaWZkZWZlcnkgd2l0aCBsaXR0bGUgdG8KPj4+PiBubyBhZGRlZCB2YWx1ZSBzaW5jZSB0aGUg
Y3VycmVudCBzb2x1dGlvbiBhY3R1YWxseSBzb2x2ZXMgYm90aCBjYXNlczoKPj4+Pgo+Pj4+IC0g
V2UgZG9uJ3QgaGF2ZSBhbnkgZXh0cmEgbG9vcGluZyBpZiBhbGwgdmFsaWRhdGlvbiBjYWxsYmFj
ayByZXR1cm5zIDAKPj4+PiAoZXhjZXB0IHRoZSBpbml0aWFsIG9uZSBvbiByaXNjdl9pc2FfZXh0
LCB3aGljaCBpcyBraW5kIG9mIHVuYXZvaWRhYmxlKS4KPj4+PiAtIFppY2JvbSwgWmljYm96IGNh
bGxiYWNrcyB3aWxsIGJlIGNhbGxlZCBvbmx5IG9uY2UgKHdoaWNoIHdhcyBvbmUgb2YKPj4+PiB5
b3VyIGNvbmNlcm4pLgo+Pj4+Cj4+Pj4gQWRkaW5nIGEgc2Vjb25kIGtpbmQgb2YgY2FsbGJhY2sg
Zm9yIGFmdGVyIGxvb3AgdmFsaWRhdGlvbiB3b3VsZCBvbmx5Cj4+Pj4gbGVhZCB0byBhIGJ1bmNo
IG9mIGFkZGl0aW9uYWwgbWFjcm9zL2lmZGVmZXJ5IGZvciBleHRlbnNpb25zIHdpdGgKPj4+PiB2
YWxpZGF0ZSgpIGNhbGxiYWNrLCB3aXRoIHZhbGlkYXRlX2VuZCgpIG9yIHdpdGggYm90aCAoaWUg
WmNmKSkuIEZvcgo+Pj4+IHRoZXNlIHJlYXNvbnMsIEkgZG8gbm90IHRoaW5rIHRoZXJlIGlzIGEg
bmVlZCBmb3IgYSBzZXBhcmF0ZSBtZWNoYW5pc20KPj4+PiBub3IgYWRkaXRpb25hbCBjYWxsYmFj
ayBmb3Igc3VjaCBleHRlbnNpb25zIGV4Y2VwdCBhZGRpbmcgZXh0cmEgY29kZQo+Pj4+IHdpdGgg
bm8gcmVhbCBhZGRlZCBmdW5jdGlvbmFsaXR5Lgo+Pj4+Cj4+Pj4gQUZBSUssIHRoZSBwbGF0Zm9y
bSBkcml2ZXIgcHJvYmluZyBtZWNoYW5pc20gd29ya3MgdGhlIHNhbWUsIHRoZSBwcm9iZSgpCj4+
Pj4gY2FsbGJhY2sgaXMgYWN0dWFsbHkgY2FsbGVkIGV2ZW4gaWYgZm9yIHNvbWUgcmVhc29uIHBy
b3BlcnRpZXMgYXJlCj4+Pj4gbWlzc2luZyBmcm9tIG5vZGVzIGZvciBwbGF0Zm9ybSBkZXZpY2Vz
IGFuZCB0aHVzIHRoZSBwcm9iZSgpIHJldHVybnMKPj4+PiAtRUlOVkFMIG9yIHdoYXRldmVyLgo+
Pj4+Cj4+Pj4gSG9wZSB0aGlzIGFuc3dlcnMgeW91ciBxdWVzdGlvbiwKPj4+Cj4+PiBZZWFoLCBw
cmV0dHkgbXVjaCBJIGFtIGhhcHB5IHdpdGgganVzdCBhbiAiaXQncyBub3Qgd29ydGggZG9pbmcg
aXQiCj4+PiByZXNwb25zZS4gR2l2ZW4gaXQgd2Fzbid0IHlvdXIgZmlyc3QgY2hvaWNlLCBJIGRv
dWJ0IHlvdSdyZSBvdmVybHkgaGFwcHkKPj4+IHdpdGggaXQgZWl0aGVyLCBidXQgSSByZWFsbHkg
d291bGQgbGlrZSB0byBhdm9pZCBsb29waW5nIHRvIGNsb3N1cmUgdG8KPj4+IHNvcnQgb3V0IGRl
cGVuZGVuY2llcyAtIHBhcnRpY3VsYXJseSBvbiB0aGUgYm9vdCBDUFUgYmVmb3JlIHdlIGJyaW5n
Cj4+PiBhbnlvbmUgZWxzZSB1cCwgYnV0IGlmIHRoZSBjb2RlIGlzIG5vdyBtb3JlIHByb2FjdGl2
ZSBhYm91dCBicmVha2luZwo+Pj4gb3V0LCBJIHN1cHBvc2UgdGhhdCdsbCBoYXZlIHRvIGRvIDop
Cj4+PiBJIGtpbmRhIHdpc2ggd2UgZGlkbid0IGRvIHRoaXMgYXQgYWxsLCBidXQgSSB0aGluayB3
ZSd2ZSBicm91Z2h0IHRoaXMKPj4+IHVwb24gb3Vyc2VsdmVzIHZpYSBod3Byb2JlLiBJJ20gc3Rp
bGwgb24gdGhlIGZlbmNlIGFzIHRvIHdoZXRoZXIgdGhpbmdzCj4+PiB0aGF0IGFyZSBpbXBsaWVk
IG5lZWQgdG8gYmUgaGFuZGxlZCBpbiB0aGlzIHdheS4gSSB0aGluayBJJ2xsIGJyaW5nIHRoaXMK
Pj4+IHVwIHRvbW9ycm93IGF0IHRoZSB3ZWVrbHkgY2FsbCwgYmVjYXVzZSBzbyBmYXIgaXQncyBv
bmx5IGJlZW4geW91IGFuZCBJCj4+PiBkaXNjdXNzaW5nIHRoaXMgcmVhbGx5IGFuZCBpdCdzIGEg
cG9saWN5IGRlY2lzaW9uIHRoYXQgaHdwcm9iZS1pc3RzCj4+PiBzaG91bGQgYmUgaW52b2x2ZWQg
aW4gSSB0aGluay4KPj4KPj4gSGkgQ29ub3IsCj4+Cj4+IFdlcmUgeW91IGFibGUgdG8gZGlzY3Vz
cyB0aGF0IHRvcGljID8KPiAKPiBJIHJlYWxpc2VkIGxhc3QgbmlnaHQgdGhhdCBJJ2Qgbm90IGdv
dCBiYWNrIHRvIHRoaXMgdGhyZWFkIGFuZCBtZWFudCB0bwo+IGRvIHRoYXQgdG9kYXkgKEkgaGFk
IGFjY2lkZW50YWxseSBkZWxldGVkIGl0IGZyb20gbXkgbWFpbGJveCksIGJ1dCBJIGhhZAo+IGEg
bWlncmFpbmUgdGhpcyBtb3JuaW5nIGFuZCBzbyBkaWRuJ3QuCj4gSSBkaWQgYnJpbmcgaXQgdXAg
YW5kIElJUkMgUGFsbWVyIHdhcyBvZiB0aGUgb3BpbmlvbiB0aGF0IHdlIHNob3VsZCB0cnkKPiBv
dXIgYmVzdCB0byBpbmZlciBleHRlbnNpb25zLgo+IAo+Pj4gSW1wbGllZCBleHRlbnNpb25zIGFz
aWRlLCBJIHRoaW5rIHdlIHdpbGwgZXZlbnR1YWxseSBuZWVkIHRoaXMgc3R1ZmYKPj4+IGFueXdh
eSwgZm9yIGV4dGVuc2lvbnMgdGhhdCBtYWtlIG5vIHNlbnNlIHRvIGNvbnNpZGVyIGlmIGEgY29u
ZmlnIG9wdGlvbgo+Pj4gZm9yIGEgZGVwZW5kZW5jeSBpcyBkaXNhYmxlZC4KPj4+IEZyb20gdGFs
a2luZyB0byBFcmljIEJpZ2dlcnMgdGhlIG90aGVyIHdlZWsgYWJvdXQKPj4+IHJpc2N2X2lzYV9l
eHRlbnNpb25fYXZhaWxhYmxlKCkgSSdtIG9mIHRoZSBvcGluaW9uIHRoYXQgd2UgbmVlZCB0byBk
bwo+Pj4gYmV0dGVyIHdpdGggdGhhdCBpbnRlcmZhY2Ugdy5yLnQuIGV4dGVuc2lvbiBhbmQgY29u
ZmlnIGRlcGVuZGVuY2llcywKPj4+IGFuZCB3aGF0IHNlZW1zIGxpa2UgYSBnb29kIGlkZWEgdG8g
bWUgYXQgdGhlIG1vbWVudCBpcyBwdXR0aW5nIHRlc3RzIGZvcgo+Pj4gSVNfRU5BQkxFRChSSVND
Vl9JU0FfRk9PKSBpbnRvIHRoZXNlIHZhbGlkYXRlIGhvb2tzLgo+Pj4KPj4+IEknbGwgdHJ5IHRv
IGxvb2sgYXQgdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBoZXJlIHRvbW9ycm93Lgo+Pgo+PiBE
aWQgeW91IGZvdW5kIHRpbWUgdG8gbG9vayBhdCB0aGUgaW1wbGVtZW50YXRpb24gPwo+IAo+IE5v
LCB3aXRoIHRoZSBhYm92ZSBleGN1c2UuIEknbGwgdHJ5IHRvIGdldCB0byBpdCB0b2RheSBvciB0
b21vcnJvdy4uLgoKTm8gd29ycmllcywgSSB3YXMgb24gdmFjYXRpb24gYW5kIHdhcyBqdXN0IGNo
ZWNraW5nIGlmIEkgaGFkbid0IG1pc3NlZAphbnl0aGluZyBpbiB0aGUgbWVhbnRpbWUuIFRha2Ug
eW91ciB0aW1lIDspCgpUaGFua3MsCgpDbMOpbWVudAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
