Return-Path: <SRS0=lSM2=ML=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC3CC43143
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 02:17:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0502220685
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 02:17:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KOkeX1y2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ABioRp+F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0502220685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=/5mdQMGymcvPoTqdt3MMDeKBf2u51qbBxlPPrDDqMMs=; b=KOkeX1y2XSs9rloKKHigVJaXc
	bsNsAF1WF6VCpg+yczAPOT6ylguRa3rEPhFM45ZEEEeTSRXulJN7OJARPZCVr9aOCPGLCM16NpMyr
	sYHkEv9hjgPcAVqu15gxlhadUMLJJW5tf44oX3gzd8oU7OM8bawqcZnqBRdG4LKQUbA9/oibmN+TG
	HNX/IqZjLSkANMUE8f342IQg4cRmUc/RTYQeZOdy7VaMR384kPsElamq6W1Rz7GtbGdSI5VvCBsFm
	MSPFCidc8fAyMxhwn0VevNR2qRbNkXj3Dmn7Kgfc96++VNepXeDbjOSO4FkngjVwsHW9rFVGvqBa5
	V3HAHQ6tA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g64p3-0005u3-8O; Sat, 29 Sep 2018 02:17:33 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g64p0-0005tL-5z
 for linux-riscv@lists.infradead.org; Sat, 29 Sep 2018 02:17:31 +0000
Received: by mail-pf1-x432.google.com with SMTP id s5-v6so5452369pfj.7
 for <linux-riscv@lists.infradead.org>; Fri, 28 Sep 2018 19:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=i1+FYFAFa83jejUyqRLg3rtXladoe8pyfZD2wK3kQyI=;
 b=ABioRp+F4mDOEEwaFZqZt1qkEoSKZnA0VqGE6hLI+SB2pc9hIyMS31szZi5EyLZc5S
 X6QydtSNUPOhCVB9KkOuO0PPRldb0w9UYt5w4lA8I8JWsOQZBPP1vShRbs5b/ikK3CX0
 Y25od4XOAl6pCbeMvkIMJNRNOOIFbmL7RYXuHEp4vzUSloXJuooamNmDo3ZyZ6eCg22b
 XpRarQTUpIeEzCUrkrOjzh3GMqfsfYEiDRqNaaFfCXFXB79MNU8u2+e63kk4ty4ySXM8
 dvJk6E+Sv7iBLQWhOwPjuWjcopc1QlmGTsTB9ongopiewbWZ9nrabqqmJoAFiBDebLUc
 p9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=i1+FYFAFa83jejUyqRLg3rtXladoe8pyfZD2wK3kQyI=;
 b=tRUKGl596gOJ8stEtaPhPHQiGZQt79Xu9gHhREU3s8eiceEBLS++Pg2eSykFT21M4K
 2c09rUuLTv9c9i9JjavyR1XHkrc46qIr16uONSMVQyvPRb+WvLACTskKW2gQpfPBWi7Q
 eZ/pBcf5mX8yjgWu3RGnTDYcjuXNkPlxyasHNlbrtZZEviyVV9pA/cxNniMuHr1FgRxT
 Ul8yROMJ7EVfaemkdLfkgzssnuFW0hs26SVH5MkGjJHDl83/8GQ/atj6VA6lOcKcvfT4
 QTnGc2nP0fItboaq+3glat0AUJTXBFjCUcwfVWDcE8DV+JA8xWh+hADjdODf8DJu1izL
 px2Q==
X-Gm-Message-State: ABuFfojv3Ewhcp1qoRHvp5BWhl6fHczgKmCmeMy7r2D+ARpJAOvujiOh
 rbLeyiaL2H+ddPaJz61w5TbsLwc4yrA=
X-Google-Smtp-Source: ACcGV63bCuu3yg7sj+QH99+Rur3yC5T9hIwDALhlfDjgfz4URkP1UNXhfjebD1e9n2vJQjpCYjrUTw==
X-Received: by 2002:a63:7a50:: with SMTP id
 j16-v6mr1189417pgn.112.1538187438483; 
 Fri, 28 Sep 2018 19:17:18 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q24-v6sm18601180pfi.165.2018.09.28.19.17.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Sep 2018 19:17:17 -0700 (PDT)
Date: Fri, 28 Sep 2018 19:17:17 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Sep 2018 19:09:26 PDT (-0700)
Subject: Re: futex_atomic_cmpxchg_inatomic is missing
In-Reply-To: <mvmh8icabwx.fsf@suse.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@suse.de
Message-ID: <mhng-b1474fef-9750-4bfb-be90-5e4bf4c964d4@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180928_191730_256075_560F921A 
X-CRM114-Status: UNSURE (   9.67  )
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180929021717.rTYlvvsQ1EzUFr-rlajEXSOQ0MMZs5Zk8qrjR5R7VTo@z>

On Wed, 26 Sep 2018 01:41:18 PDT (-0700), schwab@suse.de wrote:
> The riscv port does not define futex_atomic_cmpxchg_inatomic, but glibc
> is assuming that set_robust_list always works.

Yes.  Someone has pointed this out before, but we haven't had time to figure 
out the correct kernel implementation yet.  Properly implementing the whole API is 
probably only a hundred lines of code, but any of this lock stuff is always 
very slow going.

Christoph published a simple Kconfig workaround a while ago to turn on the 
generic support for non-SMP systems, which might help you work around your 
issue.  My plan was to construct a for-next branch over the weekend, but I 
managed to do so today so I might have time to take a look -- no promises, 
though :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
