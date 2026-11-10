Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A33606A325
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FBLVIDMT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H2axHf2O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PPdY/58U7gMpSygb54gieXVX3yzcGWhEcAaWIImdPPY=; b=FBLVIDMTF53UYUOA+HYebf9McH
	KkeRHWuzlcCsJO6AhaGl/IOF17mPX4igeM5p5E4WDPoX/+zgGUjDTrLwoq6Yo5+OsnKtO9SnW8pkm
	42zZyUMbFCpyv133EqheD57YIzhSWfR6bUGNr4MlcdPWfnquMQYc6Fnh+Bx/2sfNVOaDhEgkby8SF
	q/tFZGz+mVSppDJi1NvFX+wjfZmrZjnOHaNmzig2CQlQ8TOa2o65l/el6aK68MqrLyYchDU27Z25b
	RaBhn1FDQeWNZc7iTcu6xH3o0Hj5zrLSokDNKPFuBMZx1mfgltwmqLMPQQVfYs5VdqLxRejjlNxmB
	U4roys0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfuF-00000002jbj-26zm;
	Tue, 10 Nov 2026 07:04:35 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfuD-00000002jbN-3HPi
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 07:04:35 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so2339482a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 23:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794294272; cv=none;
        d=google.com; s=arc-20260327;
        b=mJxXXTcT9E3tX556WGVAeeoFWy0Yt3RdjeZiw1QJpm1rI2aDTg+/iNWwj8x0vuQ0Sy
         aBoIIkXkqt8ADLcH5SVBeJOKdK9Rtnz7Ix12dIhmectYNd/IVMiVFG4Mb8IDMXJ1QBpt
         LqAFZQqRwPSQ5d5Hxa9SK5nEWXz1rDFL1+UIg9TDcClZ7bh+OVH9KPcqhqJixMOb9HLP
         NB2LxHx09owRnc27c4dCpTx3XeN86V0X928nhRxyRtWTX9cVwbxxFEko7k2Gq36eY5ch
         UT92Dn97v8GfJ1m5SXoWvzd4tR8M/MN8l4xJW5+J7htEEP7vSyXpYcbBYzrpCxNTNu3T
         rkAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=puumqnRyy+PGoQeNJSBFInFW8kilwjgEZfgjatHik58=;
        fh=V5ysxJnGhGIShnJwKYLrxIp6Lmonx8FmhKX5CMAKBw4=;
        b=QSrme+AnZ5gMffDTmKQNLFJEhuwU99tPU0gCV4niIIEt8sWIY+0Lj8X260WNGwS238
         23qP5zuK86hodjyzCBHsiP38r2hG2iJSYgiVOEadDNauXgrSCnmwg56qUKRIfvTjV6pG
         7UnbNGDD+iDdjGpGjKoaGmvA4KcMqCIAITXYXsbYRSTqmN4JDYFJEBZojyPMF5koVo/f
         +QUhNxWxiVZvgfhgDzAqQ/grRg/c5FVOFeHJzPrEHP393jOubgraFWRL+eHkzMlNaf3u
         EPmDO2QnFmOV+G/mTLJGB8gXDuJnjOHz0BPa2fuD3xYkExG68lJAARKSIdW8Z4GQ6gxJ
         IE6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294272; x=1794899072; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puumqnRyy+PGoQeNJSBFInFW8kilwjgEZfgjatHik58=;
        b=H2axHf2OBHlWpUXKfnmiblLG8rhXeyet0C5pesY1lGmEXGlgbXUvrcTy1UjNckVNhx
         P67qFcIHbkfLh3Q1/XOn1ixd/kk+ONz6a5Mm3GuuzcujAkZeGUVI7943V7muX1cU2JW+
         ZiJpqUwnxkaEYX7WP1oapWm10MLQ7T+UdNf2VbfT+0aTUyGBabJd/CqA3kWTIAkzVehS
         9NhjsG6k4fixanPUdrl3XGfGTLKm/mETbgg1VDVTBR+rGOEPg1Y+c5/Vg6nEos5sWo1U
         5HT11wP/ONpoiWknQwdCU4Q9YU4AyDV6SQswTeKMGr2FXYJ4QNGP0ORzDNUJzcvda+a5
         KPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294272; x=1794899072;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=puumqnRyy+PGoQeNJSBFInFW8kilwjgEZfgjatHik58=;
        b=QqX8XMuWOz/I+oqBpSD140aiJgoFtqhRNgDBMfzbUPPwpHsChgn8alsg/hbGFAj8Fj
         8qcVxAAF6Dx/+6CZ5eNAFV6hORcVuNKFPRiSOYvoAn/4YBLTv4dZgasJu2K1x/0ikvZZ
         Kjob7Rxw5LbsTRPDMAVdVoH79AL8Xyx339ma1x8KEseV9TeRcQHgrrjHPAKZhA+Ac772
         Y+yIKyAaIX+O6zW53u3E9ezmH/N6dxkW/5us9T1FwotyxsmJ3r2SRTqOYV4vSvCUA3lL
         7uA7Yuw6wS8uKi+Dt9+XKXCayuSJm9iaZF01+4ZlXuTLwaam8KL1dX7/CuwyBdqEjZxv
         6KMg==
X-Forwarded-Encrypted: i=1; AL+hErGBUGp+nUROzy8aM+SewbrCuqvGPH0+InAGkekhVl6rQsgp/RVWFJpWzAdpYz6JnPWz54lk4knvblrxKg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9lKG36i30TMViVd051ZNB0+zqKvFivU9+E7b4W+T2DL9sYuz5i
	2CxUMsc5WuCSy2bPWL37miMkgqjZa8SCYDDCgB5Leubo0Lwzin8II2fmBjxLPJPdao+nuRLEHwC
	mUpGYjkn8KM+9bauPhfgyLHfiPvdfJU4=
X-Gm-Gg: AYBFou1OMRSjwJu3+GAz4O6cW5LcVJG6eMm8kiBjftp5Uq1wlP8sllVqLESgHhFQwy/
	BLvohUgrpbsfBIyEU4k+Atf1O+Txo1qTCM+L8jLw4l8FeDUBGHD2vDrGRNPJ8kNiTJ38YWeuWa5
	8YH+SNfnX0ocu1yp2DSURngeUPT8yHwfL5as3z+1fjY1UZT/7CtI59VDhcCK7wLh6SzZH9px5VR
	R0U4q9ex+IVzuHDcNPLxpv820vxR5MiejH55RhrPDoyi9vJeiMRawd33KIX/j1Xb54Y0RnWfN3F
	A6xuAIrEpe7cXLgdx72koubIC45VgVJwC/GhUn0tQKHWSs3mexyllWjRx7zfgUS5wlSq5llwMbz
	EcxLS6NRw4KskGEoUov+1W62tEs8MXBqv060=
X-Received: by 2002:a05:6402:239b:b0:6b7:1b62:48f5 with SMTP id
 4fb4d7f45d1cf-6b756afdd1emr945605a12.34.1794294271512; Mon, 09 Nov 2026
 23:04:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110061429.2036-1-linux.amoon@gmail.com> <DMRBWY2S42EN.1CNW1DNHJOKKD@linux.spacemit.com>
In-Reply-To: <DMRBWY2S42EN.1CNW1DNHJOKKD@linux.spacemit.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 10 Nov 2026 12:34:13 +0530
X-Gm-Features: AclHuK_QdgUZlVEI88uRaFYkO0SFBxHrM1OaI5F967fviYpCpm4NPd-mBXdjZBY
Message-ID: <CANAwSgRRYCjYfuW+RqpRzbWx+_Fee2xmqr-GdtWAHCsEFZF76A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] i2c: spacemit: Avoid sleeping during bus reset in
 atomic context
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, Alex Elder <elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_230433_858690_54E2E100 
X-CRM114-Status: GOOD (  12.90  )
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Troy,

On Tue, 10 Nov 2026 at 12:19, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
>
> On Tue Nov 10, 2026 at 6:14 AM GMT, Anand Moon wrote:
> > The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
> > to wait after triggering a bus reset request. However, this function can
> > be invoked during atomic I2C transfers (such as power-off or restart
> > handlers running in atomic notifier chains), where sleeping is illegal.
> >
> > Replace the sleep operation with the driver's internal helper,
> > spacemit_i2c_delay(), which conditionally uses udelay() when running in
> > an atomic context, avoiding "scheduling while atomic" bugs.
> >
> > Assisted-by: LLM
> Also, please drop this tag. The same applies to patch 2.
> See commit 1e035297ffda.
>
Ok once I get positive feedback on both patches, I will drop this tag
and resubmit.
> --
> Troy Mitchell
>
Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
