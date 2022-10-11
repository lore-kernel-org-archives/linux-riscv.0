Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2C1C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 17:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqorGaEOiDF/j1jHBUEvgHlZnX7XiggMgPb7FkoO+/E=; b=PpB60frXDWBsQN
	nHk4M+dcVBWiOvg0sx1A2joKjQbPLXGCwy8COz3hWR4IONpfXiueZ2DTWfHc9cUI/0OinvDyKJg3k
	TkwFV1b5nrd8iK6pccYe65WyMgFZw/IQh2aBmAuVtTT5+PODlJVb4ADcC7p7YrnRUQ5NytUi1vGMT
	jEW8UpSOXCMW0kVVoLNmGicNvn9PzF5zbf9F9/M1khOwmzEc45naoJr4uXLXUDjD2IRV+qEShEZck
	Cg8XKNPt7lq6d6rmx+XTbEmseF4YgFKxCiosnw/htZ5lPqLe8I4IlCPjbDBcbjzGfq8mi6QeKm419
	mXuWjEThYsrVHA0ofGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiIfr-005Il4-3v; Tue, 11 Oct 2022 17:04:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiIfo-005Ikd-8M
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 17:04:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E51D61225;
	Tue, 11 Oct 2022 17:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5F9C433D6;
	Tue, 11 Oct 2022 17:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665507847;
	bh=QFWretD5XAgF1hs6LQIHm6e4n5ZNZUx8I1gdUxgAZ/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nl38CY5bfejPeodSJaRGdCvu5/ye1FJ7kNlgSbY1Ji2kCK0GE6N6kLCnc4RD+dwlI
	 x5swoRQ8CuNWyzlFgAOJcyHpIfbAnJ82oQNB60dLqGtQR2lFTPi2PIGoE61Rf4DPyI
	 20ZMhtRdfx4UGsare3jcqr/q6H02Wu/Dgz1QufaI7jqtBO2tNkjU8bO3BSwOBEeNwg
	 j93HGlYa9bmVrnWRd45AlCZRhbZlIs4GltmiV6ArvsSp2OSymeDCsioLyNFOr2+w42
	 iMaHjKeCYyWeaaYEZXxfGw30QEDCIJ5JlFeHt51t9FSKIg4kj+2Biw5Ou+r3RwK5pg
	 ugCl9EEjG48aQ==
Date: Tue, 11 Oct 2022 18:04:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Celeste Liu <coelacanthus@outlook.com>, dram <dramforever@live.com>,
	Ruizhe Pan <c141028@gmail.com>, Conor.Dooley@microchip.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Make mmap() with PROT_WRITE imply PROT_READ
Message-ID: <Y0WiAgnN5IcQDrez@spud>
References: <20220915193702.2201018-1-abrestic@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220915193702.2201018-1-abrestic@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_100408_351934_08FB74A7 
X-CRM114-Status: GOOD (  20.08  )
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

Hey Palmer,

On Thu, Sep 15, 2022 at 03:37:00PM -0400, Andrew Bresticker wrote:
> Commit 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is
> invalid") made mmap() reject mappings with only PROT_WRITE set in an
> attempt to fix an observed inconsistency in behavior when attempting
> to read from a PROT_WRITE-only mapping. The root cause of this behavior
> was actually that while RISC-V's protection_map maps VM_WRITE to
> readable PTE permissions (since write-only PTEs are considered reserved
> by the privileged spec), the page fault handler considered loads from
> VM_WRITE-only VMAs illegal accesses. Fix the underlying cause by
> handling faults in VM_WRITE-only VMAs (patch 1) and then re-enable
> use of mmap(PROT_WRITE) (patch 2), making RISC-V's behavior consistent
> with all other architectures that don't support write-only PTEs.
> 
> Both patches are tagged as fixes for the aforementioned commit since that
> commit made a userspace visible change that will break any software relying
> on mmap(PROT_WRITE). (Also cc: stable since the offending commit was
> itself backported to stable).

The patch that these commits fix has hit the distros & manifests as a
userspace breakage for openJDK:
https://lore.kernel.org/linux-riscv/a69ee775-e565-3d72-eb5f-8378616694d3@gmail.com/
https://lore.kernel.org/linux-riscv/d6c9e249-08bd-4439-7dcc-371b32e7b851@canonical.com/

Eva tested these patches and reported that their problem was fixed:
https://lore.kernel.org/linux-riscv/20282242-5cad-42be-ce6c-834b0e7ef269@gmail.com/

I asked them for a T-b but I don't see one on lore etc, but it would be
from Eva Kotova <nyandarknessgirl@gmail.com> if you consider their
comments their sufficient for a T-B

Thanks,
Conor.

> 
> v1 -> v2: Allow handling of load faults in VM_WRITE VMAs
> v2 -> v3: Split into two pathces
> v3 -> v4: Fixes tags (+ this cover letter)
> 
> Andrew Bresticker (2):
>   riscv: Make VM_WRITE imply VM_READ
>   riscv: Allow PROT_WRITE-only mmap()
> 
>  arch/riscv/kernel/sys_riscv.c | 3 ---
>  arch/riscv/mm/fault.c         | 3 ++-
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
