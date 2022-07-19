Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4778C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffDZR4xbdy7oNeS1teOZXKAPDZXf6LVjTJVBgyrZ85Y=; b=Ur3jOG9onSLuoG
	NSH1REB34Qc1IugOc86gfISB2AHADNbG9nufrpJDlRKpAxWknVnSS43bsS2+sFm1Q3cbt2qk+cDyY
	bTt0iqZ58V/O8eZT8vZO51hsJ7nMSrr21kADcUdeTD/OlAP5faaEklInezigAeyjZjE7N+WsW0k3h
	Dr8jy3fls1FDdqnsKBrEs/gepMPxRjRKeQWVHmWVg0LaaXGkG8XwHxxuWDxLQHewDu6FJHl2IAXa+
	tJA9WZTxabZuVKDI2liRm1UylJU40R+xmTafz56NPDlgUFesmjBOGvYlbYcVln3yC+ABjcMaQ9NRF
	wcqR3g65Q3y/QWw5cilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnhx-009PlJ-HP; Tue, 19 Jul 2022 13:56:17 +0000
Received: from maynard.decadent.org.uk ([95.217.213.242])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnhr-009PYo-C6
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 13:56:12 +0000
Received: from [91.187.115.179] (helo=[127.0.0.1])
	by maynard with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <ben@decadent.org.uk>)
	id 1oDnhc-0001uN-CP; Tue, 19 Jul 2022 15:55:56 +0200
Date: Tue, 19 Jul 2022 15:55:54 +0200
From: Ben Hutchings <ben@decadent.org.uk>
To: Guo Ren <guoren@kernel.org>, Conor Dooley <Conor.Dooley@microchip.com>
CC: emil.renner.berthing@canonical.com,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: Fix vdso_install target with CONFIG_COMPAT=y
User-Agent: K-9 Mail for Android
In-Reply-To: <CAJF2gTTFg3+0k57kdE4qVAsO=r=76k_rnJ1-CrLoqfTUwURVqA@mail.gmail.com>
References: <Ys/8SFo/oC1TFZYk@decadent.org.uk> <CAJF2gTSS56vzp2K_93P3fnUC4t=2v+jbnn11vMocuwVSrnW7bA@mail.gmail.com> <f59e4a64c541c5781bd10dd81c8622249d785c70.camel@decadent.org.uk> <CAJF2gTQ3V=TWib_cbw=r-wFtH9Ee=m7tG9OzizQhiZOU11Fa-Q@mail.gmail.com> <CAJM55Z8Eq-iUBFb79HJpykgGOFD-QykNdOJ7Xvj2-azeFJehLA@mail.gmail.com> <CAJF2gTTtEUL-o9Y+AbxWzT0Uf-8UwUqw8EgihZFn7D7huJvkmg@mail.gmail.com> <e896e651-89ef-6205-b2b5-ad9f4905f698@microchip.com> <CAJF2gTTFg3+0k57kdE4qVAsO=r=76k_rnJ1-CrLoqfTUwURVqA@mail.gmail.com>
Message-ID: <2579A2A7-7E88-4F80-AC7A-FE18D176785A@decadent.org.uk>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 91.187.115.179
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_065611_455532_3C56A9DF 
X-CRM114-Status: GOOD (  13.36  )
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

On 19 July 2022 12:35:55 CEST, Guo Ren <guoren@kernel.org> wrote:
>On Tue, Jul 19, 2022 at 6:29 PM <Conor.Dooley@microchip.com> wrote:
>>
>> On 19/07/2022 11:15, Guo Ren wrote:
>> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> >
>> > Sorry, I missed your patch. You are the first person to catch that.
>> >
>> > + $(build)=arch/riscv/kernel/compat_vdso compat_$@)
>> >
>> > The above is also good for me.
>> >
>> > For that one, Could you add "Fixes: 0715372a06ce ("riscv: compat:
>> > vdso: Add COMPAT_VDSO base code ...")" in your next version of the
>> > patch from Ben's and add "Ben Hutchings as Co-developed-by:"?
>> >
>> >
>>
>> Why would Ben get a Co-developed-by?
>
>Just a suggestion to "Emil Renner Berthing".
>
>My reason is:
>1. I think the "Fixes:" is also necessary, and Emil could directly use
>it from Ben's patch.
>2. He also found that problem and shared the information with us. The
>key effect is to make Emil's patch quickly reviewed (Although I missed
>that patch).

Please just let's get this applied. I don't need credit for a trivial fix or commit id.

Ben.


-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
