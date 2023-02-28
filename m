Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BBDC64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 07:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Cid9PplZE5AFXaowZsZ7BaeLnlVnzSHW+mO434rxGg=; b=SxFlcCVZ2QlpL3
	uY71AGXp/hmmKzG+YJ1674E1NRyMisbp+L+Wacs66qMqIqgBfJhE/CvodLgk/x1xEjWcKPdenDgxA
	o9XeXx4GJs1SbwZQYT5u/e/LfAlgkUk7hIT2oHCOyar9uuq1JVZ5MMAMlJZ7FUqZPKxP1U6x75xJI
	zfEWVaOHEm5BChXbYmeYJ59KJWI9JF78OEczoyyv/IhMuRhPv7L5OfEBeav+zjTq3CcP4R+ejyWbI
	FOizRd9yKvhEPYvNBqG/3bqR+cipFpUecfG2s/p6KecTP/tNk0bZTuWDy6MB19bQ3C35GBo0NWwVr
	ikBNs5h8B0SAf33KFcJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWuWt-00CHFZ-5H; Tue, 28 Feb 2023 07:36:07 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWuWp-00CHCw-Mx
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 07:36:05 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 624D924E435;
	Tue, 28 Feb 2023 15:35:40 +0800 (CST)
Received: from EXMBX063.cuchost.com (172.16.7.63) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Feb
 2023 15:34:27 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX063.cuchost.com
 (172.16.7.63) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Feb
 2023 15:34:27 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 28 Feb 2023 15:34:26 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: RE: [PATCH v4 4/4] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Thread-Topic: [PATCH v4 4/4] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Thread-Index: AQHZRZ0zqkG7/pRhhEiAX6gFjug0Aa7cUgAAgAEC65D///aKAIAAiLXg//+GvACAAI+BwP//lVOAAJFkcXD//+axAP//cjXQgADMoID//pX2AIACjLaA//9iDwAAGMuEAP//eWFg
Date: Tue, 28 Feb 2023 07:34:26 +0000
Message-ID: <dcaabfb44fbb40acbe21aebb2dbc29b0@EXMBX066.cuchost.com>
References: <20230224095526.ctctpzw3p3csf6qj@orel>
 <24a6dbe6aa2043c7812bf7e258786e13@EXMBX066.cuchost.com>
 <20230224120715.wgqnqmkadsbqusus@orel>
 <180fda36f9974809b436c52e4b3eda58@EXMBX066.cuchost.com>
 <20230227075942.rgl4hqnwttwvoroe@orel>
 <178ca008701147828d2e62402ff4f78a@EXMBX066.cuchost.com>
 <20230227114435.eow57ax5zhysz3kv@orel>
 <a6c319dd867f4f1d97e9d950b9e7c636@EXMBX066.cuchost.com>
 <20230228050457.zfbflfawctaccepv@orel>
 <ffd2e7849b764043bef606d9b8019506@EXMBX066.cuchost.com>
 <20230228072936.22ahmg6ggqk4v5wh@orel>
In-Reply-To: <20230228072936.22ahmg6ggqk4v5wh@orel>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_233604_027761_802620B1 
X-CRM114-Status: GOOD (  49.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Andrew Jones <ajones@ventanamicro.com>
> Sent: Tuesday, 28 February, 2023 3:30 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> Subject: Re: [PATCH v4 4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> 
> On Tue, Feb 28, 2023 at 06:33:59AM +0000, JeeHeng Sia wrote:
> >
> >
> > > -----Original Message-----
> > > From: Andrew Jones <ajones@ventanamicro.com>
> > > Sent: Tuesday, 28 February, 2023 1:05 PM
> > > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> > > kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> > > Subject: Re: [PATCH v4 4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> > >
> > > On Tue, Feb 28, 2023 at 01:32:53AM +0000, JeeHeng Sia wrote:
> > > > > > > > 	load image;
> > > > > > > > loop:	Create pbe chain, return error if failed;
> > > > > > >
> > > > > > > This loop pseudocode is incomplete. It's
> > > > > > >
> > > > > > > loop:
> > > > > > >         if (swsusp_page_is_forbidden(page) && swsusp_page_is_free(page))
> > > > > > > 	   return page_address(page);
> > > > > > > 	Create pbe chain, return error if failed;
> > > > > > > 	...
> > > > > > >
> > > > > > > which I pointed out explicitly in my last reply. Also, as I asked in my
> > > > > > > last reply (and have been asking four times now, albeit less explicitly
> > > > > > > the first two times), how do we know at least one PBE will be linked?
> > > > > > 1 PBE correspond to 1 page, you shouldn't expect only 1 page is saved.
> > > > >
> > > > > I know PBEs correspond to pages. *Why* should I not expect only one page
> > > > > is saved? Or, more importantly, why should I expect more than zero pages
> > > > > are saved?
> > > > >
> > > > > Convincing answers might be because we *always* put the restore code in
> > > > > pages which get added to the PBE list or that the original page tables
> > > > > *always* get put in pages which get added to the PBE list. It's not very
> > > > > convincing to simply *assume* that at least one random page will always
> > > > > meet the PBE list criteria.
> > > > >
> > > > > > Hibernation core will do the calculation. If the PBEs (restore_pblist) linked successfully, the hibernated image will be restore
> else
> > > > > normal boot will take place.
> > > > > > > Or, even more specifically this time, where is the proof that for each
> > > > > > > hibernation resume, there exists some page such that
> > > > > > > !swsusp_page_is_forbidden(page) or !swsusp_page_is_free(page) is true?
> > > > > > forbidden_pages and free_pages are not contributed to the restore_pblist (as you already aware from the code). Infact, the
> > > > > forbidden_pages and free_pages are not save into the disk.
> > > > >
> > > > > Exactly, so those pages are *not* going to contribute to the greater than
> > > > > zero pages. What I've been asking for, from the beginning, is to know
> > > > > which page(s) are known to *always* contribute to the list. Or, IOW, how
> > > > > do you know the PBE list isn't empty, a.k.a restore_pblist isn't NULL?
> > > > Well, this is keep going around in a circle, thought the answer is in the hibernation code. restore_pblist get the pointer from the
> PBE,
> > > and the PBE already checked for validity.
> > >
> > > It keeps going around in circles because you keep avoiding my question by
> > > pointing out trivial linked list code. I'm not worried about the linked
> > > list code being correct. My concern is that you're using a linked list
> > > with an assumption that it is not empty. My question has been all along,
> > > how do you know it's not empty?
> > >
> > > I'll change the way I ask this time. Please take a look at your PBE list
> > > and let me know if there are PBEs on it that must be there on each
> > > hibernation resume, e.g. the resume code page is there or whatever.
> > Just to add on, it is not "my" PBE list but the list is from the hibernation core. As already draw out the scenarios for you, checking
> should be done at the initialization phase.
> 
> Your PBE list is your instance of the PBE list when you resume your
> hibernation test. I'm simply asking you to dump the PBE list while
> you resume a hibernation, and then tell me what's there.
> 
> Please stop thinking about the trivial details of the code, like which
> file a variable is in, and start thinking about how the code is being
> used. A PBE list is a concept, your PBE list is an instance of that
> concept, the code, which is the least interesting part, is just an
> implementation of that concept. First, I want to understand the concept,
> then we can worry about the code.
> 
Dear Andrew, perhaps a conference call is better? otherwise it is going to waste the time in typing...Let me know how to join the call with you....thank you.
> drew
> 
> > >
> > > > Can I suggest you to submit a patch to the hibernation core?
> > >
> > > Why? What's wrong with it?
> > >
> > > Thanks,
> > > drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
