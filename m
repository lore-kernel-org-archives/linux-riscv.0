Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC89CCF9E3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wg1apSkCDvSs+ZkZefo4zACCgeM2x6SAZ1WZyiXR3ik=; b=rcrBfEU6OkWLJJ
	kG9P71twS9JQxpr+1xVooZXaA0iMKDbtj7nEA8e9DW7tcfxCQ+eNxy1A91NkLklg5so/9MnJfnBvt
	DGdq9OfTJJS1aAjsYkt0YkD+s3XKNEz0gtASHtzuobU6ue30iCe+KBa5Ksw/EMxbWo9wJmODTrzFf
	SjUPbq/wlXprj8/74pAzHBAHccR0x3cgRPk5cTeJ/0JsogV39jspCvJ16cx5Q61LvnNaSv2rJyCXy
	lH3+tKs9he1HbeqS6IBxp0FF0ra1xI89QgY/K+VRPINXBnpggr70AXGbNVzu50ITThONK/k6b4dcN
	U8/tMbBsHsNzKs/sAG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIf6-00000009eAt-0SqC;
	Fri, 24 Oct 2025 14:21:00 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIf1-00000009e7I-32bV
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 14:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761315598;
	bh=ylc6GQ1hJ0TbYatd4EtuuHeOUs0jEjk+TPTEgYS83so=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=DCjiPUx5wGt/K8UzRKTjKNF/PWL+nVF1aojEuBoFritg726dk5GpZuYyM76qo0niw
	 VVui7FIGOhdHAuItmLgRPx6/ldGLuw3gZY4r8StFwzbIIpDjt/WqC10ZI2wWBNd8I6
	 64Tnu6BwYF8S/UuqTqRMCOXqQJZEgsqD7JhTsj+c=
X-QQ-mid: zesmtpip3t1761315596td6aca7a1
X-QQ-Originating-IP: zR/JaMMb0y/zEHR3rB1xAYJP1BB3pKKuVq6gci5Q7OE=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Oct 2025 22:19:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8195043091810859412
EX-QQ-RecipientCnt: 11
Date: Fri, 24 Oct 2025 22:19:53 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Yixun Lan <dlan@gentoo.org>, linux-sound@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: spacemit: add failure check for
 spacemit_i2s_init_dai()
Message-ID: <5446E6EB4FCF412B+aPuLCQcV8hMlBLjk@troy-wujie14pro-arch>
References: <20251024-fix-k1-i2s-dai-mem-v1-1-15f5f1ec294a@linux.spacemit.com>
 <aPuJnJIeupM1PV09@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPuJnJIeupM1PV09@stanley.mountain>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NgaheRY97EnbcGSBrTOOlFa+KwSlGtxw10Jq71kMZuYIdRS6LNEqMaaf
	EeljPIi+JR24Nqd5PDYIXRkGtm2j6ZFVM30Ul/ab9p6HHreA2OYXNMdpGtXxYBml6kU1Nc3
	lwIw8LjisRod3PNYXD6O5ffC/cyqZ8uWbeJmVkLIwQyT+hGVZ37ZK4qubHuud3jbw3oa9c3
	q58ooSBMdy9G/oPkBqJfBUuPQ1ObSf+/0vEg+GgYGiUNHH2d5AIKAlZbrpeMmXZz1t+imal
	5vG5W1dUf1vO4g3pTJMFgaDrhTT2jILCOqF879g1p0/7yQlOAmfVwYMlMXN2++u9HCBx913
	rS0swhCtdh7n+Ed1VPFjknIHYNWcGC63LiOgUu0R0sZ860h+chx2dLxomUGPmHv+katCdsY
	yVgZbx8rtAubGNfox40E63+qUKDs1o3/UR7/31/Affl0JlAwnKe4NvM2J7gkAfhmrLjAA57
	ByaQH9Ozcusks38hAMYCcy3xq6Prd0UzrpFvFh5Y8CjMZvX8XW616YyalJ/l9I0c85Nw8uJ
	hvwOtF9KOli5kEVq8sd6YSLWiW453SmGanKkocBwRRl2faPE6mmsJD+8g2nPl00ExTleMYg
	B7ShjIQ50Lw06e08Swr4Ci7fK5SezCZEuqeZrwtEacp0Z91lh774me9nZ5M6bTSejdxG3pl
	Hgnys2xp+TKhM/rORb9sCxs5Yx0CPs1HnZvRQ/ipVPvObrk9nZrtYsYixA/HJQAA2RwlALD
	tE5infnf0IIM/bFkdPF1vjaES8SzHMSGSzpCZvGV+aTwy35BrBJgbki1vuYUjzkEKpGG65P
	0gc2f+qXxUb/PhRLE5+HitQhDXMiXIholbYxpd0RGyF5vO3249XGqPkNRbhaMGGJBxqpblk
	bt18arbbYMzOt/K1tXJEIoyfic96HSAM4lrurRkmB5V80RVCa3RBdBA9naM4P6DnvuRlvD+
	qIxmeXVP1Yqv92CBRXZCJVVjWVmBPEsHabFMmOiOcogi0TiIGVKzpq1zr8SRkicgoronKFz
	q/gaawER/Bxjk4mWDTclqM6M/tV4/v0LB70aSa/AByjNhSNmpqdwLdIzwI7S9oPFCoDSGlC
	BHM5GOdJ5KBT+7d1qGV/avJmB+9tslQ4g==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_072056_686798_AE3E8704 
X-CRM114-Status: GOOD (  11.25  )
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

On Fri, Oct 24, 2025 at 05:13:48PM +0300, Dan Carpenter wrote:
> On Fri, Oct 24, 2025 at 09:11:01PM +0800, Troy Mitchell wrote:
> > Add error handling when memory allocation for dai fails in
> > spacemit_i2s_init_dai() call.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > Dan reported here [1].
> > 
> > Link: https://lore.kernel.org/all/aPtiNCZ_KBezL2Dr@stanley.mountain/#t [1]
> 
> Thanks, Troy
> 
> Normally we would say this needs a Fixes tag and the Link: should be a
> Closes: tag.  It would be easy to make the argument that the
> allocation won't fail in real life so a Fixes tag isn't appropriate.  But
> actually it's simpler to add the tag...
I see. Thanks!

Should I send v2 with Fixes tag now,
or would it be better to wait a bit?

                - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
