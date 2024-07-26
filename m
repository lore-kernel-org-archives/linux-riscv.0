Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC1BC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 09:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ru/j9/LfOAyi35G/EyL/asfJHNfXlEvc0CiFVKRM5ws=; b=guTAEuDeqKZfAj
	R3CGJ/qFIWT9oxzvmmyFP1TrtU+v6laMocj3qvFDtF4Mac1GkFQGcySGbvASaFyygdBObtA0/Az5h
	/RLI7wbRk3qEXsIRbdV/bQdkX3+JF5pcEESsAFvN0MD3CVcOEebJLgKOv/r8sjLtisAUrtSY85fSo
	3Rjtk3C/dg9jRb50NieRC+MplypVB60XQfg7N2R4Lr5eIZM1jhcKp4DStL63KkfjGCZ/L+KQwyKE8
	FAkR10tjolHwvmP14OBxg12SvBQfcFsFIfb05ruJoZoN0cOIOz7CnASsM33vTAKBwQf4jtuWBsCwj
	dmZCOWoGmpraa7Nhpffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGsV-00000003Pam-047v;
	Fri, 26 Jul 2024 09:04:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGsR-00000003PZn-2Pir
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 09:04:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-428098e2b3bso1125785e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 02:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721984677; x=1722589477; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nPNljb5qNYMPMOw83Na142uqAvImzCX5024L1+3yenM=;
        b=0i+IWeHY5733+uLrr8UHKGKyhw2URsb8aoOOXJgCu8N/2py1xrndOHDsoyoXaza8/Z
         DWTzwH+rlRxR9k5g8btAhZX0UGvx18Eyj2XryLGLNJRaBobbMGgSdFh787Un9FVBIwaq
         1HhE8802jMqFyqu/tuxZQCuXmheM9nvY9LRIyvRzINo84r30hma8WcdRlA8LE9BpLcbF
         Wk8/NMTsCAmtBrAOHlCeWg8E7s93J0p8LCiBTLGlgKgo6xoTgZmyXfKuPBPCcV2X8ROj
         xtMkg9vLqq6QDNhNhzJo5CqeCfwPtYp3RDP8QC5CoD5H2RINr/yKJAy1j7bjhBBZ22i/
         02kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721984677; x=1722589477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPNljb5qNYMPMOw83Na142uqAvImzCX5024L1+3yenM=;
        b=XwvzyaiN4k4UHtVM1uIPMhxY39CGEE6lbNfBSR1nf8JOUYyCWCPlVVO5B8hEWKEUfd
         pCI5Vfpbyr6xmrhtpzFRfAOMYRE/72Kmm6xwrJv7fm+C8Ot9RBTYeX6UIdL7Fg/nFQzu
         xaKcMsrmgjAYZLtchlujUJnzdeUhNeNP2eJ0oNQXXeTmijAwrmC/S8xnCkJolzjZF8r/
         8jb+Co0qkTjvkU1PQm1hyjOPtnQpt9SHub0VTUmrmK9JZAluae90wXTcy8ap71qLJDBQ
         7olASBxYswlrrc8WMGQrCUXle0caI4YGq4U6il9H5fHE+TItPt/GTYPnLcFoPaNRRp09
         hwfA==
X-Forwarded-Encrypted: i=1; AJvYcCU+N9/qZ5aBB+wJq71pI7ZHJyebwhte7FAPdCX8f/Pbk86CcHjRPHX5Y44AwSFNLzXyg2BIiDkcNjqM3qqrKU6Nk2JA8uWPIeYjGzUWv/Om
X-Gm-Message-State: AOJu0YycvAOBn6vqwS+eGc7kDwiyow+EKxiodzv9J4oMm/rApjLSif7H
	rv0ZEsYEQClBFEvfaAmkZ9DDhTXXfYhQNKxBZI95Iif9kAVvnHMBOCGAHWaq2YI=
X-Google-Smtp-Source: AGHT+IHpM5WQagCaKcwKi7l210VOh4MjHNgi0pLYAhmXUw4nGhc+sr2ehr8mh8kMFL5gq6elvxoPuw==
X-Received: by 2002:a05:600c:3b87:b0:426:5f08:542b with SMTP id 5b1f17b1804b1-428053c9c55mr21919405e9.0.1721984677149;
        Fri, 26 Jul 2024 02:04:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c032bsm4476347f8f.12.2024.07.26.02.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 02:04:36 -0700 (PDT)
Message-ID: <f65d5184-d397-46ce-b8ba-dfe2d3a5ad40@rivosinc.com>
Date: Fri, 26 Jul 2024 11:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] KVM: riscv: selftests: Fix compile error
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kselftest@vger.kernel.org
References: <20240726084931.28924-1-yongxuan.wang@sifive.com>
 <20240726084931.28924-5-yongxuan.wang@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240726084931.28924-5-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_020439_904181_2A2F1F24 
X-CRM114-Status: GOOD (  10.39  )
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

CgpPbiAyNi8wNy8yMDI0IDEwOjQ5LCBZb25nLVh1YW4gV2FuZyB3cm90ZToKPiBGaXggY29tcGls
ZSBlcnJvciBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCBkMjdjMzRhNzM1MTQgKCJLVk06IHJpc2N2Ogo+
IHNlbGZ0ZXN0czogQWRkIHNvbWUgWmMqIGV4dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0IHRlc3Qi
KS4gVGhlc2UKPiA0IGxpbmVzIHNob3VsZCBiZSBlbmQgd2l0aCAiOyIuCj4gCj4gRml4ZXM6IGQy
N2MzNGE3MzUxNCAoIktWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIHNvbWUgWmMqIGV4dGVuc2lv
bnMgdG8gZ2V0LXJlZy1saXN0IHRlc3QiKQo+IFNpZ25lZC1vZmYtYnk6IFlvbmctWHVhbiBXYW5n
IDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+Cj4gLS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gaW5kZXggZjkyYzJmYjIz
ZmNkLi44ZTM0ZjdmYTQ0ZTkgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gQEAgLTk2MSwxMCArOTYxLDEwIEBAIEtWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemJrYiwgWkJLQik7Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05G
SUcoemJrYywgWkJLQyk7Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemJreCwgWkJLWCk7
Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemJzLCBaQlMpOwo+IC1LVk1fSVNBX0VYVF9T
SU1QTEVfQ09ORklHKHpjYSwgWkNBKSwKPiAtS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y2Is
IFpDQiksCj4gLUtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemNkLCBaQ0QpLAo+IC1LVk1fSVNB
X0VYVF9TSU1QTEVfQ09ORklHKHpjZiwgWkNGKSwKPiArS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJ
Ryh6Y2EsIFpDQSk7Cj4gK0tWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemNiLCBaQ0IpOwo+ICtL
Vk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjZCwgWkNEKTsKPiArS1ZNX0lTQV9FWFRfU0lNUExF
X0NPTkZJRyh6Y2YsIFpDRik7Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemNtb3AsIFpD
TU9QKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6ZmEsIFpGQSk7Cj4gIEtWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemZoLCBaRkgpOwoKQXJnLCBteSBiYWQuIFRoYW5rcyBmb3IgZml4
aW5nIHRoYXQuCgpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMu
Y29tPgoKVGhhbmtzLAoKQ2zDqW1lbnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
