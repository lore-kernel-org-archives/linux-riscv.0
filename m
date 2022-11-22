Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38747C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 10:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60gzIVRY+eOGjuf7hGbnQ4iKuHZTb8GnrpabveElzcE=; b=B5A+y/xwFTcY8P
	X5BFElwBDcR5LAQ7gAmdb+5HaV4rbHCvBypANWAjx5AocqGr5wGYDKEagzPIh7BW4Xn8ZNUeWweXE
	WDn/x9Erb2qT4pvlzX9vH2GIGXfiJdaaCSU8iLH+opncUdhshuIArXBi4QEoHHnmRWjpXlTqgKo+/
	CJpP4QOC/jCH2jKB0X3ckOwHsY67Q6lSk0HT7P41peLMMBj91cuqGL7cRpsht1+WwwVVBOpdTAjq9
	1n/OrsgXXvL+xD9gkclSthLuKW/WMBzmUlcS3dtCQpVgQEomlD+m17sA1OtjmbqiozNh8xF2H2rFH
	CAjIPPOVyoADhVws9U1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQU9-007nm8-1B; Tue, 22 Nov 2022 10:26:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQTJ-007nKg-Qc
	for linux-riscv@bombadil.infradead.org; Tue, 22 Nov 2022 10:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9Ffx34EpUvz/wk2V0TkLGpQPfUVhIxoixoNZG+R5yhU=; b=QwrASGbbvD+6BK7uDHCEEDI9sP
	z0aPvMgqBAJ1c5Ez5vUSyxGrp7/hKR3aC3so3rtMHvNMP4g5WiXwBZvombZ4nMFCiYN+RVlB5LAXa
	ji1MqoqVLW7TJTMTNEMejalrvbGOCYl557/7Dra6Ud7bzfmxvl4tisFtlE//sVEK5asGlM2QmSVjw
	jOZlhPrBDJ6jmN81E6a0WAIGJSNiGFl5EFebnBa4eeWZPVhEdRM/+DmrI0lxUCTiwKn+BHb1N/UL5
	3Kusr2z7edDDHz6sAYyVegkeDHmy5XZDiqOrCkFHdIzTXJJB+zNCj7AWpAKOByabxeyFHGRi+gWGH
	qqtfnNqA==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQF5-003P1v-NP
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 10:11:08 +0000
Received: by mail-pl1-x632.google.com with SMTP id y10so11981332plp.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 02:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ffx34EpUvz/wk2V0TkLGpQPfUVhIxoixoNZG+R5yhU=;
        b=TVN5V6A7gjqPVkAUn4JbFNorOWRrBKFn7ykWEJFI2TJyoLwiq9OSTR31A7QwxM/sgq
         KMg0c+/ECORPxlNsN7/S07SNEgU7QXb2cUDS2ry1M5DkXy0wp3y18EEdHQvJYEmYK/Rl
         C4OS51EMJa4XoawksMYV/Cf9b5L1ulCHoVN65dRBkBMOIDHvmj8jN2tkIGErvk/9QZG8
         vsxqY2OPl5wDk2T4Ja6eJ0XKeO3maMTXu6xlKRLV5URoxFCGq+WOl6szvf11N02f8hpi
         B34fRWv1L4KyL4bhKSwrv1dEOgWY/rFh3gVsHIVXnfFcWQUalNUho/A+qyH5hiABzQ8l
         F42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ffx34EpUvz/wk2V0TkLGpQPfUVhIxoixoNZG+R5yhU=;
        b=yD6/H6arvQPTlr97/RYWR+mAQuS32UmjlhnZYtRXM7BkKB+b1loQWkmRdG9fGKQrJT
         uemkx16EGLOrAF1Hpl5W3tHH5nja0ZEOG+bjLLLFJ5r/FhnM/hw8vgME3K88Dm69seGe
         4PUAgCLaGna2e98bMXm1R/kHQQKJCy+zwgFPEUzOxfaRmu0l5mX94xBcBVbVlkzcWowF
         c/9WAheLbX9hVTK0Poo4YbIu4uYErp+FHGJKWbFJhqpeBdLe+gDm07qTI/nYSIlTgkFl
         VQK+Af4URFBvybrZEcgfB9mXSJhfpCV2IDdl4T1iQZ37KMiFEP3/Sh+7Pm5dvuLT+Akr
         p3mA==
X-Gm-Message-State: ANoB5plNKsYtB5dCOUh/Z53mvKw2QIYqeaDTCNcJCS5mZLarPUQEQW5L
	a/PeviAcYpGJkFAVaxYe36i7b0iJNY/in7DBbgXKyCCeVno=
X-Google-Smtp-Source: AA0mqf7EWECK5efgWxORmvkHfTeEiAaT/+7tYzpwh78/RlRBi/8M0vH9zW9E6QMP8gG5GC3WkLfXJn+8uC6/tjmYfu8=
X-Received: by 2002:a17:902:6847:b0:183:6555:38ef with SMTP id
 f7-20020a170902684700b00183655538efmr6778345pln.157.1669111858051; Tue, 22
 Nov 2022 02:10:58 -0800 (PST)
MIME-Version: 1.0
References: <20220923100149.2647325-1-suagrfillet@gmail.com>
In-Reply-To: <20220923100149.2647325-1-suagrfillet@gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Tue, 22 Nov 2022 10:10:46 +0000
Message-ID: <CAAYs2=hx49ahtY3pe1z241Vd1mRNZjc-oigubmKy0aGqg6T8ag@mail.gmail.com>
Subject: Re: [PATCH RESEND] riscv : select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
To: Guo Ren <guoren@kernel.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
Cc: guoren@linux.alibaba.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_101104_057379_37C43ABF 
X-CRM114-Status: GOOD (  13.30  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPiDkuo4yMDIy5bm0OeaciDIz5pel5ZGo
5LqUIDEwOjAz5YaZ6YGT77yaCj4KPiByaXNjdiBub3cgdXNlcyAtZnBhdGNoYWJsZS1mdW5jdGlv
bi1lbnRyeSB3aXRoIGR5bmFtaWMgZnRyYWNlIGFmdGVyCj4gdGhlIGBhZmM3NmI4YjhgIGNvbW1p
dCwgd2hpY2ggbWVhbnMgcmVjb3JkbWNvdW50IHNob3VsZG4ndCBiZSBjYWxsZWQKPiB0byBjcmVh
dGUgdGhlIF9fbWNvdW50X2xvYyBzZWN0aW9uIGJlZm9yZSB0aGUgdm1saW51eCBsaW5raW5nLgo+
Cj4gV2Ugc2hvdWxkIHNlbGVjdCBGVFJBQ0VfTUNPVU5UX1VTRV9QQVRDSEFCTEVfRlVOQ1RJT05f
RU5UUlkgdG8gdGVsbAo+IE1ha2VmaWxlIG5vdCB0byBydW4gcmVjb3JkbWNvdW50Lgo+CkhpLEd1
bzoKCkNhbiB0aGlzIHBhdGNoIHNxdWVlemUgaW50byB5b3VyIHYzIHNlcmllcyA/CgpUaGFua3Ms
ClNvbmcKPiBTaWduZWQtb2ZmLWJ5OiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+
Cj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jp
c2N2L0tjb25maWcKPiBpbmRleCBjMjJmNTgxNTU5NDguLjI1ZGI4Y2VhODc2YSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBAQCAt
MjQ2LDYgKzI0Niw3IEBAIGNvbmZpZyBBUkNIX1JWNjRJCj4gICAgICAgICBzZWxlY3QgSEFWRV9E
WU5BTUlDX0ZUUkFDRSBpZiAhWElQX0tFUk5FTCAmJiBNTVUgJiYgJChjYy1vcHRpb24sLWZwYXRj
aGFibGUtZnVuY3Rpb24tZW50cnk9OCkKPiAgICAgICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRS
QUNFX1dJVEhfUkVHUyBpZiBIQVZFX0RZTkFNSUNfRlRSQUNFCj4gICAgICAgICBzZWxlY3QgSEFW
RV9GVFJBQ0VfTUNPVU5UX1JFQ09SRCBpZiAhWElQX0tFUk5FTAo+ICsgICAgICAgc2VsZWN0IEZU
UkFDRV9NQ09VTlRfVVNFX1BBVENIQUJMRV9GVU5DVElPTl9FTlRSWSBpZiBEWU5BTUlDX0ZUUkFD
RQo+ICAgICAgICAgc2VsZWN0IEhBVkVfRlVOQ1RJT05fR1JBUEhfVFJBQ0VSCj4gICAgICAgICBz
ZWxlY3QgSEFWRV9GVU5DVElPTl9UUkFDRVIgaWYgIVhJUF9LRVJORUwKPiAgICAgICAgIHNlbGVj
dCBTV0lPVExCIGlmIE1NVQo+IC0tCj4gMi4yMC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
