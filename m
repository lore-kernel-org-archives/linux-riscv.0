Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4C9C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 07:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3dvCxLjWADsnYDO54hmU3ajfyHUghXyFky1NOY3T5ZM=; b=gOTOhsK0qrBYis
	ipdyke1FaBiaOJumIBDRlAQditFwXU20TP1vL3a8UhD10/Z3WrqvpRvoKMtM4MMvhSxa6Oz1sLuXy
	3Xc028z/U2bUZqMidlXepUEZb1h1kqdSRTGldaP4BC8hElIOXOaR5TcNESZ/GeZXoT/LuyvcwtR29
	deIKfcU/AuIYNhZ4oapJY6HfZPbmCuAK8fulGGX1O1JDXlMPyV6ePLcQbtgT9QLHfiIloK4y8nyN6
	qR/zIiWh3i3cYc8vEV69SWGgGcJK4T9lkoBvGGMhh1ysQR0mD+qHOZk9uIDDjfmo4yWbpWs5BBjGV
	ZZMyUbTI6auqf4cJX5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUTS-00GQ3z-2v; Thu, 03 Nov 2022 07:17:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUTG-00GPy1-Jh
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 07:17:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso2691569wma.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 00:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hhVVFU4gv+0KPdkJhZ6Bsgp0nMXVzSegBp2GVEhxHuI=;
        b=h9I23FTp6GIOXmio03YkEg/XABkIyK7okfyOacacDCySEptlxLcYcKstMetIpqEjVI
         AJxxtkE/wdXbgKxacBRTI0vKPMD7Lrwttr/WvlHH6ej0kR33MU05lAqiRuHOXS6eYgUi
         5D/WB/7tpxiogfi3huBIVAcoj+aw5jR0iw+raivB9st+zpUrHhjUaefLK8xl1XeXGROT
         jIYtNJVpBXb1lhi22kZeWS2z2s2scGKIObYA8G99yKRsKrD7Waw2HL3AJk86rNi+kcwk
         ldYfFW2HEUS0Ngd3K7BW6C8SpUqOYnm44amyRmlRCLpiKmxp0dOvOZKAUgifFtw1/6bS
         zu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hhVVFU4gv+0KPdkJhZ6Bsgp0nMXVzSegBp2GVEhxHuI=;
        b=VsZzsnO3hWr3hK0pr30PEmf9qhcza9LdMqaMHjWuAumeDkpBjGaiEtRT5Ih9GIeGJC
         mCfPXojDtxXjoR89zKId+gWyjW9dd7gJqIzcpeyk8tbN/aal+XXAd2xub3w2X1n4bEu/
         I12hza8wnI4XjHGrB7dgjm7jSVLsHsF9B25wgF21HtHkqIntzj3R0KxlyiRQfT7vk+Pk
         A1jYPnOJny5Qu18ETKbFEFvp6HvR1sOY45j3eNM3gVZ0PCv58tt0VseAY2Tkm1hklf/4
         4/V/rNPz4QPuMBthWeCOgnsoFlaSYHsg6OqeyEnetrLZfFOCYEk4sENj4SMTNqQ9IFQn
         srGw==
X-Gm-Message-State: ACrzQf0+gxuLJXTTzl5hfdKV6Qqs7ZkVlli0qMeen/tjW5SnKSVu399I
	eH7gb1onoI5undpmwGV0BULl0w==
X-Google-Smtp-Source: AMsMyM5U5tWVDdkP8vx2CGlIc4Tyh8xELM0VfMzpr/hFq4D4kTE8+riEzXzUJzEDmk/itTcMkiPp1A==
X-Received: by 2002:a05:600c:22c6:b0:3cf:88bb:3a95 with SMTP id 6-20020a05600c22c600b003cf88bb3a95mr4075812wmg.71.1667459812670;
        Thu, 03 Nov 2022 00:16:52 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c359600b003c6b9749505sm4601041wmq.30.2022.11.03.00.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:16:51 -0700 (PDT)
Message-ID: <5aaa19b8-da75-9a3c-634b-d4c26f77943b@linaro.org>
Date: Thu, 3 Nov 2022 08:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 25/44] KVM: s390: Do s390 specific init without bouncing
 through kvm_init()
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra <atishp@atishpatra.org>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Chao Gao <chao.gao@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-26-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-26-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_001702_662365_AE792370 
X-CRM114-Status: GOOD (  10.10  )
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

T24gMy8xMS8yMiAwMDoxOCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiBNb3ZlIHRoZSBn
dXRzIG9mIGt2bV9hcmNoX2luaXQoKSBpbnRvIGEgbmV3IGhlbHBlciwgX19rdm1fczM5MF9pbml0
KCksCj4gYW5kIGludm9rZSB0aGUgbmV3IGhlbHBlciBkaXJlY3RseSBmcm9tIGt2bV9zMzkwX2lu
aXQoKSBpbnN0ZWFkIG9mCj4gYm91bmNpbmcgdGhyb3VnaCBrdm1faW5pdCgpLiAgSW52b2tpbmcg
a3ZtX2FyY2hfaW5pdCgpIGlzIHRoZSB2ZXJ5Cj4gZmlyc3QgYWN0aW9uIHBlcmZvcm1lZCBieSBr
dm1faW5pdCgpLCBpLmUuIHRoaXMgaXMgYSBnbG9yaWZpZWQgbm9wLgo+IAo+IE1vdmluZyBzZXR1
cCB0byBfX2t2bV9zMzkwX2luaXQoKSB3aWxsIGFsbG93IHRhZ2dpbmcgbW9yZSBmdW5jdGlvbnMg
YXMKPiBfX2luaXQsIGFuZCBlbXB0eWluZyBrdm1fYXJjaF9pbml0KCkgd2lsbCBhbGxvdyBkcm9w
cGluZyB0aGUgaG9vawo+IGVudGlyZWx5IG9uY2UgYWxsIGFyY2hpdGVjdHVyZSBpbXBsZW1lbnRh
dGlvbnMgYXJlIG5vcHMuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4g
LS0tCj4gICBhcmNoL3MzOTAva3ZtL2t2bS1zMzkwLmMgfCAyOSArKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5h
cm8ub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
