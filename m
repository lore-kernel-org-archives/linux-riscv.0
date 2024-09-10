Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347ECEB64DE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jEApRMbAVY//46bl4DvDjN+b7T1HCMsK8folg/b3Fs=; b=hLK1CoxLLNm1GM
	H0Xd16opWWPtOL2bq5UJKci825uVR2Mo2ezveNNs32qAZPXpgP7aSPX7knTAZaFcaKo3HjzSgupQ7
	Rgb22mLUL1/mxH9AUoHQgzi3boICpLVDRcILz/5PioyOnttGmiFaB+9Ac8yiDo+BLkGQgxvry1YxI
	7I5xqzxVuy6PQNlCCQ/Sb6CkFZ4UNcIEznHadQP4rbnbD0r68531XxUxWMwqQR+meo7AkTivDfx8i
	AEUCAGfg6LP8Iby+tqbiFqESQOoh5Vouy9R4vjt3WHG5d5vCX7Ll2p4Ggb2pWEHuDygW0X1MDwC81
	gWVoPnBxydJvsGoEAd3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0TJ-00000005e7e-2vSv;
	Tue, 10 Sep 2024 12:59:53 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0RV-00000005dnf-3UD7;
	Tue, 10 Sep 2024 12:58:03 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-20688fbaeafso55575265ad.0;
        Tue, 10 Sep 2024 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725973080; x=1726577880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUS8mhUC58UDTChTn2sVU5TFkIV/hDV8RxXUMtAqKrM=;
        b=Ysruat2S2krpOsgHZVWvYbmFc9ubfCVUddHVbQQsHRHDAsFwwnsGSiK/abkClFDv6y
         XnlXo8lfaz7IcyQhFsV+Bcp9wMmyIpF5F0FqC16a+nF0TZYM+iuoKzZ2UAF3DCpMRqY+
         lgHAekEYxweWJyKz6BguT5PTx8bpJ0UW1ecp12IagAQoq6ne5M+MoyEn/XUggcLsrZ7C
         RVvgwOaUT6et9n/jAP2GJFF+UJ5uTPGuel/KJhOqVKyceqT/Z1Hd1NY0rVfbtigZ0psh
         6kzZByvE/C6xMdMKndmdfQKWfbSargflA9rCHBPqSCE0P1lgesIAEaZ2PtLyzGVYzdoe
         6Sug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725973080; x=1726577880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUS8mhUC58UDTChTn2sVU5TFkIV/hDV8RxXUMtAqKrM=;
        b=bPJcVI5TrrNTAFVvxPKCexFRvqthALl0L5x3+SM0c2WVeA0EW51APNLtTQccZJhh2j
         Fvj76l04HOPlhxlmo6hLdL6ZNKfC0gvD/eKfGaUlOIPjVHNXvEDmPnCSsnJHjjSmQ35h
         Izo5MsPR0P2vR28Ck8dZGPFa9cGinFxSF8YdENSsCY3mfJdrincIGQbTFR8mUGiD/mND
         52wwruJO1dlVqS92WV5d1vgc6/r2BVbFgcZ1b2TMUuz3PMN+vpX8COiD7bo06yl/d4xw
         UrgCws+8/8Iv56b92bTQtBB1EsdWxjMxVGzZrLOGL/A23QrBswc9sehWetY3CUL3NjoP
         irwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl9EQnW7uAi7Gc7E39t+iHsBuXSQ+1zWOTIcRGBDYkj5Sk95HcLIhr2qeQ6jd8feBOc/kEGmvDvA9MvdQ=@lists.infradead.org, AJvYcCW/iLTbDn3q/wL+/MU+m2CudB47LJgKNpKrF63ackqQQauB8VvIoxQkYqCJsC6XvLK2hgf0dlkrSJ6yEe4Q9kPnDg==@lists.infradead.org, AJvYcCWPxDzK8U6jzgG3++xGtxE8OBjsO7foYTO4Rq1MvGICf3hyJ7ZKMZ4G9XNvfvUpNBc9aq+T+zhFwDhb5oN18mt8@lists.infradead.org
X-Gm-Message-State: AOJu0YwG33NDA7Ev7k15Al/xI0ocjBVukP53h+qS/VKi+AZ1pngaOlFI
	cKQHIo+W5P8wwzkmE6eZKjW4b1ptTz7vXuTR8Hyew+jOKvOR8YKY
X-Google-Smtp-Source: AGHT+IFGOZoCTNJB6c6BA89kFJoOYl1hzlJ0q3P1FoFkG4+ZNZX+8ts0DZlupnsG6oCf2CltnXPNZQ==
X-Received: by 2002:a17:903:11d0:b0:205:5eaf:99e7 with SMTP id d9443c01a7336-2074c70eaa1mr8420315ad.38.1725973080350;
        Tue, 10 Sep 2024 05:58:00 -0700 (PDT)
Received: from localhost ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e10ee4sm48347315ad.12.2024.09.10.05.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:57:59 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
To: conor.dooley@microchip.com
Cc: anup@brainfault.org,
	aou@eecs.berkeley.edu,
	bcm-kernel-feedback-list@broadcom.com,
	chenhuacai@kernel.org,
	coelacanthushex@gmail.com,
	dalias@libc.org,
	florian.fainelli@broadcom.com,
	glaubitz@physik.fu-berlin.de,
	guoren@kernel.org,
	heinrich.schuchardt@canonical.com,
	jonathanh@nvidia.com,
	kernel@xen0n.name,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux@armlinux.org.uk,
	loongarch@lists.linux.dev,
	palmer@dabbelt.com,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	thierry.reding@gmail.com,
	tony@atomide.com,
	ysato@users.sourceforge.jp,
	Celeste Liu <CoelacanthusHex@gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
Date: Tue, 10 Sep 2024 20:57:30 +0800
Message-ID: <20240910125729.480594-2-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909-arguable-detection-02445bd1cc89@wendy>
References: <20240909-arguable-detection-02445bd1cc89@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2887; i=CoelacanthusHex@gmail.com; h=from:subject; bh=6nGHo0lCtESeld3ret04gh/vnDvSoID5OBGgjnB5oXg=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaQ+cLLeU3+q4sXJjayZnHpd9X/KFC6qHNZ0WLPp3p vaYSqSFeVhHKQuDGBeDrJgii9jOp6+XlT76sIzXZAbMHFYmkCEMXJwCMBGpo4wMCzdbR819rrNh F0PLsqgLuV+EkvbEW2QueDjP0ZO7L/PWcUaGJvErL110T2cvKbabdudw3cITiU0XTzhYze07spC xyuEoLwAho0yn
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_055801_913961_1F3EA2EB 
X-CRM114-Status: GOOD (  25.67  )
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

On 2024-09-09 20:16, Conor Dooley wrote:
> On Mon, Sep 09, 2024 at 08:14:16PM +0800, Celeste Liu wrote:
> > On 2024-09-09 19:53, Conor Dooley wrote:
> > 
> > > On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:
> > >> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
> > >> introduced it because of Docker, but Docker has removed this requirement
> > >> since [1] (2023-04-19).
> > >>
> > >> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
> > >> needs an RT budget assigned, otherwise the processes in it will not be able to
> > >> get RT at all. The problem with RT group scheduling is that it requires the
> > >> budget assigned but there's no way we could assign a default budget, since the
> > >> values to assign are both upper and lower time limits, are absolute, and need to
> > >> be sum up to < 1 for each individal cgroup. That means we cannot really come up
> > >> with values that would work by default in the general case.[2]
> > >>
> > >> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
> > >> can only be enabled when all RT processes are in the root cgroup. But it will
> > >> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
> > >>
> > >> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
> > >> support it.[3]
> > >>
> > >> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
> > >> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
> > >> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
> > >>
> > >> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
> > > 
> > > I don't think this fixes tag is suitable, the commit you cite in
> > > moby/docker is a year younger than the one in the fixes tag, so it was
> > > correct at the time it was written. I think the fixes tag should just be
> > > removed, since that commit was not wrong. Or am I missing something?
> > 
> > The Docker commit I cited introduce the fix, not the bug. So it should be later
> > than commit in fixes tag, otherwise Heinrich Schuchardt won't pick the wrong
> > config from upstream.
> > 
> > Timeline is:
> > 1) 2015-06-19 Qiang Huang introduce RT_GROUP_SCHED check in Docker.[1]
> > 2) 2022-06-08 Heinrich Schuchardt pick this to defconfig in commit
> >               in fixes tag.
> > 3) 2023-04-19 Florian Schmaus remove this requirement from Docker in
> >               commit I cited.
> 
> Yes, this is the way I understood things to be. IOW, when Heinrich wrote
> ba6cfef057e1 ("riscv: enable Docker requirements in defconfig"), it was
> a requirement for docker. The requirement later being removed doesn't
> make his patch incorrect, which is why I don't think this is a fix.

v3 has been sent.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
