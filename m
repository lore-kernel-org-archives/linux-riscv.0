Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17722C282EC
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Mar 2025 00:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6NbMVL24CE18dzv7lSTaTyNPHlYK7KJcNCpT0dkw58=; b=zkYMosnZuM+qYF
	FxMq4AT2Zcuc2zUTfjsMKjGju/MIF6RnGR3kDCL/gwiF+ON6JTzB+QXIC4QfhQcSqoR+j/hTCCT1Z
	FxM65Cdip+54ITl/CiknGja2f+5NVQrT5xIT97vIBFefdL4dnVVyzxiPhRrKkuvlGMIyLsxRHExlA
	e32/HYEPpDVssXuI3irkdq/ZRmhPou1dwzVeJvW9dpWHR7LK7jILl9QkvCHlglFTZ71yHXNMu9apN
	1FeAcAgjqQ9RETrRY/U+diQ+8zb61KkdPuvdlD0+pm9o7x2mmMNKqZFiIWD/FDdmKZpDhJz7WueEO
	mhCSraZDLlufRXwA1wIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr4DZ-0000000HLdi-2HrF;
	Sun, 09 Mar 2025 00:08:33 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr4DW-0000000HLcb-2xiA
	for linux-riscv@lists.infradead.org;
	Sun, 09 Mar 2025 00:08:32 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso5589554a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 08 Mar 2025 16:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741478908; x=1742083708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dgCgJBvkZIMBc8noi3WFpbSBR9qCOzQZcMrrRAMLJCc=;
        b=hRSTONvG4Qu0vech1iApDq2qg6ZDLdjBYDnNAl9wa3iJy6jD7xFtBx68COVrNOGfFb
         5NDdAemvsynr+jDVOiw7MNYMF/1F1O90E8gXWgGyjHFGuyhmmR5SeULxQmeTGDVUplmS
         Hg5So8G0aUO+RzGKSlFSpXA2gSxWdo2BpVc4K7sEGdp2tFbxSRv+uaGkgrqryRHX3PYJ
         3dIVDP9zZ2zhS2BrHa/YsW0Oa3s+JTl8R2z882umKHYnQhjEJjelRTi+8n2qnO7vLbvl
         fRO57sD7u+dbjRg9cbjVcm4neZnUIgfeZeHnMWXO8aM14HdHSYs7NiLRMqOhdh9scIAt
         pO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741478908; x=1742083708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgCgJBvkZIMBc8noi3WFpbSBR9qCOzQZcMrrRAMLJCc=;
        b=fLVw0c53bOhviiejrWWPPh7f7K26ozuWoWZK2BcA9GeTWM78BBMDTNjxZTrvQr47MW
         PrFNyu/7kOmSR16vYe4ioi8nTyn/HJZcxJeXJLE8WxIzPam8KnRf1IW+MZ3UwjUGVtPG
         rSe2egflPozaGZ0M0S46QmnuqoLTn4OjU+zhjcc87zRqioMpb/06xtg7668NUdfq32pI
         m3LnFJyv5ju1EpOpxCNmv+6RHVfw8fZgxD06SehEUJwSTvSGEpxUdIoTpeYi+5T1VqYU
         DYSeju/uSru2we0OvgDoFrYZNjV2njZi+RgYT3fkjReBYS+lClNaHZvz1imtK9Yh6T60
         5rDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/f1VPi5yzQ6Tp3soZLZ93Dbr+Ux357QQ0aYE1JViZ1EZyGFY1sO2iRfVgs4WThS/k8jfsUKtsDXsP6w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5HqaGwHowi6YYJoG1dvZNhFOZ2XoWYPLD/kIJn0uI6ojSlmSt
	yhMg5FqrSbgfjCq+2Mn1nV/hoGYoBjo5QIF0110Z0ifNlKmynG3mxQv1rFGxY31n+hf7B2cqTco
	r
X-Gm-Gg: ASbGncs/4DCI/dyUVJNlhZaTGoh22YvalrWNUWTe3Typ4N0Va2eb6/eParhxs7Su0Wq
	ym3LrayicbvCCyARMI/0IvXb1EcHlba6JfwPQx585acw5hCeN/xlG7nBEIEXNoyc4fMzpYsVjhA
	IgjNbMwDoNNwgcNQN9BSxVWYeNQ/nDxFv3dcauJ7MYEaTOz5RENi3yR7bI1AaM9/2w0f/IjQBTj
	bOdOeTtZdZsB3vrdY0joFGr9O9kO610XzJo/xYG8dA4Mj0wLoWOM0tyeQcWVr2KEuThK0MAPy4i
	XSHMR0u3Bq27PWGgJ/A7QCtl19OrpYsbmimEagEr
X-Google-Smtp-Source: AGHT+IFjYW7ZJ+OLH/60YBeqr+NNm0ThrbaJH5Yqhel/9cm1VDsMYXdPNanWyIsdgfurXM5lyU3qXA==
X-Received: by 2002:a05:6a20:c70b:b0:1ea:f941:8d8e with SMTP id adf61e73a8af0-1f55611bdb3mr7382609637.16.1741478908372;
        Sat, 08 Mar 2025 16:08:28 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:e489:3a91:c6e6:513d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af28bbf3ab0sm4009124a12.9.2025.03.08.16.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 16:08:27 -0800 (PST)
Date: Sat, 8 Mar 2025 16:08:24 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v5 4/4] entry: Inline syscall_exit_to_user_mode()
Message-ID: <Z8zb-L8bFMh_YHxO@ghost>
References: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
 <20250305-riscv_optimize_entry-v5-4-6507b5dff3ce@rivosinc.com>
 <87senn3dh1.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87senn3dh1.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_160831_020655_DD3F67D6 
X-CRM114-Status: GOOD (  10.81  )
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

On Sat, Mar 08, 2025 at 01:37:30PM +0100, Thomas Gleixner wrote:
> On Wed, Mar 05 2025 at 16:43, Charlie Jenkins wrote:
> > Architectures using the generic entry code can be optimized by having
> > syscall_exit_to_user_mode inlined.
> 
> That's a pretty handwavy claim. What's the actual benefit in numbers?

I put the numbers in the cover letter! Here is the data I gathered:

Testing was done with the byte-unixbench [1] syscall benchmark (which
calls getpid) and QEMU. On riscv I measured a 7.09246% improvement, on
x86 a 2.98843% improvement, on loongarch a 6.07954% improvement, and on
s390 a 11.1328% improvement.

The Intel bot also reported "kernel test robot noticed a 1.9%
improvement of stress-ng.seek.ops_per_sec" [2]

- Charlie

> 
> Thanks,
> 
>         tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
