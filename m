Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDE8C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 16:50:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49D8A6191F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 16:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49D8A6191F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AChxbvYIwPBLn2sRxxQBpOTAmlYpe0vAjfWVcKA677s=; b=g7N2ADUqchjaBwQDo7iy7BQxz
	nWfxn/vi+jLgVD2LZIshecEcidzqz7c1JurPUSeTjfTfq70EsX+jxYhddeOnfp7RDuEKyuO5M+rbT
	4oietP3oADJiaKvXpA1jfKIMtKl2fP0kFY7bxwmlwjgBJqxTgzRJrX8mVHHrz4WcmMgAaFCz8kC7r
	954WMr+a/e0ayF4pfrD6W2SXnvv3SZR3rm9ZLMGr7uyVh14b4PygKjlGEcpb/ACx1/Z0gMFOtwIcq
	Zy6pJZDxa2jdk5lNBn1+GtTZhz/AVmCLOetClQCsVFCUDL7LDQqxOhkBIQfvevwv3emjknNBNmwDo
	npkKI+KFQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQv5V-000n1e-7o; Mon, 29 Mar 2021 16:50:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQodS-000Yj3-1Y
 for linux-riscv@desiato.infradead.org; Mon, 29 Mar 2021 09:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=HVM9PaQlgAvzwNdGyUDLBej78/NQKt4MVFaImRFVo/4=; b=pHTmwXml5XXo+t2Z15QA0gE6ty
 vqZGo8mTNNBN/PJCmgkC4E/6yZHgQwnmLsmT2IPTlIoCqAWEd6trH5/VcXohDaFC76+CXEZorvEvH
 uh9bpjSmKomClyb0roEElQ/olfloWgVkZ7qJo19td9in1J6o5MN5rhbIdp8vPxnV8AFD7LZHnNqYg
 LKDmEjsRqSh7fdR4h+7JXFvrSbunTWBr0SV+jmgrPeA5YSUi/uyiPVxMZLQfJ8mr2nX07GHfsorMn
 umRFiuzJnmjMhn0LMk1VGVMbXAcx8OXK3KaqpbgocyKOAoGzs3YNHy01DNnU6TA8n90i9H/Y/lsW5
 35B07UVw==;
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQdf2-000eUy-FV
 for linux-riscv@lists.infradead.org; Sun, 28 Mar 2021 22:13:35 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lQdeh-00081s-G0; Sun, 28 Mar 2021 23:13:11 +0100
Subject: Re: [PATCH v3] RFC: riscv: evaluate put_user() arg before enabling
 user access
To: linux-riscv@lists.infradead.org,
 Javier Jardon <javier.jardon@codethink.co.uk>
Cc: Terry Hu <kejia.hu@codethink.co.uk>,
 syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com,
 Arnd Bergman <arnd@arndb.de>, schwab@linux-m68k.org, dvyukov@google.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr,
 linux-kernel@lists.codethink.co.uk
References: <20210325230328.767875-1-ben.dooks@codethink.co.uk>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <834d18c2-4f36-c3a7-b446-44bf9dc4b2b2@codethink.co.uk>
Date: Sun, 28 Mar 2021 23:13:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210325230328.767875-1-ben.dooks@codethink.co.uk>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_231332_795092_17CAF65F 
X-CRM114-Status: UNSURE (   9.61  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 25/03/2021 23:03, Ben Dooks wrote:
> The <asm/uaccess.h> header has a problem with put_user(a, ptr) if
> the 'a' is not a simple variable, such as a function. This can lead
> to the compiler producing code as so:

I just noticed I failed to remove the "RFC" from the patch title.
Should I re-send with this removed to allow easy merge?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
