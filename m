Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0589CC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Dec 2022 15:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLrMONC/pfmgV3nnRenkkXggDVvEL9uliGKAOfWzBsc=; b=kUcjDsZjF3bHgA
	fdsNxscGKmPJLuDqt4raJjbhZhC03O30AxOdWzlgUNp6bA8fHzWcW2/quSEeUT4W8kWXZWbVSkfe3
	wzDFQbb5B5zggwpBqHY7zSkHOE7UjbDIAwQ2LYHppPlHSz2QohLl8zwxI5qxN2JKyYVzDp0dVycWh
	QcGRKcKtO53qFbOjno5Qc5hxwWNgqdjbgHRyLc5PmJUE8hPihiMvOOwVRGpGOEs/gyXICpgMHoN+8
	GnMjgjoqE1XyNlYFTQ9W1Ps52tuk5NGCFLhwUT+QviXKyNnawyh3xojUrbbVasPGNw/B54Clf418B
	8FvYW3mhmnPl/ouwjmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p96Bw-000xZm-9b; Sat, 24 Dec 2022 15:12:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p90Zt-00GcFV-C8
	for linux-riscv@lists.infradead.org; Sat, 24 Dec 2022 09:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671873143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/8A/i9y6rIvKCnypgiTdopbEh62sIZ4224f2Kvswms=;
	b=SQEbp+wAX3Iz2zBTlRZXno/jf3xP8zgWso1HLoyFAb1mnTUQyTO7qW+V01RShqqjRok3gA
	OHuCUrpNmnO9NWrzdnV2N8kEUtezqnDnImyLk7a2GRCHsKm4lLCYaGRtHCACIWdpJlBed7
	WSCX5k54dvxRhUEH/fm4ynfSU3DA/10=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-31-hl88XGplNl6LyfK0RLyuWQ-1; Sat, 24 Dec 2022 04:12:22 -0500
X-MC-Unique: hl88XGplNl6LyfK0RLyuWQ-1
Received: by mail-ed1-f69.google.com with SMTP id e14-20020a056402190e00b0047005d4c3e9so4890380edz.2
        for <linux-riscv@lists.infradead.org>; Sat, 24 Dec 2022 01:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/8A/i9y6rIvKCnypgiTdopbEh62sIZ4224f2Kvswms=;
        b=SKsltUgzJ08kAJlqSuib7eX0H2sTx/VSe7JaBC8mzB6tx1TTGUcvob7tYBAbXWjzAd
         gvyJoHuKdzqc2tf3jBt1m2c3UFZCjkEKBvpyIoAQI+Ng90CxxzRj6fxF+SdEYrFR+wnq
         e3ZSpFNVBGGYVNu9Wj4myNda6WTKu9PJzqlc50dZW9MXepKizmFSIx4HAvX+JXjouuc1
         Ceci6us/eL3InnYaL27586u5YNHDjUDVthvpPtfVi7hcwVDaumnG9EudTLLz9VboKNhr
         jeuJNA5GKz9vzrZGW/CEEKWrbxEuzpDDL83pyPVrxdanMDggpgrZT26fqD9l5dgPZH1R
         bcrQ==
X-Gm-Message-State: AFqh2kqCq+e6cUz5BUaJjRTRByP1WPHVyN33KLcyoNwrTL8HC5byyzje
	aCrEUwQZl1Ah8K5BMI8E7VzEst6zQx/WzQQQZkLrAZXGlUXF2VPFLylH62Qmt7CNAvAuAsqNiml
	8A0v5o4YMQL6qKY1VwCsAhjETJTHs
X-Received: by 2002:a17:906:4894:b0:7c0:beee:2f06 with SMTP id v20-20020a170906489400b007c0beee2f06mr10450180ejq.52.1671873141000;
        Sat, 24 Dec 2022 01:12:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvlm/vA6G01U45Ww3rRE/hpJxyrrrVFeI3NtGzIAEN1d8PbapEpyn4qgCdB7ow6B9vpaz9eng==
X-Received: by 2002:a17:906:4894:b0:7c0:beee:2f06 with SMTP id v20-20020a170906489400b007c0beee2f06mr10450165ejq.52.1671873140745;
        Sat, 24 Dec 2022 01:12:20 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id 10-20020a170906218a00b0073d796a1043sm2321829eju.123.2022.12.24.01.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Dec 2022 01:12:19 -0800 (PST)
Message-ID: <a03fb002-ef66-e9ea-7447-baf3d3aff1d9@redhat.com>
Date: Sat, 24 Dec 2022 10:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 06/14] KVM: selftests: Rename UNAME_M to ARCH_DIR, fill
 explicitly for x86
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
 <20221213001653.3852042-7-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221213001653.3852042-7-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221224_011225_537161_7A9CB550 
X-CRM114-Status: UNSURE (   7.38  )
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
> -ifeq ($(ARCH),riscv)
> -	UNAME_M := riscv
> +ifeq ($(ARCH),x86)
> +	ARCH_DIR := x86_64
> +else ifeq ($(ARCH),arm64)
> +	ARCH_DIR := aarch64
> +else ifeq ($(ARCH),s390)
> +	ARCH_DIR := s390x
> +else ifeq ($(ARCH),riscv)
> +	ARCH_DIR := riscv
> +else
> +$(error Unknown architecture '$(ARCH)')
>   endif

$(error) would break compiling via tools/testing/selftests/Makefile, so 
I am squashing this:

diff --git a/tools/testing/selftests/kvm/Makefile 
b/tools/testing/selftests/kvm/Makefile
index d761a77c3a80..59f3eb53c932 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -13,10 +13,8 @@ else ifeq ($(ARCH),arm64)
  	ARCH_DIR := aarch64
  else ifeq ($(ARCH),s390)
  	ARCH_DIR := s390x
-else ifeq ($(ARCH),riscv)
-	ARCH_DIR := riscv
  else
-$(error Unknown architecture '$(ARCH)')
+	ARCH_DIR := $(ARCH)
  endif

  LIBKVM += lib/assert.c

Then the aarch64 and s390x directories can be renamed---x86 too, but the 
ifeq needs to stay (just changed to do x86_64->x86 instead of the other 
way round).

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
