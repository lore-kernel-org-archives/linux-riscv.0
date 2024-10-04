Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD041CF8840
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 17:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKL4nTaj7ydKKyk2cJO5H5bUrU/ssBBlpC7LMGjuYmc=; b=PfxtGbKOcgPhwE
	GyMl/jdKVXZBXCmyey16dvy4wACOKV+ySbQ4NKgt8UCtepuh/x+Apdcorw04RduaQ3K/ttQBu6+qi
	sgA+g37qlhjCMWRPViOsdOSCUaauqnJLifQPhb0VePzGcizb5Gml72ttV9NPAXLGm3xXMZEjYVaq3
	SLrBp/rkKuwpPMpykI+SHxyFv1nT1xYDaEeqCUIwaa1c839dWcOiAcP1m9uMj5lhEVX3etSxyGtA6
	NnAzMAoGaAHodzYZjcrkb9+sdlMyxwDNjGEWKgv3rNTZJF3KvIs4+Ojmoo+YoKVdpye10i5EJpv29
	k8bIhA4iZEO04Zt8rCfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swmOI-0000000Da8z-3x78;
	Fri, 04 Oct 2024 17:46:58 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swmOF-0000000Da7m-3zBf
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 17:46:57 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3a33a6c3102so7293555ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 10:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728064014; x=1728668814; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXmmCzvSCA40I9sZAZE8zqvwLWduBtnIuV1E1NtN9Hw=;
        b=e7z9VsqcOpPqa7KxCljj3+4zc82Nqqo0+BSmHRzbAX6XtmUu3BhS6bS3vG3HliwJds
         dQzFLXuUoBxgGiChntFe3OGHrsW2b1PWhhcgkbdYwGxNfjdMJOc8gaCBUoEcRU30oZMi
         ZGw+RG8Cbw90ciKYOEU/kBOZK8/RvS698elpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728064014; x=1728668814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXmmCzvSCA40I9sZAZE8zqvwLWduBtnIuV1E1NtN9Hw=;
        b=oi/y7Ke6qZWBgQsorrAuanMNgg77uNSwDByhbvFDtGqkbMOUyJ2Uvzisc6fLZcjwBG
         Y3fILOSWLZCrevI7QbyWthGBSWPfyOFlTAqhT1OvLkoTo7SuFPQRDTOl/lblnI9MrqSF
         grOD67xoLOv8ZtUH51zqzv7OFQuOp1bvQRQrc/bB2T71P+5/vwjeXJ2mm7z+6iiz1DnX
         XDcAmUZmZGu3125+SMVo6u8kIdExx4pa1VCjHM8bk/Mg6w4P6tuqWj7noiLRXa+TQHh+
         r+2vy5tFZy4TnLb7qvCXdjIarMgJUtt7xU4dungqSKFNcK9IqrnpeKfnaJVeem17askL
         i9YA==
X-Forwarded-Encrypted: i=1; AJvYcCV5atceOC/EPaSG8M1kVmJU58RfpSlck02yvM4DPbow7amNZcXv/+PYErgzfSjzSty5L+QzqQw5ZS1psQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBxd6Gw0UI0qLJMMLASgh23WgwVUq2gWvNMKfr+PLcLtnZ7spr
	MvStLm18fT4WlbVvh1dDZQzPWvd+5Ts5jEkcNL3iC82gUVFuG0RVQ0z/g9dbK8o=
X-Google-Smtp-Source: AGHT+IHqCu+1mXToIuh6Tj4b/PxFjs4AwlFkKnHoWB5eAWJ3yVV9VQlGQ32A8LuSsorPiDQr9x55Pw==
X-Received: by 2002:a05:6e02:1886:b0:39f:325f:78e6 with SMTP id e9e14a558f8ab-3a375baaad3mr27799905ab.0.1728064014394;
        Fri, 04 Oct 2024 10:46:54 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a37a7fd6cdsm656365ab.21.2024.10.04.10.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 10:46:53 -0700 (PDT)
Message-ID: <60dd0240-8e45-4958-acf2-7eeee917785b@linuxfoundation.org>
Date: Fri, 4 Oct 2024 11:46:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: sched_ext: Add sched_ext as proper selftest
 target
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anders Roxell <anders.roxell@linaro.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241004094247.795385-1-bjorn@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241004094247.795385-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_104656_020753_835C7574 
X-CRM114-Status: GOOD (  10.88  )
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

T24gMTAvNC8yNCAwMzo0MiwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2
cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gCj4gVGhlIHNjaGVkX2V4dCBzZWxmdGVzdHMgaXMg
bWlzc2luZyBwcm9wZXIgY3Jvc3MtY29tcGlsYXRpb24gc3VwcG9ydCwgYQo+IHByb3BlciB0YXJn
ZXQgZW50cnksIGFuZCBvdXQtb2YtdHJlZSBidWlsZCBzdXBwb3J0Lgo+IAo+IFdoZW4gYnVpbGRp
bmcgdGhlIGtzZWxmdGVzdCBzdWl0ZSwgZS5nLjoKPiAKPiAgICBtYWtlIEFSQ0g9cmlzY3YgQ1JP
U1NfQ09NUElMRT1yaXNjdjY0LWxpbnV4LWdudS0gXAo+ICAgICAgU0tJUF9UQVJHRVRTPSIiIE89
L291dHB1dC9mb28gLUMgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMgaW5zdGFsbAo+IAo+IFRoZSBl
eHBlY3RhdGlvbiBpcyB0aGF0IHRoZSBzY2hlZF9leHQgaXMgaW5jbHVkZWQsIGNyb3NzLWJ1aWx0
LCBhbmQKPiBwbGFjZWQgaW50byAvb3V0cHV0L2Zvby4KPiAKPiBBZGQgQ1JPU1NfQ09NUElMRSwg
T1VUUFVULCBhbmQgVEFSR0VUUyBzdXBwb3J0IHRvIHRoZSBzY2hlZF9leHQKPiBzZWxmdGVzdC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4g
LS0tCj4gICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9NYWtlZmlsZSAgICAgICAgICAgfCAgMSAr
Cj4gICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zY2hlZF9leHQvTWFrZWZpbGUgfCA1OSArKysr
KysrKysrKysrKystLS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyks
IDE5IGRlbGV0aW9ucygtKQo+IAoKVGhhbmsgeW91IGZvciB0aGUgZmluZC4gSXQgYXBwZWFycyAq
c2NoZWQqIGlzIGFsc28gbWlzc2luZwpmcm9tIHRoZSBkZWZhdWx0IFRBUkdFVFMgaW4gc2VsZnRl
c3RzL01ha2VmaWxlCgpUaGlzIGNoYW5nZSBsb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6
IFNodWFoIEtoYW4gPHNraGFuQGxpbnV4Zm91bmRhdGlvbi5vcmc+CgpUZWp1biwgRG8gbGV0IG1l
IGtub3cgaWYgeW91IGxpa2UgbWUgdG8gdGFrZSB0aGlzIHRocm91Z2gga3NlbGZ0ZXN0IHRyZWUu
Cgp0aGFua3MsCi0tIFNodWFoCgoKCnRoYW5rcywKLS0gU2h1YWgKCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
