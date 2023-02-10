Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EAAC636CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 12:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwVHFGk0Ubm9fiyx3RLpNr0IYOlPITHF41ie9CW/31c=; b=4oK+iki2xu9taX
	+6GQz+o15jVlMyPy8IoVERbHLP6fjViFtmc0ufCKcD3T/t0OF9fNDQsRMlpIhwNUVB3vXDFGdEq9i
	5ue31Ug2o6b9qke5CMAcC928Woj0yaLJyPsk7NohYavU8mfQVojq3WmU5fXWYD2H921Krwusk3ci9
	yBLJTINcwpSzbi6J9JDvW7YgzeWdMMYK4MQtZ+ddnN6QO0eAQ2MAPo2ZZrZ48cpxJt2vKC0Dgz31C
	L7RlSpchfFuilEDLNU9ar9uLyVqDrmfYmFyiU593cnKOppuHWK1P33JnzgxMA9wjINuPz41BO1IZC
	JekjtxXlzVLe1pVwRq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQS6B-005bAd-GX; Fri, 10 Feb 2023 12:01:51 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQS61-005b4v-4P
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 12:01:42 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 139so4621603ybe.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Feb 2023 04:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1jwrQQNf1AnNFQoY1CSsZGZlA1OyRM3AQRwMVKGcGFE=;
        b=VzJJrY1czOnLI9zserZvykrCI4wQ1fcILGSc9Z8/fJIfT05M6hIIAQLvc9FQdyKLkI
         tvSsySFDam20WtD8cxWf1JdXg5Z3Z3fS0/qxL9Fkd/sARb/Xj8DPoHRqtWrYQpdHxlbw
         b7TuZb3tV/TQ4082VejWZYsD7EpVNggjx6Ic2WeqCXlN+ZAtfEnKwabrnmmdvQuT2EAI
         QjaAHaHuz01QtkFlynN6uBYdm+qOmRT/AYGI3/YTqqxoZWmkpraKFUxMUawa38Z5KzzE
         6qxAN7htjNkaVbPNe6YcJZCL8jSm5Afl595a2ZXxP5RWgqfqlWcT1sukaJURnbUZtsza
         ghJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jwrQQNf1AnNFQoY1CSsZGZlA1OyRM3AQRwMVKGcGFE=;
        b=lU0gLI5r3R86olzeV5vZV9sS42EUCJZ/wPFCfdf9mRyREYpcLO3vMM4vN8C99MDxBM
         wSww+5UImjQYfmiHjn87GunYc9GcPryoiWogRJqzkCLR52pD/AwE/g8QSHXsQZLt8elz
         buEq3DvRwNWdpBK+z3d+mt8NW/Y0u2q8Oe8fqgNlIXGqRWb6AUHNK+LZ+cviOqKbVG8D
         NQwJo3HJeQjwDTmoVY81i28pPdW0tVPpzZazkv1r0Cm7VTYz90gp7spitjhAgltp+24F
         URlxKJaRIabQAienylaiGM205EDa3q4sRpVHslBEnMniUZKFx7rrKnaZ/kH3P71nWmUL
         POfQ==
X-Gm-Message-State: AO0yUKUdKV+MFELF6192aPWnr18fS7yJ9h4jjNvj4pYKSah1uiMInVdc
	QEqF039qTXW4+axB8vO/VM/ycA3m7fdmLTZJw2wEFg==
X-Google-Smtp-Source: AK7set9qynGF/Sxd+zA/Vyt+YbgEjGY7FcWEXpsQ103JEwyyPC23370Zjfe5WzDNa+02nvNq74+n690DSsNrLEMYRbY=
X-Received: by 2002:a05:6902:4c5:b0:8c7:f1f7:35a2 with SMTP id
 v5-20020a05690204c500b008c7f1f735a2mr930408ybs.541.1676030498397; Fri, 10 Feb
 2023 04:01:38 -0800 (PST)
MIME-Version: 1.0
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-11-andy.chiu@sifive.com>
 <Y9MIr2iR5rzlIGKQ@spud> <CABgGipW_3tBbc3G91dqiAZCGeN-PbUvLS3n=bU0nWz0rRX9T8Q@mail.gmail.com>
 <36A0C855-5EA7-49B5-B92E-B28E684AC3D8@kernel.org>
In-Reply-To: <36A0C855-5EA7-49B5-B92E-B28E684AC3D8@kernel.org>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 10 Feb 2023 20:00:00 +0800
Message-ID: <CABgGipXMwnVPFY3D34zVQ1_MObYiYze-vvU23_yC12Q+xN+1ew@mail.gmail.com>
Subject: Re: [PATCH -next v13 10/19] riscv: Allocate user's vector context in
 the first-use trap
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>, 
	Li Zhengyu <lizhengyu3@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Changbin Du <changbin.du@intel.com>, Richard Henderson <richard.henderson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_040141_237618_449590BF 
X-CRM114-Status: UNSURE (   6.53  )
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

On Mon, Feb 6, 2023 at 9:40 PM Conor Dooley <conor@kernel.org> wrote:
> I suppose my question was "is it safe to warn and carry on, rather than disallow use of vector in this situation".
Yes, I think it is safe to warn and carry on. This is a check for
memory leak if future code did not allocate/free datap correctly.

Thanks,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
