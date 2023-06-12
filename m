Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114E4C7EE2F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 23:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HvwCn1GfwTvZUdTJ3MxtN8b079AHbJYIDq2sV0YGVc=; b=2cmajkWILLYdg+
	eKKSHsN2/1n0ffVQIgadaZJ3fjq398iTj8I0hdSvT8j4jt7JL2HqV4almyW7Wcs2jX5Fa0ZNeGmLi
	d7tZtN4vkMiRf3fXa+/m96ze8ZyEF6keq2lyW8bMkCK/LbXFAWjIjiyujW6xYJGLWenLgh6cHkY8f
	9jTIgyR//oGlcmAFpA7dRC3ZeX/iIfZG+uXOK2pxJI6LjOHMn3lfBYtI5BsuGl6mJ1/MGNOWzhlIU
	UIZFZRXg2qEVS6ZhaOJWzilODgJM6wXDmKxh77JqpCKcRGFI/Zg6Ob/mzuQlLk0w2gcaErQuALRoU
	RmnYMDWySuqv6+8nAcRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8rEN-006Bip-0N;
	Mon, 12 Jun 2023 23:45:51 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8rEK-006Bgx-0R
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 23:45:49 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5147dce372eso7301115a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 16:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686613545; x=1689205545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6RKBwJ1snfOShsMKSa/kdTwHRc2sX8E52+VmBrW73M=;
        b=d3xgiOjtTog0mLVt0UUF6SYGGd8ZNr4HF7QbG3ANNB0F9pm2Mnfq6cMKvB6sbMuSRV
         QgWIqQPT0Bz/c6PzgCrCP7PjhIQEf53F9Hq1ZzRfje3zYm9eFWGopD2mOQlyY3W6Ct1C
         diLMaiEHR/d2lY6XdYCuUVT8MxiBw26YRbJ+vLXKhx4eckjH/IBs8Vu650PjnGgHLZfm
         F+52i+6LlG/DNA9AL6mhi/Ytu30a/yapXnU8e4vUqRcJdEh8s8OFO1YXOUJadub+iQHv
         z6vbdQtv6OfPN8ZdleCLjbUevHZa+Wcr6lxGX03ENnGWHZ1Zg+XQGmkr7kxiw7qx+njU
         qXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686613545; x=1689205545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6RKBwJ1snfOShsMKSa/kdTwHRc2sX8E52+VmBrW73M=;
        b=Qp/xKvymF712U8RsWpOoJbZAf2TjsofSPiiUWVOq7FMp3fqXHSER7Do95hYT2YS0B9
         2QJacIbyF59bRfnXQmz3z7x2u4TtiPmsOloIpNPmESgXvixh0ZcGgvgY9WWOVc5g5f5N
         /1UQQoO/xxtrfVfRUgGfGvgKCVnw0RdSk4u+pdKwNTqaLWDpni++ULI1AU8mZi/oKp8d
         iwEEAE9SSU8hXRo6EpTfY7eRnfRchRsFFXg7oaG2SNO0LU/DjfyQTjqeiGNLqo51lwTq
         C8PNosIenz9nfg7cUfD5bcketyna2dkUP9DLrpAVC/Mtlg8CJi/Au7yOeuDHW1yi7IUr
         TqxQ==
X-Gm-Message-State: AC+VfDznq6CqwxwYG10JZO84CDZq67apPUB5a6L5LF0Jw2RI/WDhoLvv
	GYNIbpehxOGKWyJYPjQlhGCb6g==
X-Google-Smtp-Source: ACHHUZ6dtuV5DoYQYE0R52xSIR6NpJYLC8VAvw2sPNu3DqvDkPqqCuCfv+mCrhCPNNxlAI9Ns3XUug==
X-Received: by 2002:a17:906:dac3:b0:96f:9608:da7c with SMTP id xi3-20020a170906dac300b0096f9608da7cmr11947868ejb.36.1686613544905;
        Mon, 12 Jun 2023 16:45:44 -0700 (PDT)
Received: from [10.10.0.115] ([185.140.244.249])
        by smtp.gmail.com with ESMTPSA id h18-20020a1709063b5200b0097457363fc0sm5849378ejf.33.2023.06.12.16.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 16:45:44 -0700 (PDT)
Message-ID: <41b22e82-fd6c-5bcd-44ae-e5b799ed0175@linaro.org>
Date: Tue, 13 Jun 2023 01:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [patch V4 04/37] x86/smpboot: Rename start_cpu0() to
 soft_restart_cpu()
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Ross Philipson <ross.philipson@oracle.com>
References: <20230512203426.452963764@linutronix.de>
 <20230512205255.662319599@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512205255.662319599@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_164548_184959_7A8EF031 
X-CRM114-Status: GOOD (  12.14  )
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

T24gMTIvNS8yMyAyMzowNywgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IEZyb206IFRob21hcyBH
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IAo+IFRoaXMgaXMgdXNlZCBpbiB0aGUgU0VW
IHBsYXlfZGVhZCgpIGltcGxlbWVudGF0aW9uIHRvIHJlLW9ubGluZSBDUFVzLiBCdXQKPiB0aGF0
IGhhcyBub3RoaW5nIHRvIGRvIHdpdGggQ1BVMC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
R2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBUZXN0ZWQtYnk6IE1pY2hhZWwgS2VsbGV5
IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPgo+IC0tLQo+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20v
Y3B1LmggICB8ICAgIDIgKy0KPiAgIGFyY2gveDg2L2tlcm5lbC9jYWxsdGh1bmtzLmMgfCAgICAy
ICstCj4gICBhcmNoL3g4Ni9rZXJuZWwvaGVhZF8zMi5TICAgIHwgICAxMCArKysrKy0tLS0tCj4g
ICBhcmNoL3g4Ni9rZXJuZWwvaGVhZF82NC5TICAgIHwgICAxMCArKysrKy0tLS0tCj4gICBhcmNo
L3g4Ni9rZXJuZWwvc2V2LmMgICAgICAgIHwgICAgMiArLQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
