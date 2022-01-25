Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929BBC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 09:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZzlEzF5nLDaDjlfd5i8drIjL9GvO6zemPhHvK72zGIs=; b=YEuF8NAyhUFxd2
	fmewsIJwtWS1dAG66FsxQMAA6/mvrYAd5Ah7eZFJti7AjJiyHKh1WlefXWj4pctpl62Y22mRJRMRf
	Jkg/CGmWRVF1rl81KAGaKRPu5z7GuW3ec+Ix7FuIYbFhw0lsJq7UaOfymi1J0agmTR5Kl3X6p32E6
	G45LGx/j99+9R5/zIj/SFGk5qT7iRrvDV9s3R59yXgizkq61vehSMyGVk6QeDVLrxUk5w+roIWyam
	m+2gkL8dxqXe3ED2hQy0pW0Jv93mxBS/r0xhTgV8vrBUaMJUrjAXDHaAy+LjG54WsaUzf06M8Y2oj
	Bpqn9IB7715pKFMgueOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCIBJ-007Am7-7j; Tue, 25 Jan 2022 09:32:05 +0000
Received: from mail.belongsenergy.pl ([185.45.112.191])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCHqM-0071DZ-7t
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 09:10:27 +0000
Received: by mail.belongsenergy.pl (Postfix, from userid 1001)
 id D8E10266ED; Tue, 25 Jan 2022 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=belongsenergy.pl;
 s=mail; t=1643101824;
 bh=JAEkA4FCBmQ7T7M+WVau75EdqeDf4MEEr9hE2/l61BA=;
 h=Date:From:To:Subject:From;
 b=QrteaslqAingEEN9qpCtKFLJe8Ws2IfRTC6fLjsP5rGvQXbDIO/aIoWG+oKoJ/QyI
 sa55JRjuMBIOVRFDK88SitWucK5UAAItVRio8hrlQwNjU4cbOR7/e5YE7yAkrvK0Uy
 leA5RbtX2OYuTZsK45/OnC8V/gGw2JjYt1UHwVX9GoxkDQOoAzIQvxZXi+8AykZWlk
 D9xqutq0rJ5h5XcgT87Rf/YbaYfi6Uk5/R/wVoez4OayGNWy6cGAuR1y5/SCeFcfAb
 Xc+7z5cuSHIK8enbj79KyfDT47CycacD4euJk9WWCf2Hyat314ciye3Jij8//4PO3V
 D6LoJnuIK3stA==
Received: by mail.belongsenergy.pl for <linux-riscv@lists.infradead.org>;
 Tue, 25 Jan 2022 09:10:08 GMT
Message-ID: <20220125074500-0.1.7.2n9.0.7i1h1wtc3z@belongsenergy.pl>
Date: Tue, 25 Jan 2022 09:10:08 GMT
From: "Maciej Nitycz" <maciej.nitycz@belongsenergy.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.belongsenergy.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_011026_440061_FD9A9BF0 
X-CRM114-Status: UNSURE (   1.51  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCk1hY2llaiBOaXR5
Y3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
