Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC659C761A6
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 08:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zK1cSD/RW6vVE8EI6ooDXeUIEirmL2lT2iv3LhWDwu4=; b=vBSN8AJ4BPBaQd
	FFbSUVIG7ytrGm3dnMqv2+lMQnhimnQSQF7DBirikHPCjldmBIVPJqOSY5QpbULy9nk6MLjC3ZX/A
	RE2qoofDzdhwbIb1P5UpmW3Ve18KXF7nFNgrC2F/BWQ7eFjczy4TEnJ1yZpcZpVKZpKhSyjPddFV2
	tBfH8Oa+UjR1zJi8+l6S4v/uQpDTYoE1mJtEcEDD0ji5IzYhJzHXZQYnZPdGJkEagLzYyiLd+7TxT
	WaSWvN7mDK+98XRe+ZaRRylpM6wN5Pa+aZARGDqBEysoziHhHI0dkSegB8NLY7g8mB66uc++ODRn7
	3M0qlhon9Jz8+m4SFrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFAN-00ESOc-2W;
	Mon, 03 Apr 2023 08:03:51 +0000
Received: from mail.feshiecree.pl ([89.40.114.103])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFAL-00ESNy-0q
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 08:03:50 +0000
Received: by mail.feshiecree.pl (Postfix, from userid 1001)
	id 3A5EF84E07; Mon,  3 Apr 2023 08:51:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=feshiecree.pl;
	s=mail; t=1680508309;
	bh=hFxZwVw4rIL+JwfEOGI47p+fdoVOAeqVswP6NWoHSHQ=;
	h=Date:From:To:Subject:From;
	b=S5ZUGppm+6E5N5kg6m7szWst9oyX5d5M9n5C2HYYmM109WHdIahXpaWHovEqkfItP
	 X3PYQN0ut26xshLN/p/AYU0GsLqtleFJHLaXL5E8QaWMqksUknCLC7q5HHIder/Hql
	 71Mr36WvdnpmIOBOyzPlpK7gUkLV28+qQ8P6vV0u8hv1R5MsAR25mOBAuDHyxTWfYX
	 IWJFzANelnJlRsMxVHFFTJjE7oMLDhR+lzvvMICK4GAm3L7w0IXVBhK5pp8SnLVbnY
	 hotQkGzHr4g8OEU4eI+YeRn62ll1m00//BO/60QZphf147pbtLd/K59n7pteb1nDic
	 owl8946eZynmA==
Received: by mail.feshiecree.pl for <linux-riscv@lists.infradead.org>; Mon,  3 Apr 2023 07:50:19 GMT
Message-ID: <20230403074501-0.1.1s.56jf.0.bm3be2dhv5@feshiecree.pl>
Date: Mon,  3 Apr 2023 07:50:19 GMT
From: "Krystian Wieczorek" <krystian.wieczorek@feshiecree.pl>
To: <linux-riscv@lists.infradead.org>
Subject: W sprawie samochodu
X-Mailer: mail.feshiecree.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_010349_443224_07DFA486 
X-CRM114-Status: UNSURE (   1.30  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWVsaWJ5xZtteSB6YXBld25pxIcgUGHFhHN0d3Uga29tcGxla3Nv
d2Ugcm96d2nEhXphbmlhLCBqZcWbbGkgY2hvZHppIG8gc3lzdGVtIG1vbml0b3Jpbmd1IEdQUy4K
ClByZWN5enlqbmUgbW9uaXRvcm93YW5pZSBwb2phemTDs3cgbmEgbWFwYWNoIGN5ZnJvd3ljaCwg
xZtsZWR6ZW5pZSBpY2ggcGFyYW1ldHLDs3cgZWtzcGxvYXRhY3lqbnljaCB3IGN6YXNpZSByemVj
enl3aXN0eW0gb3JheiBrb250cm9sYSBwYWxpd2EgdG8ga2x1Y3pvd2UgZnVua2Nqb25hbG5vxZtj
aSBuYXN6ZWdvIHN5c3RlbXUuIAoKT3JnYW5pem93YW5pZSBwcmFjeSBwcmFjb3duaWvDs3cgamVz
dCBkemnEmWtpIHRlbXUgcHJvc3RzemUgaSBiYXJkemllaiBlZmVrdHl3bmUsIGEgb3N6Y3rEmWRu
b8WbY2kgaSBvcHR5bWFsaXphY2phIHcgemFrcmVzaWUgcG9ub3N6b255Y2gga29zenTDs3csIG1h
asSFIGRsYSBrYcW8ZGVnbyBwcnplZHNpxJliaW9yY3kgb2dyb21uZSB6bmFjemVuaWUuCgpEb3Bh
c3VqZW15IG5hc3rEhSBvZmVydMSZIGRvIFBhxYRzdHdhIG9jemVraXdhxYQgaSBwb3RyemViIG9y
Z2FuaXphY2ppLiBDenkgbW9nbGliecWbbXkgcG9yb3ptYXdpYcSHIG8gbmFzemVqIHByb3Bvenlj
amk/CgoKUG96ZHJhd2lhbQpLcnlzdGlhbiBXaWVjem9yZWsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
