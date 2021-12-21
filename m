Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFD3C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 18:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqOCyAhtEFGRy4AN222m0nvwKiXl4CdBjmie6yV6aYA=; b=2L87iC4kufQlow
	S18d1net+QIoviGvHAvMMWN6FSv9araifprm2/rNqyU0YHrACel30ke9+gBjpI/V4t7iSMFojeG0a
	EqYaOYaXHSPd4H9TUclITect+qoO0VJ2AySa7cAHBKHZcIloZlAGDI3Fn9hKrQbdYh4nhRGQDgqut
	6xfzpOxXOoT1ss6GqhKAMOjZ/sdjlXGM4+23KA7RSNRdv8q5a0skc2B4T+DLf7dG359KMl4t9W6v+
	l1HbHoX7Ltel7j+/xbaHK489YzMA3MByb5znwQjvf/O/e+zsSYWRQaGj3EMQ8wlY8MV63NUvxhzS3
	M5gV29XFV41tnaVt1jIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzjod-0085KD-Kf; Tue, 21 Dec 2021 18:24:47 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzjoY-0085HY-PH
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 18:24:44 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MiuGK-1mWAEG1b08-00eqou for <linux-riscv@lists.infradead.org>; Tue, 21 Dec
 2021 19:24:40 +0100
Received: by mail-wm1-f45.google.com with SMTP id c66so5943953wma.5
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 10:24:40 -0800 (PST)
X-Gm-Message-State: AOAM532coz/cXtbxd7vVf2nswo1LrhhhfHHWiN8PKV+tMLr9qAvpPpqM
 QyaaRqDPuIjtWOPu5lnI5puHpaLYl1h9jvCx2eY=
X-Google-Smtp-Source: ABdhPJw3TJbiACgmivSiGV6Ovdpm/sI3dlEmQg3biddqmxGYHcWMbTvf71OOdSqw57SexlZ7eGP2xjVH+Fbbqj6aNz4=
X-Received: by 2002:a1c:8013:: with SMTP id b19mr3508436wmd.35.1640107277923; 
 Tue, 21 Dec 2021 09:21:17 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-9-guoren@kernel.org>
In-Reply-To: <20211221163532.2636028-9-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Dec 2021 18:21:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0-ZOwoC_Ft+TiKAXdETcqU5XPS+9DZGkA+bB73SNCCbQ@mail.gmail.com>
Message-ID: <CAK8P3a0-ZOwoC_Ft+TiKAXdETcqU5XPS+9DZGkA+bB73SNCCbQ@mail.gmail.com>
Subject: Re: [PATCH 08/13] riscv: compat: Add COMPAT Kbuild skeletal support
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, 
 Drew Fustini <drew@beagleboard.org>, wangjunqiang@iscas.ac.cn, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:YE9ZHPrbG/8np46Cd8ALKHEVIUKer/c/TFCZ4G3qM5MgSgN4PYO
 JZnTF3VrTgQy8dlL+2JcmSZTM2A3f2xAnISFIOyNaYpz+KIebZHS0IogwbV1ykXDdG0wK2x
 dGQG+8aE2UPSfByaUN+CQtHQtSGun8m63zRDO8A7WI6jkyeNB/E0DBEcK77cNQ5A21QguzJ
 uq1sdP+0kqtX+tlu/UPdA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cMJtYaeQ9RI=:1OrctlYzOwNVe+Gv4NEFzf
 JcpsLV6r1z+DkW2nSAUHwggVkpMaIDtMVMVdXJfsBQQufBuJDpCsvM7ygqKv3PfDtB+KsQ0zH
 x8BlM/zI6vGy2IxvQPIpAG95+Y++Uol6WltwBK4RrdQcTwtEH8KZlm8OpzQW2jFn9Qo1eLT1M
 1CPLY08Vl7x5TRGALHiMpkrws/A+aC1Flil4rCWNeaGa9tUY2nlDqXRzrwjPRiSaYF7Ax9ex2
 1ZuSlWM7cZgO4TdklE32T7Q44QoAJxzLvUtP2g85YkLjpixVKv74bQEw9sHnsACsENI9iuWGL
 Py9nimyDk6SedTSstMpJZ3hLuK+uqPoufvcH7umUPbNTmTR2Maoo/VFD+jXsg521YjXAIek1v
 9qL1SZyPrdLPbcevnDaXmpdwANouXQUJsl3VAm6YgHVP1kNbZcQBrqMJdpKzf452l1HH3fxI7
 sAIq8DDvxbchLCeZJvrp6WUqVYkiwijTa3PFYWKDXCD1xf5mqf/XA8JtpBrpFZgZTRGftbp2f
 IUSBpea039x6zL2rOZ+xhUXd8/Bu3O65dJWIW6TW9rjS8L2hdMcU2QYDWIvcpAEqT1xleoxCX
 NHCqXU3Blu1NgtvZtLOXPyeOfuKhTBiAT3LHV2QeunSKLjbkl1w71+NmmSvlixlXd3c7j6Hr4
 TTC2m1QxrWoN3aNFjCdt/CRxxFw5GtM0S7Khudbmp4adiAv4/MX/aIt0I9bOSgH56lbbDtrtR
 3o81wEkPHXVzdjeSMlJXOIT2OwxxkJvrBBIYtfFcT7oFPhgktw12G1GE6nBXWFIIsqKZmp8C+
 /V7w68+e3y77cx0wsYicOksCUDxb84atKbLmBB6CflU6tm9/HU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_102443_171832_668958E6 
X-CRM114-Status: GOOD (  12.03  )
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

On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> +
> +config SYSVIPC_COMPAT
> +       def_bool y
> +       depends on COMPAT && SYSVIPC

Can this be moved to init/Kconfig next to SYSVIPC?

> +
> +COMPAT_SYSCALL_DEFINE0(rt_sigreturn)
> +{
> +       return 0;
> +}

This confused me a bit while reviewing, would it make sense to reorder the
patches to add the three missing functions first instead of adding the
dummy and then replacing it?


        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
