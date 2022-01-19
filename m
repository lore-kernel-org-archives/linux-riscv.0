Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B627FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 21:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJA68UAZTKlgegoynusb5xPPMMFOFRXGbjioJp7Z8Zo=; b=h1K94tFw9ZdaW6
	aGdYF3LH9O0QJPmAf/85+xc3QclbaLvNQ1pkllEsT6haOP9JOOxJsPATHTd5yii4hpl749wDUsZ8x
	nzzpfMl9TgB35SpGKT2DfVjOq1Y8zd5XTxTr4HF5qAYKdcHbiIp6b7MD1CdveMdjAgxQs0sS86V5t
	Y7hWsqI16N4dcurwH2Bysq3rkAq0Ywb2dZ/DJi0ZWW4JktYCSdBHPOLR4eIFrcZHjLSYFVI8hDQUN
	VnHWJ10zk3d2EUn+n4KgCnpaR+r7QDao+kJirU57jZ6ZVqhzjJXtT4AgI2fW5Ub8NYQl+SgK2W0lV
	X2MEumXA60osZQzYZojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAIBE-007SXb-Q0; Wed, 19 Jan 2022 21:07:44 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAIBC-007SX6-Gr
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 21:07:43 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4JfJBN5hcHz1qwyD;
 Wed, 19 Jan 2022 22:07:40 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4JfJBN54Cfz1qqkB;
 Wed, 19 Jan 2022 22:07:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id fa2MReFuQDWV; Wed, 19 Jan 2022 22:07:39 +0100 (CET)
X-Auth-Info: a+k5wgMBRWkntvg+3VX7x/EHIpisGRCFgjaQ+T+kj0Njbe4vckVflYo3aArUijhP
Received: from igel.home (ppp-46-244-165-91.dynamic.mnet-online.de
 [46.244.165.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 19 Jan 2022 22:07:39 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 74A832C36EC; Wed, 19 Jan 2022 22:07:39 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Changbin Du <changbin.du@gmail.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  linux-riscv
 <linux-riscv@lists.infradead.org>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: eliminate unreliable __builtin_frame_address(1)
References: <20220117154433.3124-1-changbin.du@gmail.com>
 <C2470F2D-9E45-49D7-A03B-E6A7BB4B9738@jrtc27.com>
 <87v8yg6lhf.fsf@igel.home>
 <AAAA7852-EBCA-47A3-B74E-A425023468C6@jrtc27.com>
 <8735lj78wu.fsf@igel.home>
 <8F8D535F-3637-4BC7-8853-B709EC5D14C9@jrtc27.com>
X-Yow: Uh-oh!!  I forgot to submit to COMPULSORY URINALYSIS!
Date: Wed, 19 Jan 2022 22:07:39 +0100
In-Reply-To: <8F8D535F-3637-4BC7-8853-B709EC5D14C9@jrtc27.com> (Jessica
 Clarke's message of "Wed, 19 Jan 2022 20:48:48 +0000")
Message-ID: <87y23b5t9g.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_130742_731834_DAB4CB9A 
X-CRM114-Status: GOOD (  11.95  )
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

T24gSmFuIDE5IDIwMjIsIEplc3NpY2EgQ2xhcmtlIHdyb3RlOgoKPiBNeSBwb2ludCBpcyB0aGF0
IHRoZSBvbmx5IHRoaW5nIHRoYXQgY2FuIHBvc3NpYmx5IHJlYWQgdGhlIGluY29taW5nCj4gZnJh
bWUgcG9pbnRlciBvZiBhIGxlYWYgZnVuY3Rpb24gaXMgdGhlIGxlYWYgZnVuY3Rpb24gaXRzZWxm
LCBhbmQgc2luY2UKPiBpdCBrbm93cyB3aGVyZSBpdOKAmXMgcHV0dGluZyBpdCB0aGVuIHRoZXJl
IGlzIG5vIEFCSSBpc3N1ZSwgaXQganVzdAo+IHJlbWVtYmVycyB3aGVyZSBpdCBwdXQgaXQgYW5k
IGxvYWRzIGl0IGZyb20gdGhlcmUuCgpsbHZtIHNpZGVzdGVwcyB0aGF0IGlzc3VlIGJ5IGFsd2F5
cyBzYXZpbmcgcmEgd2hlbiBjcmVhdGluZyBhIGZyYW1lLApldmVuIGluIGEgbGVhZiBmdW5jdGlv
biwgc28gaXQgY2FuIHVzZSBhIGNvbnN0YW50IG9mZnNldC4KCi0tIApBbmRyZWFzIFNjaHdhYiwg
c2Nod2FiQGxpbnV4LW02OGsub3JnCkdQRyBLZXkgZmluZ2VycHJpbnQgPSA3NTc4IEVCNDcgRDRF
NSA0RDY5IDI1MTAgIDI1NTIgREY3MyBFNzgwIEE5REEgQUVDMQoiQW5kIG5vdyBmb3Igc29tZXRo
aW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50LiIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
