Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A0CC77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 16:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5Zc2zo+2lYNjYGaNg4BfKPSMw8a67UidirUDzzDPZo=; b=I/mnCCRekpc8Uj
	V4HLSQKTyHWk0dXGCYlIeeZYizkNHyHZhPCd2iAQ+rMJl7B16d/qPKMmoz8Hso7xO/8SxcqGciqwU
	s7F9GVeoAT8zcG0flxavrF12OOg8hfYhajWf21UC8TWov2dyiPrAahYPQvsn3PDmzU2yIZF1UIhPH
	ZSRUwYikKCS/z1okIGjKpF9IbOBVwO2ZT+6muGnwMw9oqbIQAeQyyRbz0ZnRTZeix/rZTD82d9Y6q
	5clmiBjNsbiZUrGaBeCoviL4veN96j3iPdkmeRGpx8kthpaLrRx/JvQXPQWGZTtF8BtRiQQdtcuSq
	2iziBNEcyAaSWrc3tooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psQwN-00BDcY-0n;
	Fri, 28 Apr 2023 16:27:23 +0000
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psQwJ-00BDar-24
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 16:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682699227; bh=JhuCoJUmtEAdSf+MR1nkkhEmccdfmanyUVUZ3X+cz58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A+6nKzIafz5AMmejiR3Jkep0DzhpaHd66dCMUncHmcc4YFOPS0At67/Tf1wP+M0t2
	 ZyVUbP0voZNlz4VBHoq67xeP85+3EFK7YOWsd7CaagTtG5aqg+Zj6KtIWhlw7txgXA
	 bVwoCeZnAuA+HlZEFJyUaqUKtVrG0WUfjzzxt6cw=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
	id 6A59F66C; Sat, 29 Apr 2023 00:26:37 +0800
X-QQ-mid: xmsmtpt1682699197tk5ydnq37
Message-ID: <tencent_D5671CCB7149630242B61A1BF8B80581B409@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntujnNRNhosd+ozTQu7JOlNjmcU8foYoOa6977Axo9aJzWhAdVrhJD
	 whJ65NIlWJrfVidUKkJATDxyFqe5chnPG7K7HKgtop8xRYFVps8lymtRonU9OfLKhieVECtJ5uSp
	 Xg0BrBxzi9V/osr1rnNaLarJZ5gviUyDmP5YAqR5IQpm88Xy1YVMRAq8PoGdYuz7Ey/wjetAPYyu
	 Wxk+c644t5CY3ut1iiG0y0R4IiUkJqfkvCuvoVdx8B93hEblvGSStOnlbucj1RjNxdu3l34J3396
	 1P61efPSIZue6HtjMWFnQOC8m/pUJEGx64DAj+I442RVZETh6nbyon0xVF2kWM9GRMzP8DUCIJKU
	 +FyvE3nvJJwqYyFQPLGM8pwNyVYYYAV16sFsgTL68zdcCYiO0/zZD1acos5wQxZ4TrVKculL1x5h
	 njCNiMAjkmns2b7c81q9z+xXcD5YM8QMzUU2bZWa7AMRZgt/LEX4P+MgXVnCavyGYjQ16VTOfwLL
	 z+9KlNPQnOzFBizlpdX55X70hQfDCiivp9W0ZLzZ85MmsnoclFpkg1jd/UPPhosqWZMIB9couQIr
	 pTFUaAsKQiHZXECYftNzjox436CeB6lERfh44HLHcNPiB5vBWxsfP7jhKtQ8tnan7Vny3dF6qdWe
	 GsTiEYK8dOKn4zTyL2lyeSRsKMK7U9JiHFma+/ipfnolMXyZ0nLBiJTNWyF/wQVFOajpx0Z/bWax
	 VS5jdJlBPK7wlZNq9miYhdOFOrZi/hghn2tBF+sTuhhbEdSNqseyStQB/T9tQIIPY6elsZaAauXW
	 aF/HykjWogFhqgm8svgyWYWOtQ+gKUOIl62jgKR3sXyNTFVlhnlvk9Tht7KwPqpW4HaqqDTzSXTo
	 JNeGu7SS13FnTaVemwPAnSmZCfmVwd7MCMFEGoIvdGM/3wOWwIls8cfEmzkZSk4NH9jpDP+qyJXG
	 YUrB8dRj19TDL7Ma7G7N45I2t5FUhwwwYThFaWI0HZX7YF8I91P3I09m52HH2Lzc1ryuJwFIM=
From: Yangyu Chen <cyy@cyyself.name>
To: cyy@cyyself.name
Cc: ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	i@zenithal.me,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	soha@lohu.info,
	twd2.me@gmail.com
Subject: Re: [PATCH v2 0/2] riscv: allow case-insensitive ISA string parsing
Date: Sat, 29 Apr 2023 00:26:00 +0800
X-OQ-MSGID: <20230428162600.698947-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <tencent_BC90DDC6093E3E41246D3EC73F5CAB189007@qq.com>
References: <tencent_BC90DDC6093E3E41246D3EC73F5CAB189007@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_092720_171549_4674900B 
X-CRM114-Status: UNSURE (   5.37  )
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

Sorry for the cover letter being detached with patches. My mailing
service provider will override the Message-IDs which caused this 
trouble. I will send the cover letter first to get the correct Message-ID
before sending the rest of the patches the next time.

The cover letter is at https://lore.kernel.org/linux-riscv/tencent_8492B68063042E768C758871A3171FBD2006@qq.com/
The patches is at https://lore.kernel.org/linux-riscv/tencent_85F69423082E524C478844E31D5F8920A506@qq.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
