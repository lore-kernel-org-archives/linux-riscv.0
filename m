Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4808FC0044B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 21:00:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D95207E0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 21:00:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n0APusnp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KlOh+8LS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10D95207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=FSxCPE8aearfzsrKJY4yqxTKQ/0/X43QFTJ7rTRw2wg=; b=n0APusnpWTUnZWsaoSam0FW/b
	ZpnpEc3xvfs2EnsUo2TRtHIs8xU9Ys8TJuOC1rd2qSGNEOHm1buIwbSqeZg5SDvBoZW+WXjG6HpJq
	Bk+OaaWGLiSlnzvcPC6zkIVMvVe5RXmvHmcO7WIIgtKTvRfskiLRhLcOWl52mdHvJtOfe7TO80KB8
	UvUMF+4N7pSxc4av/p41f2swkxarr9p4JX4F39jaUIen0a7Iwl+GJfI0aQ6va6nZNI2Lw5UtiBIUd
	nEAFGEY9r3F/NKNUif7K7hZyQk7CG20c6Gu3/AsKM+ZHDg/KqsPVXEAk5t+xwfX4hv0kHFYSffcnY
	8MoxPlUEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu1eH-0005rK-On; Wed, 13 Feb 2019 21:00:53 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu1eE-0005qr-9h
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 21:00:52 +0000
Received: by mail-pl1-x644.google.com with SMTP id bj4so1781121plb.7
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 13:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=mtZ88cdrK5v+Ief1IGhpzrV3XDn2hA9XGIN77+ys2ek=;
 b=KlOh+8LS6XAqbIaqhJBeRfUzdc+sw4u4xQbr1kKSbxd1QH2mSvrTbw619Nr7NSgWDG
 2EpbVH10b+jlddNx6IoFozA8YXaiAlRfbFKKf5/eX7aF2x+te4dsHJsKek6avlx1dSvd
 f6+Lx/rYzxLCpaYNgP9ry09ydETqLYu6nJ95tAm5U+HKdFWu8Oyv8tvwdYiuG0YN7NIW
 6Wx45asneFTVcMwdRiHgScjcr92GzOnKTou3UnL68duwpCY3aElK4QI0Cf3L9mw3wLQL
 zke7jrBiSJZtjXLxD3FMhiJGF0AehYSRrwnZt9vUPFFuivn6d+H17Apun0eK76xKPkRN
 9A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=mtZ88cdrK5v+Ief1IGhpzrV3XDn2hA9XGIN77+ys2ek=;
 b=oOEa+iUcNjqRGRIYsYi7ZdWcxXODo/OQMvauu7903MyUvezFhUoUpKVF78gUT3D+Re
 gk3NcpcaAv5O3qwFV4IVnwuN1Tbg74hs1ZWsxhNOL9BBGo6g3WZOxIaX+HcN0r0/9mJt
 9U0IL/y7FUuxjok9Kzq9nWBDOKGapQhFdv4Z1yErPMw7oPLSkhNEtcyUMWbd1vxn01gK
 MaEWWTqFtZcgrll9MKfBr9YpYXeon/tF/Ek5Rxed46M8lUSVyo0BZOu9TE4w81bh778M
 aj/INHx8pjmGqdwZXXUeKbno6MswAV2DaHPS0QaYogQSzidyU3/vdxtnRSWLOFW/xtYj
 z1RA==
X-Gm-Message-State: AHQUAuY+eQzXaJ592HSxtIVJumaK+lgGuC1NFzbQMre1GdQPvgMIxAra
 lcTJkR/5PJCmhK3eGYX0NqDrSw==
X-Google-Smtp-Source: AHgI3IYOZYpsY2qrlxRWCy3+CT2T2PQNiIaFblGcut8EqzF133uC5BTWhtAvck1y7dHWPsdpOeqzFw==
X-Received: by 2002:a17:902:aa01:: with SMTP id
 be1mr177455plb.60.1550091649617; 
 Wed, 13 Feb 2019 13:00:49 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id e63sm347561pfc.47.2019.02.13.13.00.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Feb 2019 13:00:48 -0800 (PST)
Date: Wed, 13 Feb 2019 13:00:48 -0800 (PST)
X-Google-Original-Date: Wed, 13 Feb 2019 12:58:59 PST (-0800)
Subject: Re: kernel after 5.0-rc2 may not boot using BBL
In-Reply-To: <81d7ebf7-0055-13bf-d4b2-4bf62227bbdc@mac.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Michael Clark <michaeljclark@mac.com>
Message-ID: <mhng-508f034a-8ac0-4154-b469-ed2d45ee67cc@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_130050_347562_B9339BFD 
X-CRM114-Status: GOOD (  42.93  )
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
Cc: anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com, schwab@suse.de,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 11 Feb 2019 17:24:05 PST (-0800), Michael Clark wrote:
>
>
> On 11/02/19 9:45 PM, Anup Patel wrote:
>> On Mon, Feb 11, 2019 at 1:55 PM Christoph Hellwig <hch@infradead.org> wrote:
>>>
>>> On Sat, Feb 09, 2019 at 09:00:27AM +0530, Anup Patel wrote:
>>>> IMHO, best solution would be to use mature open-source bootloader as
>>>> payload (i.e. U-Boot or similar) and always boot Linux from bootloader. Using
>>>> Linux as BBL/OpenSBI payload can still continue to exist but it can be more
>>>> of a developer usage.
>>>
>>> Yes, that is a good long term plan.  But in the meantime we should not
>>> gratiously break the precious setups people got working..
>
> This has been a longstanding issue. I believe some Berkeley graduates
> are in control of the repos (some of them are very intelligent young
> Doctors). However, the Berkeley software doesn't even version numbers.
> We can't call the release management shocking because it is
> non-existent. i.e.it is not even at the linux-0.11 style versioning
> scheme, (although Linus didn't have version control hence tarball's).
> Methinks they don't want CVEs being assigned as that would taint their
> impeccable security reputation. For example, one can't really assign a
> CVE to master:HEAD on a git repo. One needs an actual release. I am sure
> it is deliberate. That said, assigning CVEs to students, with them
> having a black mark at the start of their careers is probably also a bad
> idea.
>
> I think these gratuitous breakages are a ploy, either to demonstrate how
> easily trust can be subverted. i.e. the breakages are actually to troll
> long-standing kernel overdevelops, showing how easy it is to slip in
> breaking changes using the "trusted lieutenants" model, and it is not
> really fixable until someone with release engineering experience takes
> control of the foundation repositories, or the students step up and take
> responsibility for their work, adding due professionalism, such as CI.
> They are getting paid now.

I'd like to assure everyone that the breakage was not intentional.  We're all 
just doing our best to make things work here and unfortunately somethings 
things still break.  Of course it's better when things don't break, but there's 
always a risk of breaking something whenever a change is introduced.  In this 
case we were testing against BBL, it just turns out that the Linux 
configuration that everyone was testing didn't trigger the bug before the patch 
got merged.

As far as I understand it this is what the merge window / RC process was 
designed for: during the merge window we accept changes that are then 
stabilized over the course of the RCs.  It's better to not rely on that safety 
net, but in this case it did work.

> Ideal situation would be gated repository with CI in front that locks
> out changes that regress any of a suite of tests run against the open
> source tools (and now simulation of the underlying open source chip and
> its firmware), core libraries and the kernel. I am aware that some of
> the breakages are deliberate based on traces in GitHub issues, and
> artifacts in the git history. This century's beginning is marked by the
> ubiquity of CI, well, certainly the last decade, so I see no reason why
> it should not be applied here, as these changes would not have made it
> into a project that has CI.
>
> Twerps. They need a punch. Not a gut punch. Just a friendly but firm

Please keep things civil.  So far I've been able to get away without properly 
reading the code of conduct and I'd like to keep it that way if possible :)

> punch, in the shoulder. Serious, but not hard enough to cause any
> permanent injury. In the right shoulder because the left shoulder has
> bursitis, and not onto the bone as that would hurt one's fist. We need
> to think about how to achieve this with a little finesse. Phone books
> don't leave bruises but they are bulky to carry around, especially if
> you lure one of these developers into a bar in a social setting. The
> Phone book will look out of place. I think just a regular firm fist
> punch would be best. We don't want assault charges and we certainly
> wouldn't want an email trail leading back to someone threatening punches
> to key members of the RISC-V community. That could be damaging (insert
> emoji :Grinning Face With Smiling Eyes:). Anyway, they can't get to me
> because I am in another country, so probability of me receiving a
> physical punch is very low, so just a virtual punch, and it would be a
> round of exchanging punches. Like I punch you, you punch me back sort of
> thing. i.e. it needs to be fair.
>
>> The kernel breakage totally unintentional. I had done all testing using BBL
>> and OpenSBI with Linux compiled using defconfig but never saw the issue.
>
> I agree with Christoph.
>
> It is no excuse. This is bad because it shows lack of basic testing.
> It's like nobody boot tests riscv-qemu with BBL, which is where all of
> the work on PMP is. In this century, most mature adults are using CI so
> these sorts of changes would never even make it into the master branch
> after checks are made against the PR. I think they are just
> demonstrating how easily trust without verification can be subverted, as
> they have visibly sabotaged attempts to have CI set up for the RISC-V
> port of the kernel, tools and C library. I have evidence of this in
> writing. The commit in BBL that breaks PMP also has terrible code smell
> as it is hidden out-of-line from the existing PNP code, is hard-coded
> for a number of registers that differs from the specification, and the
> writing style is quite different from the other code. We can't even rule
> out the possibility of a forged commit given sha128 weaknesses. There
> are so many vectors for which they can inject breaking changes that go
> undetected without CI. Of course if it was written in ink, we could do
> hand-writing analysis, but in this case it is GitHub keys.
>
> Also, the OpenSBI plan has somehow been made fiat by the RISC-V
> Foundation by recently appearing in its GitHub organization, however, I
> am unsure that it was actually an agreed upon direction. There was no
> public review period. It just appeared from nowhere. Certainly there are
> different consensus processes operating here, one an orthodox one and
> one a heterodox one.
>
> I personally think merges need to be done by a bot, and; the consensus
> from the adults on the mailing list is that SBI should not be required
> for what should be accomplished by drivers; perhaps only to maintain
> backwards compatibility with the silicon that hardly anyone can get
> their hands on. Before I got fired, I was working on the CLIC which
> potentially allowed S-mode to have its own timers and IPIs. I personally
> think not giving S-mode timers and IPIs is kind of dumb. The number of
> flops for another timer and interrupt source is tiny. That said, good
> job from many other angles as there is an open source chip that runs
> Linux and we have Debian. The SBI firmware issue is just roughness
> around the edges and we can't expect everything to be perfect on day
> one, and it shows one can save a few flops (i.e. nanocents) at the
> expense of transitioning to RISC code in M-mode as micro-code using the
> memory bus for state versus one more timer comparator register.
>
> If we have CI, we should test riscv-pk. Many folk are using it and there
> are several derivatives. It is the original boot loader for RISC-V. I've
> been a BBL user for several years. I think it was Dec 2015 when I
> ordered an FPGA to run lowRISC untethered.
>
> BTW Palmer, Thanks for firing me. Last time I had a difficult boss I
> quit, but getting fired is actually better, because we have a 3 month
> stand down for our social security system here in NZ. If one voluntarily
> leaves one's job, one is not entitled to our unemployment benefit. If
> one gets fired, then one is entitled to the benefit immediately. You
> still need to pay us for the work up until December. I guess I got fired
> because I was super annoyed by being blocked from working on CI which
> was in my contract as an exhibit, and was what I volunteered to do. I
> didn't really want to do it anyhow; it is work; it's just something I
> have experience with (Cloud CI yada yada yada). The current setup is
> really bad from what I've used commercially. Also working on Open Source
> under an NDA is a bit weird too. One can be fired at any time for no
> reason. Much worse if I was in California on an H1B, where one
> essentially needs to leave the country if one gets fired. In this case,
> I just need to move somewhere cheaper to live, oddly enough Palmerston
> North (it's not really possible to survive in Auckland on social
> security as rents are comparatively high; like the Bay Area). Lucky I
> was fired before moving. That be much worse for my partner and step-son
> if I was fired after already moving to California. Hope you find someone
> to look after QEMU. If I was getting paid, I wouldn't mind to do some
> part-time work on CI, but I have another project that I want to work on.
>
> Regards,
>
> Michael.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
