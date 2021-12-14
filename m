Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D722C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yx7xWbVrSB9VFRkBBRKqE+UFwxl1hqY4uNeicms5BqM=; b=TIANQpCfPDSjJI
	fzgRH5wbfXCPYzGnDq8VnpdNagLeFBqKyt7WTUi0ebMK95FMNzwBdeewzhyKyEDzBwDm0I6DL2U3m
	3CgWYayHzcltwAIobhgno0NXNNVSa7g/1oLmYRDUUjlLU7r2O2Ovh02mYJ/VeR4ec0sGTEy861X7p
	whwDVRiP1Ts39asywOJSXHGgSMzJGRxsSrTc0TvkH04oik0Um6MRFoLvhXLd6m/9J7rqM11IdwpDT
	KfzOqyRthmSJMiKjOQHlJQzCKEhZ/GUR01+NM2RGH7qcdh8VdK0kWTM2H/SkKqAVuzFo8GNmrbgKG
	RJeF3Ax9UgP6+5eiYOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx3FE-00D2Qm-0i; Tue, 14 Dec 2021 08:33:08 +0000
Received: from mail.thebizzie.pl ([192.236.147.111])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx3FB-00D2Pd-0S
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 08:33:06 +0000
Received: by mail.thebizzie.pl (Postfix, from userid 1002)
 id BE31218133F; Tue, 14 Dec 2021 08:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thebizzie.pl; s=mail;
 t=1639470783; bh=kU+//Lu71IqgcFfjayWXuIc0mZtoyrYJc2YuqyU8eS8=;
 h=Date:From:To:Subject:From;
 b=jGB6MDAP/w74hBDCJ1pSo/sBxyf/VO7HB2FlC1dF+pWx4O9lgQgc99aUMGaBjPy3n
 D9moYJPACx7Tc8hkFKnaan3lRr7sfoa7OMjxPfiZYIqmwPgO51MZPn/Nq7jjCaCqPr
 kXEhHtqw1RICJ/n82BYIsPURxodtY5dso71Fh4bAw3C5BAgQMgWTuq6imRs96w5rB+
 s7UvQsB9kvad+u6xT94aHQ1hF8p6oQK9I48q9H9EFSOb85VDI6B01Dy4s6naxXhcaQ
 RFIEzd0crfd4qIXAHEO9TPdNfNnCMj/oVpoIntbbJftzdGEFdTqGOThz4wPtsVofDt
 oD8hLGh9nS9Sg==
Received: by mail.thebizzie.pl for <linux-riscv@lists.infradead.org>;
 Tue, 14 Dec 2021 08:31:44 GMT
Message-ID: <20211214074500-0.1.7.25g.0.sk4le534rb@thebizzie.pl>
Date: Tue, 14 Dec 2021 08:31:44 GMT
From: "Mateusz Adamczyk" <mateusz.adamczyk@thebizzie.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.thebizzie.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_003305_198461_F2F94862 
X-CRM114-Status: UNSURE (   1.13  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCk1hdGV1c3ogQWRh
bWN6eWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
