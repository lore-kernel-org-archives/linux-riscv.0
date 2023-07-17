Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BE1EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 08:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2f3th1fdPz4iT/jlUEipxnC3VOvpkcQ5p4aTbIaELQ=; b=SOo0Q1L8oa3ueS
	wdl9YaQjJcFeQNhzFCUAZc27QdbfPNyVSp3XMjDoDyovAWYbstrICBuS7xg5VdxaWHUosRF3SoKS/
	BN7TzCPMjkkv13kIu1p5q8ytT6e/G7hrWp8/QJSdI96OPr8hCCrTo/ZME1gQKi1Yn97ypUsqmzJ/9
	BCUjkLk/gPSsfeTplf8R91aH9C0eBgIamh/BK/TjQe4oESasnccosETFDGaSeIxmdM+sS/w+WPC1N
	7sKTpQmSvDr3+QMzrvC5Nbm9YL71595KzYBoy7dr7EJEuMeQjG9O6eQCLEFtGKe4/qAr7P8Fcya0K
	TwOyX1BFOt8Ad/Vss4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJLz-003QYp-31;
	Mon, 17 Jul 2023 08:13:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJLr-003QVs-0k
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 08:13:10 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-314313f127fso4005415f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 01:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689581581; x=1692173581;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VT24UUIzDMth5tPZL5Y5vTEOs+P0BwYmDWZgKveF0+M=;
        b=K/iJhKX4wID4O6BHCkqoNDeKizzM0ai2C/JJVSYMd+iQ+t5gkYEyqR8OcId9s6Uw/g
         +AIOCIIHWgQP5i51DcuabWMLSpL4+g4yBFEaNnFvCFvlOvJtDRtBZSsu4q/eyraIhxnF
         34lFSWsMuYImH0tASUyIG9UN5kV+zySjXP1wgy3I0PiMTd8SGe0bBTaL1/3m+AIDIUri
         t2pJXylGN30xSlpLDQiAnrflPN5i2wyDLNiZpxqAYVBhvceI1p6Lvuk8qVu8Vmd37D5M
         py/+IAtS+moAn/+PGdzK6ETPGkvlELAfB3SP0bODnQ1hd3dVHt1OhCJkizrojhSmGnF9
         2zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689581581; x=1692173581;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VT24UUIzDMth5tPZL5Y5vTEOs+P0BwYmDWZgKveF0+M=;
        b=XMdMLQVwXglgnMlfHNsupCqnDgU7UqNB6Bc9nC47+GBmmKxwd93AODHKsf0+kBDKEM
         92FO5SlLpcu1Fx1Bm8EK9JlHSH3vfVWOqdW9eI3+HQPTKVmERLwJNNEOoCVcIamusRJq
         +s7jO89njssQH/KRKd7E9g/ozJMASGhSPZavx12pvw0kj1GFegRV6KXLblkHg7ySPyE7
         2FESjtmp91M55dwTf91FaxLIC6GH3pkhaj5PVArsgiv/4Dm2VoCTgF+9k1u2OIPMDx5E
         c/WaArR3cSHa2Pc53ze6v4xFpMaMof80iF7NvWfTRHyZGf/DYwHXeDesZJly/uDFn+xG
         gW/Q==
X-Gm-Message-State: ABy/qLbt38fC8UZGZjhNzLdCo+9j2qPCws771Htidj5Jn0bfCRFknVt/
	asCSFVdephngKbjnR1tG4g7eCQ==
X-Google-Smtp-Source: APBJJlHUSWcZYlPppSbFTXSEdHwpgpaTrSSog0KcOaUXq6539rjFQxsogmQ3Co+Knjkf78qoCa1SzQ==
X-Received: by 2002:adf:f206:0:b0:314:34dd:aaec with SMTP id p6-20020adff206000000b0031434ddaaecmr9504790wro.8.1689581581381;
        Mon, 17 Jul 2023 01:13:01 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.144.39])
        by smtp.gmail.com with ESMTPSA id b2-20020a5d4b82000000b0031432c2fb95sm18429372wrt.88.2023.07.17.01.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 01:13:00 -0700 (PDT)
Message-ID: <ef2dddcd-f4dd-da9b-c03f-ccd852bb8543@linaro.org>
Date: Mon, 17 Jul 2023 10:12:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v6 02/11] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
Content-Language: en-US
To: Raghavendra Rao Ananta <rananta@google.com>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>,
 David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Zenghui Yu <zenghui.yu@linux.dev>, Gavin Shan <gshan@redhat.com>
References: <20230715005405.3689586-1-rananta@google.com>
 <20230715005405.3689586-3-rananta@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230715005405.3689586-3-rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_011303_272722_D9B81909 
X-CRM114-Status: GOOD (  16.13  )
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

SGkgUmFnaGF2ZW5kcmEsIERhdmlkLAoKT24gMTUvNy8yMyAwMjo1MywgUmFnaGF2ZW5kcmEgUmFv
IEFuYW50YSB3cm90ZToKPiBGcm9tOiBEYXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29nbGUuY29t
Pgo+IAo+IFVzZSBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicygpIGluc3RlYWQgb2YKPiBDT05G
SUdfSEFWRV9LVk1fQVJDSF9UTEJfRkxVU0hfQUxMLiBUaGUgdHdvIG1lY2hhbmlzbXMgc29sdmUg
dGhlIHNhbWUKPiBwcm9ibGVtLCBhbGxvd2luZyBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgY29kZSB0
byBwcm92aWRlIGEgbm9uLUlQSQo+IGltcGxlbWVudGF0aW9uIG9mIHJlbW90ZSBUTEIgZmx1c2hp
bmcuCj4gCj4gRHJvcHBpbmcgQ09ORklHX0hBVkVfS1ZNX0FSQ0hfVExCX0ZMVVNIX0FMTCBhbGxv
d3MgS1ZNIHRvIHN0YW5kYXJkaXplCj4gYWxsIGFyY2hpdGVjdHVyZXMgb24ga3ZtX2FyY2hfZmx1
c2hfcmVtb3RlX3RsYnMoKSBpbnN0ZWFkIG9mIG1haW50YWluaW5nCj4gdHdvIG1lY2hhbmlzbXMu
Cj4gCj4gT3B0IHRvIHN0YW5kYXJkaXplIG9uIGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzKCkg
c2luY2UgaXQgYXZvaWRzCj4gZHVwbGljYXRpbmcgdGhlIGdlbmVyaWMgVExCIHN0YXRzIGFjcm9z
cyBhcmNoaXRlY3R1cmVzIHRoYXQgaW1wbGVtZW50Cj4gdGhlaXIgb3duIHJlbW90ZSBUTEIgZmx1
c2guCj4gCj4gVGhpcyBhZGRzIGFuIGV4dHJhIGZ1bmN0aW9uIGNhbGwgdG8gdGhlIEFSTTY0IGt2
bV9mbHVzaF9yZW1vdGVfdGxicygpCj4gcGF0aCwgYnV0IHRoYXQgaXMgYSBzbWFsbCBjb3N0IGlu
IGNvbXBhcmlzb24gdG8gZmx1c2hpbmcgcmVtb3RlIFRMQnMuCj4gCj4gSW4gYWRkaXRpb24sIGlu
c3RlYWQgb2YganVzdCBpbmNyZW1lbnRpbmcgcmVtb3RlX3RsYl9mbHVzaF9yZXF1ZXN0cwo+IHN0
YXQsIHRoZSBnZW5lcmljIGludGVyZmFjZSB3b3VsZCBhbHNvIGluY3JlbWVudCB0aGUKPiByZW1v
dGVfdGxiX2ZsdXNoIHN0YXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgTWF0bGFjayA8ZG1h
dGxhY2tAZ29vZ2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSYWdoYXZlbmRyYSBSYW8gQW5hbnRh
IDxyYW5hbnRhQGdvb2dsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFplbmdodWkgWXUgPHplbmdodWku
eXVAbGludXguZGV2Pgo+IEFja2VkLWJ5OiBPbGl2ZXIgVXB0b24gPG9saXZlci51cHRvbkBsaW51
eC5kZXY+Cj4gUmV2aWV3ZWQtYnk6IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhhdC5jb20+Cj4gLS0t
Cj4gICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAzICsrKwo+ICAgYXJjaC9h
cm02NC9rdm0vS2NvbmZpZyAgICAgICAgICAgIHwgMSAtCj4gICBhcmNoL2FybTY0L2t2bS9tbXUu
YyAgICAgICAgICAgICAgfCA2ICsrKy0tLQo+ICAgdmlydC9rdm0vS2NvbmZpZyAgICAgICAgICAg
ICAgICAgIHwgMyAtLS0KPiAgIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICAgICAgICAgICB8IDIg
LS0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoK
WW91IGFyZSBkb2luZyAyIGNoYW5nZXMgaW4gdGhlIHNhbWUgcGF0Y2g6CgotIEhhdmUgQVJNIHVz
ZSBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicygpIGluc3RlYWQgb2YKICAgSEFWRV9LVk1fQVJD
SF9UTEJfRkxVU0hfQUxMLAotIERyb3AgdGhlIG5vdyB1bnVzZWQgSEFWRV9LVk1fQVJDSF9UTEJf
RkxVU0hfQUxMLgoKQ29tbWl0cyBzaG91bGQgYmUgYXRvbWljLCB0byBhbGxvdyBwYXJ0aWFsCnJl
dmVydCBvciBjaGVycnktcGljay4KClByZWZlcmFibHkgc3BsaXR0aW5nIHRoaXMgcGF0Y2ggaW4g
MjoKUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9y
Zz4KClJlZ2FyZHMsCgpQaGlsLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
