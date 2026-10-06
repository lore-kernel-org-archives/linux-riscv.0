Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF60CA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 23:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUDBBqkje/05SRne/exLhDBsGZSkMcEeGJLfcE5BlQs=; b=JY9AyoJW5s3Dob
	K1DQgGSx3EDwVBduxHOe8U2OOolJpzA5WiMNQFnWDpBNOzddyphoPAFOJ3bMVOpEZpeVntMfdmj63
	EB7sfvEMmgxzOTimipK2bduvOjRy+MOJv5pHJXQ6ZLKbtEbSDBPZRhCgKHHmEfkyKUjNtlXe9ak5a
	uXAKZhyKP3IXqzXCTAdt6j+EpseKQ9pGGgIcqg8I0CMTXaWmqu8G76yVgkWem6IynLmEh5Q6pBP9R
	SsuyLltik9LC+1i38DLPrNsrPd2E4pNumKP0WQHpZ4KuItIVkkT8TyEMnGo4PQOl6Jm9B0CfVXyfI
	yquRNuEOiGFwO5TJpJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEnQ-00000001VM2-0SbV;
	Tue, 06 Oct 2026 23:42:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEnN-00000001VLK-1FD5
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 23:42:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so21099555e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 16:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791330123; x=1791934923; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xtl9xeh/w1n1/842SeGkR83P1qgAjaMld+9slL7tN5Y=;
        b=G/Cw6Zf5cPHLMM2k6oGJomsKuGl8z7pgcizWdHbfYUEfhUIaLmz8EquZvSs34wvhtf
         IZFjEbMIUH6ThTZDkAVXNaZMQoDyHlHHkdhm3la78Bi043+SOme94RTbT2UZxuxGCswg
         PbvjGEF8+gjfgpAtQ9NfibIFn5K8GADAC56m7LCFWl8dRmlkBfoRU24dChTGf3Ow6rMI
         KK52FBS04Uro1nrdex4JkaLzHgNYOU7/mbfX0H7Er3pE0Y07Hd/AuFJteTyqhIRqGyxk
         tDfIHRIUzt0IN1U032aOZiwX9koRXx02eTcmn5P6iaLstVNe+UyDR3BAlJgYae8TsNY0
         4/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330123; x=1791934923;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtl9xeh/w1n1/842SeGkR83P1qgAjaMld+9slL7tN5Y=;
        b=ffMJFCOVdzvi2BbCs6VbPO2Gzi/GUoAHKZE6lXQy7dsODNGoA4LEKVUwyNx9O+59qM
         tXcnXDgOh3+a0NzQiTcRgA8QmIRZ6WjjoyHs0+si8VXBUeZX/yrH2r/TsKW+ztjqOi5H
         B94anPbzOtbh3dUG250YUpUXtR9w3xql3yJ5W7eongKvsCqliTsDEOpaJyRBD9WfXM/r
         H0x+HA1WWRcFwnITZvca6vWzswQAeBYHDbH9EmFVKg1slsDiSXRDcMZbc91EOR5bOmbr
         NAnVFaMjucf0QSxzRjabEDZww/+UeEPbGR9U6kP7zX+9BVWqvLyr6XJD/nTWJDi/82Xz
         yM7g==
X-Forwarded-Encrypted: i=1; AKwUvBzoxus6lwX2zHq7k7czmvhuUKYfoMxyJ54d9L8tspnG5nW9JFnOXXszZ7HPyYQa1c07ApVhoUBYbwXPVw==@lists.infradead.org
X-Gm-Message-State: AFuF++kwgjPpT2TJiu3P4TEU6JyPlUYnF3Ou/Ko6SjdyZYzzTOYybFWF
	zsYO3ihNBoOVBI58vUBEQQfUSWyFNd8/AR1SrV1JeBPvt3RZvJXi7uHU
X-Gm-Gg: AYBFou0OwcC64Hyl4kZbepdTU8oOkPYRNKDPXFVL1+nYR1VxF9ZKfFczpfXql94g23r
	bB6XuoyefxRIf+4M3rqm0ue6590hyVsPjenRn8oatVZ1V4PnoPxaVT+SV0tQk5cxxbTE8Z1TI8u
	5IrnDpnDX9PCkYKMN3bBu3n8BRMshtGHP9ApUJv4Xyd0y2rwgM1Nf/+3C1A8kvt61ozMCwb6J4u
	Ftf6f/0+eWpGFbR5AozudbVkcSfP8RnMjrOA0dOXL07kB7y6hdb40dJPdDrr4WfKyNuEfgVaX79
	tdRoRDtdZjQhI4De0xujj/9BFH/sYiKYCh22WgCw4M0vaw9RZV3JIjkm7D8DfgwYFZlp7aMdGus
	CE7sEV4kvCjxsIWCJus28EIegK3xKJ8C2kKteBfzF8N2vJy6IICxEigP+lyBus9hdiCq3S2kNmb
	0eS6Htqyw1jZpEFeMshbXmgPo5MKKeI1UBtPY0LPatuPYgopMltNyPHuZ3X/1sjcJs45JLGDTNF
	RK5aw1EKirDmh3/syYxnG8gJ13b7rE=
X-Received: by 2002:a05:600c:1e17:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-4a180310dc1mr5435555e9.14.1791330123255;
        Tue, 06 Oct 2026 16:42:03 -0700 (PDT)
Received: from blinky ([81.0.216.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53997sm153565635e9.12.2026.10.06.16.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 16:42:02 -0700 (PDT)
Date: Tue, 6 Oct 2026 16:42:01 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Andy Chiu <tchiu@tenstorrent.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: KVM: Fix compilation when CONFIG_RISCV_ISA_V=n
Message-ID: <asWHSd31uyyNvt0a@blinky>
References: <20261006-vector_off_fix-v1-1-9e48e654d445@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006-vector_off_fix-v1-1-9e48e654d445@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_164205_343920_F36AA7B8 
X-CRM114-Status: GOOD (  21.40  )
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

On Tue, Oct 06, 2026 at 04:39:03PM -0700, Charlie Jenkins wrote:
> Fix the KVM code to use stubbed out versions of vector functions when
> vector is not enabled instead of failing to compile. An alternative
> approach would be to ifdef out the vector code but since a handful of
> the vector code already just uses stubbed functions to tell the compiler
> to drop the implementation, follow the same pattern.
> 
> Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector")
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Should have looked at the lists first, this wa already sent
https://lore.kernel.org/all/20260922021823.44251-2-zhangzhanpeng.jasper@bytedance.com/.

> ---
> I was reviewing [1] and noticed that when I disabled FPU and tried to
> compile that vector got disabled and the kernel failed to compile.
> 
> [1] https://lore.kernel.org/all/20261006075303.205216-1-radim.krcmar@oss.qualcomm.com/
> ---
>  arch/riscv/include/asm/kvm_vcpu_vector.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
> index 6371d5ea5392..1c9efc6048bb 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_vector.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
> @@ -11,9 +11,9 @@
>  #define __KVM_VCPU_RISCV_VECTOR_H
>  
>  #include <linux/types.h>
> +#include <asm/vector.h>
>  
>  #ifdef CONFIG_RISCV_ISA_V
> -#include <asm/vector.h>
>  #include <asm/kvm_host.h>
>  
>  static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
> @@ -55,6 +55,14 @@ static inline void kvm_riscv_v_exit(void)
>  
>  struct kvm_cpu_context;
>  
> +static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
> +{
> +}
> +
> +static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
> +{
> +}
> +
>  static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
>  {
>  }
> 
> ---
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
> change-id: 20261006-vector_off_fix-938d61b1f906
> 
> Best regards,
> --  
> - Charlie
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
