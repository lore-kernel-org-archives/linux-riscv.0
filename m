Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E730BC5B570
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 06:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwTY/+zvF6Ob/fjKxf4HWnazbXAEoXCQ5f7pkdLtxLA=; b=MnF0oRjcN8lmMR
	VU3cy4d1LkauK3cWngqX64tTEBxH/AYH/iVj9eq/634AZyX/ID5yIG3RC+f9WlYgVWkz6CW7vUTNC
	KmzEL3ANpei7mM7wo6cK1gYBT7HVKm/njFoi2HXUqvKzysxTpKJBAavQNhHx5wVgIIaEDly77S8KU
	YtMM6cww42+Qc8JDXwHJAnc/VRDismcMhhYSyEubt0mAKcyW2UCWeChLNMgBmn2iVmAA8+MA9FGe0
	U0tQJ7qbK1XmrMNlaMa1QscDzpbvC0oon097GheoXiqrdJ5QMBzzXgrOF0pgLq2LtPNCAoB7zCRBb
	wat/AtqrAIc53LRN6OKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgSY-0000000DTMs-0nF5;
	Tue, 11 Aug 2026 06:59:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgSV-0000000DTML-15IZ
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 06:59:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-480033bdcf4so1531896f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 23:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786431573; x=1787036373; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7CGZZWuF5gk+XdnSsb1yoIVgT0uOaJBdpMM5wtHERfw=;
        b=a7OBF/rOVrMlPSDvJlZqZAbnG8SDoBgv1sc1Qjwk0HIn5aQwUaYe+feeYiuE9orOJT
         5Z6RXUprtqGFg0aPJ/uzKGQeOkDdNvyY5iPhoNFEw983iSZax/J+V2Q8xDnuvRZznLSy
         aDZofVRj33BRoVB/Zaa0HOsM57FB6Ifst2kGHPghKrgrNrTz4VG+wZ1t/sbSRMoopQDk
         RncHaJeG7ryv2ufF1BKAYHa/RWu5NWSV9W+PWxsGTVFUn/D3I3FNrmxq6GDPdeqiqbuC
         g1tBY0zMLbs6Qo2F6vjQQU7kXk6TwsNXIIG9iGu6+3TSzU0/hSOU385HdEae9vbqlDz0
         Aenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786431573; x=1787036373;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CGZZWuF5gk+XdnSsb1yoIVgT0uOaJBdpMM5wtHERfw=;
        b=goXP5Bdj0nKKNv7C0i4ioLJ9jKpPrd6lVnLxGKaJ0uuaoKuFrHZl858m7YmNYAapgh
         hm5A57HLmQHbPCetvfaAGOj2drtFnWhwnNq8CA2qPwaoxI9MwYCYvMDZUVPPyH0dmg2m
         Zic54SygAzLLvjOrNBP1cfJMog0jD65dtA3rFTLFpVreI8JKApDmdP24vaO83whJ9x48
         IS6tMnX6YmQL8xhv/OJmKjd3HH3z03Pb/nO1p7UN+ifG3q+0qcGrcGpCefz2R4CRxS8v
         VN35z5jwBTobJNxbSsCovn0XxObc7ek6QptcKNZg4LfOk23XoqpFSyz4sW84lvCrVbbA
         Buvw==
X-Forwarded-Encrypted: i=1; AHgh+RqViXffwLjyQ3LSxGV28JqlKxMhI+KVAi5FDVN/u4kj/bMvnP9XhVWELQELGzE7p14tKYYelr1unsTwZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/oOJCwrxvjDa440BD31JBBbHj1sNudnjZJ+qYLUYPeGWU/C8M
	DX6jheYgXyYjKUmqG9dXkyWehExnpogo9fR1QgJ25mX4KvljLaXyqnvh
X-Gm-Gg: AR+sD11iJN+FAf4Fo90yHTfFmDS/IKvztO1XaTwkXUAV26hsD+rN47obkoBkTXleSP6
	JAPva0BlesIhE4BfOA0kGTMwvLRPGI0v8aFhD6oL7N3zHm2ef6bpzYv/zIrcpJSKr2ZEOA8uYtY
	EJu96F2x9lEEGB9f3kvMv3TPGEc1oc8wl7szCKyn+p/xNSOkMuMSL6OU2ey1pcGhcI9zOc2b2bL
	SR5PCP/M21/B+Z1E6w5x1ePShxzddIn4vHi7KY8oCm9SQwv3KKsHqS2SgTPHlgpZ0hzB67rIvm3
	9BbtD5ow+7JELD18EH1e2MM4fJ3wvzXT3EKM+/gMj8JcScDlbnaGiF15Obj3sk5tcqSblM3SzNT
	/8kqQ0wELnJRQ47s2R9uv4nbcyjcE8H8ArEIUfijHtudywNy2RUCRgZVCsA0QNnufSqLzVHTsXB
	ZkYTHvprnhzvsOai0g5IdjdnbMZRWwrHiiG64LpGAbU30J1ZBLpjLkcPDo7zTA0EAjiBUWgSTZo
	pO9Zi1Y6h7HvuZtKVhrzurXC9rQuTO/j7WDWexuD4vY1WTqcxDrBfCH4WKI7kXInQdznpxxJvvO
	dmODB2C6yA3Ofe+agO0ofmAy3Nyx7iCkDJ+ZD+9As86inwC/RMYCNjtFtykRLsBPXP0wTJs=
X-Received: by 2002:a05:6000:25e8:b0:47f:91e3:3cbf with SMTP id ffacd0b85a97d-4814adb1f0dmr1920243f8f.19.1786431572901;
        Mon, 10 Aug 2026 23:59:32 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a133-e401-bc8e-d36c-2d08-c5e0.310.pool.telefonica.de. [2a02:3100:a133:e401:bc8e:d36c:2d08:c5e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a72cdb8sm1789573f8f.35.2026.08.10.23.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:59:32 -0700 (PDT)
Date: Tue, 11 Aug 2026 08:59:30 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: vector: preserve state when scheduling at nonzero
 depth
Message-ID: <anrGG3id1adQLGED@gmail.com>
References: <20260806193241.10552-1-kmehltretter@gmail.com>
 <anqv2bWIvgIyhGxe@Tao-Chiu's-Mac>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <anqv2bWIvgIyhGxe@Tao-Chiu's-Mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_235935_347997_FCA29B57 
X-CRM114-Status: GOOD (  15.86  )
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

On Tue, Aug 11, 2026 at 01:15:05PM +0100, Andy Chiu wrote:
> 
> Since the problem only appears in the v4 series of the kvm fix,
> triggering this bug on the current upstream may indicate that there are
> some unclosed path that leads to the error. So it would be valuable if
> you could provide the exact reproducer and base for us to investagate.

Hi Andy,

I first saw the warning during a syzkaller run while testing my KCOV
series [1]. The exact test branch is:

  https://github.com/kmehltretter82/linux/tree/kcov-pause-v2

The following branch is based on clean v7.2-rc6. It has the stress source,
syzkaller config/log, and warning report:

  https://github.com/kmehltretter82/linux/tree/riscv-vector-warning-repro

The warning also happens on clean v7.2-rc6, so KCOV is not needed. I don't
know if KCOV changes how often it happens.

The syzkaller job had reproduce=false, so it did not save a minimized
program or C reproducer. It got the warning after about 110k executions
(116236 at the end of that cycle), with QEMU 2 CPUs and procs=4.

On clean v7.2-rc6 (b9b3e33b70b7), the standalone stress test got 18
warnings with -smp 1 -icount shift=7. At normal TCG timing it got none. I
did not see data corruption; all byte tests completed without mismatches.

Your v5 patch 1 looks better for the switch-out change. Please consider my
posted patch withdrawn. I am testing v5 with the same stress and syzkaller
setups now.

I also tried this possible switch-in guard. It got zero warnings in two
stress runs, I am still testing it:

@@ -392,6 +392,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
			next->thread.riscv_v_flags &= ~RISCV_PREEMPT_V_IN_SCHEDULE;
			riscv_v_enable();
		} else {
+			riscv_v_disable();
			riscv_preempt_v_set_restore(next);
		}
	} else {


[1] The KCOV pause series is five patches on v7.2-rc5:
    https://lore.kernel.org/r/20260724192122.73080-1-kmehltretter@gmail.com/

Thanks,
Karl

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
