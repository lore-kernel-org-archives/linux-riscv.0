Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0156FCD343F
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 06:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXSTlzT7uOnI2XMKudEuO245ynG6gXWLkYGAOUWQGx0=; b=lZVmbK4Mu83vkb
	fXCN8eKlYJNgyFUHCaFHU7b1W6dcP8Kz1NW6XA17+2ahOIB04kETAWZyBENagAN/qIZvyuKg2xAOx
	UYOtSGXMvRYu2VR6plMCvPLpebgwkhzKPN5496EraA3z18oYgsJlW49kYaqBU7XAkDUoxwvS46Oiu
	1HPomUeI9HQJ3SC9Oeu8xPACAVeSBrRE/38qk467R32VkPednsQgPbqhM+DpOBI66rUOswgAFAAhU
	PKzpmQLNDcVaHR9GokeWfNhJgFBeSnFw2+8lcw3j4ctmuzikXOj7C8bXjOghDRJfyMAGVtloeI7en
	liYGhqZamo/yotNrI4xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOr7v-0000000ENqs-1vUM;
	Mon, 18 May 2026 06:06:55 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOr7o-0000000ENoa-2n1t
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 06:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779084379;
	bh=MrpWH7HlsQ4718RsP2YESKmL9cnLUPJilpVnbVJ80sA=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=VOARu9fii1Yd1498A6G26EzCzm2lxzJLJqGMQRMQycpXWXv2EWoPI4DA/27pCQLRq
	 yO65AwT2j55moQzyoggL6+tGLunBN0Gczuiug/1w2AM2tLwSH55QdRxvQQhhc7XcNV
	 v020NiNGLiRSkBlejXmpdxBJi5UCxS9/1VfGlcxc=
X-QQ-mid: zesmtpgz6t1779084371t299a81d7
X-QQ-Originating-IP: Naxhh+jCT4NJs5ea8bXpSGR5yxdNPwg312+/Ll2UCKI=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 May 2026 14:06:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8651641378394459406
EX-QQ-RecipientCnt: 11
Mime-Version: 1.0
Date: Mon, 18 May 2026 14:06:08 +0800
Message-Id: <DILKRVYSWGAG.1X39KO7JLX6VF@linux.spacemit.com>
To: "Mark Brown" <broonie@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <jinmei.wei@spacemit.com>
Subject: Re: [PATCH v2 3/3] ASoC: spacemit: declare shared BCLK for
 cross-DAI rate constraint
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com>
 <20260507-i2s-same-blk-v2-3-ede05a22f732@linux.spacemit.com>
 <agHl6p-JEjpsPsPX@sirena.co.uk>
In-Reply-To: <agHl6p-JEjpsPsPX@sirena.co.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NL7b8Hgtati0awgSvM3gySwzlHj0YBaUB7eWQ/cT6pTx/spaUUlVGQ5k
	+q5UlcbmKB3j7EMkpbVV1ea4jh22JPlQJB9yE681lHCt0jzms0VYXyjHZTaYaaIGCC4/Nqw
	OYSNanpZu6fXGp3FhyjMkHvTyRgMSJHFWF14kUv76VgVzj+FPdH8dr0x02PIqEW3AdXBI2o
	0jIx8+io78k6GLrbhQJmI5sG6IKlBI05hurSfxq/YzPrgol4AfawK8irVgqF3Pc0EMz9CjZ
	b5SjgEPJO8Ew7rE3q9aqyMqaF9SFONDWlIZ4OazDX+te1H+3fhxxl8dMIkUjc5vmpmELwmC
	8rflv9O/W65ZfuqtNpJSjsr+VIQ7Da4PKj5cfjTgku1EnQkC/uPhEM01aA9DFP+YGvRYmAq
	T7YLHuTvQ0boQ4F4OSUQNme9vjK4btCB/QNaopROfrZY35tRKa7O8UiEM4w7OjSMQiYeyE0
	n81K0pDZ3fBPvDnjI0boX/IYGNqpG18I42GTLNgD4pKit9Jek0eCv21SN9QMf3FQAcTs2G7
	jUvM24GvvtrxozwvOMY0ruY3WNK0s7OHEamdvrCBfDQsXWvt3Ho44RLlJWuGMBgEPsVcnd6
	55b2Y6CjcOmwS30JtovrdTuVAJWe71vNXKaaZUiSc8zZM3/GZY0xudmTxmajTzicPa0J3Vw
	wyVXpxapoCbbKdDvf2AoLL0QxaVslpGZavlMLtZBiXxW//vW4rmLtFuy5vNFrIY0pm0RB+i
	EF/DEFmwBC1JQrXx+ET4HMZjIbaRZvTdewzRcyUchSFjaeeN2oGgprzS14vo3wD8KI/3i7p
	XD6ZwZP6EbLGqWwwNWZqCj74xW+NmSrn4YMF2Cwa82Kv/ZTP8oYmrndDcmT48Qq7Gm0jN9o
	D1UZXqRMEW6LV0G/g2pyzZBKfdB9NP9xG3PKURoiBWT/yQr5brlY6Ml7b1kx9a02Jiso4M2
	NCNWQvP/tilBpIVo5nj9EOkD7zu8eemka0WK3f+Jvp7pz0wLbOKrC0UA4Q4Wv7u+g/FC2OV
	UJ4k7QF+Huw3MlZPkNnGUo2sFww0gpWIAG9iHCfzfjjb0nuPWN/g+oXJh3aa/lVA5N1lusf
	jgNfmWNGlJe
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_230649_167142_A564339B 
X-CRM114-Status: UNSURE (   8.07  )
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

Hi Mark,

On Mon May 11, 2026 at 10:21 PM CST, Mark Brown wrote:
> On Thu, May 07, 2026 at 06:31:44PM +0800, Troy Mitchell wrote:
>> On SpacemiT K3, multiple I2S controllers share the same physical BCLK
>> (c_bclk). Declare this clock via snd_soc_dai_set_bclk_clk() so the
>> ASoC core can automatically constrain hw_params when one controller is
>> already streaming.
>> 
>> For K1, c_bclk is NULL (obtained via devm_clk_get_optional_enabled),
>> so this call is a no-op and behavior is unchanged.
>
> We don't appear to have a c_bclk in current code?
You're right, I forgot to note the dependency. I'll drop this patch
in v3 so the core framework patches can be merged independently.

I'll resend it as a standalone patch.

                              - Troy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
