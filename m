Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E83C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 08:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BHYv1HYQoPJ+9lT6tq4vTCHg2AA+FmiM8lfxFBmhiqw=; b=NHMe+4Dl9G1fhD
	MGdW3GdY4I/5ChSCnHfykLr9wggfgEO3xg65R7N/ibjP+r3MGjEL4DYdeR2KGu0PhyzGkhcNdLIKC
	J/+JN53KHfN8OagL2Thjtz00IezG8K3FIl0jIMa1Nuv3tMn32fBvSRcTAUC+6mlbCIFCuWYBiXwbM
	MlXweuVw9JkQDJZqkoqN8sAFYa1TzAACNFaJFhmYZwbbhHzuZCOniU3Mfg7aTcoYlf/y2ocWENoMV
	b2sdgBuP9Z50Qbxf5jSt9K8ZKjj4cB1CFYry11f6mv1KNPRAY/1FjhZUsTWfaeuWrit9Zmdy36bUs
	jG5GdwpKkQ8H2yIl7ZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMnGf-00DImU-AE; Wed, 23 Feb 2022 08:45:01 +0000
Received: from mail.olerise.pl ([46.183.184.59])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMnGb-00DIl7-Uz
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 08:44:59 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
 id 2C48A43D35; Wed, 23 Feb 2022 09:41:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
 t=1645605807; bh=ZNYiuZLXlxCdAPtstEG/gwJieB5RBwA/cHj1SZ3Mpl0=;
 h=Date:From:To:Subject:From;
 b=WEJ+t5Ggcqbu/KW9B9gsymP7XuErDa03a9s2XU4oAzmnTnNGWb5U4B58iCzUW9PQz
 j0OH96H/dpuRBZeaZ7cl9f1+WWH51fy+1nMG15k3m2wMma9I5ybGN2/ohEngLeNNbM
 gpyRiyhvMy1r9f3ud6yIkhnI2GIzqq2GHtVWhR5lvM3bwGieJdpWa6i9HiWJK98FxO
 hTwgHFlW3yyRxsaVsaIME0muOfUp606pq3sTmmK0kAktDfSUDZBRt6daCgd9jVFH10
 ocD4zEQSmp/B7CBq4CkFV0iwAtjp4JU/PElXDUw+zvkwJJkwN1WoU0DacBj+ipnnW1
 8cPlsaIgGCthg==
Received: by mail.olerise.pl for <linux-riscv@lists.infradead.org>;
 Wed, 23 Feb 2022 08:40:28 GMT
Message-ID: <20220223084500-0.1.1x.fiki.0.23bgwyioyc@olerise.pl>
Date: Wed, 23 Feb 2022 08:40:28 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rudzik"?= <mikolaj.rudzik@olerise.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Nap=C5=82yw_Klient=C3=B3w_ze_strony?=
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_004458_169015_CF8227FE 
X-CRM114-Status: UNSURE (   1.57  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWHFgmJ5bSBwb2luZm9ybW93YcSHIFBhxYRzdHdhIG8gbW/FvGxp
d2/Fm2NpIHBvenlza2FuaWEgbm93eWNoIHpsZWNlxYQgemUgc3Ryb255IHd3dy4KCldpZHppbXkg
emFpbnRlcmVzb3dhbmllIHBvdGVuY2phbG55Y2ggS2xpZW50w7N3IFBhxYRzdHdhIGZpcm3EhSwg
ZGxhdGVnbyBjaMSZdG5pZSBwb21vxbxlbXkgUGHFhHN0d3UgZG90cnplxIcgeiBvZmVydMSFIGRv
IHdpxJlrc3plZ28gZ3JvbmEgb2RiaW9yY8OzdyBwb3ByemV6IGVmZWt0eXduZSBtZXRvZHkgcG96
eWNqb25vd2FuaWEgc3Ryb255IHcgR29vZ2xlLgoKQ3p5IG3Ds2fFgmJ5bSBsaWN6ecSHIG5hIGtv
bnRha3Qgendyb3RueT8KCgpQb3pkcmF3aWFtCk1pa2/FgmFqIFJ1ZHppawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
