Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0171C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 20:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InPBR5hPu24Tm/G5QdGPNRRuyIjX+DUtTwIwZ7/qslg=; b=qv/SU03YORKiCC
	jFIlxuuutrjbdSPVOxP3cg+llNXc9HvfW0REjd2WJBD6eVkd65ubgfRGLIUNiGcCLsUlhgcaf+wxE
	mZie9zlw95ZLceBxN7qjYnxuAOH3+p2RN4kvM9GAWvnvnHhV9XRH5qkmJpkhLYduTYf2vhQbP8xg4
	aL9cnEveKYSfBDQRBzOBfgRi1FcL3r+kg2XMXRJAJjDReNx71RX16ra1UapNaBffyXJegIalud6dw
	pF/OCnoyUL4OLu2kJKzK1dQhOkjri3R5y7GUb9CVmkrEjocvkkIcwFzmmztNu1Uw6tENNAXQXkJFi
	TBvh4uMHCfiq1K+VDpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neNaP-00FlUx-UM; Tue, 12 Apr 2022 20:58:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neNaE-00FlTy-Gw; Tue, 12 Apr 2022 20:57:55 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1649797072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w642aWN42zYFGGZD2a2O5goJFKRbh1eHda8TK6sp2vE=;
 b=ladY7lhIHrXI2k9D7th0Z6+5ep54BOrI0BnbuW//bOpbOmNiY0uhc/fJhnRb6rfFB8G9mY
 Ze+v0e45IIqUQmchHM6c7WZqQJWMrwLiB6AsoMq3kdFtdXc0H1UEwbXiPHu+zOKLNlV+Rr
 kBWtTurIIXE+P0wft+z6TjNPM4Fwpx+nPAjOHNCrw2/kzz68fZCYtxlIeP27GP/ppLAWyo
 sIZ3nWfYuU1N5plsp4tFWAWj5rC4sh75NhHIe9NfkiNN9zP2OWOoPLdXFlzyqHWcUx87xH
 UeAyFlZEfxHIkB8v/DuJFxXKev9B+PXimtGyFvdnTlAM8lziorbNeXpm0yMh4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1649797072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w642aWN42zYFGGZD2a2O5goJFKRbh1eHda8TK6sp2vE=;
 b=97p7ujeYtp/JNITBvGjRAaEaYf/IylcEWqaaB0wlEKegNLYjFko3yLj6d/iRtEo3osYpqD
 YjBvQAAGxYMpj8Cg==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, arnd@arndb.de
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, "David S . Miller" <davem@davemloft.net>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H .
 Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max
 Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v3 01/10] timekeeping: add raw clock fallback for
 random_get_entropy()
In-Reply-To: <20220412172754.149498-2-Jason@zx2c4.com>
References: <20220412172754.149498-1-Jason@zx2c4.com>
 <20220412172754.149498-2-Jason@zx2c4.com>
Date: Tue, 12 Apr 2022 22:57:52 +0200
Message-ID: <87bkx6f29b.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_135754_746046_640A48E5 
X-CRM114-Status: UNSURE (   7.90  )
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

On Tue, Apr 12 2022 at 19:27, Jason A. Donenfeld wrote:
> +/**
> + * random_get_entropy_fallback - Returns the raw clock source value,
> + * used by random.c for platforms with no valid random_get_entropy().
> + */
> +unsigned long random_get_entropy_fallback(void)
> +{
> +	return tk_clock_read(&tk_core.timekeeper.tkr_mono);
> +}
> +EXPORT_SYMBOL(random_get_entropy_fallback);

EXPORT_SYMBOL_GPL() please.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
