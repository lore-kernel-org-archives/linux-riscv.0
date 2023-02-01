Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A71CC636CD
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 13:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ih7zfmDh0JzUQnyFCRYJAuRKKuVqGRz62DpLiRgc+2c=; b=gdClRlHbkupCKS
	7d+Pw8rb6Feee0TojqIAYGrcvr5FccVdrkcAN1YLQyqqYapmHYLjaRXqPidSVvZ1cpkfAlUP8Qw5A
	mVhcGsCO9iQ2HaCP2QqXYJqXgrDupSMWsJwaB4eYurMK+rHRVHPwRgBcyZIbMd+gjMi/cXA/1kl5D
	gW5mhVE7Oh0AOemhiHkmbsLngpKU7Gg4rWe3w47PGaDpjsajewkh40y8DeiwkgNJ3KzN4a4u7mzrZ
	jbFpSnW7UNCN2SM/agwej7K4DKX+hA7NPAZjvlW7H3paProrR4A5mYqzSveKxS755PVacdxFXbawV
	58kqnTtBxXz7qigEiglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDCR-00C4cf-UA; Wed, 01 Feb 2023 13:30:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDCM-00C4YV-Vg
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 13:30:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9B5C8B82184;
	Wed,  1 Feb 2023 13:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F378BC433D2;
	Wed,  1 Feb 2023 13:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675258248;
	bh=hW9YSSvo6XTKUbdfhWOHMd+CyfDtp/89LVYuABWaklQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gYvrReJsPQ2IrxHz3DF+PZgAELs7rB3Cy7WmL7zV1ME4P6u0niWZmFBOWvxNbV3/9
	 yHYd1NepBQsQpCGQJvCZ+kcBQMC7nPdzcWeGTklPl0UEt+gYLy17g6YlIMtwOA0+iv
	 5c+UjQkCEND+oS9/OGpoeYATE+zamj17oV5ODzmv8Ua7JrBSoylkGRWCVlFtnZtIDM
	 OU1KY+J+cITlh4MFuh7XQZVgeVC2bS93boHaSJS8fByiKZ+tNuphE6Oh1p60TvJs9d
	 pz8CtP6WNPGnuXJL83XpV4caCTo0PoECBL+UciUXRHbInOJnMPEr2MoiFaBbGs2iUh
	 vMWB8cwRhJhZw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com
Subject: Re: [PATCH v6 12/13] riscv/kprobe: Move exception related symbols
 to .kprobe_blacklist
In-Reply-To: <20230127130541.1250865-13-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
 <20230127130541.1250865-13-chenguokai17@mails.ucas.ac.cn>
Date: Wed, 01 Feb 2023 14:30:45 +0100
Message-ID: <87tu05tsvu.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_053051_193423_9A1251B1 
X-CRM114-Status: UNSURE (   8.30  )
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

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cgo+IEZy
b206IExpYW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPgo+IER1ZSB0byB0aGUgZ2Vu
ZXJpYyBleGNlcHRpb24gZW50cnkgYW5kIGV4aXQgY29kZSBpcyBwYXJ0IG9mIHRoZSBjcml0aWNh
bAo+IHBhdGggZm9yIGtwcm9iZSBicmVha3BvaW50IGFuZCB1cHJvYmUgc3lzY2FsbCBlbnRyeSwg
c2V0IGEga3Byb2JlIG9uIHRoZQo+IGFzc2VtYmx5IHN5bWJvbHMgaW4gZW50cnkuUyByZXN1bHQg
aW4ga2VybmVsIHN0YWNrIG92ZXJmbG93IGNyYXNoLCBoZW5jZQo+IGl0IGhhcyB0byBleHBsaWNp
dGx5IGJsYWNrbGlzdCBpdCwgcmVxdWlyaW5nIGEgbmV3IF9BU01fTk9LUFJPQkUoKSBhc20KPiBo
ZWxwZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMaWFvIENoYW5nIDxsaWFvY2hhbmcxQGh1YXdlaS5j
b20+CgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
