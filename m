Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FE5C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 07:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6KbnX6Bk/lp/nIiTdOlDllAQ4ic+lBe4pMMGASiRjXI=; b=soF46fpp9h6EzE
	EyXdx/YZxxjeeuBheU9AmwuWcJ6LjPZie8chvFQhj0cZbVumbM1OVDdDi9qab3CIxCixGsT6LZ+MZ
	VWE1mNsf0uvOyJ0PtU0iwwWR/q7Ewv0nONjcZdIsF66rNmgsAM8/yYbeP2uago0gxr77ChNsvte1k
	W7Zho2KSwHMjQKQVOt342PMSdx89IDHCpkJ9dRQOKCywxnoPNz2ah0JByWPRHdRhVNr9XWQjbe8zi
	JmJXfXisgdmPiayv1RKddwDf4gDbzMmA4f2NHHMf9IuqikYdtXzq6sC+WkdFxFICYu9RCHriKQA9I
	4kwbShH+oyCY6gNZ6/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neBQl-00COoa-Ak; Tue, 12 Apr 2022 07:59:19 +0000
Received: from mail.growthmindset24.pl ([212.237.36.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neBNa-00CMzi-4O
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 07:56:03 +0000
Received: by mail.growthmindset24.pl (Postfix, from userid 1001)
 id D511588491; Tue, 12 Apr 2022 08:52:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growthmindset24.pl;
 s=mail; t=1649750068;
 bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
 h=Date:From:To:Subject:From;
 b=jBN5+atrhBMz6ePQ2sb3qwLUGdQFW4EXndL/54blUXPyJQF9kK2mFq+ZUtvEc80Rm
 frUDh19/8qadxD8JBtoX9seyoSfTWI3pyToJEoHRd5LisHDb6VyBs21o5bSuuTEODQ
 ZDEw4lRtEZKJvFxxN5zCjq7qz5l9yzxZ8y/uKGesJXxEy9G50upvVKXAuJ0POUeONK
 foZ7AI65g8PaytckfvE//7C883i7L4+h6WVeIiDMU3JG4jSMuVh2go+jVeeM3GtFT/
 1U0l/wJIA8KqY8uGw7rMuliwO0XsGWFVlJO+whbdTNOk8Jm+R36HvVTUxFC5iySG9j
 oD74CHMDsIqmg==
Received: by mail.growthmindset24.pl for <linux-riscv@lists.infradead.org>;
 Tue, 12 Apr 2022 07:50:49 GMT
Message-ID: <20220412073001-0.1.2w.d7pp.0.dtrovmrx52@growthmindset24.pl>
Date: Tue, 12 Apr 2022 07:50:49 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?=
 <przemyslaw.wroblewski@growthmindset24.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.growthmindset24.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_005602_379543_992E01B5 
X-CRM114-Status: UNSURE (   1.56  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sClByemVteXPFgmF3
IFdyw7NibGV3c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
