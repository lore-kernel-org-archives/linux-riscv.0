Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A14C9830C
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 00:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgrqAwhjaHBonKZMYKzAXV/0gFhA68UEIRmgX8rimVg=; b=oBzNJ7jZAtddU+
	meT5diw0z0J1bJRdcpYXJFG1xcurKcdF9+4LwrvhFykrIN9+fkwz+APJjkCNL99DmizUgQRkUpQKo
	uFaC8i9iWxOVpc+oDl5sO8NtBcxpBFqs1my1Av4o5aWHrbVDqw0g8I+xrvwCMa0PCVpZt3PZf7Blt
	9akMi6gVgKPOnu41uwVIZlzscLlO3+8Af7/Uqf7JazUhvgyqMtdGQznF/MSo2/r1xBrnSeoRg/SpJ
	5ERQSR0de2FS9eC7CFO8gLvexnSUbgIlTKxwGWTsL77kX/ZigNCKA5TMd4DiUGh10+JJJvlfh8no7
	+1MZ09wDD86dpS02Pn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vguBn-0000000F3Jc-3Y82;
	Sat, 17 Jan 2026 00:29:15 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vguBl-0000000F3JH-1Lgx
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 00:29:14 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1233b172f02so3229924c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 16:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609752; x=1769214552; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mGO1cK4mQ9XzEnYxq1fxs9vwo2P1CEDeSbovMGFFZdo=;
        b=lDa5zoZgXtt8eN1HijWmpVKi1RE9h8wQ8zt2gg98Y/nFMukcJXR1LvkuAZ7gE6kO7n
         lLPkVVDZM9T+s2A51ntaYPRn0YWpQ3aLeNXY4d/fnYRhIiuub8670FX5aUH9zL4YbVzx
         4OeGaUZvHX9bFsSvfAMyRRqw6TWhFycvrr5Ap3L1aD1XSjPqETM4sQn48t0SOng76kQd
         68SM2O8vi0m2wr739C0Ln25tMjbjf64bpAQ06Ir57W4AwhpSaF2UEoiVbJGBu4nxkkBm
         Uxkw9DyRrKD2g2AG1dyTurFBYEK4NIuhy+KywO52cR59PMwPLpJKrWgAhNeQqKrtwZ92
         Gd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609752; x=1769214552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mGO1cK4mQ9XzEnYxq1fxs9vwo2P1CEDeSbovMGFFZdo=;
        b=q8240QrEa+H1tfPbqyaAhwlxiG5YJ7hEef6CIEkHPfGeMHv2IMruiq1KVQP3HKTLZJ
         M87NmI7nwMWTwvpHd8+2L4EFymkKfGl6ukUUQ9gcsaqj2wVzwvUzVNewhVWxPadntayl
         tAhE8fxbHdNe3ZBLIKbY84UMucRPW+s8U51iKkCmQ3+uBrpOfeYUS+HWrSUj+LDY6lrR
         v/CvW2rutz84uH/LY2RKhBth8PstIVJR0vy1tcProDnk0ppw58Vc/4TGd6HA548c14OD
         ss1b5eKoJPNHDIU7tUUNyn8rgVANK3o0i6ZY0B8qdVcYCyTdvBKd/GHz2Mv43G50Fner
         Ouvg==
X-Forwarded-Encrypted: i=1; AJvYcCVr78hD95wUi8OBLeB7DKE0keRJG4XOtS8hznkBtIToX8q8QNdpFcO9qBUnHMvXBkHz3VGckzuhclZBDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHmWjQyZAAlxWkyGx11jH04NV/7+axkOq4JA50Dhc5gXLAvXi+
	hNRNlwOmsIidTp9l1y+Z9NKoWSW0VMa+f7xCVW+GkCkkzDPRgBpU1u7Q
X-Gm-Gg: AY/fxX4/KoX93zPRW+Y3hyJr3L8uWlFM4bO46EdQKpIKNOeJ5pEoTGDR6UXYvuu4zNx
	YDhZnjjjOLYfsjuk52QzlUr4VmF8OKvCoiCl+dZQ3PXhQUOOpvSWoZyPomC/SbtmjKMvUd61N9i
	O/2+XjOWmcoYFWYI+j3v/glxb70gfvN8fMRz+KmdWT+oTqo/VwnVCBkGgu5bDKETuCskHHxLcVm
	scMwn8nUBs6SGmz1E5jO2JF3TSNdxm1FrZ52iIh7Gc22KlGRf1niUxUsKo5Pc5hQzo9txi0ha2t
	vJ1rq1CDFtq1DQSWZBw8lSTRE8+9uM0PhfQP+J5KLU28SQU0uKyVMQ68vDed+V3UPeMxaJyEu/z
	ksldAgeRcj9IBIgZ5pBSVSfOfMuJnEaEvYKvTgye/dWfcYaLYc+0cFnlaJBGyx8eV2M0kOkMEj6
	AAldK0YASiXg==
X-Received: by 2002:a05:7022:4181:b0:11b:2138:4758 with SMTP id a92af1059eb24-1244a6f4633mr4974776c88.21.1768609752297;
        Fri, 16 Jan 2026 16:29:12 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac58140sm4235676c88.4.2026.01.16.16.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:29:11 -0800 (PST)
Date: Sat, 17 Jan 2026 08:29:06 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/8] ASoC: sophgo: add CV1800 AIAO mux and I2S support
Message-ID: <aWrXr1aXB3YUPisg@inochi.infowork>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
 <aWl4fvKsUZDg9dwj@inochi.infowork>
 <aWpyLQ6FR8_RsD1n@anton.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWpyLQ6FR8_RsD1n@anton.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_162913_362189_94B1477B 
X-CRM114-Status: GOOD (  24.22  )
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

On Fri, Jan 16, 2026 at 09:25:51PM +0400, Anton D. Stavinskii wrote:
> > On Thu, Jan 15, 2026 at 11:17:37PM +0400, Anton D. Stavinskii wrote:
> > > This patch series adds basic audio support for Sophgo CV1800B, 
> > > as used on boards such as the Milk-V Duo. 
> > > The series introduces an AIAO audio mux driver, 
> > > an I2S controller driver, corresponding DT bindings, 
> > > and DTS updates to wire the components together.
> > > 
> > 
> > I haven't see your mux driver, is it missed?
> 
> That was bad copy paste from original version. 
> Thanks for noticing this. Will update the cover letter.
> I want to not overcomplicate already big patch series.
> So multiplexing will be done later. 
> > 
> 
> > Thanks for your patch, for all the patchs, I hope you write a
> > meaningful comment for the patch, at least for now I found it
> > is nothing in your comment.
> 
> Thank you for a great help with that series. Do you mean
> I need to add more meaningful comments for each commit or the 
> cover letter is not describing everything clear enough? 
> Anyway will do my best in the second version. 

For each commit, the cover letter is OK.

Regards,
Inochi

> > 
> > Also, the patch 8 should not in this patch and should be a
> > separate patch.
> 
> Yes I've missed this thing. I will remove the last commit 
> and move codecs nodes to the base dtsi file. 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
