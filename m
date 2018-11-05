Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E18C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 07:05:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A15F204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 07:05:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jc5/DSrl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A15F204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHudqWiN1pEyK0L0MK9Cqk224FSxajSzhwM9EuKqgPw=; b=Jc5/DSrlf9j0Cy
	gs+rzyukwEjJKfhTQEGxQzXRlzMOzUTNgP3+8HJQyWQROUdw95EdNv2Wch273w6x1fqZhXaEAzRCT
	UyNdtiJdIDayOGZkKWwGQg8FiOlTlC5ThvKnEXFPfDC6Buaas0yeP7xOMovT0l9xtnsuoCN8YbRMW
	DFF0NT6fynaw1L2S6B/gBNNTqx/wOCzVb8X9GtloIXkW570LSAi0KJuNtf899VSSXwCwVh6923AWj
	7Op70g1ZrZMeH2vvCfISBBsua8Up+uW57tK0xRPZsKYg+q7k53Iw42O9WGwINRrQrv61TLCGHMqWN
	QXYxtXbqORfwDB06AqHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJYxP-0003CR-Br; Mon, 05 Nov 2018 07:05:55 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gJYxM-0003CI-2o; Mon, 05 Nov 2018 07:05:52 +0000
Date: Sun, 4 Nov 2018 23:05:51 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vincent Chen <vincentc@andestech.com>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
Message-ID: <20181105070551.GA7274@infradead.org>
References: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
 <20181101174857.du2zu4vnrhpu5asf@excalibur.cnev.de>
 <20181105065807.GA1286@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181105065807.GA1286@andestech.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: aou@eecs.berkeley.edu, arnd@arndb.de, alankao@andestech.com,
 greentime@andestech.com, palmer@sifive.com, linux-kernel@vger.kernel.org,
 zong@andestech.com, kito@andestech.com, linux-riscv@lists.infradead.org,
 deanbo422@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181105070551.zc0_LT4tsrFjwu_g4tK1_V5gT7enu49E-oZePtEhk_I@z>

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDI6NTg6MDdQTSArMDgwMCwgVmluY2VudCBDaGVuIHdy
b3RlOgo+IE1hbnkgdGhhbmtzIGZvciBraW5kcyBvZiBjb21tZW50cy4gSSBxdWlja2x5IHN5bnRo
ZXNpemUgdGhlIGNvbW1lbnRzIGFuZAo+IGxpc3QgdGhlbSBhcyBiZWxvdy4KPiAxLiBUaGUga2Vy
bmVsIGltYWdlIHNoYWxsIGluY2x1ZGUgYWxsIHZlbmRvci1zcGVjaWZpYyBjb2RlLgoKSSBmdW5k
YW1lbnRhbGx5IGRpc2FncmVlIHdpdGggdGhpc+KApiBhbmQgdGhpbmsgaXQgc2hvdWxkIGJlIHRo
ZSBjb250cmFyeS4KCjEuIFRoZSBrZXJuZWwgc2hhbGwgc3VwcG9ydCBubyB2ZW5kb3Igc3BlY2lm
aWMgaW5zdHJ1Y3Rpb25zIHdoYXRzb2V2ZXIsCnBlcmlvZC4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
