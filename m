Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD80C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 00:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lm4C/j72/jIEOVoVmSxAHhNBS7m95jOm+96qGkKuRY=; b=OR1ViItvgFTXVc
	GPlfkOwdCsjiu1pPySIXqpX7uMJIEly77FKBuUDIpTJdEIa0yCLRZefiH8enGjHeYBSn26u2hNfrR
	w2ctWsniHiWxyzCpwI+hYdL/kTXGuF4AAgtlGvqaysRzB/fqWsi+fur/G/T/0dMcii3r/652P4U3a
	uZ2527eNkUXP+4ZHOJVknT9v3LSYTM46ZQ62FZzsRkxJZ1mxZzCaPp/Igmgcaxgu7eVm0EiRdLuGU
	+CKXAIVskVPe9/aeXuUNX0Y0eTgDwhD0LKHe0Bon0l7+rdKCzChz2AXQ7wa1pKvZchw6ZqdTHVXFr
	2AXoCcR/2+emx+MrS8tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p89Tg-004w5W-KG; Thu, 22 Dec 2022 00:30:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p89TN-004w2k-Fr
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 00:30:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AE19BB81BE5;
	Thu, 22 Dec 2022 00:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D6BC433EF;
	Thu, 22 Dec 2022 00:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671669003;
	bh=W3ieMBH1py2ivn2gYCl7Hf6einZeemiSyRBDMxO+2co=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=LC7pVYH9rem06N0nQg5JO40wJEmhJz4oDd7vtKrq6OgFKM0epZ8YtmjEJoiOtm00R
	 YI1BMuCHJ/YYMVe9ztbCxACHk9Tub7A4kCcDGA4omlJfJBjKWiGz/0HpiHLmq9OswB
	 VH2zaMQYMrH/EvRz6oQbC1O+JbEt0Z2q3zgF9lcxtTC0elauT8WniN5GpSRP9M8lgl
	 X9jPcOFpGOJ3VPxjJgOngXteJW/ohsPAlP5bMaSYSnVR4XeMiEQC0KT0XYxCRok03s
	 W/0PapvkB62OTr1yp5fL+2ry77CC9MDW4vAk6z/6D/ZWagSbNi6nWjxMbRg2eynPXa
	 TCzIAed7Z3DhQ==
Date: Thu, 22 Dec 2022 00:29:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Changbin Du <changbin.du@gmail.com>, Guo Ren <guoren@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, mhiramat@kernel.org,
 changbin.du@intel.com, zong.li@sifive.com, rostedt@goodmis.org,
 boqun.feng@gmail.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] riscv: patch: Fixup lockdep warning in stop_machine
User-Agent: K-9 Mail for Android
In-Reply-To: <20221222001902.zcbwlvqaitvsfb33@mail.google.com>
References: <20221120101049.2078117-1-guoren@kernel.org> <Y3tPEDvM3aVJmVxF@wendy> <CAJF2gTS0FDgV3toa9wZxPhK2G+f4vCtrru7q3R4FXnMkxYmu-w@mail.gmail.com> <20221222001902.zcbwlvqaitvsfb33@mail.google.com>
Message-ID: <5CA9DB64-CE90-490A-835B-0FC4550E5D9A@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_163009_719307_C9F4A1A2 
X-CRM114-Status: GOOD (  17.94  )
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



On 22 December 2022 00:19:02 GMT, Changbin Du <changbin.du@gmail.com> wrote:
>Hello,
>Does this patch get merged into riscv tree now? This problem has been there for a long
>time. (I suppose you have received my previous reponse.)

As far as I can tell, this patch is still missing a sign-off from you.
There's nothing in response to this thread that I can see which provides one.

>
>On Mon, Nov 21, 2022 at 07:09:45PM +0800, Guo Ren wrote:
>> On Mon, Nov 21, 2022 at 6:13 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>> >
>> > On Sun, Nov 20, 2022 at 05:10:49AM -0500, guoren@kernel.org wrote:
>> > > From: Changbin Du <changbin.du@gmail.com>
>> >
>> > > Fixes: 0ff7c3b33127 ("riscv: Use text_mutex instead of patch_lock")
>> > > Cc: Changbin Du <changbin.du@gmail.com>
>> > > Co-developed-by: Guo Ren <guoren@kernel.org>
>> > > Signed-off-by: Guo Ren <guoren@kernel.org>
>> > > Cc: Zong Li <zong.li@sifive.com>
>> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> > > ---
>> >
>> > Hey Guo Ren,
>> >
>> > FYI you're missing a SoB from Chanbin on this patch. They gave one in
>> > their v1 though so you should be able to re-use that?
>> I'm waiting for his SoB. I don't think I could directly use his SoB in
>> v1. I need him to confirm my rewritten commit log for lockdep
>> analysis.
>> 
>> >
>> > Thanks,
>> > Conor.
>> >
>> > > Changes in v2:
>> > >  - Rewrite commit log with lockdep explanation [Guo Ren]
>> > >  - Rebase on v6.1 [Guo Ren]
>> > >
>> > > v1:
>> > > https://lore.kernel.org/linux-riscv/20210417023532.354714-1-changbin.du@gmail.com/
>> >
>> 
>> 
>> -- 
>> Best Regards
>>  Guo Ren
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
