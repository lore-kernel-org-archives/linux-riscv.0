Return-Path: <SRS0=vm5i=MN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1C0C636C9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 11:57:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED86460E08
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 11:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED86460E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeFexjr8EbdyyvdRbIVcuKyXiGYAlG0ZjtqTtS5ctNw=; b=SgeihKYjfzvbSwWBuUcNec+8oQ
	8jcJSkIPAlpf5AKLcjAS77EyEf+hzJqM2RvG1+ly2B2xrx/SBN/gVjhnP7m04UUKNDT67ZHR2MU13
	oNwBB+K1nGhbN4Bav6yvu7f9XO8VwlPUDnsoyUiA09OuuPHXEcAjAbmM/qxksvJ5+Rmzisd9HrvE+
	IwmzWjoE3sN5uciECurSV6NQfaSsGeRICJxHV7DbOZuLc/eMXow7WQ07Q+80IacWBJKrdh1u6KCtY
	g+GHvPyhAXQ2nmXq+X6gBpv2ZWJOAhH9PcUdhTIeYG8f7AaDaIj3o0xBSlkjzklUNTyPRePYVYp13
	h35TF7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Aql-00FY32-F2; Wed, 21 Jul 2021 11:57:19 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Aqh-00FY0O-Ac; Wed, 21 Jul 2021 11:57:16 +0000
Received: by mail-pg1-x52c.google.com with SMTP id y4so1617782pgl.10;
 Wed, 21 Jul 2021 04:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1aayxhP7LR5pbpYNWPExB3m6iym6gHf5XQMlRKlxp94=;
 b=Gb3sYMtxc/kWDCMnCmYUN5o70Tvt9W/hvjABaQVw6GepiW6AF7jJcANbzNBRV1gq0H
 KVgsqId2MY+RXzDpDGY6dPw0M9zOWZUAQNGPy7PM2rys/HzrGgdYJ1JWxUE1QI9btZVV
 O6Nge5AQbsqTmzXcQomJIje10kgbOVDLOw6CAEgavNSXA2gO45gvZInn+kY7JYMZv+qO
 7oKYPWFeZHS6IplBXQIb7MGoEHkzU7p7v5SEAUS6Qb0XpyY5ciKG5wbqqw5mBV2thXmN
 kc5wkdciG83RddYCL0ig7AXvXY6vLlAn6fNTtakKWWWjb2B/kLBoNRRLEWJHhmSw7M5h
 laRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1aayxhP7LR5pbpYNWPExB3m6iym6gHf5XQMlRKlxp94=;
 b=G9X9+NAIF0yzcZNqApqIuOVC3MldRsJfYGYRH5UC5u46PahGPx+68OVw/JzR8igRcb
 ZAYZAMTH37SOxx5MPLoqX+64eXwEXsdkaz3h0gMYNN8IWy6fj4sCMlNWRQX2iF7TA7xl
 kmeWBvzqbIL/1jcynbKI0Bw+AGdB61Sg9zOPGRQVcD/QLBRzRNrpPory87ylsQcfx0WD
 lUPe/MhYQYaMzkpgxwW0UzONcYGbOGeW8T7AXxpOB0gRujYzydCXOOG83/+IMCFkoQk2
 89MsAOsXyZ8rkGAyElBo8+tuAZ4et5rFENhbkKTv0leuI+dVcuTtb597Cft5p05IDTRV
 eTDg==
X-Gm-Message-State: AOAM532jMK6iwXLExwLlylPj3G0Q9uon2CoseYzryNZ9oT4IYDpaETPd
 8YnTzIOndGtKJZ0z2pjjM+k=
X-Google-Smtp-Source: ABdhPJx8Jc6D+8J2xe+jplPG6WjflufBXyqLNydLZmg9K2ukmxfm1tClEJcFPfqxf5GDpWMtdTO8gQ==
X-Received: by 2002:a63:a01:: with SMTP id 1mr35267098pgk.360.1626868633306;
 Wed, 21 Jul 2021 04:57:13 -0700 (PDT)
Received: from Likes-MacBook-Pro.local ([103.7.29.32])
 by smtp.gmail.com with ESMTPSA id j12sm25930570pfj.208.2021.07.21.04.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 04:57:12 -0700 (PDT)
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: bp@alien8.de, seanjc@google.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 kan.liang@linux.intel.com, ak@linux.intel.com, wei.w.wang@intel.com,
 eranian@google.com, liuxiangdong5@huawei.com, linux-kernel@vger.kernel.org,
 x86@kernel.org, kvm@vger.kernel.org, boris.ostrvsky@oracle.com,
 Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210716085325.10300-1-lingshan.zhu@intel.com>
 <20210716085325.10300-2-lingshan.zhu@intel.com>
From: Like Xu <like.xu.linux@gmail.com>
Subject: Re: [PATCH V8 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
Message-ID: <fd117e37-8063-63a4-43cd-7cb555e5bab5@gmail.com>
Date: Wed, 21 Jul 2021 19:57:01 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210716085325.10300-2-lingshan.zhu@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_045715_439039_383DA751 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

T24gMTYvNy8yMDIxIDQ6NTMgcG0sIFpodSBMaW5nc2hhbiB3cm90ZToKPiArCX0gZWxzZSBpZiAo
eGVucG11X2RhdGEtPnBtdS5yLnJlZ3MuY3BsICYgMykKCkxpbmdzaGFuLCBzZXJpb3VzIGZvciB0
aGlzIHZlcnNpb24gPwoKYXJjaC94ODYveGVuL3BtdS5jOjQzODo5OiBlcnJvcjogZXhwZWN0ZWQg
aWRlbnRpZmllciBvciDigJgo4oCZIGJlZm9yZSDigJhyZXR1cm7igJkKICAgNDM4IHwgICAgICAg
ICByZXR1cm4gc3RhdGU7CiAgICAgICB8ICAgICAgICAgXn5+fn5+CmFyY2gveDg2L3hlbi9wbXUu
Yzo0Mzk6MTogZXJyb3I6IGV4cGVjdGVkIGlkZW50aWZpZXIgb3Ig4oCYKOKAmSBiZWZvcmUg4oCY
feKAmSB0b2tlbgogICA0MzkgfCB9CiAgICAgICB8IF4KYXJjaC94ODYveGVuL3BtdS5jOiBJbiBm
dW5jdGlvbiDigJh4ZW5fZ3Vlc3Rfc3RhdGXigJk6CmFyY2gveDg2L3hlbi9wbXUuYzo0MzY6OTog
ZXJyb3I6IGNvbnRyb2wgcmVhY2hlcyBlbmQgb2Ygbm9uLXZvaWQgCmZ1bmN0aW9uIFstV2Vycm9y
PXJldHVybi10eXBlXQogICA0MzYgfCAgICAgICAgIH0KICAgICAgIHwgICAgICAgICBeCmNjMTog
c29tZSB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwoKPiArCQkJc3RhdGUgfD0gUEVS
Rl9HVUVTVF9VU0VSOwo+ICAgCX0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
