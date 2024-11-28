Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34F1D690EC
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3CBsPw20WXDlHAj+nuNjxzJN3cjYSRexEq9sEYPbj4=; b=sBsKUQxNVWuXg6
	DPKN7bv2j9QgEWHdaoL/mUaHUoLviWXcEcWVET9kVX3tuqFxf2exn/9CUIDDjW9lsS5fvAkOw2FMs
	EvVvcI4Z600GAkQAmSixFIJDS7RCjmlo0Id8kaFLFfCLlB8F5m9yl+6zJpxhOAAXgcVNv5THqqADU
	UjfB/1IKnBRBZu1z4fpcnZ8icN959gC/gZAahygAAxnKiziVR+LcAnkTnSnR8PIfcM3Gg+5MeuNe1
	w1eragZuhPbAQkz117HT4wJCJSAFGhB3uqGDo06fKGBk4Lr/38j4rD9+E+0oMV8McBW0Uz/lOF4qY
	leW7riSqM1jbNupChgnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGa7n-0000000F2mB-2ghv;
	Thu, 28 Nov 2024 08:43:47 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGa7D-0000000F2ej-0HOz
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 08:43:12 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa531a70416so35871166b.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Nov 2024 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732783389; x=1733388189; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tMHb2Kr+9Gyds+XTGzQnx6NFjRgDvoBkrYDD0zxb/+k=;
        b=gEv9fwwBLLgc3n82gzNYlMbvI73Zd1iN5ka4usp9t5jt9PKsCXNGnJR8hIqeYKbie9
         1uXQaTvbcrRrBvUsKEyT6W1G1GLTDji+/f8/98JdoYPNwK8dy4DphLqId5N6ByIG4t9z
         wo43sJspUSoPV1ou1uJBOyjPI+2ETVBdDvyjhAR1G8mU865q2ay9hO1bFe5gFLbNOFua
         7NYTn/C2kjrzDhD5t1RCtm9/5BdRc6r4yO7nbAhugmAOXNTuwpqJx8aX0jNlx3EihNE6
         52cQb89ndGa7V/J4tl17lJVFqzg3t8TJAr1m3ejZtUSC4JMZR6hOFJXNtE9a8r+KxtPt
         z6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732783389; x=1733388189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMHb2Kr+9Gyds+XTGzQnx6NFjRgDvoBkrYDD0zxb/+k=;
        b=T+KfTWktlCFvqN80hK+7pwXM5t7bVG5gsgIJlSKxgf3SxzxsSEpC+h55yFAnYMKbLC
         97ope0W1zxKvO/e4+LSLbP57s1eS+4w8+WNlKrd1ExRSZWeYUqraK0DSq/N1e9tm3jqC
         6l2ePS3KgYg8HhkIEJDNUS2bmsGBlGT6W8ENpdiQmiVo7XTGMQ9eGOE68FGUTS/hen8L
         DpC4jtKvf412BmfsVwOYCRQHPH2v1H1ls2SePjg4+BIS1QE2WTSUBzmdYzzHZIDGdzlI
         NNsEDEIevtYSRbdjsZkUaGaYFyGSm4PFG2hMwNb4OZZW9OWOBC9tI3I0mlrVV3iNTNzJ
         mWuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF9Hwj/UvapuxhTUnZ71qeElhVuZ/hxT6eS5jp1xTYBWxuDPrxrsB0vqFKGf4SrU08yQfsZ9E6eon7HA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/Dn+lfwsuMg735qeCv+ezxlyx7lF4y246fcDkUZCxhWiaUc0D
	Zlx8i10na+AtbQY6qnbP3yEvGA0iCiGsALPFMqRGwQYRZx3Nx5Kmiqz8aP8uQCk=
X-Gm-Gg: ASbGncsBA9SsvZ0r+XLgIWxxLFYbYEHhRD30y/6xmcHTXiYkGPJ0+Yf2hpN0uZ7XjAp
	q1/KdLjuZdCTY32uSDZwZJ64gW6kjW+Wtmt3SvtMwzshpxFTGJ8w6L6dR7/xupsZHe8lWr1ZCow
	E7E0NuHgPFqPr0N4HVf/YMXfScCX/suZ4XnNow/Lf/SAQZNv5vgf0oBBI3ucfYrP3i0tupkmEy2
	IbdKUWkdclvObEE+jx9PQa1UbNn5dqj8inIuNVOmBva3SZQa7lIw+x3r9uew6Qbtt066f+oKGRT
	tGqZ+JawmPFsmLZmK0+S/Hd8soZiQRC2uRI=
X-Google-Smtp-Source: AGHT+IE91WdNXINf1ttfiGq0DeG9vnUXdI7yQdKbewyZQW5Jp/++7K5EDj28/C2AmS8X01ObB7bPuA==
X-Received: by 2002:aa7:cfd4:0:b0:5d0:8225:aa19 with SMTP id 4fb4d7f45d1cf-5d08225aa9cmr4768526a12.2.1732783388739;
        Thu, 28 Nov 2024 00:43:08 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8f649sm493828a12.59.2024.11.28.00.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:43:07 -0800 (PST)
Date: Thu, 28 Nov 2024 09:43:06 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: Re: [PATCH v4 15/16] KVM: selftests: Use canonical $(ARCH) paths for
 KVM selftests directories
Message-ID: <20241128-d7a5061ce8160000cd5260bd@orel>
References: <20241128005547.4077116-1-seanjc@google.com>
 <20241128005547.4077116-16-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241128005547.4077116-16-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_004311_113775_225F0B70 
X-CRM114-Status: GOOD (  10.54  )
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

On Wed, Nov 27, 2024 at 04:55:46PM -0800, Sean Christopherson wrote:
> Use the kernel's canonical $(ARCH) paths instead of the raw target triple
> for KVM selftests directories.  KVM selftests are quite nearly the only
> place in the entire kernel that using the target triple for directories,
> tools/testing/selftests/drivers/s390x being the lone holdout.
> 
> Using the kernel's preferred nomenclature eliminates the minor, but
> annoying, friction of having to translate to KVM's selftests directories,
> e.g. for pattern matching, opening files, running selftests, etc.
> 
> Opportunsitically delete file comments that reference the full path of the
> file, as they are obviously prone to becoming stale, and serve no known
> purpose.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Acked-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
