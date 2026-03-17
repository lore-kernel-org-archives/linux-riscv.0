Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4194F33811
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVVLz0j4hjVxDOQrSFkv57t+gIKEbF251YrDpSbWyhM=; b=oBncwKs5dI2vZI
	NRDeiupwHLBHj3hb/lZW38PUGi4uPa6r9rhTIBuBm7aRh5Z+VjcekRH/WNNp9c8CVOtYmFmLuDMfO
	g+RhNxV29ko/z2dA/9h6MayR9dGFIKUhudNXCrpXwuEwQyFscjZ96hVGKZkStbrGmXP8gHxKfO4Ki
	Bkk9r1bniLqyLnoIweMrr3YyfoUFEevoNg9LtSiYoSA3HS/al5qCtaiy9NBxNEVLrctZoCDvn/YJo
	B8C7sJPuRR+rADbp77xV95hmdCko1D7AylbG3OD+lYd+VgyQ0W1QgzRxHvtrZhXOcSopNSztpOTxY
	VvIz+9FEiHVKfjwq8PMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qkp-00000005sL7-1djq;
	Tue, 17 Mar 2026 09:30:23 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qkm-00000005sJB-3exc
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 09:30:22 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-59e4a04f059so5553850e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2026 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773739818; x=1774344618; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x1Y0fq+nOdX5B9Zlv9rWb/FlWGr7tCSJEoVxQK36Zz4=;
        b=cM2RhEs13FRN8385yVjsqiVU00emypKyw9SFNyjZl6nxjzz1X/LqyCqoTuc7PQM540
         P3WvKcp6isKpZSNPtiOyUd82HXuHzHUIQi5yGwQvTiXr3eC5B5NQeXIM0rANrAZFtDWl
         tOtAOMiwcRjiAdlezdrNq1JxkeRy8senXHvGjTdKn36FPcQUNMrnvINF6gnzh5zCfsgK
         fVaDzwSveiVFVoL8tOqcOMvTaa5LQvsa/mgbjTZxLf9e8lG2wgKXJiDRdOeLK7/GSaOd
         0jK1y53s/Sd+pGATD+h4kXQwpZknPrfStwJU87JCtvlZLTTMFOrmINLpuisjJ0Svb1TG
         W5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739818; x=1774344618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1Y0fq+nOdX5B9Zlv9rWb/FlWGr7tCSJEoVxQK36Zz4=;
        b=heKOV1KJIcqFSdeY4zuddn6DBCImqXxzojRzvhjC/NqNQcqwsujXupl8eurjdXNybD
         kKy4ISQsm2grprYYSwzxFRlSzrMKIzvVVrELyLJ9egzcd2Cgd+CUeSKjNHCl7Bfnm88k
         L/GPnrYvcGIoPGnoabDdynUmIT+tt+9h4Au7uXpq8R/vEQnBy/kHCOUjpOZx3PK30gmc
         QzkCeAP05VdQS3X/ulSezhTPhcyjTz4BT8eVc/5R9/0S2eyNOBLzDwR88P/9OfSDBlXC
         Buk7kZ7qdMkQ9rto1j6oIW6Dy3K9lDzjxz8tmwwv8I7W+Na7pw9mtdW45Kiq0QdEvFpi
         S6pg==
X-Forwarded-Encrypted: i=1; AJvYcCXryhJcVlnlS0Qs8D1tb6Zy4s0Fc0XZk9uowQ3MdiMvlhHW+SCeBwTM7jcTeuauFiIJvvdtG2HVbRXD7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/nHFBmS8S34Lhd5h68YQRLqnbmpTQBxrTHIeefG1Cw0E8E++y
	6SZfvHwFxqdrNq74BbRyC184cH2pBghuVb/+wDcVeC3DK0UDAfLWeQz5g6fTbwI+gJw=
X-Gm-Gg: ATEYQzyitITQHUz60w6+vA2HFNa5Bu09k3VVbYUEkVUJ0nxuatJa4T2t1j71Es2pNbI
	YJR2bE//r+75cM2Ns3w0FgjRvLu0RwJBbN5432WDZdstCTWMvO0hwzcDA0Va6VLK1zOLHf4Ir8w
	2pkvOi4OKuraSp9x4AA8SP2c5ciQJaUQM8tA5tW2xSFxUr5gjVnrr8AjhCash7Idiwf4/FNadV/
	jbMemFg18OBcbqpSiT4lQ3JNDzuVDXiA/0BfXouHDhOXVP1g4EHY7dPiq+kJY9baNjo/7OWh82V
	SWUwXauopAOEUfgqZvUyVgeh+5CJD3gkYOrKu85Ie3tyStFpp+N2yHV0tKR1hyB2oD/3o1Z/1vA
	Bk1DHYyWmHYctKCIY+y9IolV2AA27WNtciqJdFL+EZLBHpIF0rc8syw4N16koPoWF5eUuN5BvZL
	ucAaG2+ERFjYpt0ANcrNHv/tsBoet/NcMvwWt4xIWloX5b9I5YBcDN89HJ
X-Received: by 2002:a05:6512:31d6:b0:5a1:3e11:2963 with SMTP id 2adb3069b0e04-5a162b13fe6mr5199056e87.39.1773739817876;
        Tue, 17 Mar 2026 02:30:17 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e713sm3977671e87.32.2026.03.17.02.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:30:17 -0700 (PDT)
Date: Tue, 17 Mar 2026 11:30:14 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Arnd Bergmann <arnd@arndb.de>, Heiko Stuebner <heiko@sntech.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Anna Schumaker <anna.schumaker@oracle.com>,
	Alexandre Gonzalo <alexandre.gonzalo@arm.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-parisc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/9] scripts: kconfig: merge_config.sh: use POSIX '=' in
 test
Message-ID: <abkfJsyQSbW-VjxD@nuoska>
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
 <20260317-arm_defconf_cleanup-v1-1-8eecb7fdd24d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260317-arm_defconf_cleanup-v1-1-8eecb7fdd24d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_023020_945841_0218E0EB 
X-CRM114-Status: GOOD (  18.90  )
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

Hi,

On Tue, Mar 17, 2026 at 10:13:37AM +0100, Vincent Mailhol (Arm) wrote:
> merge_config.sh yields this warning:
> 
>   ./scripts/kconfig/merge_config.sh: 384: [: false: unexpected operator
> 
> This happens because the script runs under /bin/sh but compares
> strings using the '==' operator, which is a bash extension. The POSIX
> test command only specifies '=' for string equality.
> 
> Replace '==' with the POSIX-compatible '=' so the script works when
> run with /bin/sh as intended.
> 
> Fixes: dfc97e1c5da5 ("scripts: kconfig: merge_config.sh: use awk in checks too")
> Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>

This fix is already merged in kbuild trees:

https://lore.kernel.org/linux-kbuild/20260309121505.40454-1-o451686892@gmail.com/
https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git/log/?h=kbuild-fixes-for-next

Cheers,

-Mikko

> ---
>  scripts/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 735e1de450c6..073c6bec5245 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -381,7 +381,7 @@ END {
>  	STRICT_MODE_VIOLATED=true
>  fi
>  
> -if [ "$STRICT" == "true" ] && [ "$STRICT_MODE_VIOLATED" == "true" ]; then
> +if [ "$STRICT" = "true" ] && [ "$STRICT_MODE_VIOLATED" = "true" ]; then
>  	echo "Requested and effective config differ"
>  	exit 1
>  fi
> 
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
