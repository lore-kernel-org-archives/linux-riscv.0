Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2779C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Dec 2022 15:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKtGyAx4ADCPdrr7NhcC7DQtkybkN/0alGNATOhWSG0=; b=xoRk+VYUePBDHB
	hW3OXsqCiutcpAM34fpB7/dmjiM48i4hAB9S52iMOHL3klQ2NXo6WKSIIrBTlsedb+9XXLxtYwghS
	kDE7/RvwBoqNW5hLDjO19N2qB7BxTn7ruIkrK8ffzxGkpI5SZQqDQqkOaT6SVUTJW+Bqvlm+5IN9o
	CuuhmkWgHxwrLNi1BQNUpkrZRh567CwZJksfhw8VdXUyttjqIBOXdwwMV90sRRNwgJ63HJziwDtTj
	pdTDwFXbG82Mj/zvpDCNEp9vIBXdo8MXeXNcDNY6htNIIya/xBsRHq+2BW3mChVt5lnKTMKtLddoI
	FioebI16N1RoaxaGSncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p96Cu-000y4B-5Z; Sat, 24 Dec 2022 15:13:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p90eM-00Gd4Q-8T
	for linux-riscv@lists.infradead.org; Sat, 24 Dec 2022 09:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671873421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WJ5IG512JK4HdlC/w+MEPT5hs4wW6eIO1tcvJBoFHE=;
	b=Tc7Xku+IyC+S1yNG6F9lUgTbJAW9zwMUFY5tiu4muqOWCHMn9wR0kyD4xg9R10/IYe4i3c
	1qDtcsfEA1WMUQ8qFRCQw8aqkvLZIjBSa0s6IocG9WGUOEBfwgQtcvT/wSbr8+1uG8iofw
	kSCnc/6WnZVZy5zT5iFhn6bYlpDHSuw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-244-t7yF4IJ8MAeVGy0PXVpH1A-1; Sat, 24 Dec 2022 04:16:59 -0500
X-MC-Unique: t7yF4IJ8MAeVGy0PXVpH1A-1
Received: by mail-ej1-f70.google.com with SMTP id hq42-20020a1709073f2a00b007c100387d64so4645138ejc.3
        for <linux-riscv@lists.infradead.org>; Sat, 24 Dec 2022 01:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1WJ5IG512JK4HdlC/w+MEPT5hs4wW6eIO1tcvJBoFHE=;
        b=HuzKFCKs36igji3f84yUTB2zAfH+MpOibvC9V3itIEzLKoshNkLaB9IK6fCXC40DF1
         6SyHdxzMgfXW0VeNLJfl5x/YW2PODsptt/+c0igwu0i1dHc/U0QP91uEMz7pyAj3qQzu
         SHFChjI2oMu6ohqyLps6Aop68O+fHWZHKdpnQ1cLyckRfUxYm4ku1EOIfkdPDt5izUv8
         t5Qf7MexACcQdp3LKtI5VT1TST7vBVe57TpqznFp9D/tfH+2E78etOtUjxt3yx+w5bEX
         ePx7xOFi+HkCJG8ksJxP+pnnO0n6RNEV3VDDBX1uA/ftLwRDEtGHTgjAqAbgEgTszRev
         goQg==
X-Gm-Message-State: AFqh2kqJWSavuAOdmVOqBO98mS7YHYiwk4lXidiSbaYD/TsR3gs1VA96
	W1IcCMLkSx8arOtqVKVIZIdk1+Hk22x2I5N0M6fA+jFnWtyyZWvlrMqiEzBj3SiI3C/CxSVUyXa
	QMx7ZEbla2ba0BbN6of67h1LxfJ66
X-Received: by 2002:a17:906:2813:b0:7c0:f9ef:23a2 with SMTP id r19-20020a170906281300b007c0f9ef23a2mr12170070ejc.30.1671873418353;
        Sat, 24 Dec 2022 01:16:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvxPdiaG4E8UewTBDKGwk+RrHY5iIcLLbOD+rhwdwS97aEIalcuCrM4uQvmfbCxpmo46L3Qww==
X-Received: by 2002:a17:906:2813:b0:7c0:f9ef:23a2 with SMTP id r19-20020a170906281300b007c0f9ef23a2mr12170039ejc.30.1671873418109;
        Sat, 24 Dec 2022 01:16:58 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id gf3-20020a170906e20300b007bff9fb211fsm2323104ejb.57.2022.12.24.01.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Dec 2022 01:16:57 -0800 (PST)
Message-ID: <f53ed5b9-156c-e809-08e2-050217a970a5@redhat.com>
Date: Sat, 24 Dec 2022 10:16:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 09/14] KVM: selftests: Explicitly disable builtins for
 mem*() overrides
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
 <20221213001653.3852042-10-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221213001653.3852042-10-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221224_011702_538332_F73D7F51 
X-CRM114-Status: UNSURE (   9.06  )
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
> Explicitly disable the compiler's builtin memcmp(), memcpy(), and
> memset().  Because only lib/string_override.c is built with -ffreestanding,
> the compiler reserves the right to do what it wants and can try to link the
> non-freestanding code to its own crud.
> 
>    /usr/bin/x86_64-linux-gnu-ld: /lib/x86_64-linux-gnu/libc.a(memcmp.o): in function `memcmp_ifunc':
>    (.text+0x0): multiple definition of `memcmp'; tools/testing/selftests/kvm/lib/string_override.o:
>    tools/testing/selftests/kvm/lib/string_override.c:15: first defined here
>    clang: error: linker command failed with exit code 1 (use -v to see invocation)

Hmm, that's weird though.  I think it's an effect of ifunc and maybe 
even a linker bug.  The patch makes sense anyway.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
