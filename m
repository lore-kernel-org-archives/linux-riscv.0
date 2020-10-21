Return-Path: <SRS0=Lzn7=D4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E793C388F9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 15:46:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE0E2177B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 15:46:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c54eOSLJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pa58BoU7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FE0E2177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EEriGl1jZ2TcJfxMGPFkdbuOzShNZNMWm3S+Fz074GU=; b=c54eOSLJ1+VPslgPRKqeembB0
	ZsgJ8HQcWI15T13ZmyRTlMyXpIFYknfgl/LwSvPtR/L8AwDKQ7ddChVfTYrAQY26+X/s//fdH/8wW
	NvyhCtyM9anbDo/q9HwiTwO772zmkYxZGP+YlUP1r3kbv9ETVLq56YcbcDQbZIYgRlclYNztgNZ0m
	i6R8sKc2QbqzCXQQkkh+9RWhuqhdu5FlarhszSQQsqlxgfs6KQjYuZPJEUeH/oHOeXzFIBogwYQbo
	ZEt9Qabtv3Jz7z4foCAZzuyI7liCobSW+g2h6IhhqZ+AHtCmWzT8f5cZfvAygxmxdigdyld2c4D88
	Cf+yHjHeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVGJw-0007p9-KO; Wed, 21 Oct 2020 15:46:36 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVGJu-0007ne-LI
 for linux-riscv@lists.infradead.org; Wed, 21 Oct 2020 15:46:35 +0000
Received: by mail-ej1-x643.google.com with SMTP id a3so3893511ejy.11
 for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2020 08:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=7ehyNgQOK7CqueR6HFQ7GOu3HkZtQCthPvOvqzAFJr4=;
 b=pa58BoU72nD8x9JfH451BnGeVPr1/EavTuLx1ixWLIIHKCOdAbi0TsleJ8QgwtYtdR
 pVfbW+ZjFM0p/OfkmkmleB1vi02LILpQ39OUKcyFXwKvgEiqBNS79pKmHNjtXEiKBhSi
 pohh7n4Yxke93I+gZCjIV5wCyHdFtGPwaZ4wZ3OHkEGNhYWNJdFwMYL6qfvb2VE+62oN
 ZxXtfGDbfUDax+mMdUWG+5mkU9ttXSXnEs9ALgEismZxYFTCOI4w/fG+/FNNF15M4Sr/
 lfgvbD48CWNKTykdVeGRjDX4rWs9to+6qq09zRudfEkVDGLqvuYuALoOCVMf+BrCl7on
 +gbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=7ehyNgQOK7CqueR6HFQ7GOu3HkZtQCthPvOvqzAFJr4=;
 b=A0Z9Q4wBbWGqmjnOj3zGO5rsDsH4EL9WJ3I9E9rPOAZAf/rE5yPCjUgMhXGsTinZDA
 aeFOCa8ws7a2rhB0piB5sj9G8yMn+xqTnWegH0B1MJb124PEK3D5nHt25mVNBbTijB/F
 NUZEFrVCikvZ+Mfl+cZNkuROW7OAi/87wDv6u7UX9mLHzdYUhM2kfoZtgkxCNhFgQMEZ
 ZUspnyjg78zAmjhOrq+GmWcCxMwsxK3Aad7Aa7Cycjd7/rCjYKTWH/vYRRqyYSwoXNs+
 IBF45I+dn388KDC9PWuFR6zEzV0y8ZnmYTEt2SNLGvlAGnCMbwvYfANseT2fJVW4flUW
 girQ==
X-Gm-Message-State: AOAM5318lZnxt9QrkhQGPUuYzrlcKBcuzmbvbgutQ4YFyjWl6vQGnCPP
 +GdT2izoFc7kVIF+zMecomTlPxPLLtc=
X-Google-Smtp-Source: ABdhPJwbEgmR444iU3kT5iZcp7WU4/X4Lu7XdAZleSkjQR6OG1NcykLs2li3WctaKTzJEciB0GzWfg==
X-Received: by 2002:a17:906:3cd:: with SMTP id
 c13mr4062189eja.25.1603295189979; 
 Wed, 21 Oct 2020 08:46:29 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 ss7sm2445870ejb.28.2020.10.21.08.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 08:46:28 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1kVGJn-0008Er-Pi; Wed, 21 Oct 2020 17:46:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v4 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
References: <1603291814-240377-1-git-send-email-sagar.kadam@sifive.com>
 <1603291814-240377-2-git-send-email-sagar.kadam@sifive.com>
Date: Wed, 21 Oct 2020 17:46:27 +0200
In-Reply-To: <1603291814-240377-2-git-send-email-sagar.kadam@sifive.com>
 (Sagar Shrikant Kadam's message of "Wed, 21 Oct 2020 07:50:14 -0700")
Message-ID: <87k0vjk2ek.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_114634_700293_83B6BBA5 
X-CRM114-Status: GOOD (  14.05  )
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
Cc: andrew@lunn.ch, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, linux-i2c@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>>>>> "Sagar" == Sagar Shrikant Kadam <sagar.kadam@sifive.com> writes:

 > The FU540-C000 has a broken IRQ and support was added earlier
 > so that it will operate in polling mode, but seems to work only
 > in case interrupts property is missing from the i2c0 dt-node.
 > This should not be the case and the driver should handle polling
 > mode with the interrupt property present in i2c0 node of the
 > device tree.
 > So check if it's the FU540-C000 soc and enable polling mode master
 > xfers, as the IRQ for this chip is broken.

 > Fixes commit c45d4ba86731 ("i2c: ocores: add polling mode workaround
 > for Sifive FU540-C000 SoC")

 > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

LGTM, thanks.

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
