Return-Path: <SRS0=aW5S=TO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97136C04AA7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 14 May 2019 01:09:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E042085A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 14 May 2019 01:09:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tVuUfpDJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JGzc7UJS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E042085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5vi+9NLVAhrTviZMeJmeYXG3ZjvqdBluM8YvhSKGKQI=; b=tVuUfpDJl1KEe6OnVM7NkmAioF
	fnIFYMnTBPXYH/Sw7+uMY9v05mYa9oDvplUJovXnhevZy8Huinlfuv1dDuMFkOKX0CMFLRdnjFUwP
	jOGNtapny9DywYTUMCmBOYpd13MqoVC2fVugnXy98dXPqEYAkaAhf0QF41MJ5i73f35TYd9Khtxxb
	kwvSYb68+lUTi4SYe3fbHtRXraSDvNWWjm91ZqRB7EftLjzbvKRBpr0MDASP45RaBUxTnRj+xpic+
	XS01BNJwxj2pcbMhuAww9JOLyJKXGp8OA3pPeqXvqdjjrfYh/9PEgYnI/p4VhDms0No50drkXewSZ
	6AlhgH1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQLwY-0001IG-Ut; Tue, 14 May 2019 01:09:22 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQLwW-0001Hm-0B
 for linux-riscv@lists.infradead.org; Tue, 14 May 2019 01:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1557796159; x=1589332159;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=5K08GCDsMMe7ULZNS9/es07zvxS4miJfJ8gR5oqtTwU=;
 b=JGzc7UJSfgZmwK8psKea2KD9ZjyunT8WewAuRlyxb3v+6yd6cVxByQ4R
 o4MWSTXFRrq9y4t48zf7K/DWIr79IEi7OSIVYlGzacZK+g+u8UqqYgHjq
 1nag5zzPAeAv4mmH9rpGccMNAJ6bi763shbiWbYLUrlLGS5G2PTIF3AG8
 8RinM3/XAkHrtuBjBJwG3kVSRugOBlSAapwzr6gvgOOdA7HDu5bvR6FUw
 2fpheLejtAg0udow5quzB/MVVhqjb5iSnD2eUIGmjKfQmKKry2rG7EILl
 kg7ngszqm9NqSvdP76uq4MRIZYLfySuGCtW2QUnaZMg3867n8LBHRTbSe w==;
X-IronPort-AV: E=Sophos;i="5.60,466,1549900800"; d="scan'208";a="214263649"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 May 2019 09:09:16 +0800
IronPort-SDR: f5xnmTSgP/17HFe4Fq5b9XpO4B3znPOz/XOU6pZvDH9qPVUwRSkR4FnocgfU2ksV5gBI1bIWrI
 LN3ZaM+vQDqBe6iVgQCH0PZ/YGRLdnP/ka8uy6Ar4Oq5qR9fKfJHsbJwGM6DWPKjfeDMAEBU1e
 WLUCdv9+w+xvBtXwAD9MdCoEct5xb1CQ7CM1k9YxK1X2fET7Zq6ecI9PXSVAgGQCT4Ih7lDCVw
 i2xbV9TkdTD0eGkGLcr6+bHzeF+L8ll6k8BZj5waZRQ1AJvUN8uh0iKAJogoDDbjrDc+xut6Lf
 XKY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 13 May 2019 17:45:04 -0700
IronPort-SDR: /3CbyayO+myj9oIkmAJlwfNfVShQhxgjD9i1uvrDCqP3C9uX/Wf6MUuc0nCX+ox7wAP35BQz+e
 7YE9kw03o8xjAvmm8R0yYvWs307BXfDj/9KfO7C7miYGzRdcK6LEoCu6qupI5v/DqZNIlDvAMY
 esasAMRhSb0enQ/IuwYK/65PoiG0etkwCpOwH1+Ia6sOl0h13MWC24zG9nkRJOglx/RQckIK6B
 5pPcR88VmYnnAuIdE6Sdd/Yfje7w1rrtXLfMn7O9dtEQlrj/GJvIMJtahwr+J6DJFK6XZ1QMW6
 lg4=
Received: from r6220.sdcorp.global.sandisk.com (HELO [192.168.1.6])
 ([10.196.157.143])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 May 2019 18:09:14 -0700
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Subject: RISC-V microconference accepted for Linux Plumbers 2019
Message-ID: <ce2b8d33-1d4f-ace0-3336-362ec781e9f4@wdc.com>
Date: Mon, 13 May 2019 18:08:49 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_180920_078141_D8F55394 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

CkhlcmUgaXMgdGhlIGFubm91bmNlbWVudC4KCmh0dHBzOi8vd3d3LmxpbnV4cGx1bWJlcnNjb25m
Lm9yZy9ibG9nLzIwMTkvcmlzYy12LW1pY3JvY29uZmVyZW5jZS1hY2NlcHRlZC1mb3ItdGhlLTIw
MTktbGludXgtcGx1bWJlcnMtY29uZmVyZW5jZS8KCkFzIHRoZSBibG9nIHNheXMsIGlmIHlvdeKA
mXJlIGludGVyZXN0ZWQgaW4gZGlzY3Vzc2luZyBhbnkgb3RoZXIgdG9waWMsIApwbGVhc2Ugc2Vu
ZCBhIHNob3J0IGFic3RyYWN0IHRvIG1lIG9yIHBhbG1lci4KClJlZ2FyZHMsCkF0aXNoCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
