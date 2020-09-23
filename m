Return-Path: <SRS0=huAv=DA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20787C4727E
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2020 11:59:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF9F6221F0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2020 11:59:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yTJywcVA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARrwxp/E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF9F6221F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ab09bVsA/Ol9QJMtfEIijc0M+/TizLXdbKJIIpBG6wM=; b=yTJywcVA5pQoQjcWhLYLpxuRI
	giiOnklQA2BuBGfpq4t7LQZlJuDo9UB4xwxyUdv5ISAj5iTvBc1Tpg6lw/vxjwLCTRlyqRwu6l/q9
	cY5BpG8gSIwXgTr3Oc2z/1tOC0j/AK85sAgvMN9jYLAGq7A/tfPoB3LeFYBtKJNrpKMKBPYpee1DP
	Gnh4+Sv/wVs8StduDCsGkTAKUwv+8KpKgao4a5Gez7aGJ4rAW6BCW/DKcpBXUGMX5BLAQjzwMh+l6
	Kxsdn3nd2fHMUbvmOoRNfKCJI3xPaa2uFX/qIf+lWJLnUu6Ku+OM8n8hbRXttSATN8e87u0ET9WPS
	mhPD1QBmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL3Qz-0000M5-EM; Wed, 23 Sep 2020 11:59:41 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL3Qt-0000Js-C5; Wed, 23 Sep 2020 11:59:36 +0000
Received: by mail-wm1-x343.google.com with SMTP id b79so6816566wmb.4;
 Wed, 23 Sep 2020 04:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Y2NQ1AYl2U+eenm019Mygt4DQape7KVEjWmPGv5J+hQ=;
 b=ARrwxp/EvpFennextbTuyMmrgy6/BDoYbHgCbm3CkP8fV7xPHQgTuJTu9TZTRHaECN
 kSDgXf/jUFTn2Ebe/lGUs5+/JP0HQbIYrQxO9d/+qVFf2nijVDg8A+xo1jKUsDa2IdXo
 ql8S3RVvqqSx+2RUc7lWhxnRB92CCT1qJU4UZS1VxCJ+ayBbLTeWi8jiU/D3mjJEnoYo
 vYH4q4eUURxyt1nyWUMMlKmXlC4Uo/3dngH5/dWiFjjP1UnDUzqWaXjiZWCMoElNgTFL
 rXl82HYN4WN/ebQD0uHrfVLzmeHF3mEW0LvjUqZ01v5twW1I46FGpdHe3klHCREu5tLt
 vhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y2NQ1AYl2U+eenm019Mygt4DQape7KVEjWmPGv5J+hQ=;
 b=R5x7a6I+DL2l+U6BpiRHdoXbf0/UsZjEhigKUNsY64M4BLqe+hUn6rfx8JTdh98q33
 P9PpAHDxIxqBrCg/6Gxo8aHylWZHPF3cyPZtjW/mjKoW+jCPS5GNCMPJvuRhq/z1CQgx
 5c7FHgCM5Urv1RLBnXlnQCV9q5CAbgPC3EcVHMwGbXtiPzn1+bfKWzwf2OoznQ+c3Akx
 OHL+ejc4UXeflx6vMYsgwmHW2F8JWOS53kX+67j93q3lT/ix34n9P6jWUlM2X1B2B0kl
 ng4ZcDLHLf+4zU9fLF/PMeLsE3F47Ndl28oc1IgWSFjtEbaEiw63y/5nkgrX5XEpk86G
 0HFw==
X-Gm-Message-State: AOAM532+DRLk8S/PdFmpuRmNbBzRqvBEx/89XIXi7jLcNm3QbzpBpOVe
 1foj8yh56p87EJ2wuzUgXrU=
X-Google-Smtp-Source: ABdhPJyayR/8k8J9eshWCConpaQjDUFneXPjQXKfZvImZ69fZG8Su03anQQnX7xjqPwhWVNwxg94OA==
X-Received: by 2002:a05:600c:24d:: with SMTP id
 13mr6306216wmj.86.1600862374266; 
 Wed, 23 Sep 2020 04:59:34 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id g14sm30908929wrv.25.2020.09.23.04.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 04:59:32 -0700 (PDT)
Date: Wed, 23 Sep 2020 13:59:31 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/6] pwm: bcm2835: Simplify with dev_err_probe()
Message-ID: <20200923115931.GF1846003@ulmo>
References: <20200826144747.9436-1-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200826144747.9436-1-krzk@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_075935_416447_77140BAF 
X-CRM114-Status: GOOD (  14.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>, Paul Cercueil <paul@crapouillou.net>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Orson Zhai <orsonzhai@gmail.com>, linux-pwm@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Maxime Ripard <mripard@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============7197522006724462735=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7197522006724462735==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yRA+Bmk8aPhU85Qt"
Content-Disposition: inline


--yRA+Bmk8aPhU85Qt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 04:47:42PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/pwm/pwm-bcm2835.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Applied, thanks.

Thierry

--yRA+Bmk8aPhU85Qt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9rOKMACgkQ3SOs138+
s6GgPg/7BTuN809cHB+fehAxKkk9YqrzQXNml4ColBa9N0pyvNfBUayKPgG2s7bW
CeDsCXXtXRTH/3lGghEeZt+I+yOfdyWxYoSv9d7HMjCyhSOhHMaMwQxqbBoKHmbP
7kq1TQxkBQxWCwlZhV8rbN1/sBy7CEBGdCL1/4qRlK7fJjiE0Ni6wwZVl8SIJf8r
PJyg3lbJ5C6kho5d8WpxJTQMtw7mZg/U6DN4OgjeG1g5IvUfuHKefahZL57gMDYC
JAGHCN2nrkZMup/LZCbxJLeQgu/bpHJN4IGOi0brfHn2bcRIaHmtdf+FAOkKoMsC
DYv48i1s1IxSpLspq/btXps+N2cCaeImLU/Dj5dI0m2hqZiAG5m9BEkffdgsVFdm
GRAZqQBuDL3mXrAMXH7EA96WplUO9EXDmacK/g7S6p2j3J5JjFT5vz4DP0HYotL5
Q3+yPhN6Xu/eW0toYfTFwjBBXSH1R6HDWpLqXfAw+knB3mEhnml0t+6UzT+ve75e
GyQ2vKwowHXdwTKD97sOM6qojc4BSO8N/OMv5+Uwv+EHjExc21RHiRw3tcX2O5XS
JrDVfZnJXWZ4NuzpTqh9vQ+0D+gdGEFotWZEkCGtMMYFKSEuNg1KM0dhctnhwz2h
laaj5jZFqI4+L0V338bCt44pjr3uWAcNgP3cGSJAzsK3MXmzlSw=
=eTBT
-----END PGP SIGNATURE-----

--yRA+Bmk8aPhU85Qt--


--===============7197522006724462735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7197522006724462735==--

