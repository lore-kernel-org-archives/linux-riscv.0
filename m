Return-Path: <SRS0=66UJ=IV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E39C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Mar 2021 14:29:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 655B96191F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Mar 2021 14:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 655B96191F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wd6OEPVgv9PKkomntFMMgeeDnE3cTsXb8qwtMFHzbsA=; b=rVcBbDg1P3U00rIPxm1MLBxzT
	o7yV3YIwrkHiFxAUU/wdvcjfTB7B+md1WPs9Y7lr5upVuvMWjnEJLtE5xmZTvB1CDw9xYuUc5YA68
	Vn/UoFtqtPpMDy7qzXy5ZfHp1Vq2vyaH+3KauTnQ86oxOLrx4gX6wqZs8Dqq0lYTMdepg2r5n8g1K
	3PFgP5D6OT/26GGngjqPvxcXPCLo9ehnChIG21UhWz7ioKzdGQWZ6AYiW6JkOtAv7980ntrQXddVm
	/dpIFOzfi/c81jUqOkOo8L4fnwPo9+Blxew+gFRzqPWVsFLnlk462/3bdg8zylHF2rSnHS9gtxEZB
	LnFk5mMkQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOi21-00FAFl-E5; Tue, 23 Mar 2021 14:29:17 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOi1u-00FAEC-TH
 for linux-riscv@lists.infradead.org; Tue, 23 Mar 2021 14:29:15 +0000
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.8] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr
 [92.150.42.106])
 (Authenticated sender: michael.opdenacker@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 118D640013;
 Tue, 23 Mar 2021 14:29:08 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com, linux-riscv@lists.infradead.org
Subject: Re: Kernel Not booting on RISC-V QEMU
To: Pratik farkase <pratik.ironmaiden@gmail.com>
References: <CA+NPzNJGc+oUYVYMA1Ca0vG+4H7Q4z+nJZ-te9naq0sU=D7r1Q@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ddf81db0-ce65-7f2c-f862-733acc7f38ad@bootlin.com>
Date: Tue, 23 Mar 2021 15:29:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CA+NPzNJGc+oUYVYMA1Ca0vG+4H7Q4z+nJZ-te9naq0sU=D7r1Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_142911_096310_8B695C07 
X-CRM114-Status: GOOD (  10.73  )
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

SGkgUHJhdGlrLAoKT24gMy8yMy8yMSAzOjIxIFBNLCBQcmF0aWsgZmFya2FzZSB3cm90ZToKPiBI
aSBNaWNoYWVsLCBpIHdhcyByZWZlcnJpbmcgeW91ciBzZXNzaW9uIG9uICJFbWJlZGRlZCBMaW51
eCBmcm9tCj4gc2NyYXRjaCBpbiA0NSBtaW51dGVzIChvbiBSSVNDLVYpIiBwZGYgYW5kIHNlc3Np
b24gcmVjb3JkaW5nLiBJIGhhdmUKPiBmb2xsb3dlZCBhbGwgeW91csKgc3RlcHMgdG8gYnVpbGQg
a2VybmVsIGFuZCBvcGVuc2JpLiBUaHJvdWdoIG9wZW5zYmkgaQo+IHdhcyBhYmxlIHRvIGdlbmVy
YXRlICJmd19wYXlsb2FkLmVsZiIgZm9yIGdlbmVyaWMgcGxhdGZvcm0uIEJ1dCB3aGVuIGkKPiB0
cnkgdG8gcnVuIHFlbXUgdXNpbmcgdGhlIGdpdmVuIHBhcmFtZXRlcnMgaW4gcGRmIGkgYW0gc3R1
Y2sgYXQgdGhlCj4gYm9vdCBhcyBzZWVuIGluIHRoZSBhdHRhY2hlZCBzY3JlZW5zaG90LiBUaGUg
b3BlbnNiaSBib290cyB1cAo+IGNvcnJlY3RseSBhbmQgcmVtYWlucyBzdHVjayB0aGVyZSBidXQg
a2VybmVsIGRvZXMgbm90IGJvb3QuIE15IFFFTVUKPiBwYXJhbWV0ZXJzIGFyZSAicWVtdS1zeXN0
ZW0tcmlzY3Y2NCAtbm9ncmFwaGljIC1tYWNoaW5lIHZpcnQgLW0gMTI4TQo+IGtlcm5lbCAuLi9v
cGVuc2JpL2J1aWxkL3BsYXRmb3JtL2dlbmVyaWMvZmlybXdhcmUvZndfcGF5bG9hZC5lbGbCoAo+
IC1hcHBlbmQgImNvbnNvbGU9dHR5UzAiLiBJdCBpcyBzdHVjayBhdCB0aGlzIGFuZCBrZXJuZWwg
d291bGQgbm90IGJvb3QKPiBhdCBhbGwgOgoKClRoYW5rcyBmb3IgdGVzdGluZyBteSBpbnN0cnVj
dGlvbnMuCgpJIGJlbGlldmUgeW91IGZvcmdvdCB0aGUgIi0iIGNoYXJhY3RlciBiZWZvcmUgdGhl
ICJrZXJuZWwiIG9wdGlvbi4gQ291bGQKeW91IHRyeSBhZ2Fpbj8KCkNoZWVycywKCk1pY2hhZWwu
CgotLSAKTWljaGFlbCBPcGRlbmFja2VyLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
