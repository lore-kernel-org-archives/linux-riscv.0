Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC447C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sgpk/U5u9bb/+M+eKufxz9GvAgU9NGSoML+9TChagys=; b=M/Y9E0udsl+xqJ
	Q11ITYM/ukJb0wXU2yLqfvOgTu+Ms4CEKO4bq0BdGZ12S9TvdHd630dvHd6yBV2z2hB6XGN2Ag8zO
	//x05tKmfIuewY7NDjQ0B+1D4HStBR2Z1HK68rVCONdFWb4P/rCkbzyeDIbz+ZG0+scgHYsD2Ry+9
	86iqNnSFCPEwb12O47wbD6qrMOOTICqBvml92cAM3Sj7TIMTGwt69Cawz7C68IkNQbz7Esrbf/AZ7
	4ITZ0g/TI6Dyzrrna1ll6nvuGbb01YMsaS8GgCP5yi6bJzHpsgQl3uHn9pM30B13iP3opD4GKxkB3
	212VHHthNZaPkb3WeLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Bsa-00FAYR-6d; Tue, 11 Jan 2022 07:47:40 +0000
Received: from mail.betterbiz.pl ([45.86.209.138])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Bs9-00FAQb-1d
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 07:47:14 +0000
Received: by mail.betterbiz.pl (Postfix, from userid 1001)
 id A7E3F82B4F; Tue, 11 Jan 2022 02:46:02 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=betterbiz.pl; s=mail;
 t=1641887232; bh=07NAgW1e0WiNB9zqagiM2BnwZfWBCpNa2E4+ccxBPgw=;
 h=Date:From:To:Subject:From;
 b=0QN1xUOYAllNicixDSOE/+oZxk5LiOp3AIWjsNudm+q+Ug3X952JJuwKsTnK3qguq
 wypbq2fnv8QG0jh3xM0FnzSEz4H+3YYhi71O5NnKcU/QqPPVjPT4nPFkcpBkpIwlQ8
 sbqVMLjc/5XNJxc8idddWSDH2Uo738x+DoT7l/It7enWHC8a/7c6udK3G4bdQGnjFU
 /UpamPJ9AJnxnQlERYFEci9Nd0sC/D3+j5T3O0B2rxKtw+pNEWlJs1cIcsQUEZa9gR
 Vk1tqGwYlgJcCap2XQP5WL1IxVs6yGlcVtrXmysoytpNVQdui1VwglvvHRN1r2DiN+
 2dT2uBlPSFZhQ==
Received: by mail.betterbiz.pl for <linux-riscv@lists.infradead.org>;
 Tue, 11 Jan 2022 07:45:59 GMT
Message-ID: <20220111024500-0.1.o.zhl.0.7zuiv4go3e@betterbiz.pl>
Date: Tue, 11 Jan 2022 07:45:59 GMT
From: "Jakub Daroch" <jakub.daroch@betterbiz.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.betterbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_234713_117272_198EAF47 
X-CRM114-Status: UNSURE (   1.07  )
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

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkpha3ViIERhcm9j
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
