Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D71CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cALu6WeKpxFH8V4LVLVkulbjnR2fT99Xxu7oVcT8UMI=; b=C/OZ9EuyZd21tD
	dIPfZmIQfQrhpwoRt/HOeaTSZ5HMz/ztPPUHXH8RQhl42N7CVZQqy0aYjws+WwM3WrOGVx5YybbIB
	Z6DtnyxL3b0l3VOo5DPrX4Tw7lX0cYfxxJ4FSNvWgoNQu9oB7c647OmY4SxJuGNk3OcFg3Be+gno7
	PcfnNHaQEM+LQk4uoF3NXv/qOhq7a9kMnMKp6KaJpqAcKYXxB8oP5knOJC9lXwGhqcNK7Vkz4k8P4
	57YoQw4Jp1tRJR1/V3e6vnOKc7UtE1lWT8weqHxAK7kjvOF2IILMdZ1o8AKSAXdmLrgUFzTeSoidQ
	uinNUCnIiDRAkIeNvXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhxX-0000000EiJm-1iqw;
	Wed, 03 Jun 2026 09:32:23 +0000
Received: from stravinsky.debian.org ([82.195.75.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhxU-0000000EiJI-1i09
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 09:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=keRhHM2IsRAj6zneQ+S+XT69Crthh2nKndB1LnDS7Ss=; b=A1+/9wBu7U1itUj3DW4wTOC9dI
	AZAMJEbcHNR5wx4g5a6s80aCCZn5JwM48kycWqgQjuQ4bnZfEnaUJ4pBOu8rB1kQXylniI9xzMvjw
	mm7WiiIy1ZaHoHRH8LICjgsrR7TSykv0GMS87ikynJtcjfFrw4BbDS7pHA8qtjpgVGItAxPn1cMXE
	2RZEa+Lij4FBZiJd4wKxGhNXpyBXD9l//8rdZ+czQ8lOTwR/GlCdKgmU/73heQi1prCB4d2aPjLrh
	j4bv2RKPgXx/0zRw3tITWqiYVvecNjRrtI4sVqMiOSelebFz/I2gbs6G6jKKKTrlRnuqfvS3mpbCJ
	72O+gVYw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wUhxF-003dMM-0D;
	Wed, 03 Jun 2026 09:32:05 +0000
Date: Wed, 3 Jun 2026 02:31:54 -0700
From: Breno Leitao <leitao@debian.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Morton <akpm@linux-foundation.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>, 
	Song Shuai <songshuaishuai@tinylab.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] riscv: kexec: use min to simplify
 riscv_kexec_elf_load
Message-ID: <ah_0fOD8mNWTKz9f@gmail.com>
References: <20260602224725.1088385-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260602224725.1088385-3-thorsten.blum@linux.dev>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_023220_452410_571FC304 
X-CRM114-Status: UNSURE (   6.75  )
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

On Wed, Jun 03, 2026 at 12:47:22AM +0200, Thorsten Blum wrote:
> Use min() to replace the open-coded version and assign the result
> directly to kbuf.bufsz. Drop the now-unused local size variable.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Breno Leitao <leitao@debian.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
