Return-Path: <SRS0=rZMy=QM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915EEC282CB
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 23:01:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46DC520844
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 23:01:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XoRRK6uu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lowrisc-org.20150623.gappssmtp.com header.i=@lowrisc-org.20150623.gappssmtp.com header.b="TpOtxt0b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46DC520844
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lowrisc.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMOxlpKa1yklWFlc/0lPoiT2m3Rt9u3wLK9hUnZErF0=; b=XoRRK6uuH2pfwE
	MAIbLKzA2zDyc9oTGp61qSP34QZSt/kXky4G5owy3H2jcBUEghQJj4zH52l7Q8178c6bwmqn+qvST
	TyAZ6F0rTyLy23Nbai8kOiOs4V/km6/tj03w4NocmloG4Wf6qt/ESyHoCr/RRiJ92vMiaAmqv2r3i
	rm6RK21XeHZkuydexIH6gbJcaSOmE3gscyoTAjDVR8KeAPtd6H8ryJVXtOkJwSY4dceoC1roxr/lI
	NBxtydnN7rjqwLgYpbC9EPRj1LTNsnORqolMleo/c4arVfSiEPMpGIG2qfL6u/pOZnrX+ADPfB4dk
	0VvP5admNLX+U+wIYn9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr9j2-00071q-M1; Tue, 05 Feb 2019 23:01:56 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr9iz-000709-GS
 for linux-riscv@lists.infradead.org; Tue, 05 Feb 2019 23:01:55 +0000
Received: by mail-vs1-xe36.google.com with SMTP id u11so3257214vsp.11
 for <linux-riscv@lists.infradead.org>; Tue, 05 Feb 2019 15:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lowrisc-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ajr1oTf+5B5mTuh7P+PECUX3gkPCwkVbRoOkfav+L3k=;
 b=TpOtxt0b9AUERL5fDvvXZ0vEF9Z3nNCDAo/lJtodl2QkI9J23mgC1+wbIXBjgb8jwn
 ph3mZcLOd8BfVsakKq2Kr3JBAtwyVOiV/q5hnwuJbB6ZsrBYMrPHbN1RDkqWPlBtYPKO
 wjKPs50MdTHofS+MDvSEPkgIrBvQaf9+dO4kMnEMpaFZa7vB/eVTFuda4xpSkvG1bHsR
 QqtdhR4FUynu3VjOBlOaKkFX1U/6fS5yUsByqN05On+F9CepfcfqGrWltgCFxsW4Gyx5
 0iPz8wN2uLNyLX4ANWLujRuwtk8iAP07GZLd2OB4fHHs0TqHeTkyo4f9FOQSsO5koodG
 lioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ajr1oTf+5B5mTuh7P+PECUX3gkPCwkVbRoOkfav+L3k=;
 b=BPXi60fkkxYqlBS9e3lN0259X9afOMmPjCE8f0pd7IXCniRx5rXTl7mqKqGJfO/Bug
 FEzvWg47fDmooxIycxuo/UkmZ1UE+ekXiqdSWQ+0gY9wZxRMgYC/FUHpZVyQmxKtLTWX
 dlDR3TKglY1lcmzKQ7QVovNuy06cBhjzXw78DeErLJ++aq2DLy7gJ5xU+hvvF1YzHRnq
 7C7iDN+m0UNISZwgraIW6Gk3/CIR/hNTgSzoqQmH/gYNSSRMrk9Gk48fYdLPotcc6iCN
 pFX90cXQGx92Bjx8wTA3iyIR+eVz65bBvln4uPIh7CBrJFRxkM+54Jwd/lDaB+jesZ9H
 /XcQ==
X-Gm-Message-State: AHQUAubvzW4rVXwylbJKSNa50kIfx3z/sTZ2WV+lkLP5rjJDe8Y95AM1
 /Omyo6ayRSarqoYBOVrpbgiPRNJeJ9Wp8gTl8NjnNw==
X-Google-Smtp-Source: AHgI3IZGtaqRibfnlLtUx/l8Z6kyKifiv+6D/SZtrxp8rkqIk0nzZ8OMLrIBpF6WIG9SshSs3LZoVWwXSV6lOhxRJlM=
X-Received: by 2002:a67:c202:: with SMTP id i2mr3105002vsj.11.1549407711734;
 Tue, 05 Feb 2019 15:01:51 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
 <22450f8b5b18421e486985725b1a58167662fd2d.camel@kernel.crashing.org>
In-Reply-To: <22450f8b5b18421e486985725b1a58167662fd2d.camel@kernel.crashing.org>
From: =?UTF-8?Q?Lu=C3=ADs_Marques?= <luismarques@lowrisc.org>
Date: Tue, 5 Feb 2019 23:02:05 +0000
Message-ID: <CAPhv3nqQRC=jsLuheFPa1=qj7_rZ4D9q8nTr_yK7qeotobPbnA@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_150153_727062_E842060D 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>, Atish Patra <atish.patra@wdc.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Alexander Graf <agraf@suse.de>, "zong@andestech.com" <zong@andestech.com>,
 ron minnich <rminnich@gmail.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 5, 2019 at 10:30 PM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> IMHO, something like SBI has value when seen from the perspective of
> providing a thin abstraction enabling existing OS binaries to run on
> newer/different systems *as a fallback*. This should be done with the
> clear intent and guidance that ultimately, the OS is meant to grow
> native handling for those cases and platforms.

I like the idea of it being a fallback (and thus something that can be
replaced or complemented at runtime by the kernel, or even be absent
when the kernel has full knowledge of the exact hardware details).
That also meshes well with the goal of it being a fairly minimal
abstraction. It's not clear to me that the current design path will
take us there, unless this becomes a well reiterated goal, and the
implementation decision are made in alignment with that goal.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
