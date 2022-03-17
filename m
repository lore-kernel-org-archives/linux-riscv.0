Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3B6C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 08:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BHYv1HYQoPJ+9lT6tq4vTCHg2AA+FmiM8lfxFBmhiqw=; b=CZl2LA4YzNb3Ac
	lWj0IMeixaWKpzZJOWICWlU5m2OMjaLN1tE1QbjrDP/sGbgQXQeIwglMDc5aybqrZpXhIZ7cBv7bW
	p5vyN1B/tFL4HuauMDJEZmFsx+Uq4ffriD6xxMrUoUtQgf3K1/rsZUcPUwfjXQWsKw21DFXw0onF7
	Bd8XKiXDJzrSULhgpvG5+TsskwCj+p2H2s9HD2XoRqKr1uKM+dgcJ+0dC7rGuV4nVYFgOpI9hV2Jp
	vJqwtrbw2snaaWki/q3OunQ8Ih6CP7e+Qcav+9sQA/3px8Tmyy4PNwDyiKZnYCFIMTJOU2x/8Dsxo
	Dw6nxK5jy+nbEPQukQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUljm-00FPRg-K6; Thu, 17 Mar 2022 08:44:02 +0000
Received: from mail.olerise.pl ([46.183.184.59])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUljc-00FPNi-7K
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 08:43:53 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
 id 651B14477D; Thu, 17 Mar 2022 09:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
 t=1647506541; bh=ZNYiuZLXlxCdAPtstEG/gwJieB5RBwA/cHj1SZ3Mpl0=;
 h=Date:From:To:Subject:From;
 b=B81Rp1/WQsLGDbUhpW7+/Mr81x7P+8r5fNAqQjMKyTdjNa5DjGyjsx9P+NfEfoRIa
 2KoApDgh/wFxK15DYyXxdXxQFldQM8yjwiPM/OGsjlXBA0VKmp6i+PfgEl2E2fvqUp
 l2fMH/vsNYCdmxmHNctfmr+WGAEyof8W4G6uhEDH/rYJnGnfGR5LudHj80wOcS47kt
 SJldKDQw7A7o4PCzadZD+cMOys9tAcIIocamDbn3trGZODJBOmPT74jgYTbY8egqay
 RDmbnj2Uvu/xLJte+W8lCKUkW7asaPkJnW0JUhsnLQ0zDL4F7YeZhsfPh7RsytERnF
 Ntx/cGX+V/vWQ==
Received: by mail.olerise.pl for <linux-riscv@lists.infradead.org>;
 Thu, 17 Mar 2022 08:40:21 GMT
Message-ID: <20220317084500-0.1.2d.rufj.0.w5kzc4f221@olerise.pl>
Date: Thu, 17 Mar 2022 08:40:21 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rudzik"?= <mikolaj.rudzik@olerise.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Nap=C5=82yw_Klient=C3=B3w_ze_strony?=
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_014352_436312_FAC1C400 
X-CRM114-Status: UNSURE (   0.97  )
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
