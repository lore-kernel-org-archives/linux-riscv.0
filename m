Return-Path: <SRS0=UPnX=V4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A90CC32750
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2019 00:09:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62384206E0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2019 00:09:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PR0k/9g2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ACnXznkI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62384206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gn+f7U/FsXLE/xazaI1WzG6KRkyGd8vqnplfi6kx3UI=; b=PR0k/9g2w1Kl8M
	F+GGXMxJ2n/IHC2SzqRS+LS/HOASFb1r+NyIsBa0dPFCd4sAU+wWdGjst8ykJCciM+ESIph+MMvJR
	Wy7f7+ATUrujzuht3tZ4tJjme7+6rdKO0es6voECGQNZGBZlNHNkAgOXqowJsILaas7loSjJIDH/w
	PigmBRxpoZeSe7G15nuqYS0Lh4GUOZf+HtIntE7lFFLjCoTbA+vGb3vNiIP9vlxMqP0df0kd7IlTh
	9s5ALux7yv5E7fPzxLabt3qUctd+DymAgcwZZlJNKvOS4me0Oa/TB9AmyKBbQGgcIjRfZ/kij6Dtx
	vFf+mcVW3Qgu8685BTIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hscAu-0001xg-Br; Wed, 31 Jul 2019 00:09:00 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hscAg-0001eE-Rz
 for linux-riscv@lists.infradead.org; Wed, 31 Jul 2019 00:08:48 +0000
Received: by mail-ot1-x344.google.com with SMTP id r6so68259845oti.3
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2019 17:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=6FtxAw9Mh/kQnOEyufqBh4q3auEokVswtxFLId11t7w=;
 b=ACnXznkI8Y3/x8dnoJ2ZoM0NExdUytG7wf7/wY+QAEyUOy9nZk2Ua3sZFyLulMDBXL
 ckWzOHG4M3yPlH8J9nP5jRV5x/jhCJf2oFZf1Z7lWcSPV8cvE99YVvnhdqMc7woiXPeV
 B/nsb6wfNt0qeNRVDhELdTBOXVHsUQAR+T+azvhNsMn4okgi5ByniqCF7RqInqECYod8
 DpI9rHKCEgG/hZHNwNsQkszXXw95tX+SrJnfhYRPKChd+QX82wq/ZveSW2Kfqmr5/vbN
 OzaX+qlAAjlPIQNvUT+CUhalTus+0fHZ4BGvNPHXCh+mYVyX/iuKa0JykG88Mobvr4j2
 9Vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=6FtxAw9Mh/kQnOEyufqBh4q3auEokVswtxFLId11t7w=;
 b=Pf4LB3ZvKdGLTsNGbPehfv1dvFi2mwksA/DuikDa9uEZNjcb5GyXZ42DeOqzk9FOWX
 chaiPYqwMuEw1xWi2xhdvKQf1FGJu4PtM6AvHIxWiC3UJDmHu3t4Z03MPe8+i9MybC16
 NBY9kwjs6m5axRyBfa19j8hWG9S9NopeZ87XhGWEGgh4r2LFkPwZjl/CsX54YCIoauQv
 lB4ulGHIyVZpfrCAVrWRF6Z+vpK+UCjJK2hF0BycJyKMSWZFPRaFYixg2MZu828uaWFr
 J507z/WpkgWr9lRVLtoYBqKXIps+d8TW+CW40Egw3pXuIVbHxz8RQxM0lRUgRSYsW5as
 YuIA==
X-Gm-Message-State: APjAAAUWrPzQOhUi5S36Pl5eCF+TBLONoyJ4fVFxdG1gcUW/AkQaoG3z
 0WGGiJd44Af7Vyu/u7c29szM8/+sbmg=
X-Google-Smtp-Source: APXvYqz2Us9f38GubAYvmzLgNu4K8Qkyq4AhOrDg4xZKDqSuCjcqYtOj/+WEP3rqhBMeYTITMD1oIw==
X-Received: by 2002:a9d:7259:: with SMTP id a25mr10777964otk.30.1564531725418; 
 Tue, 30 Jul 2019 17:08:45 -0700 (PDT)
Received: from localhost ([2600:100e:b005:6ca0:a8bb:e820:e6d3:8809])
 by smtp.gmail.com with ESMTPSA id c29sm24726790otd.66.2019.07.30.17.08.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 17:08:44 -0700 (PDT)
Date: Tue, 30 Jul 2019 17:08:42 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [PATCH 3/4] RISC-V: Support case insensitive ISA string parsing.
In-Reply-To: <8ed4d461ffe5ac41b475d22b38019578b29a8d09.camel@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1907301611040.4874@viisi.sifive.com>
References: <20190726194638.8068-1-atish.patra@wdc.com>
 <20190726194638.8068-3-atish.patra@wdc.com>
 <alpine.DEB.2.21.9999.1907261346560.26670@viisi.sifive.com>
 <a8a6be2c-2dcb-fe58-2c32-e3baa357819c@wdc.com>
 <alpine.DEB.2.21.9999.1907261625220.26670@viisi.sifive.com>
 <MN2PR04MB6061790AFE4E0AAA838678028DC30@MN2PR04MB6061.namprd04.prod.outlook.com>
 <alpine.DEB.2.21.9999.1907270043190.26998@viisi.sifive.com>
 <CAAhSdy0Eycc0ORSnh6LJeC_D_x9yLOkoc7OkPNuN6qOcZEGVWg@mail.gmail.com>
 <alpine.DEB.2.21.9999.1907270108420.26998@viisi.sifive.com>
 <8ed4d461ffe5ac41b475d22b38019578b29a8d09.camel@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_170846_970825_98E60475 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "anup@brainfault.org" <anup@brainfault.org>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "johan@kernel.org" <johan@kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "allison@lohutok.net" <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 29 Jul 2019, Atish Patra wrote:

> The yaml document did not specify anything about all isa-strings has to 
> be lowercase unless I missed something. The two enum values are all 
> lowercase but the description says all ISA strings are documented in ISA 
> specification which describes the ISA strings to be case insensitive. 
> IMHO, this creates confusion resulting the patch.

If it's helpful in understanding my earlier comments, I don't think that 
your patches were "wrong," or anything like that.  And you're right that 
the DT YAML binding does not unequivocally state that all future additions 
to the riscv,isa string must be in lowercase.  But to be clear, the DT 
YAML schema defines exactly what is currently permissible for riscv,isa 
strings in kernel-oriented DT data, and right now, all of the permissible 
values are lowercase.

Good Linux kernel patches are driven by clear functional motivations.  
Like, "The current kernel crashes or doesn't support the hardware in 
situation X; thus we change the kernel to add feature or bugfix Y."  And 
in the kernel, solutions that involve fewer lines of code are generally 
preferred to solutions that involve more lines of code - more bugs, more 
noise, etc.  

Where these case-insensitivity parsing patches fall short, in my opinion, 
is that they don't have strong functional motivations.  There's been a 
precedent for a few years now in the mainline kernel that the RISC-V ISA 
string is all lowercase.  I've asked you and Anup for situations where 
that precedent isn't sufficient to handle functionality that's described 
in the RISC-V specification, or to phrase it differently, "what breaks if 
we don't make this change?"  So far no one's been able to cite anything 
here.  There's just a repeated appeal to authority to the section of the 
RISC-V specification that states that "[t]he ISA naming strings are case 
insensitive."  As you can probably sense, this doesn't seem like a strong 
justification for changing the existing behavior.  From a functional point 
of view, if case doesn't matter, why care if the DT data and kernel only 
support lowercase strings?  An all-lowercase string should be functionally 
equivalent to an all-uppercase or mixed-case string.  Since there's no 
functional point to the changes, why add more code to the kernel?

Later in your E-mail, it sounds like you ultimately agree with these basic 
conclusions.  If that's so, I don't understand the amount of effort that 
you and Anup have put into pushing back here.  There's nothing personal 
about these review comments.  If there's some meta-problem here that's 
unrelated to the technical merit of the patches, please send a private 
E-mail.  Otherwise, if you disagree with the functional conclusions in the 
previous paragraph, let's hash the issues out here.

> I am fine with dropping this patch if yaml clearly document the case 
> sensititve thing.

Great!  If you still think so now, let's resolve this issue with a 
one-line patch to the DT YAML schema to note that riscv,isa DT string 
values should be all lowercase.  Will you send a patch?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
