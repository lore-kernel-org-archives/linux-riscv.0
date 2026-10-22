Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D946E606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 19:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q2Cyhwsa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NCGuIVsw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1WcQISH+ozfYnJAHLefYK/AdYhMvj8YPZkWyOd1LYdk=; b=q2CyhwsaBmA6KiOmGHff3DIYRk
	QOWrObDa3qvIPhGJ6EG/FINsyHxXx2/BwVM46Gm3TTLrCcmlwALX6tibCW8gcpLvA8ef/+aqAqhms
	SmVhfWH7p4yqK9XoF+1VOdtHLtM05AN+EeXtPLikgARyR/GBn8YmW25zREviT5vDbkehUv/gcB/uw
	+QxHOZ+ymiyk++ui9HWjO9pF26dk1K96oINBcSOTxZ91XE72EJtvdcwjg08TgD0h0gzZd9eDtzAjb
	5em68MqEsV/w5R33KRfbEfOte06V+Wg+3yRf0DW2gTADji/ogOxJNRHAMYIICmUFEEGJqEvKP8SEC
	tGzx7Keg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJy48-0000000EmIQ-35Wf;
	Thu, 22 Oct 2026 19:03:04 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJy45-0000000EmHc-3qzf
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 19:03:03 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so251831fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 12:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695779; x=1793300579; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7dOAuB9XyFaeFfFVegEDpoF2gtsk0VyOm+nWLSWg1aM=;
        b=NCGuIVswq5HL3oJYw/ciJnxTRe7gQ8odRPKe+8ak+epyJlj6Zd4kU4DaMJvgoITwtN
         qqqUVhkq9YiupHuDcg8vludcQdek10zhPfnH3l1iuH9q3tK9bd/nSYLIsvy/uFO0mMgA
         DON6UwmUIM9XWkWO42awqvoX6tlFGEXmzPeMfHJE9rLvSYlXcCsc/ymRkBhgvu8yjyN1
         F2BJnRRR26XZS3sQ1KkJg/XTZ/uQ7eeGJlCaTuJ/4X+72Up1GnwRPbym82oHJ9yfsGbs
         zzwvNW3QzxloYWWGhvJfhxEoV/2iJJxDmADVR+rPcjers9iYYXvO/IHHbhM2EBdDESQh
         Kc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695779; x=1793300579;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dOAuB9XyFaeFfFVegEDpoF2gtsk0VyOm+nWLSWg1aM=;
        b=ww4XHBoFDFNQuzQ8rWbR6BZo0xEn1FwPAEcbzK62qKMcdzzd/wbHaEXfSK54HUSLQF
         1/9H9F7o4NJMLsEy3zTKMj9B4ket69/uQ5SFfmQ00Zu2irlnjKwPi+ZwNn/KYNPOXvQY
         4QUtJqBm3CU9W6g1oWM1KFoWnXP8zI31uy5/bCasIhIKjZSJXLMm228QIrT0rr+mJi5R
         8+Rw2mLNAC201Ap7TTNE9zCuVsLkpDRzstrH3rGAaKaQXpVTIP2I5UbGf+D4jn66ucc6
         eOj+DEvK/xGKv4VT3TbeJo+z+oYPuXARRcVWUDlmLx/HYLsQLivx/GLLHvxP8Hxh+D3C
         OXcg==
X-Forwarded-Encrypted: i=1; AKwUvBxuuULLy8VMK8+toYkKkxWkFO5Gba4b1l5u6izSeya3k9QanmtT41YRpmAK0pt61qWLQ1zzPRo52EQk3w==@lists.infradead.org
X-Gm-Message-State: AFq9FYKJZiMqLelifMpo3y2JrMQTKXkKWrSuaMJsPvUCegH0W+DeJBUH
	xNfPjucrrUAiVOY28NyX72rye1xkLtNEhqwrwo1RW+uSTBqCuyyTo5E1
X-Gm-Gg: AYBFou2ZivYkLZKy//a1iEcxeaj7T/e1VODvkabAuSuME1WuTPv5Nxk4NLk/V3Jw+ia
	H7kLlThjc0ZgQdJUjfQmX8InLE4HCimvAIUowOoOeYKnDASarCOA/rmrX+L58TGm95h52Z9egMU
	mmJMFJHQQDK0u9xMknaGVXoMJmWXKpry0tjq4DdkFxVxkrhu+gNdV1eaPXLXunBL+9QXWPO9qAO
	niDcELD/wefPQrc2ibX0L7bnz6NZ4VEvoEnpHMUL+6JhOkc5xy7PFWduuxSVNKLi8P0pHsGfcAv
	lHiHdd40GKiu8LnzKOrTj8RgNaA+dcViR5/mQpgod1sxLzIWtvBF8RFx4nbTj+0p2yDFGPomEZn
	Vm3FwA4+/zHOoZ+HUOJ9DE2lANPUPYXRLvuexslp3KWRmTE8EouuE1qvcxxtoupt88Be3YbeMYf
	2K+XlL9h/5PQUNlLr1bJiKEGS2PsFOSzYIpvInP7B2sn6q6rgZ+/fLb7FtEmw2MOKc8fNYP4rTG
	Uz8z4eHiDt9hdQfiL3y22wYMmx9/yVe+J7kH1iD9pS5nVMVgcn0PqTrzemYl4Y3U0I9M18bpcZW
	Kb1ZxWzybiXPXNGnUnzBf/hJE1XfJm8ziKbsHZI=
X-Received: by 2002:a2e:a54c:0:b0:3ab:28cd:f612 with SMTP id 38308e7fff4ca-3ac4409fd78mr17450261fa.1.1792695778803;
        Thu, 22 Oct 2026 12:02:58 -0700 (PDT)
Received: from ik5070.localdomain (82-131-69-225.ip.elisa.ee. [82.131.69.225])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-3ac65cff1e0sm99901fa.20.2026.10.22.12.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:02:58 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Indrek Kruusa <indrek.kruusa@gmail.com>
Subject: Re: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Date: Thu, 22 Oct 2026 22:01:15 +0300
Message-ID: <20261022190203.1998156-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_120302_019371_690A1AB1 
X-CRM114-Status: GOOD (  10.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I managed to run this patch series on a Sipeed Lichee RV Dock (Allwinner D1),
in this setup:

  - FreeRTOS on the HiFi4 DSP, running a task that contends for the lock
  - a test kernel module touching the same shared memory, with and without
    taking the lock

The series is applied on top of v7.3-rc7.

What I ran:

  - probe: 3005000.hwlock binds and the driver reports 32 locks

  - mutual exclusion: lock 0, taken alternately by the C906 and the HiFi4.
    Each side added 1 to a shared counter under the lock, 1,000,000 times:

      counter=2000000 expected=2000000 -> EXACT
      tripwire linux=0 dsp=0 -> no overlap

    A tripwire field is set while inside the critical section and read by the
    other side, so overlap is caught independently of the counter.

  - negative control, identical loop with the lock not taken:

      counter=1885761 expected=2000000 -> LOST UPDATES   (5.7% lost)
      tripwire linux=100302 dsp=674915 -> OVERLAP DETECTED

The loss rate in the negative control varies between runs (5-19% observed);
the log linked below is one sample.

Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>

I put this test setup together with AI assistance. Sources, build
instructions, ready-to-use images (DSP firmware included) for the RV Dock
and for the Nezha (untested), and the captured console logs are here:

  https://github.com/ikruusa/d1-hwspinlock-test

Greetings,
Indrek

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
