Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34289C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWjVdmTXYX77YV2faV0gLPEowycNvke1kBqZEgKRTtk=; b=5DWn/k46nVsHNB
	3pgOfAOFKgpskwOd56mWpvnHjngZJ12YpDKR19c2apCaT4tA3uL3jvOAi2dlNdXkKduPhSFbT+xvZ
	SdyhouDTl9SQjQHC0rmYcLYzp84VJFbuC2vPJMQNAEq07G7iEkSTqhzL6O4592L5xSIZgFM9fZ6MP
	8Xhft9OkuCsrAla3uvYig1xK3dkeCw7dMHXsiUI63wh1n/AuAP7pxHFtFVhx75iFM9c8PofrAtWOi
	/qpxvSo429R1hNTqih1PT/Dv5rDKuI/tkGTluk9mDf6d8lzbDvFrXLcKdK+x2+cYAj+XD0RVZC1wp
	zo3vCc0GyGqnhD7J9i8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkfC-0000000CkTZ-0Gls;
	Tue, 16 Apr 2024 15:24:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkf8-0000000CkP8-0jl1
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 15:24:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-346407b8c9aso1839103f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713281032; x=1713885832; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ftHdCf+Oy0iSSs5fiaJVa2OnViNL7pkEe11MNtYDb00=;
        b=Rb09kG2y8l1WRYAUIiWz8dym9S8xUDRX1uWS41+nfRXZC33SDWc6DZcfEI6uXwmI/B
         MsSoT+nXsPNBVVq1ER2yQI6jtppiedhDuycxQ/QQirJ96Jjv14KWgbiGH7egmYzTnFUU
         YBr0k5hUVlQwpFQzriLACcAIavZTw31J0r3WWC7OW47VqqDAEdf95tVay08CoLkIKE/2
         IyZO50rJbPnK+xzlc4eqbpnv6d+0MgSywogpOsK99WF6d3zWY8OANlCkZ7ZRGFjgaPRM
         +RrQDblrBqSfsmUFtWsNyhC7PY82cJntsYYIErjAjp1JFcLDA3dFVmYaq2Bcpi7/Bn8R
         REAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713281032; x=1713885832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftHdCf+Oy0iSSs5fiaJVa2OnViNL7pkEe11MNtYDb00=;
        b=b5PB07ZkBOUFf8c2DHaFBdTiMOTKTiqWIbsd1Dv/ZXkLGfJLPbZiR3PWlmMb5rJTUO
         lC0qOylEMrQgE9JrfmRKwUbVJQJ2PsKAaJGCY+eCIdwhdg6b6Dfym6L8wv3DGfQXPMa+
         +7JIvl1WyxFvOcXf+s8RH/KwtbyymXt7gvbYE/BLUOrrcrw/8dbCybS83RWSVof8rGd+
         4M9toJyeHJbIjKktWbG1BHenHd0TbKwQgrxgkviZSRlhv22IGodc6G+yS3IeeY5PStHI
         85/ezRSfNcL1+jJIOmrLB/yfoEtjsdZq2KBygXN/uFzJ8xsoGj2OG0QpVDN2sWYqwv3V
         /3eg==
X-Forwarded-Encrypted: i=1; AJvYcCXOYF0A3I3dJ9CQIGIedVHdSM72Rce8iMd/x3PtCC5D05ArOLJJTh+x+5lxguhCGMVpLbMbg3bvVEKAIY0TRvH0Z6Qt4oSuDoocV1e0IrHN
X-Gm-Message-State: AOJu0YxrF0q9/m4wTf5Ug2VmXcthLrOzo0aAOoYvEhabFp+aG5haMDl4
	hz7JvC2WF6+/gRW2GElDhWaxDGIJM3ytGqfru905ccDBNjJ8NQKagMl+0skwvNU=
X-Google-Smtp-Source: AGHT+IFao7Xx/Iig7k1Su+KI3NkDAc6z/M7OBmPS/atvQDSy7dIv8/22UyweiFrQmQy3+uJBLdIOwQ==
X-Received: by 2002:adf:f308:0:b0:346:65dd:55e6 with SMTP id i8-20020adff308000000b0034665dd55e6mr8879060wro.1.1713281032278;
        Tue, 16 Apr 2024 08:23:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:8df:1203:de22:f515? ([2a01:e0a:999:a3a0:8df:1203:de22:f515])
        by smtp.gmail.com with ESMTPSA id gb32-20020a05600045a000b003462b54bc8asm15162474wrb.109.2024.04.16.08.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 08:23:51 -0700 (PDT)
Message-ID: <1eab3b4f-0d46-4df5-b574-6a5f796d3bcf@rivosinc.com>
Date: Tue, 16 Apr 2024 17:23:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Deepak Gupta <debug@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240410091106.749233-8-cleger@rivosinc.com>
 <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
 <20240410-jawless-cavalry-a3eaf9c562a4@spud>
 <20240410-judgingly-appease-5df493852b70@spud>
 <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
 <1287e6e9-cb8e-4a78-9195-ce29f1c4bace@rivosinc.com>
 <20240411-superglue-errant-b32e5118695f@wendy>
 <c86f9fa8-e273-4509-83fa-f21d3265d5c9@rivosinc.com>
 <20240411-backwater-opal-00c9aed2231e@wendy>
 <5eda3278-24bc-4c17-a741-523ad5ff79f7@rivosinc.com>
 <20240416-gave-apron-3234098ce416@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240416-gave-apron-3234098ce416@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_082358_227193_240FD61C 
X-CRM114-Status: GOOD (  25.82  )
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

CgpPbiAxNi8wNC8yMDI0IDE2OjU0LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gTW9uLCBBcHIg
MTUsIDIwMjQgYXQgMTE6MTA6MjRBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAxMS8wNC8yMDI0IDEzOjUzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBPbiBUaHUs
IEFwciAxMSwgMjAyNCBhdCAxMTowODoyMUFNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4+Pj4+PiBJZiB3ZSBjb25zaWRlciB0byBoYXZlIHBvdGVudGlhbGx5IGJyb2tlbiBpc2Egc3Ry
aW5nIChpZSBleHRlbnNpb25zCj4+Pj4+PiBkZXBlbmRlbmNpZXMgbm90IGNvcnJlY3RseSBoYW5k
bGVkKSwgdGhlbiB3ZSdsbCBuZWVkIHNvbWUgd2F5IHRvCj4+Pj4+PiB2YWxpZGF0ZSB0aGlzIHdp
dGhpbiB0aGUga2VybmVsLgo+Pj4+Pgo+Pj4+PiBObywgdGhlIERUIHBhc3NlZCB0byB0aGUga2Vy
bmVsIHNob3VsZCBiZSBjb3JyZWN0IGFuZCB3ZSBieSBhbmQgbGFyZ2Ugd2UKPj4+Pj4gc2hvdWxk
IG5vdCBoYXZlIHRvIGRvIHZhbGlkYXRpb24gb2YgaXQuIFdoYXQgSSBtZWFudCBhYm92ZSB3YXMg
d3JpdGluZwo+Pj4+PiB0aGUgYmluZGluZyBzbyB0aGF0IHNvbWV0aGluZyBpbnZhbGlkIHdpbGwg
bm90IHBhc3MgZHRic19jaGVjay4KPj4+Pgo+Pj4+IEFja2VkLCBJIHdhcyBtYWlubHkgYW5zd2Vy
aW5nIERlZXBhayBxdWVzdGlvbiBhYm91dCBkZXBlbmRlbmNpZXMgd3J0IHRvCj4+Pj4gdXNpbmcg
X19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKCkgd2hpY2ggZG9lcyBub3Qgc2VlbXMgdG8gYmUgcmVs
ZXZhbnQKPj4+PiBzaW5jZSB3ZSBleHBlY3QgYSBjb3JyZWN0IGlzYSBzdHJpbmcgdG8gYmUgcGFz
c2VkLgo+Pj4KPj4+IEFoaCwgb2theS4KPj4+Cj4+Pj4gQnV0IGFzIHlvdSBzdGF0ZWQsIERUCj4+
Pj4gdmFsaWRhdGlvbiBjbGVhcmx5IG1ha2Ugc2Vuc2UuIEkgdGhpbmsgYSBsb3Qgb2YgZXh0ZW5z
aW9ucyBzdHJpbmdzIHdvdWxkCj4+Pj4gYmVuZWZpdCBzdWNoIHN1cHBvcnQgKEFsbCB0aGUgWnYq
IGRlcGVuZHMgb24gViwgZXRjKS4KPj4+Cj4+PiBJIHRoaW5rIGl0IGlzIGFjdHVhbGx5IGFzIHNp
bXBsZSBzb21ldGhpbmcgbGlrZSB0aGlzLCB3aGljaCBtYWtlcyBpdAo+Pj4gaW52YWxpZCB0byBo
YXZlICJkIiB3aXRob3V0ICJmIjoKPj4+Cj4+PiB8IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+Pj4gfCBpbmRleCA0
NjhjNjQ2MjQ3YWEuLjU5NDgyODcwMGNiZSAxMDA2NDQKPj4+IHwgLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+Pj4gfCArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+
PiB8IEBAIC00ODQsNSArNDg0LDIwIEBAIHByb3BlcnRpZXM6Cj4+PiB8ICAgICAgICAgICAgICBS
ZWdpc3RlcnMgaW4gdGhlIEFYNDVNUCBkYXRhc2hlZXQuCj4+PiB8ICAgICAgICAgICAgICBodHRw
czovL3d3dy5hbmRlc3RlY2guY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy9BWDQ1TVAtMUMtUmV2Li01
LjAuMC1EYXRhc2hlZXQucGRmCj4+PiB8ICAKPj4+IHwgK2FsbE9mOgo+Pj4gfCArICAtIGlmOgo+
Pj4gfCArICAgICAgcHJvcGVydGllczoKPj4+IHwgKyAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lv
bnM6Cj4+PiB8ICsgICAgICAgICAgY29udGFpbnM6Cj4+PiB8ICsgICAgICAgICAgICBjb25zdDog
ImQiCj4+PiB8ICsgICAgICAgICAgbm90Ogo+Pj4gfCArICAgICAgICAgICAgY29udGFpbnM6Cj4+
PiB8ICsgICAgICAgICAgICAgIGNvbnN0OiAiZiIKPj4+IHwgKyAgICB0aGVuOgo+Pj4gfCArICAg
ICAgcHJvcGVydGllczoKPj4+IHwgKyAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbnM6Cj4+PiB8
ICsgICAgICAgICAgZmFsc2UKPj4+IHwgKwo+Pj4gfCArCj4+PiB8ICBhZGRpdGlvbmFsUHJvcGVy
dGllczogdHJ1ZQo+Pj4gfCAgLi4uCj4+Pgo+Pj4gSWYgeW91IGRvIGhhdmUgZCB3aXRob3V0IGYs
IHRoZSBjaGVja2VyIHdpbGwgc2F5Ogo+Pj4gY3B1QDI6IHJpc2N2LGlzYS1leHRlbnNpb25zOiBG
YWxzZSBzY2hlbWEgZG9lcyBub3QgYWxsb3cgWydpJywgJ20nLCAnYScsICdkJywgJ2MnXQo+Pj4K
Pj4+IEF0IGxlYXN0IHRoYXQncyByZWFkYWJsZSwgZXZlbiB0aG91Z2ggbm90IGNsZWFyIGFib3V0
IHdoYXQgdG8gZG8uIEkgd2lzaAo+Pgo+PiBUaGF0IGxvb2tzIHJlYWxseSByZWFkYWJsZSBpbmRl
ZWQgYnV0IHRoZSBtZXNzYWdlcyB0aGF0IHJlc3VsdCBmcm9tCj4+IGVycm9ycyBhcmUgbm90IHNv
IGluZm9ybWF0aXZlLgo+Pgo+PiBJdCB0cmllZCBwbGF5aW5nIHdpdGggdmFyaW91cyBjb25zdHJ1
Y3RzIGFuZCBmb3VuZCB0aGlzIG9uZSB0byB5aWVsZCBhCj4+IGNvbXByZWhlbnNpdmUgbWVzc2Fn
ZToKPj4KPj4gK2FsbE9mOgo+PiArICAtIGlmOgo+PiArICAgICAgcHJvcGVydGllczoKPj4gKyAg
ICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbnM6Cj4+ICsgICAgICAgICAgY29udGFpbnM6Cj4+ICsg
ICAgICAgICAgICBjb25zdDogemNmCj4+ICsgICAgICAgICAgbm90Ogo+PiArICAgICAgICAgICAg
Y29udGFpbnM6Cj4+ICsgICAgICAgICAgICAgIGNvbnN0OiB6Y2EKPj4gKyAgICB0aGVuOgo+PiAr
ICAgICAgcHJvcGVydGllczoKPj4gKyAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbnM6Cj4+ICsg
ICAgICAgICAgaXRlbXM6Cj4+ICsgICAgICAgICAgICBhbnlPZjoKPj4gKyAgICAgICAgICAgICAg
LSBjb25zdDogemNhCj4+Cj4+IGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1k
MS1kb25nc2hhbi1uZXpoYS1zdHUuZHRiOiBjcHVAMDoKPj4gcmlzY3YsaXNhLWV4dGVuc2lvbnM6
MTA6ICdhbnlPZicgY29uZGl0aW9uYWwgZmFpbGVkLCBvbmUgbXVzdCBiZSBmaXhlZDoKPj4gICAg
ICAgICAnemNhJyB3YXMgZXhwZWN0ZWQKPj4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+Pgo+PiBFdmVu
IHRob3VnaCBkdC1iaW5kaW5ncy1jaGVjayBwYXNzZWQsIG5vdCBzdXJlIGlmIHRoaXMgaXMgdG90
YWxseSBhCj4+IHZhbGlkIGNvbnN0cnVjdCB0aG91Z2guLi4KPiAKPiBJIGFza2VkIFJvYiBhYm91
dCB0aGlzIHllc3RlcmRheSwgaGUgc3VnZ2VzdGVkIGFkZGluZzoKPiByaXNjdixpc2EtZXh0ZW5z
aW9uczoKPiAgIGlmOgo+ICAgICBjb250YWluczoKPiAgICAgICBjb25zdDogemNmCj4gICB0aGVu
Ogo+ICAgICBjb250YWluczoKPiAgICAgICBjb25zdDogemNhCgpUaGF0IGlzIHdheSBtb3JlIHJl
YWRhYmxlIGFuZCBjb25jaXNlICEKCj4gdG8gdGhlIGV4aXN0aW5nIHByb3BlcnR5LCBub3QgaW4g
YW4gYWxsT2YuIEkgdGhpbmsgdGhhdCBpcyBieSBmYXIgdGhlCj4gbW9zdCByZWFkYWJsZSB2ZXJz
aW9uIGluIHRlcm1zIG9mIHdoYXQgZ29lcyBpbnRvIHRoZSBiaW5kaW5nLiBUaGUgb3V0cHV0Cj4g
d291bGQgbG9vayBsaWtlOgo+IGNwdUAwOiByaXNjdixpc2EtZXh0ZW5zaW9uczogWydpJywgJ20n
LCAnYScsICdkJywgJ2MnXSBkb2VzIG5vdCBjb250YWluIGl0ZW1zIG1hdGNoaW5nIHRoZSBnaXZl
biBzY2hlbWEKPiAoZm9yIGQgcmVxdWlyaW5nIGYgY29zIEkgYW0gbGF6eSkKClRoYW4gZmluZSBi
eSBtZS4gVGhlIGVycm9yIGlzIGF0IGxlYXN0IGEgYml0IG1vcmUgdW5kZXJzdGFuZGFibGUgdGhh
bgp0aGUgb25lIHdpdGggdGhlIGZhbHNlIHNjaGVtYSA7KQoKPiAKPiBBbHNvLCBoaXMgY29tbWVu
dCBhYm91dCB5b3VyIG9uZSB0aGF0IGdpdmVzIHRoZSBuaWNlIG1lc3NhZ2Ugd2FzIHRoYXQgaXQK
PiB3b3VsZCB3cm9uZyBhcyB0aGUgYW55T2Ygd2FzIHBvaW50bGVzcyBhbmQgaXQgc2F5cyBhbGwg
aXRlbXMgbXVzdCBiZQo+ICJ6Y2EiLgoKVGhhdCdzIHdoYXQgSSB1bmRlcnN0b29kIGFsc28uCgo+
IEkgZGlkbid0IHRyeSBpdCwgYnV0IEkgaGF2ZSBhIGZlZWxpbmcgeW91ciBuaWNlIG91dHB1dCB3
aWxsIGJlCj4gcmF0aGVyIGxlc3MgbmljZSBpZiBzZXZlcmFsIGRpZmZlcmVudCBkZXBzIGFyZSB1
bm1ldCAtIGJ1dCBoZXksIHByb2JhYmx5Cj4gd2lsbCBzdGlsbCBiZSBiZXR0ZXIgdGhhbiBoYXZp
bmcgYW4gdW5kb2N1bWVudGVkIGV4dGVuc2lvbiEKPiAKCklmIHlvdSBhcmUgb2sgd2l0aCB0aGF0
LCBsZXQncyBnbyB3aXRoIFJvYiBzdWdnZXN0aW9uLiBJJ2xsIHJlc3VibWl0IGEKVjIgd2l0aCB2
YWxpZGF0aW9uIGZvciB0aGVzZSBleHRlbnNpb25zIGFuZCBwcm9iYWJseSBhIGZvbGxvd3VwIGZv
ciB0aGUKb3RoZXIgb25lcyBsYWNraW5nIGRlcGVuZGVuY3kgY2hlY2tpbmcuCgpUaGFua3MsCgpD
bMOpbWVudAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
