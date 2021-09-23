Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FE9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 10:10:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0815B60F70
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 10:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0815B60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0BQnBLlmCdR4jd0vpimpUbRPgYt17t1cjHts9dHO9k=; b=QSCqR6g6/LjiBMzLYv6XmnQGpr
	1WqY65Z+NM7e+rdHOv9sfvhWN1sKLFeY9dIgsrT6QDcmS+okRXdCW0YMhkovNVsHJcnW5/4zSs8v+
	kQsE0nyt1GH+n1FZMjLamE4a1YbQ4eQyH5eDN/P4cdvaa2OYduUQmT0K3yvx0g8YtpjEjo+7RqqEt
	MeiR/DmZCLvbqFwlqfXIdfZB1Ch6rkRJs3/0F6X+f6wZx0u3CsJ+E1nO3ZO3umDFrUy9n6EdOn1vm
	6OyU61n4Vhd+5rZ/E7Z98ur3BoY5wV31p0pGXlswHGZOzTtPhIDR0S4BEIqDA685fEndJ2hbqt+AT
	Xqd1dSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTLfw-00AsX2-DE; Thu, 23 Sep 2021 10:09:56 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTLft-00AsWH-Ew
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 10:09:55 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 18NA9pp0039044
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 13:09:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1632391786; x=1634983786;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8uLEPirSzFXXJhghyMD5pFq6MZ0M2Si7Jy50+8SWWM4=;
 b=TaHoTfQ0wyI13DueDKuviTjMXAm96gHwikesLSW0hTjKYm30LVFqwiR1/lTiqbO7
 Bin2Roe2HMDmT2umcVNeRd2GBAi5B7Awst3QMEZSqNMsYuCyXVsoO2XKljEMQ9Dl
 jMFzVi5mpTIvhs8uxH37znGrpCWoe5Oigpypp7XiUxDaMIzuF9Gmz9ql5PxP8ZFE
 Tw3Ep/JXFhauUIMR/I6CkOBxbdJWLVZ2/UYAS0HJJDeWC+bol4oa8/aNSpgZ+fw7
 tMlMfkiJgW6ubxq5rU4SPnlmlfSMdT7I7KT6K4xVbwKgK/3usun+J0yAg519fYNv
 bnuxiuRtsgpPkHz1Oiacfw==;
X-AuditID: 8b5b014d-ba8f670000005d46-40-614c526a5842
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 70.5C.23878.A625C416; Thu, 23 Sep 2021 13:09:46 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 23 Sep 2021 13:09:45 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Anup Patel <anup@brainfault.org>,
 Guo Ren <guoren@kernel.org>, Anup Patel <anup.patel@wdc.com>, Atish Patra
 <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, Christoph
 Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>, wefu@redhat.com,
 =?UTF-8?Q?Wei_Wu_=28=E5=90=B4=E4=BC=9F=29?= <lazyparser@gmail.com>, Drew
 Fustini <drew@beagleboard.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>,
 Greg Favor <gfavor@ventanamicro.com>, Andrea Mondelli
 <andrea.mondelli@huawei.com>, Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu
 <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, Allen Baum
 <allen.baum@esperantotech.com>, Josh Scheid <jscheid@ventanamicro.com>,
 Richard Trauben <rtrauben@gmail.com>
Subject: Re: [PATCH] riscv: Add RISC-V svpbmt extension
Organization: FORTH
In-Reply-To: <CAAeLtUDu0yaDBcuC06nX1WUQC9k4eNuWjvAFrpkP_h0nf5BZAw@mail.gmail.com>
References: <20210923072716.913826-1-guoren@kernel.org>
 <6d7b1668c1f562a5ef426bb2519f9784@mailhost.ics.forth.gr>
 <CAAhSdy0YDP3Nk8N9fnrKgS+3Rjt=5tLCh20upmUGK9SK67nNvg@mail.gmail.com>
 <0861cc74d3886e685e9aa5d13ddcd781@mailhost.ics.forth.gr>
 <16de95480d279b086cf0c612461e4235@mailhost.ics.forth.gr>
 <CAAeLtUDu0yaDBcuC06nX1WUQC9k4eNuWjvAFrpkP_h0nf5BZAw@mail.gmail.com>
Message-ID: <88696248a0c19a5dff660354b837514d@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEKsWRmVeSWpSXmKPExsXSHT1dWTcryCfRYM4RPosnh9rZLKYdOMRu
 0TphN4vFkw8T2SxaPrxjtfg76Ri7xaIV31ksluyUttjzag+7xYXmHkaLeyuWsVvs7p/DYrH9
 /Hc2ixd7G1ksjj/axWKxcvVRJosLjTfZLS6vns9k8fzUMTaLS1+usVhc3jWHzWLb5xY2i5Xr
 jjFbzPjxj9Gi+d05doutG9cxWnSvrLY4ueEAo8WapVMZLVr2T2Gx+HnoPJPFwtfz2B0UPF61
 PWPy+P1rEqPHu9/LGD2m/j7D4rGm8zWTx6yGXjaPO+fOs3lseLSa1eP/oZUsHjtn3WX3WLCp
 1KPlyFtWj4ebLjF5bFrVyeax86Glx+Yl9QESUVw2Kak5mWWpRfp2CVwZHWsb2Au2slbsnjmN
 sYFxNksXIyeHhICJxNwF79m7GLk4hASOMkoc+vqeDSJhKjF7bycjiM0rIChxcuYTsAZmAQuJ
 qVf2M0LY8hLNW2czg9gsAqoSuz99YwKx2QQ0JeZfOghWLyKgJ3H4/C4WkAXMAjs4JTb8Byni
 4mAQuMEocW7XarBJwgLmEm+/NrCD2PwCwhKf7l5kBbE5BQIlbl34BbZBSOAbk8StR2IQF7lI
 /P3wmRniUhWJD78fAPVycIgC2ZvnKk1gFJqF5O5ZSO6eheTuBYzMqxgFEsuM9TKTi/XS8otK
 MvTSizYxgpMNo+8Oxtub3+odYmTiYDzEKMHBrCTC+/mGV6IQb0piZVVqUX58UWlOavEhRmkO
 FiVxXl69CfFCAumJJanZqakFqUUwWSYOTqkGJu13+r2T1Jg4jTx+35uUxGpyek9L8+W0fot6
 bwF2g9AnG9Z4pp1YrHvqctRhr/OZc9Nsr/dOzde8e78k/Zzu9ZZlM2pDV2V/eBdy1Vp7rt1+
 IaOlfUZfw18tU//YVse1YOKVO3KBn+7qTo2ukbYWtzGL1/yv36CaaiFWL3r54I+NJzcvlcj8
 nH1nfm+I8kWNuKtWElu29/U+Zbe6VLGkjC3d76pGpsSrN0INJ/luxs87lhe5fPv8Rwt+rJVW
 j4kpv+g1uziwQvcN62dX5mVLdfs3tzPmTCqozL/xzuyqyhWlPblzvbknsxQdP+Du/+nvqX+F
 D74qXH0955aw96fzWdams+tVxKqVj/7qev7IXomlOCPRUIu5qDgRAP/jkDSlAwAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_030953_900263_AAD1D22E 
X-CRM114-Status: GOOD (  10.07  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMS0wOS0yMyAxMzowNCwgUGhpbGlwcCBUb21zaWNoIM6tzrPPgc6xz4jOtToK
PiAKPiBIb3cgaWYgd2UgZXhwYW5kIHRoaXMgdG8gYSBtbXUgc3Vibm9kZSBpbiBjcHVAeCBhbmQg
YWRkIGEgYm9vbGVhbnMgZm9yIAo+IGFkb3JubWVudHMgbGlrZSBzdm5hcG90IGFuZCBzdnBibXQ/
Cj4gVGhlIG9sZGVyIG1tdS10eXBlIGNvdWxkIHRoZW4gdHJlYXRlZCB0byBpbmRpY2F0ZSBhIG1t
dSB3L28gYW55IAo+IGFkb3JubWVudHMgc3BlY2lmaWVkLiAgSSBhbSBhd2FyZSB0aGF0IHRoaXMg
Z2VuZXJhdGVzIGFuIGFkZGl0aW9uYWwgCj4gcGFyc2luZy1wYXRoIHRoYXQgd2lsbCBiZSBtYWlu
dGFpbmVkLCBidXQgaXQgd2lsbCBhbGxvdyBmdXR1cmUgCj4gcHJvcGVydGllcyB0byBiZSBncm91
cGVkLgo+IAo+IGNwdUAwIHsKPiAuLi4KPiBtbXUgewo+IHR5cGUgPSAicmlzY3Ysc3YzOSI7Cj4g
c3VwcG9ydHMtc3ZwYm10Owo+IH0KPiAuLi4KPiB9CgpJIHdhcyBhYm91dCB0byBwcm9wb3NlIHRo
ZSBzYW1lIHRoaW5nLCB3ZSBjYW4gZG8gdGhpcyBub3cgd2l0aG91dCAKYnJlYWtpbmcgYmFja3dh
cmRzIGNvbXBhdGliaWxpdHksIHdlIGRvbid0IHJlYWxseSB1c2UgbW11LXR5cGUgcHJvcGVydHkg
CmF0IHRoaXMgcG9pbnQsIHdlIGFyZSBlaXRoZXIgc3YzOSBvciBub21tdS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
