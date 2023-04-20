Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D52DC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 08:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zK1cSD/RW6vVE8EI6ooDXeUIEirmL2lT2iv3LhWDwu4=; b=mdbPcqYW75elvc
	gZ/wPi2mviHFw6SMBg+M68TUG3/Y5enhhFR3G0J+3kHWltXMJ7GZ7rUUsGeKy5B0EKulHO4p3PDAK
	9R3nFf1TH+XjKkChO96JI2V0w/ap+K6Y7Xwi9Kkh9UnINgZdqwVu+HsgK2DSrfGHzHSTWCp6m2UCw
	7g4/Er4AX1+KRyniMUBQb0mZHczx6VZqIAGzew0YJir1FvUoeHihYlDYwbvtBnCzXbhtIKTruirgU
	evuY7InNw5O++/wPyYX8852UuQUMpXV6nelN8LeJdYW7vffLMp/4gK/Q7oCDIBlEBX8/DYpG8eJd2
	TcPmMdH1IO+MnSyK/VtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppPU5-007NZZ-1H;
	Thu, 20 Apr 2023 08:17:41 +0000
Received: from mail.feshiecree.pl ([89.40.114.103])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppPU2-007NYH-24
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 08:17:39 +0000
Received: by mail.feshiecree.pl (Postfix, from userid 1001)
	id EC5E68B13A; Thu, 20 Apr 2023 09:16:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=feshiecree.pl;
	s=mail; t=1681978611;
	bh=hFxZwVw4rIL+JwfEOGI47p+fdoVOAeqVswP6NWoHSHQ=;
	h=Date:From:To:Subject:From;
	b=tdKE2mtB0JNtjWMeusFmK/U5ZT5T1ykpSMhq57hn181/kfvnP0CR2q6U9HoTekPwp
	 cT9G68DXFkgQOGG2yXroN+Uoc8IDzoDYKpLZL3zN3SJyRLmoVHmTbmPt8veRHay+Qs
	 VPtZzo3FS1lZHQ7DwVcXNtztBQ4NHmKosFlWBJS4tCsK60vPoVLsRTAdF7pqM3UbXy
	 IIX+w1nUKPcC0w9QURcjj+4tAM7ZOK2pW0ZzpMqxeiSB0WMgLm9WN4ul9u4a2O1FOP
	 bDrX3UIsLD9EPZdlsJuVuT1oyr0ng1xMQ3GlnNu1t6NvFenN/nFvYF1sjbHheRDDTD
	 eYrCThLbELOOA==
Received: by mail.feshiecree.pl for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 08:16:06 GMT
Message-ID: <20230420074501-0.1.25.d776.0.mabg8dok5b@feshiecree.pl>
Date: Thu, 20 Apr 2023 08:16:06 GMT
From: "Krystian Wieczorek" <krystian.wieczorek@feshiecree.pl>
To: <linux-riscv@lists.infradead.org>
Subject: W sprawie samochodu
X-Mailer: mail.feshiecree.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_011738_818055_91CE9BAD 
X-CRM114-Status: UNSURE (   1.09  )
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
