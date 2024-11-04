Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AD3D1BDD4
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 18:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NE/lPx6bVILJ1FFO8cLSwA7CJ4b12iU0LXaVNxZ5aOY=; b=WhBU3vGXn3GhxO
	64uui3y/q8TlcP1tG7mqAwxzxRC/d5xXg6M2iRAi9Vq4dDASLTlQQoYIfSMG8LibqTdNWGpnnbGib
	PqwAaDMrQEh0tujPh+DhLfDIalMEUHqb6wRXLdlOHEl8n/wGCruzeq1+XMWdKqrHJXEKy7l3CcxPi
	3e02JzNMqlYzhO/coi5fMp8B3HrpuDo4se5b1IMpVuWdfUT111TeJMG//Vk6ttcDyLFZ0UP7u77Dh
	MkcjVApDTa8zOyfCNkiSAD/DDEe63F6VqLEwmhcWP+XKlDdPb0Fztu5/cWif+hWkiJLeFHmQeZqdu
	7Rava6DGHtS7KpMtrzng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81Xk-0000000Efrm-2jtg;
	Mon, 04 Nov 2024 18:11:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t81By-0000000EaWF-0099;
	Mon, 04 Nov 2024 17:48:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0EB5EA431F6;
	Mon,  4 Nov 2024 17:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1421C4CECE;
	Mon,  4 Nov 2024 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730742520;
	bh=kyMZ9fV6X+51trgRY65w1AUDjMP2XEnEX7GkvQFyuQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RG0ZZ45eSLTeSuURvGHB3h65F9t7QbkI04hRi4PIn9RQya+KVuOq+cKYwcM7OIRag
	 ftffa9p0RPzhxKxbKbO1phJPPDnrPKDiu3Z4Itvr9Wls0R3DzSPdYDwIWB6GC4b2Kn
	 OEWSQb/cisXjv+NDzmcx6uuXNdVsmOSyH1jBzLk86RwIVvV7yoI0yJMI8N5O1tLxWZ
	 sqPAibypRsiDduXZx2vz4SdLoEWaYuAYo/l7nO/C5PoaF6LQixrBB1eQNUAosrKHye
	 /gCeCfoWgbjXS3QMM1TfccoGnuhihV/zkZVDdun5Dof7x1e0ZdWeQe1z6JZskIC3qV
	 2uU8b6EJ5uv3w==
Date: Mon, 4 Nov 2024 17:48:39 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 15/18] ext4: switch to using the crc32c library
Message-ID: <20241104174839.GA1049313@google.com>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-16-ebiggers@kernel.org>
 <20241104155900.GH21832@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241104155900.GH21832@frogsfrogsfrogs>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_094842_128072_8A247649 
X-CRM114-Status: GOOD (  14.96  )
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

On Mon, Nov 04, 2024 at 07:59:00AM -0800, Darrick J. Wong wrote:
> Hmm.  Looking at your git branch (which was quite helpful to link to!) I
> think for XFS we don't need to change the crc32c() calls, and the only
> porting work that needs to be done is mirroring this Kconfig change?
> And that doesn't even need to be done until someone wants to get rid of
> CONFIG_LIBCRC32C, right?

That's correct, no porting work is required now.  'select LIBCRC32C' should be
replaced with 'select CRC32', but that can be done later.

> > @@ -3278,15 +3263,11 @@ extern void ext4_group_desc_csum_set(struct super_block *sb, __u32 group,
> >  extern int ext4_register_li_request(struct super_block *sb,
> >  				    ext4_group_t first_not_zeroed);
> >  
> >  static inline int ext4_has_metadata_csum(struct super_block *sb)
> >  {
> > -	WARN_ON_ONCE(ext4_has_feature_metadata_csum(sb) &&
> > -		     !EXT4_SB(sb)->s_chksum_driver);
> > -
> > -	return ext4_has_feature_metadata_csum(sb) &&
> > -	       (EXT4_SB(sb)->s_chksum_driver != NULL);
> > +	return ext4_has_feature_metadata_csum(sb);
> >  }
> 
> Nit: Someone might want to
> s/ext4_has_metadata_csum/ext4_has_feature_metadata_csum/ here to get rid
> of the confusingly named trivial helper.
> 

Yes, that should be done as a follow-up patch.

> Otherwise this logic looks ok to me, so
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> 
> --D

Thanks,

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
