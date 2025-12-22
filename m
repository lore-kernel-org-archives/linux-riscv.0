Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E0BD68BD5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 02:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FE2fpwE1TrWrLoX8gpcdwwA79NW7Ao10txKiqalDFQ=; b=nPvixHnY2n0Oul
	xUo87imDGKlQW7DyMmsmrF5kBM+UGqG7dr4R9hwOgI4JE5ramzWi5nziqhn8qZkDqFRzwWWM1tys2
	SLXnTXZ4p6nRH/ln7ZzBUSbSdFVIZtNmQQ050Akqh2lEqHC/TdrG9cpn0wfiKzjcE6Tzbq89bhUWK
	K5P2LHH54u0WMFHJ6Zv/w9JEjAJmShm+L48j2uk/3ZeLQy3yThIyuuegtQnaWUU/bdUPrFCLBq8Rh
	ecUO0WISLCkxBmzEqeXo+oJyQ2PNldiP+0O2Pukh64e9utibKxTngfn+7n3/7SSWR2WXDnxeO7tQb
	o860VsRHvkIx+wHi/88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXW4y-0000000D0FB-1nW6;
	Mon, 22 Dec 2025 02:55:24 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXW4t-0000000D0Db-0NKT
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 02:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766372062;
	bh=aWH3AozSjguJ/qtUp5vAwnVP8kUGmn82dw0UQ/1G5hc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=lPahPrWfzOgEAzNxMnHKClZP1RisOAI+Gqbur7ZYULDU5+HUEtRk80Hu9NHCXc3g/
	 8BlQco2ivOg0Ch2O6nfSrX76mNm+fOI+e/nC4HpxKO0d/nZtSu8+qKW9XGloYC58QZ
	 Y+WnVe70Q9cvQBDHP9aob9P4eYNPk4gwC8VcY7jA=
X-QQ-mid: zesmtpgz1t1766372060t7d1c31d5
X-QQ-Originating-IP: AU9lTnr49pGqU6zJR7M6OH6rqyvohYLLw/StbRivpDs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Dec 2025 10:54:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 537527025626833711
EX-QQ-RecipientCnt: 11
Date: Mon, 22 Dec 2025 10:54:19 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] pinctrl: spacemit: k3: adjust drive strength and
 schmitter trigger
Message-ID: <408BBF8CF676D97D+aUiy2w1iP1LJoUOW@kernel.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-3-f6f4aea60abf@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251220-02-k3-pinctrl-v1-3-f6f4aea60abf@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MDqtQ4jGWXAGC96n/QJW5CqpNOGa29lPeU/ke22VWtG5mYgikCnLbyF4
	LM+3VxP3zFygJmLj9nbjC/3bq2TADA+TlpB6wPXfeJ5GRWix4z3vNDK8wNwl2XD4Prx0z3A
	bJ1gsiTeeKeX+LLnQFXBUAw7to7j01VAYd1jwskuOXIxXpw8N9QN6bDu4NAlFpMqQTYEHyG
	q4JPoBQWRbz7rNJO+3e/LAtzXlXU+VU6SOVpVjj6+8WMuZeJdVcV68DBHxkvfQDgpCaROv3
	gncjGO8AL+P769yWkgHyN2L3iHfgU6U4mvcQOjMq4kOW49zCn4teI2CC7l1jdE2LNZdLBlZ
	Z2smg/UvNWaUhOG5OkGwcR7N4mvKxRXSR359sjyTArnGtyHtmPfruNy/yh7ZkIPHl8J19+s
	FzJ+UDSIDynF5iZKXtb2t/i4s+IDwt6ZieVc3rLVhjjWI2wfoHhRvB+rh5xhsOJJ02TSTMl
	dKvFq3J4YEl26bWWBUTvmMmkIOWuXraxc5+5ZV6vG/OKvwOD7qaNCQtrFls2T5SshHtGGXV
	BlZW1XaLtPuyN4FpYo1dlYCxkks8ew91SHfib4EjQSGnihTxCgxsX2KcfBAA4TpsMYPzEJF
	i+QEe1u6elgWJDaI/9chfDUP5C4WxX6qRgW5gLc0+4dikkJI6y4Q069zNpQIgQ6P32W2LRW
	woWRC9puy1HLAhNmH1aeTkmHioYEbMtZ/mEh2UmoTq1MmjsPp10qyufw4xmgixM2ZO/vGqN
	zovDhaJsFgA9LXUxnQ2ujxGQhuCTe6pn2AixIQPxuZh3nruONWhzjmpHshQDgZmzBkmmRGq
	kO5P3AjpjzN2sIZ3Z1shR29AwB4Ft9Of5D0tg8f3RSMvTR4sO5t3V1KzHApW624Xb0ezdvm
	fKZuDDuL759vve2z4HulCAQ2ocSgAtgb1mkCiH+EA9I9aOGvx9FOmpXIDPwKtaYXy2+nEAE
	xIQELjikjx1s9NaWFWFXb+LNMyJc+a1ghBwqPr3ZokEk61pTLM4ExVH+Def8GWx1m50z96I
	RRMCVJ/Lj2LLJlba7AqTlcuSr5Qj0=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_185520_299309_7D02CECD 
X-CRM114-Status: GOOD (  10.23  )
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

Hi Yixun,

On Sat, Dec 20, 2025 at 06:14:55PM +0800, Yixun Lan wrote:
> K3 SoC expand drive strength to 4 bits which support even larger
> settings table comparing to old SoC generation. Also schmitter trigger
> setting is changed to 1 bit.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 163 ++++++++++++++++++++++++----------
>  1 file changed, 116 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index 441817f539e3..8ca247fb8ba0 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
[...]
> -		val = spacemit_get_driver_strength(type, drv_strength);
> +		val = spacemit_get_driver_strength(type, dconf, drv_strength);
>  
> -		v &= ~PAD_DRIVE;
> -		v |= FIELD_PREP(PAD_DRIVE, val);
> +		v &= ~dconf->drive_mask;
> +		v |= (arg << __ffs(dconf->drive_mask)) & dconf->drive_mask;
            ^^^^
use val here.

                          - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
