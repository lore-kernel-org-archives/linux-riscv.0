Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D95BC43217
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 17:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXfhKLmuMjZ2bcusHf/0Q9BpfG9Op2OmOqte9nJCifY=; b=uG7weqsjIL1NxLuxUg8xFeft8b
	Q1nfwK9cjJrgbi5zjp46EydxlF3Jj80Biz0Ie2AlAHpW4nuNlJmW0zRIkzsO43Sh4jiTdNJ21kQyN
	CTkLlRTIvaO0sLYNCcYFVQpOXFk8Nd1jxw/5SLPx13vzQp32DLP33snT8sZewQrCMXdWPCdqAmAS8
	a0wFTekNW2HYsApXAeeYyQ5B6rQSN0hzQI4PfIEIkbIOIOsLu6q/X2Pv/06TEJ0CgQW7SVA+Sh8m0
	+2Xt8m7gx7yek8IpT19/dHhAVi28Q4uFW6u7fQGPWRTHUfSsbzYpqnNIZSBsdACJZlqaPAPwi11M8
	qfdS6Ahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mziqW-007oTb-89; Tue, 21 Dec 2021 17:22:40 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mziqS-007oQa-03
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 17:22:37 +0000
Received: by mail-il1-x132.google.com with SMTP id d14so10782307ila.1
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 09:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r4TtaoKR6+w2BbxrXfBzscheepGCVX5dJ59bu2XE0Ds=;
 b=VnBhSWQefpBVT2b0pz/7ZeOTyrjEp+Xkn0YvQb6PfeqyL2jdnvXYHwCh4ncvHolT3j
 G1+e63VfqwWBG273ftrqUdWfFETc5oftMo+x5Z1dj3H6Qj2/D3hncdiXtRRKbYlZAu4E
 p8X9HLJKF2MXGjIjMta++QR3KDTDbyOG4LSGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r4TtaoKR6+w2BbxrXfBzscheepGCVX5dJ59bu2XE0Ds=;
 b=gyW9pIUReChwI3tniU+mezrGAMDR1ZYB5+YBqiFzisNhKmgaqaVVC4fNHAEgcbXMP5
 qFYaBbNeIyaX2QSmdad8qNRoUjkAn9VOIyOaY2HcT7b7E3+9YPcJALH25cVcOAOHkPCh
 LF6X77k3LoDJh771oG5CmS1WlT/O+gjLSK2rWg1x1ItZlmNr2yNO6PtpDU+zkj/Qfw0n
 9sWCzn/TomBmbDSmh+RN2qdJw62b8T+IYzNIHaD7jsRT+glQAFJ4DJn9cDqgo4abN8tA
 JMOddmIf/wi6m4gnIJhfFN3wi4WemVRvygkFTYUxmG+0twkRq5PGLEig43de2w6befsk
 RGbQ==
X-Gm-Message-State: AOAM533JQpEi23bkzHa2pelTxdiGAIZB8LDr2RRImK5U5yU4+qcrNuZW
 fpEdaCxeQfQ5xHfgHebLrm/B8Q==
X-Google-Smtp-Source: ABdhPJyI1IqcAXOfBvHsRSlq/TpODWZldpSt+9i96f0MwjG04pQlNqa7NSStvHzPlbcSKVsZOodgUA==
X-Received: by 2002:a05:6e02:12e5:: with SMTP id
 l5mr2169481iln.316.1640107354480; 
 Tue, 21 Dec 2021 09:22:34 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id j6sm11288938ilc.8.2021.12.21.09.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 09:22:34 -0800 (PST)
Subject: Re: [PATCH] KVM: selftests: Fix compile error for non-x86
 vm_compute_max_gfn()
To: Anup Patel <anup.patel@wdc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20211221125617.932371-1-anup.patel@wdc.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3e3b5295-f6fb-1ff9-acfe-1a4c47c6ba20@linuxfoundation.org>
Date: Tue, 21 Dec 2021 10:22:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211221125617.932371-1-anup.patel@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_092236_121416_5DCAB705 
X-CRM114-Status: UNSURE (   9.56  )
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

On 12/21/21 5:56 AM, Anup Patel wrote:
> The inline version of vm_compute_max_gfn() in kvm_util.h directly
> access members of "struct kvm_vm" which causes compile errors for
> non-x86 architectures because lib/elf.c includes "kvm_util.h" before
> "kvm_util_internal.h".
> 
> This patch fixes above described compile error by converting inline
> version of vm_compute_max_gfn() into a macro.

Thank you for the patch. Please include the actual compile error in the
change log and send v2,

thanks,
-- Shuah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
