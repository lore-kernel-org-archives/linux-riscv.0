Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A770EC433E6
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 23:00:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BFAE23339
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 23:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BFAE23339
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L+8tq8q2R+YSzJmLmhVENV+bdGEgQOze0XuoHqbQezk=; b=IyrD1XmKXe/QVpYgCiXEC1R8B
	p+RCskC8P5N5M/b17PcEUm0QscGZykShIsD3miX7mjxxXpKZ8PHblDGodtACtp9oxqAp7uoN6eN9a
	Y/a+XVOVuqf77rnVIctp4d+yBjOVlW69eEGtAVQUZaAiMXRpJx0Vc3H9J/z6Hv3K/iy8eWdLMXEbC
	70t183OT+6gc6FBIIb9U7ZCacBig3r/rTbMYuTehaeAF8LsQia9ioY1aLbVAZm3PTlCkAdjGLUJ+s
	oZY9R+HMQ1YcavWrABJnNVD6wqyNDXnA+YfHEIf/EGwNg6whs24q18cTSKRaGzXZL19bf27zwfuSh
	XsLSKTM/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Y4i-0003lD-Fl; Fri, 15 Jan 2021 23:00:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Y4g-0003kP-0n
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 23:00:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 6591A2399A;
 Fri, 15 Jan 2021 23:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610751608;
 bh=RuxI0+5o+iF8ELYoih7lRTU/CZKmOIoEc5ZL2ZswYjI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=C2i6wcPIUOSxDA240gv7CVN1x1bbDwvGhBsUZ8z3I6gbETbPmLhOTqbYaFlj1/ZMt
 r0obPA5rAYIF7I4sBucQP7fETZYPgNrRL0k4HuW0wyuIYMXMwTPcGY7HiRQtpbz3Dc
 4ht+fJLHpjheFkdmCbdJo2akI81ID/eo+AioU5ExV/aX0PBF4uIhDo79Ozvh4nUzhM
 0VQaNjrM7+dOqmT1S/ynQF0JyUNw+Yg2sNpTseRGq5QWfNnPrEJdCbuvNIGxV6dM4L
 BMmplvy3tXS3NJ4ifKiYkXjAqjbL2SWBERPk1IPnCw4X09ZvN2OTk/xbbGMKWEkaHi
 InAQI9MvrLKmA==
MIME-Version: 1.0
Subject: Re: [PATCH bpf] MAINTAINERS: update my email address
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161075160837.22495.5230649397692870926.git-patchwork-notify@kernel.org>
Date: Fri, 15 Jan 2021 23:00:08 +0000
References: <20210115104337.7751-1-bjorn.topel@gmail.com>
In-Reply-To: <20210115104337.7751-1-bjorn.topel@gmail.com>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPg==?=@ci.codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_180010_130262_61908870 
X-CRM114-Status: UNSURE (   6.58  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: daniel@iogearbox.net, netdev@vger.kernel.org, ast@kernel.org,
 bjorn@kernel.org, bpf@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIGJwZi9icGYuZ2l0IChyZWZzL2hlYWRz
L21hc3Rlcik6CgpPbiBGcmksIDE1IEphbiAyMDIxIDExOjQzOjM3ICswMTAwIHlvdSB3cm90ZToK
PiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgo+IAo+IE15IEludGVsIGVt
YWlsIHdpbGwgc3RvcCB3b3JraW5nIGluIGEgbm90IHRvbyBkaXN0YW50IGZ1dHVyZS4gTW92ZSBt
eQo+IE1BSU5UQUlORVJTIGVudHJpZXMgdG8gbXkga2VybmVsLm9yZyBhZGRyZXNzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Cj4gCj4gWy4uLl0K
CkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIFticGZdIE1BSU5UQUlORVJTOiB1
cGRhdGUgbXkgZW1haWwgYWRkcmVzcwogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBm
L2MvMjM1ZWNkMzZjN2E5CgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0KRGVldC1kb290
LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsv
cHdib3QuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
