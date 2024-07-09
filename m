Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7CAC3DA41
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 08:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+YyQlmSoMAN2isdiVYVinfneyn2GpwT2AdyKTP/c55I=; b=Kr9dKx5JD8SII4
	gh3MsX4euITx0DlwwxrSTcGw0nRSSVVtHaeofOfayG8hkTvucNg4+qPqNiZnzOmDfjfLGiLD/2ApC
	UqputAEVXAmMlrS0AQiyKmvlvQnYHmD1OgEpXtScpC9G98cUDgroLonKWEWzEFhAydFlV4+dPN+Tt
	+fyadSSiqFeEVfYVFC01TbmXZssTn98nVlegEaxPPa5RZLr7u6Z3c1+Li6mSrSZ9EeGNEMfu+G+Xp
	GkHv3VXtLnU5VLOc/Jeox62f+c7SXZIGi8+2KzjHQdoCtXiB8fiL4GwSY2kAbb5owOTiZhhPm2ReM
	dTf6aIkKHoFCIE1gS+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR65i-00000006N5S-2ZEm;
	Tue, 09 Jul 2024 08:20:50 +0000
Received: from mail.creationavenue.pl ([217.61.16.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR65f-00000006N3x-2zEI
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 08:20:48 +0000
Received: by mail.creationavenue.pl (Postfix, from userid 1002)
	id 438A884E82; Tue,  9 Jul 2024 10:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=creationavenue.pl;
	s=mail; t=1720513065;
	bh=ChscJKp3Om3FoG8SjFzTAmp7diEPSUZN/W3lUPFw6JM=;
	h=Date:From:To:Subject:From;
	b=XHN/OnHeJiC8iPhcBA2rkY6R1doEu3UVhZFQaBujws4OGv6vf0iLVwY0GBTtue3P9
	 OUpTQ205JWSWfazU3Z2pW2lV5bLFZk+ejcOd6P71OerGcsw/gpzk3yBsMBvI/PBo9X
	 pTP6ICBaWa0GK1oy8ashVMqZDdJSPSLsA09dlmK2t7L3UaB8+LmxHdwbHfVLkizarj
	 jHv3NW6VfZQhOenOhg9Qog1kSB7U4u/VEkEhxaaFNf1ZpDJPQNM47JV+6bOlTXD2R6
	 UsarAVehyGidNuZLHrUG4mYjL2u6kzZwJX2DHoX+X8C2aKJ4L3oK4HwldRhlz+wzuR
	 Tirs0TVLSR1DQ==
Received: by mail.creationavenue.pl for <linux-riscv@lists.infradead.org>; Tue,  9 Jul 2024 08:15:57 GMT
Message-ID: <20240709084501-0.1.4o.mi9d.0.2plmaymvwp@creationavenue.pl>
Date: Tue,  9 Jul 2024 08:15:57 GMT
From: "Karol Winiarski" <karol.winiarski@creationavenue.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.creationavenue.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_012047_889833_8CF96D31 
X-CRM114-Status: UNSURE (   0.03  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KS2Fyb2wgV2luaWFyc2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
