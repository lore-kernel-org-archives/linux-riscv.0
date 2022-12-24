Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D50BC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Dec 2022 15:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6Tf08G7OXgKVsLkkmwRWVTjjDLdv/exJO/tSWDKK8w=; b=VtKO7cSneGReLw
	ZB6WYbOI52LDn3SGVqAXpLOXRGJ9tfTJlEu+ROEiGrr+iCGRgONBT8/O2KpA53bdSVbNXmobJ7lL8
	ZRgbWmw/vjNMl5o05vVH2WCdMuJC4nhlwZaPnSykcJhGjN2UDDXKAv4srt6shsty94FDsTuZjQqJw
	q/ChMtL+hpjTexXeidWBSbvBHjPstslLNSdGcJZZkfmzIeiYc1dm9SII7D/NFJJT/a90IxTlFN473
	nWp9r0VBLdLXwgHcgJ230TSocevwNvNHAqyEUQ3lnwIwsjvl5wgBbBvbwXNNuVU7kS1hxZzAQ3Ysu
	sga4vEXkCEKp09g/ZogQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p96Fl-000zXb-Au; Sat, 24 Dec 2022 15:16:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p90lA-00GePv-9D
	for linux-riscv@lists.infradead.org; Sat, 24 Dec 2022 09:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671873842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQUoO4G6sdzLrmUADt2hv9AJA1j16aHhp8BOh9XyH3Y=;
	b=CZBoYWAy6Z5RBAWnvdnyWFuYL2HcefczTyu05FYC19uc2jlNr+paRq58bkJuJaAuvF2e3I
	R1reaewZCxioBnU2dHsH8dS6QYUSFl4Jk9864ePBdKrNoZMdYGmMfyk71g2byGORYJB+mc
	tvYYGTM3jXQHulCMLta+IdQDIItMIXA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-371-W1OD8jN5OP20GFOyPb9VKQ-1; Sat, 24 Dec 2022 04:24:01 -0500
X-MC-Unique: W1OD8jN5OP20GFOyPb9VKQ-1
Received: by mail-ed1-f71.google.com with SMTP id b16-20020a056402279000b0046fb99731e6so4902599ede.1
        for <linux-riscv@lists.infradead.org>; Sat, 24 Dec 2022 01:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQUoO4G6sdzLrmUADt2hv9AJA1j16aHhp8BOh9XyH3Y=;
        b=KDLJ1978JdTX6aoO2HAEkKP12AW74I8Cz2HFRYG+N9AL59jMGON6KKu0R5u/MaMORp
         ajXqvfQXGR2F1hnKZUkjcVvtavjxm6N+zJCUU26P4j2yHtbLrHK4EeYk/XeUjfBQ4Tdo
         R7mFL35dgJ2sk8JYhqoJ4wBQ/les5xKJLwBa+UaPBttVv0VMgeIUfYSr5zxVCrJ6bkbt
         GmKob15lvIinRoaNzKPYhubsDScn2pdxENga0J7inFwpTSBZZnglfw/u/wrSMXjWD1wz
         My3s27ZXgw14f7dQGFRVlXidLOgDdMGhYYENZFRdIsZhhX/sLb7vhYj59Ex8LsPhVPgM
         OO6Q==
X-Gm-Message-State: AFqh2kpVxEQS1sQZRor76UaLLRp3R1LZST7OA9vPhGd7BIVP0ABna5fw
	5tqpjc/dcyDRmoQJ22OMCidDjOqQ3Be9MA8snL+NcZ3lqu5gpIFk5HPzwvHfTWljYGjm9GGBQm8
	9cQYFq/F4MPSc7PF2T/Xarw/yLIrQ
X-Received: by 2002:a17:907:c084:b0:7c1:22a6:818f with SMTP id st4-20020a170907c08400b007c122a6818fmr9962691ejc.25.1671873840058;
        Sat, 24 Dec 2022 01:24:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu5yag+Wn0Qcys8xdIlgtscsBUCyajRo/QuR9Np12zFtuRKH0vsauC+7pwndJ75MH59prtGFQ==
X-Received: by 2002:a17:907:c084:b0:7c1:22a6:818f with SMTP id st4-20020a170907c08400b007c122a6818fmr9962684ejc.25.1671873839849;
        Sat, 24 Dec 2022 01:23:59 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id u18-20020a1709061db200b007c073be0127sm2305389ejh.202.2022.12.24.01.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Dec 2022 01:23:59 -0800 (PST)
Message-ID: <363f4713-6105-82d1-351e-423d07470cdf@redhat.com>
Date: Sat, 24 Dec 2022 10:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 12/14] KVM: selftests: Use wildcards to find library
 source files
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Tom Rix <trix@redhat.com>,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>,
 Aaron Lewis <aaronlewis@google.com>,
 Raghavendra Rao Ananta <rananta@google.com>
References: <20221213001653.3852042-1-seanjc@google.com>
 <20221213001653.3852042-13-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221213001653.3852042-13-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221224_012404_436668_57A69082 
X-CRM114-Status: UNSURE (   5.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/13/22 01:16, Sean Christopherson wrote:
> Use $(wildcard ...) to find the library source files instead of manually
> defining the inputs, which is a maintenance burden and error prone.

No, please don't.  This leads to weird errors, for example when "git 
checkout" is interrupted with ^C.   I have applied patches 1-11.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
