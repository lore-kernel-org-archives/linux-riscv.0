Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BCFECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 17:27:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7429920664
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 17:27:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IixFT+9y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="A/0HrPEc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7429920664
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=xStzQUnKViclx9ZAs31QmPPV6U21y0JgtF+41MbY7eE=; b=IixFT+9yzRdDW69Gbat6/NcM1
	1ZpynNO2xZ7Y5YdNnTAOyGGrvBLyYFxlAb4gzJDlNJQdes0VHWypQRpVfWoTzETLIoF4t5q0wwm1L
	098eXv7JiFlfBuXH6ExdUMPqdhm2ViyWlJ3OKDypEtXxRF4KeKJSsgxvAEEv7ASnKIADfWNb8KBxX
	EsR8Q0p3ZC+EyADQ/MG8CN0linQoT1nFCmN3L1xrH/WObH2TT8cBPiSBPls2MJG4eyqdPtPSahzTZ
	UNe1odCmbjv+heHsxUvfCw5SUKQN4v0bLIok6G6s8BGoa7JBxhzhVrWF22CIfVrQwZbGVJ9c9ceI6
	B8t2+JoXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHuH0-0002bz-Dw; Wed, 31 Oct 2018 17:27:18 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHuGx-0002av-Os
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 17:27:17 +0000
Received: by mail-pg1-x52b.google.com with SMTP id o14-v6so7696176pgv.7
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 10:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=XqrGJ6ueUPpYkSA5xeRa52Ae4kB9RmSSV9bQHcWv5M4=;
 b=A/0HrPEc58dnpe72vfSD2N5DTeCiO3itdw6HH9AFXXIOIP6HflXE9lpNPbQzR6X/Up
 GkL5k+hbtt6ZplbRojCWyGpzl2ZOD4Xb7x4r7jQ5t82BYragogIsbT8mQlV+Uzght8Ob
 xPYjPknQQz5q8WrVjGn6Qf6gTPgFtLYgaMkPxnx94IKhcqQ5KmlFAizLJXwZEUjN7/H3
 mT2b1AGJCV4rYmOaaiRCOVINdjCFYPvss7oze6W7Ru3V7pc7Hye2w+82IZ3KZ7i9U9tc
 cfVy9CdTKn2/r8wh9Yg6fnUTL6wty0cQTIjr1GJHp8HTRhUFBeC2PSgrv0UeZIEF8uAi
 oNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XqrGJ6ueUPpYkSA5xeRa52Ae4kB9RmSSV9bQHcWv5M4=;
 b=g9E2jTQ4iQdl8AYIPZGIGt5TBYM0o6py3PstuClTXYOSszn9x8GPH8Dfe0BCYCPnjg
 PvPbDXpkLrrb0A/8PMjvLmm+vSif21Aj4sMvW1Vn8KLC3SgBrNEPUEgDNess+oBu8CEK
 JT3yndd9wb4ttm+/Cc0rilW64OI0ux5eNVhzFWn6cLMDovSg+WfFaJ6i4Zdhh1rMG/kn
 n06rca4hxgdhyPO/orbznt5g0Yw898z1nkl04SVrjLXcamRMLnTfDSBquc9qzj+FEWz1
 iFo3bT78wOLH+hb3PfInXjUJm0ZnncXW5tozsH4MJBSDgkzknkc3JfP2ZzA78e0TZBk4
 4b+w==
X-Gm-Message-State: AGRZ1gIVP4XobkVtAKA/yKht2dBhr9oxu2FfQjT0XtMiJuqup0M8ff1q
 33BYtfIYeqpp2TAQSPFMWeqfTQmqjzE=
X-Google-Smtp-Source: AJdET5crPdgkawOVHLWK4O7bC3pjGXkUHNSsbhAykVQDMr9FZRSEWNxkEtKa8Cn+2H+4jVFWB6cgGg==
X-Received: by 2002:a63:fa4e:: with SMTP id
 g14-v6mr4058564pgk.18.1541006824362; 
 Wed, 31 Oct 2018 10:27:04 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id v5-v6sm40161438pfd.64.2018.10.31.10.27.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Oct 2018 10:27:03 -0700 (PDT)
Date: Wed, 31 Oct 2018 10:27:03 -0700 (PDT)
X-Google-Original-Date: Wed, 31 Oct 2018 10:22:55 PDT (-0700)
Subject: Re: riscv-linux-4.19
In-Reply-To: <mvmwopyl79b.fsf@suse.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@suse.de
Message-ID: <mhng-4c9b501e-efb7-4c0f-91ce-84f783d2ad80@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_102715_811345_4DEC0E10 
X-CRM114-Status: UNSURE (   8.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031172703.DSRVz5o6CRlSFbp67qPIacTt88o8eICLl-zJwCH-JCA@z>

On Wed, 31 Oct 2018 03:50:40 PDT (-0700), schwab@suse.de wrote:
> On Okt 29 2018, Palmer Dabbelt <palmer@sifive.com> wrote:
>
>> I just created riscv-linux-4.19
>
> Did you forget to push it?

Fixed, thanks :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
