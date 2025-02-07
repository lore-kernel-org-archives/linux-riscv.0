Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5D1C02199
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 23:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RW3dMtk4kRRiBNAtM3VAt1yyCrNpujgR328SSIpU0A=; b=dbb/7NVrB5KUFa6yFhsgfhHvsW
	HB0t/5ob0nFCosOY3dXRLnddCVUwiodUPTKOb2HO16dfHCg3K12Ibg/wjJBHwbocOiO5MfSpus8Q+
	AoYk1NZF7Y/eoRkWueh5Hz6ks7+nQXaDEdc9En5YOpRYlMVvlboMUZG3YcNSwtpud2rmLF7KnCC0z
	B1bJ26BTdCBYeOk3+stKwifDCEwvDOIBUnz7BNgLA8Lq/j5HnlQq/eTE4mjAFH5uE8Y56qaVwLPmS
	OToUMwAZJswKJu90ljreBSrlQH5nAkPisAaaFwkUArwlcphxHX+ueabWVN24kMXdrPmkZKTRxfi4J
	fo7ZdZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgY9E-0000000BZuV-29K2;
	Fri, 07 Feb 2025 23:52:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgY9B-0000000BZta-31ej
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 23:52:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21f5660c2fdso22560395ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 15:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738972353; x=1739577153; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oQcVjQRwopmrHuG7wgsXbQFTOWJLCaxzXjS7jJ9aNqc=;
        b=W2Xe+lj42h8Di3HdlpSbA3EGlmnfPPz3VPPuug5Qgor40MqDCqiYVIvXA+UnKe+I7J
         UpD+/o+OZxuBLi8gcqfgLZlQXfGsFTzZUOJ9eoGvPav9lOOGl8Eu4SIR3fheJvQ7k4aC
         nXsRUXpC2tIxZWTx2awbGtRHsIYRlZe2Ti8MTcJcZx8Ok4zP3OHbIgEGWb1fJd0ajNW5
         sA6PjQ/brsZ7C/8QnyGIUs49HKL3PKqYi3sDNQhIKiLg2AW94/XX0TQuyAb81Ll+TO5Y
         NaDcHD7mvVkghCwy/YqPVYdTagrHGK3kS+yBsy3yA+1wlaIxvyBWP8YU+IpHnsK+QKGF
         hz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738972353; x=1739577153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQcVjQRwopmrHuG7wgsXbQFTOWJLCaxzXjS7jJ9aNqc=;
        b=n4M4QIPi99T1LokvwowVmf8OIwzpEJYclOMStu6MMJd4ZxSg2jDySA8NkoVkwnSVwY
         o7tDtWX1tW5rxmSeh2oQRc/5Uib8cHzPqUgjPM01pvdTAxvdgFvndHM4QSf/T+9U7P/l
         ZHK2ABjMKkXwUs6RNKihfiqPOzH2lUacKiqZ++LiyrqsHIOwU0P8hKL7t1bbBunHyjl3
         pCdYkXDy4DQIm/NslkowjnFaqpp8GfMrALh6KTz7NWs2dUFdsAvd7ueRykRUFKSHQ0Tf
         H8iNfWOIJIH94tOtUR9T5PPN/DKhw6tKSFd3zjBgfVR2qEbzrglmPZ51Dw2A44Y5qua1
         XgpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXprQE6XLpS+Tr2shEcpilg94L5uPutUgJMydSHtetgt4vfHIdknTvq37g+3NTXSJxiGvdyYKv1X7f7yw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTw+6AUsbvHRJP5wk7bF0sr1N3HET4iG7LErPz4uJSFOtbGrOW
	DydlMZR8GXngd5QNxn9mwkPWTlQvgyp9BZGxuKujjKCXhm4CH3JoKX7IGBprSLU=
X-Gm-Gg: ASbGncteEB2NWkOZH4eRWyqPl1YDzGT+u4rxRI2B1RoOXnGNzk/jpqJYG0Kpzf9gFpd
	kW5CGiwHZXMsb3UwouKix3UyeXK55uYWMgN9gQXg97uvYoCiKns1z/S4Bi/IjL+S3KQuFi0tb7V
	iX3tKYw8d7vuOMrfRsAkdsOsQJ8JbrsrM5aAaPQ3CUwiovKaCogtYOb/DMMJ9ic3yalJMVI450y
	tBjZpOwJa2m4053QYjePOAZRXODJl+qIp1Oi5ACk2JpYW95M4Y3D2hkXB/9ZsRCaoLtZVm7RprR
	HNzqSYOGqce/56gYc9TkrML/Ng==
X-Google-Smtp-Source: AGHT+IH5jRZW/ovSUPH8eJRvmKh5nXw8ULDIWD5h4+evTSN5U5cvmcLVFvRfp+GmY1NLadqVCxbddQ==
X-Received: by 2002:a17:903:94e:b0:215:9470:7e82 with SMTP id d9443c01a7336-21f4e6a035bmr94058495ad.4.1738972353039;
        Fri, 07 Feb 2025 15:52:33 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368da60bsm36436795ad.258.2025.02.07.15.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 15:52:32 -0800 (PST)
Date: Fri, 7 Feb 2025 15:52:28 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH v9 01/26] mm: helper `is_shadow_stack_vma` to check
 shadow stack vma
Message-ID: <Z6acvL9W4G9Y90WV@debug.ba.rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-1-b37a49c5205c@rivosinc.com>
 <6543c6b6-da86-4c10-9b8c-e5fe6f6f7da9@suse.cz>
 <Z6aa24/5M5Xdhe/A@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6aa24/5M5Xdhe/A@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_155233_761596_82A3CCF0 
X-CRM114-Status: GOOD (  11.65  )
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

On Fri, Feb 07, 2025 at 03:44:27PM -0800, Deepak Gupta wrote:
>On Fri, Feb 07, 2025 at 10:27:10AM +0100, Vlastimil Babka wrote:
>>On 2/5/25 02:21, Deepak Gupta wrote:
>>>VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) is used to encode shadow stack
>>
>>I see that arm GCS uses VM_HIGH_ARCH_6.
>>
>>>VMA on three architectures (x86 shadow stack, arm GCS and RISC-V shadow
>>
>>And RISC-V doesn't define it at all, not even in this patchset, or did I
>>miss it somewhere?
>>
>
>hmm...
>Something wrong in my workflow and rebasing.
>Thanks for catching this.

I think this is the miss on my part.

I had this patch in last series which introduces `ARCH_HAS_USER_SHADOW_STACK`
https://lore.kernel.org/all/20241111-v5_user_cfi_series-v8-1-dce14aa30207@rivosinc.com/

As part of above patch, `CONFIG_X86_USER_SHADOW_STACK` was replaced with
`CONFIG_ARCH_HAS_USER_SHADOW_STACK` in `mm.h` to define VM_SHADOW_STACK
as VM_HIGH_ARCH_5. It was all fine because all 3 arches were using VM_HIGH_ARCH_5. 

However as things progressed on, arm64 ended up using VM_HIGH_ARCH_6. But
arm64 gcs patches also landed the introduction of `ARCH_HAS_USER_SHADOW_STACK`.
So I dropped this patch from my v9 and didn't pay attention and actually missed
the definition.

>
>>>stack). In case architecture doesn't implement shadow stack, it's VM_NONE
>>>Introducing a helper `is_shadow_stack_vma` to determine shadow stack vma
>>>or not.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
