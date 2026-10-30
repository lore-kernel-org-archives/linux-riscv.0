Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC74606A320
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 18:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h/s8Dhz6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=CM5SjNC/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4mLUY4kyIhw4H7F/f0tHqdU33Z7jhz0jW0KyrA4Xu6M=; b=h/s8Dhz6Q5wTjduhs4Zgf62G7x
	SQ53c9uyQsnwSQSZUiJvrt0SCHJ8lOyJVMbuK3sE8ss21tqPjc61V9EOTvSesnyX0kX+QMElOHUb3
	VNuqNFVI4wJkwQNPKM8fs9Jxca9J74woYcHB80WmlzkdkaVEp69GDQXiz6yqlooLQOglH4RyA4Bmu
	8IJsJXKDQkfjTxcn2YAB94gUG8xALsx78eUSy+XqJkTcWcAwWKxFprIjYOhfNULlCPhA0bZIm+LuW
	BNIEnqtN6ihsjx2vC8KXkDMhZs4L8VQLt0VqZMtdKkxMD5KGpac78oD4yP6XwY3AhAvwD4tW+oNgX
	vTvcqGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrTF-0000000CPk1-2pCt;
	Fri, 30 Oct 2026 18:36:57 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrTC-0000000CPis-0BBj
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 18:36:55 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-679e86015e2so2416505d50.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2026 11:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1793385411; x=1793990211; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lnreq8dc1kXyWMWD+2wEJ3SBKmyDtG659lWmXyFpFB8=;
        b=CM5SjNC//RLrfeNV/4hdBMSyN/gyd0aecXZToXYX1lL86OH0jyqNiYfSzm4k/mNg05
         nh7RUlU9gnKUGKBW+BLdupJdDZfxqL3UpgA47537kZXamSnXZJF/x4rW0KSS/mea2z8l
         UWkdwc7mBwEFYQVkmSIsh1FqWs5BVjit7LrdYaZM2fsUoZ+Tc2Rum4ayJre+PXCxfPuZ
         652K88+nKf2mBC6V4p32cZ/hh7VjBqLfoLymCKYsIc/kLyE7+aEzJnmmHRBQ2B+wmRvV
         CN06ds+/ljvG1uPmub57PSHSOEtTajC/155YLkiGMtNKJ6Umpa5z/SQAx0UmqWdQtHNS
         iu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385411; x=1793990211;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnreq8dc1kXyWMWD+2wEJ3SBKmyDtG659lWmXyFpFB8=;
        b=ueVpqG7fs1vu2zpxwhExmhdTGveQdQJS2i98uv092cjq/zYSh1Xxt8hleVOP7IK3wG
         tbRVk25DimyPDwftMj4trR6nWhVh6M81UlXP8GzU1snzveyITUYrmszUxWvJoKR+6LFM
         1w7+366Mc0ElYD+svJNFvwFSAeiL4nvUAL9+gk+c4h8mcY+8qn8b/0BzaNuo0I+If7In
         tkk/w3gSMj7u9MMhXI6SEn7vjv4S7EHqXRmX1rh42fOZxlmnKN9CRWJAwOBoEGQQk17i
         bNUEHBuQD/c/Ys9qNQbwJG1ClecLfgppv23dBonHy7F+sThd2oPQkwCk5TGtI3jPi80a
         0APA==
X-Forwarded-Encrypted: i=1; AKwUvBzHX/BD8HcFGWNOCxsqY1z6lsClqluS0eAaP4GlEQGwtOv2pufysttF/ple+mh2yD+lp7zCScCWOmSVuQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJGIC/Wlvvzt7L6tlrfIkW0hiy1e9Xw14E/dI8ZneZN4GOuPJlr
	FXnqNeUxFhHXxtItw/NjxDwV4HerGKZvM6aXVSW1bRQAiHuOcwJ7KPSHzlbj4KWuc8c=
X-Gm-Gg: AYBFou2adaKuTg/K+UnFr+SCWe19pwiyrPahY8TgY7XfVphMRm5yzGe3MuQFMDgEgGe
	TVzQqaVavCJTUoau0PdjC62XdR4yRhFrmd4kpkiHaWlK0Ubtk9ZEiBcYJxKYsCqLR3O+V/NH5Ad
	mazU1ru/1eOInjzt8BSAhLShi1yqmHB0ML7oLAOV+GPU7mNW4AxBcuepU2Bhbqf5/gRX6aH8zRh
	XqvnjhTcTcu3Y8o5D9SwSY5pLU/uCCGKGLN6IUhEbuAItHTUS+0+VZjG/p0ZCzqyyH9XRofxIyJ
	yAKIfr/LzENcouPaZtsFOL964I9EN3vJHUaBVqThm0nLRhtDRb4X9Dazyjz/BZM08Pl1ERLEKeR
	ZD2q1MdoL3W9CaDkL+52XMbbrCxM1S8wTkrn7ybco6DZ2Px7ULG/jsxZEQVbwH+WxA8GS/xP5G1
	yV7GKtIka2PK7rqL1bW8+773aq09aUVHMSHHrfNEt4jrlkd2RxxvXrSFRYxqnPTx9npJnceirac
	Qt7P5WdyDprZphkV97NjcNSoNGwX2BH9k03pHqdiC/jwNtAj+92kdGiPQ8ivfJTZOWuc1F/SbUa
	zmkH2i4a4VAmzuRXyds0hPRkZg/hAu7uihy/CjDpIRqlL2ZdCdXub0iOAcfIjw==
X-Received: by 2002:a53:b4c3:0:b0:672:c99f:5f5a with SMTP id 956f58d0204a3-67a8d398a79mr3576548d50.8.1793385411605;
        Fri, 30 Oct 2026 11:36:51 -0700 (PDT)
Received: from localhost ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf344b20sm454126d50.20.2026.10.30.11.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:36:51 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:36:49 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <pjw@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re:  riscv: Deprecate vector state prctl/sysctl
Message-ID: <auTjwQoRqV5ayKdx@Tao-Chiu's-Mac>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
 <20261007085126.222688-3-samuel.holland@sifive.com>
 <DM9V74ODA23L.36WJYLIGDDVMG@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM9V74ODA23L.36WJYLIGDDVMG@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_113654_092961_ED336AF1 
X-CRM114-Status: GOOD (  22.73  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Samuel and Radim,

On Tue, Oct 20, 2026 at 06:08:10PM +0000, Radim Krcmar wrote:
> 2026-10-07T01:51:17-07:00, Samuel Holland <samuel.holland@sifive.com>:
> > The ability to prevent userspace from executing vector instructions was
> > provided as a escape hatch for software that was broken by adding vector
> > state to the signal context. This appears to be unused in practice, and
> > creates confusion in the extension support returned by hwprobe(), as in
> > this one special case an extension reported as present by hwprobe() is
> > unusable.
> >
> > Since we believe it is safe to always allow vector usage, hide the prctl
> > and sysctl behind a Kconfig option and mark them as deprecated, so they
> > can be removed in the future. Note that significant userspace software
> > like glibc already considers these controls explicitly unsupported.
> 
> KVM on QEMU breaks because of -EINVAL:
> 
>   static bool kvm_cpu_realize(CPUState *cs, Error **errp)
>   { [...]
>       if (riscv_has_ext(&cpu->env, RVV)) {
>           ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
>           if (ret) {
>               error_setg_errno(errp, errno,
>                                "Error in prctl PR_RISCV_V_SET_CONTROL");
>               return false;
>           }
>       }
> 
> We could have somewhat softer deprecations by defining that the vector
> prctls succeed when user intent matches the current state and deny any
> change.

Thanks for spotting this, after discussing with the team, we would
suggest the following moving forward:

 - The prctl and sysctl interface should remain, and PR_RISCV_V_GET_CONTROL
   always returns the enablement status.
 - Turning on vector with prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON)
   should always success on a platform that supports vector.
 - Turning off vector with prctl, or sysctl interface should return
   -EINVAL, and must not turn off vector at next execv. A pr_warn here
   could be helpful to inform system administrator that this operation
   is deprecated.
 - Selftest should be updated and verify that turning off vector with
   prctl does not take any effect.

I am happy to help on any part of the work if needed, just let me know.

> 
> Or is RISC-V still bold enough to "fix" userspace and hope for the best?
> (High chance of Linus.)
> 
> >
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> > ---
> 
> Would be nice to also update selftests and vector.rst.
> 
> Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
