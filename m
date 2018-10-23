Return-Path: <SRS0=kxho=ND=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9825BC67863
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Oct 2018 08:21:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FCB207DD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Oct 2018 08:21:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HuuRvMFm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzGo1m2I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49FCB207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKMqUUOGuA6KGFv86+riHEF/pFJjZ2XklehFktnsB8w=; b=HuuRvMFmuhVFzN
	MsV2sUQiFOFDiX28yhnHaHEltNsZfSI7WY9M1W+MjXbmkeqF/xT0U4TVcQsnwKWe26SrxW9lx4Oqs
	aGXHy5/wYTzPy/BxM3IkzCCxSMlPVIU5OdsQsEcelXGVjI8Y57UKklDQCrl2OoI3IIDqer3IAR91k
	i4eNATXwVgFEvN+2ufs2x83JKYtFa5BfKTMueLDDEh7Fg6LZle+3dHAbyz9pPgeD27elfBBDvmpHj
	pkwvohBEprNeOIqawksCdJL9bTTIwUMCvddXJd2EtYiTNCv/bNuQ68beqilAAOI6SWG9SLf/uTfp1
	ZPfYP9zmPkbqIg8Y0wsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gErwe-0006AO-Jm; Tue, 23 Oct 2018 08:21:44 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gErvn-0005uy-P3
 for linux-riscv@lists.infradead.org; Tue, 23 Oct 2018 08:21:40 +0000
Received: by mail-oi1-x244.google.com with SMTP id k19-v6so404279oiw.5
 for <linux-riscv@lists.infradead.org>; Tue, 23 Oct 2018 01:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=enmWpO06XvCsb8oZhgKMElEEunSocP8/I0ru4zKD6tU=;
 b=AzGo1m2I5xexWjEqaPt2XCU8TxvTPwDODxV4suldAB+9nTt+glg31+/sQIZR4KZACS
 nbejysq37FeASwSzNQBNg30+UxeUXurRHPAors+LdjU9oORfVF5+QyFD3RIXbpFJHA5C
 /RElrhLucNcjcXUUUE9xpmUAwZFVFAGRVgz60ZjIxmHbMVpw0c8W3aIrWf/moj2O6Wra
 c/qekswy/M3Y6dNFuaAarBa8HFcxiGFKkyS9Tznthrpb9YIjb1+snHVeuo4pwNjnTPv9
 rIMptiIZN+WfOvGfI+LtDySQscdNV0fumrQBknrWN/err+JfMjhigWqJ6oFpiYGQCRVG
 QaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=enmWpO06XvCsb8oZhgKMElEEunSocP8/I0ru4zKD6tU=;
 b=RKIGGTjRNqMak7ybOLK2S77mdpLZ6iC5k+MN/CKzpMOcQ8Quxh2P5RmDxPJjZYrCtr
 DkBoy9nISNk1JuxBh4/ogdaJB16q5e00nd87u7pjRXdEFR8GxkPK38hmyktTGqqSCXaY
 UEDCVCiCUzE3M7hHHV6hDhrX1tUOvJM7rdtYMLRHkP/LJWKtdpAI/Jhm1MuuZkKs/hFW
 Npi/TzxPy8NJeH1gsxcI+Uox8LFDt5CjzcWRama3JTwJNxFBKH1A/DZlHtnjKKkl/nac
 BO0YRI8EK6fltiuYQXwPfe4GMgpZYli83wcq0ySdALgeHN7R3EJ82zg1/fcP7FCVCa9/
 igkQ==
X-Gm-Message-State: ABuFfogV+Drt7Y86lshIQgSdwUxxj0o26VmMl0deaZhnP7gcWwN2ea+V
 bmDxeHXA0T9IH+ckqB77Ulswh/0kqKtT9RgNKUk=
X-Google-Smtp-Source: ACcGV62ejqpStHrIdaymwRxCJg+T2uMaIumJbkh5mm4J8fTv+dTR0FCzxMg7naqaT6Wvtbod4aCkHx+dbf0E4/FQHl4=
X-Received: by 2002:aca:3987:: with SMTP id
 g129-v6mr26688068oia.152.1540282839480; 
 Tue, 23 Oct 2018 01:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-737b95bd-3a5b-44c7-ac14-3af4bbcca32e@palmer-si-x1c4>
In-Reply-To: <mhng-737b95bd-3a5b-44c7-ac14-3af4bbcca32e@palmer-si-x1c4>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Tue, 23 Oct 2018 10:20:28 +0200
Message-ID:
 <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
Subject: Re: [PULL RFC] RISC-V Patches for the 4.20 Merge Window, Part 1
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181023_012051_845137_904ADA01 
X-CRM114-Status: UNSURE (   9.00  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181023082028.yo8UaMXJAKA0BDbmlJYRryxs-79n8-IbmaPMA3tcoQI@z>

On Tue, Oct 23, 2018 at 3:20 AM Palmer Dabbelt <palmer@sifive.com> wrote:

> I'm pretty sure this is our largest patch set since the original kernel
> contribution, and it's certainly the one with the most contributors.
> While I don't have anything else I know I'm going to submit for the
> merge window, I would be somewhat surprised if I didn't screw anything
> up.

Hi Palmer,

Do you plan to land wip-seccomp in 4.20?

It was mentioned back in August:
http://lists.infradead.org/pipermail/linux-riscv/2018-August/001182.html

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
