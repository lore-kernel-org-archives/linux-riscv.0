Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778DCC7EE2E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 01:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpyMFfVDadYJ1YJhNjKcaOXweKBhJ0dEKtEO8BgTEH8=; b=EkN9QxvtWmLuti
	33ASSJVjFEmPzlTrBU05OetUvhj5xEQYOOrcVxkesjseDorcKl6feukUNKCltj4rFazBBllmQGzv1
	/Oh52v6aOHG7A/JAdDtc81aLl+OKArmsk9uLoAFwxHKx/7tlvVLiTaydGAROqyTEZrKYShKuAh2T+
	LCYaYsL4Nrdc8lb6orJOlVigMifb/XWeoezyoP+K1eYiMiQCLmkVVif7pf0SvncSK0ZXt5socenWl
	ICddQeXO2cwnrrYgeO4lVsrw9kfDNuvEqWn5VzlvSvoO7Tuz+swBREOp4UtNAZvh9LV9agqURRWvX
	mm2H1bciRsuL32QM0AzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8sOX-006VDq-0t;
	Tue, 13 Jun 2023 01:00:25 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8rHt-006Ch5-0J
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 23:49:32 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9823de726c3so10690666b.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 16:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686613766; x=1689205766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KdDi50ZcI/FLwaJCGeRMVNgmMDqblajVGcvGtWq/rU0=;
        b=h14Y/off+2kKH+CZ9xuEqnth8dkIR68MU6fTRlm6+a1ccdcM0M0IsU1vvHNgsK8p2Y
         0C3NyMHNpdoVINJwXJ2UsLvgZ4NTbFLvy78i26qPyTkArpsvqQO8P3rqJaQrm8rGzPXS
         b21ZAicO32Ry1R7mkMJ6NNUImtgdcpa22tAe3I7ZxvHegVAwZ0w/UvF0S48EVuSzeqn9
         b3JjK1ZAX8STmHG870Zb54I4LTDZcNLOHVNCHnZhE6ryjThlXIgkPKnQSaTbHbmt0aPo
         YIMzeRPPStNBrG12bFe/IsSOLZJnGkaCG+swAqxSi4tHTnfqr5byW4FG9+MbQBtCjN2v
         e6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686613766; x=1689205766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KdDi50ZcI/FLwaJCGeRMVNgmMDqblajVGcvGtWq/rU0=;
        b=AitBDE6guNXkY1RbbfMV5KBqjOEWguvDx8gZzHJny/ELXkfSZPPBi/k4FB88Mome7I
         /bRyuu/Nxg9Ic4RjF386DJ6m6+KQZVZARhzkcnmUxdVEAoJAs3NIjWMZGQfcZ24ydPHG
         qk1z1OyURMsIs0lBkyGji3NTmgmEivS0I07DvOwS9uqMto9aeyM3PFraBL8sLdmehZeX
         E3R6MalqClXOILQJoyDhZ/J9Zs32fQWBXskqpB0j9C0UVDkJdcEbgjduIjyPNAsA+iR3
         Q3zqpkPobBcG4KdBc8pEN2ev1ap9aeiLtRWBNws95syOd4qpqnikzBPqVfpJX8zToi/t
         QzjA==
X-Gm-Message-State: AC+VfDwobcBN+3wbJMgMVL1WGIyb2roWH4fvvzTb2AmFXIC3ohgeyXEM
	KCEbdfh7024jg+9UiEZjrMUl3A==
X-Google-Smtp-Source: ACHHUZ5d+tF+AAPixk/kFmtV+CtWpDVmOxGFS7Q1zOS4cdYHHVXnx1KgJdGHPbzDoYU+p/rh+kAXUw==
X-Received: by 2002:a17:907:7207:b0:978:9e92:f903 with SMTP id dr7-20020a170907720700b009789e92f903mr11221800ejc.46.1686613765790;
        Mon, 12 Jun 2023 16:49:25 -0700 (PDT)
Received: from [10.10.0.115] ([185.140.244.249])
        by smtp.gmail.com with ESMTPSA id g20-20020aa7c854000000b005169cd0edffsm5568532edt.35.2023.06.12.16.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 16:49:25 -0700 (PDT)
Message-ID: <94b05905-df3a-4534-a28c-fe9e3030fc4a@linaro.org>
Date: Tue, 13 Jun 2023 01:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [patch V4 10/37] x86/smpboot: Get rid of cpu_init_secondary()
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
 <20230512205255.981999763@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512205255.981999763@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_164930_442134_BD5AC2B0 
X-CRM114-Status: GOOD (  13.33  )
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
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IAo+IFRoZSBzeW5jaHJvbml6YXRpb24gb2Yg
dGhlIEFQIHdpdGggdGhlIGNvbnRyb2wgQ1BVIGlzIGEgU01QIGJvb3QgcHJvYmxlbQo+IGFuZCBo
YXMgbm90aGluZyB0byBkbyB3aXRoIGNwdV9pbml0KCkuCj4gCj4gT3BlbiBjb2RlIGNwdV9pbml0
X3NlY29uZGFyeSgpIGluIHN0YXJ0X3NlY29uZGFyeSgpIGFuZCBtb3ZlCj4gd2FpdF9mb3JfbWFz
dGVyX2NwdSgpIGludG8gdGhlIFNNUCBib290IGNvZGUuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXgu
ZGU+Cj4gVGVzdGVkLWJ5OiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT4K
PiAtLS0KPiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIHwgICAgMSAtCj4gICBh
cmNoL3g4Ni9rZXJuZWwvY3B1L2NvbW1vbi5jICAgICB8ICAgMjcgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gICBhcmNoL3g4Ni9rZXJuZWwvc21wYm9vdC5jICAgICAgICB8ICAgMjQgKysr
KysrKysrKysrKysrKysrKy0tLS0tCj4gICAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KyksIDMzIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IDxwaGlsbWRAbGluYXJvLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
