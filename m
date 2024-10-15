Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C61D216A2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeian7VSRB7jlzd11W++syOwWo7adtYAMGPw8MrbhIs=; b=3hmuSck5Khfhia
	2wNCWl5e3/M38WgHbyWiM2M+z6oy6g6aHLizZydlKr1LBxq6SJNxLsvo9L6SAyCmW8T39iqYR3Vxp
	eBBz8dUGKMYWm2AdC3pJYwzMBUnnemHD9fHXPfC8aq5ZYpBq5IM+4ynZZ+gavPklUdgfL4267UV6i
	U/gedHDWQ/PmImIKqc4rCNRIeMKqMIPsH7JdlaE9NVC+n7Pt3UvlyT3j3lckhQcvzHn+1bo8wEC5Y
	/xlc/zh0FVxsxmgEZMU3bdQnL5Tw42OohFpnds1vDWmD1eFudWAiHyQT+ssfofCfAilW3jX04n1Mr
	wbW7vdREC5SsjYNi4k7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hGf-00000008HSx-0Gpg;
	Tue, 15 Oct 2024 13:07:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hFD-00000008HDb-2Ool;
	Tue, 15 Oct 2024 13:05:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 81C4EA40F29;
	Tue, 15 Oct 2024 13:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25155C4CEC6;
	Tue, 15 Oct 2024 13:05:39 +0000 (UTC)
Date: Tue, 15 Oct 2024 14:05:37 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	David Spickett <david.spickett@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 11/40] arm64/gcs: Provide basic EL2 setup to allow
 GCS usage at EL0 and EL1
Message-ID: <Zw5oofuDjuCemq19@arm.com>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
 <20241001-arm64-gcs-v13-11-222b78d87eee@kernel.org>
 <20241009204903.GA3353168@thelio-3990X>
 <86msjc56mi.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86msjc56mi.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_060547_696496_1FE42E12 
X-CRM114-Status: GOOD (  16.17  )
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

On Thu, Oct 10, 2024 at 04:18:13PM +0100, Marc Zyngier wrote:
> From 20c98d2647c11db1e40768f92c5998ff5d764a3a Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Thu, 10 Oct 2024 16:13:26 +0100
> Subject: [PATCH] KVM: arm64: Shave a few bytes from the EL2 idmap code
> 
> Our idmap is becoming too big, to the point where it doesn't fit in
> a 4kB page anymore.
> 
> There are some low-hanging fruits though, such as the el2_init_state
> horror that is expanded 3 times in the kernel. Let's at least limit
> ourselves to two copies, which makes the kernel link again.
> 
> At some point, we'll have to have a better way of doing this.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/20241009204903.GA3353168@thelio-3990X

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Tested-by: Catalin Marinas <catalin.marinas@arm.com>

Please merge it as a KVM fix if you can. Thanks.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
