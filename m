Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E409EC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Dec 2022 15:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNVGT6P/bWlPAY7XGvnUUBl2MEP/4pMSNLk8Pc9rAkE=; b=JxxhshSjE8C9AU
	2H0n6sGHR877QZjPAWKh3093HZwyfaOXtBOoZeBI3M9WGtO2MJ8ss1WXtsn2PjcdgBknN7BHT2R/d
	OjasKuqK221qhAScFOM7q9VIdu/HYYf5JGVdt/VXBISQLHDdd7InZW5SvzJ52+NHtRF5UH2B8K/fB
	11HZRcQClhNucJIcorFmqhACDgUeB5aOHkr7Fdtuol5STwAHA0VhmqLK18fNE0ts/PiZr/5tWVjl3
	vOqeQ0JlwEjVgcW8i2AvRyIYzdMdMl/YP0v+dWEiX6wkjV10JGXU8OI/LDMsYC6YcBMdGsG4j2xry
	FsZp/TGtLJHaGTN48QmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p96D2-000y7z-2u; Sat, 24 Dec 2022 15:13:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p90fx-00GdOD-Uv
	for linux-riscv@lists.infradead.org; Sat, 24 Dec 2022 09:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671873520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QxublDXwR8D5DtOHl7/e/B0PH3ei1t0qPkoztnwEfr0=;
	b=YhKgv7ArEmsLS3tM3IOIS99lwy/ZTJdMA5eRTU6Oc8wM+J+alNp38wVAvmfODlsNouRja9
	6iX85jLUjCokTljlVeNbwNPYRjN/WgFM9Ro849ZOQHC6+ebX0FvxGukd+3zIaoKHIcp9v1
	j9f/SZqd0XurqBomshGixqYSQFrorS8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-urhMfbTWOXGg3sGN6jX8aQ-1; Sat, 24 Dec 2022 04:18:38 -0500
X-MC-Unique: urhMfbTWOXGg3sGN6jX8aQ-1
Received: by mail-ed1-f71.google.com with SMTP id w20-20020a056402269400b004700a51c202so4982939edd.13
        for <linux-riscv@lists.infradead.org>; Sat, 24 Dec 2022 01:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QxublDXwR8D5DtOHl7/e/B0PH3ei1t0qPkoztnwEfr0=;
        b=ynnqk75DLr1bxNms1ftto4OSuxJaw4T80GkC10cOC5d/7fnnyYp1/96kaaigLR7JY+
         m5fYLXAOFGz+KQ6SiXY/93zcNgO8A4Bxb5B0DuNWdA7L7Pd2dQhZoJYomzV1T27YvxD4
         RIOfmQPKaP4GMz9nAc6X+2T3Ptdvs2J+lhGGoSDyPMzFLmrm3pmPW8bIIRMYSOY/iH31
         qLvx/ni4Y6M0ACJzOKleyrKVKHYotvwVcQlYyAv1F8FF8AqTIOFEcmIG3KOKX29BHcNG
         jO9PPNU5DaapCtgC+f3/3GK2flTzSaCvzf2hs5INtzKR8C0tpOU1ABejTV3h3/C5xx3p
         mMFA==
X-Gm-Message-State: AFqh2kqXRKgTXik1NH4kmDNCWC3wCN3rFi9gGEqLWPqkLbydXuqsPbya
	RfS1pYLhu6KkITrN4M8XnS3YZa0TNH1vJG344TdJBnkIISvY771Tw88ecVA7TjKGg6CQWlxdDsl
	RDcsEUh+yM127l5FYvb2l6b0Dff6J
X-Received: by 2002:a17:907:20b0:b0:7d3:8159:f361 with SMTP id pw16-20020a17090720b000b007d38159f361mr10353243ejb.36.1671873517898;
        Sat, 24 Dec 2022 01:18:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuzaX4Vch7tXx6y3KWiTjg6uUOEDxqKJ4lnD0J2K3STImlt9Y+l7L7jqIYGtkrdkVnkKuq68w==
X-Received: by 2002:a17:907:20b0:b0:7d3:8159:f361 with SMTP id pw16-20020a17090720b000b007d38159f361mr10353228ejb.36.1671873517691;
        Sat, 24 Dec 2022 01:18:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id kx20-20020a170907775400b0078d3f96d293sm2338931ejc.30.2022.12.24.01.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Dec 2022 01:18:37 -0800 (PST)
Message-ID: <4f789996-28aa-1d9c-f918-03de663d28b8@redhat.com>
Date: Sat, 24 Dec 2022 10:18:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 10/14] KVM: selftests: Include lib.mk before consuming
 $(CC)
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
 <20221213001653.3852042-11-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221213001653.3852042-11-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221224_011842_154165_1B17A229 
X-CRM114-Status: UNSURE (   6.18  )
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
> Include lib.mk before consuming $(CC) and document that lib.mk overwrites
> $(CC) unless make was invoked with -e or $(CC) was specified after make
> (which apparently makes the environment override the Makefile?!?!).

Yes, it does.  In projects that don't use configure or similar, you 
might have seen

CFLAGS = -O2 -g

to be overridden with "make CFLAGS=-g" if optimization is undesirable.

Paolo

> Including lib.mk after using it for probing, e.g. for -no-pie, can lead
> to weirdness.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
