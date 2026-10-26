Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAA2606A322
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 05:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IEzaUoJH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZutRtVBl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ABWTixUkYcv/0DltdEfneasZ/yGi4kSBBN+B9d/yGK0=; b=IEzaUoJHREwrrfi01Uqa08x6Yn
	k24Q+tkPexBKoSQ2Qi+fGxDCzyuNzQ9SqFvFzQ/kjHL/JrWLw/UQHDsdv/hXvJRAm4ixeLlv0HO1A
	B+cxb4zuiDB+mqDxxxD7SqILuk1We9Fv3w/duDRfpKDcwnGjRAvNchJMQ12M+isvF+BHZxlc6gSiw
	YT24El1kxj2RVABu0o2eVSh+wOiDsSKbxWhdsSD2a52iJT5B+43yotQT7jx2pn+YnWPAYv95RZ/E9
	FL07cxmtQv7IwbNzCDnzsGJ0xDymPbN1MJHBbYW3Yz1IFCSkQUaf7DZNjEPE+FgmXiDd5xRHQ7yC3
	ob6bpDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDQ9-00000001juE-3iIX;
	Mon, 26 Oct 2026 05:38:57 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDQ7-00000001jtt-0r0Z
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 05:38:56 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso3958006a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 Oct 2026 22:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792993133; cv=none;
        d=google.com; s=arc-20260327;
        b=l1CYPoH8CB6kURm0TP85WkditvjRXzI0HL9Ttjgz0J+5q2su8D3/5UFKHmbLs/e5EJ
         Vkmf4QOdiR89h8jQup5dwEgKLO+CuWSf6Aral+p5MJCwXLY7Bmzw3e5TZuIJdAqm/Zfi
         Be55UvSmTJSoTqSXxUpHotNmsLKvWiVr071kFsSRFGsGxZL/MtplUW/x63Z/KMf0PfP7
         0QV9Oui7wSbBv/x2R9CWP+oyrNSKyIkZteYR9hj2H4CfE2nwwSFa1hEVJEkEZZ5B/JN8
         dntgyhihwCqIQt1u1e7l5WIinXS35JeGjTlJcO6Xvig0eyD/+Pz7cyYgpq/6/D+BPUQe
         NpdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
        fh=blyT5XY84ffCLv9OV2FhBxopUuSnLRsazIfZclH7UeY=;
        b=TB2fRlfeTaZEoCqKUXjOv9zWUaUXjyJ8ZZmua+rCuwHuJXeZpxj2niLgXmk4jF3FFo
         ueVUTX0TfBkpReTw3xR9uuoEWfoF7ePrlE3wlHVjpVBBZzjZEcKkrI/cRq888Ja12PUo
         mHitRbSJuUSb+WmT7hnJ+ZQlXmDzNOEyVsfyUAsFc+DnpeLiNBCJhDcD8JRS+dN48KXN
         iGh1GWtaj3vWM8kfjQyCIPyG3Vkpk/uQPE4lW4I+a5u64Tt/Gj2eu8ZL3RYUFzaDkATm
         5m5R/I0sZ+hm6Whknvf5WqHjcwxDx71qJIC2qRP27rMDge3rwhQ95IRGYCzqEZ30bqW5
         8i9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993133; x=1793597933; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
        b=ZutRtVBl7v5tYAxT2/BVShXjUIWr1917jRXblWiEc7hDw8TamawodPZci+XJySipv2
         a/83gOlQSMR+1sV8933su5ANvTCEE5FN1S4wHcaFVwk3S9sElLGmpPq4vAVb13MS2Hqf
         s3ZbzibXyV3iHQ7TSFDz0aN3tuAlybZWTlNaeJIHwtSa8ckoMkJxP77xVZnwUO6fR3un
         qwdIpFtBwYZihzCJjn/ZUIiKUxz97u2qn7dbZrOvsHfPEaHOoNCJEc/DYNtYfupgdr1X
         Y57esK9UG1LA35/zQ/osmEqDJbU1nFq05Gpl7mjvPnxBxvJr+j0yWVs8YwZqrbLo1Wfq
         YjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993133; x=1793597933;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
        b=WCbSCkuL/aCgz7mwBldidCPnz0wsrBDpoTefIuhnpbFFy3flEZ1LADDs/1j7XIDaTt
         7SkQxa5wW3dIb3GSngvm43NhOxu9IUbVO+DeCuH5b0HIPyrHCIwgYPyHphdBb09yHMZ9
         GzRKrwErLfsbVWk8gr1OHqxnylwe+0wRawfrk4lWPJ0pwz/VnAROrIx2XLbswZIMRgkx
         ipDjATjkb7S1uzo/CuprYmstxh3f4cSWxUl9aFwmq+lHpRXW/hnRr4VT4WJmp3cBR/Oj
         qF32zWkq/fJDPj19RbptBUxmxE+6RNiobPeLTH3oHiyBmA0xrzF4xAfZh2kQVEy2DMRN
         6KBw==
X-Forwarded-Encrypted: i=1; AKwUvByip2PcsXgA+tFJKXr7mV4/tzho43Z7oQq9QLK/Q78bB4zFSDAOZ90PxQr57XnA8O+BQZ4TDVtK9VNatg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIOl9TzyLnCRnjNfNeT8oo3OnEiqgaWQjX40ofrarxDLuanqOP/
	fDdr9F8OhmncS+ON293qLpSw8qgYeAkB4epg8DEmlr6dRzYZMRJ+ZVcOChYwhpK3nGbuN5JLJww
	bpvwUVALvmPB0I0vBrQMkv8bFKF5DQcs=
X-Gm-Gg: AYBFou0KfvBMbsm/YEP3ys+dE+Q5BFzHwWg6dgm6phrI2geK/I+hFS3aH6j0a2cayFZ
	VmyKgrXdb4jAstJrRliB+B6/K4lTL0nR54hXQI1L8GBwE+FaqzWcQ31Vz3sRcNEBWfPYZhcS6ag
	kOB4BDfeymrAExAaPfeGaxrlk76BY6+aHadmxy93JlzueW5lnRrdeknp2h2qyeBpqQKnYXnAMyK
	mlLEQCQZbTDDjb+yJBJ5wOtujXfgFoquDPAPJLzQPC9jpOzcoTGCn2WOL5YzyZQod1XtetgHpqI
	iFZ7EUMe04TyCvZZp5gh6/8wKwXXDktKxVpBMxslryNATXKFr26uuZ+EAJQXJ2QQhFg4n1331xP
	5wtKh3vcSyfeWSVH1Hxr8ivy6Vo3YlLtzekE=
X-Received: by 2002:a05:6402:5630:b0:6aa:1112:62f2 with SMTP id
 4fb4d7f45d1cf-6b442fcb0b1mr5488509a12.15.1792993133095; Sun, 25 Oct 2026
 22:38:53 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
 <20261024092558.143621-2-alan.tseng.cs@gmail.com> <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
 <20261025130206.187282-1-alan.tseng.cs@gmail.com>
In-Reply-To: <20261025130206.187282-1-alan.tseng.cs@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 26 Oct 2026 11:08:36 +0530
X-Gm-Features: AclHuK9RjSFEksyS7-_jnVXSvRIxT2GkoKRYV9Xd_PqlQ07C_F6NfX7RJdwzzV4
Message-ID: <CANAwSgTiSiEfdLD7yUwcbFnXfRpnSNZu_GXLnQnXipc+ansnPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC
 nodes bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: dlan@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	e@freeshell.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_223855_294421_94A53D66 
X-CRM114-Status: GOOD (  32.52  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Hung-Chun,

On Sun, 25 Oct 2026 at 18:32, Hung-Chun Tseng <alan.tseng.cs@gmail.com> wrote:
>
> Hi Anand,
>
> On Sun, 25 Oct 2026 at 18:43, Anand Moon <linux.amoon@gmail.com> wrote:
> > Could you update the pinctrl and GPIO configurations, including all
> > necessary pin
> > assignments, to bring up the SD card, PCIe, and Ethernet nodes?
> >
> > Please ensure that the required bootph-pre-ram properties are applied
> > to the relevant
> > pinctrl, GPIO, and other dependent nodes wherever necessary for SD card boot and
> > SPL initialization.
>
> I'd like to keep this series to what is needed before DRAM is up.
> PCIe and Ethernet are not used in that phase, and their pinctrl-0
> entries are already in the board files.
>
> For the boot media, the BootROM has already set up the pins of the
> device it loaded the SPL from. U-Boot's spacemit_k1_defconfig does
> not enable SPL_PINCTRL or SPL_GPIO either, so the tags would have no
> user today. SD boot on a Milk-V Jupiter works without them.
>
It is partially working, but the current approach is not ideal.
I have made some driver and configuration changes to get it working on
my Banana Pi BPI-F3.

The main issue is that SPL_PINCTRL and SPL_GPIO support are required
for board bring-up,
but these options are currently missing from the U-Boot configuration.

Here is my u-boot logs with some debug prints.

[1] https://gist.github.com/moonlinux/a491bf56bfa914e4bf5f661635eefe9c

> E also asked on the cover letter to keep the BootROM part and the DRAM
> part apart, so I'd rather not widen it.
>
> > Additionally, could you update the regulator-name properties for
> > vdd_core, vdd_1v8,
> > and vdd_1v8_mmc?  On all the boards, the SPL code requires these regulator names
> > to locate and enable the corresponding regulators during early boot.
>
> These names come from the U-Boot SPL code, not from the board
> schematics, and U-Boot already sets them in
> arch/riscv/dts/k1-bananapi-f3-u-boot.dtsi and k1-musepi-pro-u-boot.dtsi.
> I think that is the right place for them.
>
I have made some changes while integrating this patch series into U-Boot.
I am following the approach used in configs/starfive_visionfive2_defconfig
to keep arch/riscv/dts/spacemit-k1-u-boot.dtsi as minimal and generic
as possible,
focusing only on the essential SPL bring-up requirements.

> > I am verifying the changes against the existing U-Boot board device
> > tree and configuration to ensure
> > that SD card, eMMC, PCIe, and Ethernet initialization work correctly.
>
> Thanks for testing. Please let me know how it goes.

The goal is to move most board bring-up configuration into the
upstream device tree,
allowing each board to enable its peripherals using the existing
upstream configuration.
Once this patch series is merged into U-Boot's dts/upstream/, we can
keep the board-specific
configuration minimal, avoid duplication, and reduce the maintenance burden.

>
> Thanks,
> Hung-Chun

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
