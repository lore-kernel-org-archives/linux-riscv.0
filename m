Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DABC7EE2F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 01:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07GqI0e9rMkQd2V1nXXkRShpn7vEZ7bKPZTSwnaxmj0=; b=IewfqfKHKynJ5d
	qWpHgqZDwVlZlfI3uYQd9yHJfaU5Jv5+VLc+YL+5X9kEQTNVeM1fOqTSNdzge79umLJfDI4fZ6Bd3
	n0VEWm+0uwWAG3XuI5W2qfORylEBWZnK6Da2yK4UZQLbwGXaiw4rPkIafYlID632pWIODH9MnktB6
	32Mg92+bwxKM2MG4bx5aJU0L+E8rFinz+2X1b3SHNqYwrlVEnzEJloZpqCX43QQqD2ySqA8+fINW0
	1fF5p4YGIPtOCOw64zUc5EHGPha+P8Xc0QSF7/niiAIRehQJx7qbTfwK3Sp0kreAA0Fz0F/Nkuhga
	oMm82eg6O1vbp5G+0J5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8sOW-006VDD-0f;
	Tue, 13 Jun 2023 01:00:24 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8rEe-006Bmw-03
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 23:46:09 +0000
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso8562984a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 16:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686613563; x=1689205563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8wbDZKmo9VP00ABKYaLGQ28GM2QOo4QwYdlCxLvFQV0=;
        b=xTqZLje4stFH7gdg9tw2fGuaNoAlSVyZ9bZDgTUiGpVn1rKnmnRRB/wOdsBKdk3M45
         XyM6zqrGB41V6amFO878oAEpaEipM+J+IhZ6OUQnO6vb96iOf43xb+cTOPWDW6SPGUvU
         wbzhN3iKgf+ErheqSRMoxFxfGjuBsXPFyA9Nf8eealnhw6j5dxAexUg8TC0HYjPKNm9+
         cmH1X+muu7EXkJdtUp+5TMYcw4rbxC4VhQQvi+yG5WIIqUjSEFDaY+a9WqK4wgXHrhfU
         58f1vI8ofPwecC+2UBaX1dI7mOlCr37zZFNYbepf9z+FBvhotWk1bkOhqbtAhvfg0arh
         BtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686613563; x=1689205563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wbDZKmo9VP00ABKYaLGQ28GM2QOo4QwYdlCxLvFQV0=;
        b=kztLdpD2uyG4UwbC0a3ATW0UHJ/w9xoNwsdUep7FMsUfI41IeX0wtPGarXbXnr3RiB
         kIOOsqDe37WDqjN5MKZnHZ/QhiRmNt9FyPBotdrR6iRlowTt49mypWX48ERhtQwCm+k4
         3QmiAsFq6dKjEkG39jiH70wKJwKr4Ys634gpHg+as3zvgOFMd728aAToG9UQNskvCfMB
         SkfcSS9XeopSoqtK3Ww8LhquyiAZDVAc8BINV02sBLpxpuYmdajp0/PksmOaf6KqJerX
         yG6BkDnn3u/obr+8HAtmWC+57HkNZyDBwXqEtXJC20BKv00zHbwGqMy0h9nsXcI+Hekp
         BPVg==
X-Gm-Message-State: AC+VfDxpfqght8eY7zeYMEqO+Vd3c4jywzgi7SN8LFmRilr2ragq3NI2
	lZDGfCBp1WLLs5M0GoSxpQaizw==
X-Google-Smtp-Source: ACHHUZ5ctYtCeisGQ2uomlCypPix/oMuhk7GCBAQ91QMqgz33FoH6mnEV6NDszFqNC1dju2nqgRtMA==
X-Received: by 2002:a05:6402:898:b0:514:77f5:d77c with SMTP id e24-20020a056402089800b0051477f5d77cmr6507743edy.1.1686613563154;
        Mon, 12 Jun 2023 16:46:03 -0700 (PDT)
Received: from [10.10.0.115] ([185.140.244.249])
        by smtp.gmail.com with ESMTPSA id x22-20020aa7cd96000000b0050bca43ff55sm5689515edv.68.2023.06.12.16.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 16:46:02 -0700 (PDT)
Message-ID: <a242cbd8-3ae5-62b0-fbb8-92a51dd7bc18@linaro.org>
Date: Tue, 13 Jun 2023 01:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [patch V4 07/37] x86/smpboot: Restrict soft_restart_cpu() to SEV
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
 <20230512205255.822234014@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512205255.822234014@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_164608_058544_896181CF 
X-CRM114-Status: GOOD (  11.41  )
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
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IAo+IE5vdyB0aGF0IHRoZSBDUFUwIGhvdHBs
dWcgY3J1ZnQgaXMgZ29uZSwgdGhlIG9ubHkgdXNlciBpcyBBTUQgU0VWLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IFRlc3RlZC1ieTog
TWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+Cj4gLS0tCj4gICBhcmNoL3g4
Ni9rZXJuZWwvY2FsbHRodW5rcy5jIHwgICAgMiArLQo+ICAgYXJjaC94ODYva2VybmVsL2hlYWRf
MzIuUyAgICB8ICAgMTQgLS0tLS0tLS0tLS0tLS0KPiAgIGFyY2gveDg2L2tlcm5lbC9oZWFkXzY0
LlMgICAgfCAgICAyICstCj4gICAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTYg
ZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxt
ZEBsaW5hcm8ub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
