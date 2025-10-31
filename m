Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F86ACCFA00
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0FcDJ/UrkvOIfyrVCy/HqQwdQNQraauM0dZV2GwWCDU=; b=POf8G/X48JBDOkZXvPBALKQIM3
	2INHGBbA/9D5y84Z+/8ri+oCEX1iaVfO8I6+J/04QcbutYShMBw3xKRs5HLoinpI1YfyAzlGwnRhK
	XVh/mFXYKeehCUFnfibwUoXsOB7h4sd+8GD4g6xxfUU4fQ3lxUe7mKncMg1UUphtQHD0hhAKCmpQd
	EjC9Y3f5j8UiuRvNVRiCJh5nHEOR37WVfolM5u3j4EumBmdcJZ7S/R7V1RLZalbRAVHnUPC+oYlog
	FMIRdKNjrgZmM1RuC6jqCuQkN0z4qOTxi2Jl/tNWHTTCcwcTcAX37X9CdpfiN2Z4greUrhF+jUwaH
	uvBTxcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsfX-00000006SUq-1LLU;
	Fri, 31 Oct 2025 17:12:07 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsfU-00000006STa-2rUb
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 17:12:06 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3405c46a22eso2291179a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761930723; x=1762535523; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HjXjY8ls4xQvqV6pquPYuHe7QqNVj5FW0YEflavTuCM=;
        b=f33iJ30tw9i429heEXeUYWjeMVjvkDhbsZDqXBKVROSLy9K97S/tx1X1HXbJzGM+iJ
         Bb+TbtVjT5mfSuvrZdRV0l13v3CB8s5CXHud9+N7bYxfxr5IBjE8KHF+3//z1ym5kaM8
         vhyaZu+eFiHwrUTcr+d1CSZGsA8OyvuAy/BAaGDq5KfSiWpXrsqGKRuunMG5+qpUYmmd
         3nTbiOgIuRE4vJ+T2D9CaIq4VledvPzLbWdABuGLJeloK/s3jsGRRaSOqmoU7irHcrPA
         mNfx2a8/RLgvmqHHMrj5GjvblxFUUzIvjLcogWeIob7ejaj5pnrWbDgLmps9nIk9Dpu6
         BD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761930723; x=1762535523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjXjY8ls4xQvqV6pquPYuHe7QqNVj5FW0YEflavTuCM=;
        b=aVYf0xBSgeHHFDOnPv8mUHJTLzDO3iss4Luv4TGBV11kMIrf40DccwxgP8/16OQdP+
         8f4QWrn+oefZAaXCfG0MquSSXx9o+CGSo8jySEwCl/OEpoqbtp+eSwLJ9idH/NaFXzzU
         cMFYcT/cyDZyIWR0czPiGdS57SaxsRKsLtAVWsL4TXOqX30em4NYDpjVetkN9Dz4dfuX
         5PasYYe8t+8qY2+IymlMuWh6pOQDfo6k8GTrhWLGnFIt35nLsHr6rllqbrJN1Urcfa5X
         YwzRsdR0CWn6wiBm3OocZnbSRlgoHtWV1BctrhIs/4j2JoeMH6qan4KkWeFCvhKTKgXI
         3VZA==
X-Forwarded-Encrypted: i=1; AJvYcCUw3r9YhS6S0vSTJVR1o0yiJY9SZkwGmLbsptEXoxA8TpAyhg3VM7yyROcw3HMMSrZpkAbKADBCsRqoDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwC2gGIVEhktrKJwuj3NDxQsK1cX9v1k7ElC2vkjXPYqkD1d0/J
	3QoeoE7JTn6c+SybBSvifwbGjuGrWvPGW6k84naI5j9HZzhy2OZV9VVILLJgCyHDpTp8oMG2Yeg
	dRg0v0A==
X-Google-Smtp-Source: AGHT+IGfSgMUQo+5u2P6PetuRGaKK3ywl60OSkXvDDKeMxjcSsBTGVvS+p3TiopL8XWw5d9McqxPGzj/wX4=
X-Received: from pjbsr13.prod.google.com ([2002:a17:90b:4e8d:b0:340:b55d:7a07])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:388d:b0:32e:d599:1f66
 with SMTP id 98e67ed59e1d1-34083089300mr5226937a91.30.1761930723259; Fri, 31
 Oct 2025 10:12:03 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:12:01 -0700
In-Reply-To: <aQRzWb3Fu6ywdE9t@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <20251030200951.3402865-9-seanjc@google.com>
 <aQRzWb3Fu6ywdE9t@yzhao56-desk.sh.intel.com>
Message-ID: <aQTt4R4CflSuVnCX@google.com>
Subject: Re: [PATCH v4 08/28] KVM: TDX: Drop superfluous page pinning in S-EPT management
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth <michael.roth@amd.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_101204_718860_D69E6368 
X-CRM114-Status: UNSURE (   8.00  )
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

On Fri, Oct 31, 2025, Yan Zhao wrote:
> >   - Increasing the folio reference count only upon S-EPT zapping failure[5].
> Nit: There's a warning:
> 
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)

Checkpatch is a (very helpful) tool, but it is not authoritative in any way.
Similar to the how "wrap at 80 chars" is a soft rule that can and should be
broken depending on context, checkpatch should also be ignored for things like
this.  If someone says that the period making the line "too long" actually makes
this unreadable for them, then they're just trolling at that point :-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
