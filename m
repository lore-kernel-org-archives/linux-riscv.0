Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C245C531DC
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzRYLfmLWlJRxVVMqD/5hfITHuy5x1oRoPWF1Xk9/4I=; b=EQR3i3Z8D3iM3c
	9gVQ7LMVgOjSj7WCc/979C2VIDipqLF0c3kBtEppnUfgy0rtbKaTsHeJxLmO1KIU8bl+ZyQFZGy2/
	KPUvp+PYbjapAVIA5pvS2upsb192Z5ewScbfLDlHeuWdZTQbuQAy39Hxo4oBsGIiUXYdEwNJE4m8B
	DeYGLXWgrcL+RsMnXFIpaF3AfsQG70gWlk1RFQGnb0AM6XOWkrUawESZKGLAsvuawmtAnAdvQx7BR
	6iFw/fr7UOwK1igWcGtxv2fhmOU0rRygz+yXf3xC0sF5hRkEdbdPEV2F2uHGDG23QIgPlZo1wp+TZ
	zrR8p8ByuMeyCszzK+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgShB-00000006C31-2fSm;
	Tue, 20 Aug 2024 17:31:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgSgS-00000006Bq5-3NKN;
	Tue, 20 Aug 2024 17:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F62EA402A2;
	Tue, 20 Aug 2024 13:30:09 -0400 (EDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB55C4AF52;
	Tue, 20 Aug 2024 17:30:09 +0000 (UTC)
Date: Tue, 20 Aug 2024 18:30:07 +0100
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
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 13/40] arm64/mm: Map pages for guarded control stack
Message-ID: <ZsTSnx_IEqF-RkyJ@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-13-699e2bd2190b@kernel.org>
 <ZsMMDNIp6Pkfbg1e@arm.com>
 <d43f8036-cc06-430c-9e9e-b938037fc64c@sirena.org.uk>
 <ZsSvSeE303LGtk4b@arm.com>
 <ec999bf5-6273-4a3c-b1df-f8594d7bb228@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec999bf5-6273-4a3c-b1df-f8594d7bb228@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_103016_926270_C54EF6AB 
X-CRM114-Status: GOOD (  20.16  )
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

On Tue, Aug 20, 2024 at 04:28:21PM +0100, Mark Brown wrote:
> On Tue, Aug 20, 2024 at 03:59:21PM +0100, Catalin Marinas wrote:
> > On Mon, Aug 19, 2024 at 05:33:24PM +0100, Mark Brown wrote:
> > > On Mon, Aug 19, 2024 at 10:10:36AM +0100, Catalin Marinas wrote:
> > > > Is there any arch restriction with setting BTI and GCS? It doesn't make
> > > > sense but curious if it matters. We block the exec permission anyway
> > > > (unless the BTI pages moved to PIE as well, I don't remember).
> 
> > > As you say BTI should be meaningless for a non-executable page like GCS,
> > > I'm not aware of any way in which it matters.  BTI is separate to PIE.
> 
> > My thoughts were whether we can get rid of this hunk entirely by
> > handling it in the core code. We'd allow BTI if one wants such useless
> > combination but clear VM_MAYEXEC in the core code (and ignore VM_SHARED
> > since you can't set it anyway).
> 
> I have to admit that the BTI because I was shoving _EXEC in there rather
> than because it specifically needed to be blocked.  So change the check
> for VM_SHARED to a VM_WARN_ON(), and leave the _EXEC check for now
> pending the above core change?

Yes, sounds good.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
