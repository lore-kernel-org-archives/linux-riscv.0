Return-Path: <SRS0=e4j4=YK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB40FA3728
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2019 02:42:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFA472053B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2019 02:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NxMZj1+P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFA472053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=umjaHo7FckjFvTEc5a2K/apWJTfCW/ZbE3nrWutl0UM=; b=NxMZj1+PBK1iUn
	mJqBw8O9emg1xiXptLqnjW+NQ0Fg559ZEbZCRebYteR7VekcNdyEuZpJzvWwRF6BF0sno9DUFG/sg
	Azi8tZTpYjMiUTx+mAo/2kGd2JBSfgTwXjyoaJXYM1QjESfMCNuKEtn7hq+FfbS4/qPq8JgBecohB
	Hf5F9t10VxfCU5xSgCNb9TQ7jPz5n2BeGfj6GmCiVZTFSJi8yLibxCPPbRjBrBoYlNi0iFvaObmEf
	UH8W/LwJQiwkbrwZxEoRvEjj5UB7iemAVXUBALMNa4e5borMPM8s0IirGiMSFjQte+JwX4J8HOpKX
	WpDUFjLy6hxGc5wshnXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKvju-0005Op-8f; Thu, 17 Oct 2019 02:42:10 +0000
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKvjr-0005Mt-0f
 for linux-riscv@lists.infradead.org; Thu, 17 Oct 2019 02:42:08 +0000
Received: by mail-io1-f70.google.com with SMTP id k14so1120718iot.14
 for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2019 19:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=7h0gQqNrYRzsWj9R4CAYCu9XOxzaPAZTOTXlm38+fvI=;
 b=G4GXI3/vMhihxby7nh4HO6gBYli6QqBIdA8Bl9fGpH5i+jzAlARc18lAXTb/uipjhh
 HdvVdSC53q9Qpl0ZWGEBgtxabh4d6aGJtEE7G8DIGYuOEQfb+oOXQjHuVJVGvpExgDyU
 FzP3ippdjR9UocGJ8DQugdygprnCxGfp4IZyiZYcyyx3LNC2YhvtRSY2f0ET/OfnWFek
 yIpnhQ1JQNHCknMaep99hX8iJ8QBBqfjazhFCSXi7cbep5jTwNpSQ2BD4u+H6q4CnUIa
 IbUYsUprPu8qYN9onybl3tNBaj5mSKnduakoKfWknkiqGJm1NnSdK4DXibDvA+EeJsbA
 bh3A==
X-Gm-Message-State: APjAAAUB9PMfeDT7bfG0GECZyf8c0T4dwtLrVif0wqqlSPzJe+YZkQoK
 qqutm0gh/2dP+6RaDioAjjpcj1kK7WmDdN4m1S53i1YNC8we
X-Google-Smtp-Source: APXvYqxm/PZKRcr2VOn2bSEPROOTxJZd4s/gFYz6yxRyhamcXwHcbHmC0uB12SwLAgbX/bUP1WUzw8YXMpgkcwGIQdZ6LiO9FDXe
MIME-Version: 1.0
X-Received: by 2002:a92:3b8b:: with SMTP id n11mr1162464ilh.135.1571280120830; 
 Wed, 16 Oct 2019 19:42:00 -0700 (PDT)
Date: Wed, 16 Oct 2019 19:42:00 -0700
In-Reply-To: <000000000000830fe50595115344@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000071e2fc05951229ad@google.com>
Subject: Re: WARNING: refcount bug in find_key_to_update
From: syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, dhowells@redhat.com, 
 jarkko.sakkinen@linux.intel.com, jmorris@namei.org, keyrings@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-security-module@vger.kernel.org, palmer@sifive.com, serge@hallyn.com, 
 syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_194207_057986_7FAD9BE0 
X-CRM114-Status: UNSURE (   2.45  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

syzbot has bisected this bug to:

commit 0570bc8b7c9b41deba6f61ac218922e7168ad648
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jul 18 19:26:59 2019 +0000

     Merge tag 'riscv/for-v5.3-rc1' of  
git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11b6e2bb600000
start commit:   bc88f85c kthread: make __kthread_queue_delayed_work static
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=13b6e2bb600000
console output: https://syzkaller.appspot.com/x/log.txt?x=15b6e2bb600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e0ac4d9b35046343
dashboard link: https://syzkaller.appspot.com/bug?extid=6455648abc28dbdd1e7f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11c8adab600000

Reported-by: syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com
Fixes: 0570bc8b7c9b ("Merge tag 'riscv/for-v5.3-rc1' of  
git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
