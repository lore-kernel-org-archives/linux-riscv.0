Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15CACF6D3B
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYWa1/TBa7pljhHCysiqV98Ibb8KJaMaBg0uwIQzO38=; b=08NoB9j8YLUU/h
	Dfw3i8YSZ9OWsLnrJHKuot1RNH6hGKoKePoeQDB30A4YS1cAxGvYhdrsdi6wyvCckUT2bq9t5yLAW
	DEwppMb0R7P9mqT+wZqr43wnUayw8hlXs9OnzkkkESdADCAA24tPLNL+rumuXU3Og3ggDjN1CozZ1
	S85d87NFdpWUauM2f56eny/drF2xB+wc+nbqJ2I0URmShRXuPxYd1nbYVgsqavfUAgMfDMWriuA3X
	yQjKrhdLRCvISZRMymtVH2UCi9LydjuaEoxXsM51qbkF/SJBQwt5FJxXPn7c5zF7yipKcq33/MWnK
	enIU8LuA7NPGtNWX90+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1ii-00000006oPI-1yiR;
	Wed, 02 Oct 2024 15:56:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1hQ-00000006o0x-46FE;
	Wed, 02 Oct 2024 15:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y7Y065ncgEQkeROLY24Zjrin44Qypn3x4BPgUrreoPU=; b=TecWfZoHLK8gmuyJzdqo6KW8kb
	HFyDzmhzNwagwmrAf3zfsnRVGm5qhnG0MuWjMzZL63uzB4qYm1h+435PrzCFMy64u4KDAp3VV2eUx
	N3HA3blj/6pxGEQRyRC1M6VVMs2JfpHg+r/TbwH9WjUhEcuDpV3ZICKzc1IYgmm8SWcHFE8VblgzB
	N88YQTXmNGgqxG9fUYgCsuwkbmFWRShboAcWb0x0OhhqsVU6IBxyEzBYEws+6XeBIV7/WgclsoEJv
	a+0OSM/kdyA9zxqo1301pCqWLXv+bVyKl85d0cmG43ntavgFgDrE0j2YPdvy+9D4BYHWep9O5mJtg
	YbjB2cPg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1hN-00000003WZr-2wAK;
	Wed, 02 Oct 2024 15:55:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B23545C2783;
	Wed,  2 Oct 2024 15:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79667C4CEC2;
	Wed,  2 Oct 2024 15:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727884529;
	bh=27HUeDVHXOs+OLA9bA8uKhz/MQrgdafn0/iAATWL0mM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k9RkyEgh+Y/YS87nAPF1Ao6uiCfC2Ka09hloc087gdGHJXHVDYXjBmR2ceETg9ni6
	 deks86zaFNOb6z1/RiWcTXvOF0U/JLOW08+SpteRcOBc5nPa3btIZx+FKc8OiNN7e+
	 FEG/zba/f2YQ1sA2bH3Qf0Z5Uaro4RI1sXzvYN+fyrehRew3uav87f7UIuG26TbRhf
	 SHQvJ+naVNRRTRSJjCOOekaQRb5r/ZRFkTQWCmGQOBDzHBWS9b9AJAbC35w5zYjD/x
	 A1nX477cbgft4pfSE+Rw4NrdL8NdIF2MVohLnxdgNDdBRy1nbrrn5eOA9cIL3jvekY
	 d3ZSOc2PuCwsA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sw1hG-00H6P0-9r;
	Wed, 02 Oct 2024 16:55:26 +0100
Date: Wed, 02 Oct 2024 16:55:25 +0100
Message-ID: <86a5fm7b4i.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	Kees Cook <kees@kernel.org>,
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
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 16/40] KVM: arm64: Manage GCS access and registers for guests
In-Reply-To: <86bk0373nq.wl-maz@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
	<20241001-arm64-gcs-v13-16-222b78d87eee@kernel.org>
	<86bk0373nq.wl-maz@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: broonie@kernel.org, catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net, akpm@linux-foundation.org, oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, arnd@arndb.de, oleg@redhat.com, ebiederm@xmission.com, shuah@kernel.org, rick.p.edgecombe@intel.com, debug@rivosinc.com, ardb@kernel.org, Szabolcs.Nagy@arm.com, kees@kernel.org, hjl.tools@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, fweimer@redhat.com, brauner@kernel.org, thiago.bauermann@linaro.org, ross.burton@arm.com, david.spickett@arm.com, yury.khrustalev@arm.com, wilco.dijkstra@arm.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_165534_127898_BBC29D9A 
X-CRM114-Status: GOOD (  15.53  )
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

On Wed, 02 Oct 2024 01:24:25 +0100,
Marc Zyngier <maz@kernel.org> wrote:
> 
> On Tue, 01 Oct 2024 23:58:55 +0100,
> Mark Brown <broonie@kernel.org> wrote:
> 
> > @@ -4714,6 +4735,10 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
> >  		kvm->arch.fgu[HFGxTR_GROUP] |= (HFGxTR_EL2_nPOR_EL1 |
> >  						HFGxTR_EL2_nPOR_EL0);
> >  
> > +	if (!kvm_has_gcs(kvm))
> > +		kvm->arch.fgu[HFGxTR_GROUP] |= (HFGxTR_EL2_nGCS_EL0 |
> > +						HFGxTR_EL2_nGCS_EL1);
> > +
> 
> Why are you still allowing the GCS instructions when GCS isn't
> enabled?

Scratch that, they are NOPs when GCS isn't enabled, so there shouldn't
be any need for extra traps.

	M.

-- 
Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
