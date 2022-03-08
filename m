Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613C1C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 08:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BHYv1HYQoPJ+9lT6tq4vTCHg2AA+FmiM8lfxFBmhiqw=; b=mDngR+xn35wI05
	k7uG59jTzUCG8lq7oNFaFq54aWPAaRkD9bMlSZ6jVn6nh/D7twPObHnOLKXbIrvs/fUhz+7FzAXlt
	aoR0feNXg9sIqKZu3MwUDIAAXRSxNfCyFq5IQP5ARhdqzH5bmsmeS8cug5TAw9HuC5F05l5ovbnVF
	q+B60/QFB+BUyDrqqf13V0pSv+sFfmte0nSP6SXJpv+nom9mo7F4XOVzf6wgoYLDOfXPU3lkLDOHJ
	JnySPdhRBpfQLXEuX2Wo+h0J5VNUkoKrFQoQnOlHEZ7AVeBj1LSfc48OGd9DyPK7YqXNJb3kSEsNC
	3VG4NlRSdv/fyiONHf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRVWX-003KiK-BC; Tue, 08 Mar 2022 08:48:53 +0000
Received: from mail.olerise.pl ([46.183.184.59])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRVWT-003KZu-7k
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 08:48:51 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
 id 2FE8B43D5F; Tue,  8 Mar 2022 09:45:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
 t=1646729178; bh=ZNYiuZLXlxCdAPtstEG/gwJieB5RBwA/cHj1SZ3Mpl0=;
 h=Date:From:To:Subject:From;
 b=11joDwWT2h89dCm+pGAA03pIGZpDSaVcwK0SO3VHwZ4aApIIEMf7ZmM0tBWeMdeQ6
 cGQmvNcUlnAjgEOqbsBN66dOiEc0Pr445twN6VN61JUg5bZ8DRUEpX9w50x6jmAJzm
 c6JLAHvpKZ/wiOYaM7+aRgMZjX73P/7bKBwawnXqD3h+vhCvOtqlKEyBM3Lifkt/pE
 BldN8BeN0rFk3WEV4RergYPPnpsAhNy7vczSVWdHrlaykk0+k8qXoK7FsdlJUGo4p/
 JBQqJkfESM0Jf5x0Y2QLiHpr0hYqem3VPsEHAvWdUVKORQD94im4qfH9y4Dk98QPKd
 IBIDBIMh2NirA==
Received: by mail.olerise.pl for <linux-riscv@lists.infradead.org>;
 Tue,  8 Mar 2022 08:45:41 GMT
Message-ID: <20220308084500-0.1.26.msaa.0.4nxpp6kn32@olerise.pl>
Date: Tue,  8 Mar 2022 08:45:41 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rudzik"?= <mikolaj.rudzik@olerise.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Nap=C5=82yw_Klient=C3=B3w_ze_strony?=
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_004849_482831_359D9E89 
X-CRM114-Status: UNSURE (   1.58  )
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
