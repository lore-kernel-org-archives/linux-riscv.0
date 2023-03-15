Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2952EC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wVTSrw/d93zwVOSIb1ESV/0H3jUT/2HqZq4YM7cyJBU=; b=vl7abQx19ph+Jv
	VWOXSa6OSU6jo4l4/Qahmiks5RpvjhbaRVfhYrTcoho2y8dGHigpNW1lf+xTPjKut/FYRedoQu8qw
	YuPTwJnZDnKa9aW+YEreQq8y70GS1HMcq/XqiuxC7yJTH2sxsbOsO+56Ms2E2j+lxuxir6ZWiIH4J
	/6WM7M2+XUzNBeoa9qDe60m75HgRA/FBzrOxAxH2GaUrcLQrWfxa7hAjm09/9+GfpKTJerJvcp6UZ
	gJZA4g7sJYpwfmgqAv/WPleGoHBsan5+wSJWNJ4O22aDBlLy/wOsKo4k7Ut1rTi0WEdIY2uvxmj3f
	ILslOdFmfh+8z/2Vx7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcN07-00CqjX-2w;
	Wed, 15 Mar 2023 09:00:53 +0000
Received: from mail.corrib.pl ([185.58.226.145])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcN04-00CqhA-0I
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 09:00:50 +0000
Received: by mail.corrib.pl (Postfix, from userid 1001)
	id 7189BA3D39; Wed, 15 Mar 2023 09:00:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corrib.pl; s=mail;
	t=1678870852; bh=X6IEpSISwJiYlJ3uA866lskXve3r+4o2hf4z7VM6m5o=;
	h=Date:From:To:Subject:From;
	b=w6OWaNNw3tH5Lv4Y80YBaN6lKm6eFQ0ZN8dUDuqyZcXIjTAyWv8aVaZeXCf3rJI4Z
	 LUo11w+3C9xtPzGWlhUS85mvqC6lpe7oAQ8Hoxpxezj6X2dMGU+QsZYEmu2ahnzvUx
	 mfoCgcvaPY2ucgt7HqFU+X+g0ABtSaXGfcE3Hs8ZEFyw37Mtk6OpEIV/FqGh2NDn9r
	 wnB2dddHWNm6A41W/G0j4DBDwUcEm3DgHTw6ZIvEmO5lFdgdY9KyKNDlXVY1x6A0Di
	 hDmTfcNOJ8cCeLZtNRcdsnhToinoEK8Ycn9A7cFxlo56DHwPSQjWd+6ZMcHvlfuzHD
	 KeYQTgan81anA==
Received: by mail.corrib.pl for <linux-riscv@lists.infradead.org>; Wed, 15 Mar 2023 09:00:35 GMT
Message-ID: <20230315074501-0.1.62.ivzz.0.o0816ns0r1@corrib.pl>
Date: Wed, 15 Mar 2023 09:00:35 GMT
From: =?UTF-8?Q?"Szczepan_Kie=C5=82basa"?= <szczepan.kielbasa@corrib.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Faktoring
X-Mailer: mail.corrib.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_020048_514896_7F7F5F20 
X-CRM114-Status: UNSURE (   1.18  )
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

RHppZcWEIGRvYnJ5LAoKcm96d2HFvGFsaSBQYcWEc3R3byB3eWLDs3IgZmluYW5zb3dhbmlhLCBr
dMOzcmUgc3BlxYJuaSBwb3RyemVieSBmaXJteSwgemFwZXduaWFqxIVjIG5hdHljaG1pYXN0b3d5
IGRvc3TEmXAgZG8gZ290w7N3a2ksIGJleiB6YsSZZG55Y2ggcHJ6ZXN0b2rDs3c/IAoKUHJ6eWdv
dG93YWxpxZtteSByb3p3acSFemFuaWEgZmFrdG9yaW5nb3dlIGRvcGFzb3dhbmUgZG8gUGHFhHN0
d2EgYnJhbsW8eSBpIHdpZWxrb8WbY2kgZmlybXksIGR6acSZa2kga3TDs3J5bSwgbmllIG11c3rE
hSBQYcWEc3R3byBtYXJ0d2nEhyBzacSZIG8gbmlld3lwxYJhY2Fsbm/Fm8SHIGtvbnRyYWhlbnTD
s3csIHBvbmlld2HFvCB0cmFuc2FrY2plIHPEhSB6YWJlenBpZWN6b25lIGkgcG9zaWFkYWrEhSBn
d2FyYW5jasSZIHNwxYJhdHkuIApDaGPEhSBQYcWEc3R3byBwcnplYW5hbGl6b3dhxIcgZG9zdMSZ
cG5lIG9wY2plPwoKClBvemRyYXdpYW0KU3pjemVwYW4gS2llxYJiYXNhCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
