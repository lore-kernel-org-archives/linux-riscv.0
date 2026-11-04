Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BDF606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bt/TXosK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erOCVOlR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r6aIo29hODxsyp4EHoMZk0NPth+n9KArXMA3EOymIrI=; b=bt/TXosKLGmeZ1qrEMJBrpZQEh
	ULDAWuc5K4mzhJx0vUMVEi9xDLUKtNfs2VrMonY92dKJluO4V45Kyi1HlXwxdWN0O0Zd2FmtLnXE/
	22Pp5Ek00vwEMhmJcYKVqgwZFszj2Ui/LQrtkSw15//Iuz10R7GbLCSV3dY0iKXrBotDanw5zr6C2
	YouL2x053xyMzgqowrTbhg9q4CXmQm9aQ8DCZFPAk1p76CpZkxwfd3OoLPOAgA/TcRagkKEJBpUiy
	RnaM0Qw+QvvcZe5OAKxcwwyTcColx1WlQ5ne5hfy/SZez9HnZ7i2vLlMnI7qF2yXdb0yshC4rJci7
	7b9rXsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObXf-00000005XJd-1cEI;
	Wed, 04 Nov 2026 14:00:43 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObXb-00000005XIU-2yIF
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 14:00:41 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so721212c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 06:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800838; x=1794405638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=erOCVOlRqI6SbR9bHLstET/4xb5qL6zX7m63IT7wpu3Wm19kYJY8z0L/4yB0X6gnvN
         7LjETc7gRo4pC19sCiwGaZ4SJGz+WlDmW+A1iUGlTf0zkin7kllksfVDSyYUdhn2DQ5J
         X8lETPRUlJGRaP/gsApLJtU2del3t0dD02ygNz3qvXNeBWcTpNFrSBj6YhVU7Q665ib8
         MSvpN864QsuI5pXDHHua+mMgUFDTDEBASSAS2+M0HKxDOaMZ7aQ1I0DG8tCSNCjOi6zJ
         dRmKeXshZD41FZtopNuYgZ4KTfNh7Z1EptDXpvGZ60GptSFgewvZTzsikQRlRZX3gH6E
         nrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800838; x=1794405638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=tdQAUdyRwmSDrNU31D/36xNu8Edo+9ycKmivyZY8/YKh99gQDOt+DYn8TN8PS4KXvI
         0KiPj+qLOo/ns/psn+Z3LXb5HfUS5IKO5hcyvBRBmjwR13jO+sbRbSuUE2quVlLQv1Nm
         s+bWRaYrFk7rVcbQeMaEaUCe9Av4y0mSPmlElJkNmI55p1x0N72lKM6QwWnLo0Wq722G
         SA0tF1toy3nyhXYdsbywHDbYJ6XP5et/G+oEAORacWYzSMBB9v5i36clAvGMeen0S0On
         eGrJ930j8H+aovk3MLC3gBurgHANs7NUvkhH2M6c9Du6BEh4bEiifvs97KW9nhaRLPkT
         MhAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzycm5JVSddXaq7r7ZXAlJT0KUNAIZswWaieatIRtttswRVSeJTGZCAQ7R77LtM8JgmI3T69xsaySy61Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/UZPlkyE/pI1C4OojP/KoAZlnCN39lnHofx4u+BZpYW4LiZchr
	DXju3gV1lntn5x1uk1QXuCrmwtdS25mvRkuU+Ls9pb1ctCVYaOolIl1z
X-Gm-Gg: AYBFou2lvLfnuQxITLEtZOrTQ8Yik48hSH8V2hu15M8V606s4Wg9Ppx2HehRXcrZe7g
	Sm+OZMpNRb/PgfaIZKmB0sE+jSX/LULB+gBAuaEen4OfhYk66McwJfGm/+/xfeUXKec6QBFSRUn
	rTh4jKaxt/C8yevopdihjiurY2iLY2zqLXO+HyyBxXOafCJQqpUVMQsrDa+/WOgVo+1MrC8YzaT
	vcxo0pPQopzluB5rrLFecwIGJYtYKgzG4g+biC98PiSeiMcPYKaIlpR1i2rl8tEefM0mzkq+etG
	gqith2xvfjYFo2BcxN2M/5SkKUe22YtNtrrZ6Om9LINgOUHx8czZtxa1UFjxvH9BNYeO6b3x/SM
	wYPIGV6BP6xWbg99FM9de2nXhEh7iJ2dZltGYhJniyIiP0hOzoRHOyG/CpuAIniTyPh7hAUmj+O
	KkrbOrxwZPcd4yVTP/j1Xd7Np6XB9qtcUAJObumgZc/hf8zuJ2F8cU9anScpYCAFN7cJnKk34vy
	8Kjanb9nPosCC8onSGjsphWBpNrNGOwJzc7k7PfOcNCI2yLr9GaytDv0V6RIm1q5bpKTKOoBlVr
	lQnNLyOvqx3TViMudPlKlMAKPxhX7I92l9BN8uPVmg1G0l07MyCG287sWQkEXNlXgk3RtU42Nyw
	ObIk=
X-Received: by 2002:a05:7023:a89:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1ac5f183841mr25563977c88.30.1793800837135;
        Wed, 04 Nov 2026 06:00:37 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c30521sm8553620c88.13.2026.11.04.06.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:00:36 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RFC v3 00/17] riscv: add initial Zhihe A210 support using SCMI clocks and resets
Date: Wed,  4 Nov 2026 22:00:30 +0800
Message-ID: <20261104140031.1172491-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9b99c531-1977-4bc1-8105-bd9c3e129951@kernel.org>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060039_756360_DE99A33A 
X-CRM114-Status: GOOD (  16.29  )
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
Cc: Drew Fustini <fustini@kernel.org>, Radu Rendec <radu@rendec.net>, Yao Zi <me@ziyao.cc>, Paul Walmsley <paul.walmsley@sifive.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Jassi Brar <jassisinghbrar@gmail.com>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-serial@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, linux-gpio@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Michal Simek <michal.simek@amd.com>, Paul Walmsley <pjw@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Krzysztof

On Wed, 4 Nov 2026 09:24:15 +0100 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 02/11/2026 20:45, Han Gao wrote:
> > This adds initial support for the Zhihe A210 SoC and the Melon Pi V1
> > and V2 boards.
> > 
> > The A210 has four C908V and four C920V2 cores, plus an E902 management
> > core. The E902 firmware handles clocks, resets, power, the PMIC and
> > CPU DVFS, so Linux uses SCMI for clocks and resets. The only new SCMI
> > piece is the mailbox to the E902. [2] explains why I picked SCMI over
> > RPMI.
> > 
> Considering how vulab@iscas.ac.cn is ignoring reviews/comments and spams
> with a lot of unthreaded emails, completely disregarding any tries of
> contact over last 1.5 months, shall we ignore all contributions from
> @iscas.ac.cn?
> 
> Maybe this will be the only way to actually be heard?

Apologies, I am unable to communicate directly with the team at vulab,
but I have passed the relevant information on to them;
I trust they will handle the matter appropriately.

Thanks,
Han

> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
