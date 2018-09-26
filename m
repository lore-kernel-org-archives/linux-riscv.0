Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7C5C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 07:14:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C804D206B5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 07:14:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EM5mSvqA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfvUU3/G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C804D206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLOf9/yVeZqrUISgj3ugPl2n+nzQ9RN65UEXrWl93Kk=; b=EM5mSvqAwZcm3+
	BuK0bogvatdO1HMjf191ptpZPFCvb2Q+N8mHYIKF3JkZEdQfaRS/Aih3z60Ea2gdWBKBces6m5t79
	0xoXnHRkYMe8sVQLeTiT0HTM+vLLCCY9KnzqSH6Be9wz3Lxm3o951hKqZW6ev0GsawZNolgpbL6Tc
	hrWgtTzj2CDiqarUu9Qk1USW9DNLmHbKmxMqP1HIlaFKpw0WCvwv0JOH+8/3mPFKqp+qXqXQBPIso
	aJfAal8VXYyrhLGfi+TgibrCY12jUhYj5x55JxQT5uPWPMF/G0Whr1Z3JrNQlN3ujAvdu6ABDsQx/
	AGeDOw2pOiHHlRBpUClA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g541g-0002Ls-Fu; Wed, 26 Sep 2018 07:14:24 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g540e-0001wT-SU
 for linux-riscv@lists.infradead.org; Wed, 26 Sep 2018 07:13:26 +0000
Received: by mail-io1-xd41.google.com with SMTP id w11-v6so22510892iob.2
 for <linux-riscv@lists.infradead.org>; Wed, 26 Sep 2018 00:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9bIXZLzJ7jUFS0/wlaunLKXPPS9gwJiu0fKbgkvIH48=;
 b=LfvUU3/GMAnAuGqjxZFRJA0/Q9iVZbAeHkSCTHxD78yeXp2stoWDIYgz/Rweh7Lxw8
 C05pQcStt0gU6a9dzELWAdA3fgqhF6/0ecINMqqllv6ThVAXtoZybvd/M7tZQ0VSeQgo
 GIezZdcjWNElBXD1+r6G/VQw60vmECd3xUbqIFNhOR8s0XpD9Kyp7ezUEILkeS0CXSBN
 wQD+fv0w5louEhjxyG7SvfREByM2IN54HdBS8mGXquMhfkEmUF29FZkyknlaJt95q8SZ
 aZEfptMy94mfy+HyODjBpzw99Afjsq2onpm02s/ZViXqPPnYRumgncUUJfWoBFrpabm2
 RXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9bIXZLzJ7jUFS0/wlaunLKXPPS9gwJiu0fKbgkvIH48=;
 b=OOawgqq6KGUSL2OMupBNSQjvnO9Ln+98rH9J/XRGpOI4cQTCEamjSvi6RS3wLNsjzc
 Pb8Qt7OazVst/VHsTGBvg78OVV074xeMjmQ8QPunIYG3DaKYVLaX6Akl90WTq9Q/PTF4
 syPd5bafL2OcBuv6e1pG68fMtBW7ttT+gup1lnxdKfSHtU0CwfiQEDLihbdrATatCtiO
 ZcWihWNqPm+3P9XmzztsfCAy1lJPqYWu44jOpC1qZVjNN6Fl6QwB415I00NuJ2YV4oMD
 59oh6jr5THOSIrgcwuEab0vhsG4ZuaJzcN7uwW8GPRVmtgW9kuo9GLeXujUuW9gJkGdm
 SXqQ==
X-Gm-Message-State: ABuFfojSu4M2MQN715v9GzYDO0kT++k/c8k+jFgcHgMQwrum2pefQ0o9
 1FKHGVjBDUdrY5LhYS/FLGulwUOHemCyztyfcL4=
X-Google-Smtp-Source: ACcGV62KypCputrv2j62PhFXSTV3RLo/Lmo9tUIs7Le1y4/NnydCuplOa82LAbe1mj+oMHdhkFuEax2/H34N1qR1FDg=
X-Received: by 2002:a6b:9ace:: with SMTP id
 c197-v6mr3931139ioe.63.1537945976223; 
 Wed, 26 Sep 2018 00:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1537260207.git.zongbox@gmail.com>
 <2ccc6c0758624dbb22f6fe451a3e476a000108ef.1537260207.git.zongbox@gmail.com>
 <20180921070006.GC8401@infradead.org>
 <CA+ZOyaiJv-NZWk3ec_3zhRTSn7G-NGgyaiPTXOmuWfTWD7KSJw@mail.gmail.com>
 <mvmefdicabq.fsf@suse.de>
In-Reply-To: <mvmefdicabq.fsf@suse.de>
From: Zong Li <zongbox@gmail.com>
Date: Wed, 26 Sep 2018 15:12:45 +0800
Message-ID:
 <CA+ZOyagnA=NRjRH4qWw8FgOTBr1uAvDvK1Pk8MAw8ysQdgdfPA@mail.gmail.com>
Subject: Re: [PATCH 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
To: schwab@suse.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_001321_001142_17EAD1E6 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: Vincent Chen <vincentc@andestech.com>, aou@eecs.berkeley.edu,
 Zong Li <zong@andestech.com>, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, hch@infradead.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926071245.RkoMpncVtXiExv8kbFFy0tJHE-Cv_cLxJaWhtlDbfoQ@z>

QW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBzdXNlLmRlPiDmlrwgMjAxOOW5tDnmnIgyNeaXpSDpgLHk
uowg5LiL5Y2IMzoyMOWvq+mBk++8mgo+Cj4gT24gU2VwIDI1IDIwMTgsIFpvbmcgTGkgPHpvbmdi
b3hAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gVGhlIFJWMzIgbmVlZCB0aGUgdW1vZGRpMyB0byBk
byBtb2R1bG8gd2hlbiB0aGUgb3BlcmFuZHMgYXJlIGxvbmcgbG9uZwo+ID4gdHlwZSwgbGlrZSBv
dGhlciBsaWJyYXJpZXMgaW1wbGVtZW50YXRpb24gc3VjaCBhcyB1Y21wZGkyLCBsc2hyZGkzIGFu
ZAo+ID4gc28gb24uIEkgZW5jb3VudGVyIHRoZSB1bmRlZmluZWQgcmVmZXJlbmNlICd1bW9kZGkz
JyB3aGVuIEkgdXNlIHRoZSBpbgo+ID4gaG91c2UgZG1hIGRyaXZlciwgYWx0aG91Z2ggaXQgaXMg
aW4gaG91c2UgZHJpdmVyLCBidXQgSSB0aGluayB0aGF0Cj4gPiB1bW9kZGkzIGlzIGEgY29tbW9u
IGZ1bmN0aW9uIGZvciBSVjMyLgo+Cj4gWW91IHByb2JhYmx5IHNob3VsZCB1c2UgdGhlIG1hY3Jv
cyBmcm9tIDxhc20vZGl2NjQuaD4gaW5zdGVhZC4KCkhpIEFuZHJlYXMsCgpUaGlzIGRvZXNuJ3Qg
d29yayBmb3IgbWUsIHRoZSBkaXZpc29yIG9mIG15IGNhc2UgaXMgYWxzbyBsb25nIGxvbmcgdHlw
ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
