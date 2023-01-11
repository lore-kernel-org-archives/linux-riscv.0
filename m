Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4B9C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fj18Q9MFclnVIrx6JfnVDe1DZUXQvuma3lAqa5S10fs=; b=WQrcKbIBkGYkov
	lnSnVg/k2kQkQqM71GB8eWB6L7vEtAKTZkPD50J8bli7Xzn9aZIf76LEmP9BTKBD/eTCuyAAM6Exb
	4iXCGCeUA03rsJnDL57evjgtINxN+pCov3pl/nrkXCp0vOTOW2Rfnm6WkuK8EG0zEsXo5aSw3Q6ps
	bNguaRg1uDxljcIppDIa1K9Ub84k87jhcTdX3Ug72IcOmUVE9wPdMvjhi9cJnQzJd+rO/zaL0NNR7
	ti+FY907zGU7KSyqJ2bC1PCV6LRwFKwJ6aXbXKvgUWurXwteF+2SVSnbuWFpdswiz6PHw0mL3+shd
	Ouyc10P2Llo3xglWfPfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFdsn-00C9FQ-7l; Wed, 11 Jan 2023 16:23:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFdsc-00C9DK-CH
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 16:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673454187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bAzX0I8qhNQFozyjHTOv5miI6bc1TzOt0NGHpESsMAQ=;
	b=Rpc2H4zbMZ9lrVT2TNyW8YFfb8f8SvPGwwRxjxDfo4ywItxSQUI+Yp1yfMv0arhb0M7XTw
	hOQ38JdYPrpq0NQC+hS2GJhPvfd10olrUsgWCEn1TxyDK8GhGj0O6WOq3fliVhMDr3L9ND
	8EnBUnZGQaqRDsX4x2uFWehUAL0qi7Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-7cxoOsT1O7CwBPzhmIXF5g-1; Wed, 11 Jan 2023 11:23:06 -0500
X-MC-Unique: 7cxoOsT1O7CwBPzhmIXF5g-1
Received: by mail-wr1-f71.google.com with SMTP id u15-20020adfa18f000000b002b129dc55bfso2866914wru.11
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 08:23:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAzX0I8qhNQFozyjHTOv5miI6bc1TzOt0NGHpESsMAQ=;
        b=h2GD1sn+AEWS8sWl9WKsHERZ9ZaudOuSYm0pu++y1b27vayr9w/uelFH0Zz20E962u
         auBICN3HBz7552SaksdU6eTwF7zyXk3qO8J8fkmFbAzA2WKD9n11eh2o+OXboKBrFC03
         gy3MfryYiIsZErGJCBLG3YrTdbU0YGSDfq8j7/69u4d5ngfRYzOg2z70Sag/1jVDjgLq
         lgA1Ut9+CsmlZZnjNj2prjO1jeiaIQBpp44xov0wHwlRmNieZOg6V7u/G+CoEnvn1L+I
         EUXlaa0oaINhlKG3F1RGf4LYjQT7cAQDhHpvB7EWhQA4+NQ5TeIT+CDDmkpkQ420vNU5
         g0/w==
X-Gm-Message-State: AFqh2kovJ7ON1tcqLb/ZHbKa9N0iu5r+E0hGOgT5sKfY2Iwn1kQw0ptJ
	p/mq+SX+clSSURG9GdLys8cssQjrXqg7zXx+bhAsxfhRM22Y1hXQolz71ip1lJJxloj3rNhiwY7
	/mud+PemsCFy7sYyiR1tO/Hf4SLDR
X-Received: by 2002:a7b:ce06:0:b0:3cf:a483:3100 with SMTP id m6-20020a7bce06000000b003cfa4833100mr52806230wmc.3.1673454185126;
        Wed, 11 Jan 2023 08:23:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtLvuQHiCtmyqnm4CLAs4LBNQIvAx3luYBZ9kZsu5kzE6A6u6fOimphXyAb5WqlrOBkfqsJsQ==
X-Received: by 2002:a7b:ce06:0:b0:3cf:a483:3100 with SMTP id m6-20020a7bce06000000b003cfa4833100mr52806198wmc.3.1673454184874;
        Wed, 11 Jan 2023 08:23:04 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5? ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
        by smtp.googlemail.com with ESMTPSA id v10-20020a05600c444a00b003d998412db6sm25266750wmn.28.2023.01.11.08.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 08:23:04 -0800 (PST)
Message-ID: <8333e62b-8bb6-981f-ba07-d867ec61657e@redhat.com>
Date: Wed, 11 Jan 2023 17:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 11/14] KVM: selftests: Disable
 "gnu-variable-sized-type-not-at-end" warning
To: Sean Christopherson <seanjc@google.com>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>, James Morse <james.morse@arm.com>,
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
 <20221213001653.3852042-12-seanjc@google.com>
 <CAKwvOdnRQQb9YbH=MgDymBmmjYgajc8tkyjbJVxjpA5zDZpNTQ@mail.gmail.com>
 <Y5ffxebJ/eRzEXh+@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y5ffxebJ/eRzEXh+@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_082310_545676_5ED108C9 
X-CRM114-Status: UNSURE (   7.16  )
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

On 12/13/22 03:13, Sean Christopherson wrote:
> AFAICT, gcc stopped treating unknown "-Wno" flags as unconditional errors starting
> with gcc-4.4, and the kernel's min supported version is 5.1.  gcc-4.4 through
> gcc-9.5 all print a mild warning if there's a different error, but otherwise
> silently ignore the uknown "-Wno".
> 
>    cc1: warning: unrecognized command line option '-Wno-gnu-variable-sized-type-not-at-end'

scripts/Makefile.compiler has cc-disable-warning for this, we can copy 
it to tools/.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
