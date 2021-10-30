Return-Path: <SRS0=We8W=PS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75729C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 18:05:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3746060E90
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 18:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3746060E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ts3card.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:From:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8AqjkufrcjowQQDBanVpUMH2YN6Q2HeLiSiELoxkwCM=; b=RqVoDyOCjM+mhy
	h3HsvCAy8TZfdkjSFFMZbetusqBDVsJPIj9iJnaNrzWXpmmLAvewuo2YzsdJklyFAfuwshx4PuhUa
	VFje77vRTD+Jnvp9kqfvbRlILelsDwwbBr/AF5+7EJyt05/b2dHshPXXhIc9BlxjDUDQUYNvUiwkz
	R0XyVuXeRTqFezTKlq5fvJ+XNhgrz8dezDdHAl/GGWEEL3E/F2OlqEwti/ZS0uOySqMnSQAyBuJvy
	kJhoc+rk57TACxycVGnDp+uekIhrQKKbayBDPyfFqqr443OL+WyzllTILVWgR+jb8hze2rjXqBxZO
	gWicCu+m0JimmdA9InQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgsiy-00DP9G-2z; Sat, 30 Oct 2021 18:05:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgsiw-00DP8a-M9
 for linux-riscv@bombadil.infradead.org; Sat, 30 Oct 2021 18:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Subject:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=TAmmRRp70bueA4xXNdkUu6+3jmjKmQGfBTKe8CU+pJo=; b=tgIbsIi0BE5UNYwDi7YNmpTZvy
 F9vuZkLyelo6/2hoBZxv9c2Q1qS0YLhIT1HaM5v0iehTwxbPKL66KxPDwTH+jkW9MwlLiHUt43UVV
 nagD+aXAz02aXHsVgOe7HsG3MY9z4K0e6PStBtcJM848wZJdwLNhqYEGh6DD5ctun3vME6glduVie
 Svckh5GmDDB/D2CfZl1q53FeT/OzBWHG95ZFPQh2A0aP9KEHPqfgMOklWpEvvoIPktK0OKr1HqnCg
 uqm5qM2OdYzIkW/1stqOh/fIaJLEYyJSTiFGgRh2WBi8PLaBWf2D6bTGR2TB8w9T0fI18OkUMqRuq
 jCkSunKw==;
Received: from [123.58.198.57] (helo=ts3card.com)
 by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgshf-002ZKX-IB
 for linux-riscv@lists.infradead.org; Sat, 30 Oct 2021 18:04:19 +0000
Message-ID: <20211031010339878428@ts3card.com>
From: =?utf-8?B?44OI44Oo44K/44OV44Kh44Kk44OK44Oz44K55qCq5byP5Lya56S+?=
 <info@ts3card.com>
To: <linux-riscv@lists.infradead.org>
Subject: =?utf-8?B?VFMzIFRTIENVQklDQ0FSROOCq+ODvOODieOAkA==?=
 =?utf-8?B?6YeN6KaBOuW/heOBmuOBiuiqreOBv+OBj+OBoOOBleOBhOOAkQ==?=
Date: Sun, 31 Oct 2021 01:03:28 +0700
MIME-Version: 1.0
X-mailer: Xoyze 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211030_190400_085727_3400C15F 
X-CRM114-Status: UNSURE (  -0.89  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB
4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB
4pSB4pSBDQoNCuKYheOAgi46KjpUUyBDVUJJQyBDQVJE5Lya5ZOh5YCL5Lq65oOF5aCx5aSJ5pu0
44CC4piF44CCLjoqOg0KDQrilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIENCg0KDQpUUyBDVUJJQyBDQVJE5Lya5ZOh5qijDQoNCuOB
k+OBruOBn+OBs+OBr+OAgVRTIENVQklDIENBUkRF44Oh44O844Or44K144O844OT44K544KS44GU
5Yip55So44GE44Gf44Gg44GN44GC44KK44GM44Go44GG44GU44GW44GE44G+44GZ44CCDQoNCuW9
k+ekvuOBr+OCu+OCreODpeODquODhuOCo+OCt+OCueODhuODoOOBruWkp+W5heOBquOCouODg+OD
l+OCsOODrOODvOODieOCkuWun+aWveOBl+OBpuOBhOOCi+OBn+OCgeOAgeWAi+S6uuaDheWgseOB
rg0K5YaN6KqN6Ki844GM5a6M5LqG44GZ44KL44G+44Gn44CBVFMgQ1VCSUMgQ0FSROODoeODs+OD
kOODvOOBruOCteODvOODk+OCueOBr+OBmeOBueOBpuWBnOatouOBleOCjOOBvuOBmeOAgg0KDQrm
nKzml6XjgYvjgonjgIFUUyBDVUJJQyBDQVJE44Oh44Oz44OQ44O844Gu44Om44O844K244O844GM
6YCa5bi45L2/55So44GX44Gf44GE5aC05ZCI44Gv44CBMjTmmYLplpPku6XlhoXjgasNCuS7peS4
i+OBruWAi+S6uuaDheWgseaUueWWhOiqjeiovOOCkuihjOOBhuW/heimgeOBjOOBguOCiuOBvuOB
meaJv+iqjeW+jOOBq+OBruOBv+S9v+eUqOOBp+OBjeOBvuOBmSANCg0K44Ot44Kw44Kk44Oz6KqN
6Ki8Omh0dHBzOi8vbXktdHMzY2FyZC1jb20ucHFmdW52LndvcmsNCg0K44GT44Gu44K144O844OT
44K544Gv44CBVFMgQ1VCSUMgQ0FSROODoeODjuODkOODvOWwgueUqOOBrumAmuefpeOCteODvOOD
k+OCueOBp+OBmeOAguOBk+OBruODoeODvOODq+OBruWGheWuuQ0K44Gr44GU5rOo5oSP44GE44Gf
44Gg44GN44CB5LiN5b+F6KaB44Gq57Sb5aSx44KS6YG/44GR44Gm44GP44Gg44GV44GE44CCDQoN
CuKUj+KUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUkw0KDQrjgIDilqDmnKzjg6Hjg7zjg6vjga/pgIHkv6HlsILnlKjjga7jgZ/jgoHjgIHjgZPj
gaHjgonjga7jg6Hjg7zjg6vjgqLjg4njg6zjgrnjgavjgZTov5Tkv6HjgYTjgZ/jgaDjgYTjgabj
goINCuOAgOOAgOWvvuW/nOOBr+OBhOOBn+OBl+OBi+OBreOBvuOBmeOBruOBp+OBlOS6huaJv+OB
j+OBoOOBleOBhOOAgg0K44CA44CA44Gq44GK44CB5pys44Oh44O844Or44Gr44Gk44GE44Gm44GK
5b+D5b2T44Gf44KK44GM44Gq44GE5aC05ZCI44Gr44Gv44CBDQrjgIAg44GK5omL5pWw44Gn44GZ
44GM44CB5LiL6KiY44GK5ZWP44GE5ZCI44KP44Gb5YWI44G+44Gn44GK6Zu76Kmx44Gr44Gm6YCj
57Wh44KS44GK6aGY44GE44GE44Gf44GX44G+44GZ44CCDQoNCuOAgD09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg0K44CA4pag
55m66KGM77yaVFMgQ1VCSUMgQ0FSROOAjOODhuOCo+ODvOOCqOOCueOCreODpeODvOODk+ODg+OC
r+OCq+ODvOODieOAjQ0K44CA44CA44CA44CA44CAIGh0dHBzOi8vdHNjdWJpYy5jb20vDQrjgIDj
gIDjgIDjgIDjgIDjg4jjg6jjgr/jg5XjgqHjgqTjg4rjg7PjgrnmoKrlvI/kvJrnpL4NCuOAgOOA
gOOAgOOAgOOAgOOAkjQ1MS02MDE044CA5oSb55+l55yM5ZCN5Y+k5bGL5biC6KW/5Yy654mb5bO2
55S6NueVqjHlj7cNCg0K44CA4pag5pys44Oh44O844Or44Gr44Gk44GE44Gm44Gu44GK5ZWP44GE
5ZCI44KP44Gb77yaDQril49UT1lPVEEsIERBSUhBVFNVLCDjgrjjgqfjg7zjg6DjgrksIOODiOOD
qOOCv+ODrOODs+OCv+OCq+ODvCBGREPjga4NCuOAgOOAgOOAgOOAgOOAgOOAgFRTIENVQklDIENB
UkQsIFRTIENVQklDIFZJRVcgQ0FSROOCkuOBiuaMgeOBoeOBruaWueOBr+OBk+OBoeOCiQ0K44CA
44CA44CA44CA44CA44CA44Kk44Oz44OV44Kp44Oh44O844K344On44Oz44OH44K544KvDQrjgIDj
gIDjgIDjgIDjgIDjgIBbIOadseS6rCBd44CAMDPvvI01NjE377yNMjUxMQ0K44CA44CA44CA44CA
44CA44CAW+WQjeWPpOWxi13jgIAwNTLvvI0yMznvvI0yNTExDQooOTowMO+9njE3OjMwIOW5tOS4
reeEoeS8kSDlubTmnKvlubTlp4vpmaTjgY8pDQril4/kuIroqJjku6XlpJbjga7jgqvjg7zjg4nk
vJrlk6HjgZXjgb7jga/jgIHjgYrmiYvmjIHjgaHjga7jgqvjg7zjg4nliLjpnaLoo4/jgavoqJjo
vInjga4NCuOAgOOAgOOAgOOAgOOAgOOAgOOCq+ODvOODieOBq+mWouOBmeOCi+OBiuWVj+OBhOWQ
iOOCj+OBm+mbu+ipseeVquWPt+OBq+OBiuOBi+OBkeOBj+OBoOOBleOBhA0K44CA44CA44CA44CA
44CADQrilJfilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilJsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
