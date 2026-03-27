Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64A010BA43D
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 08:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXB33kf+6OIfRsrt04x46dOrWa4vjIWkJEZli6c6DEw=; b=O1PBCc6j84P6pm
	FDH3A9wBuxQYHN/16+WdHhPwWkCwzKENKsRSJW0xo9q6zDk1zHGh+Q0p9a5xnXy4rsItNgvBCC4Vy
	ou2KHK+Yh+WWKZQRLSxqrNDEqPZNdPeOGmyvZ/hap7IJFlDSQBZg79Q0CNeeYhp8RXsJwWpz2fn66
	ID5TD77uXVbdgRnjqFFM5qAJr3DQlbqjxoA81nkKTeEpUeXtpqwTpKOF3RZ9OoGwZQmBCEd2fOoev
	zuN+PfSSKr3ssDNVpPovcz108+jrf5qFcBFWHET3s+8OwC0z8PiXCsLKC+VPjCWqg9tJXCugnNt+F
	PO64A7Vgb1+YTL72D0vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62w1-0000000716f-2GMe;
	Fri, 27 Mar 2026 08:52:53 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62vy-0000000715s-1m65
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 08:52:51 +0000
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a1438649b2so264036e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 01:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774601568; x=1775206368;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IRXASae8rN7IgVnVI5FCS0dcfVmSoJg6Qz5lniabiXI=;
        b=DR0q+LZBRnnIKvCVZm/zvH1TjiRqtV7/XlZfJnk4Lw2+AyZ5V7V6x88CHLj+Cb1300
         l9gYAZ6P1n3opLEst+3wiScGZ7gx4zeGwF5vIK4wGizH51+iOEKe4II8HAT24yz8IWZ4
         Y0+7tIzgYgdKL/FwgYFf9a4vqQVDfVESRBz6B1g/mjLMRAGTUCz2ZEdpOJ6VjqYlxD+6
         TX/yz/97bmWXXSEiDnbbvB1c3pRmSjkNgUhJNXXVClZnAZALZIbJm5QNbkC2/KZG8bAN
         E/70T301JxgCH2XBZCyIBfGvNMxRuCgsk1+H8eP5yolJ3A73AcwkC4iX7PJUhXSxGvgY
         4QKg==
X-Forwarded-Encrypted: i=1; AJvYcCW0OW2PF08DajA11G1ws1SWa3950eX17yjzaYKmjPqJb5HdpUpSsNfZqbBFGezsFnyWILNFC89hVd46TA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8TkR72SYgBfqmUvoY3lhti0S4hXUbJVMnPR07MvVo2ghxNsRx
	EP9Qedx3vVPfWVy00h8GOdcaG4kA2JjC4Ax0tZbtLCR+1626Vwxxl0CC
X-Gm-Gg: ATEYQzzguJly21tMiuxSWYI6a7v3AFyRVrTePbGZSgS4Da4N/ZgrBmMheNnYIylA9gR
	Wfovu0JbzBLwJBFMQIl6iOBcpmr1jfSnCpLVSXZWFah0xBhO5xvG8Ls0EXKCgfuNIBGfajIJcWK
	BrqK0mfTDNEToqgxj7dfa8Ry858kiJAsMXa9XuFPx+yIPxbAyUkHn32Go3pfX6ghG13ENiGhbAP
	5MtvPPKVlpcpLufFRDQtuYKqDSEA216HGuoawOpPjIZuItRBLNyv98b6WheHQtmj/cc2RHTitmp
	K2WW0aZp+O5IU9ifdw8etJgMrKcfC86h+uRlLjCh/y+fwrF395QCb7eSXbpn0qnPENrtsaJisa2
	sYjuekVil9OGfjCc94VX2zuRc5+DOYOvd/pRPPcfWjaJ9FwGN7EUg92OKNrMAJhSZdBRogjJi01
	w179UeCKj+EX/b6gQDP+an8IIRkaCTjzLI3kh4vGPpA8uH1z4=
X-Received: by 2002:a05:6512:124b:b0:5a1:38c4:424e with SMTP id 2adb3069b0e04-5a2ab92aa0amr336078e87.7.1774601567731;
        Fri, 27 Mar 2026 01:52:47 -0700 (PDT)
Received: from localhost ([176.106.245.85])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a0689283sm1252299e87.44.2026.03.27.01.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 01:52:47 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 27 Mar 2026 11:52:45 +0300
Message-Id: <DHDFR4K758TP.291K17J2J5VL7@altlinux.org>
Cc: <soc@kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Hal Feng" <hal.feng@starfivetech.com>,
 "Conor Dooley" <conor@kernel.org>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
From: "Ilya Sorochan" <k0tran@altlinux.org>
To: "E Shattow" <e@freeshell.de>
X-Mailer: aerc
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
 <DHCYMK8FEH10.1Y1YWLL3J1HSK@altlinux.org>
 <ff792101-61e3-4470-9c5c-eea375edc9fa@freeshell.de>
In-Reply-To: <ff792101-61e3-4470-9c5c-eea375edc9fa@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_015250_486937_1A6512B1 
X-CRM114-Status: GOOD (  25.33  )
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

> On 3/26/26 12:27, Ilya Sorochan wrote:
>> On Thu, Mar 26, 2026 at 07:36:07AM -0700, E Shattow wrote:
>>> ...
>>> I have done an ~80%+ analysis on Ghidra decompilation of the JH-7110
>>> BootROM, and openly invite anyone that would like to help get this
>>> ... 
>> Appreciate the effort!
>> However I can't see how this is related.
>
> Your patch was sent to a minimum audience which perhaps if you are a
> first time contributor is understandable but I would have hoped between
> you, Heinrich reviewing, and Conor accepting the patch someone would
> have noticed that scripts/get_maintainer.pl was either not used or some
> overzealous trimming of CC is going on! Also this is probably the
> dozenth time I have explained at great length to Heinrich my concerns so
> it is deeply disappointing to miss this opportunity for contributing, I
> guess I consider it disrespectful though maybe no fault of your own
> there Ilya for wanting your hardware to continue working as you
> expected? I get that... there is in no way any desire to discourage
> anyone from posting patches or fixes, this particular situation is a
> headache for me... maybe I'm the problem okay because I cannot reverse
> engineer a whole BootROM on my own, I only get to 80% and then people
> have their own motivations and reasons for not wanting to spend any time
> to do this properly? :)

Sorry, I'm not trying to be disrespectful. Yes, it's my first time. Kernel docs
bewarn of spamming therefore I trimmed CC based on the assumption that those who
interested in devicetrees are present in devicetree lists. I guess it is not
true which seems strange to me, but okay.

I'm not asking to support this feature properly. It would be nice to have but
it is hard and StarFive is not making it any easier. However I'm asking to keep
it working while you can if you can. It worked for me and other people and we
would appreciate if you can delay breaking it as long as possible.

>> I traced this property a little in the U-Boot repo:
>> - 503fc8548197 Hal added it to VisionFive v1.3b (with mmc pins)
>> - 6bbe95ef7208 Hal moved it (and other common things) into
>>   jh7110-common-u-boot.dtsi
>> - 27f617019dd0 E removed it with jh7110-common-u-boot.dtsi
>> - 762f85bb2e36 Tom squash-updated upstream dts
>> 
>> New device trees did not contain this property. This is how they were introduced
>> into the Linux: b127dbf9e1ebbfbcded4 ("riscv: dts: starfive: Add mmc nodes on
>> VisionFive 2 board")
>> 
>> I do not know if this miss is intentional or not. However it would be nice to
>> be able to boot from SD-card again.
>
> There is already nothing to prevent you from booting Linux from SD-card,
> with U-Boot SPL and U-Boot Main located in SPI Flash as is recommended
> by StarFive officially.

Yes. However I'm implying the deprecated SDIO3.0 way. I agree that this would be
nice to have in the commit message - if this what are you talking about.

> I'm glad you sent a patch, but I still object for the other reasons
> mentioned.

I'm glad to talk to competent people in this space, however I still hope that
the kernel will refrain from breaking this feature until it is really necessary.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
