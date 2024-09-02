Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112F2CA0ED3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 18:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKy1nbnGXwJiCUKvyImAM0LOu0fsYXMuQNu/3YqjHes=; b=Xmu7xuakcmvKPv
	7GLxgp8rCzuhOPxex5AttFsKjUvokdptZJkBRZ1/da6jreXnOVfJqFTrUoMcN+8me4c8Idp1lx3gx
	3gl1j5OM6cd+xPzGTe3mSSkDWfSybt7uIJ1oA2b+xeM+dlkQv8ft0o5JOC/1qgTp1pAy/ZhUnTgRY
	8/QicHVm6TBb/uaiX7W4AICxhOCiR4VvEfaQlIcvCTQP1WS5QJYZt0jRjQS32/xQn6+0Q9zggCTUu
	bFzbrQyczKyRgznxY0/Udhi4xz7PCVpfkJLXortYelQAwaC+/v0EIBPt3vPkIV/7sksitz/C0dAlf
	k/1y0/9VHii7L4YSzIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slCD8-0000000FKFt-0MFb;
	Mon, 02 Sep 2024 18:55:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slCCD-0000000FK1R-01v4;
	Mon, 02 Sep 2024 18:54:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD5495C58C2;
	Mon,  2 Sep 2024 18:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B088C4CEC2;
	Mon,  2 Sep 2024 18:54:27 +0000 (UTC)
Date: Mon, 2 Sep 2024 19:54:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 19/39] arm64/mm: Handle GCS data aborts
Message-ID: <ZtYJ4SUDLxrjDDBX@arm.com>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
 <20240829-arm64-gcs-v12-19-42fec947436a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829-arm64-gcs-v12-19-42fec947436a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_115437_118654_60AC96A7 
X-CRM114-Status: GOOD (  17.49  )
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

On Thu, Aug 29, 2024 at 12:27:35AM +0100, Mark Brown wrote:
> All GCS operations at EL0 must happen on a page which is marked as
> having UnprivGCS access, including read operations.  If a GCS operation
> attempts to access a page without this then it will generate a data
> abort with the GCS bit set in ESR_EL1.ISS2.
> 
> EL0 may validly generate such faults, for example due to copy on write
> which will cause the GCS data to be stored in a read only page with no
> GCS permissions until the actual copy happens.  Since UnprivGCS allows
> both reads and writes to the GCS (though only through GCS operations) we
> need to ensure that the memory management subsystem handles GCS accesses
> as writes at all times.  Do this by adding FAULT_FLAG_WRITE to any GCS
> page faults, adding handling to ensure that invalid cases are identfied
> as such early so the memory management core does not think they will
> succeed.  The core cannot distinguish between VMAs which are generally
> writeable and VMAs which are only writeable through GCS operations.
> 
> EL1 may validly write to EL0 GCS for management purposes (eg, while
> initialising with cap tokens).
> 
> We also report any GCS faults in VMAs not marked as part of a GCS as
> access violations, causing a fault to be delivered to userspace if it
> attempts to do GCS operations outside a GCS.
> 
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
