Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B5CD1BDC0
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCPEKjBtNimglaTFT+ZqzxvdLFKlJgG2P5+Qk+DHL88=; b=xV1BRXatjphLrw
	lBR4w+c4AIGN9f46kA+xnVw0xztI8EEP3NO/1PVcf7yjBTWUiL+OtinSZ5e2MxgoepUoAMch7Mdul
	kbXKrKP1WZ1vcF53B9PQw3B3nTsVYwkUcJ9PwlSQUY1YZtrvxVL4zIky6V7ms7tbxLIvhBwbWjGWO
	PxlPKm9aCcfO/eaLHyfS9Vyuqux3pua5zDj2+0Hl3ZawvGS6bCYeqoLTh9e4UDuDSMSTP6j31P5y9
	Fj0iP74CwZtpPN77hkTjcYoLIOyTqpRl03zVHJsUleoMC8tRYmg7CS2chxu7WxJoiErKEHCAmcmtH
	sf+8kFGfaqmJuuTVE9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7znY-0000000EMBK-3yah;
	Mon, 04 Nov 2024 16:19:24 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zlq-0000000ELmK-0T0K
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 16:17:39 +0000
Received: from cwcc.thunk.org (pool-173-48-115-131.bstnma.fios.verizon.net [173.48.115.131])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 4A4GHDZq005094
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 11:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1730737037; bh=MfBLldae6HpVT/J0uH6IxgYAl1BDd58WeCFp8bpuhVM=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=B0Gfw9hby54Mawf3nVtoZfShOFAGukbl6ZTbcBRlBYtaOGsQCDtF0qrCRjYcyueMN
	 kV3YMqvlfKnXp0p4fCWynaSg163bApSkqyhJqyYAnlJGmGsBqD0LP+xC7Ub8B3AkMW
	 fCaW+bTFL4V+NDN7Mwtj3eK4pBVhp1exceawLgFrmz6mC17UMOrLmM35q5gxC4WiPa
	 dU/am5SfTEXUCGkYocIUCIDjggZimNzSIcTYzrac8AXMHympLwlrhdp6OGCVFYpanm
	 7zZxGz70mRgKnWKu+qePBhSgO7AcPnfmUhE92pXrgqBwyRWdRGP2hoQHMO6YFDD2gt
	 W9K47pAC0MkrA==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 8C6D915C02FA; Mon, 04 Nov 2024 11:17:13 -0500 (EST)
Date: Mon, 4 Nov 2024 11:17:13 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
        linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
        sparclinux@vger.kernel.org, x86@kernel.org,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 15/18] ext4: switch to using the crc32c library
Message-ID: <20241104161713.GA43869@mit.edu>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-16-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103223154.136127-16-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_081738_315834_E4E2C455 
X-CRM114-Status: UNSURE (   9.64  )
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

On Sun, Nov 03, 2024 at 02:31:51PM -0800, Eric Biggers wrote:
> Now that the crc32c() library function directly takes advantage of
> architecture-specific optimizations, it is unnecessary to go through the
> crypto API.  Just use crc32c().  This is much simpler, and it improves
> performance due to eliminating the crypto API overhead.
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Theodore Ts'o <tytso@mit.edu>

Thanks for the cleanup!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
