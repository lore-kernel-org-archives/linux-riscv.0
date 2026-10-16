Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B41DCCF2C1
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 21:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vStuWXbZeFbc9ZonSS6voN2ay9C5YCh+NoUWulD3px8=; b=PzvMACAEYb1OfT
	M6y4inWj+ljS1DALel7Ik7A0VBtFRM0oub5ImSPe1NGO4tgAkvqe80Bx7DwscZ393sRp/minbxs5o
	zu3Zx7lh2kpIYWTwGxx8V4O4xQYFLu3j2qYTGcYBMPoYXFXTBj1qtiByKilx9sJYPU89stgA8ls+M
	bDmAMAQNTA4Fe2YCZNWvPxw6CA8nowz6CJOgA6iaD0omF/cDi9kmUEI3y5OtPiGPI3fzm8/CMB58M
	+o7I1O7R6exOPglcoeQjrqUqjrZ58CRj2g3cvQ7xr/b5MtCsYCbJ9MlkattDXCL582leMWPgr3As2
	x2F4NxSo9ibzed3j7QQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpmk-000000047mC-34Ph;
	Fri, 16 Oct 2026 21:48:18 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpmf-000000047lo-44MS
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 21:48:16 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-67489c8202cso416741d50.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 14:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792187293; x=1792792093; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XD17O/u/CjQvCNQRijMjX8N5qylFRWghJEmACCuaaIQ=;
        b=EpRdu3Dfgz/MsTko7/G+SDzCvShfuFVAPL0Cj4axpurH8gBthPFhkTTAPG/Tx5bnQa
         5slIhOTHIYKza8Pb8cOJCRBbuuSt8aDISXRcOa1qjCK3P3fCfGm7/CmS8xYnxKPmabIk
         2YUuuoHuAaCiaomiBS8o1iPxCxDesaWHhwPosHc29XJFaN69+jN0iK4IaNcAeO3D0Hfh
         S+C7tYQHvLk7boLkilYU3UbwOaKeJqOWlfEtzpiMFTaRQHlRhvh3OmzlToRT5w0q/9RW
         EAjJmK/JT0m4IHwFpRxEMEF0YNE44/dU69BJGuEP5yqovaYZ+f1TBRKI9x38icimLE6y
         8d/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792187293; x=1792792093;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XD17O/u/CjQvCNQRijMjX8N5qylFRWghJEmACCuaaIQ=;
        b=nPHAuUQ7y6mTz1xQLRoJvdSnriDQkPCb6nb8WkK/mEYzmnMoWRkYkswEJPNsJEc+m/
         oi25V6TJPjzqrvzWRQqkOSlWFivc4I57B2hzCcFs5fkv2wrY3zIWCQlxYjC1P0Djqw4c
         oBuIPR/WVpM474HsXoRJzFBPVrsrAt1c6CcHO570lhixUfmvj1pgUpaqYhYyAoiH88KN
         FbtqIRHQwupioN92GrdDGYpAejneGxELT6Ov5xGBDXmNJ6mD1HER8122RBOGFSxa4eAk
         5rI/qZAcKqJ74Z/FwF4MEpMen/vM7Is7D9SUER9t1+E0rqGpXeGNxiFPxdytjxmtClDV
         MkQw==
X-Gm-Message-State: AFq9FYLSeuaVZUHv3+2jK1IXuuDbh0vI0vCyqgHQm2igsnuPpjl2PTdW
	/zhnAIKzoVgi6u2uLmGcZYJXO9wTGvzI/JRsQbyJUa7FAW+8byLcr3tqVC/VULQojiU=
X-Gm-Gg: AYBFou3xbwEVmL/XDjxu7C4K8PZblpAtx+Kxu0hmNNWjFWWSpapcaF1PBUioj3mI+7u
	KOzDrT32tOXYIwFYF3HnGdedo74XgdryZg+Tx6nzhBlgQI3TeWCmDLzUMfNaIUuadoKTppPFEi3
	9qhHvBPoGVKrQUwhN3TwVIpOJrrw7hp6dbY/om0wfM9L89peGlWnLvt1i9ao0VqSWkoGyNWJxye
	aErgqHObnpgn+1jwvXNyahdl2npO7ay3bjp3psSzkAfl+vrKWMEOZYBQZx8k1ibCDR3Ubi5mSI+
	XdnYVJOqEdVBB7+gI9Ifp5CpfSnK17qPj0ZN6wdTAOBepYFybgq47qTZgwGuAHW4rizjRAdo7X/
	yeJiIyRGsZHGxJpi9DT1XoeND39sjCex6/WxxwSPcAhdJ2G0gZLaTntq1+GXOlIVWTBg9owySMc
	/pO5uz7vTt00cuc7U6j18vW7o1A8vxm5vqUShzpmf9PvguxV+5Lz+cgYXwn5xxmIGNHaiPYj93m
	+DO80SkyNi8ISpI2YgB
X-Received: by 2002:a53:d016:0:b0:66f:c1be:a66b with SMTP id 956f58d0204a3-679ca8da988mr177910d50.93.1792187292686;
        Fri, 16 Oct 2026 14:48:12 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1ed7cc0sm1598282d50.15.2026.10.16.14.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:48:12 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:48:11 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 5/6] riscv: hwprobe: Report XTheadVector only when
 available
Message-ID: <atKbm-EG7wCL0bpo@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_144814_037848_FF108479 
X-CRM114-Status: UNSURE (   8.34  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 06, 2026 at 09:53:02AM +0200, Radim Krcm=E1r wrote:
> User-mode use of XTheadVector requires non-Off sstatus.VS, which we set
> only when has_xtheadvector() (CONFIG_RISCV_ISA_XTHEADVECTOR and
> XTheadVector on all harts).  XTheadVector also bundles operations with
> floating state, which additionally requires non-Off sstatus.FS and hence
> has_fpu().  hwprobe reports XTheadVector from the per-hart vendor ISA
> bitmaps alone, so it can advertise an extension that is always disabled
> in user-mode.
> =

> Report correct environment to user-mode.
> =

> Fixes: a5ea53da65c5 ("riscv: hwprobe: Add thead vendor extension probing")
> Signed-off-by: Radim Krcm=E1r <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
