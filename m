Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF8DC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 16:54:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35F6C61990
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 16:54:27 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0GAfKkCUmaeEWZdofZJLOem8N6qFv/XEBCytMlXwKzg=; b=fr6vCv7H6PUxqHIKu1tjTmaio
	QVcV3alJEPHZivPuuFS/rDdwiVzWfDWQ6b2C435RPWl8S/Q6hPDYJEa93eTReClEUmnBqHrC+P0iG
	HyGKC7Jx0CzgWbaIWZLUQ5RNKwGc8MVpAdv8M1Var3OLpdbm0On8HmDvIn0O7H4ya6KwteiqB3UN6
	SnNqPpnzPC4bG0qmjW0PTrPOJP3KDAroHDMpBbSVWrLMCqvRGVyv0SbzCDT6+wX2n3lfIWFtQNQN9
	bYHg12mvN/CwcEAwuWEG2/bN55XN7LYWPRgv80P7IPuOq+t/+ZSXNBDqSoOGrqGKM2Kt677LKcPUw
	r9530Lt6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lONoh-00C6Fh-4y; Mon, 22 Mar 2021 16:54:11 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lONoa-00C6Do-QB
 for linux-riscv@lists.infradead.org; Mon, 22 Mar 2021 16:54:09 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lONoP-0007oO-TE; Mon, 22 Mar 2021 16:53:53 +0000
Subject: Re: [PATCH] riscv: evaluate put_user() argument before enabling user
 access
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org,
 Javier Jardon <javier.jardon@codethink.co.uk>,
 Terry Hu <kejia.hu@codethink.co.uk>,
 syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com,
 Arnd Bergman <arnd@arndb.de>, dvyukov@google.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, linux-kernel@lists.codethink.co.uk,
 hch@infradead.org
References: <20210322120935.391973-1-ben.dooks@codethink.co.uk>
 <87o8fbmiwo.fsf@igel.home>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <83df5a56-26d9-d013-73b6-4729115535e4@codethink.co.uk>
Date: Mon, 22 Mar 2021 16:53:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87o8fbmiwo.fsf@igel.home>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_165405_560454_9B620FE1 
X-CRM114-Status: GOOD (  10.31  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjIvMDMvMjAyMSAxMzoxMiwgQW5kcmVhcyBTY2h3YWIgd3JvdGU6Cj4gT24gTcOkciAyMiAy
MDIxLCBCZW4gRG9va3Mgd3JvdGU6Cj4gCj4+ICsgKiB0byB0aGUgcmVzdWx0IG9mIGRlcmVmZXJl
bmNpbmcgQHB0ci4gVGhlIEB4IGlzIGNvcGllZCBpbnNpZGUgdGhlIG1hY3JvCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaGUgdmFsdWUgb2YgQHgKPiAKPj4g
KyAqIHRvIGF2b2lkIGNvZGUgcmUtb3JkZXJpbmcgd2hlcmUgQHggZ2V0cyBldmF1bGF0ZWQgd2l0
aGluIHRoZSBibG9jayB0aGF0Cj4+ICsgKiBlbmFibGVzIHVzZXItc3BhY2UgYWNjZXNzICh0aHVz
IHBvc3NpYmx5IGJ5cGFzc2luZyBzb21lIG9mIHRoZSBwcm90ZWN0aW9uCj4+ICsgKiB0aGlzIGZl
YXV0cmUgcHJvdmlkZXMpLgo+ICAgICAgICAgICAgIGZlYXR1cmUKVGhhbmtzLCB3aWxsIGZpeCB0
aGlzIGZvciB0aGUgbmV4dCB2ZXJzaW9uLgoKRG8gcGVvcGxlIHRoaW5rIHdlIHNob3VsZCBnZXQg
dGhpcyBpbmNsdWRlZCBpbnRvIHN0YWJsZT8KCi0tIApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5j
b2RldGhpbmsuY28udWsvClNlbmlvciBFbmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcg
R2VuaXVzCgpodHRwczovL3d3dy5jb2RldGhpbmsuY28udWsvcHJpdmFjeS5odG1sCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
