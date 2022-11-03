Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64375C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 07:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AbPmxPJ11xTK3XL2XtknaFn7JW4b0ynLP2nCoeBFMWA=; b=F+s+8ZyYHOUGy9
	gOULa4D5YUhpeRs9b05TsIzmmkDP2rCdL8y0aGWAiTQjx5QOsVUoEQWlUCsVPGKa2Ztou4sJvSPqC
	zmaqFbEWwO2/iVw3Rkuu7T/TBHkJqRxnrniZTVvpGJD17dwLfpNOTcJ4OAXIfvumTI6wyGUQXzV7M
	LoX416x2WYlhX9c+5uX6ghGW+tUA/aIoYJm83aSnakmrEyJT0oVuIOx3QQnFyFpWt/Md7uL1MgvV7
	cVWkFkvN1DgURtaP5W6mJL4NUW+TQzrOkM5Tf52wgBHzdcfHI6awggiMzdcvtWw10XMXKtp8ViLWn
	z5KRAe3R0UGl+2JiiYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUOd-00GOYM-6g; Thu, 03 Nov 2022 07:12:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUOa-00GOUu-Pa
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 07:12:13 +0000
Received: by mail-wr1-x430.google.com with SMTP id h9so1351856wrt.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 00:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OBfEswiMsti3OjaKbPQcyAca5te7/jZ5jHcc8SlAT9E=;
        b=EOYmqRt+/NXugZnlIP4em6mI3EQkzvGwpLXhzORTBxBkCP2uHtj6EIHrWTEowCV0gy
         LjLxmy1kx2FmBqwAXMu8s7YUEChDsUQy5qxfdkx40NZii0vXZu9Y5+E9WIQ98im7w2Qz
         aOc+G9yXO8FMp2gmsGVhL5vc6lj4hdeRWLBju/dhOwwfhZrxP6JKghml+WEnDzleKfR2
         xT+vK0HSOhR2frMY/9x+44r4Scku2Y/ouh8iYDp71I/Bsog0PelRVmfpSZ0wxjqL2jqd
         o6DVxRPDxt5z1+9lDTnQ22y8cNKN7oK+0fUhVvCWoxg4QyLcgrLA6TLc/Hs3GkkFsCs4
         skXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OBfEswiMsti3OjaKbPQcyAca5te7/jZ5jHcc8SlAT9E=;
        b=KKQYY06FFSZ5qp9q+E8fb9WN/8AJM2Pf70eZh3FqrmuyA8NzPKL/7EnqwuRREKRqSb
         4iNaIlAPq3Hp9vH8M6/iX7illcl8eyVLsgx+/paqWZaqMM006FO136ozWxjLIKKveyGc
         zk5N+qW+ciOEWqbCW55tfE4RbC7tCOeQhfVq4B/jliSG1TKFIERJp4lFigu4FYl9hQBe
         gqYhPySZRodyckPdZepuEStKbuqk8Z3ehPHHhuppAPzT4gr2JVpOTYt+yNL3SjwaiDI8
         8kBCFoAwnVp68974pi7xCxp/lhsb2kjo0xRuI3YXrIN9sL1A6xsVmjbHWCzoo1B1bWKA
         JqQQ==
X-Gm-Message-State: ACrzQf3IKkgcNCKFeQ2ezBRowHZCXJYISD/Y4V1tC3SzBtWECCHGCYmr
	NNaczPEn9/HZWPuyn+tbpuDjSw==
X-Google-Smtp-Source: AMsMyM6cHSUzeR4K9K8x56LNKCrmIwrY3rn7gLNAI0DHx5P8Dkfz8OPY8ArcGxqxO2wWVx+YIs8sgw==
X-Received: by 2002:a5d:644d:0:b0:236:8330:a5bf with SMTP id d13-20020a5d644d000000b002368330a5bfmr17103381wrw.125.1667459529624;
        Thu, 03 Nov 2022 00:12:09 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id k15-20020adff28f000000b00236740c6e6fsm1599wro.100.2022.11.03.00.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:12:09 -0700 (PDT)
Message-ID: <9cec1cc6-5050-9fc6-46ec-a8984b8266a8@linaro.org>
Date: Thu, 3 Nov 2022 08:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 21/44] KVM: MIPS: Register die notifier prior to
 kvm_init()
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
 <20221102231911.3107438-22-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-22-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_001212_835620_8B782C88 
X-CRM114-Status: UNSURE (   7.54  )
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

T24gMy8xMS8yMiAwMDoxOCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiBDYWxsIGt2bV9p
bml0KCkgb25seSBhZnRlciBfYWxsXyBzZXR1cCBpcyBjb21wbGV0ZSwgYXMga3ZtX2luaXQoKSBl
eHBvc2VzCj4gL2Rldi9rdm0gdG8gdXNlcnNwYWNlIGFuZCB0aHVzIGFsbG93cyB1c2Vyc3BhY2Ug
dG8gY3JlYXRlIFZNcyAoYW5kIGNhbGwKPiBvdGhlciBpb2N0bHMpLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+IC0tLQo+ICAgYXJj
aC9taXBzL2t2bS9taXBzLmMgfCA5ICsrKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
