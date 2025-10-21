Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB48CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 16:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=R/yNQbqAevgR+ajBix9kqLb2vE3NiG1d9SLAORs5Qzc=; b=mK3RAqv9INgVqNr2hwto9Xh8wI
	5WKEbItyUZgvA8rfnd1n8XJa0unuTEbyEaLerS3b5CLDNhDUVQSOWLeWvXPFaYxHaCuL1++r0Q2Rj
	XZuRmW4ia4qtZiSORa04BxW2sTMpOuv5RTrTSXxuHEB97vDK+n5EoB0ZFYRQy4T8CALrxh5+50gxS
	gbrL0rkMw5KedrtUcYnK3mCDu2y4xF2tBybzc9MNPoLXklEj5KWl3s8zddPmneVkH/LYOcHsMuQPi
	jSna9IbAuRlZIWxOm5UrftIvZs/nTM7g79dVhfPl7pz5E/QIAA+6m87vlQE22KB37pn33iE92UMSu
	IFjKPoiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBFes-00000000AeD-1qJf;
	Tue, 21 Oct 2025 16:56:26 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBFeo-00000000AcO-3l7w
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 16:56:24 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b55118e2d01so3828477a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761065781; x=1761670581; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QUj6Jzqtl7pAwgzbknudC50aTFamgZNMeXgKkiBAGZE=;
        b=M09Ic7L3EXTJomsPutM35QBkir6X7cyP+8irAAyksRHaxK+cRdAYS1HdGVczkSXIim
         ExhRkrw1QfyHFGUweVcKblhccGB24mBEeb1TVHdfmPWZX547JLAv5axjcru5fk7MjOHA
         IYGYWjx6CCXLPNI78yOOQ7QIMsK0LZwxIzdoBA8A20LKWylO4aAVHwg4/vKM72PHClVs
         KEVmfxNoQgo/QjAEftgAmJcYlS+7mW90YfyFne+dglikYs3+3u5XfK/Y/1112giztTm4
         viSRjgtNzx+d7gF4lFJdJdjBVoDSl4tdcJDb3FBH+yXbBRnykz/Sm+gj0k049CEd3SQn
         ZOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761065781; x=1761670581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUj6Jzqtl7pAwgzbknudC50aTFamgZNMeXgKkiBAGZE=;
        b=vuT+9Wy6qaUKt7o2pHN+EjaMrkU7YMJxX1Q+yXervZkObGgrwEory7mH8eSBSs3JVX
         Q7nbv74wVKV4DexV8OffqL7a0U+e87oFlBMRl2OxXAMkvBYMEJKtXf+Jb5HfdTX1LngV
         w5y/2gMVcSkiWu7UEiwmBoWi5RU+A5rgQuKPxbpBmNW8PIHIQmZEzsEG1y9W0m2YML93
         1bgv+FpSganRfrzphZ0GV6B0PMf8A1Ff8KhcrzAjEPmZJ9C9XZAMldMe/EEfQ6iuHAKk
         Y9gbUPku9/66WaFTdrFis+xaHWvW9k2q4B9Wu1xYpjJaDJdBw+CJPTuMbBMP7fUdrkhQ
         s7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUYsZn0sFIFwYRY0b2QCeZqs8R84c4w0olOQuailaXXAF5MGHh43pxxD/0qcG+qhuUmlmC3hK+tvG8tIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYLN8MwUvhPNYSNlzAmSUCu4VWxjjK/AcmR7vUKodoVfTMf0QH
	fdpitrsyP//ThDJSHQwK/ipRRwmGcZ6yNNVr5AJwXjXkCPpVssvEqAx8cj5iKn8JThc3XusZqwa
	aj9nvpA==
X-Google-Smtp-Source: AGHT+IGOqKmUzCbfjGYr8B2jY/C1mdIZnvxK8+ss+AVkwVotQdjiGEd+3SJ7VfMTaFoQGYSh7+8f99sR5n0=
X-Received: from pjre3.prod.google.com ([2002:a17:90a:b383:b0:33b:51fe:1a75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88e:b0:250:1c22:e78
 with SMTP id d9443c01a7336-290c9c89c9amr235880025ad.1.1761065780727; Tue, 21
 Oct 2025 09:56:20 -0700 (PDT)
Date: Tue, 21 Oct 2025 09:56:19 -0700
In-Reply-To: <d0b369c65e33518d57a40a70c0d13f70bd64db47.camel@intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-24-seanjc@google.com>
 <d0b369c65e33518d57a40a70c0d13f70bd64db47.camel@intel.com>
Message-ID: <aPe7M1aUPwqDmQbY@google.com>
Subject: Re: [PATCH v3 23/25] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	Vishal Annapurve <vannapurve@google.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_095622_937867_BE74457C 
X-CRM114-Status: GOOD (  10.17  )
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

On Tue, Oct 21, 2025, Rick P Edgecombe wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > Use guard() in tdx_vm_ioctl() to tidy up the code a small amount, but more
> > importantly to minimize the diff of a future change, which will use
> > guard-like semantics to acquire and release multiple locks.
> > 
> > No functional change intended.
> 
> There is a tiny functional change. In the default case it no longer re-copies
> the struct back to userspace.

No?  The default case doesn't copy the struct back even before this patch, it
explicitly skips the copy_to_user().

	mutex_lock(&kvm->lock);

	switch (tdx_cmd.id) {
	case KVM_TDX_CAPABILITIES:
		r = tdx_get_capabilities(&tdx_cmd);
		break;
	case KVM_TDX_INIT_VM:
		r = tdx_td_init(kvm, &tdx_cmd);
		break;
	case KVM_TDX_FINALIZE_VM:
		r = tdx_td_finalize(kvm, &tdx_cmd);
		break;
	default:
		r = -EINVAL;
		goto out;  <====================
	}

	if (copy_to_user(argp, &tdx_cmd, sizeof(struct kvm_tdx_cmd)))
		r = -EFAULT;

out:
	mutex_unlock(&kvm->lock);
	return r;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
