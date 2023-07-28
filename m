Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE16BC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 09:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bwwli8LYXSdXJhS/nWS09v2Zk0a0dWwDligWBqHvLI=; b=Qsmx9vGsnE7Ye4
	90xDe3qiHWdJl7YC6+0n9E/n30ubxMfdXpvdrzD2pWcdFMxke9yScfrxKPUcIh7msnpzWMbnT63Vz
	bF1y8jmqYSFQLaRqDqPx6OvdlXqmoyj5Lwwpta4xT5AHcZPNv4CPvU24KrByWWR3RaH9gRB7QACWV
	NOn/unprpefGSKb0ddc9ZAa/5AXIveVcBCvygMLdSC78a/YN0d6CmimwN4CmxsGea1GBHYJdc285E
	Dl5QZVas++6cgqyIogmJZX0XWBt2d9VVl2ey13BdJrqqR8YXiOU0QkW5W/xJ+se0rUc1LjUiSPcKZ
	S+7ZFFeWlPbGZ4oRtbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPK0Y-002fFv-1r;
	Fri, 28 Jul 2023 09:43:38 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPK0V-002fF5-1b
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 09:43:36 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-98e011f45ffso258347766b.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690537414; x=1691142214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VN3bKW0/ABSrFl1yO1pT/mPHAallRpzyjbuLLOn5cdo=;
        b=mubQ3pHrxz7BU95uSOuyFAUOva8dWGvzVOb1YmqvqVFQuR9C6fnLi9yikTYxYJo+tG
         F67EAAmEUvjBhfrREZd+0h88CDUoNsVXctUQCnzX5cL8/YXVZ3ZzcDuiGXL1SkUdHEmk
         mCeUfhF8cJgLXwGR991MoXDehKLbuQ7uS9lzJSG79+NCWyoiXEOn+vz/M9oNHc1UeXDw
         8JF4B/g/8BYxtk7NHqYlKRp9eUVzXQaVLlgs7HMr70A8qlKKVT0Lyk0ZpDu0RysS3Xue
         JaIdng9gUVpLg/8BV7OgPBOqftFMh9Khg0Gn9jZooF9dQ4YtKJR0KCDSlM3QcAiaiCWO
         cWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690537414; x=1691142214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN3bKW0/ABSrFl1yO1pT/mPHAallRpzyjbuLLOn5cdo=;
        b=ITjr294lCQQsdp4+k44d5uZgON+gOgE7JgFSiFaSS6dc1kfhnOlgy07WQVYOPISa6e
         kilubIs1h4dYfav9fgafpui64SU5Yy1AJwofygz1Hylxfrb1aCcjON6lVa/+I7kBdBW4
         8szaPiTWsWK/hhsbE9iTxkD1OqIHmDFFYvrM/b77zoADtRt1CzXwT+jxGNhSu0nFTTz3
         OCf2K8F0JgzhEpQn6lVjs+RB3DkOiZskMI26JEZYo7Td5sd63ePQb/I57G1A94C5atPR
         Y9QUbdxNViBo+NjF6i6umeWnvisgj44tBsfDq41vJSil3GNkfuybWT8CtJYjDeGCW0OV
         L12Q==
X-Gm-Message-State: ABy/qLa/7ME52KGVsUllF3t5rxpjwGY52UbEk00CNLtAUUZ89KwlQ5+V
	nO4FrWoCCZt0dMhLXJRUt1T98w==
X-Google-Smtp-Source: APBJJlE8srirkpyZ+pJy0GLOeA8E+QJebP8+eXBZLrEYR7zeJjYF0kH9i+D8CGkFA3aDHWriyIbs9g==
X-Received: by 2002:a17:906:76d8:b0:993:ffcb:ad4e with SMTP id q24-20020a17090676d800b00993ffcbad4emr1400134ejn.13.1690537413972;
        Fri, 28 Jul 2023 02:43:33 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id r15-20020a1709067fcf00b009937dbabbdasm1816275ejs.217.2023.07.28.02.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:43:33 -0700 (PDT)
Date: Fri, 28 Jul 2023 11:43:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Sean Christopherson <seanjc@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Marc Zyngier <maz@kernel.org>, 
	Colton Lewis <coltonlewis@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] tools: riscv: Add header file csr.h
Message-ID: <20230728-879500f157954d849fb303ec@orel>
References: <cover.1690364259.git.haibo1.xu@intel.com>
 <35ce2b9f7ca655eb3af13730b1ca9f05b518e08f.1690364259.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35ce2b9f7ca655eb3af13730b1ca9f05b518e08f.1690364259.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_024335_540744_8A348A64 
X-CRM114-Status: UNSURE (   6.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 27, 2023 at 03:20:05PM +0800, Haibo Xu wrote:
> Borrow some of the csr definitions and operations from kernel's
> arch/riscv/include/asm/csr.h to tools/ for riscv.

You should copy the entire file verbatim.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
