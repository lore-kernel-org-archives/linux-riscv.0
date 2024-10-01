Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDB0CF3189
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5noCff4Fo9na0i8G27MBlGR3N4C8LPfhQCnzN9vKPc=; b=2xc98q9l7/76gzLji3matjRGUD
	CrxOmbhzqZvsZfgAVay46g5e1W3baS2831dAXPhI7hAeg4j2DuVT/tjqDAn6xkIWYCIoobG+AZV05
	6IymgdI24ifJN8zoz9d+nXWQjEDTyajGjuS4bTP9q8DZP+CI0rnZ1zGTIRaYCm7xfEQ73JotRAz65
	oqBKqx5YxCywSoYABBG0AxtQkFRUU/f9WYQVYq8KJLzRNrwpochKP74t9Tqsd0b/C352eIqmTTMG2
	r6FKBn+gWmtnwB0iUYmLcBUYGlvvCm5SxWAoI/QeJE6KhhmXUEDY+KgJvNXYWDOatu7M40BAJYF12
	Q/Q60SEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svmf7-00000004PZi-03qe;
	Tue, 01 Oct 2024 23:52:13 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svm3T-00000004Km1-3wHY
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 23:13:21 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20b9b35c7c3so24605175ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 16:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727824399; x=1728429199; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vF28sAx//tve6z0mOEzHepFQAlUB74FiXmJYm/deJzs=;
        b=1PHAgYKxlisFVF8HKWYQILeP2LmF8bCnz97IXT1zWEJ+vixPTx0XHqRsP4OwOBc5wI
         nB4onxdT/27oNHz+Q0FsRernrUmEHs+QFSL2DFOsLVbDQrmSDK3zsKpPIB3z+Oz2EaQ1
         qMb3EsN5xv5IXBkz2crB/Dp8EiPxuP65KW166MIdgx98RpDLLQD2mWbAClYdQjPXq58A
         6Tn7H2NFDEY9Uv+kdp/OLpoN+MolkBrqAfYgLOgxPhD+3UiyMi9Ex0lH+nGX/NK0YnCH
         9si0xhco8QDOR5mMccapuZpsYxPv7Ui72RVCQBuDXjta5pc6csnJRf8LgwLW6/aUcvT8
         4slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727824399; x=1728429199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vF28sAx//tve6z0mOEzHepFQAlUB74FiXmJYm/deJzs=;
        b=kXcG55Uhm+g8tc0kNNMf9rvbPNtoUwjvz7BGg2n4ygPrlB4dcZ6PNSES7wrYxBQ6ZD
         IR2d9f1FMBEk3YDU4b1z9I2uikRlBB/+CAWyYv2uGFjD+xEnRA3NNRceq0Sd6aO1Xf8a
         21MFsOngG128WFRtSLWwIEqAPU0yxZ5E50Es8jJ5VJofY5nzkAN+5cncTU8gQJKGFoED
         HMXy4HJQPwM9C7b1RJAWY5T6jude2FqJDn/VfZl8lH14sogYO7iV+PhVq328ePvYOvuy
         mj3U4Gf+sjJ9SfZT4MV1kZixXC+yaO3hxUnT3HsMq05EA08ma6byWrxExtD+jWqydVfL
         zzTg==
X-Forwarded-Encrypted: i=1; AJvYcCXNc7sD5UhWr2YdX0owuvFiv/XBuPdzsGAzj3ZpRI7leqcnghWDMdZJrhSa8LbbXmn14R8GjNKzjiE0rQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVkWsT+ZN8n+70b7uhRoSoivtHhbpYDROJHO4XBso0mFToLoVZ
	7w9qmPYu5FOfq3cQ214xEraFPl0vdfPGpGJb/ORVBtG9nK/aIz1dqD8PzLKnbkg=
X-Google-Smtp-Source: AGHT+IEIrzHYfjGFMSAlwPPGGJUrbwH3BDEgMMmzhiHFcldc7QLYwSfdGVw09IGHWqEtu37pmMpU7g==
X-Received: by 2002:a17:903:41c4:b0:20b:a431:8f17 with SMTP id d9443c01a7336-20bc5a887b7mr17332045ad.58.1727824398654;
        Tue, 01 Oct 2024 16:13:18 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e37225sm74521465ad.197.2024.10.01.16.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 16:13:18 -0700 (PDT)
Date: Tue, 1 Oct 2024 16:13:15 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	David Spickett <david.spickett@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 04/40] prctl: arch-agnostic prctl for shadow stack
Message-ID: <ZvyCC7tJT7QoKO+D@debug.ba.rivosinc.com>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
 <20241001-arm64-gcs-v13-4-222b78d87eee@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241001-arm64-gcs-v13-4-222b78d87eee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_161320_252246_0C12A345 
X-CRM114-Status: GOOD (  16.48  )
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

On Tue, Oct 01, 2024 at 11:58:43PM +0100, Mark Brown wrote:
>Three architectures (x86, aarch64, riscv) have announced support for
>shadow stacks with fairly similar functionality.  While x86 is using
>arch_prctl() to control the functionality neither arm64 nor riscv uses
>that interface so this patch adds arch-agnostic prctl() support to
>get and set status of shadow stacks and lock the current configuation to
>prevent further changes, with support for turning on and off individual
>subfeatures so applications can limit their exposure to features that
>they do not need.  The features are:
>
>  - PR_SHADOW_STACK_ENABLE: Tracking and enforcement of shadow stacks,
>    including allocation of a shadow stack if one is not already
>    allocated.
>  - PR_SHADOW_STACK_WRITE: Writes to specific addresses in the shadow
>    stack.
>  - PR_SHADOW_STACK_PUSH: Push additional values onto the shadow stack.
>
>These features are expected to be inherited by new threads and cleared
>on exec(), unknown features should be rejected for enable but accepted
>for locking (in order to allow for future proofing).
>
>This is based on a patch originally written by Deepak Gupta but modified
>fairly heavily, support for indirect landing pads is removed, additional
>modes added and the locking interface reworked.  The set status prctl()
>is also reworked to just set flags, if setting/reading the shadow stack
>pointer is required this could be a separate prctl.
>
>Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
>Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
>Signed-off-by: Mark Brown <broonie@kernel.org>
>---
> include/linux/mm.h         |  4 ++++
> include/uapi/linux/prctl.h | 22 ++++++++++++++++++++++
> kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
> 3 files changed, 56 insertions(+)

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
